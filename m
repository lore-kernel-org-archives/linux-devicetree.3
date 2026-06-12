Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB06135E1A1
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255091; cv=none; b=mDk1XOhZnPjKuFNEhkK49u+g/iF7P+Gn4gzbZ0Y69UJ6eeVONFzXGzpcba9ASeDnUvmMGSDl9fGJg2R15d147nw78d6RUTe/q24s8jUBppb+JUO4f18ylMqk4I1MqMhzyRbpa6ssq2FLhNOSVs/cCGtk27fjgU2fX6amfz/j9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255091; c=relaxed/simple;
	bh=obLsNbstVPAwrtem9SkKGZENOSohwZyhu6y8SUHNiTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYLn3AMR9uVDvispb0oONBR+KudvsC1FbW66drWK/YXzr9BK3EWm7JyVb4Sub7VVzZvRuHoV2JJRXI7RWFRvsg7mgbmBXgxfGr96GnF5iRn8vLU54+vLRHQW4vFcegfjqJLbRNWV9dZ4hZakWEH9MEUY4yOjLA5v8p1h2gTVxtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpIbUnOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObhHD9aR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpIbUnOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObhHD9aR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C7mD2506455
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5
	GRIPrZQM=; b=WpIbUnOfeDeeqW3Geih9HJ9pQmNp1TjaLLoQsCLmVRDcKcwAeIK
	Sp7lxq8il+vBlTPbPLzp75Cy6PAGqccs3l2IRPFm+6fX41SmlJPXcuMvzFwfqcwp
	zuG8OaX8AcIPs7ON8eWVVqvHT+ysMm+IZeyej6PQXU2zcexL+Tibz2T9wQLqn5oC
	mno98Gfu+Qa0vCXQOtvrg3JGvsBn2vDpaJszTXe0JZLq4hmrnFLo84qB5bLMV9iD
	djy1pd4a7rGXDy8j44Dn9uKiuK2Tw7Nr9Rz5+0R8xkwMoEw1BKnMOgcd9fxnIspb
	VbGS/fYXBEzY7nbw+dEZ1dZQMblNBaWuF/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjtck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:04:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51775f7b2afso32772651cf.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781255088; x=1781859888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5GRIPrZQM=;
        b=ObhHD9aRWx8TwIrdXTMoWH0e0/Ap2u7zljNHl7+/xxWmOlu9qdaSk3VmpzB2cwj49U
         8T+9i1U1uF/kIjJS5w63T2Ek3o88nW6ZO0ptIKd4Kh/kspiFc4BtSJod0i7jTAsnybtR
         +GV8bYqf75MRvWfowFVnEFoIbO9P2izHOk8Q3Eoi94eVEx0J5pwxn69BU0jbUCvzWA5d
         4ENVhOMBLqSrLLGIEvEPQlAb9iQqCtT2wdLsMgkaqnqSTC38MP0DT9T9nqYh0DOjAMo9
         NlpLcKSpnNmyG/Ii69ErkVFSZ8/ulK0MKXW5hc3m1iiPVHnp8a4dJOvvsP01vhHDVN/y
         nWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255088; x=1781859888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5GRIPrZQM=;
        b=E/sekY2n6dtoIFpxs+mt3xuYeD1P+vW9IWReYcztN/yMosVZYej27MhsqAP+HfDo/c
         nOMT/ji0ZHSDAbPTo48PLr7Ir66HsGep2MISE6HqoY6weaJ9Lp7J0F/dTUXNDig7sJGH
         qSo99jL0HCUaSCjgjDFfecJ3/w8KwGEGdkDSRspcyhLpWV9AVmOjlJZ/ZidoAlYr3y5a
         x/VtCmi0k8CSUosV1q0ifLStSl7882xhryVYm7HYbLEWcp4og2V/+ZKLsmZDTdCV1KxT
         X3vWnHJT5y4t4B5YWm0HWBgKA9T3of8JWajJKt2XgZpOrQ6LdRZG8pwlOx7O+AxEycnI
         xH7g==
X-Forwarded-Encrypted: i=1; AFNElJ+v7TerOwTqTEAgZUkTpLxuNJg9h0/PeT18hvCU94T2L6Kj8MW+6yLmk6YKrC62BjAfj2MEwypKlHZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WSgFbqR7HtH+T3Ck2Mt2mrXMcRahAcVWNY5PZp8gZA/jJRGx
	dDbBnoikJZlzKiqXjTUSqvRZ+YtMkFgKUcBQEDGl16ys8ze+S+2bS4Ex9e5pXGnkBv2hNW747fS
	Z9NurzA5R19br6NQQQ8+niAQRoEp5wZOEa0wOqBTNNqeNDCnAsH79uRbuwwg8+c4p
X-Gm-Gg: Acq92OET8pjfnvVy31LcmfSwgFZ7mdRlrYRIudddPasn3ctlFudBuAV25mDNeH+Dlcv
	bs3q17S2CjUk5De5x18WnKsY80YLNRf5O/E0q1qpJPFz3fUzKH2Y9S3q/lEarilYaXpxc3K5Jay
	tLYf7gV/EPtpxEGAF03Cnhz0NUonJhK4thrFRDBJCDjlUmH7ao8bNwBFtRj5EaANgPkEPjFE/zw
	SqOhJG7MXKjCp89CpL8h9dLpsnc/SyIx290/lWR0y1pODj71Pk0gJY00RLvR37K0yAwaXG97FpW
	4PpW1fLKfcjX6Vgb5rxRGBZgaIuILKV7BI90SiXUbTnz0wfYrMZsKAw258JWCHlaQ6txFJJp/le
	DiQUh+gUgeUfPkNRo41E1uK3BuBCpDQJF3W2ZdA==
X-Received: by 2002:a05:622a:244f:b0:517:64b2:2388 with SMTP id d75a77b69052e-517fbcc58bcmr26573411cf.15.1781255087100;
        Fri, 12 Jun 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:517:64b2:2388 with SMTP id d75a77b69052e-517fbcc58bcmr26572851cf.15.1781255086480;
        Fri, 12 Jun 2026 02:04:46 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea7c8f49sm56318085e9.6.2026.06.12.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:04:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Fri, 12 Jun 2026 11:04:27 +0200
Message-ID: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=obLsNbstVPAwrtem9SkKGZENOSohwZyhu6y8SUHNiTY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqK8uab2y+ctPk+un5YikehDDsB11CXdCu9AHV7
 ttFg7khI7uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaivLmgAKCRDBN2bmhouD
 1wPID/4pss+s8qe5a0hilYLeffX2/W9AwAtqtxnHiDHapqYw/aJ/fGNrtbZX7ooBFT6X75j8XT6
 2+qP85fAlmJXT2XGPP13H2uGBGb3uLMCJwJXrV2Aik6J1ZitY3H+KF8N5t2xWTYNnjUxjJYKw9R
 o2N5h4nqpXyiafdMvFv+4kXwIuERwGmktWPImMj3yCkskTTWuSog3PMPy3p1n+zygAQe60Yk0q6
 a8H5mxSjRI7yyeg15Jh9gLjbnYo3plwiPObhHoqtZW32u4FATaATRMFojyVLbGtA90oTdftzg3q
 Ga3vtl39F1uVnMP76gOAsgS6AO21qDy54UOa3p+OQU7N8opp193eifToHcizecmDGTavTxR3CPK
 fVXHbSl92OS61os9+wSyldx9S9CNBeBT9wtCtuUDshpW8qMPC7WXPnUoY4+/ZpYu4f3syAWHQNB
 0dIW/Ly/0V4WO079GR5fUuAxzjMGI6BN6UE5IGLA8ZqFpRt3PFfdHKAr++euFGBQzYytIjUMu80
 bVYlspZJXECHtPmGvmcBrqg5fmY/jdElQn7hnRew6AQ+aAa+PuMpHynQvLVAKDIluhl0KhywXRf
 X2q+tivndzZfNgin/gfbtRcBKF8mqA50hiHRMrT2wa17Wj8q4XtgwU+ptqAj6PGxV6uIpncw2sy 1ox63wRvY6pAkMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3AAV0LUwGi5bBG2ilTUDty03wLEM_Rbq
X-Proofpoint-ORIG-GUID: 3AAV0LUwGi5bBG2ilTUDty03wLEM_Rbq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4MSBTYWx0ZWRfXwH/5thMf2hW5
 cgE9cLMEtjQnCjCQ1UUssya1oj5kBvl/QzyR0Kwl6r+LHaUio0DjlF5Xc5X24g/7ICd2coBx9Jh
 Htw4s42Voj/E5q6sDyfGbzHJmF/L7co=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bcbb0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Bpo9OX9RG45pMRazLfIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4MSBTYWx0ZWRfX3uPR2Ox9gDDy
 Dn2/gSg4TIoRWQsM50twy1xahzllmQF18FXOFZzGK3rLiJmUgv6Y30j7jNCXTAULnuyUg0VllZi
 Xu5JL6VkVEXid9fBj6GZS1bxwnRZ/V+PYc4CvNQy1yzk3qKWjfp4podDcAOuNRg+meeqznRjlLG
 /yMC53PHacVy8uWJXpne55jpsMqA1jN5j4774FNimGre5cx4c42EKULghKFFquJ3TL2LHgFqyAA
 fEeKDV+6T/6HJ5q318WJ5qSgcH4rl5As1CxaM+BOYDw2OUeCZwRZuMua6eS8gz2DwNeZ3vGwxmt
 NbgrHQ707rL1TsYW/Q4zZVc4lVUdjPil3YgnRPvDM5z82Y0RVtJfNyrKZRjvGUEU7biqr4SkdWD
 RJA+TJAnqV37ZbaQae0K9qSluEsykVBYw+timgpgkqZV2T+Br44qAd8Ufleqj12EZrBBZ3rHn4R
 l/pFKaLUJoxXcjb7i2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120081

Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
same as PMK8550, thus compatible with it.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Drop stale pmk7750 from main enum lisrt (the big one) - leftover of
   previous version

Changes in v2:
1. Add fallback compatible.
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 151 +++++++++---------
 1 file changed, 78 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..5ecf5da3d100 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -15,79 +15,84 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,pm2250-gpio
-          - qcom,pm660-gpio
-          - qcom,pm660l-gpio
-          - qcom,pm6125-gpio
-          - qcom,pm6150-gpio
-          - qcom,pm6150l-gpio
-          - qcom,pm6350-gpio
-          - qcom,pm6450-gpio
-          - qcom,pm7250b-gpio
-          - qcom,pm7325-gpio
-          - qcom,pm7550-gpio
-          - qcom,pm7550ba-gpio
-          - qcom,pm8005-gpio
-          - qcom,pm8018-gpio
-          - qcom,pm8019-gpio
-          - qcom,pm8038-gpio
-          - qcom,pm8058-gpio
-          - qcom,pm8150-gpio
-          - qcom,pm8150b-gpio
-          - qcom,pm8150l-gpio
-          - qcom,pm8226-gpio
-          - qcom,pm8350-gpio
-          - qcom,pm8350b-gpio
-          - qcom,pm8350c-gpio
-          - qcom,pm8450-gpio
-          - qcom,pm8550-gpio
-          - qcom,pm8550b-gpio
-          - qcom,pm8550ve-gpio
-          - qcom,pm8550vs-gpio
-          - qcom,pm8916-gpio
-          - qcom,pm8917-gpio
-          - qcom,pm8921-gpio
-          - qcom,pm8937-gpio
-          - qcom,pm8941-gpio
-          - qcom,pm8950-gpio
-          - qcom,pm8953-gpio
-          - qcom,pm8994-gpio
-          - qcom,pm8998-gpio
-          - qcom,pma8084-gpio
-          - qcom,pmc8180-gpio
-          - qcom,pmc8180c-gpio
-          - qcom,pmc8380-gpio
-          - qcom,pmcx0102-gpio
-          - qcom,pmd8028-gpio
-          - qcom,pmh0101-gpio
-          - qcom,pmh0104-gpio
-          - qcom,pmh0110-gpio
-          - qcom,pmi632-gpio
-          - qcom,pmi8950-gpio
-          - qcom,pmi8994-gpio
-          - qcom,pmi8998-gpio
-          - qcom,pmih0108-gpio
-          - qcom,pmiv0104-gpio
-          - qcom,pmk8350-gpio
-          - qcom,pmk8550-gpio
-          - qcom,pmk8850-gpio
-          - qcom,pmm8155au-gpio
-          - qcom,pmm8654au-gpio
-          - qcom,pmp8074-gpio
-          - qcom,pmr735a-gpio
-          - qcom,pmr735b-gpio
-          - qcom,pmr735d-gpio
-          - qcom,pms405-gpio
-          - qcom,pmx55-gpio
-          - qcom,pmx65-gpio
-          - qcom,pmx75-gpio
-          - qcom,pmxr2230-gpio
-
-      - enum:
-          - qcom,spmi-gpio
-          - qcom,ssbi-gpio
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm2250-gpio
+              - qcom,pm660-gpio
+              - qcom,pm660l-gpio
+              - qcom,pm6125-gpio
+              - qcom,pm6150-gpio
+              - qcom,pm6150l-gpio
+              - qcom,pm6350-gpio
+              - qcom,pm6450-gpio
+              - qcom,pm7250b-gpio
+              - qcom,pm7325-gpio
+              - qcom,pm7550-gpio
+              - qcom,pm7550ba-gpio
+              - qcom,pm8005-gpio
+              - qcom,pm8018-gpio
+              - qcom,pm8019-gpio
+              - qcom,pm8038-gpio
+              - qcom,pm8058-gpio
+              - qcom,pm8150-gpio
+              - qcom,pm8150b-gpio
+              - qcom,pm8150l-gpio
+              - qcom,pm8226-gpio
+              - qcom,pm8350-gpio
+              - qcom,pm8350b-gpio
+              - qcom,pm8350c-gpio
+              - qcom,pm8450-gpio
+              - qcom,pm8550-gpio
+              - qcom,pm8550b-gpio
+              - qcom,pm8550ve-gpio
+              - qcom,pm8550vs-gpio
+              - qcom,pm8916-gpio
+              - qcom,pm8917-gpio
+              - qcom,pm8921-gpio
+              - qcom,pm8937-gpio
+              - qcom,pm8941-gpio
+              - qcom,pm8950-gpio
+              - qcom,pm8953-gpio
+              - qcom,pm8994-gpio
+              - qcom,pm8998-gpio
+              - qcom,pma8084-gpio
+              - qcom,pmc8180-gpio
+              - qcom,pmc8180c-gpio
+              - qcom,pmc8380-gpio
+              - qcom,pmcx0102-gpio
+              - qcom,pmd8028-gpio
+              - qcom,pmh0101-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmh0110-gpio
+              - qcom,pmi632-gpio
+              - qcom,pmi8950-gpio
+              - qcom,pmi8994-gpio
+              - qcom,pmi8998-gpio
+              - qcom,pmih0108-gpio
+              - qcom,pmiv0104-gpio
+              - qcom,pmk8350-gpio
+              - qcom,pmk8550-gpio
+              - qcom,pmk8850-gpio
+              - qcom,pmm8155au-gpio
+              - qcom,pmm8654au-gpio
+              - qcom,pmp8074-gpio
+              - qcom,pmr735a-gpio
+              - qcom,pmr735b-gpio
+              - qcom,pmr735d-gpio
+              - qcom,pms405-gpio
+              - qcom,pmx55-gpio
+              - qcom,pmx65-gpio
+              - qcom,pmx75-gpio
+              - qcom,pmxr2230-gpio
+          - enum:
+              - qcom,spmi-gpio
+              - qcom,ssbi-gpio
+      - items:
+          - enum:
+              - qcom,pmk7750-gpio
+          - const: qcom,pmk8550-gpio
+          - const: qcom,spmi-gpio
 
   reg:
     maxItems: 1
-- 
2.53.0

