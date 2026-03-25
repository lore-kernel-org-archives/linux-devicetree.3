Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1A2FDC27
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437619; cv=none; b=uKV3O8P5uUTG73v5izmiZCCB6Q6PDQdpoWG7sbPUsQ3I4j3WSonWCP6W8MidywejDUySix24p7shlad6eveBsaDgPMrBuXG+ECrU7Z/RONNXfiL1WwCvSFdNUoYbJjv239mA0ZY50bigoCvJ2plJ/CgMZBAWruA+iQ1Juuu/Vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437619; c=relaxed/simple;
	bh=PjslLB/GbcgsSodW4fDgHrU9aZkQCqY0rf+GL6i5q/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BhiGRa1bV2aDRGr1YwU639xR/FdsKNl+bRXuXNNHt9TwyEafjSji7Mo6T529KQXQ3rzq7HFQAuoc9p8xg13ogE1wolgSbxpgTBG8sxrUrw1KO+0C6oaZlau8SG/z/Nj/MJS+F+kOhvJsJO103LSv1/Ce5/Uy4PWILFpC3kHqV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eaRo5LZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Go+RNbyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eaRo5LZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Go+RNbyi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBFwQ4720345
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AkiAZ6h8OtSPjYVRefLK3n
	rZ0DYlkD25XClzqpyMgCM=; b=eaRo5LZ/5cx5q39wrRL9QPzmRkMKLrhWbWceof
	4GALgqJuoeYd8DWEBQG/189Hf0o4RaVPPZD1lZzjXkUDX5PmVrkHnd/qocqGotXY
	NVMmA6TM2ZB2VVjV33/932AwJVtPcnqzK06Tsxkh0WKblwXIGXIDhQtvR5ByD8mV
	0ERDLAEFCyZDiej2DSU+kMAzpMXorkjify4lh7iCgfwt2IuxvJadxhugMpFkpGX+
	3ecqbs8Hevnrzc/x+6SyhUkW7YrNUerLhk6HyE/7scEur2Zeh82MRDm/Ouh+ETVH
	4WMj/uElq2VGAkcvzqhxdlq5Md/zl8Qjl8AKZojnAdcoa26w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2r93h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:20:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b96fbfc64so23115488a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437617; x=1775042417; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AkiAZ6h8OtSPjYVRefLK3nrZ0DYlkD25XClzqpyMgCM=;
        b=Go+RNbyijB7wfjogxsR/+vkAqxB6121HVBSUTLZapndu8iQPcOpU+e3nMKDhKuEnVr
         ChDcbQitORG0jBzQBM09qC8JRuhspDZwDAAwUpEyZGJrLjWKNCn0/BD5IabRMA19K2VM
         htTMeleuCPmxjQT58DBVerkQPqurDJ65zaxd3kqEK6hlXEcx++LgaG8+3y29CymX50Pf
         yHJkEZl/sf8x5ic6t6O3K/faYLamPyNxetTSXrVONlN6khbk4t5vsT4Vi99a6ys1HV9U
         HGbm294rGEjCicbuVFSCI8KQ3nv7u3rqMS8mx7EEXZGEJ8X+CEZmqfhFChy77hWnH4+r
         XMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437617; x=1775042417;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkiAZ6h8OtSPjYVRefLK3nrZ0DYlkD25XClzqpyMgCM=;
        b=jMPNSzfulQffer3btZlyAkxyJWkDvU+XYfWslg37bTnB0glkg+mRHyXwTuLJk6jXwC
         IzovMijkc82mCSkouAd85J9/4vX4+GNClP8EVYKdar7f31lVxV0Tj4j0h/8JK5sM5+Gi
         PnlR72NeUCzu9jSxiX0OJEmHsKdDZ0YMkRxPvgpuxOJe0+5vVPMwzrGX6OAxOb04rh+P
         GYMoVi4BuZm5OwOupmqJ2+oqtZkblx7VvJqCBBRikAlyzoQQGefPDtLc631cPEivAsGG
         /dMGF8q8GAxlu5A6BE8kJcf6/LNjmW8964Kd3U9LnJftNGrmedPlcFDEWBeur4ueAvTF
         QFbg==
X-Forwarded-Encrypted: i=1; AJvYcCVx8HNF+KPo+bFRFjAtWTJrPUdBDS5TCF60li3/ykOVFk3iB9jtfbuRBFwbCLdAWjRS0TLE3Sk6fuEh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gu/Ge4lmXBIDoyNMdvpZGAV7A47rGuBXKX+TKoez1CtgiUf9
	Q+/t01Ut78veWdRN0jNwpE0Og0PV0CzOBIVhf29ylWMZa7MD9RANIC3IEAMoyetAJ5/dJaeSdz9
	IRaHOe3qLpZCQNXj2FVwwV+OIPiPeUO7dY4t3aJSeI72mF7sMpK9wHl7krcrk3qK/
X-Gm-Gg: ATEYQzwkI/3RmFGOJOuZkEYbrcx3dahn1poF7+LmGvRunpP/bgMzJWFoDck0wqHWeMd
	j9vHrCRtI6qXJ7nkeXqION+bcB/jchg9TLcrGJprvxujKr2i0YQYz0951epK7YMuXgXLVLWr5F5
	ySVuA57b9COLr3/vBrIADC/Yp9/TEKDqg9GXDz8Z/fJCjT75yyhjas35IuXU75SVCXLvwKZB2b7
	qQDvCTtQa5TKMAOhxncIQR9fOho7e5WOUISrdqAKbMaTzdBG+J2p2cWc1sJZLZk31AeHLs6rz8j
	nzxZbcBfCjALaKiUx9Ubp4DVBBemNxhAQB9/Xuvi3oYlIWSXZVmxX+v+1BcoXm8uuhc5QIncLWH
	yushaM4/7q29NiyYOO4ABF7r1FKIm2PB1o+4VFYTu71WI4a7bkIQ=
X-Received: by 2002:a17:90b:3fcd:b0:359:fd9a:c513 with SMTP id 98e67ed59e1d1-35c0dd6ea20mr2843431a91.24.1774437616453;
        Wed, 25 Mar 2026 04:20:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:359:fd9a:c513 with SMTP id 98e67ed59e1d1-35c0dd6ea20mr2843384a91.24.1774437615795;
        Wed, 25 Mar 2026 04:20:15 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a818114sm12253810a12.12.2026.03.25.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:20:15 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 16:50:00 +0530
Subject: [PATCH v2] arm64: dts: qcom: sm8750: Enable TSENS and thermal
 zones
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-sm8750_tsens-v2-1-8a554e54dc1b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN/Ew2kC/1XMQQ7CIBCF4as0s5aGgrTiynuYxiBOLYkFZSrRN
 NxdbNy4meSf5H0LEEaHBPtqgYjJkQu+hNhUYEfjr8jcpTQILlouuWY07TrFTzOhJ6b0oFG28qx
 1C2Vyjzi418od+9KjoznE96qn5vv9QY38h1LDOBOKD9bKTm+NOASi+vE0NxumqS4H+pzzB0xw2
 zqvAAAA
X-Change-ID: 20260309-sm8750_tsens-59f9e363b996
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aastha.pandey@oss.qualcomm.com,
        dipa.mantre@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774437611; l=18490;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=4jWUxyH4mMg1bhH12ZVcKvZjbKQZEeBpUaOc8pEXrZc=;
 b=FU8YlsHsp+5Knrd8UtuDIDaRBEXQ/sHJO0ZU4ubCwqcBjUMVVL7Aopus/AT+s/4IaqIwgrJg8
 JJOZT1xSKcVAgCGSDIAvQpFJ/8MQiE4GeKj/VOmcVrzPgHdmY2HSWv6
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MCBTYWx0ZWRfXx/QKDvAYYvAe
 jWOB21uDwJzqTj00H+hLr5txgT+x30NXaGFNohiJ5Ujk9YCnH72j4x28keAksp7BjGkjCat6Vxt
 bcXuT0I2vVE/ufzBxa9Sh9POwXO5djOqGSrHZjMW9PyRr1CizD/rmAF05CEUqxhPsj825VoEIoR
 /JnYhYXg62chrSFZAyjsemFZBpiOYdjM0gAg3gQsqDXjY9csU5SX9VLqgInK0KWuEt5Jv+8bHuf
 DRyOZ8H5y/oS3N/04ELEaeCdvqlZnkQfby/Eq7vaNVCHZQOUKiFD/SQkG3LXG7dWm8KDLbVrOx7
 j9uOGZl/RlYzz04wr5h4TitF/0e4QA4G6ZgPx5jkyxiS3fIFoNIUO62CkxRf4WffrBHHo9ly/1u
 yJFEaKaPOBJ+jio8dHFzh5TU6LRBGEqP4gY0kXlfWi2kZzq1FtxR/0pDW5F8pvZqKznMidpdTQU
 WusslPeaOjUVhV//lgA==
X-Proofpoint-GUID: EDO900BIZ-gEw5yQto3TZr4_zUGQFoq2
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3c4f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Vhz7AfH1-bsduPmLJRsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EDO900BIZ-gEw5yQto3TZr4_zUGQFoq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250080

From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>

The sm8750 includes four TSENS instances, with a total of 47 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 130°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 120°C and critical trip at 125°C.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Fix tsens order in device tree file.
- Add R-B from Konrad.
- Link to v1: https://lore.kernel.org/r/20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 897 +++++++++++++++++++++++++++++++++++
 1 file changed, 897 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 8b1b51558dcb..18fb52c14acd 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -3447,6 +3448,54 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c228000 {
+			compatible = "qcom,sm8750-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c228000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <15>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c229000 {
+			compatible = "qcom,sm8750-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c229000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22a000 {
+			compatible = "qcom,sm8750-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22a000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <16>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c22b000 {
+			compatible = "qcom,sm8750-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22b000 0x0 0x1000>,
+			      <0x0 0x0c225000 0x0 0x1000>;
+			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <9>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,sm8750-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
@@ -5893,6 +5942,854 @@ compute-cb@14 {
 		};
 	};
 
+	thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-0-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-1-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-0-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-1-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-0-0-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-0-1-thermal {
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-1-0-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-1-1-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss0-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss1-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss2-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss3-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss4-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss5-thermal {
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss5-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss6-thermal {
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss6-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss7-thermal {
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss7-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem0-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				modem0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem1-thermal {
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				modem1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem2-thermal {
+			thermal-sensors = <&tsens2 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				modem2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem3-thermal {
+			thermal-sensors = <&tsens2 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				modem3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera0-thermal {
+			thermal-sensors = <&tsens2 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera1-thermal {
+			thermal-sensors = <&tsens2 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens2 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss3-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx0-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx1-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx2-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx0-thermal {
+			thermal-sensors = <&tsens3 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx1-thermal {
+			thermal-sensors = <&tsens3 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx2-thermal {
+			thermal-sensors = <&tsens3 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx3-thermal {
+			thermal-sensors = <&tsens3 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			thermal-sensors = <&tsens3 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				ddr-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260309-sm8750_tsens-59f9e363b996

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

