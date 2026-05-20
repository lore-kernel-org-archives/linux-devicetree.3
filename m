Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354883E9F71
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286514; cv=none; b=KjizlggKaHInypA7L38SI8i0V315Mhqz9Mv45yOpVXAeGWHsJdS+s45wdTWUoHukGYD3N2PD2uYo4R6SXW6ML7Zka+djTjcqyWCN7jH3EJFMI6Fg91/ygxMvOwyFZFYV2Mq8URC998wDqlTpE7DMUIHqQwZ38i2gJN/h94XsS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286514; c=relaxed/simple;
	bh=38REJZzZ6Gkdb7cbpjFbicsseIUrU9NKmuQG5Z/mc4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dO00pZCXVAapCx14Edd0xwcXcAcWxG6dG2wO5o8t4R5bzLf709576nWzRKKWcHeI3fXFRMrcQPJCDabHDt8Zn0UYaj7gd/Ptt7D58Gzcn7c/RS5uMSlSFj2NdUxzijECfzUjIgjM1oivkygTxi1I6gR3DzH0uwDlePBu0VYkRH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSHumoyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQ5tNaeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSHumoyv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQ5tNaeX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuQ3N3680274
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1dHudBN89V8earjzqk3Mx0Toeoyaw7SN5qC
	KeHJ90Lc=; b=fSHumoyv/a1D/Af3nEDLRCtwadpHfd+7mBmvPUDvwnITyhQ3MCr
	ZWpTW42r8csORwGG9nH2gTlPNeDtCkMzvuWzPB+H3/MVYFmZ02NtoHC/mTK6CsVn
	/OtDYA3En0QlWc7otwNNs2FApspNtdz50LgoWXsfE+YCAUgQjEiK97nRpuPaKD0B
	ePxQ8RU15V074W+59iqCPFD1GNmK+j3JWTjUyaYb9EeO3PUDMn1GFOnlI2Vbz8Dm
	ndSnoH2HX1rqbf+00O2i9hoLSE1GT0b4qyL1WWPkaziUYt5B66CT88jPzdvCcJzb
	GJAGXUCskyeftWTaxCkhAB0IDFxxe6T4sZQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j02bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:15:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2efc342ef15so6280348eec.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286512; x=1779891312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dHudBN89V8earjzqk3Mx0Toeoyaw7SN5qCKeHJ90Lc=;
        b=HQ5tNaeXSqWJmr4ZpoOtmtkKtH2iyNjObY9LqcyFSSTYnVuDbgdeNZahsIag2QBJ00
         hDgEuMQmWvNRjfV3KwXP+MDuCL+TgxVpOo1UU6oSPIbYKqo9tYg+yFDEBk+BOVQvMY17
         US0sjgrmMkuhHHlbjfvbei/Z/7uO5N93Ki1iJ57A0yC691FgB3s/xoWz/zQTccDgCeSB
         StyTa43wsuvVLG2NWlM5VbE5VsS+YrxiO1phR2LarrE+h24c72BrbJW1X44u4tWMLYeq
         Dw9zoFqd8XnN8GyHpHE7QiynWeyqXEZyCKhE6qfDqnLYUbWBWoZObwdAy1dbOABJFVvW
         HZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286512; x=1779891312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dHudBN89V8earjzqk3Mx0Toeoyaw7SN5qCKeHJ90Lc=;
        b=rkLk4BTD+x364QjzBe8lZbrdyw3pzHX3CR5YmjAh3vVd/ekztaGwFiaNidPF2R9Sf4
         HDvhpmirG5/asj6VbOkjBRy6z+y0pDyqr0t1J8OiHv7vBulHXtTcTG7F8TN8jb0yyTqY
         OiI6ilRZkk+ndsiLUgjhctdl5t+Sa4gu0kKzvZVjkQRMkDGiAW1GOjXaLj5ggSzba/pg
         yjaSx3MeZgAHcQiNCupocF0B5NAu3YwdcpoPBFv60uICRtK/STfAvejZa1HFQH7nVXs0
         Z5wbEXMb/KCZ6/y80TG5cU5m4GtYG01d78RvM0rvIyI7+9v/DKRTb1rSPQ9zbwS6Btbc
         SjKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/m3yj509OKtH6q2KljhnqLSuXg653VivmQmA9UG3xv8g/2OayOc7wMHtIJ5wzVmnRrFFYJS2UYAzWD@vger.kernel.org
X-Gm-Message-State: AOJu0YxZi8DZ+IGOrJTKWXsr9+W/n61aFBZO/4tB02nXd/FO2yNyefIO
	K6XOLNof5kXb3ApN0+whqJn5qF46ChyReCBbO5l//5IVk9BGZLl12VU9bje4JfF1hFG76ySHHXC
	I4f0RJqdCNQ30qHsTfgYvw/C7yuya5u5Jr+VlrwTEetZMg4cdToV6HO4aonPy1Mkp
X-Gm-Gg: Acq92OErZklstCN9521p3bGAYQN2ec9f0+WD+Fl/RbOPBr9Crrg0RQ6Rf/SYSFjweC7
	ROI1ogJNdYnH4ImdCBmvzx6GSZKeu/Rvb6tXrkjkOaRtL/CpEEjmjdYE1DsJiiyIel10Qqvc/T3
	oXurmAKA00/psZ0KWcjTUiH5d6V6QoeX9dFAl8HXkC+B6IsGiEqvO7Mx97rcMi0y7MYXinj/lfN
	UnFZM9GGq9PTzgvYH1IfB2Uo4AsmC+69li/40PW+dPoKFVkoIM/RI/7WTnS3fkuDAVsvRwYbHRz
	vsupT29tC+HubdwTFCrzkl/X5iHcE/UOstPWC5q6/0w+LxSLhLwg4I9pKBT7uNfzh3cFvqhtmW7
	UJQaKgxAGsQKEeVYT7TUiU3ClhdLBhoWdMQF7by55KxiBPOCJmrb3n11E4o24xiZIGja5xHc2Rc
	jFSvD0Jw==
X-Received: by 2002:a05:7300:fd16:b0:2f2:6dde:df66 with SMTP id 5a478bee46e88-3039868c86cmr12429721eec.22.1779286510893;
        Wed, 20 May 2026 07:15:10 -0700 (PDT)
X-Received: by 2002:a05:7300:fd16:b0:2f2:6dde:df66 with SMTP id 5a478bee46e88-3039868c86cmr12429694eec.22.1779286510153;
        Wed, 20 May 2026 07:15:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm24052943eec.17.2026.05.20.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:15:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Remove sa8775p-ride board
Date: Wed, 20 May 2026 22:14:57 +0800
Message-ID: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dc1f0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jldscSqegy-hU8fF55UA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: LV6kpbZxzvUw8d18X2BoDCcS4fYG4Jl9
X-Proofpoint-ORIG-GUID: LV6kpbZxzvUw8d18X2BoDCcS4fYG4Jl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOCBTYWx0ZWRfX1YOGyxIUSS79
 X0kDqR1RmbcCOGQPlCSH7ow8N6aW5GLciR5hxpAL+R9/xarJXkGhJlyAgDeqmsoZbYQ3Eb/UEyf
 QHYn7ssPTf5de06yGgBTovnoCEcKMFZRP/HrDvafViaUEfjmberjO/qbuhb2yFD14WnXpGav8yS
 5PNy2hrNwCiamu3dTtkFl18YQ6iX+kXbiMpkvMzwuK7KljiMfVEIvDvbBXPr7JhlbeaHWHdnKC5
 Ilrmof+0AY2pIgQIoR/8Woc/iqqWd1ZnNk2SWngUdceJ0gR11PLXo7fiFoT+ke+GJ7IXpHgUgv+
 ft0JTLyPjUdMJ8zhZELggQ1ZGMaQf0xB8pxN/84t0BFm6SkLsdIwpMkMw8NaUB2h77XEhdBCFIz
 RpLDJWCRJldV0j6TiEqBtkc7HalLY7rI4DE5GnmutgiyTvUkbsJeGAxNd2/aZjSB2W/WaPrt/TJ
 jcv7ufUI6W325CHeAuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200138

The sa8775p-ride board development mostly happened back to year 2023,
and it hadn't got any major update since then, except Wasim's refactor[1]
last year which had no functional change for the board.

Propose to stop maintaining the board for reasons below.

- The Lemans development had moved to QCS9100/9075 EVK and Ride board
  for a long time.

- Qualcomm stopped maintaining Meta Build (NHLOS firmware) for this target
  years ago. There is not too much point to continuing maintaining the DT,
  as DT usually depends on NHLOS firmware.

Link: https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/ [1]
Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Cc: Andrew Halaney <ahalaney@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
It supersedes patch "arm64: dts: qcom: Remove lemans-auto.dtsi":
https://lore.kernel.org/all/20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/Makefile            |   2 -
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |  17 ---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |  17 ---
 4 files changed, 140 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 795cee4757ab..d383e98842cf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -216,8 +216,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
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
deleted file mode 100644
index b25f0b2c9410..000000000000
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023, Linaro Limited
- */
-
-/dts-v1/;
-
-#include "lemans-auto.dtsi"
-
-#include "lemans-pmics.dtsi"
-#include "lemans-ride-common.dtsi"
-#include "lemans-ride-ethernet-aqr115c.dtsi"
-
-/ {
-	model = "Qualcomm SA8775P Ride Rev3";
-	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
-};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
deleted file mode 100644
index 2d9028cd60be..000000000000
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023, Linaro Limited
- */
-
-/dts-v1/;
-
-#include "lemans-auto.dtsi"
-
-#include "lemans-pmics.dtsi"
-#include "lemans-ride-common.dtsi"
-#include "lemans-ride-ethernet-88ea1512.dtsi"
-
-/ {
-	model = "Qualcomm SA8775P Ride";
-	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
-};
-- 
2.43.0

