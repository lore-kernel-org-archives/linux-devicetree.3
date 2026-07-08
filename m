Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF6543E48E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513074; cv=none; b=PChldAP0OZ5+0mns0vRcT6nvF7x6EpfoejhTIFmChcrHPkJVSUskIm/96fDmyefzgYpl1e9Gt/OftJhJ2F9CU6wH2aJ3AQJrSfGpE6UWRJ3Ik7OIZcFtYwePSXJ7klQrmv3rDVKqUB4pExNCzwOGu/vPymYHWwGMCXoyEPRosDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513074; c=relaxed/simple;
	bh=j9LrC7SvwrGJ5R59Zyt5T1ZwERBRq1xpSs/MEllIWkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8bTly4pON7pAiLKz6tHwVZ2m9DEYABCBp3WFcOakrapzmXTNjKbQsgJB2qRGHicdBQeu+PRpzd9gGAmjeogDSVAkDikPXu5kOIKaQP73tU1bbJWDkJvkLWF2DTObMqqA2FX9PqUO7buZghVaRZn12KB6WXf3nnVRKchIRbzUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4I64sio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUK5wHUo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4I64sio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUK5wHUo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3VX52667575
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwHspNqOIQ2ut6o0aX2sCzUdxZPsOJPL71oa2C3iLow=; b=i4I64sioWZOCeMal
	et6+no9jQvaQcNXS9yQNIheX6TR9D6kGiwANF2fgbKmJstJdUA0Kne2f4t0wQ6Ig
	URL2uKbXlUgycjY6PwcLOSSNyq+inlHAYKoApcH9pnGTwZg/EfgtoBijWndfbdgJ
	CCrem6FbaSWWpQG/LNrpuFeYpbHd0HWNJe/2aR8RpkKrA4Nx67FJYlM5YG8GsvGz
	MJsjH0NKE5jw+KzmMYLz6YunCZYp9qIFflFhXRFE758U3digXyundAP7vnjIyLtr
	/u97UMDxBLL3AtGomRf9CrupJPg5hVotu0B9I9NLGOsmTUZXs0QwhhMPM4QFDM0o
	EZVy2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgu3cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:17:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484b9fb055so788464b3a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513071; x=1784117871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwHspNqOIQ2ut6o0aX2sCzUdxZPsOJPL71oa2C3iLow=;
        b=LUK5wHUoURI2zonkc67HtNXyGZClmw7N8WV4eRcQN480DvcQxSBBAhrqY5wuAvn/Ur
         vHPE2UswtEG/OOTSA/6RcPwL3e7x+b1xKpMokQamtbTOQFxTzLQEw3gFaAt9N3qenPlE
         z2aiL+J5AbMBgaQBiILmgNTDIVHAwz9kEpUUhma5YLsRBCct03OpiZE/PFSfEux75l+v
         Q7rddaovSlcEIr3urYAOpvsKvM+0EXph/YBrd7UIEt+MkskKV7Jn1a92Q3sPvwuDud6v
         uFWZplrvnCnK2ydXqBt1C5PzxyHarHrYki99ItFhh3Mtu4z3Rgu+lebJxMVpHM6sqs36
         57FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513071; x=1784117871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwHspNqOIQ2ut6o0aX2sCzUdxZPsOJPL71oa2C3iLow=;
        b=XWUv6u3bHtx428HL92Q1MNnsdn0DJgmFae+39nJ+fV9jMIOtj4UHQmx8ElfKRrDqBu
         ZJ8VX7aTkzQarIS5ntrnrtC3/69tnqZ6nv+/VoDFpzphRDVQo+xDgPDX8a+M+mVEbL5S
         Ku5YzV95zu0pjbjgyrdupHa2GCLuI3ruiUm9kifDNV5unNMooqVawhLptjDA1qmpkMWq
         4uY2WMFDaeBBL8pPuYkf570zX5Bv6/KpDmCN4A4DMRskXpBn9cdVCaHY9ZdRtcfxLHyl
         Sj5xHuSH9FBCh1AojLsWUrHgd5DZsPGUfgYYvEpJIr44W1afkGtyUa9W3ZhirsK/6vJw
         RUOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNzTfvxA16C4VPxAXotqQg/9gkEg+7GGPklXuDpvyzwUL751w3opfSuybtWNzBoPbio3t6AXFazxz2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vt35/Dr5WkTJscD9JalEgnePOJ5LH6cwYsomE/6NRPctsn1l
	Mu0/fZX4M7TnqQHML9C4U+GTfPKlmCEsZftcI49L11v82BESMCxFxsg6aCWiqaROA2Oac8cmCNs
	T0lSoMgTNU9isjpOHfwLMdu8ggh8fJcJcgli2FtUJWgNbyK4Ky02h4HpSqEx/A6rC
X-Gm-Gg: AfdE7cnO7UZdVLq3j6PE91mf8HRADzqZPZxBXUl7TyCAMDlHF5So21iO3QEJPy8igdg
	WbchSd2JVG5+iFXH+FHNo37FUQqR5Nd9zX8MPObMYYFwNoYkf6UIdJn5Td2Otl0LsnCqCvE3Uwk
	C0F6iCToXUZadudWSR9Wu0ixPmF2KmaZ2nPUCYq7VQNp4qTHCCmja74+9J4H6goDVtp2ox258TK
	98+WVM0Py3/yY1CoyuMeGRreELl2Y6KhIr/S/jj/P57PvUfbJBSJtoSn+ymfT4NQMFhzCnyNs4n
	S1n8DcAMsqPr9GwdV04czCzcW9kce9La3vhxmnEtk8zWxCJSe9xJagyjgV6z+RhfUAH5PmRzToP
	IIaIKCBjCM2Jc8YKcdapMD1YTHw==
X-Received: by 2002:a05:6a00:a1b:b0:847:9656:4f6b with SMTP id d2e1a72fcca58-8484323d2c9mr2566206b3a.4.1783513071356;
        Wed, 08 Jul 2026 05:17:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1b:b0:847:9656:4f6b with SMTP id d2e1a72fcca58-8484323d2c9mr2566160b3a.4.1783513070836;
        Wed, 08 Jul 2026 05:17:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848337d12ccsm2367474b3a.48.2026.07.08.05.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:17:50 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:47:30 +0530
Subject: [PATCH v7 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-dt-v7-1-977b65a300c1@oss.qualcomm.com>
References: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783513058; l=1817;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=j9LrC7SvwrGJ5R59Zyt5T1ZwERBRq1xpSs/MEllIWkY=;
 b=L91IVVTTuBYVFSxkhdCViQAlausBGaigd1YeYtRCdEVL0Qlvkzr0oSZhr3a0/rR32ZEiJ0IC3
 cPjcr1Om0yLCDq7vHAqa+hj/7o6O1EaCtstqPKhTmz5zoFuL06+nPbn
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: -b7RtN3s2RO952YbBOpMTDiZESquFfpz
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e3ff0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: -b7RtN3s2RO952YbBOpMTDiZESquFfpz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX5mxaBIEmXGA/
 wIm7OYZAjMMBEp8J62piIDgRkrbSb33jsPS9nXUPJ90kcdBrhlsGhXo6mmIlryejjkEs6COSUtf
 xEkWfsLqh/dsjSmwZ799euEPEngVoRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfXyKw5ha1CIUId
 6ARKLu2WwCJPInIQgalPuBsEWSYcjxQB73zm/psYXXX4csGd1/EHaD4aRs1u8DZWnZGIyEht3hd
 CPeUKZq2hmWuh/Q80vQ7bGv4+o5PG5q9x/H7Sb3H9xxHHFb1ZN83g8fL3nrwhcI0AH8L3XiG16j
 YPTNRKxRhNx3QY6Yw8kc0v6bNQJn7fOA9+NgsawYpUBSkWoiFbsNfkK4iFg+PoPLJzsjmwwzfWJ
 b+xekYH2erfATw7se465Bztdd26PpT3Ndgu65SHFZJ6C8cOdI7HrCUE76IRpLCt9ROBV4CykymV
 GzNWasT4MFDCis6EvBtx8X1dk/Bs88TEN3C3Owo/b8gCrsPPnw6bTwnzSoYK8CXuv/IWM2bIK1I
 7nbdODi1xlGo1AEEdP4uVpNLPDbmQj04VmXg6hmBVaR/6ccGZ0QiKwPV8RKEKqsJybHpw3kQNwb
 TAlpxNNa6JUW47A7d+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
  - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
  - IQS: industrial-grade variant without modem (PM8150 PMIC)

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
its corresponding EVK boards.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..b91eea5a0f91 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -982,6 +982,24 @@ properties:
               - qcom,sdx75-idp
           - const: qcom,sdx75
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1

