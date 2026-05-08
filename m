Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05798232367
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 02:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778207366; cv=none; b=UXaWJk5Mt7X6F2M9Ct2E6OPbKooa+Y2pnW/0XGv499ZSBlj1O09K9qXIs10O0SoD9mbtTdfS+Kg75hm6cUgJXJl/QMzpYLLCDPbUv3Qm4aY938iwWctcp7CNgFHtK/4eA9idkS9DvZv9TE53A/eUAz/uvgM+MboMGxa0i/7YIaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778207366; c=relaxed/simple;
	bh=A/zzfq0P4bMFMqxrrokvvAVDteQXn/euLd0B7qdZuuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJA/xO/QvoVEw5r0eLFaKqweU5cMdTZotllYZ6fHR0aDEQElw5wVD9zPsjQv3/4AJkp+vrZa3uCwSAcwx+sj0E409pvwvnErFZ2FQF2QmynqDjK6L0P92VtV+oBued3Nnm4UiteB7m8jjeRFY8qdGZJuIoWJkfT2SOe3y0QJ50M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEZ090BI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/UJX7ft; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEZ090BI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/UJX7ft"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JrOKC2199536
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 02:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IemAIHEw7fWxd79i+a1tYMpR/2ovwqCdCYt
	xG3yhxsU=; b=SEZ090BIvjLb7R4oiXJ4IV/YE++7LPXmp+THufK6krJIdFYX5by
	Lrg33JpzWGw4xIVNZ4qkRRNiJqg0ngPRq93/VLqiOvqndxFCd455JP/Bqj4dSJOV
	j+OX6I3b1LN20UBcMtP2rvUk6L1znubsi7UK3zztx0i5T8RWAPWVSI9pZG1gR7jp
	OaCfzZiB5myHky91dZLUOKfOtxhW4PUmefusgOK7BZTCb2DATzcHAim4Oe/70RLE
	sl0zv8N+0y4s5n67+FF12v9a+LUzUBRMzJtH3H8nVJAdYHFWrm4i651AVCvw07/C
	ZdIjTfgCYqpQk57LnNLjTUAfe+AaE/xSnOw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sh3xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:29:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f525565b33so2057958eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 19:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778207362; x=1778812162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IemAIHEw7fWxd79i+a1tYMpR/2ovwqCdCYtxG3yhxsU=;
        b=B/UJX7ftK3mr0HlZImSXWeTE9LwaQCx1DOr/eE/KzshGg3xxwpmeJoTAFMwJTw5Lea
         Z8GD8CPh6RvZhoDHXaHhvhyRVCBOoNI8MGkevWW3c9+N86+aBpGE4aPu1Of5d0tkrjtC
         BdzGtRZymSRxhkrJQ8+7c8wyg2iSHIsNJQlMi5N/JMHnBpPBHYuBq1wD71ib97LgUyvK
         tWWxDjCYr7Spm8j45N0+T80XeIRtFxpeHRVWpmEdSmygCvyrfaK7+/aDxCmkJbKHb09j
         ABfdCwF1vEvbaRKmhudrOmfD6oh17xAxT5oWOStv2dPrarF+WipPzOMfpWmZe6+YiiY4
         9X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778207362; x=1778812162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IemAIHEw7fWxd79i+a1tYMpR/2ovwqCdCYtxG3yhxsU=;
        b=EABPD+BzSgUCxoUhfP5wb3BjIcQfiVQLUK1DXc4za7iEkbyeEcKgtA/QJqL7su2acO
         VL+mD9rNjWCTuUVRdJZEAU+PkVvmEmHO4YNUrdRWkdLH3NOeQHFA6LZOV6QuLUzdjVmr
         I5nYYAJD19gxfFa4QtwSZUjDQmq/EEYxdkUhArotqN6pegHZ07euGBl/UsRTOVerl3F4
         LwtAx8Petg5/LTeSimSLgOItsFxCtBo3VNSBrye9TWx0QosqcwXrEsDatzAGacLRMhJ8
         nFNW6B3623ESPxqEsctGm7001vosw2Gghkj75MePFUPTso+NWk/ypUwQ/npw/u/SbGWt
         w8LQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yCiZtnHHaPV5Nar4ytfKXZMZP0c4PZWrnJ6ibuwRIva7G9eRR7WxkD9f5EKFGOXMLCH8FAhO7J/Iv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3IEximHBCSpBBwfDqyt1oTLu0z3fYYwp9D4YfPzQ4HZfoMt0
	HfAWp+Ol62M4uRVY23EYAOG4lOJvqkswWPgSIYbHv+zH21rPm3bwkNpYUGh8XUme9UR8e/M3vRe
	WfEdhA62t6b20oUHGDjrl1ZX3FC0ldO+g0ntJGPyb07ReyD0jHc5GaCpqybTvHnYv
X-Gm-Gg: AeBDieusolv8eqcf88Jnj8CwtNNgFlZETqOm9nD4ZJq6sCJ4y4GY7IJpVQewdKxjfqe
	5TfaBarUmM2KnbjHqwDmK+s/vd8B/TRFPay4aVEZjb6nanRTADN7eO3ARv2IGIgyHUVgicMbQDv
	li4878ljSOBKZ9IfK3TMHrZx0/Jl3morIJZHLTXae8Eyu50cpfuJpYZ/l9XqDnigYdLPyK6pXu/
	vu/Mgov7a93vBVq88N1OrrGWzp3nD8y2VL3NO8H3CCgV9k/eEyUWzchTYgM6lxapbgv0TSI+3KQ
	PeeGRW27HpW+Q7NEKCiROMA0OxH/bHwiwGJfuNcxi9Nfpz4dlN4ZQ8DnE1QOLZ99aJr0l8jBUxj
	y6uXKi9KJi42lP8KLRFUQgfDivZAbOunpsZlL+9wLCrEv2hDWhAIijDYK2vH0okUDg6Ir2qz3Tx
	BVL9wEUg==
X-Received: by 2002:a05:7022:672c:b0:12d:de3f:f3e7 with SMTP id a92af1059eb24-131a69f32d3mr5231082c88.39.1778207361629;
        Thu, 07 May 2026 19:29:21 -0700 (PDT)
X-Received: by 2002:a05:7022:672c:b0:12d:de3f:f3e7 with SMTP id a92af1059eb24-131a69f32d3mr5231059c88.39.1778207360868;
        Thu, 07 May 2026 19:29:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88914523csm369019eec.29.2026.05.07.19.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:29:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Remove lemans-auto.dtsi
Date: Fri,  8 May 2026 10:29:12 +0800
Message-ID: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAyMiBTYWx0ZWRfX8phO3l3lhZ+d
 pALSCP5HoPDhTtzb7ft5jc3q4r3pmaTWew9Sm9DAVtVWP2Sln5ZaW3tWbMzW9KLiZk9xsJ0bUws
 1ceI8VwRDtiD39RtMKF0FnUCxNp1ZLdccXVCc/UO+nUVwf+Kbs5HrizoqPGoIjenfUpvbNSmNjX
 DxTrjeKpOEJqTbKtEem6AZ7x/jWMMSznOyy+lgIffYW4PLiqHEGQMxnzZqIrQzzj/xeD3l/HW9F
 PDibYsFlpqplITYbQENODowwvshA5LAwbUAv9NRsXXEeWuoK7biVuN2aaPsZFj0qlO7oj0aFn1d
 AoZd90W5WSpR7HJq6/xYEkX4Vy6Vy1bFE9hSpJ/rgKaATVnlAyM2JMbUgLEvgpNcT4xphb+ErXR
 Lg3+7nblMVtsFh/wW29WCTkrgtxrCLSn+vT2DPtOfV7Dyv5UGXQpdGv4iC8oTJkjvII5SAeU2Xz
 3iP4hNqXKihV5Ua52MA==
X-Proofpoint-ORIG-GUID: Cr6n0UVQkww26aZVHpSRBn8lFI-sCfY7
X-Proofpoint-GUID: Cr6n0UVQkww26aZVHpSRBn8lFI-sCfY7
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fd4a82 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PmaFrIVgk-5aEmUqFrMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080022

lemans-auto.dtsi maintains an old "automotive" memory map to support
legacy use cases, which stopped being supported by Qualcomm META build
2 years ago. So there is very unlikely anyone still running it. Remove
the file and update sa8775p-ride boards to include lemans.dtsi directly.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |   2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |   2 +-
 3 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi b/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
deleted file mode 100644
index 8db958d60fd1..000000000000
--- a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
+++ /dev/null
@@ -1,104 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023, Linaro Limited
- */
-
-/dts-v1/;
-
-#include "lemans.dtsi"
-
-/delete-node/ &pil_camera_mem;
-/delete-node/ &pil_adsp_mem;
-/delete-node/ &q6_adsp_dtb_mem;
-/delete-node/ &q6_gdsp0_dtb_mem;
-/delete-node/ &pil_gdsp0_mem;
-/delete-node/ &pil_gdsp1_mem;
-/delete-node/ &q6_gdsp1_dtb_mem;
-/delete-node/ &q6_cdsp0_dtb_mem;
-/delete-node/ &pil_cdsp0_mem;
-/delete-node/ &pil_gpu_mem;
-/delete-node/ &pil_cdsp1_mem;
-/delete-node/ &q6_cdsp1_dtb_mem;
-/delete-node/ &pil_cvp_mem;
-/delete-node/ &pil_video_mem;
-/delete-node/ &gunyah_md_mem;
-
-/ {
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		tz_ffi_mem: tz-ffi@91c00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x0 0x91c00000 0x0 0x1400000>;
-			no-map;
-		};
-
-		pil_camera_mem: pil-camera@95200000 {
-			reg = <0x0 0x95200000 0x0 0x500000>;
-			no-map;
-		};
-
-		pil_adsp_mem: pil-adsp@95c00000 {
-			reg = <0x0 0x95c00000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_gdsp0_mem: pil-gdsp0@97b00000 {
-			reg = <0x0 0x97b00000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_gdsp1_mem: pil-gdsp1@99900000 {
-			reg = <0x0 0x99900000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_cdsp0_mem: pil-cdsp0@9b800000 {
-			reg = <0x0 0x9b800000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_gpu_mem: pil-gpu@9d600000 {
-			reg = <0x0 0x9d600000 0x0 0x2000>;
-			no-map;
-		};
-
-		pil_cdsp1_mem: pil-cdsp1@9d700000 {
-			reg = <0x0 0x9d700000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_cvp_mem: pil-cvp@9f500000 {
-			reg = <0x0 0x9f500000 0x0 0x700000>;
-			no-map;
-		};
-
-		pil_video_mem: pil-video@9fc00000 {
-			reg = <0x0 0x9fc00000 0x0 0x700000>;
-			no-map;
-		};
-
-		audio_mdf_mem: audio-mdf-region@ae000000 {
-			reg = <0x0 0xae000000 0x0 0x1000000>;
-			no-map;
-		};
-
-		hyptz_reserved_mem: hyptz-reserved@beb00000 {
-			reg = <0x0 0xbeb00000 0x0 0x11500000>;
-			no-map;
-		};
-
-		trusted_apps_mem: trusted-apps@d1900000 {
-			reg = <0x0 0xd1900000 0x0 0x3800000>;
-			no-map;
-		};
-	};
-
-	firmware {
-		scm {
-			memory-region = <&tz_ffi_mem>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index b25f0b2c9410..b33b9c8f0e08 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 2d9028cd60be..a29be5139554 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

