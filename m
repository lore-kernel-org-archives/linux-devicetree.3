Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5838AC9C
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767200; cv=none; b=E+A48jjOa7Av2+jF/TZxM3SRbmRCzkM5TKs10sadqaB0p9js+FuF6c4gpRzKHKJ2aI4gdRwjHUVyCzRtZNG8sSn6RxZb4bDSG9TGfnCD74jAAtiHvvoDctAJ7rSv7crY9Eh9CHjZ+QSDij+dnv/Mtd5SHhn5f93nmgeKV798+nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767200; c=relaxed/simple;
	bh=cd7Lv3gHALiOnDd9kTk4goO5mwyskrhI0eEGS8i7o2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+Y7RqI0fXgSVTxtkgDfEbLQxjqzLWAta1QkGqQgLDdJI4l71SKcQJirfJTYJbMzYFpnPI6ThKqmwf4RAGqOelLWuCrHKG4TEroks61M+6LN4UfPT76yTJoDGdt7jzb1yxmvtYUKPcM8rlXyeyHMD2nQNRv3yY5bsxvn7r4oo08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoZj7iXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5fV7aGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoZj7iXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5fV7aGP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PJficD2145861
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aAWUzZEf752
	JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=; b=OoZj7iXf2QBR6DrEuTTtcnGJXiV
	GwHH7+98QRAHOc3jxf02Z/AvcXB3ygNBvhfoQ0vOy1Pn3pPbSb0mVKD7+oFDvGPL
	3ZzlXicVUMZERlewOTL8b3v0dM8RtbfwYOYUOa01GDI0C07TioLOsFhlqRoAYLPW
	S9e2kWHQX88vY3o0Ddi1esoro7EG3YXHIpzySgksaUDyApR1XBlPOubli4uSYsWY
	QkahpVzKzpNFM+f1BoYsN5t9wQt5nJN6GzBG6nWPpF3mshTk5DzKJ4C0IE3Cl9uo
	RBDJwHqlsl+FFKceGejJx54YZqCaCY7loivDzWP70U8682dVPF/RvGhHnYw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv2qs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f2d983d109so1472064eec.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 20:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779767198; x=1780371998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAWUzZEf752JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=;
        b=Y5fV7aGPRRWkQ/fQwp28kGZ/LLdqlCQxszz1lP3ju68vmOwz2h+SwPfNkrp1klbWqQ
         UFEydPqje91RKoyt/O7ahGWVnQSA8kaHPOyFAR8vYenI42LYkX4nufgHk8q9RAzStwn3
         5R3rJwrs5cWmofOIffFfRHMVArHjJyTSuBJ1AD/tMt0TAWJddcgdvbRD1pYLfLmwNuGv
         kcAGHd8Fl+sexxFvh+Uwwnd6PX90/HhIFgR/Rl8Pr5KKMSV6N6g0VRzZGALmV4/vVVzG
         XR76PnxM9e/8GQ9q/GbvB8eQNvAGn6O4FeX7Lei7XngOLjNRRxumrPa5xSC5Cet/7F56
         A+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767198; x=1780371998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aAWUzZEf752JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=;
        b=bh8LPH6FkF5d3KW7gRAUhWNwYkvVFk2bjxMibONwMh+TnSQn2eJ+clG4L0vPDlgMU1
         CGFue+l3h3+0LtI7ijQU3rOYUpiPnXlKf4wDSmzEgCrDeUzre9it9ZNhB/rVHuCkPfjw
         1+IAdYzYgKCGgx1iLe1OVdGshylfc0Fi0KsZDX1tC3jtKtzG0F3P8/kjCZhMlbN9Gw1B
         DdJGzAB0koNwUU/Gj77aDCsbv/8/hKyLzBw022fJ4KEpMtx8po7dPhsKuP2NzxVEaThV
         Lrjdd4HsZ2t8akW/xh85scIlURcfFxh6NfR0FXDZNS15IWzN9hb5TIQT3jrLq2SoXVTi
         Axxw==
X-Forwarded-Encrypted: i=1; AFNElJ9Z1565NQFu82mFOfHvPYRhT7tCgQx1l+/baPa8bmUKzp3g8f5IbTw3y3Pf0dJnGjT/Pp/dmEpf/z0I@vger.kernel.org
X-Gm-Message-State: AOJu0YzvgwFzLUq2j91Miq4rG7Nz7v8JaRSum5rJZ8nKs/WLiNW259n4
	lPrRYmeOk2LW73nSfB/RSksPmHJsVB48tvcEELor7rJ4/y5Vjp5LAEq2AL/CrFq1WE9AB4pRz1t
	QIG78hxLODvSGBAV9hJHaPY301ws6/igzb9dhkY3k3HjZJKB3GlCgpGdbCyEgf9tX
X-Gm-Gg: Acq92OFoCrbQDkgFkWxv2BP11wcPOl1Nl3dg6ysbWGWGxRdnQXtmsqs8rGsKiu64/BN
	YCMQGjdWc/gwEDe08i8Y6HKp6iHBvfJUFM8Nc1Q9bOxvRMPrj1Fc+n9VMh2MErwpdskSAL+CHXE
	9v/SzuRhDN8kAwJDrv6X1/YTYRime7x4meHjudpgxre/7Jqk1KzDBnOAzoPElkeVeiahHDAcL2e
	7ouCQKYooJLZaz1aojno87L72jU7pt/mQUKYJPaiZP90vAJfVMcKj225I2fyLUHHA3Eb7M0TQ9I
	CVRyFA8cvAATUyutmQS8bfP8C0sQ59L49aPiloY9jBb07fQnX4BK2gZWdWNlqTmAcTAQJAy9d1h
	8ScymTYCY+iibe8IJC/O0ONEifPgVwvSy0qJcD6xoZhr5b7sPylZEaxWIZ/KCPGbekaC6g1ICGL
	9jOEkZNg==
X-Received: by 2002:a05:7300:bc97:b0:2ed:6f94:9d9d with SMTP id 5a478bee46e88-304490264femr7372295eec.8.1779767198072;
        Mon, 25 May 2026 20:46:38 -0700 (PDT)
X-Received: by 2002:a05:7300:bc97:b0:2ed:6f94:9d9d with SMTP id 5a478bee46e88-304490264femr7372247eec.8.1779767196837;
        Mon, 25 May 2026 20:46:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm9792271eec.21.2026.05.25.20.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:46:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.or,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Tue, 26 May 2026 11:45:57 +0800
Message-ID: <20260526034557.1669007-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAzMCBTYWx0ZWRfX0FSmnUaCXPB7
 LlJ1Q6dtzz2yLFrhcbpdanjDh842Ozp07Hn/cVo2sEfIen2kt9ZXnPGN+pr5vBVePvUqTr7vO2M
 rPEcnQPJl10gRGf96O17NoOwZcFCmtPUo3bshelPzvL7n/y+GAvKNBALXR3C+nDMxUHb3EH0EaY
 QrNSR4uABV3mSJxwzr63tFp1wjNIDTRIN4ThGRv6Q9Wbg5nbH6rWSWTMj3r0PvkCcCfS22+As18
 F1kmd07YS2/frmwxQgdhyZgUyNcqSqM0kqHXuobcFykZNLT5OMEN+ZmAoXEJ7bG+Nyb6uyLSjdp
 viYTIur2oJ9EdZx0lxEyru/Mc1bqwC26ahYpdpuKUJbmWVF5DCtskb3lH9mWFPcJEn7ysCh+9ih
 bjrlHcxddgixPwn0byWRtEz8n7y01ZS/1qaz9bkDQ5zLuf4zaUzSQ73M5kL8bYgUpPGhtXP68cF
 CL/nMCHzAzxiiC07w2g==
X-Proofpoint-GUID: U8CPxERBcGOfwxmxFRewjj7gFWUq12zJ
X-Proofpoint-ORIG-GUID: U8CPxERBcGOfwxmxFRewjj7gFWUq12zJ
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a15179e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TKQXpbtUPQeuIP00yFIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260030

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts | 306 ++++++++++++++++++++++
 2 files changed, 307 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..2746fc29c45d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..d429de313f24
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-sa8797p.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,sa8797p", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pm_kobra_thermal: pm-a-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_0_thermal: pm-e-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_1_thermal: pm-f-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_2_thermal: pm-g-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_3_thermal: pm-h-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_4_thermal: pm-i-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_5_thermal: pm-j-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_6_thermal: pm-k-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_7_thermal: pm-l-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
-- 
2.43.0

