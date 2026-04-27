Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1583DCD89
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309521; cv=none; b=YhlGgq3liXq9mYKPsSNlV+LuOtM7AJ0Be4jCuPMomLbtcUtz6BsiL2A8mC3bsdbzUcFVPg8deBNCIkE15IJFlt0mo6LBsUqxrEFsruYnMdgXyZ16L6fn2ZkxFSVFH3LzOu29/30fIMH5u0SYP4wHOS8sFiGZwUc9utWbKGxA1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309521; c=relaxed/simple;
	bh=Pxs6TvCiWB1lclDikjkVEgwp4wfuL4sI+9FNS6TIgz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L+upSHEbSmVaAxl5/2AtLau+Ml00Z72ZcjpyB5xZk20Wcjmon/dGnMm6i3oqi0A8tsdE78E48Mau/QFi43ATFyumiXzL1YS6yguZokhe5law6yyhmGxkGV+3gEUCwhf1rGrhyInWKmEKjP9Cmm7aZ+JH6S7dnVtU5AiQt9BHA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVw5UNdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoRfXWwY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVw5UNdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoRfXWwY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RH3lKm1237213
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HKoHw8eDH/l
	flkddWt/ea5hWynNE/kZX92C7G/ZMMwM=; b=RVw5UNdgDHa+oMkBsVZONAk5Us5
	S+6pmX9zzfWCgcj9YcqarsmuPd+D+GDzm3mZ3Yr+uwTJCqa2qRr3i/UU2qFotYVp
	HQl5D4laeYvFQHMWal+0YfA4p8JpyVrLfoGCbFrG6YPHVj3DJ7Hy7x09xx07coKF
	AqoxE8VupZybxKMt+gbgm1NySUxqxhxvjrTatZHmx887nXqE0kPAAW5nxoFgxmNY
	POz4tHQril/JP+nXhbAJWmn5+kyeMiJnEvMHZiYw6lXIwf+QrAmIE8Mn+owV+JiX
	2/XT8M36hL1HDXftJrugf1Tlm04YcCg5+UgFtmmRBgC829MvpGeEvqUiTJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4hagu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3586513febcso4610285a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309516; x=1777914316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKoHw8eDH/lflkddWt/ea5hWynNE/kZX92C7G/ZMMwM=;
        b=IoRfXWwYgcEsV5dKOUxLqyQ47ptNEZleyuUXS03Q0xgWTqKuulB5g2B5LY+7iH7gMw
         I8T86AInVtxkC6JEVkqU6j53Jc1Flc1hboTzarUEp2xGqWi+oZwkDSzebu1E3eAvo4JR
         OB4tEIyU1UNoSGWrwdW0eRasgVZ8S7jtZFvntHMdLSb0Ej+ytPngJEd75DoO5qj5SE5i
         zCphZNkYOjpIaykU3Jlkz2cUCnwvdDfIsoKrhdFs27/u8A2+nh9wOfSn+urGGE+KNNlA
         qRkNUMN4cML/L/JMhR3KH3vlRqJMXxdJ7QNmx3RBZfglFVt6ATmtLmy64KE55E8CY5uQ
         MRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309516; x=1777914316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKoHw8eDH/lflkddWt/ea5hWynNE/kZX92C7G/ZMMwM=;
        b=qXZzSs9ZE/VO1gDRR5vsjpLREk2410TIYxJ8dLeKoWBf8oehxsbNYhMnCpmRcuirAe
         7SfAw3PvBHQiZsoXZhd44uoDWWtfQtq5TmDIPL4OZKQgWAXc95pkDDpOib7G/2en8Voo
         tqHO6lNEoAd+dhyEp+jtapDaOztbBiUhjL2840cUKndlhw3XpFA70ktlGdMqMJj9K7DT
         LXiu2kDUJcQAHDpJEx0hQyH6aDIBnEWejxS3lYZo/NNnE0s5im+YPxsEtd5ndEqSn57z
         U/zuOZ3CGcHj+J/dTg8jguEoQBbJcs+BvZi2JkOoFlJ/DcUT7PWrDim5BQcZN5i79v7r
         7dyg==
X-Forwarded-Encrypted: i=1; AFNElJ+zgcMUdU5lNgRxkpkQcFTxAL7pU9EEvypiJwcigQ2BceHLTjtm4zTSsQBb5t9jV2BakvLBu0+Mzl7N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm99CP/DKQlkuHUL/0Ckr5O4BGp8viNImsNj+qWqreOeKKfJNC
	LNX+svu+DV5RlSfk5ilClfNno0xIYVKMHpDrypk7n3hdBBsq0ry+cpETRX0BB8Zty0Rpfu5MROC
	jOqkULa5nZF3JDpfeOXAGP0h7a37aImkwX6S6ntTh7/L8lGiKWBvCXDDSxWA1IHJa
X-Gm-Gg: AeBDietrN63/xEeSUhou+gWc3nlabI9G1ptOgGlSfZKeHNQwbOZzf5E2+0bCSUOVV4z
	XZPmvVRpvRkMi45/co/TfpjjQr4p6WaQ3p8lbNQeCZPiY+EkVA426A11eFwyiVLQGOV/HIsL5FV
	B1V6JwLBZCqOn2E2GvzjP9I0Gubs60MwZ+n5gCjhMSkucqO8/RdozjjMgXLLy8o7tMmO+q8HycY
	kj4LOxdabdsd6s86x4MN7j5lWJyu/E3uhtyLppJgNAKCOhc42LEf5WyDd0bpnkry3zivEHY8t82
	mdERZLyTJEz4FlK9B8JWU/f6587RNr0p8pI6S5eKJwPeFUCo75ODZhCUEcVtMLQHTdyzaGqm9AI
	z0Z3fuQpNoBRUtgfidGr1bDpKA1yjmNnOYCl3MJtTORNYZ+1INqc15BnTx7PcCZw=
X-Received: by 2002:a17:90b:1fc7:b0:35f:27d0:23b5 with SMTP id 98e67ed59e1d1-3614047a9c8mr25569231a91.5.1777309515502;
        Mon, 27 Apr 2026 10:05:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc7:b0:35f:27d0:23b5 with SMTP id 98e67ed59e1d1-3614047a9c8mr25569177a91.5.1777309514649;
        Mon, 27 Apr 2026 10:05:14 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:14 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK hardware into shared dtsi
Date: Mon, 27 Apr 2026 22:35:02 +0530
Message-Id: <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l3vS3kTEORnGRzV4wyaFFw32XexuFXjb
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef974d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=m4GvGgdk-pu3HkIto4AA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: l3vS3kTEORnGRzV4wyaFFw32XexuFXjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfX4rGVNEtIOBei
 KKQrMO/L5baw9l14jwJnzskmfVEwyhwBNP/lcioP9tNZfWfE15cuSxhji+nGFAKynC/bt4w7YOR
 r3PYiw+CHjaKbOJj+1lKbKKNaqvB1Euj9WT1bT1VGYrbXJylqaQu2FDAOgVzwkbvqrJdgg/hvpH
 sEMXNFhcNdF1fyaATDuVaAGcgr8YXiRiSAbbZFqZVxmf3nj0kPmIzoD/jovKmF1uMzXA7bXx1lU
 kf5vjSOPAIgSmOdqsSwLE/Zk9E2aRFr50nN9TaVEbPkDlMYxOtFcGxxHYhj+iustTshCHsqTdU2
 ZNtxifEvfE+Fi88NB4P26uDe3+vyWOVpuJHJCrjwVJv/4L6CYqSwFTS+pb9pMeWu22nbTV+81ON
 /Lw06tGY4W2IFKx8uKWk7Y/+RxSWDZyKmxsaVcs8XOq30NqdVt7/Dpr8THMWdPOxr09uF1q+JVB
 /sdLDvFQYykwGbLmbPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270181

The monaco-ac EVK is a new board variant which shares the majority of
its hardware description with the existing monaco-evk board.

In preparation for adding this variant, extract the common hardware
nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
include file, and update monaco-evk.dts to include it and keep only
board-specific overrides.

No functional change intended.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 900 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 894 +----------------
 2 files changed, 901 insertions(+), 893 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
new file mode 100644
index 000000000000..12c847c03757
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
@@ -0,0 +1,900 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &ethernet0;
+		i2c1 = &i2c1;
+		serial0 = &uart7;
+		serial2 = &uart6;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector-2 {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+
+		id-gpios = <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&expander6 7 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb2_vbus>;
+
+		pinctrl-0 = <&usb2_id>;
+		pinctrl-names = "default";
+
+		port {
+			usb2_con_hs_ep: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
+
+	dmic: audio-codec-0 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	max98357a: audio-codec-1 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	dp-connector-0 {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "mini";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp0_out>;
+			};
+		};
+	};
+
+	dp-connector-1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "mini";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp1_out>;
+			};
+		};
+	};
+
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
+	sound {
+		compatible = "qcom,qcs8275-sndcard";
+		model = "MONACO-EVK";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&mi2s1_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 MI2S Playback";
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		sec-mi2s-capture-dai-link {
+			link-name = "Secondary MI2S Capture";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vreg_cam0_2p8: vreg-cam0-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam0_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam2_2p8: vreg-cam2-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam2_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s5c: smps5 {
+			regulator-name = "vreg_s5c";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <512000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy0>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
+&i2c0 {
+	status = "okay";
+
+	bridge@4f {
+		compatible = "lontium,lt8713sx";
+		reg = <0x4f>;
+		reset-gpios = <&expander5 6 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt8713sx_dp_in: endpoint {
+					remote-endpoint = <&mdss_dp0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8713sx_dp0_out: endpoint {
+					remote-endpoint = <&dp0_connector_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt8713sx_dp1_out: endpoint {
+					remote-endpoint = <&dp1_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&qup_i2c1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
+		};
+	};
+};
+
+&i2c15 {
+	pinctrl-0 = <&qup_i2c15_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 56 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 95 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
+	};
+
+	expander4: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 96 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander4_int>;
+		pinctrl-names = "default";
+	};
+
+	expander5: gpio@3d {
+		compatible = "ti,tca9538";
+		reg = <0x3d>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander5_int>;
+		pinctrl-names = "default";
+	};
+
+	expander6: gpio@3e {
+		compatible = "ti,tca9538";
+		reg = <0x3e>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 52 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander6_int>;
+		pinctrl-names = "default";
+	};
+};
+
+&iris {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&lt8713sx_dp_in>;
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcieport1 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+};
+
+&pmm8620au_0_gpios {
+	usb2_id: usb2-id-state {
+		pins = "gpio9";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&qup_i2c0_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs8300/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs8300/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp {
+	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&serdes0 {
+	phy-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&spi10 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio5";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio6";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	expander5_int: expander5-int-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	qup_i2c1_default: qup-i2c1-state {
+		pins = "gpio19", "gpio20";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		wake-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio22";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio24";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander6_int:  expander6-int-state {
+		pins = "gpio52";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander0_int: expander0-int-state {
+		pins = "gpio56";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
+		pins = "gpio73";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_i2c15_default: qup-i2c15-state {
+		pins = "gpio91", "gpio92";
+		function = "qup1_se7";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio95";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander4_int: expander4-int-state {
+		pins = "gpio96";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart6 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l7a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs_ep>;
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..f01eef1c2e16 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -5,174 +5,12 @@

 /dts-v1/;

-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pwm/pwm.h>
-#include <dt-bindings/sound/qcom,q6afe.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
-#include "monaco.dtsi"
-#include "monaco-pmics.dtsi"
+#include "monaco-evk-common.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. Monaco EVK";
 	compatible = "qcom,monaco-evk", "qcom,qcs8300";

-	aliases {
-		ethernet0 = &ethernet0;
-		i2c1 = &i2c1;
-		serial0 = &uart7;
-		serial2 = &uart6;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	connector-2 {
-		compatible = "gpio-usb-b-connector", "usb-b-connector";
-		label = "micro-USB";
-		type = "micro";
-
-		id-gpios = <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
-		vbus-gpios = <&expander6 7 GPIO_ACTIVE_HIGH>;
-		vbus-supply = <&usb2_vbus>;
-
-		pinctrl-0 = <&usb2_id>;
-		pinctrl-names = "default";
-
-		port {
-			usb2_con_hs_ep: endpoint {
-				remote-endpoint = <&usb_2_dwc3_hs>;
-			};
-		};
-	};
-
-	dmic: audio-codec-0 {
-		compatible = "dmic-codec";
-		#sound-dai-cells = <0>;
-		num-channels = <1>;
-	};
-
-	max98357a: audio-codec-1 {
-		compatible = "maxim,max98357a";
-		#sound-dai-cells = <0>;
-	};
-
-	dp-connector-0 {
-		compatible = "dp-connector";
-		label = "DP0";
-		type = "mini";
-
-		port {
-			dp0_connector_in: endpoint {
-				remote-endpoint = <&lt8713sx_dp0_out>;
-			};
-		};
-	};
-
-	dp-connector-1 {
-		compatible = "dp-connector";
-		label = "DP1";
-		type = "mini";
-
-		port {
-			dp1_connector_in: endpoint {
-				remote-endpoint = <&lt8713sx_dp1_out>;
-			};
-		};
-	};
-
-	usb2_vbus: regulator-usb2-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb2_vbus";
-		gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		enable-active-high;
-	};
-
-	sound {
-		compatible = "qcom,qcs8275-sndcard";
-		model = "MONACO-EVK";
-
-		pinctrl-0 = <&hs0_mi2s_active>, <&mi2s1_active>;
-		pinctrl-names = "default";
-
-		hs0-mi2s-playback-dai-link {
-			link-name = "HS0 MI2S Playback";
-
-			codec {
-				sound-dai = <&max98357a>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		sec-mi2s-capture-dai-link {
-			link-name = "Secondary MI2S Capture";
-
-			codec {
-				sound-dai = <&dmic>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	vreg_cam0_2p8: vreg-cam0-2p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_cam0_2p8";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		startup-delay-us = <10000>;
-
-		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
-		pinctrl-names = "default";
-	};
-
-	vreg_cam1_2p8: vreg-cam1-2p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_cam1_2p8";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		startup-delay-us = <10000>;
-
-		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
-		pinctrl-names = "default";
-	};
-
-	vreg_cam2_2p8: vreg-cam2-2p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_cam2_2p8";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		startup-delay-us = <10000>;
-
-		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
-		pinctrl-names = "default";
-	};
-
 	/* This comes from a PMIC handled within the SAIL domain */
 	vreg_s2s: vreg-s2s {
 		compatible = "regulator-fixed";
@@ -183,517 +21,6 @@ vreg_s2s: vreg-s2s {
 	};
 };

-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmm8654au-rpmh-regulators";
-		qcom,pmic-id = "a";
-
-		vreg_l3a: ldo3 {
-			regulator-name = "vreg_l3a";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4a: ldo4 {
-			regulator-name = "vreg_l4a";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l5a: ldo5 {
-			regulator-name = "vreg_l5a";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6a: ldo6 {
-			regulator-name = "vreg_l6a";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7a: ldo7 {
-			regulator-name = "vreg_l7a";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8a: ldo8 {
-			regulator-name = "vreg_l8a";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9a: ldo9 {
-			regulator-name = "vreg_l9a";
-			regulator-min-microvolt = <2970000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmm8654au-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vreg_s5c: smps5 {
-			regulator-name = "vreg_s5c";
-			regulator-min-microvolt = <1104000>;
-			regulator-max-microvolt = <1104000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1c: ldo1 {
-			regulator-name = "vreg_l1c";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <512000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c: ldo2 {
-			regulator-name = "vreg_l2c";
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c: ldo4 {
-			regulator-name = "vreg_l4c";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7c: ldo7 {
-			regulator-name = "vreg_l7c";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8c: ldo8 {
-			regulator-name = "vreg_l8c";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9c: ldo9 {
-			regulator-name = "vreg_l9c";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&ethernet0 {
-	phy-mode = "2500base-x";
-	phy-handle = <&hsgmii_phy0>;
-
-	pinctrl-0 = <&ethernet0_default>;
-	pinctrl-names = "default";
-
-	snps,mtl-rx-config = <&mtl_rx_setup>;
-	snps,mtl-tx-config = <&mtl_tx_setup>;
-	nvmem-cells = <&mac_addr0>;
-	nvmem-cell-names = "mac-address";
-
-	status = "okay";
-
-	mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		hsgmii_phy0: ethernet-phy@1c {
-			compatible = "ethernet-phy-id004d.d101";
-			reg = <0x1c>;
-			reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <11000>;
-			reset-deassert-us = <70000>;
-		};
-	};
-
-	mtl_rx_setup: rx-queues-config {
-		snps,rx-queues-to-use = <4>;
-		snps,rx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x0>;
-			snps,route-up;
-			snps,priority = <0x1>;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x1>;
-			snps,route-ptp;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x2>;
-			snps,route-avcp;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x3>;
-			snps,priority = <0xc>;
-		};
-	};
-
-	mtl_tx_setup: tx-queues-config {
-		snps,tx-queues-to-use = <4>;
-
-		queue0 {
-			snps,dcb-algorithm;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-	};
-};
-
-&gpi_dma0 {
-	status = "okay";
-};
-
-&gpi_dma1 {
-	status = "okay";
-};
-
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/qcs8300/a623_zap.mbn";
-};
-
-&i2c0 {
-	status = "okay";
-
-	bridge@4f {
-		compatible = "lontium,lt8713sx";
-		reg = <0x4f>;
-		reset-gpios = <&expander5 6 GPIO_ACTIVE_LOW>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				lt8713sx_dp_in: endpoint {
-					remote-endpoint = <&mdss_dp0_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				lt8713sx_dp0_out: endpoint {
-					remote-endpoint = <&dp0_connector_in>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				lt8713sx_dp1_out: endpoint {
-					remote-endpoint = <&dp1_connector_in>;
-				};
-			};
-		};
-	};
-};
-
-&i2c1 {
-	pinctrl-0 = <&qup_i2c1_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	fan_controller: fan@18 {
-		compatible = "ti,amc6821";
-		reg = <0x18>;
-		#pwm-cells = <2>;
-
-		fan {
-			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
-		};
-	};
-
-	eeprom0: eeprom@50 {
-		compatible = "atmel,24c256";
-		reg = <0x50>;
-		pagesize = <64>;
-
-		nvmem-layout {
-			compatible = "fixed-layout";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			mac_addr0: mac-addr@0 {
-				reg = <0x0 0x6>;
-			};
-		};
-	};
-};
-
-&i2c15 {
-	pinctrl-0 = <&qup_i2c15_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	expander0: gpio@38 {
-		compatible = "ti,tca9538";
-		reg = <0x38>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 56 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander0_int>;
-		pinctrl-names = "default";
-	};
-
-	expander1: gpio@39 {
-		compatible = "ti,tca9538";
-		reg = <0x39>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander1_int>;
-		pinctrl-names = "default";
-	};
-
-	expander2: gpio@3a {
-		compatible = "ti,tca9538";
-		reg = <0x3a>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 95 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander2_int>;
-		pinctrl-names = "default";
-	};
-
-	expander3: gpio@3b {
-		compatible = "ti,tca9538";
-		reg = <0x3b>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander3_int>;
-		pinctrl-names = "default";
-	};
-
-	expander4: gpio@3c {
-		compatible = "ti,tca9538";
-		reg = <0x3c>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 96 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander4_int>;
-		pinctrl-names = "default";
-	};
-
-	expander5: gpio@3d {
-		compatible = "ti,tca9538";
-		reg = <0x3d>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander5_int>;
-		pinctrl-names = "default";
-	};
-
-	expander6: gpio@3e {
-		compatible = "ti,tca9538";
-		reg = <0x3e>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 52 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander6_int>;
-		pinctrl-names = "default";
-	};
-};
-
-&iris {
-	status = "okay";
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp0 {
-	pinctrl-0 = <&dp_hot_plug_det>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&mdss_dp0_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-	remote-endpoint = <&lt8713sx_dp_in>;
-};
-
-&mdss_dp0_phy {
-	vdda-phy-supply = <&vreg_l5a>;
-	vdda-pll-supply = <&vreg_l4a>;
-
-	status = "okay";
-};
-
-&pcie0 {
-	pinctrl-0 = <&pcie0_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie0_phy {
-	vdda-phy-supply = <&vreg_l6a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&pcie1 {
-	pinctrl-0 = <&pcie1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie1_phy {
-	vdda-phy-supply = <&vreg_l6a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&pcieport0 {
-	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
-};
-
-&pcieport1 {
-	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-};
-
-&pmm8620au_0_gpios {
-	usb2_id: usb2-id-state {
-		pins = "gpio9";
-		function = "normal";
-		input-enable;
-		bias-pull-up;
-		power-source = <0>;
-	};
-};
-
-&qup_i2c0_data_clk {
-	drive-strength = <2>;
-	bias-pull-up;
-};
-
-&qupv3_id_0 {
-	firmware-name = "qcom/qcs8300/qupv3fw.elf";
-	status = "okay";
-};
-
-&qupv3_id_1 {
-	firmware-name = "qcom/qcs8300/qupv3fw.elf";
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/qcs8300/adsp.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/qcs8300/cdsp0.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_gpdsp {
-	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
-
-	status = "okay";
-};
-
 &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s2s>;
@@ -704,222 +31,3 @@ &sdhc_1 {

 	status = "okay";
 };
-
-&serdes0 {
-	phy-supply = <&vreg_l4a>;
-
-	status = "okay";
-};
-
-&spi10 {
-	status = "okay";
-
-	tpm@0 {
-		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-	};
-};
-
-&tlmm {
-	pcie0_default_state: pcie0-default-state {
-		wake-pins {
-			pins = "gpio0";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		clkreq-pins {
-			pins = "gpio1";
-			function = "pcie0_clkreq";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-pins {
-			pins = "gpio2";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	ethernet0_default: ethernet0-default-state {
-		ethernet0_mdc: ethernet0-mdc-pins {
-			pins = "gpio5";
-			function = "emac0_mdc";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-
-		ethernet0_mdio: ethernet0-mdio-pins {
-			pins = "gpio6";
-			function = "emac0_mdio";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-	};
-
-	expander5_int: expander5-int-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander1_int: expander1-int-state {
-		pins = "gpio16";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	qup_i2c1_default: qup-i2c1-state {
-		pins = "gpio19", "gpio20";
-		function = "qup0_se1";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	pcie1_default_state: pcie1-default-state {
-		wake-pins {
-			pins = "gpio21";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		clkreq-pins {
-			pins = "gpio22";
-			function = "pcie1_clkreq";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-pins {
-			pins = "gpio23";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	expander3_int: expander3-int-state {
-		pins = "gpio24";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander6_int:  expander6-int-state {
-		pins = "gpio52";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander0_int: expander0-int-state {
-		pins = "gpio56";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
-		pins = "gpio73";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
-		pins = "gpio74";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
-		pins = "gpio75";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	qup_i2c15_default: qup-i2c15-state {
-		pins = "gpio91", "gpio92";
-		function = "qup1_se7";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	expander2_int: expander2-int-state {
-		pins = "gpio95";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander4_int: expander4-int-state {
-		pins = "gpio96";
-		function = "gpio";
-		bias-pull-up;
-	};
-};
-
-&uart6 {
-	status = "okay";
-};
-
-&uart7 {
-	status = "okay";
-};
-
-&ufs_mem_hc {
-	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
-	vcc-supply = <&vreg_l8a>;
-	vcc-max-microamp = <1100000>;
-	vccq-supply = <&vreg_l4c>;
-	vccq-max-microamp = <1200000>;
-
-	status = "okay";
-};
-
-&ufs_mem_phy {
-	vdda-phy-supply = <&vreg_l4a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&usb_1 {
-	dr_mode = "peripheral";
-
-	status = "okay";
-};
-
-&usb_1_hsphy {
-	vdda-pll-supply = <&vreg_l7a>;
-	vdda18-supply = <&vreg_l7c>;
-	vdda33-supply = <&vreg_l9a>;
-
-	status = "okay";
-};
-
-&usb_qmpphy {
-	vdda-phy-supply = <&vreg_l7a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3_hs {
-	remote-endpoint = <&usb2_con_hs_ep>;
-};
-
-&usb_2_hsphy {
-	vdda-pll-supply = <&vreg_l7a>;
-	vdda18-supply = <&vreg_l7c>;
-	vdda33-supply = <&vreg_l9a>;
-
-	status = "okay";
-};
--
2.34.1

