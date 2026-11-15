Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733319;
	b=VTrSsGAVi38CXo8yHbGhr2x2Q8W1ClCMBXDrBMZdKFN9q2ek+9VyIKPjaABHgu0V5sFH
	 67+ebIMYQT19mijHmhx+Hr1hLIrr6q3wM/8BkAlx2Dy35/XE7E1mBEH3T0AXuU8yTjX2O
	 z58baJ+hMO9qvWedQFNflkiy86czNlU0YxFVTkoI34J4kug3Vv6xEfftdoByHj1J6pYg+
	 /XyDRMqdHI1t4LrQ/Tqp7MiCeENbwAzD/H1HeRjS5AMun2qT/EL+vqAzd8PviUcWCVQpU
	 iJwtUvjlk3R0vj9XaKSV6NRbb5apPRsmy3WU4zdivzYv1rIapKVDADJQJYlwEYxAgZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
	b=NV5ewC2PQvBUmykcU6uaoNbZeueowJAj60wm2Z154y/xnFrnhpIjKwo/lZOD8VlOrnLc
	 /tOknEMfqx5WqychaOqdAfDzLthNNs/OmNTGn6BqSOJvT0PSX+pzgq9aLgkTV5WFd3NaZ
	 Nk2DSGMuG732zQdSCVhnoVwhPqig+LeRKwyVZVsWd+d6CLIdjPCBy6cxuqxBV0f72Lmay
	 IFpEFTHGNtoVYfuJZNfPN0wy49wVTy3Zl8TNmNShDw2cJ7zZOw0S63yRANHaWn7ezqRwR
	 Q9luM6KJGFP31Da+hriVtz9cVOeguVwHyGi9ei7jub3MsnyUbLPyvE6iVW4YXjpyyow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvAVjN6p;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08B8606A338
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08B8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvAVjN6p
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c45551fa84eso507177066b.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733317; x=1795338117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
        b=wvAVjN6pwlp4VFxcNVdvV8jVZ2dLOkcj7XHIW3PSW/k5KGK5StTQMvHXEd8iMquLeI
         QaLB7F6nAthR4xm9TmSlnLBfJq2ap4LCoMa9EZnJDDYiOBUGaSVtIbW64+M4iFdruzLJ
         O0RkCaBwxE7zSEF2X93AceBNnQTGcP+gnyvRDGBYifu8lfm2kenxTL/VwF1OLYEzJ6KT
         CHzEdEasVgIY7jMwquLCT5MgsP+oOvLXE3C9a42MSukedNAfMGjCgGBj6tMwHhIE1oVv
         A+EZyDp4AqEAYtTkGmurmnGDHyFjs/d3Fu9WtFqNWzyTpXLs6oTN+2DoTsiu28EeaIC6
         y1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733317; x=1795338117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
        b=R1EO1ELAIIz72oG53DXAwb9VdKurPjxisNaIDTazHDPTUeYf7uohZwoVPbyc6pMuYt
         CFVoDwgQi2Zmuwwpo9YTO2F+QqLgkbRFbrSDX3wXkhKkVvEdjB1kOwvXOu8/jAs8pKLz
         Hfwq2o2vOPhghdULh7soAwnOcDafkFieNpOa/1Oak+GyQhEiFhChDzbLJeViP74GrcJ7
         z8xxAL2U29D8sD7Tu1TiFqQqgy/cTTodsORVb9jpygvZgtuiN7dZivgNwwjNASfA7c89
         xF4epU1AhlIs/w9WnSV+nZ8LXWjOyvrfAuKv3BbyRN5JZK9J/u6+yk2D1xnSdfW9bCTo
         SyhQ==
X-Forwarded-Encrypted: i=1; AL+hErFF7tIzUjL9x3rLdPzZiovOtyrRhxFNu8pg++uouoIZMaGATsxZJdTalBHk8K5XmkOeSVRmajBaERIz@vger.kernel.org
X-Gm-Message-State: APuU4Z8nN4FEOK3lts0EmWos5NYuwf1Kbywyl/a/yMFacpFRmlpak0f5
	RJf1ApLb9hQ/SSIz6aFmSqgtRzyrVMN3S6VZzKo1m0Q7h5A+Xr52MXaa
X-Gm-Gg: AYBFou1xb3Ru5k37JkTQim+FmehktNTA4VetDcEsTmDOs4nH2giZIlsfe1HMchSzrYd
	mSZiAMYQq3CF2Hn1XmMgtV39RRI0ZJgHBTOrXYIbzLcq5Bu1EQjhCuUjF4HPtVOOqx9+RaKKZuo
	OjXV1okNhJCk+95x0zlSURYNoSYszZq6c4zrf+R4Jo40TVDaymSdTckwUcNg6Si5I3kneuaFgrv
	nq6+nsMtaCqLDRNF86hZFb/msrByokYo1c71ABv9c0ySkb8YiqsmLPCoIjbzJtV1LnOBRf+G04w
	vKbfGkiHQ60m0Zs+Lq2sM1fm9vq8W8N5vLqegZeyh9rkbE7o/pMtyY/3yKTa0bzTFGo1jwuq7dI
	gwxVVy+BlE6AxMvV0w3hFkTE/zUwFCd9lqF7CZ3t1D1yDJLqMJFodmuZ21S07Ox1EB0g572pBc7
	3D8Q6hrgg/3e7yUiUSoM3pv81jeGL1Fhn6mwwp4QYyKhKx7zp95ItU9nncIeWKhrEuwXTkAE7Jw
	9/1S6H2RcY67O4bF6aZaPFMoViqhcsL210dajuNpsQO0JCmp6XgIMWnHrAmjhNmwdcojfQHASBP
	kpTFC3l8eIRYxsJnO5FRqYOsjI8ucRZ2VtjwGmz3IhPDlLAPd7wWSWFe35tbg0/G7Irf4cXSMJy
	ZoPiy/Kks4Q==
X-Received: by 2002:a17:907:94ca:b0:c50:5f6a:7009 with SMTP id a640c23a62f3a-c509619a97fmr511739766b.7.1794733316882;
        Sun, 15 Nov 2026 01:01:56 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 1/5] regulator: dt-bindings: maxim,max8907: Convert to DT schema
Date: Sun, 15 Nov 2026 11:01:43 +0200
Message-ID: <20261115090147.95337-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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

Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
to nvidia,tegra-regulators-coupling in child regulator nodes.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 2 files changed, 283 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

diff --git a/Documentation/devicetree/bindings/regulator/max8907.txt b/Documentation/devicetree/bindings/regulator/max8907.txt
deleted file mode 100644
index 371eccd1cd689..0000000000000
--- a/Documentation/devicetree/bindings/regulator/max8907.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-MAX8907 regulator
-
-Required properties:
-- compatible: "maxim,max8907"
-- reg: I2C slave address
-- interrupts: The interrupt output of the controller
-- mbatt-supply: The input supply for MBATT, BBAT, SDBY, VRTC.
-- in-v1-supply: The input supply for SD1.
-- in-v2-supply: The input supply for SD2.
-- in-v3-supply: The input supply for SD3.
-- in1-supply: The input supply for LDO1.
-...
-- in20-supply: The input supply for LDO20.
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name (or the deprecated
-  regulator-compatible property if present), with valid values listed below.
-  The content of each sub-node is defined by the standard binding for
-  regulators; see regulator.txt.
-
-Optional properties:
-- maxim,system-power-controller: Boolean property indicating that the PMIC
-  controls the overall system power.
-
-The valid names for regulators are:
-
-  sd1, sd2, sd3, ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10,
-  ldo11, ldo12, ldo13, ldo14, ldo15, ldo16, ldo17, ldo18, ldo19, ldo20, out5v,
-  out33v, bbat, sdby, vrtc.
-
-Example:
-
-		max8907@3c {
-			compatible = "maxim,max8907";
-			reg = <0x3c>;
-			interrupts = <0 86 0x4>;
-
-			maxim,system-power-controller;
-
-			mbatt-supply = <&some_reg>;
-			in-v1-supply = <&mbatt_reg>;
-			...
-			in1-supply = <&mbatt_reg>;
-			...
-
-			regulators {
-				mbatt_reg: mbatt {
-					regulator-name = "vbat_pmu";
-					regulator-min-microvolt = <5000000>;
-					regulator-max-microvolt = <5000000>;
-					regulator-always-on;
-				};
-
-				sd1 {
-					regulator-name = "nvvdd_sv1,vdd_cpu_pmu";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				sd2 {
-					regulator-name = "nvvdd_sv2,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-				};
-...
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
new file mode 100644
index 0000000000000..6cf8e93867e1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -0,0 +1,283 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX8907 PMIC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: maxim,max8907
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  maxim,system-power-controller:
+    type: boolean
+    deprecated: true
+    description:
+      Telling whether or not this PMIC is controlling the system power.
+
+  system-power-controller: true
+
+  mbatt-supply:
+    description:
+      The input supply for MBATT, BBAT, SDBY, VRTC.
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^(sd[1-3]|ldo([1-9]|1[0-9]|20)|bbat|mbatt|out(5v|33v)|sdby|vrtc)$":
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+patternProperties:
+  "^in-v[1-3]-supply$":
+    description:
+      The input supply for SD1, SD2 and SD3.
+
+  "^in([1-9]|1[0-9]|20)-supply$":
+    description:
+      The input supply for LDO1 - LDO20.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@3c {
+            compatible = "maxim,max8907";
+            reg = <0x3c>;
+            interrupts = <0 86 0x4>;
+
+            system-power-controller;
+
+            mbatt-supply = <&vdd_5v0_sys>;
+            in-v1-supply = <&vdd_3v3_vbat>;
+            in-v2-supply = <&vdd_3v3_vbat>;
+            in-v3-supply = <&vdd_3v3_vbat>;
+            in1-supply = <&vdd_3v3_vbat>;
+            in2-supply = <&vdd_1v8_vio>;
+            in3-supply = <&vdd_3v3_vbat>;
+            in4-supply = <&vdd_3v3_vbat>;
+            in5-supply = <&vdd_3v3_vbat>;
+            in6-supply = <&vdd_3v3_vbat>;
+            in7-supply = <&vdd_3v3_vbat>;
+            in8-supply = <&vdd_3v3_vbat>;
+            in9-supply = <&vdd_3v3_vbat>;
+            in10-supply = <&vdd_3v3_vbat>;
+            in11-supply = <&vdd_3v3_vbat>;
+            in12-supply = <&vdd_3v3_vbat>;
+            in13-supply = <&vdd_3v3_vbat>;
+            in14-supply = <&vdd_3v3_vbat>;
+            in15-supply = <&vdd_3v3_vbat>;
+            in16-supply = <&vdd_3v3_vbat>;
+            in17-supply = <&vdd_1v8_vio>;
+            in18-supply = <&vdd_3v3_vbat>;
+            in19-supply = <&vdd_3v3_vbat>;
+            in20-supply = <&vdd_3v3_vbat>;
+
+            regulators {
+                vdd_3v3_vbat: mbatt {
+                    regulator-name = "v_powerrail";
+                    regulator-always-on;
+                };
+
+                sd1 {
+                    regulator-name = "vcc_1v2_ddrio";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vdd_core: sd2 {
+                    regulator-name = "vdd_core";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vdd_1v8_vio: sd3 {
+                    regulator-name = "vcc_1v8_io";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                ldo1 {
+                    regulator-name = "vcc_3v3_ddr";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                ldo2 {
+                    regulator-name = "vcc_1v1_pll";
+                    regulator-min-microvolt = <1100000>;
+                    regulator-max-microvolt = <1100000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                iovcc_1v8_lcd: ldo3 {
+                    regulator-name = "vcc_1v8_lcd";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                avdd_3v3_usb: ldo4 {
+                    regulator-name = "avdd_3v3_usb";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vcore_emmc: ldo5 {
+                    regulator-name = "vcc_2v8_emmc";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_hdmi_pll: ldo6 {
+                    regulator-name = "vcc_hdmi_pll";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                vcc_3v0_sensor: ldo7 {
+                    regulator-name = "vcc_3v0_sensor";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-boot-on;
+                };
+
+                vcc_1v8_sensor: ldo8 {
+                    regulator-name = "vcc_1v8_sensor";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                ldo9 {
+                    regulator-name = "vcc_3v3_fuse";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                vcc_3v1_touch: ldo10 {
+                    regulator-name = "vcc_3v1_touch";
+                    regulator-min-microvolt = <3100000>;
+                    regulator-max-microvolt = <3100000>;
+                    regulator-boot-on;
+                };
+
+                vdd_3v3_hdmi: ldo11 {
+                    regulator-name = "vdd_3v3_hdmi";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                vdd_usd: ldo12 {
+                    regulator-name = "vcc_2v8_sdio";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_3v0_motor: ldo13 {
+                    regulator-name = "vcc_3v0_motor";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                };
+
+                vcc_2v8_lcd: ldo14 {
+                    regulator-name = "vcc_2v8_lcd";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_3v3_temp: ldo15 {
+                    regulator-name = "vcc_3v3_temp";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                /* LDO16 is not used */
+
+                avdd_dsi_csi: ldo17 {
+                    regulator-name = "vcc_1v2_mipi";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo18 {
+                    regulator-name = "vcc_1v8_vi";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                vcc_1v8_touch: ldo19 {
+                    regulator-name = "vcc_1v8_touch";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                /* LDO20 is not used */
+
+                out5v {
+                    regulator-name = "usb0_vbus_reg";
+                    regulator-min-microvolt = <5000000>;
+                    regulator-max-microvolt = <5000000>;
+                };
+
+                /* OUT33V is not used */
+
+                bbat {
+                    regulator-name = "vcc_bbat";
+                };
+
+                vdd_rtc: sdby {
+                    regulator-name = "vcc_rtc";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vrtc {
+                    regulator-name = "vrtc";
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

