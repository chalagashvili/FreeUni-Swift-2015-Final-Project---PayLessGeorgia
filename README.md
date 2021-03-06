# PayLessGeorgia

PayLessGeorgia - წარმოადგენს iOS-სთვის განკუთვნილ აპლიკაციას. საქართველოში მოგზაური ტურისტები ხშირად ხელოვნურად 'გაბერილი' ფასების მხვერპლი ხდებიან, ჩვენი აპლიკაციის მეშვეობით კი
ეს პრობლემა გადაიჭრება და ტურისტებს შეეძლებათ საშუალო ფასში იყიდონ ყოველდღიური მოხმარების ნივთები და საკვები/სამომხმარებლო პროდუქტი. ჩვენი აპლიკაციის მთავარი იდეა არის ის, რომ
ტურისტებს ექნებათ საშუალება იხილონ ამა თუ იმ პროდუქტის საშუალო ღირებულება, და არ გადაიხადონ მეტი.
აპლიკაციის ჩართვისას გამოჩნდება Starting UIView, რომელზეც ჩვენი app-ის ლოგო იქნება გამოსახული და ამასთანავე რამდენიმე Language Button იდება ამ View-ზე. 
მომხმარებელს შეეძლება რამდენიმე ენიდან სასურველის
არჩევა. Demo-ში მხოლოდ ინგლისური ვერსია იქნება ხელმისწავდომი, დანარჩენი ენების Button-ებს კი სილამაზის გულისთვის და მომავალი განვითარების პერსპექტივის გამო დავდებთ. ენის არჩევის
შემდეგ, მომხმარებელი Segue-თი გადავა მთავარ საკვანძო Search UIView-ზე, სადაც თავში ეგდება Search ფორმა. 
მომხმარებელს შეეძლება ჩაწეროს სასურველი პროდუქტის დასახელება და ჩვენი ძების ალგორითმი
მოძებნის ყველა მაქსიმალურად მიახლოვებულ პროდუქტს Search Query-სთან. 
ანუ, Search ის Firing-ის შემდეგე, user-ი Segue-თი გადავა ახალ Group UITableView-ზე, რომელზედაც ყველა ნაპოვნი პროდუქტი ამოვარდება.
მაგალითად User-მა დასერჩა "Bread". ქართული რეალობიდან გამომდინარე, ჩვენი პროგრამა ჩამოუწერს Group UITableView-ზე შემდეგ result-ს: "Toni's Bread", "Stone Bread (ქვის პურის პონტში ;დ)",
"Mother Bread(დედას პური ;დ)" და ა.შ. ამ ახალი Group UITableView-ს თითოეული Cell იქნება შემდეგი რამ: პროდუქტის სურათი, პროდუქტის სახელი,
 კომპანიის სახელი რომელმაც ეს პროდუქტი შექმნა(თუკი ასეთი არსებობს),
ფასი ლარებში და ამასთანავე იქნება Check Box, ანუ ჩამოსაშლელი Button, რომელშიც შეეძლებათ თავიანთი სასურველი Currency-ში გაიგონ პროდუქტის ღირებულება, ლარის ეკვივალენტში.
 ასევე იქნება კიდევ 1 Button სახელად
"Google It", ანუ, თუკი მომხმარებელს სურს, რომ მეტი ინფორმაცია შეიტყოს ამ პროდუქტზე,
 მარტივად შეეძლებათ პირდაპირ "დაგუგლვა" ჩვენი ღილაკის გამოყენებით, ანუ Safari-ს გაუხსნის პირდაპირ და დაგუგლავს.
 ამ Group UITableView-ს
ასევე ექნება Sort ღილაკი, რომლზე დაჭერის შემთხვევაშიც ფასები დასორტირდება. პროდუქტის ფასები By Default არის ლარი/დოლარი, ანუ ლარში და დეფოლტად დოლარში უჩვენებს, 
თუკი მომხმარებელს ეზარება ყოველწამს დოლარის მაგალითად
იენზე გადაყვანა, შეუძლიათ მეორე TAB-ზე გადასვლით მარტივად შეცვალონ Default Currency. 
მომხმარებლებს ასევე საშუალებას ვაძლევთ თავიანთი პროდუქტი დაამატონ, ამისთვის კიდევ 1 TAB იქნება გამოყოფილი.
ამ ახალი TAB-ის UIView-ზე იქნება შესაყვანი პროდუქტის დასახელება, სურათი იქნება ასატვირთი და პროდუქტის საშუალო ფასი, 
ასევე კომპანიის დასახელება ვინც ამზადებს ამ პროდუქტს(თუკი ასეთი არსებობს).
ეს ახალი პროდუქტი შემოწმდება ადმინისტრატორის მიერ და დადებითი შეფასების შემთხვევაში Approve მიეცემა. Group UITableView-ზე სადაც Cell-ებად არის წარმოდგენილი პროდუქტები, 
სურათზე დაკლიკვისას Segueti- ახალ UIScrollView-ზე
გადავალთ სადაც ImageView იქნება. ანუ იმ სურათის გადიდებული ვარიანტი,სადაც მოხმარებელს Zoom-ის შესაძლებლობა ექნება, რათა გამყიდველს მიახვედროს,
 რომ აი მაგ კონკრეტული პროდუქტის ყიდვა უნდა.
რაც შეეხება პროდუქტებზე ფასების ცვლილებას, საქსტატიდან ყოველთვე ავიღებთხოლმე საყოფაცხოვრებო პროდუქტების მაჩვენებელს, და იმის მიხედვით ყველა პროდუქტის ფასს დავა-Update-ბთ.
