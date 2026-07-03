Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0992B33E374
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055057; cv=none; b=AkzomVClz/r4ltf64jjnk0sss4g0faEE+lUebla89zsQFvSmAGC5Rr9B0wpBjjQHT0Kqzzm1ZsgxGCkcnMUw9Y7rFz2SpacXyuuIgkuXoWPL/G1Vm6Z+L0iReCnlaLZtZVgCxQOVX2OuWS93VmArdKlouBQTmdFkm2rzI89enGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055057; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCadQiivnM2Z+DoQ5YS3Izwyeku9DRvQoaHYl1XEtjI/qWg+HtM2ZOpLdXpOg/EaBLp8srtL/QpkzYe/S02CZV7fk64Cx7Gh1S2pZ5ZlcPDOcDShX3w3/apm8y2U4CtVV4uBQkAYAw/C8oiVgnyxCa9irfHXjrtGwvMHlwD2qs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE8cVjv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9AER9Gu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RE8cVjv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9AER9Gu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342d5F2801088
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 05:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=RE8cVjv23JrCfpd7
	FIVRbDajUOZDh7MXaDvdG5eD04CcK4y+LGcZySUAp/E/ZW7gfhwM3m/Odk0Oq1MQ
	XNC3Sl2bjP9VdfpwDpUt4vHAu5R6uGixFq1aa1zx3O9T+Lxblp8Eu9cNWc+mBEb1
	zu5r2coNswYq5Uk7Z3fFLBE7vmZNCRAu58+Uq591oV0101lLHxZJgIlz27p8wirv
	Y/RdLrzmzPXkbhzclvxNJPFHgpBWaeVQxt9dmAzT1ox2mm08LUiV40kVwhwL4vrE
	wtZAyoCK3RvU07c0W/XFmyBGL9cV1DnLIAGrr5xnVXMRI1vCdWjmmFhLFfBXTtvw
	fM3+dA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey97ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:04:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso205397a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 22:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055040; x=1783659840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=U9AER9GurKy6kYCrz90axnzOPfFsn07w/KFN6QvU0nt3O94Zqg5Uw04kRcopH5lnVr
         aj4qVA1mv6BdOPISB6qjsX+Iw2DRWuAj2B1BDzFK7F0wxSvYjbldOTt82C47ilcuxzYd
         B677mgfmHAu0vWdrqoTGGV/ILQERJ6s7/WdL+mNuy4uEDa0rEpq82i5eE7A1hXLnpEkb
         C+vzVtQpaB+YrOySd0EGUQRZaYW0+5c0ZpkVsG03hiQ/Vw3I5Zbp9av+gtPTmZvXYCLR
         7rgJFyfsvBlllkfjfYP48i8VBcAdCg06WHWXKSLWZ0pfXdUMsEJ+MdAOzSTo4MKoA1Pw
         FXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055040; x=1783659840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=Zp8SL4dthamb/HedRo1Z/aVVPp9L/JKiilyIf14LLByqQRt0rT0vlYg8b4joHvkZk3
         HHHmBnxNLY/fEyq+G4bNaeT7FzvuxlXtQ6zl7Qk9m1hqMlt89AlIR+Dfy1w6+/w5tEum
         8uiW/O5RzLSvtX56v6P50bgenjOzvfPZxlttpektLIS6yQ4kuICtRsVR9PKeD/ThWMZU
         VC8Dat+PnDH+UkZMMb899OfKExyvY5zz5QPPVscRDGztT5wn05BhSVAytl7SIyCSIwZG
         wFBYmLXlNFDdpGRxlBbFIKYEBlPV+S1gURQ+8mnjzAxWKaSjiL8+KEKNam9VJaMxkPG9
         aM1Q==
X-Forwarded-Encrypted: i=1; AFNElJ93Qsr8AceXYuZ/PADVOBDBcE2WTGpZRk7//Qf8Y5K1XYAU3jW/pW/FUJ9aJ8/GNuNa4iNIr1lKMIjH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzudt8HWg+Gm20ZxaWnW22EhCqYz+ivNWD31E2pa3xU//DYjsL9
	nER/Eg3vdM1xbDq9jq0L0wf1h0ejuJOMRB6P7IsFScsbTnhdXTQ/ZiLPRlE1RethvUxXt76Wxaj
	t8urSmGLTTT+gMqe5M15zhSUgbuozm+uJkJ33XfdrEUAU30dskh9bHO+K7pBRWx7S
X-Gm-Gg: AfdE7ckOz5We0ly0KgHVLGgkgMIPlN7nbT4hJUn8H7TqJ53S9vMFS3SbU3fjS8ZuNSt
	Jfmks9AMV+NPuzxyn/zD87AJjfxBrzDV3vV8jONpwZ+3/lT0t3RMarVT/Aj+bKOOe52uNy1JCcn
	lB1ByaNxn2zoWkUGfjQCxyKpEcA/6F44AXAQRHgdaSW+RjzfeGgsU7RDt8lg81/hbvKuIhd+ANe
	JZ0bRci7xfz1P9V0XKILqMiycE8S8CI6lFJWyEk7q0/aS4+cfpv5N0fDgK60zhklup5BgMFS/Uo
	TlGefCeZbxEW791hRMUnhnFyFzz09oJy3HKADWeYRNy4tgx2vgDz+o1WZHPia4hqicZbb5odPIV
	sjDVI/tzK1nSzvBlDXL/aAUbOpRIY0m+vtp+tWIGrdjYq0bsITSLWRHorWI4U/0pfPLFpnWXNvu
	2Wc+bE4b5xkEhX5IsR1MUBFY6YiRZH6h2SOndKcRiH
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr9305624637.51.1783055039914;
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr9305587637.51.1783055039367;
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:47 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-apss-clk-v3-1-4785e89a9c58@oss.qualcomm.com>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
In-Reply-To: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXxsKCYJb9uBQX
 hqbISyKkH7NQPMHtsbAd5od0Yw9VkKCkXQrzsygv9asieg0psLLeYpTo8NBzeA45eXDccJDB6D8
 vYCNDBpY8N+5kGv2XlUFJ5qpUl2tZ6wp0eUCqqxTyCz89KKePS+FTCBEI8F1TLJHcLKG2DGjomE
 zUj661lN4EJqiN8b8VFgxwxe5U2xxisL/iaJDRdfTBeSge0z2JYWApsSjK7B/H38bibceM4Fr7y
 PAQifZ4Mege+wlMr/xoCsOrUD8n7nuBVgDpxuxcqp3TM8pGUkvreHaaStmN5Hj52LFxuRbAAHpI
 t3J6e6YH+m/5nFUZTU+B8S2+oYqDf9kPJ0T0zJPMQLhIRbW/4BUk4HsNRI81Ik6d6uL0/OP7c4J
 6s4p9LxkCXOEq+n5ewunvp9VgDHIiGGVYsJysQmOT6gvyZ6nIIShl6UH4ESo5oWDlqZCqRk5B99
 2WB7tCDQvfHZlsYID9Q==
X-Proofpoint-GUID: xn41rOqfmQUC31EehTB3pPBdMqqQibwW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXzM+brQcysEDf
 HhTGuJURfbW7dPT3FN7iU2UnAxiGjpC3l+q109hOEJv61B70lmhUKVCU/EFniq/pbB6V9LycWrl
 yGlgJZNSjZwmbfeZUzTfhQUXNJEkXvI=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4742c1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: xn41rOqfmQUC31EehTB3pPBdMqqQibwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1

