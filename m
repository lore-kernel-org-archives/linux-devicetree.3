Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06BF37C11E
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318528; cv=none; b=KRPdEJ24ibQz/kzmPZA36LkW/liTeVodSLLignuIKFb65cfqoRMOKTe1Qbj113zZeCkyY/DuKETa0Q044yQh5IAqRcutiDY1h46fKXckAyzz3BdR0R6PEmjNomF1PQxC99JVuzmYO7TQraa4QjT4k72Hg2etV0DVwvcbCFx55yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318528; c=relaxed/simple;
	bh=mjrd/5WRTtizVxAileTEcsI3Pcwm5BCTvACtsLVlxwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iK0oL3aB6rmo36lja0jl+NpsIyjPE0UdxDvCczlFLwhKhxOZjf/HEvGrgk+LuS3P/ISI5I1qDopRl+U87fopRS6B3yi3EGNmc3skWtILoKBX1dOD4jzK7k4ADgey13bFv++eGlsVa1MCLeT13T2JnaqRUO90Oyc7EnmGJeA88OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3W2EEyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dg8DhFxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3W2EEyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dg8DhFxu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBeL93129399
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=; b=l3W2EEywH4eumlFf
	+JtME6yhCjU88SpknDnysTzaxerik8WioEnysNT3e4pIOKqOO88e7GY5JOrGfakQ
	feMtEeGBE0dGgQWNRVMwjbPjnmjA8TwS2LxMfm74TD0oQNnOhgBreGZRloguEz9V
	EDahYCUOf8jIheSpdrosz7n3yw0WCvhPRq+df/dnd78Ds1CZDv9fh3d2+SsQdMrz
	J81QxeSIVRLYqWRDOZpyjlWrU3BDLEGwPqha9OX4Xv0FqDX0yRwnxedAVfRwMBpA
	clPDuw3rHkZ+fd84LxPRtJoWgmjAhP0Rf88Z0j6iLPTZDe8iw/Mediv7Kh1Dgw93
	dyBO7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9010cud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:55:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so25375315ad.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318525; x=1780923325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=dg8DhFxuHiVtj+Vtaqc20hopSbe8OaCbHZJ5BQGxja3waT2srMdCpG3c4Ru4XqRSC4
         lmbMJ7yjyx+xAv9XROYT6k0WFcRFwJa3FnHGutQ/ZwpTtethDeZJ1u4/Fh+PIx7mT3Hi
         bek4NX2h99/iwt5UFcQYdM339KZRAEK0R/Hq92396b+rELMy4Nyg0CStgtIVOSa8TkJt
         laHqAye29xyaOzUWpkS+5JJMa0EIjwPzoJRfv9Ve11aM/HR81WfRtLyqypJ5Jm1rxdFT
         s8/pyuPd4H7z3mgszadljxislt2epJ0I2Y5G6rY/DEKToyCly7WQgkB9aerRqiqNv6Wz
         YX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318525; x=1780923325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=DibzQxxZz4wcYX5coo4P36CBv5RSSAXJQU6A8Dq62gIK7Q+NL4cRJ/BpGVQxLe2Sn2
         0DBNQZrr5lMiZsTPTsf3unMPlbH9PBvlep/z1gl9smww8HOZFmPqkjGtEhwrl5TtkNOj
         1yM+dUg1Hlf2Ty5L3QQV6ooy0k7ItVzPkZD3aSp9Dr5TTrgrpZGReta6ckGNNhzZnYxu
         Tb+POvf9ivPOFVRjtDroOmt0I8JFhtrKSVYsLtG87eeh8wf93B2tKvTKlNv1yPZJ4k/p
         YoGfUaScslyLUn6eDLMXB9zAky5tU0fiHGoB56R18BwhYZdbBR2BNN1S2eXynRVkmx6C
         TK0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/VAXHQTBQg6SSRg+F6Ay5xCQzTrSoecIj3dLcpI3fbHMtKM1XTI4q9vmRYZSA6Mwij+ChvUMfqAfv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjt1b+WD5LReWTTO0PCHuNjqjTajCoFS3Di6btD8L4Zplx2VmW
	+scsM4P7Y+emqKkmjm23AKkXQTGCXF4fj9qpVEx6nxL2j32lXyD91zd9nY+pIlqOPrM6NBEAlPp
	DdY2YSDtsvObGqVKx/loVuBjrS5J8DIaJPTrTo9vMG+HSNrFmj5q23aH1ywEch8eE
X-Gm-Gg: Acq92OEDN6tDhHl/jVqA0h/Kx44vJa4ZGzCEkfLMPaodhCFBMjA5t76CpFpFagpmHXh
	+5a8ToRxbT3Vx5BMAQMW9nmsnFOMQtnFWkMc6Y786lO2lqpdnLB8b/qIuC21viy/1MFffMRsFai
	X6S46jRSvCVnls3AwXYgBhr2DM+fTzGEwna/7lKKJfgyQ0oeJ6asvEVjV76hq7t6smbsDdFv/As
	OuzoaSpUhnkp86kVhsnBAVpnsRG5ffb5RzrtW3evGYhetz/OD6uDZKcru4TlTqk50IJGS4t3KHi
	6HoRfn+p8MvfSyGWvi8X1LyIeyxTI6qDKGPLmXOBRiOQbsqy0n6lUiqdIt7Z7sWXbquORejL+M/
	4Q72UB04Jk9y5ab0FSrRs+7h18bdhjA9Xgftk/zPuehCNRf0=
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr131391935ad.17.1780318524722;
        Mon, 01 Jun 2026 05:55:24 -0700 (PDT)
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr131391395ad.17.1780318524257;
        Mon, 01 Jun 2026 05:55:24 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:55:23 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:03 +0530
Subject: [PATCH v3 01/10] dt-bindings: dma: qcom,gpi: Document GPI DMA
 engine for Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-1-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=857;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JRwNa7gj/V38SNuXulP2MlFnweDp961hhJdbueICCwE=;
 b=PJGykc/8otHeCXe9kKzIIFTmtdyPt3eYq+7eAlJXMGu5cmG26SuwKenbdaF6UjwkpDxwV1StS
 s6lxCjxsHJRBZ/4THsyhk17175p4NnSgUAKdIJ0BAlve9s0LF3dcNTb
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d813d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jyTGefxJr8I4-3Pae4IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JuifYYMvefgN_I_0SypZFWYTYA4WVRhO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX1tLMHDWa6TA4
 fdwwGiBmHY5ZFjjVi0j4ePWZuauFvJcgT3uRcJ6oslwRWqjDihEZhrEtnmg1DKDmD2cmFPjGOpU
 ALSANwSTDxZkCZuPdnqN8azR2obn8KlnTwXOm5fvto0kRJ6tC82GCY9muQAh+o2ZM+VmKzfJEPZ
 e6zuEzyLSzYMLntSWFiFsWu3HsUwVEToghETqTbVtCTggFRk1MNp+/HSnT23ay7SurjAlGoixIU
 rGZub1MV+TstMtvQAWa6BBGGTVpN0WFg9d9CT1d+dZPlec2Eiyi/7RMyP8cdjOmc7elS8ax7oRd
 gAbEI5qWSpl2v7FrDzAVEtF/KGBEMDNPT22JmNvmiYuiPzg8bVhbtG4p0Yt1/e957ixqNByLR/q
 knAGv4cGayrlwO0L73I4G3hqtC9ZEdX21X1LqCRb1/0kv3COl7yrPMgOHxtP5zINZqKCjBqcfiA
 GcnYtw8JAPK274PmQBw==
X-Proofpoint-GUID: JuifYYMvefgN_I_0SypZFWYTYA4WVRhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010129

From: Xueyao An <xueyao.an@oss.qualcomm.com>

Document the GPI DMA engine on Shikra platform.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 8f9a552fe30e..54dca623223d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma
+              - qcom,shikra-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
               - qcom,sm8350-gpi-dma

-- 
2.34.1

