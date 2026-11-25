Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594889;
	b=h/iTGOywePnc5Of0mCuiJqYrIyAPslqU+u7w8nrsK9VOf6nMqoHqH1Qrl3co0ikxXSZp
	 unZwdl66DV0Yk1+dITtLVnAXD+8BrMYrt824WQic8EZJ/2KMqG9crwHeK9gIJO+v9siWp
	 P4vyq+31tUm3Ctoyil0wzoA3jVBKxOdsb5SayNS3QNhyx1TmrPShsJoN8OmHDYnOcVr8p
	 XMVNYJFPWr/XY8UdAsPsppheUgUP97w63oDRBx2TgjNN5FudSNjaPR33PXfvquY6HWfbQ
	 Z4ftiBeKprVo8KWtmAYvXZ0I+Ds5IY+vm14RCvpL99gtqgoBQJpo2HbvgyGn/gsf8SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
	b=jitUnE9XC5FArJUBVzNQDh4WvT1bmZQIolxbkais2QLoQ/OX8oq9GiZZOQoswe9NEsgn
	 ZbEioJ69HMKYXzghPCI+LXa9PIerjO+BrCPlebumasiUzqoWMsGfcrF202YyX8aKV+mLe
	 gVOiOuC9Zu8+cLW1iPRx+Q1MNbGa2mnrtdIqiRIbndOTazwxnSqFHVyDs8Dx76eC/XTGl
	 7QyfMWBcClSkILH8Of17Xzj/53BIxeGr/v7IugTQRLwobQqS/yZdrnTL86b0eHUpuAuXW
	 Wdtrg2PT7sco5u3e77+RN1mrzx3tEx0jUWMDlOsqz58lXdf+boDYd6iptuDAepebZyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTu57Urq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNO0hmHs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BB0606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BB0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTu57Urq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNO0hmHs
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68dqg3113711
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F9dBCzJvyPG
	LsTApMbu3cmu6bIp573jhUz5HJOob/M0=; b=NTu57UrqioZE9Ktf3PkaXVqn3QL
	E0YfKrvkb1p9x2uySICRHQ+daWNSqeBAvKcLFpKEkuVzb7pX/hAUyAZSDooCjhi+
	bLPhuBJrZE16Kq9GFNzy/HUGwFvrUnBaGpu0N6eFsaike+B7ojWjoOeSL5DYg/zI
	N5yBbgaq/3FUPunJqQWIV2TqvjCpu28avOapMXajRgJX6A0NDKB4odqvjQmP8OkK
	FNFbugWcQF3F1q39ybwGhHFgvOl7PrY+Irb9clnKEWNeRKRIOwxJPLUBmRsEZlre
	2O+JLi84QBlwNwBwIzSQayRoBNds0aywzZ654YoK1ZAqKIHtDG+TRtJ/YAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsagxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so43845805ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594888; x=1796199688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
        b=QNO0hmHsP2IixSGHKoP0t05o1LTib0/h7vkxgTzkO+CriJExBg3m78donT5Nf2MEg7
         zTbjCgB5C2c7P/8gPd+Sqf/CNYMfcTtlmTrRECBa7AVl+A49UmdO6eMSq2buIz1df1Rv
         pKYucRPrKeEx4OXazJSE7WwsjYkq9DReUg2qRAUvtqdRChCjfjqyMK1admfBqQAbZB5p
         5M76E5YwkW8WkVry8z6GIKDZigZlIUC7+FexNeZ7AI8a5hZlHmKf6o2n1gSHUE6EwjWe
         vWkyCsuBA6RZWYhoBryOh2TRA5kGvbba2A4fnQjZ2YF0r3KfjkF7tiCXoTp2/ptDvCWW
         X0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594888; x=1796199688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
        b=EkMEGw6mWURgorpE8XVxLA/3f73zWJiPeRp3iJ/5hpg7ySDSIimVTMI0uLW0lmkLZL
         9/1hh8QHW+9ls0mj5v1TBZuMlSEvyVqfnLc5Lp5f/4D/mcWSOMkX4AnaHblizdgB1vTw
         439SloPZQbjwzZnAj45eQTZGBjEiPrkEUhCqAYOxFAvpILhNagsF+xlySMwLtt7trrx+
         ko2+6wP3/Fw/OQZn6TmRoB0W0tRjGvSCzUSGjLalZf6TfGL1ADQDIz9Ki2W5FaE2cJoY
         uK8rIKE2i53N6idH7aXt7ZPYzM3N3GCqPWW7OLkIzfJaBKkDTBJLSw9/3jnzHRzF+cTo
         Q6xg==
X-Forwarded-Encrypted: i=1; AL+hErFr9CTbz4APcwJX72xhtvwvTGePJwlRUkyk6Av4x0R+2fizogSdNPmedg8bQaIbR74IvPfN2aHrUkf7@vger.kernel.org
X-Gm-Message-State: APuU4Z9uKZzvAW/rrF/kGBSsj+S2KrFOxrieJCoyOcSoJI2cprtNoUSv
	/e6klyATInloaxT/JVQ1fxsOQLk6XTZ3wW+/x+E4OhX4VVIaDTyBcwd7zdyAqeDS7XECbN3GWhX
	OHSMeNK7nN1Ex6HQahLgQUd9hMMZE2OUuX0U526yo8I3eaaCU5Y5BG9r7j6Ep6PPt
X-Gm-Gg: AZFdTZdZVr0VP5u5tQUC8vUI2A3bQtswmd3usOFdIKfODDgMWz0POn6yeifISWv4jPI
	HlGf1VmIZhAtoP2naTO8fVAcCXN0U10ojBgeLY8BZy300B/Tqz5Wy0imy+cnU6A+H580+rLG58u
	UWW8lkRg9kOOeHE6AHisZW9KdYCwa4TFRQ21QXyHpDbkcGNB4LAmpsgKzbuxgHTe++B5xkjiXF8
	s/H+KFt1dtfYMjQa/j/Kf8JAYqU5HKfOgOCnqpbGOR7JJy7VSTskuzffRTRdy71sXHOHeQM9bYo
	UmwRraVfam2PysEDYpEz5C8uCA5c8y527f25Gra6LPLGGXjDdEjB+BKdMLf+J/90txnatLdX1as
	lsdvYB3apd0+qufbp4FFlXRUM+rP2Xdnx1n2i/4cDCR+BYfVx2Cc6ESxvaSSKcNP35D19C/n8vL
	OQTUxCjUSs
X-Received: by 2002:a17:902:dacc:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2f03f18c744mr164634615ad.42.1795594887585;
        Wed, 25 Nov 2026 00:21:27 -0800 (PST)
X-Received: by 2002:a17:902:dacc:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2f03f18c744mr164634405ad.42.1795594887117;
        Wed, 25 Nov 2026 00:21:27 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:26 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 3/3] arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
Date: Wed, 25 Nov 2026 13:50:55 +0530
Message-Id: <20261125082055.488583-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bq_A48Dtm-nSxyvSU85haFjiEEjEqwUy
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b069a88 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MHOxcNdArT3Ept4j03UA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX3OpKEqpGpt40
 R4KYfP/8i9Rbkey0uUMyFFO0YV78sPLYO76snD0hum+x8B6DhKBHTfe/wF+BuJlLqd5WResngDi
 9pxXBn0P7fULEfI3LI5Zn2pu8G89NIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX5bnDHoMY/bBg
 kIPdaNJZnDMZ2iRy7/uKNgeCrpWvN8vaVmBMHZCHN6a53nux/XOMWzn41H5LL/H0ftroYCqPLPB
 qso1N0+r+ClmaagHMii6Ttrb0E7X7NCKIx9/mKtcVG0ue+t0cx/ei2quNYd5G13aknFvidOogFE
 3tex2m62IFicENpTJIXCwpcozbTBLPWxJ67cNAgPzH1KMZ2aPE2zibxD7Y2TVsG0TqLO0wlvu4F
 IzVW0jFwj9QH+Ndl0CHLc/AcczpUbTP+XQgkx3vaXgr7W9eYuMWXvOAbPqoYxICijCYVe0mzRVP
 YP80tWCidO3KOy5o7clVdRygt1eVR0DT/EH/1N+gdPDbXcj7yKsXb5q2Y1/c19mPcdpeAJ+mGdG
 1NEG5dW4VTrMjwTPqjRoau3E5FZpUyofQ9pY4TOlFReGn5K/nDdpzPgrLO7C6Jn/fKtxVxHCgQq
 GgQ+rvKbdqq1ZuwOehQ==
X-Proofpoint-ORIG-GUID: bq_A48Dtm-nSxyvSU85haFjiEEjEqwUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding addresse space
and resources for eMMC.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb894ff002c6..25dae330d74e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-emmc-dtbs := lemans-evk.dtb lemans-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-emmc.dtb
+
 lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
new file mode 100644
index 000000000000..52739d39a1ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+/ {
+	vmmc_sdc1: regulator-l8c {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-sdc1";
+
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
+	};
+
+	vqmmc_sdc1: regulator-s4a {
+		compatible = "regulator-fixed";
+		regulator-name = "vqmmc-sdc1";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc1>;
+	vqmmc-supply = <&vqmmc_sdc1>;
+
+	pinctrl-0 = <&sdc_default>, <&sdc_rclk>;
+	pinctrl-1 = <&sdc_sleep>, <&sdc_rclk_sleep>;
+
+	pinctrl-names = "default", "sleep";
+
+	supports-cqe;
+	non-removable;
+
+	qcom,dll-config = <0x000F64EC>;
+	max-frequency = <50000000>;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+        sdc_rclk: sdc1-rclk-state {
+                pins = "sdc1_rclk";
+                bias-pull-down;
+        };
+
+        sdc_rclk_sleep: sdc1-rclk-sleep-state {
+                pins = "sdc1_rclk";
+                drive-strength = <2>;
+                bias-bus-hold;
+        };
+};
-- 
2.34.1

