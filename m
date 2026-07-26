Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D523BD06
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785078172; cv=none; b=QXtGoCfm3tj2puXFdFDDtG6XXR6HME5ujr/YhCbNJwam08Bay05m7Kwd7Sq+wM/z8UywdIMMrRSolXgtkCl4IFeD/I7Z/HEuxHLPh4G2eONn7p/5aglt2sVR6I4KD1FZqAG3NmLlLak/O/dvnNJthUo68O938jA/LFMs/+HGqY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785078172; c=relaxed/simple;
	bh=DJH89T++flQRDwgtjXBiuShW5y9LSXGkqJRiY/Eu+2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OQaLpBCxgiToV20913M0/+cqaRoRHvMO/LT8ugOjFR0nxH6aE5cWV5JP5h+KgzDwj0cup3DI45oUFV80JR2vDhEYD1egoNhILu90bjT/WkR0RnltWiowo1F4apmerm3u2MeVInKeMT+SyokJpU85lVw8TwPz+QI1QThNaCXTLPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPIUkq6z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPIUkq6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8157C1F000E9;
	Sun, 26 Jul 2026 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078171;
	bh=Z3DACBE56ZwFLMgfYQH7UyWpQ+If3ko8mfpG2U6ex9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gPIUkq6z5EHLn3RqbfKo4Zo90FebBQ/Zka1MrKi287fel32OZK89e8n4UEqsHPFh+
	 rTh4MC0H42m1IhuReaOvRbUHTx58FEZ8z8YucKjg0kIgy2WCfH9mq6MTZ/ioUDyhr1
	 88mmu1rIk82JiwjrLHJFZsYuNIoP9DkyDcXtBJRNQCeuAtHB24exWSHcJQUadWziPD
	 Oy1Z2S1wUn9Nww7udDALqV3ZH9GauBf+lFQFrzAkueBObIXwKi3O5OoR6OWz/OvYBY
	 NDLwVlIAMds7Oqe20awakMR20/nmWCKf+cqTSeOB4nfrHO211rIG5RKsqPu1jvtSCF
	 jt/rJpgqMkELA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 15:02:50 +0000
Message-Id: <20260726150250.8157C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-binding allows `#phy-cells =3D 2` to represent PHY direct=
ion, but the corresponding driver `phy-rockchip-samsung-dcphy.c` was not up=
dated to support this.
--

--- Patch [1]: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:=
 support per-direction phys ---
commit 421d266fa3318c44780c09224a034b0edeca9db3
Author: Jason Yang <jason98166@gmail.com>
Subject: dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support per-directio=
n phys

This commit updates the Rockchip RK3588 MIPI D-/C-PHY device tree binding
to support per-direction configuration. It changes the #phy-cells property
to allow either 1 or 2 cells, where the optional second cell specifies the
PHY direction (TX or RX).

> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-d=
cphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcph=
y.yaml
> index c8ff5ba22a86b..68a43db9c6690 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.ya=
ml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.ya=
ml
> @@ -20,12 +20,22 @@ properties:
>      maxItems: 1
> =20
>    "#phy-cells":
> -    const: 1
> +    enum: [1, 2]

[Severity: Medium]
Will this new 2-cell configuration work with the current PHY driver?

Looking at samsung_mipi_dcphy_xlate() in
drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c, the driver explicitly
rejects anything other than 1 cell:

	if (args->args_count !=3D 1) {
		dev_err(dev, "invalid number of arguments\n");
		return ERR_PTR(-EINVAL);
	}

If a device tree is updated to use the newly allowed 2-cell configuration
to specify TX/RX direction, won't phy_get() fail and return -EINVAL? Should
the driver be updated alongside the binding so consumers can successfully
acquire the PHY?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-dcphy-rx-v=
1-v2-0-cf9cc34a412a@gmail.com?part=3D1
