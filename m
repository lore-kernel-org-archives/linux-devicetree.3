Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F23C10B5
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779248; cv=none; b=pAy3eBONbCoRe4j8mX4LL1t5TIThsuMDgDhmDWCN3Ge54mXUMmg6d5w6ETW9e8rpv+rMyaO8TA5e5O8noQkjbF9IIGgJdxt4rlA5itCkFBd74qFRHsoiuQD+eaeK73v+OTCvVuE5V1q8ZmPwLX7QGm+MDZ6YXr/DZkQHEGetvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779248; c=relaxed/simple;
	bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnZSKV5G0QcqvxaGkrTm4EqvpRypAGvZDNFuFCRRHyXn+ooeKktiXH7QSVJxQUJzyI+hYgbJ8kghrBmcz56vlg1A5SE7ToUuFShdnRkDOlc5Jr2d52oVZiuqCwn+RjICg4bmJpKrn+Gceu4HHICrqea0qd73xaNYS2s/ljzL9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCjf9rhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAx9ITxE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCjf9rhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAx9ITxE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FugA1252626
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=; b=HCjf9rhNPuAVw0BH
	gBRfm7Am8zssdcIFqsVgen+u2j6ChfQHw06ViV8NjPyVI4w9IwjiFRUNFXVPk8eb
	G0DYU/V9PI7u5WM2HKDdYh8a2oMUU3KoQkoLBisQUj2kMdQlB8aBgjsA7gaRsarS
	gC6dng1PnQBJc1P/ufcxSaH68ELivlCnTlygJgOWmYDVZiKuddbD4vLzIQJwYS8h
	HeVfQvLnu8edPIAkCdw+SzeIMUZjiVRWSCsPP4yd2RGhNuhUmDXs1/s+E0uNfKAo
	RRiGPGin8NVgN5nQHu/bnJMJuzhRozzdsBMX1AWpftamMBLeTNtiSv/ZjSm+1tpM
	Z+NBzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7k8te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8952346bb9so523004a12.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779234; x=1782384034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=FAx9ITxEWLPllEsH7dVME1p7nI2tQmYT0f8e8mgChuqGooSoS4tdm0vETsd+RYjYvn
         emavg8lkU1cwmePHVvTSu9hV96ulorbTKuH+r7qtT1jZDMXYm4R3xbt4lWvhpQo6uaEh
         ZHDb++i3LhSkFQzHw5wprtJxHJFrGEobxFkZmlffO8pCh9u/gnNSJ/EFAyl7Y1a0iqsa
         P2nSM62x9EaOaM7a1L/FrYrz/PxeuQ3ukTXYDeChXEQUoxsMXy4Z6f0sFvkoQKw5MiSe
         1IYI30U7PwAh3uTdT43Zof6DEHOz5+XcdpPrQQEF1whGERje7Zj+1hzwOPd/w2kAUN7w
         JvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779234; x=1782384034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=PmxRr4L3am0e/MLi7zO7SrLl1SoyhiMTWVtOKD47AT7D3t5wua2a+5k5AowGUAekK0
         QulGC4VsOFfdE6LixL2Xvjc4qS7CmP6i6tYwU+vWillELYfkfQ3yZJD81mGqbv8y+qrN
         1UkBLawDjL8OAdgh2QbKQrLlDnO3Hqon+8n9NoCWO2yK1UW426BhJJ8cULWiNTPa4YdU
         kTBIVXLUhnoQ7XvQhX0yhUI1uWBnTn7D9Vk2YDqoNxOH5JQgQ4HRMOayAfhiUxikMqzo
         YUUEzvGOhGeT+nnlsE9uEbhQy75sqIBZgdmf9zUrwDgo0dPaCrShdmKOG9cM0jTaiVjn
         kSIA==
X-Forwarded-Encrypted: i=1; AFNElJ+EQpf49u+ewvLxVG7prqKcGz/BJcq0/cMB4UZRPlc4E+8SFHFQkj5gqc4fPmNbJGUSTw0Pu3BIo6J2@vger.kernel.org
X-Gm-Message-State: AOJu0YwbdptVH0PKOcOi5u6X6JN4bIBHz/KM517B6W5PEv/b0dq3mffS
	7zLmJ9laktdsw1naKGlD7IiGtsktGO1HnlWRIeObu19Zn2DBg5b7PAJrsanl7/Ez0ljQlY8udr0
	yWKgtxnS/Y3DM6x27kNHd2vBE/Ap28ODA9TAX+uV5yxN4ssSj+u7RifNXN59ghgBH
X-Gm-Gg: AfdE7cmSfLozRcRVwJvC1gwV41CYSoJ23ptrv0vihsIhdcv7xvXoPF4BG2urm1ZP3Ki
	Ex9yPy7F6+5BRuntZPMkUnfD59JVJJqvhT7cIX1M+2xE4q7mpAU8m39OKAULR9JKU5wYCFjYoxw
	zotLmDDwW3arp2HegsPmu5meCOjMxR1se9RujjtDPClNujMf+C5t04lrBt3Mb5wTyG2wsGbnPpV
	UbDk132It66UxFBfus/uyCoOhVLM8NIdjb8ULAgpFdk1lDz2MOjapTq3W225czbtq1vsWtdSAGK
	PZ5ucxPGUrCj6y9GoUT/xvzq/h5QyNKgw/NIcLdeIu2+kv9c/y41ZYo7dy8oh40QBvZLehjF4od
	L6xYO+C7CGdtLKlNfvy86ATYz1k7WEHrxFgu+TRigxCw0wA==
X-Received: by 2002:a05:6a00:6c9c:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-8453b1522fcmr3370469b3a.18.1781779234047;
        Thu, 18 Jun 2026 03:40:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9c:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-8453b1522fcmr3370422b3a.18.1781779233605;
        Thu, 18 Jun 2026 03:40:33 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:33 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:09:56 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-shikra_vpu-v3-3-1a32e26a35a1@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=840;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
 b=u1eOdbBJ7MTDC4UO0Q1/IwXufMdM3RcgLnGCCFVwQC5bLYLtqhGGelWwDoU//oKQfVPxcHIIF
 Wkpyxiq8rYwCyPv2eHpsOPa/SX7OfV3lZXD96cjcxCLAWSXA5H3FFgp
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX3HgXsVV3ZX71
 0T5WX+A6yjPUlkNxUfdpmF+DyhUuz6OPLr7T83CkFX0PR4OJZw1SKwMkxY1r1clWkNS/sppOLwS
 gQxaUHqpgkdrnNn1iIQxg+qwjOQxOCYABwNnpsbue9LM7CdcoVKYg255wwseTrXgpZh+XBUKo++
 fHvFaxRz/9oFQ6OD2C+Ewdcftt6hsx1Aqz9C2rdm9pSkEVqFFvAwQyTRM9dScZT0Aek1Rrr9gaH
 DQjQp6JyY3hUmiE26+VC1/S92A1q6sXKA1ZixUhygZetcyPxUCBsLs0bYAkISq/G6K36hUPnWuD
 Ue190qOuAnVi4ETYITYtDnmaoCj9PakfnJ3gGFTamEqRuvtiiWmfxlb2LV6dfwn0OWAZOPQlLGQ
 K3jkN8PZoba4L+E0SeQSnTKXWYSCmH59dwM0PnkyVbyhai+QKRpcuv65D6oCbtrq5QHGaP05iId
 +NYQHlO6yipewiGYdpw==
X-Proofpoint-GUID: DYcxTNLc7ECemaOHjO5RsXJFuXFia_zT
X-Proofpoint-ORIG-GUID: DYcxTNLc7ECemaOHjO5RsXJFuXFia_zT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX4Z9DUN5MyTSB
 J+/Sj7vnIxFsUYgRjYiBAKGTuktGUF34pG1n/2nG/AFfVjD18YAvMalTNZGTHwNnUnHOaH2+U1+
 +kd1NV321/zsX0wPj+qa3jrNuBuxiTQ=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33cb23 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180099

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index d0c48bad704c61d17309753ba2a97e89bbfe083f..e2a3131594f0410931122657b12c8a6e70b435f0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1

