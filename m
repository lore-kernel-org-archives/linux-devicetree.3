Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775702;
	b=zp6tVnVd6YpjGCQOOk8ZyfGNkSWurte78zycCoQJXGYMcCYer7QMzrSi3xmANpeR3haa
	 ZHzsHZZQtmuqe38yrONI2jugylk1QFrpsnpBy3AL8OHEqylkQQUDjQgERgr26P1Loisd7
	 mI9I/YkmdjXfsg39wuwIASp+AVqqI/4pymJ1PzgmLwSBF8YrU5Y+vMCjzXjBzMcJh9cMy
	 +2q2cZrJkkyjUXprzxNLzQ94IWMNW+XYw1rJ9X0KKjnTcox5x8vanuiLeLGfr7A2s/VT+
	 vKzuuLkakjzPES3jT5qUeDhXuQGV+UgT+zwSljjaPzuw+q2GUAJ5MZ8rqCUmDeCiuTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775702;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9bJPYIvYNmmfMPwxFyGs6JZ8IZI7vqhLJYsNAugPtr8=;
	b=BybOoZJmoxlgQytkogGlsI48kfTUHU0TutF0lRgWGsyZak6Iq8OnEiunde0aVMUeEeS1
	 H0Cto24ErF4NprA2QSWH73+ZR5dN0fLMTvO/bNRNI4TTusuiAoOiXC93vPfDK7+qJbQV2
	 uJIG3iRpCBQZDWKZYiHdRRgwYuO3hrySLz9q0m7tOECyalo+D+sf1AemExXxzJ1Xo3MLG
	 oYAhKlBTMNxLsSu0x6NTfxCLFcpbYajqsRwnFfsXo0FjgjLP/MZ0UhpOI0xRCIsyrTUKB
	 3ImNIwqacOFqa+MerASmfqgMqJSbRPaP+eoB18BV+PF+QAqYPXBqngbT4C7VE5WOYTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyXBG0vT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8177D606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyXBG0vT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD69C1F00898;
	Fri, 27 Nov 2026 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795775702;
	bh=9bJPYIvYNmmfMPwxFyGs6JZ8IZI7vqhLJYsNAugPtr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XyXBG0vTuYeHYi2rrWxanaLWdNdVF9e+V68tVcB3030q/6UPO+hVFa97+vSHBU2q6
	 W/1DXEOBiKJqLm368W/icOBKbMbcD2VRQheMe2SPFMmf/gw2Hnqr4eyjCMaM7836SC
	 rug6YE2yTLWkexMCLubzWl4vwUxID/TtVvIr6pAGzOgCYNYA4jcvrfCyq0xQp8f0Gi
	 n1ANaQRWooqq0GUP132VPXMQnZmFtUwq5QXAdL3I39Q/ynjtYBt6oOZew98L1p/YJL
	 pJ1bqK8dik4txUMuz3aahwEkqkPy2SjEslKZY7qUsN9PcSuIl15Mp34CWdIiP5nWhI
	 0q2U2wLmT8dgA==
Message-ID: <sashiko-outbox-237142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: add Monaco Draco EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faruque Ansari" <faruque.ansari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-monaco-draco-v3-3-0b603afa1328@oss.qualcomm.com>
References: <20261126-monaco-draco-v3-0-0b603afa1328@oss.qualcomm.com>
 <20261126-monaco-draco-v3-3-0b603afa1328@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 10:35:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] arm64: dts: qcom: unmatched compatible and missing routing on
  sound node
- [High] arm64: dts: qcom: missing enable-active-high on vreg_dp0_pwr
  regulator
- [High] arm64: dts: qcom: non-routable hostname email in Signed-off-by
  trailer
- [Medium] arm64: dts: qcom: lpass_tlmm redefinition and uppercase
  codec@33F0000
- [Medium] arm64: dts: qcom: TC9563 Ethernet endpoints modeled as PCI
  bridges
- [Low] arm64: dts: qcom: non-generic max98091@10 node name and
  IRQ_TYPE_NONE
- [Low] arm64: dts: qcom: commit message mismatch for uart2 and pcie1
  topology
--

commit 4a4aee471caca85b8295cf0f9cea819831b850fb
Author: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

> arm64: dts: qcom: add Monaco Draco EVK board
>
> The Monaco Draco EVK pairs the Monaco Draco AC SoM with the Draco
> carrier board. Add its device tree, describing the board-specific
> peripherals layered on top of the SoM:
>
>  - I2C GPIO expanders: 4x KTS1622 on i2c14 and 2x TCA9538 on i2c15
>  - EEPROM with a MAC-address nvmem layout on i2c15
>  - Native DisplayPort output (DP0)
>  - Gigabit Ethernet (ethernet0, 2500base-x) over an HSGMII PHY, with
>    the MAC address sourced from the EEPROM
>  - Dual PCIe (pcie0/pcie1) behind an on-board TC9563 PCIe switch
>  - ST33HTPM TPM over spi10
>  - AMC6821 fan controller on i2c13
>  - M.2 E-key slot connector and carrier debug UART (uart2)

[Severity: Low]
Does the commit message match the pcie1 and uart2 topology described in the
device tree?

In the device tree, only pcieport0 sits upstream of the TC9563 PCIe switch
while pcieport1 is an independent root port, and uart2 connects to port@3
of wifi-bt-connector as the M.2 Key E Bluetooth UART rather than a debug
UART (the console UART is uart7 in monaco-draco-ac-som.dtsi).

>  - Audio Playback and Capture over max98091, Audio Capture over
>    va_macro codec DMA.
>
> Also hook the board dtb into the Makefile, together with an EL2
> overlay variant that boots the kernel at EL2 for KVM.
>
> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> Co-developed-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>
> Signed-off-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>

[Severity: High]
These Co-developed-by and Signed-off-by trailers use an internal
workstation hostname (hu-tella-hyd.qualcomm.com) instead of a valid
routable email address.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/b=
oot/dts/qcom/monaco-draco-evk.dts
> new file mode 100644
> index 0000000000000..290ad62d5beac
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
> @@ -0,0 +1,764 @@

[ ... ]

> +	vreg_dp0_pwr: regulator-dp0-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP0_PWR_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&expander1 7 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: High]
Should vreg_dp0_pwr include enable-active-high?

For regulator-fixed nodes, of_gpio_quirk_polarity() ignores GPIO_ACTIVE_HIGH
in the gpio property and forces active-low polarity unless
enable-active-high is present, which inverts the DisplayPort 3.3V power
enable line at runtime.

[ ... ]

> +	sound {
> +		compatible =3D "qcom,qcs8300-draco-sndcard";
> +		model =3D "MONACO_DRACO_EVK";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&mi2s_mclk_a>, <&mi2s2_data0>, <&mi2s2_data1>,
> +			    <&mi2s2_sck>, <&mi2s2_ws>;

[Severity: High]
Can the sound node bind to a machine driver or power the DMIC bias supply
with this configuration?

"qcom,qcs8300-draco-sndcard" is neither documented in
Documentation/devicetree/bindings/sound/qcom,sm8250.yaml nor matched by any
driver in the kernel; sound/soc/qcom/sc8280xp.c matches
"qcom,qcs8275-sndcard" for QCS8300 boards using the MAX98090/MAX98091
codec.  The sound node also omits audio-routing, so the vdd-micb DAPM
regulator supply widget on lpass_va_macro (backed by vreg_va_micb_1p8,
which is not always-on) and the MAX98091 codec widgets will not be routed
or enabled during capture and playback.

[ ... ]

> +&i2c12 {
> +	status =3D "okay";
> +
> +	max98091: max98091@10 {
> +		compatible =3D "maxim,max98091";
> +		reg =3D <0x10>;
> +		#sound-dai-cells =3D <0>;
> +		clock-names =3D "mclk";
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>;
> +		assigned-clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_=
COUPLE_NO>;
> +		assigned-clock-rates =3D <12288000>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <51 IRQ_TYPE_NONE>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&int_codec>;
> +	};
> +};

[Severity: Low]
Will interrupts =3D <51 IRQ_TYPE_NONE> trigger a warning in
gic_irq_domain_translate() when the codec probes?

On QCS8300, TLMM GPIO 51 is wake-capable and routes through PDC pin 215 to
GICv3, where gic_irq_domain_translate() executes WARN_ON(*type =3D=3D
IRQ_TYPE_NONE).  Also, per the Devicetree specification and
Documentation/devicetree/bindings/sound/maxim,max98090.yaml, the node name
should use the generic form audio-codec@10 rather than max98091@10.

[ ... ]

> +		pcie@2,0 {
> +			reg =3D <0x21000 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x4 0xff>;
> +		};
> +
> +		pcie@3,0 {
> +			reg =3D <0x21800 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x5 0xff>;
> +
> +			pcie@0,0 {
> +				reg =3D <0x50000 0x0 0x0 0x0 0x0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				ranges;
> +			};
> +
> +			pcie@0,1 {
> +				reg =3D <0x50100 0x0 0x0 0x0 0x0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				ranges;
> +			};
> +		};

[Severity: Medium]
Should the TC9563 integrated Ethernet endpoints under pcie@3,0 be
ethernet@0,0 and ethernet@0,1 without PCI bridge properties?

Modeling these endpoint functions as pcie@0,0 and pcie@0,1 with
device_type =3D "pci", #address-cells, #size-cells, and ranges violates
Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml, triggers dtc
avoid_unnecessary_addr_size warnings, and causes PCI bridge walkers such as
qcom_pcie_parse_perst() to treat the endpoints as PCI-to-PCI bridges.  The
downstream bridge nodes pcie@2,0 and pcie@3,0 are also missing compatible =
=3D
"pciclass,0604".

[ ... ]

> +&soc {
> +	lpass_va_macro: codec@33F0000 {
> +		compatible =3D "qcom,sc7280-lpass-va-macro";
> +		reg =3D <0 0x33F0000 0 0x1000>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
> +			    <&lpass_dmic23_clk>, <&lpass_dmic23_data>,
> +			    <&lpass_dmic45_clk>, <&lpass_dmic45_data>;
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COU=
PLE_NO>,
> +			 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "mclk", "macro", "dcodec";
> +
> +		#clock-cells =3D <0>;
> +		#sound-dai-cells =3D <1>;
> +		status =3D "okay";
> +		qcom,dmic-sample-rate =3D <4800000>;
> +		vdd-micb-supply =3D <&vreg_va_micb_1p8>;
> +	};
> +
> +	lpass_tlmm: pinctrl@3440000 {
> +		compatible =3D "qcom,sm8450-lpass-lpi-pinctrl";
> +		reg =3D <0x0 0x03440000 0x0 0x20000>,
> +		      <0x0 0x034d0000 0x0 0x10000>;
> +		clocks =3D <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>,
> +			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "core", "audio";
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-ranges =3D <&lpass_tlmm 0 0 23>;

[Severity: Medium]
Does redefining lpass_tlmm under &soc overwrite the compatible string from
monaco.dtsi?

arch/arm64/boot/dts/qcom/monaco.dtsi already defines lpass_tlmm:
pinctrl@3440000 with compatible =3D "qcom,qcs8300-lpass-lpi-pinctrl",
"qcom,sm8450-lpass-lpi-pinctrl".  Re-declaring the controller node here
instead of referencing &lpass_tlmm drops "qcom,qcs8300-lpass-lpi-pinctrl"
and violates
Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yam=
l.
In addition, lpass_va_macro is an SoC-internal MMIO block that belongs in
monaco.dtsi rather than the board DTS, and its uppercase hex unit-address
(codec@33F0000 instead of codec@33f0000) triggers a dtc simple_bus_reg
warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-monaco-dra=
co-v3-0-0b603afa1328@oss.qualcomm.com?part=3D3
