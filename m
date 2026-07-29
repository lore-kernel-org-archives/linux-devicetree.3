Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F9726CE32
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286865; cv=none; b=TVFQUYubrwKe05F95dMnwFQ5eBkkjLH8AWT0nL3PXw1DJP0AEAiZo/laPJKayU44nHO++c1ol+NtdD8fey+QGShIAQTUMXkSEgc1LmwPHpCMLruA/1XLclJ0coR5QnvW/HDHuSYaTDnsrWrXCUvCVweoUje9L94GM+9HHOpBzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286865; c=relaxed/simple;
	bh=GTd16/5LR7XNZnDQCcaMeo1yw1gAoBboKZTi6y81/yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpHeO58D2f8bruZTTuP0rktzM7CYIW/y0F4avMjy1+7YPQz2PHOasyrbvEDFux1LTgON0v2lmCa6jdUX0GjMqkfqiwmWhTYuaFe0bt1W2KsMsIiFcJohg5XCwEmtgoPnM8Tprpk43AEzG75aHF/2rnraSUXFAGegR5gz8LMvR/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmrIwqz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAweaeKq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmrIwqz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAweaeKq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL31Fd3468759
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zRLhe6Ew0ky
	n8je1+jqha9isdj/ZMTagJJcLdZBH6Dg=; b=UmrIwqz9UNbATM8vL97MvgSbtQl
	nxyXTo8tLR18zyDrCuv8fZVt0Biu9JJ28kgL7pzC11raZPd3qQgzRERfMG2kWUr7
	uHMSdcrnRFTYZjucXdPoq0MeAqunWttoShHqrnhizAvvcaYPM/rvzuuyKNmD8NuW
	KG1R8hVZ8PlPlsB2o3J4RuTmLF/WVQXTu/cAs3VtaYCzr7Ezp0BdX8pba8FPFpZJ
	vo5cByZO0abSim4L+KsxlzUzjsmqEtoAYKXBcgwvqrNj3cp+9r0SyCwtAc26fHQK
	8I09nmBL7K8MkKkpUiwjQU2nld5ZoqkMS+3benwpfbs9ujDk3hg7MMstYbw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hhsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:01:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso11789015ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785286862; x=1785891662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRLhe6Ew0kyn8je1+jqha9isdj/ZMTagJJcLdZBH6Dg=;
        b=RAweaeKqsrazhglzPULsedL+1R11q4nZkFxWlWOCrn4+B7cRy9yTlAazkD6y7k9Jc5
         iXjS2XNY2VYW3/UdbsK93Mufn/7+jnw/7VU6d8WLULiMUc5+Gsa7mB0uCkSBZjRdarTI
         7AqbPHd18bd4pWJq5/fwR7+3Nf4BotRoQ1k6pa+vhLUEZH7tr49j3qyPrV9rN7zR/8Vw
         SjTWTo7p3lnk5RbBNt4flP8ybiGV9dipuBHiVUmpohhL3eGjdIe308//oatZW6H0rlv1
         2HO9XsRs9hEbj0xMymKtGSwT6UOs5ZJSQQOolkqGaQdmxr3H4ItBLxaDpFQquskvQN6D
         vzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286862; x=1785891662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRLhe6Ew0kyn8je1+jqha9isdj/ZMTagJJcLdZBH6Dg=;
        b=P/MkPEcSW1GzSJfr7zdRHpaOZsRreRkfXUa4UumTRfC4cEuo6cG6ZkN/EkW4YhRex+
         bfKknyjZ+EydFX1Of2XySYFo7jAOk0vbxjVckql1UpEsCU4i+RS8qKmIonKv9LsMln3E
         iGniGCA2E8Abc1jmlcsUZt+PQh/4GctA3Wy2ajvQfAnwBcG1AD6DxW3NsD6QFlhNe5R7
         5ygzgpq4b/4PvcmFR0rmzIyIzrmm49gymbJ7nTuhPlQRJ6NEtLMVT6Hw+7wVmbdt9dm5
         5uo4jhK6XY/8qtEI36fEDXGYoPtNcHbfGwgCOm4inxzaJVZNvyKKOS3flCNYUlQOrck+
         0Vww==
X-Forwarded-Encrypted: i=1; AHgh+RqnbQQi4imJDARceUJGAccQCivFi9T2KmVSGEmnCSRrp14k2Y/nfbByPlqUzQAkH0ltMot+VWb1mYua@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzC35wwoA8kuTTmPCwiToL8bzxBcgjJxm8yEngfkJqh16/TuO
	f7xU/Nt5gs4sDnF673IP0jA6/JqSx+KjVf7PiT+OUV4UjYNekJUtFZoDZkqWGBnq7J5YXytlw8d
	nxgq4F2uk05xuhpJ/msV2Ha51VKSDegkwt9qMLqzaUUAIAwEW0C5iTY2w/jC0EWRh
X-Gm-Gg: AR+sD11PYT1Vq1rOONxIysNmklQFfyjks+5TrDDr5Cs5/cpwxzKClO5HwKkkEytBkWj
	3D0I5KiF6goKu78NOdu6Yador/fhbUxqEM5rkAoi+XOk8G6Wsbtwvk4C7XZuAOZ/jErRB9I/+TX
	tCwRvvpJXsEaT/RFvvfPfxrdB6vm8qecytUpN9Y41JWbGYGEA+1ggoYb54rFzTojSrbc/uZ2a0B
	cTQhyvyO3LXJCQ/dCoobsqtzSWiW2Pcxv0SiEC1D8QDnbS5J6av/nFg9eVA6qFUP8uPtnZ4pwnt
	1HuSV+mjjwW70mCfHdcFjVu4ljbzDGl5X49CZpDNHC9gnqiEhAlI7RXga+d/5S54A7dChBG8qCO
	lx0vEOTWJRr8Fs2HfqdE7YXSn0eVL7wD6FNTVC7iKfDn8qg4pUG8Vtly9jJTa
X-Received: by 2002:a17:903:11c3:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d015f00e62mr48024025ad.22.1785286861681;
        Tue, 28 Jul 2026 18:01:01 -0700 (PDT)
X-Received: by 2002:a17:903:11c3:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d015f00e62mr48023555ad.22.1785286861161;
        Tue, 28 Jul 2026 18:01:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm3456696eec.11.2026.07.28.18.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:01:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Wed, 29 Jul 2026 09:00:20 +0800
Message-ID: <20260729010022.875799-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX/c/XCAn4R3n1
 d4mLlEH13UX+1nqVLUrtqMjchHsvwZGJhQhpCx1vae4DPIGBciqGNaJw4IpOjtPWT9wlUOEWmzS
 w6918Rm/ReeKMRuT+xSmrnbKq/EZ9cWaLTyvqE87SL5EJoSQtAaK4boiMIxmVoLFVrIkVNUfNLB
 gCTqtJugwrK/l9eTcpUEIot8hcqoeksm6YbrT34N+pajL3PyU6KeGvL2YGccycLYtnRkMeMX2k+
 guAJg/duPv5gJbuqVCeLGAPvnv9jPsxOjNMwIjzGwjurUuPU4Ah8VO25iWnexJeIusP+CZ1T3/r
 UNnvTrJ3catjcbBaMfQxfyUrDZTAhJTTvgE1AxzEB9pXRp34y+225J3W4ecoz1akvW59+pnK0JL
 ySOlsoUtMs5EwTu7NHB8aJTeJ2lKNjJL6HRIpvJZoW7Z/iB5BwJhQdp8j1aogvrE2qVnWgq6sTZ
 XwtN6nxRk3DnCJB2FZA==
X-Proofpoint-ORIG-GUID: y8GldBIBN4N3JPd-AKN2Atys-9_81MaO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX7HTekNpy521Z
 R4D5OHMVufgRQ97G+nGI6Dmwzi40+ViBYrYK1D62E7uUkpxu/GskhyAIAzFgwOnuo1S4cQDGttH
 ndQnKjW3RUOouFSL+VwVRfiZVOR7rIU=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a6950ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: y8GldBIBN4N3JPd-AKN2Atys-9_81MaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..f5f02c44a109 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -401,6 +401,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

