Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CDC37F725
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525751; cv=none; b=K6uijElvu6EiANXYPp5am35U+oDROrxGZyzYLkwooa27+ffdXLOGgqkDtJntveN692CbNdzge0z7Hvb7PU+IbjW8lDZprTkBMrC8Z6K4pIY7rvHeVvK6+JALBJ4wCNQlFjQgamuRSmTPA8PtwyHabe7Fv5VeXkcYsH2fjUss0pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525751; c=relaxed/simple;
	bh=/fZ8bwtzmiRuBWoXIsZ9P2x5fkxlGQaLn2VBU2CjaiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KX/RcykIEbAyt6UmsL3zrjBDKBlNXp4PKbRT0CH2ipsDJxe4piNzbgbof4IKwm4iKPfh45a8NW295A/ik134pK042epn18HT2llnv4Bg6McpGeTnJ9wr9EHIDagMFSW0snozzOmGQQhvAwy8x4FJJDX4Wz327/eD6TyH6VxoNgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwOsel/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwOsel/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C82B1F000E9;
	Wed,  8 Jul 2026 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783525750;
	bh=aJ6RDihUTRgeEPGZP5lRAILKjcIskQ/tzLKEQR7BK0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iwOsel/lPpcHpP26j4Gje0LRJNptsGJtuLaf4IUjamm7ChwIpFX4RVIHuGcWHUX9h
	 DVXXOVuE383wYCQaldpdEPo35OxYWJLhy/0RZ2xvkhgn0LLnf0raBWwCbNKLIt8UQw
	 SIBuIF7NvTxU1aBJGWVwu6kwOsKvUEzCtBExhI1y0B4uX2gKo4mgp+6PvfhtE7vId7
	 W6b75bpwUGzHOZzcHj1KAO+RjQT9FL6R4XexXZO9BeS9aj05j1R/RYqJ6kEhrlrYpK
	 VrwwpBGuKeWtV5qJdgfc/IgZ4gOJzShfWT/m+T+sUu6S3E1DyLKhuJIZRbjqyhRegn
	 WvvK84JKZ9fkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <39091b1d0c716da3502a691d0a0bdb7621693cf5.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <39091b1d0c716da3502a691d0a0bdb7621693cf5.1783524645.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:49:09 +0000
Message-Id: <20260708154910.0C82B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing 8250 port unregistration on probe error paths leads to Use=
-After-Free.
--

--- Patch [7]: [PATCH v4 7/7] ARM: dts: aspeed: g6: add aspeed,vuart-over-p=
ci prop to vuart3 and 4 ---
commit ab6072ba3517ecf2daa88b15c7fd964dcebb0912
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

This commit adds the aspeed,vuart-over-pci property and a syscon phandle to
VUART 3 and 4 to indicate they are VUART over PCI.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 7c02633f2bd69..2b51749300f87 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
>  				reg-shift =3D <2>;
>  				interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&syscon ASPEED_CLK_APB2>;
> +				syscon =3D <&syscon>;
>  				no-loopback-test;
> +				aspeed,vuart-over-pci;

[Severity: High]
This is a pre-existing issue, but adding this property exposes a new
failure path in the driver that triggers a use-after-free.

If aspeed_ast2600_vuart_over_pci_set_enabled() fails during
aspeed_vuart_probe(), the code jumps to the err_sysfs_remove label:

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
...
err_sysfs_remove:
        sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
        return rc;
}

This error path returns without calling serial8250_unregister_port() or
timer_delete_sync(). Because the probe failed, the devm_ framework
automatically frees the vuart struct. However, the 8250 serial core still
has the port registered from an earlier call to
serial8250_register_8250_port(), resulting in a dangling pointer.

Could this allow a local user who opens the port to trigger a
use-after-free in aspeed_vuart_startup() when it dereferences vuart->port?

>  				status =3D "disabled";
>  			};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783524645.gi=
t.gregoire.layet@9elements.com?part=3D7
