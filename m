Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459505;
	b=fUi5JE9caYm0ZxpVf5vVPn+acs4yUpdtahHHZfcyglr0t3pXsb7/+TuRGVstUOKQz5LM
	 R8ZwYN+KSzSv+iCYi0cSp9TuD9OI0DdXvRrGViAkySXTN603CMGTe8uWDnbhDc8iHLkWC
	 UkCOojeoqmFCenV8bFeQBlTgV4HFBkKlrc6P1yXiBGwELgLgx2+c3fErX6LYWHDIPpVI0
	 Nrf57ZCgG21eU5AUY+mpuJFgL1GX/w8FJYIo1O4FkTmeKS1/nGW70blHhJe8TBWkdVoH/
	 aPzI4yshDZcuq5FrCd7UbPHxeppY3tvuq20Z1auDVatOl/YZQBbxs3hIOeT7Zinzw+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459505;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OWSia2nRUPxjPdC7PtqHDFVFHlI8mX7o7181srsUs7w=;
	b=WZUXfDrvE3nJnL7sRmmFUnSiFyBx69DRJ4Mc+1pIcSXe9atZbxRGw4zpdYC0y2nbxwgS
	 5y3xL2U/Zp12gECsRi97MwCeWUB9LFcDe6AqLARcKwEos9odeSd38vEf1pcQbzeu/kkbf
	 2tN6Ikn0GirpkpsfKukgzDgfW9tKzqy8hoDdgM+Nw+VkZN0uk6MZmdGvmmhY7ZOtGMgAw
	 GFS1Oe++GoKM7lFJMhdpfqPQu3wN1QULomBj+1FimMyREO8QjQ+/tpJaOMwKnx9AK/3hF
	 a+jN0W15KP4zGrPOK/pEcYt2va64+tPvD0LudXz/iyqA1ddGLEefjJk92P8B1pIBDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvNWJ4YE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AB606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvNWJ4YE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D551F00A05;
	Thu, 12 Nov 2026 04:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459505;
	bh=OWSia2nRUPxjPdC7PtqHDFVFHlI8mX7o7181srsUs7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TvNWJ4YEcbPyL2EnjxLrw5KtD8AZw4PFqvXkIGyBP9sVdSFNcYmETR24df9hzWrP/
	 bk6BzPi3g1JFX14tagRSLvS6AlfmniYAujMsG00XUNEmpVX2dfP2LUZPuU38FsQW2Z
	 Anz7vf57ubQhVZYHjs/kk3DK3OvXsyxVG3FFzUzFUhPlD2wMA9022fLQ+8TYZXXJHX
	 IYbcb/CeBxj7lFBjL3vWDoUNqfhKfPxQ06jLcQ/2D3U3GvPqPATDaROAEqztaVSJvw
	 wvoWWFh9Bm9lyTs/U3V2hn65GgXw/wfrReX6x/ATIZI5L1ZHQ+jdO9dMZrxZRQKtXn
	 lmCK0hWjJFE0g==
Message-ID: <sashiko-outbox-210404@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-08-dts-v9-2-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
 <20261112-08-dts-v9-2-c34de4f78fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:58:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] arm64: dts: qcom: ipq5210: missing ssphy_0 pipe clock phandle
  in gcc
- [Low] arm64: dts: qcom: duplicated sdhc properties in
  ipq5210-rdp504.dts
- [Low] arm64: dts: qcom: commit message mismatch on QPIC BAM and file
  rename
--

commit feb4d109494ac58f48292db37ef205aa3dd5e3c3
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file

This commit factors common board nodes out of ipq5210-rdp504.dts into
ipq5210-rdp504-common.dtsi and adds USB, PCIe, and QPIC SPI NAND nodes
for the RDP504 board.

> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
>
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

[Severity: Low]
Is the commit message accurate about enabling QPIC BAM and renaming
ipq5210-rdp504.dts?

Neither ipq5210-rdp504-common.dtsi nor ipq5210-rdp504.dts references or
enables qpic_bam, which was already set to status =3D "okay" unconditionally
in arch/arm64/boot/dts/qcom/ipq5210.dtsi.  Also, ipq5210-rdp504.dts is not
renamed; it is kept as the eMMC variant DTS while shared nodes are moved to
ipq5210-rdp504-common.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/a=
rm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> new file mode 100644
> index 0000000000000..6fb8666ffbfda
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
[ ... ]
> +&sdhc {
> +	max-frequency =3D <192000000>;
> +	bus-width =3D <4>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	pinctrl-0 =3D <&sdhc_default_state>;
> +	pinctrl-names =3D "default";
> +};
> +
> +&sleep_clk {
> +	clock-frequency =3D <32000>;
> +};
> +
> +&ssphy_0 {
> +	vdda-pll-supply =3D <&vreg_misc_1p8>;
> +	vdda-phy-supply =3D <&vreg_misc_0p925>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Does enabling ssphy_0 leave gcc_usb0_pipe_clk_src and gcc_usb0_pipe_clk
orphaned because gcc has <0> instead of <&ssphy_0> at clock index 4 in
ipq5210.dtsi?

When ssphy_0 probes, qmp_usb_probe() registers the 125 MHz usb0_pipe_clk
provider and requests <&gcc GCC_USB0_PIPE_CLK>.  In
drivers/clk/qcom/gcc-ipq5210.c, gcc_usb0_pipe_clk_src resolves its parent
solely through .parent_data =3D { .index =3D DT_USB3_PHY0_CC_PIPE_CLK } (in=
dex
4), but commit "arm64: dts: qcom: ipq5210: Add nodes for multiple
peripherals" left index 4 of gcc clocks as <0>:

arch/arm64/boot/dts/qcom/ipq5210.dtsi:
		gcc: clock-controller@1800000 {
			...
			clocks =3D <&xo_board>,
				 <&sleep_clk>,
				 <&pcie0_phy>,
				 <&pcie1_phy>,
				 <0>,
				 <0>;

Because index 4 is <0>, of_parse_clkspec() returns -ENOENT when resolving
gcc_usb0_pipe_clk_src's parent, leaving gcc_usb0_pipe_clk_src and
gcc_usb0_pipe_clk permanently orphaned with a reported rate of 0 Hz and
never preparing or enabling usb0_pipe_clk as their parent.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boo=
t/dts/qcom/ipq5210-rdp504.dts
> index 519307c6b61e5..43cdb981a4baa 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> @@ -5,30 +5,11 @@
> =20
>  /dts-v1/;
> =20
> -#include "ipq5210.dtsi"
> +#include "ipq5210-rdp504-common.dtsi"
> =20
>  / {
> -	model =3D "Qualcomm Technologies, Inc. IPQ5210 RDP504";
> +	model =3D "Qualcomm Technologies, Inc. IPQ5210 RDP504 (eMMC)";
>  	compatible =3D "qcom,ipq5210-rdp504", "qcom,ipq5210";
> -
> -	aliases {
> -		serial0 =3D &uart1;
> -	};
> -
> -	chosen {
> -		stdout-path =3D "serial0";
> -	};
> -};
> -
> -/*
> - * The bootstrap pins for the board select the XO clock frequency that
> - * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
> - * enables the right dividers, to ensure the reference clock output
> - * from WiFi to the CMN PLL is 48 MHz.
> - */
> -&ref_48mhz_clk {
> -	clock-div =3D <1>;
> -	clock-mult =3D <1>;
>  };
> =20
>  &sdhc {
> @@ -41,59 +22,3 @@ &sdhc {
> =20
>  	status =3D "okay";
>  };

[Severity: Low]
This isn't a bug, but &sdhc in ipq5210-rdp504.dts repeats max-frequency,
bus-width, mmc-ddr-1_8v, mmc-hs200-1_8v, pinctrl-0, and pinctrl-names,
which are already defined in &sdhc in ipq5210-rdp504-common.dtsi.  Can
ipq5210-rdp504.dts just set status =3D "okay" on &sdhc?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-08-dts-v9-=
0-c34de4f78fbb@oss.qualcomm.com?part=3D2
