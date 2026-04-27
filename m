Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40331D375
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257342; cv=none; b=nIXdCmuivT59yc60c4LgEtK/0qchD8EtXC/U1ElI/MC0r4b5PQTQD0b+u17ooXf/WTGcyTv2KKFK/UaMUkyE9mkrXwqf1RLXahLwSiPq7wtk/f1RnVSi/+6bLHbgKyIkGNnV+rTnDLXEAnk/PkBo6F2xLxDw5blItNww0GNW/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257342; c=relaxed/simple;
	bh=fqpkC3HGYcRxLFasJdUV/LyMtMln+CVq4520DbGBQOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC1VbT3QP+BXujoUsYfZ2ZMNnbob8l31NIBKuC/h/JeRGWy2YeEDRwp9aWxeP38ZrkE0SnHdeDaO0aVyH/RMq/aKXTAtHORstNCKAV/ZZ2ZUJZPPNpR+OfrYAV9wt+bjkJuoN/QGWXvFuPOIyXJnWpXIhED4qM4pXRD4PBxyxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flR74ZDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sqz0RWuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flR74ZDu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sqz0RWuF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKqaQ0289376
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3QWztm8lKBf
	nwoRa6+ip86yvuMd+fG19TXVJrPocKm4=; b=flR74ZDu2QPd5KYrMjoCUMOK+OO
	RH3yMXamHOcnKWZQqvO1+e5KyiQJOi3Nn3aUjL2XcZGRg9pSV30iN4FVEaOtvsmZ
	2gLfZbIJ+VQTRhteBM5PnElXJ6kKmg+YerJNASQOyGvCj+XW7U1+Y7CV1zUfsN1K
	Bxl6v1XA9QG7M3WZR2BF1alP/svkXcyt/aQAR9rnwj3u/07b/yP+8/9DCsIgg8no
	zpRAgbgtaN1shOvw80P9Z+v6lKG5HBqatvpC3i1UbO9hPG3zSJqhWf4+W24wHrN+
	xtPzncWe545xi8fou6f1SLl7sK2Ur/TD7vbPA0tbmYNYRl9aVMhUuc3bITQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9bx4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so11438572eec.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 19:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777257339; x=1777862139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QWztm8lKBfnwoRa6+ip86yvuMd+fG19TXVJrPocKm4=;
        b=Sqz0RWuFPKeJOlCWEDCFzuEp+Y+oWpNruIxcomIRIT+BI9lSxVfPKVCYlxWx1ffvyG
         Dt/JhmZAIDDjOVtdyPNquQtgFESc6zzdH8tamE2HTMxq4e5GK90EglAwdb5Ab8lf839d
         Vtkp+ngAoWzn/L8jKU1XYxwv7+2ensGNiew0i7mdJ0I6udDTRBoa76ufDUyLLs+/Xiot
         sbbJx9jmPsUu70jPllVMJhT1rJkFeY5QG8vVeZTTz/pkPxUQcF0xlncH6R69RmYBXCzX
         Ck7SktZyyA1PJ8PVEpajpbN5oArvpUZaVV1r3NfZRO349q2GZj2S63tR1Ctz+nOLyth8
         /wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777257339; x=1777862139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3QWztm8lKBfnwoRa6+ip86yvuMd+fG19TXVJrPocKm4=;
        b=XFqTFo8N322U3BukHdO6DpKi0eq89QrPw2s8IOApyxOVQiq8BH2luQThu5OL2jquzB
         9kWgBnNXSUevAii/VRTa9gH2DxChlZOwY7avQA1vBWC+SiQO50Tu8t79c7G8fL7GrFs6
         vCZ4yMrCtsQwW67xV1s8Y/jxsO6o5xJJtc9I0XXPHUDm4QmoKDb7tx92r+WM200UkIkl
         N+raS1l8bA6fa5Sf/5c8vf3iZVahD0cgHGjtE4jk01t7vYSwevA1wEIoUcD6hfJTU5kW
         75rXdi43ykusp/Yjwf3nGZcD/5qp7c86RU5NRLHiSzDfi6sTZsQUTUdE6udd+Y7Vkat5
         V59A==
X-Forwarded-Encrypted: i=1; AFNElJ9kEcHB4ddfuDwnFXobqe6erB1ZGG838Tz2jt54JlBFuj2k9oZgEV3OhhQRl1erUIUC4O37akllICGN@vger.kernel.org
X-Gm-Message-State: AOJu0YyeI8cBs5E06ZPNbck57y+JZHy497+jwr5ROgQzABRyMFulO9sb
	aL2qt4iAf8X55XcaKDfwlgkx4dBM4ysKW4CgUiYigYAjHY5suxhpPx2UEoViR77BCt7e6x8McJB
	hFVj8LEBzrvetYFeze7tPjpdCafoY820BqhhznC8G44i0qUQ7TKwHCtg2WfDMuvfS
X-Gm-Gg: AeBDievXWrQiMxD+T6Fc4YTguWx63u57bJftdeoaDIazwsN0+yPX8R6wCbFUwJjdyvQ
	VJ78DsQC5L+PV92bwvk6HiS+qFGfi6g3+9J+/6D1wAFVLQAa/Ip7CBg9Sj03xKpUTUXSkGLkk64
	kAn9onKpQw+JXqvzRRlztbboD5PC19LCqXBoG8TwZXgxbkh1wnkKo81u6HYDD1NMraszRRj5SyY
	7a7uyCDJ3m6Fi3zB/g0hdzAaiubzTuwjcA1k604oCUfYz6imhOOZRcJ3zws3T06OMj9k9D7s6lq
	Rjc+paHX05kk/jT0Qn7NTB6eGTzIzJxoevfC78zlYZ+Cxdo9aflQBUDPqRGSnlv0xpuVBs2SmD7
	/GsjCynX1DMHiyJ/2c9XTckWMywZx36hXE/D9PTPf/CvecpNfwhXmVfGma58SgvjLVZI0nAHmu5
	sOWV9CY3exPcLjnug2
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr21848843eec.16.1777257338788;
        Sun, 26 Apr 2026 19:35:38 -0700 (PDT)
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr21848823eec.16.1777257338196;
        Sun, 26 Apr 2026 19:35:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52916316eec.8.2026.04.26.19.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:35:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Mon, 27 Apr 2026 10:34:55 +0800
Message-ID: <20260427023455.236410-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qbHHG66UCeE9TA6HAhIoCinFCnTSNUh4
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69eecb7b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MxPmow6BhT1dHFM3JRMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNiBTYWx0ZWRfX+F1kI4DuPdRz
 Tk7/fAQx8Rd1gTnAvBX52Qd6UL+gYfQY7KjFVUxAnGuaWxyIrmMkG/f6nRG1wNy7uSR0VNCaDXJ
 ChGkjdWjP1oVCcxy6Bx3M3u0bONYsx0G6Kr8r+4uqs4SkubwIyjJKBXjauPWoAI0ehvTbY1ofSu
 sfSmEAjJVN+1Thf3S/cz/c9wntMhzwCQ4QvSdqlNhPb9Jfy3iOlNQgH8Da5nhPG8Whny/EHE6zo
 REjJLa59597CgmEEAYz5fcy6SxG5RjlKNEBfRcLfphk6rbHzuU+OTXx0TZR28k71/Hkesh78Hd7
 NrcRfHTt51BFtg6XTloqlhHd4PJLB0w5sjDoeIzIDsUiZp9l/FsJcFJpx8ro/MHaCwSjmkoLS7m
 lWy7xZAAZzIYuCr1+AWoccWF8F4QQZ43Fag2lqtWWpU+ysivP8NdJ64VfaCXKxAqV3UuqetJpfA
 s7Gdq0CJLOOryajfp+A==
X-Proofpoint-ORIG-GUID: qbHHG66UCeE9TA6HAhIoCinFCnTSNUh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270026

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
index 4ba8e7306419..b329678e04e3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -212,6 +212,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..2eab2c6fc173
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			pm_kobra_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_e_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_f_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_g_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_h_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_i_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_j_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_k_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_l_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <125000>;
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
+				temperature = <125000>;
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
+				temperature = <125000>;
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

