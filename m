Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599522;
	b=KkQ1JShVNZU2amMiWT5aZqBbcup2jg/PocIULSPiuyvn7W/FTsAFzDALRqR8xsTgq90C
	 bQsrIsylZm7PKoiaI3VtAUtPPEa4RoUd91AbM00u4TWk1fvaRpr88gatsQynPmTIRATOt
	 KO2l39Cxb/jyuLUdR7R5vqvynLJWPpJ8o1l6PQueMr/W4NI8q8U2l7nBHyHAEnsCdEvsK
	 Ux3zxsmxSfUGXXahO6dXpqAFRPrdJbkgWh5fQdBSAGSRVfkyeSrgMFoRU+GNqvut+rYEY
	 SBCV6j6wsrrZl/17f6MyLVwdJ0jKmSRxbOPooK9NCT/5OSElLT5J9K/ex5OLltzQc5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599522;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=jJaLvY8qv909IAxv6XfCvcBtGf6fL6AQp4Z114OS2TU=;
	b=TSnGRDpKHVe2KRx7IREatuUI/bG5RwXBcUIF+V0EviEwzC7i+Be4TnZT5Bdgb5+tTQNM
	 CulAdI69pVh+FTDz2ZP0gZmlLzE6iiaLLEzdkdD0nlcD20nRGOBFRxnpqf69jnb/5s7Fl
	 uGeubHD2YqavO8K6cr3ju0AFcN9TDjIFW52Q9CohZsGKl7fOt1awe7DUvwWGhVoWXyDX4
	 A8MA7P6tsMKZBAV/1cNH+/lxVCF8TkJ6imaTORe18KK1M2csWD0iXkJuSZ3vRKttQ9vpS
	 Ogxbsi5tFVND+JcHovj6s+kHpTCiFzEjCfzPjDVNE+ZGLZqcPWRaurJMZDqY3NgqbLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=fc6iKHgM;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBB1606A32E;
	Mon,  2 Nov 2026 06:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBB1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=fc6iKHgM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=jJaLvY8qv909IAxv6XfCvcBtGf6fL6AQp4
	Z114OS2TU=; b=fc6iKHgMMLfYvOxJTtHe6dJdvVShc5Rvpsz2BWqJRd+WhV9NLb
	L4mCRanPOiR1q7Jy/XAtcCFpBVfLPKK8q3mib1sjwPQAr4UuMTR+A2WbaPaqcS73
	fu+iIaEmu4hYlf0HGMBzH6cD1/AkTqqKR66OQfnvtyawmXkZBdT38zgZ0=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnGzAKKOhq6vN1AA--.1803S6;
	Mon, 02 Nov 2026 14:05:16 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	linux-regulator@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v5 4/4] arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators
Date: Mon,  2 Nov 2026 14:04:58 +0800
Message-ID: <20261102060458.461372-5-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnGzAKKOhq6vN1AA--.1803S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1rXr15Xr45Jw18Xw1fZwb_yoWxuFWkpF
	srZrs3Gr1vgF1Fgw4Yqa4I93Z3Ww4kCayvkryq9Fy5CrWYkFyDKFs7tr1rJF15JrWxA3y8
	XFsxur9IyFnFyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUy1SrDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBfsO

The Lenovo Legion Y700 Gen4 (TB322FC) is an SM8750 tablet. Its camera
devices are powered by a WL2868C camera PMIC on i2c10: LDO1 feeds the
rear sensor DVDD, LDO2 the front sensor DVDD, LDO3 the front sensor
AVDD, LDO4 the rear sensor AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of
both sensors and the VCM VDDIO, all at fixed voltages including the
offsets programmed by the stock firmware. LDO2 and LDO3 are wired to
the front sensor, whose binding is still pending, so its node follows
with that series. LDO6 is not wired out on this board.

The rear camera hangs off cci0 with the VCM. The front camera hangs
off cci1 and arrives together with its binding. The rear sensor and VCM
compatibles are the ones documented by the bindings sent separately to
the media list; the CSI endpoint receiver follows with the SM8750 CAMSS
series, which is why the endpoint has no remote-endpoint yet.

i2c10 is a GENI I2C controller inside the qupv3_2 wrapper, so both
qupv3_2 and its gpi_dma2 parent are enabled alongside, otherwise
i2c10 never populates and the regulators would never register.

The board clocks (XO, sleep clock and the two divided CXO derivatives)
that the SM8750 dtsi consumes are described here, as done on the other
SM8750 boards. The board compatible is added to arm/qcom.yaml here, as
it documents this board and not the regulator binding.

The file is otherwise limited to the camera PMIC and its consumers: the
rest of the board enablement (SPMI PMICs including the parents of the
WL2868C inputs, console and storage) cannot be validated on hardware in
this series and is left to a separate board series.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 175 ++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df78..41d5e65c4e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,elden
               - qcom,sm8750-mtp
               - qcom,sm8750-qrd
           - const: qcom,sm8750
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f..a18fea7beb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -406,6 +406,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-lenovo-elden.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
new file mode 100644
index 0000000000..de186b4477
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -0,0 +1,175 @@
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
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	clock-frequency = <400000>;
+
+	rear_lens: lens@c {
+		compatible = "giantec,gt9764";
+		reg = <0x0c>;
+		vddio-supply = <&camera_ldo7>;
+		vdd-supply = <&camera_ldo5>;
+		giantec,aac-mode = <0x40>;
+		giantec,aac-timing = <0x7c>;
+		settling-time-us = <7000>;
+	};
+
+	rear_camera: camera@56 {
+		compatible = "samsung,s5kjns";
+		reg = <0x56>;
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
+		assigned-clock-rates = <19200000>;
+		reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rear_camera_default>;
+		dovdd-supply = <&camera_ldo7>;
+		dvdd-supply = <&camera_ldo1>;
+		avdd-supply = <&camera_ldo4>;
+		lens-focus = <&rear_lens>;
+		orientation = <1>;
+		rotation = <90>;
+
+		port {
+			rear_camera_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <672000000>;
+			};
+		};
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
+
+	rear_camera_default: rear-camera-default-state {
+		mclk-pins {
+			pins = "gpio92";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		reset-pins {
+			pins = "gpio11";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
-- 
2.53.0

