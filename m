Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D391A6803
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782667052; cv=none; b=aJz6AFaHkgsgYsWncRG5f3IIM+0tJKMh6aU7Ve18C3yBlssIbIek4TwTRnYDJuIjUtw94S6jLsXwDZSFCMm2Ztphx7ntizWkRZiQFTl6FlpapMS48nNohwiMGySS/SSCrE7rhHuhhZP3DVWWAhIY+VvWjUrUsBuyxlDV6t0hJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782667052; c=relaxed/simple;
	bh=WIosnj4oopLqmC2AeoA8fsRfleP45kvUei92xcLiqyE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A0yqKuH49+BMiiPBdVJYzXoI45N/bHLXO6fzLUiCBAcmSvsRd9JZgykhdDIX5xZ7WTTJyRZnCAbJiA+RoyD74aQcRAJepuP/OnixUFj/kBw8vJH7i2n8NaspfrdECbKtBvFvCuKZRk/nihcpjj0ZPeKkRuOZZ68/pLp3cCPOX8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnJdFkYB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnJdFkYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC841F000E9;
	Sun, 28 Jun 2026 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782667051;
	bh=rEBKxLNRDkgSg90UzFnxsawJdj9zTK+YRk7zp5BPZ+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZnJdFkYBCHnxu2sP7CCYgo+nHB3VoH/i2iyexb/qDNpwW6DwcJBWMdb50HRKxnY03
	 IgcbayMRtx9oypwald6liBEgmcBrGnTgyzLZMPCffJGxmKjF4dO4lp+mNwvLOeDETV
	 vkm8kO37TYagbKXzxKc5HHtZrcJALQdnxvk3yWCZ8oneQA1TTRX+vfLRRqAuMuZuQG
	 jnPAfIgR+uzCzuKnAKFC6khlhAjo3fERIQ6OPJKkkGYeWNZqZiVxAlH1F/ZaD2ezDC
	 uCfyvjKaJFWmBBwul1gYCN+42C+vu/1Q1OeA8XJtsTvnmiUKTTaqIYb7gDGuZbVgGC
	 ZMdu4546w/GVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d89ea82a4bbba9b97c7128b4a1c0e5b857a921ed.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
 <d89ea82a4bbba9b97c7128b4a1c0e5b857a921ed.1782665899.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 17:17:30 +0000
Message-Id: <20260628171731.4FC841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Replacing PHY `reset-gpios` with an unhandled `vdd-supply` regulat=
or without `regulator-always-on` will cause the kernel to erroneously reset=
 the PHY, breaking Ethernet connectivity.
- [Medium] TI-specific PHY properties are erroneously applied to an Analog =
Devices PHY.
--

commit 3f60b20a54eb8dc897529e8f7d0ac14da1c7808f
Author: Stefano Radaelli <stefano.radaelli21@gmail.com>

arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration

Enable the CPSW Ethernet controller and correct the Ethernet PHY
description by modelling the PHY power supply and adding the required
board-specific PHY properties.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> index fc5a3942cde00..be19cbaffc4b0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -113,6 +113,15 @@ reg_3v3_phy: regulator-3v3-phy {
>  		regulator-always-on;
>  	};
> =20
> +	reg_eth_phy_vdd: regulator-eth-vdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "reg_eth_phy_vdd";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&main_gpio0 46 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +

[Severity: High]
Does this code cause the PHY to be erroneously reset during late init, brea=
king
Ethernet connectivity?

Since the kernel PHY drivers do not handle the vdd-supply property, this
regulator will have no consumers. Without regulator-always-on, it will be
disabled by regulator_init_complete() during late init.

Disabling this regulator drives the active-high GPIO (main_gpio0 46) low,
which will assert the PHY's physical active-low reset pin.

Additionally, the required 100ms hardware initialization delay is lost since
this new regulator lacks a corresponding startup-delay-us property.

[ ... ]

> @@ -159,9 +169,10 @@ &cpsw3g_mdio {
>  	cpsw3g_phy0: ethernet-phy@4 {
>  		compatible =3D "ethernet-phy-id0283.bc30";
>  		reg =3D <4>;
> -		reset-gpios =3D <&main_gpio0 46 GPIO_ACTIVE_LOW>;
> -		reset-assert-us =3D <10000>;
> -		reset-deassert-us =3D <100000>;
> +		bootph-all;
> +		enet-phy-lane-no-swap;
> +		vdd-supply =3D <&reg_eth_phy_vdd>;
> +		ti,min-output-impedance;
>  	};
>  };

[Severity: Medium]
Are these TI-specific properties (ti,min-output-impedance and
enet-phy-lane-no-swap) correct for an Analog Devices ADIN1300 PHY
(ethernet-phy-id0283.bc30)?

If the hardware is actually an ADIN1300, these TI properties are ignored by
the adin.c driver. If it is a TI PHY, the kernel will bind the wrong driver
due to the incorrect compatible string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782665899.gi=
t.stefano.r@variscite.com?part=3D1
