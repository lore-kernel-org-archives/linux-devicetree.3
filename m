Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C252874F5;
	Mon, 25 May 2026 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779742526; cv=none; b=CHtFiNLmtuC2c0iXK4RdwncTrKRNxP5UJJfAUjLbgJwoLccr5Y2gpSZ32tKrxmuoYdgZmv5CQvCL1nwrKlswR3s97IHniBqq2TkM4KPlI8qyD7Nww+BJTVIornmyM7P+5xXQuwBb6mYWRHppPcIQC7LjyavAnPF6exstRnzdXeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779742526; c=relaxed/simple;
	bh=ABhzskZJgcSnS5kobwVapR0a66LDEanDvEBlKJa+Tpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyLcbp9nwQGoR3EeeWanQJHzbXIop4sSPcuFv/OwTGJCeDtQ7WMk+w3H/fkmZvhShqqzBNOppdHHgvh2OnMhcW6w761mOevM7h3AhgR4Joj3k/7L1ENGBS3btAdMJWw3HvD/BjH842nT+M1mPPQp5itOitOVfcARPBeFGc3BmQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=g/KgF4ur; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="g/KgF4ur"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xryexlahrodjfyHGFiLzNy4TNoT6+1ZUHKzJpXj+s8g=; b=g/KgF4urScPdkul43AgBJJA3kQ
	a0YeSLIS/quWTGXvPwRLDSUpK12AjfBChS7p8CWcQlSpmE2G2UvId2iw6k7aWVjuFbEwLpfPnZ0WN
	wm+eRvJxUCU1rptmTQX6RD5yUxoROlcvuxMjJODm3b0zO0F7sieQmcOdL2NrUhzniipEMTKQOHcBK
	SMbU/zLiVLZb8/SW43R45gX4O1RJED9GKhAxSxKgF4hTbTA7dEJWxaVtEhz75/9YCuEsk3B0p67H/
	EO8ZFk6+Fp84XK1czfqzqfc30z/dAL2BkufFVbUaUScOjfGq/tFYh9qf/fvnXyPzFfUGIE5yG2Qwv
	lhXZxiGw==;
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 dario.binacchi@amarulasolutions.com,
 Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Axelera AI metis-sbc
Date: Mon, 25 May 2026 22:54:14 +0200
Message-ID: <4976330.xgJ6IN8ObU@phil>
In-Reply-To: <20260522174918.61523-4-patrick.barsanti@amarulasolutions.com>
References:
 <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
 <20260522174918.61523-4-patrick.barsanti@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Freitag, 22. Mai 2026, 19:49:18 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Patrick Barsanti:

[...]

> +	pcie20_avdd0v85: pcie20-avdd0v85 {

Regulator nodes should start with "regulator-", so

    pcie20_avdd0v85: regulator-pcie20-avdd0v85

same for all others.


> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <850000>;
> +		regulator-max-microvolt =3D <850000>;
> +		regulator-name =3D "pcie20_avdd0v85";
> +		vin-supply =3D <&vdda_0v85_s0>;
> +	};



> +&cpu_b0 {
> +	cpu-supply =3D <&vdd_cpu_big0_s0>;
> +	mem-supply =3D <&vdd_cpu_big0_s0>;
> +};

There is no mem-supply in the mainline binidng, and it's the same
regulators anyway. Again, same for all cpu nodes.

You should be able to run something like

  make ARCH=3Darm64 .... CHECK_DTBS=3Dy rockchip/rk3588-metis-sbc.dtb

to find all the binding problems.


> +&gmac0 {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&rgmii_phy0>;
> +	/* Use rgmii-rxid mode to disable rx delay inside Soc */

no need for that comment

> +	phy-mode =3D "rgmii-rxid";
> +	pinctrl-0 =3D <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus>;

please add a pinctrl entry (setting to GPIO) for that reset-pin
Though ... is that the phy-reset ... this should be ideally
described the phy node with its reset-gpios property.

> +	pinctrl-names =3D "default";
> +	tx_delay =3D <0x44>;
> +	snps,reset-gpio =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>; /* GMAC0_RST_N */
> +	snps,reset-active-low;
> +	/* Reset time is 20ms, 100ms for rtl8211f */
> +	snps,reset-delays-us =3D <0 20000 100000>;
> +	status =3D "okay";
> +};
> +


That's how far I got today :-)


Heiko


