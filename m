Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652536;
	b=yTEO5FTPt5qQnZ5dIfreS2r2HM9va9jDuEmkE+2S5Uqeg3J3zlQr/t9VJnDzjBEqDe+d
	 Wm6XbZJGSVCclFZ8lc5p+g2VSbk0cN5td6DUlZZQ5bRfE/KQmrNaZMdOhP8TsQkh7wbma
	 iB06ca6EUA1mQBz8bQJAM0APc7W7IPVLMwvfSpp+6OnjFdLZmrExAIuKZ52fhoW7NMNG0
	 s5eT8DfppHjfHzCYRC1RtVZCeCQhE7topUgri0OyFNuFeFdIaAaSvAeAJA9VKjeRQpm6B
	 hreO5nws1o3yXgxPdSCDgTYmoUy2JEmxj7d2xwrUgb9FhNiNmWPXH6rT8qfMxvXyEUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652536;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xNNL92OcqsGyu+v/1EvUmyOnv9Zhalz1FYFzTcPOxD0=;
	b=tuw0l224R+9NcbzDi6lHiSMDtThxWKD5cBZKs6I7Py0uLzUEqlrqSaA1h3MMDF4hZ+Qd
	 2DEKWOBNz9c9TDyaUED1hY5N3TxBH8fMNMVlr6COGEqUedACQmkMrD5zjcJmXYdTKJMlA
	 DHNcWB97c9faE7ikaLE+pqMmjm5GN9fP9gejDbwhqpVb5uEOrmu75vt/Ic8uRpZ6baHKC
	 AjjAWzAJc9MyjFRXgLl+IQgouAjyhyVbxUBZZ2b7naqDP7f/0pW2fE07zIM18624MSlQ+
	 BSQp9Gy+EKS9+tNNoQsANBstwdfe2PozxVhmdgh75YOKS+oQQh1ls74SslumoSjMJzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=U5FZ6Vcd;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B730C606A323;
	Thu, 26 Nov 2026 00:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B730C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=U5FZ6Vcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=xNNL92OcqsGyu+v/1EvUmyOnv9Zhalz1FY
	FzTcPOxD0=; b=U5FZ6VcdeWfYE6NQAxS5PoinqjzXyUWULdv9HgL6gO+WOkUTvn
	DEJv4x/CXBqs70Ecb2Nelirkv29Y3gigSPRbESIyNmVP8OQR8ha+N3ecMZ/2+9ef
	/dNMQQd6qfl7327HhHSq2bbMxOP2MTo9qbYs5i5KcWg9PxzDjjLzy4bZ8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.181.84])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnnzOmewdrvLr5AA--.1516S4;
	Thu, 26 Nov 2026 08:22:05 +0800 (CST)
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
Subject: [PATCH v9 2/2] arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a Qualcomm SM8750-based tablet
Date: Thu, 26 Nov 2026 08:21:57 +0800
Message-ID: <20261126002157.1954799-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126002157.1954799-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261126002157.1954799-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAnnzOmewdrvLr5AA--.1516S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtw45Kr47Ww43Kw45Kr1Dtrb_yoW7Zr1rpF
	srXFs3CrykuFyrKa15W34S93Z8Wws5CayvkryjkFW5C390kF97GF9FyF1rAF18JrZ7Xw4F
	yFZxur92yF1kZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mx
	kF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVWDMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU0XTmDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQA2sL

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

This is one logical action - "add this new hardware" - so the board and the
regulators it carries are described in a single commit.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
Changes in v9:
- State the dependency explicitly, as asked: this patch is waiting on the
  willsemi,wl2868c regulator binding,
  Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml, which
  is in regulator.git for-7.5 (84e67d2ee13f binding, 602f57223457 driver)
  and not in v7.4-rc3.  Until it is in the tree, dtbs_check reports one
  diagnostic here, on pmic@2f: "failed to match any schema with
  compatible: ['willsemi,wl2868c']".  Merge this patch after that binding;
  1/2 has no such dependency and can go in on its own.
- No change to the device tree: the diff is byte-identical to v7 and v8.

Changes in v8:
- The series is split in two patches, with the board binding entry first;
  no change to the device tree itself.  See the cover letter.

Still open from the v6 thread (unchanged here, no way to validate them):
SPMI PMIC, RPMh regulators and console are not described, so this is still
the boot-infrastructure-less skeleton the v6 review commented on.

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
index 0000000000..73f4452f46
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -0,0 +1,129 @@
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
+	 * VSYS of the camera PMIC is the always-on system rail of the tablet.
+	 * The SPMI PMICs that generate it are not described yet, so it is
+	 * modelled as a fixed regulator without a voltage constraint.
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

