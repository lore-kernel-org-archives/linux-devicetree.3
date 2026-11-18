Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993946;
	b=unJeg0R3QHMLA/WVlpSV7skSh7o72DJgQQQv6B4RX4becyIjIYwYYo+0/0Ux1mIqOJCp
	 7ZoiOwm3v1gYI4AM8SE5c1PtoCSVVoycSmSsJdoIRl2gWRhVjtlFsV5LWKxe+ifSGeH0E
	 pEdrx4Ml7OtEtZrUpaGCApSIOoLn8fh84WCye9wN8xGaGN+aPBUeYGKrCoZsvTo6iuYPi
	 UOzPnu1MSW1g0CH676ZFaoERSYIJB1SnWe6Z5f/bpSFLAjq28CPyNCwnFo/M46LpQ77MT
	 0u4kQcRW3sYko9HjItOS1UPhRpVGDciUy9QkXI5d1l1fqC5JrjEV+of3q2epfmCAkpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993946;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9/PRlmiH4bavLxrPT+kZzGP/3whivXydaknrQraTA8s=;
	b=t5RTI/0VQE+6YW70OeuyFc1m7yCLJ9ySr1JLFxoDqN/G6S7KoSwSP/xrFJSO1LyJapMH
	 t7L0SuYneSDGYg78ZX5yOF18pVXqeuTux1DlFqjWA63kwW9gCuKjE6NLsMXznDF+8IFQl
	 T0NGg1pUnJP879gJPyGyrASHeMVWIDp69CxrvZP9SYondnqoxljGTm/UHQFNEb8pgxny6
	 XxdlHBme/f5R4jX8qcBW7lniooUtR1FWs6UTn2mFzH2hS6tRC4kg/qxu6BSSSMUkm06xB
	 NvCAk8VdaCZ/AW0g3TISrVpk2IxhCwD9Pj1EodNYj0DmSQrfBKzvtc603zcJ8PXp7sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1aY6cOo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62F606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1aY6cOo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841911F000C5;
	Wed, 18 Nov 2026 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993945;
	bh=9/PRlmiH4bavLxrPT+kZzGP/3whivXydaknrQraTA8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z1aY6cOoKaPRaOwzAC0Dy+PzUchx7/lJ42bU0xRJEXC0HXaWvj73AEH1bc8+W09fx
	 CUBCNSnUahiBAjHci33YzOQ88bv42bp6HVpRvdDjmkuFwYhud4LboSpaApqPtbf17D
	 28WoKBrjYPyAN0bYzApzOuZUtBWfv4uXTVhlbNFV/znxGRQ46ulP1Saxj2MOg4dhbN
	 4/JqSlvgosmbgJXXB73Xm+ngl8YoR6qUULwfgR4NSYX8BdUNDdVr95/rfn7BMUkva4
	 ftedmtZ64GNmLRYpY/LXo6dpbMvbaplw6/087du1gK2KEAX1TBFRuf336PVzPFYbYd
	 LL6veGueEzh4A==
Message-ID: <sashiko-outbox-220555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Describe the K3 eSPI
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Yang" <yang.wang@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118085742.1817536-8-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-8-yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:25:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] riscv: dts: spacemit: espi0 sets pr-mem-base1 to MMIO base in
  k3.dtsi
- [Medium] bus: spacemit-k3-espi: spacemit_espi_property_enabled()
  always returns true
- [Medium] bus: spacemit-k3-espi: spacemit_espi_init_locked() sets rate
  on sclk mux
- [Medium] riscv: dts: spacemit: espi0-0-pins uses bare bias-pull-up in
  k3-pinctrl.dtsi
--

commit 39603178b0636a387372665a38106a9b79fae1a8
Author: Wang Yang <yang.wang@deepcomputing.io>

riscv: dts: spacemit: Describe the K3 eSPI controller

This commit adds the disabled eSPI controller device node to the SpacemiT
K3 SoC devicetree.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index e89d2cc5ca8cc..d859c84bbaa1d 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -648,6 +648,37 @@ gmac1_axi_setup: stmmac-axi-config {
>  			};
>  		};
> =20
> +		espi0: espi@cac8c000 {
> +			compatible =3D "spacemit,k3-espi";
> +			reg =3D <0x0 0xcac8c000 0x0 0x1000>;
> +			ranges =3D <0x0 0x0 0x84000000 0x1000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			pr-mem-base0 =3D <0x84000000>;
> +			pr-mem-base1 =3D <0xcac8c000>;

[Severity: Medium]
Should pr-mem-base1 be 0x85000000 (or omitted so the driver defaults to
pr-mem-base0 + SZ_16M) instead of 0xcac8c000?

0xcac8c000 is the eSPI controller's own MMIO control register block, and
spacemit_espi_program_window() writes pr-mem-base1 into
ESPI_PR_BASE_ADDR_MEM1 as the second peripheral memory translation window
base.  Setting it to 0xcac8c000 breaks peripheral channel accesses that use
the second memory translation window and points them at the controller's
own registers.

> +			clocks =3D <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>,
> +				 <&syscon_apmu CLK_APMU_ESPI_SCLK>,
> +				 <&syscon_apmu CLK_APMU_ESPI_MCLK>;
> +			clock-names =3D "sclk_src", "sclk", "mclk";

[Severity: Medium]
Does setting the serial clock rate via espi->sclk work when
operating-frequency differs from the initial parent clock rate?

In commit "bus: Add SpacemiT K3 eSPI controller support",
spacemit_espi_probe() only acquires "sclk", and
spacemit_espi_init_locked() calls clk_set_rate() on espi->sclk before link
frequency negotiation:

drivers/bus/spacemit-k3-espi.c:spacemit_espi_init_locked() {
    ...
	if (espi->sclk && !IS_ERR(espi->sclk) && espi->op_freq_mhz) {
		ret =3D clk_set_rate(espi->sclk, espi->op_freq_mhz * 1000000UL);
		if (ret)
			dev_dbg(espi->dev, "failed to set sclk rate: %d\n", ret);
	}
    ...
}

In drivers/clk/spacemit/ccu-k3.c, espi_sclk is defined without
CLK_SET_RATE_PARENT, while espi_sclk_src holds the 20/25/33/50/66 MHz parent
mux.  Calling clk_set_rate() on espi->sclk does not switch espi_sclk_src,
and if slave negotiation lowers the frequency, the controller and slave are
configured for a rate that does not match the actual serial clock.

> +			resets =3D <&syscon_apmu RESET_APMU_ESPI_MCLK>,
> +				 <&syscon_apmu RESET_APMU_ESPI_SCLK>;
> +			assigned-clocks =3D <&syscon_apmu CLK_APMU_ESPI_SCLK>;
> +			assigned-clock-parents =3D <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>;
> +			operating-frequency =3D <20>;
> +			io-mode =3D "single";
> +			alert-mode =3D "io1";
> +			alert-type =3D "open-drain";
> +			watchdog-timeout =3D <0xffff>;
> +			crc-enable;
> +			auto-gating-enable;
> +			peripheral-channel-enable;
> +			vwire-channel-enable;
> +			oob-channel-enable;
> +			flash-channel-enable;

[Severity: Medium]
Can a board devicetree disable any of these six boolean properties?

In commit "bus: Add SpacemiT K3 eSPI controller support",
spacemit_espi_parse_dt() parses these properties with default_value =3D tru=
e:

drivers/bus/spacemit-k3-espi.c:spacemit_espi_property_enabled() {
	if (of_find_property(np, name, NULL))
		return of_property_read_bool(np, name);

	return default_value;
}

When a boolean property is present, of_property_read_bool() returns true;
when it is omitted or removed with /delete-property/ in a board dts,
of_find_property() is NULL and spacemit_espi_property_enabled() returns
default_value, which is also true.

[Severity: Medium]
Also, in commit "riscv: dts: spacemit: Add K3 eSPI pin group", does
espi0-0-pins configure a strong pull-up instead of the intended normal
pull-up?

arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi:
		espi0-0-pins {
			pinctrl-single,pins =3D <
				K3_PADCONF(GPIO_115, MUX_MODE2)	/* espi_dat0 */
				...
			>;
			bias-pull-up;			/* normal pull-up */
			drive-strength =3D <25>;		/* DS8 */
			power-source =3D <1800>;
		};

The spacemit,k1-pinctrl binding requires a u32 argument (0 for normal
pull-up, 1 for strong pull-up), as used elsewhere in k3-pinctrl.dtsi with
bias-pull-up =3D <0>.  With a bare bias-pull-up property, pinconf-generic
passes the default argument of 1, causing spacemit_pinconf_generate_config()
to set PAD_STRONG_PULL and failing dtbs_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118085742.1817=
536-1-yang.wang@deepcomputing.io?part=3D7
