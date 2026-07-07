Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7541229E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427986; cv=none; b=ev3pjastOp0xomqtlBay10eOpPeiO/7mX/WXFUUBNYROf1WTWbUA8zdg0CCg1GBI+CKeSsiFI67XtVDCNgE718wPnSyLzF21CKwkAsyCcU6Z1FS/RbTGkkhwdO5qnWOcirfCYyTB+01mt9yWmsuuSHbWk0gktesQ9NvUJANshAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427986; c=relaxed/simple;
	bh=neBtQNse/ecsziDxpxfBl0a32ezo9CFgc0jRzYaJAY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNDDcHPFztBDaJEa3XCIIj7GnK0J5GbE/JTNdY8GykQse/O0BfjEghF1n8ef0EzK+SG5zysJtVED0QAYygLmkuq/l7UJBMcSGOHbffeqan//SGQFs/aA5Pv/+/hawxgxQkOXqbqRXWU8N7etLFkZfMKj/FQsA1gTItqDRET4l2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/27N1KZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN2rAm9D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/27N1KZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN2rAm9D"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8fUt3606110
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 12:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a9hprayaUcC
	Zzvmd2wG6Bvw5gMa2j/pZQUw6jFuYCt0=; b=F/27N1KZft/4kbNTGEQCWzZdVvx
	d0BSVpnVthtd2XuYJui7pm5T4GHS8S705WGEaKMRJ8tg4XmP15TDaVv56aZtGOV3
	OFuTz3y9xhaUIcxOhY3leBPYVB7wWsZMSfVr55Qzl80miYTnNRidY36nnirwDMVO
	408/3EVdgv2tS/nhRX5Bg5RWaE5ioWD/XS0zvi7hTmlxg7b+i+OgdV1vq54/yz+i
	t9BeG5KcQRD5WMpn5uAxt/xupsFaAWju85ZIZLJ7Hodf4ksPRjuP9EN2LmUfxFPj
	vu53bBGvyMgxbs8/uGg7lDjSyiIR6dl4a3DPhWWiom5yp41pIWMdDv/7L6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j056-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:39:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efc093d7e5so48307586d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427983; x=1784032783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9hprayaUcCZzvmd2wG6Bvw5gMa2j/pZQUw6jFuYCt0=;
        b=XN2rAm9DuONtLTMfK54KgByjJ6lOe4w7CuT4DQfMd0rjmfPcmrb/1Rj8QazHcoFIVt
         GQmZE52fvukiI0EEST8MZmkXsL+hqTYKmF6g2FTCUedSrhpeNOtfzQhJO0/EKoAv7XUc
         RN2Vqqh4xaiaCL3FAMEUFxMRpmax0pRbRczqLKGE/ts4NQFIDSJ2P055WV5XwM+Ql4NE
         b6hOJK0lBYXinlzDXQ/1JywypYvElGmuXIfJw1oDs/lrufAZFMGPRyDpJqW6URB+MvlA
         hLMTDAYQjokVuNXd3Yi9F8pIFKw115J+PE4dK1jp9s1JoaE+o/RhPKOy0e5/ZIK1G4zj
         zxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427983; x=1784032783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9hprayaUcCZzvmd2wG6Bvw5gMa2j/pZQUw6jFuYCt0=;
        b=H5vLBZ/LnroKFlkKnAbaGLjWGVCnhzYml59AsYEmp+zE8oBgSG7JlXzw/Pl6wEMxOC
         5zYLgOY2+AEOpw4fAkzQGUapUd8BZDi7JboUcvn0e+zBue7aQU6NL3g33Fy94z3NAyXF
         kvPF+E7x5URgNk6W4m3/5GwCaUyJZLgVFw6VVstpE9L19W25cr0gp8JD31vQY49PFqPj
         dOhL9JYoTmnSmkVCsFzIL2VS742Ut8C94Ce5HhgxhzHL33RxHJeAweerhL9e0iJZeeBY
         ESczUXDqwWs5P+wczmTbqRfW1eLZweQmrt2zgkMygT9IvIBnmJYTTylWrPj4oHX82Dwi
         LsBA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5CZ/8eUVFDic6S50KWaLLtKwfqtG82P7+GcGbtOJAEPClpE0HOtpOiuO9HiZiz+XDZO9qMu/LSq25@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfMUBQvzXDR/RtrqOcd8U3Ez/5fX6ffNtr4KrRzgcjNIs6TNC
	lHGNpIfO/f+6inlT/3D0C00aUUgHkoyDsgp4v4AIVNRgg35zBqFE+gMsdbwXKefXfjPIpsCU08S
	E3Txq9EwmNqtsTuJbmfzctrDXhVi7XCzb5dx6og6K1UZ1N8C7HyTnvb65gPzGOAOUOneaiv1G
X-Gm-Gg: AfdE7ckRM4T0UZ4Fm9d075lpO+DOf+vbrHhRgoMrFtxeT0A9EaQL3qD4KiHk0jJY5UW
	ON4MDzHDPJKUFGP1gDwft+nogT/pWMQ24clpjBD4ildmp0r/211YvJdfyE+Ipx9Uwkyau5Dca4G
	fqG0DfeZxWJU+gwt0KjRL18A8BkNaJHGEraYNcFjAiF58YDpKCCoWzqUfIL28S9GrchCOhlGxVQ
	Ge48PfHRE6APFT8bEvCuzJdzrw6CSn0h3OE1uuVanguXsnBcFXEo20cN8i7c4YLr5j6vMtXjL83
	LBSSrPKbb0RcXvTmMHwCpBrC4CU6XyALLwUexe6XbFptKL7Y4C6YXavwPRjyeRp7h2SdOkw81NN
	n0KhS41EIKcO7FY9pWwgu4OQtQK4DUIfm1DwlP5TltrKPY8W7E41XGtOIauONqz6b/DbmCVo=
X-Received: by 2002:a05:6214:519d:b0:8f6:7335:4f9 with SMTP id 6a1803df08f44-8fcb54d299dmr62408396d6.39.1783427982454;
        Tue, 07 Jul 2026 05:39:42 -0700 (PDT)
X-Received: by 2002:a05:6214:519d:b0:8f6:7335:4f9 with SMTP id 6a1803df08f44-8fcb54d299dmr62407876d6.39.1783427981879;
        Tue, 07 Jul 2026 05:39:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46ea3ff80sm159724616d6.15.2026.07.07.05.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:39:41 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Tue,  7 Jul 2026 20:39:02 +0800
Message-ID: <20260707123902.3868016-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX3FgINpwP02NX
 w9Qth90zP9HAP3/BGhRRUHy6OBI8Birz1qAs3p05QD1m6Nrl17am31wHGfZ053HcNlZo3bp9kpq
 HXdIBDP9UPh78GSLXKRKu0xrKBRRuQF7k4lXBftzLf6cYNnmxT7sPjWiX6Sw1Cc9UCj14uSbxZa
 5Gra/XEVtfLGwVaKMHlOOg2U/G91MWXkrWLz2SxI6HPCpAEvxkoRiM9j+D4cN64k9clJQag07H3
 +bq3Qngq9qDMXp0XndgbMQyj0ODOjhBmcc2TnpovWEjNxr69976vRzLEkQmcngF1Sf9WZ9uIUwP
 T3lAtabxYhXC4M3d3o2Njt1Vzb63ASlcS9ccnZCI9pqdVLpqGomt3x6P5akHJiqPV6k75c/sREL
 xW5ltHQZN/ELQDEmjcClvXWVJJOg6XQz7x4yXHDY+wGw7O8/8JxmFmNzX+vuWywT2FKpSoXDUjg
 mlLzO6C9cLCxBoxOscA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX/tH9nJkEnNR8
 SKic9ex0qgliwjlvk8gSmqIqWB1MCirJeJsqz93U5JPuDrTKZx7FfzURUWK4T17AW7JwAmpHh4H
 tit28tHLEZpbz9PFvB/fENolPcRh0ik=
X-Proofpoint-GUID: _eI8QzxojOCXPMeQaHKlr2mF39vNDov8
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cf38f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: _eI8QzxojOCXPMeQaHKlr2mF39vNDov8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070123

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
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts | 240 ++++++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb1a99a3e01c..8e6ef4116146 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..d1c28698a970
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
@@ -0,0 +1,240 @@
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
+	pmic_kobra_thermal: pmic-a-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_0_thermal: pmic-e-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_1_thermal: pmic-f-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_2_thermal: pmic-g-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_3_thermal: pmic-h-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_4_thermal: pmic-i-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_5_thermal: pmic-j-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_6_thermal: pmic-k-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_7_thermal: pmic-l-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
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

