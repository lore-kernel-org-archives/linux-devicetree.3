Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4CC42BC52
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266207; cv=none; b=t5kaZPAI13myN9rVdmqGaSA5YkgUytoSvcLUHXoCOJWZUwYPzjzGGegkeXAoFTJF8RCpxqbPDWz9L/Ze9RqsKwy9Hhgf1taZIoo5z9zLikwq5PEDPTtRouKboHUGDIsIlpfQZYtOafLJqpIxKGui2STVcP07yUw53DxbyoJ8ms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266207; c=relaxed/simple;
	bh=wZzrE51hWxKrI5OvoRUwRBKXPtkDJ1EpXd4SKKCdULA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TSpuTrFu5dj4N0zomv7B9bAwPvx2Y713VF7G5txGu7gbRLDW6vccuLR5it5KC+aySMa84KgR2xOj7fUuZJ/IyRYEXQk3hAHoZzV3WBudTSBKmZqP/B2ztHa8z8YNC4FkZiQvrdiXCd33uDaCanLDFxXmp0YhcmiiuJzE97DJ/Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBD+EObO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBD+EObO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC761F00AC4;
	Tue, 28 Jul 2026 19:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266202;
	bh=zkgNGTR0q514OXZlchQ9WIYSrt+9QQ+oFSLXXrYyn9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DBD+EObOFpINKBQwZGXHfEuNEOpdZnrqseA53vyXfnXzJMDDQwEn9hRyby2a9p5H7
	 iHV5A/cPSFqohoG1mUK46zjPH6O+KCOVlCpYZm2qcUPUOidzq6azVcEwQx2t/n2M/u
	 ug8GpfHWgJYCJlTp1VbSvIZtOjbLV8c3XLjroU643wSti6xrXOX1PocfiMu5uPvPaI
	 6DFFkfcZgzPsvuhFB6UYSnHafcnRRV6vvncknpoFgGEyEbwl/nT3p50H28ojJ4GtB6
	 IZACroRQpUFP9+n/Pwl+TJVK9zE0Qnj6y50t/YKHdXoMyfSH69pjuYRZYJOQEvCnvv
	 ngyBepp2BWvNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 5/9] net: mdio: realtek-rtl9300: Configure
 hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727191559.19617-6-markus.stockhausen@gmx.de>
References: <20260727191559.19617-1-markus.stockhausen@gmx.de>
 <20260727191559.19617-6-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:16:41 +0000
Message-Id: <20260728191642.5AC761F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Direct return in `otto_emdio_probe` bypasses the error handling =
cleanup path, leaking the `priv` structure and leaving its mutex un-destroy=
ed.
--

--- Patch [5]: [PATCH net-next v8 5/9] net: mdio: realtek-rtl9300: Configur=
e hardware polling during probing ---
commit 128dff0b4abb09dc89d1f18960a479dceb85538d
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

This commit adds support for configuring hardware polling on Realtek Otto
switches to prevent interference with firmware loading. It disables polling
for all ports at startup, and re-enables it when a PHY is attached.

Link: https://github.com/openwrt/openwrt/blob/main/target/linux/realtek/fil=
es-6.18/drivers/net/mdio/mdio-realtek-otto.c#L818
Link: https://lore.kernel.org/netdev/680696024a8648535ce6dee771fe4de67802e0=
e8.1769053496.git.daniel@makrotopia.org/

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 9529f877248ba..0d5b9530e43b1 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -770,6 +821,10 @@ static int otto_emdio_probe(struct platform_device *=
pdev)
>  		goto err_out;
>  	}
> =20
> +	err =3D otto_emdio_init_polling(priv);
> +	if (err)
> +		return err;

[Severity: Medium]
Does returning directly here leak the priv structure allocated earlier in
otto_emdio_probe() and bypass the error cleanup path?=20

It looks like other error paths in this function use goto err_out to proper=
ly
clean up resources via kref_put. Would taking the err_out path be more
appropriate here?

> +
>  	platform_set_drvdata(pdev, priv);
> =20
>  	err =3D otto_emdio_map_ports(dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727191559.1961=
7-1-markus.stockhausen@gmx.de?part=3D5
