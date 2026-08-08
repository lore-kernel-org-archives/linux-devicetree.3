Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26E30C152
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 17:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209152; cv=none; b=ZdL7bJqswuHqAQC09OKYpyjw0sQXQ7fBCYaeopeeMXDNTbagCr4j+jJNs8X4k8v/pQhXO5cDTwysjkp066EPsXEDPHkWajezf9/zH/VOF8RqaRwEksWYtlfK+9rPUbhNPYP1kNTWDPfP3f4R2Y4Q1eNYWkCUVfdwrAr5qj2aeLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209152; c=relaxed/simple;
	bh=pVOEx0ClCHExvGMPnD2iLLT5iz4NbHaO1Gbjw6aAkVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UJiCAb0n1vVfYsZ1bORp5mPm71mShu1/4hDpPEKefSDwvsuwvoyof/cgBXI3qkDzkz0bTeIkOH/Xr/a04eKm8Z1d2Z/QzQPsrwV/tEeKoPxIpBn2rWoSwB32TR853Gvee6PgKHTOQ00h0BP4520/a4k3gchWHLoYjidFIW21CpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htm5DP/M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htm5DP/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E16E1F000E9;
	Sat,  8 Aug 2026 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786209151;
	bh=K+aaRkdpMD0XcrPpwIiRzQ1cQgS42uVVluWUqoBKat0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htm5DP/M6+zNfH4A+Hd82iTRGph/eS0Gt5ZH5Y1jeEmktv6UP+DduO0NueQde2NPF
	 ItlM8NshXrIXb4fxEs9dcceHD3DW4uqKl8Hm5iXZVhN0fQUMCeTK78XCsi1Yu0Z1Ly
	 0AFzvLNz+GpuXgDvKqkLsxJXlrIlBc49exKj+2XdiNjm6T+xMRnt22LT7FVgZy9y+O
	 orMiefOyfMtFDoLYkavKuN1aouF9pOhBmEB/wliSTJBMn64NmhwtIDKDYeY8WmEe1L
	 KKWAc4TnLMgTajq06xJ5Tp8ArlyDvzCCDziCHqnsOJYKmATzm+wsG1/LJ9cno/s3P6
	 HqDhggin7ms7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 08/11] net: mdio: realtek-rtl9300: Check
 for C45 support during setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807171058.522833-9-markus.stockhausen@gmx.de>
References: <20260807171058.522833-1-markus.stockhausen@gmx.de>
 <20260807171058.522833-9-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 17:12:29 +0000
Message-Id: <20260808171230.8E16E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The format string in `dev_err_probe` uses `%d` to print a `u32` var=
iable (`bus`).
--

--- Patch [8]: [PATCH net-next v13 08/11] net: mdio: realtek-rtl9300: Check=
 for C45 support during setup ---
commit e8d34ab1b625442557bbfb76ca4546a7c625a18a
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Check for C45 support during setup

This commit adds a consistency check in the mapping helper to abort setup if
the devicetree defines a C45 PHY for a device without C45 read/write
capabilities.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 88ba73b2ee812..22b1c4e05354c 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
> @@ -782,8 +782,14 @@ static int otto_emdio_map_ports(struct device *dev)
[ ... ]
> -		if (of_device_is_compatible(phy_dn, "ethernet-phy-ieee802.3-c45"))
> +		if (of_device_is_compatible(phy_dn, "ethernet-phy-ieee802.3-c45")) {
> +			if (!priv->info->read_c45 || !priv->info->write_c45) {
> +				err =3D dev_err_probe(dev, -EOPNOTSUPP,
> +						    "bus %d does not support C45 access\n", bus);

[Severity: Low]
This isn't a bug, but should this format string use %u instead of %d?

Since bus is a u32 variable, printing it with a signed format specifier is a
type mismatch. The value will likely remain small enough to print correctly
without overflowing, but using %u would be more precise.

> +				goto put_nodes;
> +			}
>  			priv->smi_bus_is_c45[bus] =3D true;
> +		}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807171058.5228=
33-1-markus.stockhausen@gmx.de?part=3D8
