Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB766340A6A
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846206; cv=none; b=U/NM9XYKPRsucW6x4eSl9K5aptm+TzfdjrpTF6FX3gVTfN89rXO/XbhUx6NomII5Toin2F4JZfq2Lg7JiGgpAM15JDCyqCqJBUYMUkqVR9SM4KZtdKRY61zi/CHLOC4HDdnLMWdpEDIg0KACQXUYZsadtXCuj0pfzSqBfq2kW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846206; c=relaxed/simple;
	bh=Idyt7VPiLOMUneagHN9PxugOsJessHhJSGZC2obkP8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGtiaZFVUyoTK+fJLyL3mwIMq+MUggSA2exhjHYogKjs5iAFzHjFqwVIQ6BEOwa/e5UwjuZHmvtt1+2BzJt/222AcYUxhnmqB+OaAkeUT9YZNOTcY6XZzHnnSLcMSo87htaD8HnzHdxaEIe7kc4vt9U+KBgcFrizLQ2sW3DWDgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1iXZhg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIf1U/ab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1iXZhg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIf1U/ab"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHl1NZ2748353
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=; b=R1iXZhg9haY6dm/S
	2F39eu4ii4yyDRtTNPemOjRDf69aWTMnvRIIejfqUATWkEd9EEA0B2kRgSfL7QQR
	RPqXr7eAqaKlK9WpfVV7noyzy/Qg+JjMLELH5gTm/P9/1D649+q7Pm/HdCPyLJ4w
	r81nuKMODFhFYaeSDbp6nhUotDke3RY7kbdisBNVesbuzpl+neBO5+4JAMNOJC9Q
	0rypCDuDh1Ak6G9LOM0OHBFfywAwo4ccijxp1NnFbqkwNO/RTKDrv/JQsoW4eCWQ
	G71krNoJWJC4qgbtisuTBnB8SHcrbZSGOqruUwhbZR0uVBAj2ef+fpCsskxzbPXR
	Mb8alQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j910epw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c011c7cb9so13661882eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846204; x=1783451004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=;
        b=eIf1U/abMtM22/dkTQ8GhUQOLwpYi6NudSKhT+5PlPeHp03MSl25kXnTYPirFu51uF
         JbM2IkfWhUUMRxBeT5ipQ+86BnVtKhl6/0opwtHtrj36AwXlsMG0ZS1wuVbqp6gxLfGn
         mAN7cq+sFXjqHcAZ9mpJUWqd4UYmDywF2y9pOCbXVmf+25BoJ9uIaFggpC27gRcP4ZK8
         Cl7hj44ozSqbHBV/jq526vcuCXWKMkw12u/TjcaViriot7qD7iYcdOjyehA/8SnaWgOW
         GIvZHYIxg3GJunlbrG9ljezFEReiiljg5qK8UGlO5yLP5zMFS3B9CpUqfWkfndAH60vC
         ZoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846204; x=1783451004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=;
        b=T3GNxuj6v0pgXiK/bqXglOmd/8nrQp7I+5vQ+ZTGF+JA9Jn6tHIams5oVwL1WPs5W4
         7fdKrZmJKqaT7vNCCPrj3Cv4cDfXjnIzpKEUiH8XWqWLeKdAvwy3InMcpLbMYgsiAnb0
         tBBNPbdYDRNXQSVkJV7RwJZrqI6/tasvdluuiW8aOdMI687jh/bd1ri4Qwa5ouExLGW7
         WnaKmj3mX30AEac2+fbazW1aGbdQd+y+4CIwWtZbHTyIovMX8jJ5XgYdmOr1kq7NnJUC
         2Ef6CSO9hDJrcpbGgrJYgbruSDI+4JfOKHD5/axoMlN+TJQyVj3BeCGl5iC+1N2IV5o7
         Wucg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7sCsXtVAmNYt0YHOJhD7TFM3juCRPVz1e6FM+uf5QgquMgDRM3dVCQgOM95jByuJt5LBVNO+RwVNc@vger.kernel.org
X-Gm-Message-State: AOJu0YxMV71SkyJ/e6q7J4EBhHO/B0nE7b5lmL0Uf9jmmUgyvuP0qfe0
	YoVP3XlsZjz+DaOBG5pQstraetv+m366QniTuCrReRlOyhzdYXjkSrjXY1WxP9Lrglo+iRHbwqT
	HV9atf7Y7PT1uGGQHUbVuxJA13YIlPLxmZjCvzLAjNDd/mpvVyMKk1sO19TwaShlN
X-Gm-Gg: AfdE7clqx42mCWo4qmAnSWBpMxE+Koi8idOdZH2cIPfaDYAck/d5E9219Sd7rgdq/6q
	bTZ/OrjR16Vz6UMop2O6gh5R5cROV1hnnzOCMgt2U3pFWyCJ0Fo6ugkJjTKWYTQRLZ2fhBLmMLh
	hHIB6fVEadFID3NXE6+KEjHpb0jvldM0XNhcwwehUIEyALHp5yBZ0pxcOPxTpdbrle5sVMEcir0
	8CKaTeA5yVlLM/kIu7Eg3sWtJE6kaXXMMApTdzjS7nWZE85PBS09L/9VlcyqdHs4EBSlqG/f3TY
	JuTjdP9aCQU7MJ256VbIqD/XfZrNuz3UAXcD69I8kE0BQYpfA98O9B9eHHUwDIy3e94cMSlFwKx
	g3ZgtLq41QKJLOPPXtAA0jrbcB38qmum3C3NRObdBq8+a/Bo=
X-Received: by 2002:a05:7300:1824:b0:30e:da5b:2725 with SMTP id 5a478bee46e88-30ee12c0a42mr3649113eec.6.1782846204235;
        Tue, 30 Jun 2026 12:03:24 -0700 (PDT)
X-Received: by 2002:a05:7300:1824:b0:30e:da5b:2725 with SMTP id 5a478bee46e88-30ee12c0a42mr3649064eec.6.1782846203728;
        Tue, 30 Jun 2026 12:03:23 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:23 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:43 +0530
Subject: [PATCH 1/9] dt-bindings: phy: sc8280xp-qmp-pcie: Document Shikra
 PCIe phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-1-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=1298;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=Idyt7VPiLOMUneagHN9PxugOsJessHhJSGZC2obkP8E=;
 b=uqjVKoeHK8WWuWX600D37o+uFPkHhRKB/ccwAF+sT33TdNNRkCWATn1i6vmYcLafrBzb9pTBf
 Cv8UhUYEmfRC2ptExN9cTlfzWDtzTDysF/b39BoFm1OhlzFicTx4WmQ
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-ORIG-GUID: 75V2T-NcxU46aNb6XMywHyG_-MFbjuCu
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a4412fc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 75V2T-NcxU46aNb6XMywHyG_-MFbjuCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX2lsvd7duIXsj
 /GVH0jJzfVRnpX1+MgFaOAQMY/uHIaazTu7Ffv6rlcLc1AXEC0ygn4FJPHQD+B27x5Weoubb4c0
 wysRFvtvOukINXtZWipX52+ayCVPAlZxBUN/Q2/qH7pKU/XQRSrrBUTZfQ5TMAgxhbeMO541eD0
 aZ5SLgNp8nqZpiXWqTD6/H9UO3i7vMUUehMueTVk1iBVEUtTQAphvd1dqUvQ+PHi5q3i97KsGD3
 HxdACbcilMX2AFxFP1Cr0v3UMIcedWrrx/VZ7V2pw2+oHDzFOpZrG6aAOvB0EXzpDyfp4GHTjyR
 CHFqqw0yf3BpCfvHvwdpWKRH0XEFK9zrykUvJaM3DnHol57cJMDtBCnAgxEVSF1BvSbkuRED78K
 wrOr7JzWOk78ZcXr4BXo65QfAfbZlBR4abFE/Fz5pNT35KaKG9pVGt2/277pEWLef+dUmQzJdnU
 2PSqdhJ1UPFSCYRLXFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfXxciHjazcIRzr
 5M34sKbpi1tHnpbPeNrI20O8FyX6mBrLlPLeo1aYM73+ChM0Yzo3uE4SknPpjQeLGEAt0zSBwxK
 mEN23JvXBDnT9jOJLPhSOocRaH2z3x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182

Document the compatible of the Shikra PCIe phy which supports
Gen2x1.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..b9b0fa26347b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdx55-qmp-pcie-phy
       - qcom,sdx65-qmp-gen4x2-pcie-phy
+      - qcom,shikra-qmp-gen2x1-pcie-phy
       - qcom,sm8150-qmp-gen3x1-pcie-phy
       - qcom,sm8150-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-gen3x1-pcie-phy
@@ -166,6 +167,7 @@ allOf:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
+              - qcom,shikra-qmp-gen2x1-pcie-phy
               - qcom,sm8150-qmp-gen3x1-pcie-phy
               - qcom,sm8150-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy

-- 
2.43.0

