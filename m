Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8123DB655
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011809; cv=none; b=mMMYB1yfuWUhz+byHzc0cslzVd5q02Quz3sGTiMGpY05wRh1Dl1iwvjljzrIczIsjSwYw+9tD9gZQ+D2GmJBrgbt83e68kF5FmRxcSExyVJl/pZ8lPysLO30xNSLO5Xj0bP+OirYv0wC5KMVqKne2T0JsBFO/KTfbXiKBb4vKEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011809; c=relaxed/simple;
	bh=I4Fnd8DT3x/5qFxndwhAPYg9uSol9HXgrkGpM9Dqjpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PK6rYmmXcbcS1hvAMDykO68tPjWz9LpNyafEXlQUWa+UmBSo4DzxqS7LGTxIjY7VxCIBEsJn533itowm+BJwJZ19WbsMVg22HBfl2zqY2HYim7ITnzyE1lhs9IvVYHNMRc+h2ZNyhNZRgB2hux074O7jqW7tkDv3fhfwDGikJQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=FcVD4cJ5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="FcVD4cJ5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso60343225e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011806; x=1778616606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSntrMJYv10gt1RMiSQTMnoDX7izTfCRmSkb59Vu9XU=;
        b=FcVD4cJ5+DTdCzm3Cb3d4K9PrMX3Ktu9q96NA0IegzoW/iWlAmrG3vcLWtiPRQKRRA
         5YuyFmQNPj7SGBVpwfpVukiG8d0lyPxxWYpPH7TIuf0nXR61GKRXLh90Gw+RGATFb+YR
         D5wfD+dK5OBdAikDtRQhXpFgUbjag85HAfD08SiJ+thKalq5c/pKAhk/izIXo8v0OPPW
         geqTyfmKD6X+wGIs86aeAo0M/ydQ6lywbMNQ98w+uC8z28ycxmS9Q8Bbd4jk0JxnhCrT
         xxXyZs5UnU1UfIYQpDjTlo/neHSiEAsxFEnyyfR5ITNgqQwOc8JWYCor8VtdLRduRQT5
         MSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011806; x=1778616606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZSntrMJYv10gt1RMiSQTMnoDX7izTfCRmSkb59Vu9XU=;
        b=Nx/svYw7nj8ZQOaE5DiT5ojXHZfDQADMI+L8AJP9GDP/XrtvtRtXtFOeCc4VblJMh+
         DpETogGHW263PNekzKtiWqtL5ia3n8pWsvpJzmYAiLTQWG+75ktuF1WewTz8ICBJ3Hkk
         bu3HLZNpWCQso1zT0e5yURWNs3ggsCD5U2Vd35jdOp0HA6Akbg/gFCWzTs/ixPAi2jdG
         oJE+JtbnnCrIJef2+HJZpN/vcV2g2YsqfeMvgYKbDgGMJPcxT5H7BForC3+N4VRSC7Pi
         oqkvo8sn/3VNCre8uW21RHEzbNCD6CrVGWMvvuRC18MV0qZIMrb2cCd+o/Z9DS6sSqdB
         WuWg==
X-Gm-Message-State: AOJu0YyuXnwaSiXvOngN1ElsgKoopS9jhBLayfyBa8nO5Iivmzf2vT6k
	vgTOInMz9AJojAYLKDYoiUT5KjfxC4plaVXMjWHxInBra3ECs69SFptvKnPEVm2ZiHo9kgF2zIK
	phaaCTr4=
X-Gm-Gg: AeBDietKEby+8PBTwIKPnaxY+rpR/d/wSdwQzFYQCjCVIFamm+F31XAvMPuAs2W4Vwt
	+i2c/7BepWndkCvVl2fcpWPZR9R6m4Zx7pA7uvO+AKvzk/9Y190wkW00e4c8J7wf8OMxVH22d5A
	Awu7wTL2YWHf5FmhucnXcpsjg7HU6T3M+bm/iOVVz228GNX8/Dv2RjjJxXgx2L2xBLibWqHMFSb
	GGqEgJv/EhGbspEmv0gyZy5WwjiMNSDi9J7sT7v3alIiwT27kNi0Iv070PEyof5gM2fsoEwr9W6
	Y4BAwVV2FIViYa3yMahswQeV0QCfVSxvvC1GeoOyoMoe9OEgc1cohsPc2tCBjuIvPzygDg2Bw9G
	A+EVEdRofYCKVVXxSdBQnzIl9i+oChaYSCkiRDPboEzGZ9L6xO9Y3Y0DP7DxGZxEiNdwAlyHl03
	KjGEJh0CYycBwf+8dAgH9qCYvwCBAlJvhBEOM8pTE8RuOnEMpgSV6b9BBR4cBJhocG+I49/8zZ+
	VCFDXUjav1wfQ/rMLzKSsS/cvDf/Q/3I80=
X-Received: by 2002:a05:600c:a305:b0:48a:5970:2005 with SMTP id 5b1f17b1804b1-48e51e08362mr8095595e9.2.1778011805987;
        Tue, 05 May 2026 13:10:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:05 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 05 May 2026 21:09:53 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: Add IMDT QCS8550 SoM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-3-b4767d0dd421@imd-tec.com>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The IMDT QCS8550 SoM is a System-on-Module from IMD Technologies Ltd
built around the Qualcomm QCS8550 SoC. It is intended to be soldered
onto a carrier board that supplies VPH_PWR and exposes the off-module
peripherals.

Add qcs8550-imdt-som.dtsi describing the SoM's PMICs (PM8550,
PM8550VE, PM8550VS, PMK8550) and the apps_rsc PMIC outputs.
Compared to other SM8550/QCS8550 boards, this SoM excludes the
PM8550B charger PMIC.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi | 319 +++++++++++++++++++++++++
 1 file changed, 319 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi
new file mode 100644
index 000000000000..816cbd254dea
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 IMD Technologies Ltd
+ */
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "qcs8550.dtsi"
+#include "pm8550.dtsi"
+#define PMK8550VE_SID 5
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-l1-l4-l10-supply = <&vreg_s6g_1p86>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l11-supply = <&vreg_s4g_1p25>;
+		vdd-l12-supply = <&vreg_s6g_1p86>;
+		vdd-l15-supply = <&vreg_s6g_1p86>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		/*
+		 * PMIC outputs whose testpoints lack capacitors are
+		 * omitted to prevent accidental use:
+		 *	L1B_1P8, L4B_1P8, L6B_1P8, L7B_1P8, L8B_1P8,
+		 *	L13B_3P0, L14B_3P2.
+		 * Other outputs are unused.
+		 */
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2720000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s4g_1p25>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_l3c_0p9: ldo3 {
+			regulator-name = "vreg_l3c_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo2 supplies SM8550 VDD_LPI_MX */
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+
+		vreg_s4e_0p95: smps4 {
+			regulator-name = "vreg_s4e_0p95";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5e_1p08: smps5 {
+			regulator-name = "vreg_s5e_1p08";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1e_0p88: ldo1 {
+			regulator-name = "vreg_l1e_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e_0p9: ldo2 {
+			regulator-name = "vreg_l2e_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_s4f_0p5: smps4 {
+			regulator-name = "vreg_s4f_0p5";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_0p9: ldo1 {
+			regulator-name = "vreg_l1f_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_0p88: ldo2 {
+			regulator-name = "vreg_l2f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_0p88: ldo3 {
+			regulator-name = "vreg_l3f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "g";
+
+		vdd-l1-supply = <&vreg_s4g_1p25>;
+		vdd-l2-supply = <&vreg_s4g_1p25>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+
+		vreg_s1g_1p25: smps1 {
+			regulator-name = "vreg_s1g_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2g_0p85: smps2 {
+			regulator-name = "vreg_s2g_0p85";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3g_0p8: smps3 {
+			regulator-name = "vreg_s3g_0p8";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4g_1p25: smps4 {
+			regulator-name = "vreg_s4g_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5g_0p85: smps5 {
+			regulator-name = "vreg_s5g_0p85";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6g_1p86: smps6 {
+			regulator-name = "vreg_s6g_1p86";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_1p2: ldo1 {
+			regulator-name = "vreg_l1g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_d_gpios {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};

-- 
2.43.0

