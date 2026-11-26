Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670467;
	b=fI+xPeV8SJlK9VbAxSfkgxJXns2RAWPWFMa6CtBHW6AQTYfSGUm3+/tJOQhd+DKRUVgR
	 EkSRI/CWK+pPNmKgR1E6Vy+krN0+CylSTlz6J+Q+ZPD+qIlh/RIO7onms3n7+3cpNnEhL
	 eM3czdY7y9XHJR4Uo1wqeW9KqLyNKgA0QiULTiO1qYOU/yabYsRsec6GJdQsTvCnk3v8N
	 hxOrEKtzus+bs4/cwG2GLSCsz0wvfpuVPmm0iwzIIGdmjgDeXrOx26eQKPfcRGuTDFhSV
	 BaH+CNy9Qpz96btHZdR1LBsFC5/PndDOCAONQY6zoEhKb/L75rrDWnQ6sa25DpGnblg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670467;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=z1/BqRk7FV6ojtyfomax21csoprdQ+m3L+4dspRej9U=;
	b=pUbzCNYChoKnEubXPqHg0LPtd6NEVbw3WoyMZYdtQ67Bz+NP+5PJDaGo9wXH6A38OLfm
	 +E8UcDNwKSkArd/VCvjHSxtfR/MEa3/5C1+fsnenvRGlbNp9xp/JvOuySTmsRfjpyM7Oz
	 kuDmu3UOGqFwy359yOLGUrBjQNuYiRtJpR9xd2hotwk/eURPjEcElELk+A9YTrCm/6iy6
	 7PMSqhzDMBjMPPoq7vQTcpfHPji1RhRABPAzrVutbZTqaXrhj5hUVjG8gUnzFh3LwbW8T
	 m8VBSNAWKoOpK3kljm6CYZa8sapwZXmKLv1fRit0UvXxN8OHJZlyZwfrZFEGFLreyag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=j3xeriZG;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D37606A32C;
	Thu, 26 Nov 2026 05:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D37606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=j3xeriZG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=z1/BqRk7FV6ojtyfomax21csoprdQ+m3L+
	4dspRej9U=; b=j3xeriZGh9EFMVpurCPOOv/bbLHSHH8Q1oyAVA62aLZQwzidAr
	sj+Mmnf0xxVo+44LufwKkRaKHpBg4QqhFrDvr5TirhR4zA35LJCEWJ3SQz1jiDLd
	7hOSIYK+0LqxllygZDI4qt0ZdJ33Y5aFwMKuqbOcBT7GVI0CIsrESiz9M=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.120])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHNSq5wQdreQ77AA--.266S4;
	Thu, 26 Nov 2026 13:21:01 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/2] arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a Qualcomm SM8750-based tablet
Date: Thu, 26 Nov 2026 13:20:57 +0800
Message-ID: <20261126052057.1544590-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126052057.1544590-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261126052057.1544590-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgDHNSq5wQdreQ77AA--.266S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtw45Kr47AryfKw15AF43Wrg_yoWxGFWkpF
	ZrZrsxGryv9F1rKw4Yg34I9an3Wan5Ga97CryqkFWrCrW5AFykGFsIyF1rZFy8JrWkG3yF
	yFZxZry7KFn7Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU5AgA3UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQA9sA

The Lenovo Legion Y700 Gen4 (TB322FC) is an SM8750 tablet.  Add its
devicetree with the board compatible, the chassis type, the GPIOs the boot
firmware reserves and the board clocks, which the SM8750 dtsi consumes: the
XO and sleep clocks and the two divided CXO derivatives, as on the other
SM8750 boards.

The camera devices are powered by a WL2868C camera PMIC on i2c10: LDO1
feeds the rear sensor DVDD, LDO2 the front sensor DVDD, LDO3 the front
sensor AVDD, LDO4 the rear sensor AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of
both sensors and the VCM VDDIO, all at fixed voltages including the offsets
programmed by the stock firmware.  LDO6 is not wired out on this board.

The camera PMIC has five inputs on this board: VSYS, which powers its
control logic and its I2C interface, and VIN12, VIN34, VIN5 and VIN7, which
feed the LDOs in use.  The SPMI PMICs that generate those rails are not
described yet, so all five are modelled as one always-on fixed regulator
standing in for them; the board's actual input wiring is not documented in
the sources this file was derived from.  VIN6 is left out together with
LDO6.

This is one logical action - "add this new hardware" - so the board and the
regulators it carries are described in a single commit.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
Changes in v10:
- Describe the camera PMIC inputs.  The binding keeps vin12/vin34/vin5/vin6/
  vin7-supply optional, but only because a board need not describe an input
  whose outputs it does not use; this board uses LDO1, LDO2, LDO3, LDO4,
  LDO5 and LDO7, so VIN12, VIN34, VIN5 and VIN7 are now declared.  They all
  point at the always-on system rail that vsys-supply already used, since
  the SPMI PMICs that generate it are not described yet.  Reported against
  v9 2/2: "missing vin*-supply properties on pmic@2f for active LDOs".
- The comment on that regulator now says which pins it feeds.
- Everything else is as in v9: same compatible, same clocks, same LDO
  voltages, same reserved GPIO ranges.
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00..e0b65a36c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -453,6 +453,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-lenovo-elden.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
new file mode 100644
index 0000000000..d8e9ab1272
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "sm8750.dtsi"
+
+/ {
+	model = "Lenovo Legion Y700 Gen4";
+	compatible = "lenovo,elden", "qcom,sm8750";
+	chassis-type = "tablet";
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	/*
+	 * Always-on input rail of the camera PMIC: VSYS (control logic and
+	 * I2C) and the four LDO inputs.  The SPMI PMICs that generate it are
+	 * not described yet, so it is modelled as one fixed regulator without
+	 * a voltage constraint, standing in for those rails; the board's
+	 * actual input wiring is not documented in the sources this file
+	 * derives from.
+	 */
+	wl2868c_vsys: regulator-vsys {
+		compatible = "regulator-fixed";
+		regulator-name = "wl2868c_vsys";
+		regulator-always-on;
+	};
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+
+	pmic@2f {
+		compatible = "willsemi,wl2868c";
+		reg = <0x2f>;
+		reset-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_pmic_default>;
+		vin12-supply = <&wl2868c_vsys>;
+		vin34-supply = <&wl2868c_vsys>;
+		vin5-supply = <&wl2868c_vsys>;
+		vin7-supply = <&wl2868c_vsys>;
+		vsys-supply = <&wl2868c_vsys>;
+
+		regulators {
+			/* Voltages include the offsets programmed by stock firmware. */
+			camera_ldo1: ldo1 {
+				regulator-name = "camera_ldo1";
+				regulator-min-microvolt = <1128000>;
+				regulator-max-microvolt = <1128000>;
+			};
+
+			camera_ldo2: ldo2 {
+				regulator-name = "camera_ldo2";
+				regulator-min-microvolt = <1288000>;
+				regulator-max-microvolt = <1288000>;
+			};
+
+			camera_ldo3: ldo3 {
+				regulator-name = "camera_ldo3";
+				regulator-min-microvolt = <2816000>;
+				regulator-max-microvolt = <2816000>;
+			};
+
+			camera_ldo4: ldo4 {
+				regulator-name = "camera_ldo4";
+				regulator-min-microvolt = <2824000>;
+				regulator-max-microvolt = <2824000>;
+			};
+
+			camera_ldo5: ldo5 {
+				regulator-name = "camera_ldo5";
+				regulator-min-microvolt = <2808000>;
+				regulator-max-microvolt = <2808000>;
+			};
+
+			/* LDO6 is not wired out on this board. */
+			camera_ldo7: ldo7 {
+				regulator-name = "camera_ldo7";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <39 1>, <74 1>;
+
+	camera_pmic_default: camera-pmic-default-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-disable;
+	};
+};
-- 
2.53.0

