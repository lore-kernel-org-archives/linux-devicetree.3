Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B5416CEF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597814; cv=none; b=AGWYLIgpCnCHnVRZJgUdooXoupPxIAYBmr0x6PBo6l0AYqyaTI0nxu0sh1tDiOTFCvf1kxBtVrJy+G1uqQ2D+A7ZrCCnp471aZgRSf3faJFiByLIta99l/oKkUZud6UplQaF8VimRYp1cqlZkz9JybeAiAqqQdpaNW2HZV/e5Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597814; c=relaxed/simple;
	bh=lPQo5v0+fjfvvbWCIZozxzvHTC4DR92jVgKKiw6jkXY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gy0489HvrJAdRosyORwmdtQ2pB5Q99XJTGkerPGVPAWAibyJlM4Ifh8XDXpnxoT+A/RP/iW1XQ8Bx5x+0kgDUJYNpnGX+2KmHxyqXkX0M2kelZkR6shKtbWVoCd8nDLSzMopsloonwAOnGnACUBnlfRzXxZWOrNuiJaK7G40WpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFdu5//T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFdu5//T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D920B1F000E9;
	Thu,  9 Jul 2026 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597812;
	bh=rEz2WhRFJH1R98Rbiao/B1aZVBCkrvCJeCN9h3ZRwz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iFdu5//TIAzQhl+OHkQt+4ZAN9ohL1g7H6WX1tgTMid93Vqv0N3PgjLfyJz2t0sfp
	 R4xE6d0BuhcVd/PDNup6Jdctq9JK+D4i/PmwXptym1+Ou2cyEYqd0bET0g+JN/pbw+
	 jymrB8OrUGgMfWc6rHJ8aD9Rfai+dSvSrE06pQtMMByoDQfROq/tD9LcOKYbrwF+vv
	 rx3uXSIH+YCPlmZaFqj7rzPbzXmsUxszMw3ofxDuYeoPbViAwZuR8hWGpGXghpvmRp
	 C6uyHXDSTwLmSnxBy51HfdXk41zGrAPawJm0ecn1NNYrVdGFxEuS2ILEA9fYCf1U2u
	 0YJUHz9CWW5iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709112006.390742-6-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-6-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:50:10 +0000
Message-Id: <20260709115011.D920B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qspi2` node is missing `dmas` and `dma-names` properties (u=
nlike `qspi0`), which degrades performance to PIO mode and causes the atmel=
-quadspi driver to log a spurious error during probe.
--

--- Patch [5]: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI node=
s ---
commit 297e92dccc7e525621a995eb1402956ad591b3bf
Author: Robert Marko <robert.marko@sartura.hr>

arm64: dts: microchip: lan969x: add QSPI nodes

This commit adds device tree nodes for both QSPI controllers on the Microch=
ip
LAN969x SoC. It configures base addresses, interrupts, and clocks for the
controllers.

> diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot=
/dts/microchip/lan9691.dtsi
> index ed997d87dd09f..a8541c6a098d1 100644
> --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi

[ ... ]

> @@ -396,6 +396,39 @@ clks: clock-controller@e00c00b4 {
>  			clock-names =3D "cpu", "ddr", "sys";
>  		};
> =20
> +		qspi0: spi@e0804000 {
> +			compatible =3D "microchip,lan9691-qspi";

[ ... ]

> +			dmas =3D <&dma AT91_XDMAC_DT_PERID(1)>,
> +			       <&dma AT91_XDMAC_DT_PERID(0)>;
> +			dma-names =3D "tx", "rx";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		qspi2: spi@e0834000 {
> +			compatible =3D "microchip,lan9691-qspi";
> +			reg =3D <0xe0834000 0x00000100>,
> +			      <0x30000000 0x04000000>;
> +			reg-names =3D "qspi_base", "qspi_mmap";
> +			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&fabric_clk>, <&clks GCK_ID_QSPI2>;
> +			clock-names =3D "pclk", "gclk";
> +			assigned-clocks =3D <&clks GCK_ID_QSPI2>;
> +			assigned-clock-rates =3D <100000000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Is it intentional that qspi2 is missing the dmas and dma-names properties?

During probe, the atmel-quadspi driver unconditionally checks for dma since
aq->caps->has_dma is true for LAN969x compatible strings, and then calls
atmel_qspi_dma_init().

Without the dmas property present here, devm_dma_request_chan() returns
-ENODEV. The driver handles this with dev_err_probe(), which emits a
kernel error log ('error -ENODEV: RX DMA channel is not available') because
it is not -EPROBE_DEFER.

The controller will then fall back to pio mode, degrading performance.

If the hardware supports dma for qspi2, should these properties be added?
If it does not, should the driver be updated to avoid unconditionally setti=
ng
has_dma to true for all instances?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709112006.3907=
42-1-robert.marko@sartura.hr?part=3D5
