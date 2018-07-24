import("publish")

local description = [[
   <table style="width:100%"><tr>
    <td style="width: 100%">Esta aplicação apresenta o gradiente urbano das localidades amostradas por Lana et al. (2017).
   Em 2015, um conjunto de 40 localidades na região do Alto Juruá (Acre) foi caracterizado com base no inquérito realizado em 520 domicílios com o objetivo de avaliar o grau de contribuição do domicílio e da localidade para explicar a prevalência local da malária. Os resultados sugeriram um território complexo para o qual uma taxonomia mais complexa que a rural vs. urbana seria útil para classificar áreas com riscos diferentes para a malária. Adotando um modelo de representação da urbanização baseado na perspectiva de um gradiente, essas localidades foram classificadas em termos de paisagem de entorno (Sistema de Objetos) e seu conteúdo social (Sistema de Valores) (Dal'Asta et al., 2018). Além dos dados do inquérito domiciliar, foram utilizados dados de uso e cobertura da terra do TerraClass que permitiram posicionar cada localidade ao longo de um gradiente de intensidades medidas em relação à cidade de Mâncio Lima. Os resultados mostraram que as localidades, oficialmente classificadas como rurais, estão inseridas em contextos que não são essencialmente urbanos ou rurais, corroborando com o argumento de que a estreita relação entre as populações do campo e os centros urbanos é um fenômeno observável em toda a Amazônia.<p><p> <b>Referências:</b><br>Lana, R.M.; Riback, T. I. S.; Lima, T. F. M., da Silva-Nunes, M.; Cruz, O. G.; Oliveira, F. G. S.; Moresco, G. G.; Honório, N. A.; Codeço, C. T. Socioeconomic and demographic characterization of an endemic malaria region in Brazil by multiple correspondence analysis. Malar J. 2017;16:1. doi: 10.1186/s12936-016-1650-6.<p><p>
   Dal'Asta, A.P.; Lana, R.M.; Amaral, S.; Codeço, C.T.; Monteiro, A.M.V. The Urban Gradient in Malaria-Endemic Municipalities in Acre: Revisiting the Role of Locality. Int. J. Environ. Res. Public Health 2018, 15(6), 1254; doi:10.3390/ijerph15061254.</td>
    <tr>
<td style="width: 100%" align="left"><p><p> <b>Coordenação</b><br>Raquel Martins Lana (PROCC/FIOCRUZ) & Cláudia Torres Codeço (PROCC/FIOCRUZ)

<tr>
<table style="width:100%"><tr>
<td style="width: 15%" align="left"> <p><p> <b>Realização</b><br> <img src="A_figTab2.png"/></td>
<td style="width: 85%" align="left"> <p><p> <b>Apoio</b><br> <img src="A_figTab3.png"/></td>
</tr></table>
   ]]

Application{
	project = "loc_acre1.tview",
	description = description,
	clean = true,
	output = "App_acre2_a",
	villages = View{
		download = true,
		description = "Localidades rurais e urbanas visitadas dos municípios de Mâncio Lima (ML) e Rodrigues Alves (RA).",
		select = {"nome", "tipo"},
		icon = {"a4_blu.png", "a3_ver.png"},
		label = {"ML", "RA"},
        report = function(cell)
			local mreport = Report{
				title = cell.nome,
                author = "Lana et. al (2017)"
              }

           if cell.dist == 0 then
				mreport:addText(" "..cell.nome.." é uma localidade urbana.")
           elseif cell.dist > 0 then
				mreport:addText(" A localidade "..cell.nome.." está a "..cell.dist.."km da cidade mais próxima.")

           end

            if cell.Acesso == 1 then
				mreport:addText(" O acesso é realizado por pequenas embarcações.")
			elseif cell.Acesso == 2 then
				mreport:addText(" A localidade é acessível por uma rede de estradas vicinais.")

           end

            if cell.PA == 1 then
				mreport:addText(" Faz parte do Projeto de Desenvolvimento Sustentável São Salvador - PDSSS")
			elseif cell.PA == 2 then
				mreport:addText(" Está inserida no Projeto de Assentamento Paraná dos Moura.")
			elseif cell.PA == 3 then
				mreport:addText(" Está inserida no Projeto de Assentamento Treze de Maio.")
			elseif cell.PA == 4 then
				mreport:addText(" Está inserida no Projeto de Assentamento Alberto Santiago.")

          end

          mreport:addImage(cell.nome..".JPG")

			 return mreport
		end
		}
}
