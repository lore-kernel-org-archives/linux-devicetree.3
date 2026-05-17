Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403693A451F
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029791; cv=none; b=SJvZ1btO+BT+7d+gC8hKb7L8o0OQgjvn5UM8bIq4Q55ej40c5CofS7Fi+zz/mkqSc0EeBL70JyFuuzVh/Ev4Un/kETG5VQxcNswtkCHN+RqYeFgsm2lLEMw0s27Qs/t0Z8PMKTbYR2DCPKw+aBEWtsskLzjRdld90yiZtfx4ZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029791; c=relaxed/simple;
	bh=OkMJk2UZdqsfwML4gWT8b+0oonjMBR4XttEusVBSu8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpIzJ7Rwn1LLScBi3rosinxLK7sR9q4UhBPSWVy/RwTLXA1gK60Wh2sbSM3gu0hHFwFqdV90WfBtAC6NpaSx3i87FrtWRyrRpMzPkIAbmJsV2rB98rR/dSOPWfH1rGfRqNOlF5o5McFbHOYoEh9cZ6y77+x0src4rv9yZ69ZVdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKe5JwZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+lTDsPr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKe5JwZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+lTDsPr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1GUXY3331878
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gcIgbF6WAqLUgtaoclc/9ivYUJnxqKKqAe/NNfONb4=; b=YKe5JwZQJewGmRqd
	RwQ2qTTvLm6X10Y6lRs/MKPEs2HbQUPglBYNZxzrdlrg/EYuF6Tqkkd2PyAScTvd
	Zo6EZq/zTba5w14RqYWrdTa8I6mL9WavBB2swygbE5loBT1iTw7PdNEXUeKbsSaW
	TMW6UOlyFPjgo+v0+ssN1krGzA1Q7p8ghVnYNWo5kuthVvx+YpXJaWia0HE+X2xg
	WilzMEj3g80LMUUbX7m8lhsXzI+JDKzlAcmVd7jHC8+Q6gIqNsY6MDkRAZFeh4UK
	HNsBqhSKeGknbcxmHoGTb2IOlpHRmaVEdsZU99K4MB/cHIQPmQ03qZy6Z1wlejog
	j77cjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcayru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso45233431cf.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029787; x=1779634587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gcIgbF6WAqLUgtaoclc/9ivYUJnxqKKqAe/NNfONb4=;
        b=L+lTDsPr30OSv1CZuDVhglJh+SBOyzkofPd8oZRhNhRGtb4AAjXDVSyGrtQXEMMVPS
         egHJJ8Bt1qvDSbbaTagtFKGwwUJm08g4o9A4lRF0iGZ6e7mXOESIFkcULLoC3Er1+Y3U
         R6NM8fA0I+DmfpbAn7CbMQmeoHz9FrGtlWCfJhCnJNvDpuqf4/k1NarYsR81w3ei8n2W
         OVkjDcEvVJ8dgVb3LwgcZ6vDM2OGz4lpQnryY25TlH/mJWCWJBrUtzYaTxAXrqjvt9dc
         zMMgd7Xtx8nW8B3GS4t5TS/ERRHRdKdfzyIiNB5AJ8Q1I9xlUvIMgImPx6r2BXnuCn9K
         Wtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029787; x=1779634587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0gcIgbF6WAqLUgtaoclc/9ivYUJnxqKKqAe/NNfONb4=;
        b=aDdtjEI6850fhtnFj3D7I5azflBRYeFKEAEbMSGuuGSvbJ1ZQBW7t8LJPcqIZ0FIl5
         5/9yMSVTWGlwJcQevGhQuIMooq7lV2eu9Jglgyl9nypx9pWqdSKIev09OtsArtVU6XAZ
         +DIj7I92AhgkZMbBxmzBCqWNKcQKNuBkS/6nozkeUQ0HVVrQsRDPe8JYPWhnizfe8o7u
         kvConTGXAnG2jiFEdAPWxICR9xT3ZzvnR+8xjqYCzf2nO3xfxf8WA8e/PErPrdSTLlbS
         BWhJJv0SBQpuXq2pBLdOqTq1gMgcnC8YcuBvFAc9jd/GnPew/55JS3X8Ii8o+YYOVjGM
         oVKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dIdGmpgLVfk4RV/prBfxG35FIOcgXpWx3JTvsYKOVSJEJX8AmDaWBoSI3Gn4WePtl9r3pzzxaXJ5O@vger.kernel.org
X-Gm-Message-State: AOJu0YzxR1ANgL2ET7mOK0M8VqsufnMnrBJyyELPsjwyO4r67oSH7AQ6
	jJU8wRGog0h+W7OdjGEuhtXsepUSIACLnvkhK9ckZOMi2vspiVxRVLRYWWQ9MJnJAinqDBqNE4V
	TLo/IJJNcsGrCmG+XtwB0fFPmsMC135yIZAD7rf9mZ0r4i11hVidL8syWs+03Qb51
X-Gm-Gg: Acq92OEzscWM1/Qn6paRl+FxVD5m9Gg90MOt83qIzYxUNrfSyGv9bL6sYmhuBoqxP53
	D/bnu2yAmilqrBI5MalmpnDPnkHvTxdkonAu9/r1h1CAYNDfMv+LTCqqmcSeDwu6Goi2+mqjOHv
	JL7ainQYLDiC+b1S5F8qB6kFApWfcK6OJ/+vsnx1RPy26+9RpBm9clv+abD4jBzlsF914XdyHD8
	aEp6kp+CdglJVhO7UZVNfFBLopJZuu4KI9l1vd8jAxJZPoE/VuZDrvLBTMCCWuwGDOVfKZqXzKW
	zgY1yUpXLc8fZYZk32A/xwRXjceGzzIquxG4xTC7+4y63TaXVh0a3+28i+vB+3WC93vbBQU4T/n
	dab5W6GqkAYANd5DNvaTy2z4avLAFbpYM/WLe28P2lQQeT0RL0ZWDDMcQL2ipCcnAHPRj9P6fCN
	Q/Vn+rUpd/bk6w0DNuthviWneNeqpehm3bMhw=
X-Received: by 2002:a05:622a:728d:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-5165a1e6539mr113479451cf.31.1779029787132;
        Sun, 17 May 2026 07:56:27 -0700 (PDT)
X-Received: by 2002:a05:622a:728d:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-5165a1e6539mr113479241cf.31.1779029786670;
        Sun, 17 May 2026 07:56:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:11 +0300
Subject: [PATCH 5/7] arm64: dts: qcom: sm8650: consolidate IPA properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-5-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OkMJk2UZdqsfwML4gWT8b+0oonjMBR4XttEusVBSu8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcNsxjpeKtTyB3Q4IQT3ykKYkOCwEvXkdAJD
 u2o61TLwKSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1T+BB/9S042rxC1RxG1Tv8WYXsTgfHbBT31o2AGaLo1EvSCgGLLF165KTNAPWkVeHYt2EHZPkOR
 egCWw949XpT5qAG6Nv52dXX8gFUsTl1AacVGT3w1IM0KE27HyPKpOD8ZvSUZBlD6umzFJm9cwSt
 ejJKWs2te6IGouRiOuyCFpkbJi3Dl0jjA1gtVKH63zimbB5BrfSNY1OuaJTLEzg2yNk2xFvK6Rw
 zvIJ4572sgOa6ly3CMHt/K/Mz5960yoVukwBHcefZ1KlnfCykPg3gr7Chuf3qU3QbCx8rsOT3+M
 U3gohWCjrbT5uAkazbwDYB7SNUSDVhVlXSX+UkyJlMCfPZIR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a09d71c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oHYOqaEBOIRX3F0Q_xUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfXzYOGzEmDfWnu
 i7/qeE8cBDRQzQBnoKSOkASbWaN69Yr87yGv5cLm4huKNQsoVT7MCWQ/2Kn/z18Q++rXVmF2mRh
 szpDs1e9TvStxxbv+EwNkI9BMR7LjWBE4LnllmIUssQWZvEiYIrZFwbLjZ1drsFeNFdddLk0pvX
 ez72G558BZDTA+YJT/hzusP7zljgFSrmd8mEBAyQYZji5hw6ScGbqLnnWICsHt2Q2wcFWzHEKTD
 M79oK4C3FeJ1aKU4Kt0pNIZ2tcwL6VXEmhvP2+heX4ZT3LWOV8dSPfx7oHWWa7ozx8N9Vz46RxP
 egJrzXYlt05uRd2CjBRFI2MYdRzFaWCC4kOAOI9hhBWjTN8bpDUG9/X5qZ1Etv0c8h5D3tGVkRS
 NclX9sih1ABQNVMJhIU9TxKlGzR+ogtSEUQodvJzjBuwzcaAQN+opBG9QlEqzTkPDxLXTV5MSer
 4kBgglUcbtiyj2yuQQQ==
X-Proofpoint-GUID: p95Aeq-zPjsXWufTA_utNgL56L3I59OP
X-Proofpoint-ORIG-GUID: p95Aeq-zPjsXWufTA_utNgL56L3I59OP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170160

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 3 +++
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..80bd2437f154 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -888,9 +888,8 @@ lt9611_out: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8650/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..a28d70c85fa3 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -861,9 +861,8 @@ redriver_ss_in: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8650/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..530fd1e6cd85 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4393,6 +4393,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";

-- 
2.47.3

