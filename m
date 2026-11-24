Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517152;
	b=15OAhBTksSFvzYx7nNTnBNMU3nGqCfP7APKFlmm7gBwk5OnQL8sRXyvVVrTyvDBFa998
	 +uc/X1Y+3zMp/kks3Lng0zrngkfZNB7B4Zp+ue+CSYSgLn2DlygxuFxpLwfjXflbeBJ18
	 cghIr54KXTxvJL6ema92rE/P0oh8l/hKutOLMmtmWw823u4hm+Ua9Twc6Wtpa51pUD4XT
	 UB6q0N7YYfDXb3MuhxNK2yDLaqjvl5TUuiYddJg/jJ7wrAlfAf0rQLibyCRwIfb1sxmU2
	 n4wMlOvx8nxKRLnsox2SndYB9qLd5q9RxnrhTQc4eK4KfQKXdwx/aVkSZT+j1qJVTew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517152;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iZkf/Lzmu7P++n2nxDMb0FBX+3fJaD3822HH8l9H4NA=;
	b=DfFYOoVFeYOsDB4QrKrqFusa0r1/HtAD+6fhcDyUEZRE3dqY1t6wRlceOpb77OBNKjYv
	 Yy7gWhFK1GFX7lg+CULWXOVt/VmHw/lFeQzi917H/IWuhtlpHujvNsQJJGPVUKJnFvELP
	 RmSTMwcnpVxxiPvrCPHWfe2Wc+auaytgaeCKta/vmBLG+idflkbBiaqoeiZ94lnmXvbl/
	 5X3P+WBIDlSjglKO9doC8rdP0YMa/3x49gca7A16Qn5ZUNqhU+EfF6QwaS2xcQvjgIY47
	 NP20RaN2eGJpFEHrb9KcWu80So9eOFw1PGPKUxJYjCVxvqUOzq+TD7eEZTXowze+WRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tgwtsa7y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B2606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tgwtsa7y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E911F000C0;
	Tue, 24 Nov 2026 10:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517152;
	bh=iZkf/Lzmu7P++n2nxDMb0FBX+3fJaD3822HH8l9H4NA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tgwtsa7yN7zl6nde7iXoxck8+mFlv3HRZIPCkmH8ecTqmJ3PSgLH/1rEZFL/Ylf9E
	 LvviEGPv5UX/Ie2WD88i9pXDpOC+CvVYkeUotCglDTl32+pRk9SkXfEKmv3q9wS5cw
	 Ej9Kj4dNvs4aW7Is+g4+N9Nctgn+W/FBrnnhaLvlrl2PszEZrmgYy8l39G4qUW27LN
	 HAVJYyT9Jevh4W8NJXlCr1Ra4L5QFCMWaRewVRlOTDLGxRJvT8mLoE1SU1tuEzHC6D
	 +sAHUa0McTB58WzYf13DvzP5NU5/Vn/fhUul7DBCitL3jKJPIPE7ZDEgL3RCZ1IZwn
	 cIhQTUsU8z+8A==
Message-ID: <sashiko-outbox-230980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add Monaco Draco EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faruque Ansari" <faruque.ansari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-monaco-draco-v2-3-3ee3b2375f16@oss.qualcomm.com>
References: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
 <20261123-monaco-draco-v2-3-3ee3b2375f16@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:45:51 +0000
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

commit 3fa9beb477beb817044281e8e657768127392121
Author: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

> arm64: dts: qcom: add Monaco Draco EVK board
>=20
> The Monaco Draco EVK pairs the Monaco Draco AC SoM with the Draco
> carrier board. Add its device tree, describing the board-specific
> peripherals layered on top of the SoM:
>=20
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
Are these descriptions of pcie1 and uart2 accurate?  In the devicetree
below, only pcie0 (pcieport0) sits behind the TC9563 PCIe switch while
pcie1 (pcieport1) is an independent root complex, and uart2 is wired via
an OF graph endpoint to port@3 (the Bluetooth UART interface) of
wifi-bt-connector rather than serving as a debug UART.

>  - Audio Playback and Capture over max98091, Audio Capture over
>    va_macro codec DMA.
>=20
> Also hook the board dtb into the Makefile, together with an EL2
> overlay variant that boots the kernel at EL2 for KVM.
>=20
> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> Co-developed-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>
> Signed-off-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>

[Severity: High]
The Co-developed-by and Signed-off-by trailers for Sravani Tella use an
internal workstation hostname (tella@hu-tella-hyd.qualcomm.com) rather
than a valid routable email address.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/b=
oot/dts/qcom/monaco-draco-evk.dts
> new file mode 100644
> index 0000000000000..ae34538e6fd34
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
> @@ -0,0 +1,755 @@

[ ... ]

> +	vreg_dp0_pwr: regulator-dp0-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP0_PWR_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&expander1 7 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: High]
Is vreg_dp0_pwr missing enable-active-high?  For regulator-fixed nodes,
of_gpio_quirk_polarity() ignores GPIO_ACTIVE_HIGH in the gpio specifier
and forces active-low polarity unless enable-active-high is present,
which inverts the DP0 3.3V connector power supply enable line.

[ ... ]

> +	sound {
> +		compatible =3D "qcom,qcs8300-draco-sndcard";
> +		model =3D "MONACO_DRACO_EVK";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&mi2s_mclk_a>, <&mi2s2_data0>, <&mi2s2_data1>,
> +			    <&mi2s2_sck>, <&mi2s2_ws>;
> +		mi2s2-capture-dai-link {
> +			link-name =3D "Tertiary MI2S Capture";
> +			codec {
> +				sound-dai =3D <&max98091>;
> +			};
> +			cpu {
> +				sound-dai =3D <&q6apmbedai TERTIARY_MI2S_TX>;
> +			};
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +		mi2s2-playback-dai-link {
> +			link-name =3D "Tertiary MI2S Playback";
> +			codec {
> +				sound-dai =3D <&max98091>;
> +			};
> +			cpu {
> +				sound-dai =3D <&q6apmbedai TERTIARY_MI2S_RX>;
> +			};
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +		va-dai-link {
> +			link-name =3D "Codec DMA Capture";
> +
> +			codec {
> +				sound-dai =3D <&lpass_va_macro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +	};

[Severity: High]
Will the sound node bind to a driver or power the DMIC bias supply?
"qcom,qcs8300-draco-sndcard" is neither documented in the bindings nor
matched by any ASoC driver (other QCS8300 boards with MAX98091 use
"qcom,qcs8275-sndcard" in sound/soc/qcom/sc8280xp.c).

The sound node also omits audio-routing, so the MAX98091 codec widgets
and the lpass_va_macro "vdd-micb" DAPM regulator supply widget (backed by
the GPIO-controlled vreg_va_micb_1p8 and vreg_va_micb_en regulators) are
never routed and enabled during capture.

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
Should max98091@10 use the generic node name audio-codec@10 and specify
the actual interrupt trigger type instead of IRQ_TYPE_NONE?

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
Should the two integrated TC9563 Ethernet MAC endpoints under pcie@3,0 be
ethernet@0,0 and ethernet@0,1 without PCI bridge properties?  Modeling
them as pcie@0,0 and pcie@0,1 with device_type =3D "pci", #address-cells,
#size-cells, and ranges violates toshiba,tc9563.yaml and causes PCI
bridge walkers such as qcom_pcie_parse_perst() to treat the endpoints as
PCI-to-PCI bridges.  The downstream bridge nodes pcie@2,0 and pcie@3,0
also omit compatible =3D "pciclass,0604".

[ ... ]

> +&soc {
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

[ ... ]

> +	};
> +
> +	lpass_va_macro: codec@33F0000 {
> +		compatible =3D "qcom,sc7280-lpass-va-macro";
> +		reg =3D <0 0x33F0000 0 0x1000>;

[Severity: Medium]
Why are lpass_tlmm and lpass_va_macro defined under &soc in the board
DTS?  monaco.dtsi already defines lpass_tlmm with compatible =3D
"qcom,qcs8300-lpass-lpi-pinctrl", "qcom,sm8450-lpass-lpi-pinctrl", so
redefining pinctrl@3440000 here overwrites compatible and drops
"qcom,qcs8300-lpass-lpi-pinctrl" instead of referencing &lpass_tlmm to
add pin configuration nodes.

Also, lpass_va_macro is an SoC-internal LPASS block that belongs in
monaco.dtsi, and its uppercase hex unit-address in codec@33F0000 triggers
a dtc simple_bus_reg warning (it should be lowercase codec@33f0000).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-monaco-dra=
co-v2-0-3ee3b2375f16@oss.qualcomm.com?part=3D3
