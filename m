Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431E346E6C
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367886; cv=none; b=ekKV4v/jZFZfrxM8BbKRn5DtXuENFYGzTqBOoOF1jh1FQc805PYveBAGX3FrGaV82cNPh6NPgzO0V5RqvlNMoEgfwDv5OlHZYH7/aOEOwv0aD1I6wJ+kFU4HXQPoV6jtcmHTgfxpztcF/2yKE8xYceHu73g4i+6S4jADL3+uyPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367886; c=relaxed/simple;
	bh=3c+McRZYx4r/+78kAYlP+sgtPACiFLMXKIqLAZjPwlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFV2WQ1XJO+oFhcQbfKUf0hVMy+VWuTsok69k/qR9F5ffmQdVZeXoSyHmzcPWMhVoqYfzLg74S4X3b29xdtkOkq5B05ijDmr8SiZ9ypyAUjxslLPTWE+w9XKTU5she2XxCz24MMUVdd3/rd2Qdmejvf7anLUb3HZQRDMRySoE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiIf3M9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2FzOxmX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiIf3M9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2FzOxmX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3k8WQ2006196
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Uvhc1RpeZMe01nOe5pZnSd2BAXonK89Da5N+6loXec=; b=KiIf3M9UORVOl4Ga
	23H6lciOe4uHzW5LwWoG95xrF9vgiN9JdAW6K7nef1NWJfGdtXLc4nqZ3hc6Tyk8
	RmybKOU5M8PR0SML88e+VMuJ/sIDlC6/YgRLRv4vX74ln8WSVvEz238VWMSEzdJ8
	Uy+BVPHrCg9Y6J09J639WF5VVxC/X3z2k/cyOJf6JGvxq6BaLRk6TUOTJhZZs4DB
	JJQnwFzKoVeARYhwoxBCR1JFjNUGptmdqkkNB3zyUgZqwHsDrZO8JEOVe/Qmy0cq
	c83oM45NtnnH3tLqioX6SbXoOo2MCJ0b374nQypGsM4cmIENh/WHQq/n8DJ2Norv
	Zsxgsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkmc10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso102618235ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367882; x=1777972682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Uvhc1RpeZMe01nOe5pZnSd2BAXonK89Da5N+6loXec=;
        b=P2FzOxmXdiAHdFml40EicQCjY839ZVjioa5ZG96YBlQkVAIkDB+4tRnrsqx1EHcLnV
         Z+MauHgjpIahMLDEZ9pnZpc6o9XRGDcI/C+UVHtHQtxER1tFAaD8lUpIR03OjGQexSmj
         fu86dKLLzI4UbfaySsgqFIvSMNHQJ2gqbIaHVxp9lZ0cny0tIS7LBBFmp//7joa6B5Lq
         jNqnkaP8SCltFCHV2W7naszSJGjgQ6JfEy7Gxs3wup8JxBZo+1cJfPhcjH3kwopcPMNK
         iF81QcJBlbATmibF2NURHzNPgYIjRLheaPgxV48kHBWXCWepUtvgV2TeBQEB8fuLq4PW
         5D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367882; x=1777972682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Uvhc1RpeZMe01nOe5pZnSd2BAXonK89Da5N+6loXec=;
        b=L9xJ/v2tGIoT3Sr9E73r1wVUK+Bswy4JsDnBON3dzfS/FU/Ihi2HIfdiGjea50BD8g
         uo9F5YQaLaIBD7MGNhwRoHkZhHdSwTRfjCwALdt9H0UgAsEPEl0otg8uajMzZZhG3F6m
         dXUJfjsX0TZ/bcr8nG3LGe1AmUh9+NdLqjBQaRtoJCGjg6/SrLJP3k3U2HoRSjhjn/Hs
         U8OGgFS9rgXJcUjHsOQLqGpJ1RB48xhprYZUpZeFm8Cruo+Pq2l0U4wmkz/541lDM9K0
         GdUtGRUDdZ8Px6aKUOXojldZBgeI9I2pobi+H/L3NoGooYta8me/3JR/LZS30qAzZ95d
         Mfmg==
X-Forwarded-Encrypted: i=1; AFNElJ9KP6a0cZsfV8Fp7YPxdkegfmEeRtleB9F/DN2+08XXWZiiE425xeQYsEwcoNKVNgmMsOVBRrtth/YT@vger.kernel.org
X-Gm-Message-State: AOJu0YyaFxSeGKfAZssWKOrJPsQdJCs1j7WWwmS9K0F5vjZ6WYYagZmJ
	RWd2HGimswTulMKzUZ2x4dI9sovjrvNDTQDxaprAKvF884x1oPlr3d6IjKNngTTvYZZUShe2XVD
	uMkcJ2nzUa1rlhpurrl2W3CNryokYqvI4vXtym5XHft5XDATQDTh0PldmYHNO7UTQ
X-Gm-Gg: AeBDievDIYR7gdm9bXUrT4powtje42pXlUqLZRrF0Z4R39aTsiB6CDSw+gHTa/vF8Gm
	SWFu45N2B91oFPkDpSMvuGZaSIfmxHFFkmEbuBkeReQDpfW0VLEqhH4+Cay+pfsB6+EXYJIH1WK
	FlM91cSlnR3VsvWxwwqkEXh3Lh9fD0l1SvR0cAKrLxnau5yDUNwIx4LNKoiKe/02M6eqXxNcFNk
	DGCEQ3rTOBITnB06gD//Q4FoUCv2mGCaUuuSpqLqQpXypOezbdr/zRg30lW9AvLf+GboHgMnn0A
	mcySkeHdFHAvDQ0AiJxVu33HCx7W3ElGrBiBpxydpmViP4Da+wL4D1eNBMFhdLYjM3LAJvf4zi1
	EdHBrlW9FFR1ANNfGexv4/5ChURLH+SYFt6ZH36QPNWnXIT8=
X-Received: by 2002:a17:902:8f8d:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97c43cd61mr15757195ad.16.1777367882565;
        Tue, 28 Apr 2026 02:18:02 -0700 (PDT)
X-Received: by 2002:a17:902:8f8d:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97c43cd61mr15757005ad.16.1777367882079;
        Tue, 28 Apr 2026 02:18:02 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm23069505ad.84.2026.04.28.02.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:18:01 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:47:46 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT
 variants
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
In-Reply-To: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777367875; l=853;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3c+McRZYx4r/+78kAYlP+sgtPACiFLMXKIqLAZjPwlM=;
 b=9TydhiPtoGVL8YPYFo/RUN9hpYO+LXbGhL1Fi1Hf8ej18j+Ar5PbSbiPfUss06D+W3qkcj6Pu
 TupYctvlwChBTs9Nhb6EbMQkN2Rk0TscUJZJT2UGWOXsEtUS9/1DdzK
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: VLPbh2iLoUDnq26tHVDTmM7YqZoFfeyi
X-Proofpoint-ORIG-GUID: VLPbh2iLoUDnq26tHVDTmM7YqZoFfeyi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX9b9BlkHoC0Ts
 CJtYdAAYM9O3erHs0VSwLjcknehxSKpl3HySCQFn4BPSqaFUVt+PjNZyegqkoc8t3KLWp7EroW5
 Y9lSwmbR6BUnjR6iqGYPizOKaI4ngf8bG2Dtkhx8dldV2IzTCw80Cpa4uTN7jHaAFf+WqiPfl9L
 QOMETk9vP3ZyxHv+xKt1k87bUIv+sZ/pvyCoqfiVXMb8FDFoSDoXhOsUvbK4+v7duMxcrtk6qc9
 eSz1y8dQJ0a0GRLy3kQcmB0WndFPubXEcg3Kuz91LjqHgkQ2Olm6g4VIsAvAswuKzpSJRGkF+i0
 5YFE9AzJ4JSUob7y9TnKvGifGMgQWQgay068SrLIr5aybP2OU1BmBXDJjcXA5LYVSICejohugv2
 c+uSHzY3cmOj7sbLqgG5j49bUjQQSv2ymORcGZ1BFxlyzpL4fsuWSVygadglMILXly6S/pm4igK
 HsixIG5CPwMFiKo+9TQ==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f07b4b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LvLIYPk_e027418G8rwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082

Document the IDs used by Shikra SoC IoT variants:
- CQ2390M: Shikra Retail with modem
- CQ2390S: Shikra Retail without modem
- IQ2390S: Shikra Industrial without modem

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..c300ffb4a6a5 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -299,6 +299,9 @@
 #define QCOM_ID_QCS615			680
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
+#define QCOM_ID_CQ2390M			756
+#define QCOM_ID_CQ2390S			758
+#define QCOM_ID_IQ2390S			759
 #define QCOM_ID_IPQ5200			765
 #define QCOM_ID_IPQ5210			766
 #define QCOM_ID_QCF2200			767

-- 
2.34.1

