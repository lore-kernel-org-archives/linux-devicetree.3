Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0341389E1F
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642335; cv=none; b=q63TMD7GP0GErogSn3sRa1RF+6cJ3p73sgdSe9kVjCClUmsb8ngioSgIdzLDzG/HG1/4xmfYix746xMb4iRp+hITO3Rrpw+Ofs3A4/65jGhBL6OLRYtwqwCtBXqtrS8KS+rZfg+B2bZZM4ouk2qH1qHoaI7mRG9M9LT3EhFRifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642335; c=relaxed/simple;
	bh=JiULUK1wE9JgBG3dpXtkC+G/A2g2mWmaRHx+Bmzu2Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UJJeDp95w5rxjrzCigtG61ilGF6H6A8g9GVAx8MO7Gm5SCGWJwSVNa8zObD0hS4r0b466HQC3o/uWfdhR+tN77nRVqfwf79tIzTN/KX5UyqCKkkcXlejDrO5uh2vdApFXeekl7+PN2pmbumwJyGOaHyOeSfiFCS+M308wEdybKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov9dp7im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kx9fa08C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ov9dp7im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kx9fa08C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6389IjAo2412801
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bILIejA7nMaOjRX+QRMB0T9aXc7K+yJAuiPS9n30pRY=; b=Ov9dp7imMQfBrslR
	y1mRI4yt9cOoM62yTI7EqbE+At0l0gEFgU2wlN8VS7HImnGfjRROmApGqdSAZ5KA
	3A9p9DVi1sla5G+vGWjliv10h/vrGAP3nQU99gyhCkQ0FmfGfzZ9wNAfh46phObR
	G6vqC3qhFV0vfE5v7blJn0Or5t3knLdrYtJ7li0k/hCvNNYq+d+RXmHMqVZ9cxu0
	uUypvS4lBPV+AUs6/jmSszrFcz1WvIV8cplAV0jzTB2DF5uaAYo0N1qY0CspE669
	1cmlC8XRHdnEVyMNYcUfrNhT2T7jMSKdY+uGCBVfVTLOZyB9at24r0+JKuT+dYgB
	bnjxZQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vb6dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:58:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso4327874a91.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642325; x=1776247125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bILIejA7nMaOjRX+QRMB0T9aXc7K+yJAuiPS9n30pRY=;
        b=Kx9fa08CXjh7eiT7QQUjUEn/pg0b8xV9OHtZK0wZbBJnZvahzcF1s++V7R8PoJIQiQ
         8BsuUK4RRhRUU+4Uydqxdfa1zx2nuFa09I9FZr5nGiOSYivC652tn14HX6q0GIILXaoD
         duIYNrwY2KmSPwIcFaWxYydrTyGTU37bBNNfUxjUhNd7r73i9mwTIQhYW3Z6mwvI0UWN
         4LWWUfgUT/RofD+QXRXmU4eyYYBxkqw+1mB3qFdGpRgVIuG1tXgIE16eQbAiiXfzSYtF
         G51sBaCyymDadT5LGZgrpR12QKOzx2l+8ftUBUGK4rDtH1+Zu77zuLXFZrQrbuRcUDHt
         yc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642325; x=1776247125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bILIejA7nMaOjRX+QRMB0T9aXc7K+yJAuiPS9n30pRY=;
        b=fwatsCqUBL6IOwVGenv3ELl7oQkRczGr9IH1VivsqL+rBZl/euTdXL7q21CqDoAEtX
         6//c5NKZ3Pk9NIzu+5gE4M0DPPOgj8mWvs44zrzeiMMKPLQVGgleHsnboTeM++fQ8EEx
         oNkPMAkhtjKIOfFeAmgKlHNtowMDx76zP6NyRe6fggwznlaK28gtrQnCJIL87goTUs/j
         nHVTCuU2457/4UjpqOh9rc8Le/ok513hKbjsbnk/68+k3DzHFUQ789dQxicBni7ymbNB
         mTWxAmrcH4ylTV/8ixq4VKsevfkwSp31aEB0+kaTNIZgIi1DvapxYVfVMC9lvGkVm2Dc
         23gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQhvpW6Sgb9+2Bcncv2kpvJUFl5fENLedlgxsm0JT9VaNnuSJP4JztKPZprqx82TWhQJj2pVplJsRi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzy5duK4Y0arvoEQ/0y4Tlsj/h6VZoczYWpoV+B/BbBApJ2Ggd
	DO70OOq/1kcd4MFdQQUYhQkzHMNt8k0OnTzvJjTBWay4Yogl6iAmy8ixZybtcs/oJg7uEgg9x5F
	KAGY1e6FgFGLZS0rSlQJ3ATlFACS8HwFYBxd2QDog4LuuvBptxABWw2Dx1O3qsNiLS9Xfn5UR
X-Gm-Gg: AeBDievceaWpkQRZo4qI34F0t70TpX8Whhh4pUSCjk4vqW5qJWno9KNFyFXlmEQsvEd
	3RBXUOuqprecsB6B1M/qRxFXmmIxB+uG0YqK/5F/GTgCngKghCxHLmOmWZJzCsgjV08lQQns4VT
	Ea9kskxOWLcewyKjHgFtfL4mUDsdw1z6FZqay3ZwtyQMjdc4QKARcLhIBn/vkfeDZR7KxmzGWQn
	p5AI8iC/mk8XX0sx25kKAfMQKFj0zFRKTb2D5F3LjHo161iwmdG9sZGfUuMGllVC7h5WlxQ/uKi
	9bY+fbrLKv2ilWsDbsqZks14JkjcHphY+mK51Kb3dsNM0/+nJvBIZ/yQZ4MDsVCYo27Ih1TzE//
	yOXYu1f8pwOPcrHs9b4URGwcMnyCKZvqmpQrBoDRpZpmQtgrJytkAd7+V/KPlkeJa1DiU9yC349
	WCFYRxIUwWJyjkSCMCVkhrjcfVyOAvS+9TfIVgQWRVnRIsZMPGoMQlp2pM
X-Received: by 2002:a17:90b:53cb:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-35de697374dmr20258809a91.29.1775642324999;
        Wed, 08 Apr 2026 02:58:44 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-35de697374dmr20258781a91.29.1775642324545;
        Wed, 08 Apr 2026 02:58:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm25445663a91.8.2026.04.08.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:58:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 15:28:34 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650
 family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-ipq9650_soc_ids-v1-1-e76faac33f77@oss.qualcomm.com>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
In-Reply-To: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642317; l=841;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JiULUK1wE9JgBG3dpXtkC+G/A2g2mWmaRHx+Bmzu2Ao=;
 b=LjjDRARffi+8GTmtluSjtghvAkW+4kSorwYUwznMbYYUEhBil5WbUR/CsKrGeSZHW6GbWDzYm
 fzlN3khu7kyAO7IshNF9z16sqS1ZNVnhBo0Ak4davg7D7226w9VUNFt
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfXwgTV4YwjpT16
 6jBhhAJjPWPdh9n2NQTEbLxl4FeP/vJujrvw64EubXsnVkyFHkgiWZStOvG82H86gx2A2u7Tn+f
 RpHZerhAYoSXUhLnM3FLUG6T3S4Z2maxLCiASE0cdcViuQ5ieSEHwdA84b5nBkpS6QVY48ZLXVk
 jihPsL5o0ptilS64uvuik9wGgHFd6jhpbuALyVKNr9bU4TIKd27ObFnHlqhWSp3qi0G4oVDyq//
 VLWucakVIwc+yWZ5kVrVuclUiGl1fwNWWAzSmtof4YLfuzEvchtPWPjZ7lLHgT6VENHjKzXohOH
 DFWcPLN7PoERGLbuuLZJCmXJ/tWHPJ7Ic2mPrvyFtipo88vlgyLXXTKIrIBr5dzs/i2maJ4SmQ/
 aP3d23l2OFLcW238I1y5TQLELbEbexeLYvDpETl8yCUhr6LVwLvWUl9T3vLzakKboqDvUtjjRYs
 EsioQ/QJM+eA2Otu4jw==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d626d6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CTjr2INeI02uuWMKJSAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: aVgKviDXdmp2i5000Kjn9ERx97z7VE1V
X-Proofpoint-GUID: aVgKviDXdmp2i5000Kjn9ERx97z7VE1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080090

Add SoC IDs for Qualcomm's IPQ9650 family.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..585017b98ee5 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -304,6 +304,12 @@
 #define QCOM_ID_QCF2200			767
 #define QCOM_ID_QCF3200			768
 #define QCOM_ID_QCF3210			769
+#define QCOM_ID_IPQ9620			770
+#define QCOM_ID_IPQ9650			771
+#define QCOM_ID_IPQ9610			778
+#define QCOM_ID_IPQ9630			779
+#define QCOM_ID_IPQ9640			780
+#define QCOM_ID_IPQ9670			781
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1

