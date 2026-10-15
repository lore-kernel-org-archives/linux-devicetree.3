Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F155C51EDF2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070428; cv=none; b=fj95E7GknK1ZBYvmP6X/2dgRRpM5UEeGA3OHwTXw+o9ywLZWCkviZB7vckS4xGbPiTT8RNZZHU45itS/CNDEWA7g/+Ez2ARkyiYcOBDQI67DEbxNW5Q85XMVTP6Z/kObfn0l3u2IgN1h6c9VXti9ODV4u8q2XAjnzXR7+bisL0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070428; c=relaxed/simple;
	bh=QY7dcnKENHyz6hSMKxblOppniQjuIsq7IjJvakdO0Mg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZYdwBX+b5c3VzwmJr0t8PhuwxQiyIP2740PobYKOR/guEG7u8itPuA6dnBAoUDUQ6u4vGNrP4y986rWO7dcJ28Gehfd0q81M908/PtF6Efg3lybcdYcqnmpQI0VMsowrE8WKH6TYcOrTzIuV/5ZbaFmS0CB4Q3VSAFa8vnItnpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5YeWInN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5YeWInN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02A21F000C4;
	Thu, 15 Oct 2026 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070426;
	bh=gOKdZWKanR0iLwqwgZrnyNLrpYLh/eGIzVlxMw/AIak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m5YeWInNAc6x09pdK6cKbBAvJUj4gh9g5TamM9TLfRzlK8dEX/i4vUBj43HyO6gVx
	 EVNXYvoU9BYXMCmyfxTsIV2XBNdraH8rZsdCroX6Tw0pZinVFUCI97F/NGXCLAUARK
	 IL3zSlcU67R6+brPgHtQW3OwtcTHylkmg+6j7GyMUTcEartEW6hw+8sPwpabCNKu/c
	 BimgXC/pQMjenZiTDFucHQBGVFxuND7bcN07HoNvCOkBgJ8T5f7wNyy9sLecWsFZQf
	 s268o/SCcPYzhmY93vStXtvtSKkIhgGY97bT6bKVYctfDn5AdF7DYAeYqryP6jIWX4
	 4zZgQuyTE4srw==
Message-ID: <sashiko-outbox-172925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] arm: dts: altera: add Draeger M48 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015131352.3624327-4-petko.manolov@konsulko.com>
References: <20261015131352.3624327-1-petko.manolov@konsulko.com>
 <20261015131352.3624327-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:20:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: socfpga: misplaced snps,dwmac-mdio compatible string breaks e=
thernet
--

commit 2a1e9ba4738dc175386bf567bcce3c8d3aa0f021
Author: Petko Manolov <petko.manolov@konsulko.com>
Subject: arm: dts: altera: add Draeger M48 CPU Module

This commit adds the device tree for the Altera SoCFPGA Cyclone 5 portion
of the Draeger M48 board.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..f19e24c80e89a
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
[ ... ]
> +&gmac0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii";
> +	phy-handle =3D <&ethphy>;
> +
> +	mdio0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy: ethernet-phy@0 {
> +			compatible =3D "snps,dwmac-mdio";

[Severity: High]
Does this compatible string belong in the parent mdio0 node instead of the
PHY node?

During board boot, the STMMAC ethernet driver (stmmac_of_get_mdio()) attemp=
ts
to discover and register the MDIO bus by iterating over the MAC's direct
child nodes to find the one with the compatible =3D "snps,dwmac-mdio" prope=
rty.

Because mdio0 lacks the compatible string, the driver fails to locate the
MDIO controller, leading to an aborted MDIO bus registration. Furthermore,
the PHY node is assigned a wrong compatible string (it should either be
omitted to let the generic PHY driver probe via PHY ID, or use a standard
PHY compatible like ethernet-phy-ieee802.3-c22).

Will this cause a complete failure of the Ethernet interface on this board?

> +			reg =3D <0>;
> +			rxc-skew-ps  =3D <1860>;
> +			rxd0-skew-ps =3D <0>;
> +			rxd1-skew-ps =3D <0>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015131352.3624=
327-1-petko.manolov@konsulko.com?part=3D3
