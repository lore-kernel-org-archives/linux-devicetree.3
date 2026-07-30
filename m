Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208E449B30
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427412; cv=none; b=UMipVOHT1Bg7XoBV4uN92ZcP3e9UBWiqQ/HGFDRkxdOkSF7lk4CQYJx0OSSPGGstBYoxv8e2ZceD2XixKcZDDNXMVmus0ustnoj9OY8kFnnXtIi0EwfXmupSJ2RdqbA+yxRkowsjICAYBxpVmzg1CRdWXPjm0r/wL1Gli9G2Wpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427412; c=relaxed/simple;
	bh=6blEbUQmhIe4W8+x5KpSirBXgZPuQtXCp+XrgnN1x/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MsvZG7tgc1+47v6BRIXC24VC3hW74ggbqxh68l2EEsgI7IWDFqPAJDwW2J4ZeouYgBG6st37c4M/iG9wckVjcAM8K7ooH4py2HBDFH8e9BLNIV5bUSMQ2juDt9Ffbsb4x2k+QPeimSu7g8HUPrb2b0sogBioPdokWeBk09FuDFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFVDGMrI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFVDGMrI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A471F00ACF;
	Thu, 30 Jul 2026 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427411;
	bh=m64YcKQN5oknpVDxKpVPF7nnRffc765ph6w2nl2v2ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DFVDGMrIxZTERTeMO+WI7vGaCQmCtShsrrroe4X4NL8w76mtWwoBxEEA3oZyKi+KH
	 wAhXEcBamJAv77ZVBNUgmgorROrx204KnwUyyi2HIfCf0T3hmI5tYOTl2oI2WyP60b
	 TaShty5LscQfvHaqN9K5Jn9dorW3H8SrBi3O+EXIh7TJeEGUnk98XQ3CYG0+oZoVvH
	 qwbK0lO3sFdcE8oy0Y3I20XSjUhk2V5Afwchy6yQ2hZPzldLN4DJ3/cmDut5mPtoHy
	 yjbu81H17Mjd3s7Ri0zCDWyZQEI7laBTGH6OLlFvlwcznkaQNnCsOC3S42ohISTtKr
	 AD1rm9UdQKnUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 4/9] net: mdio: realtek-rtl9300: extend
 controller structure lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729160227.155613-5-markus.stockhausen@gmx.de>
References: <20260729160227.155613-1-markus.stockhausen@gmx.de>
 <20260729160227.155613-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:03:30 +0000
Message-Id: <20260730160331.03A471F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Calling devm_add_action_or_reset() on the uninitialized &bus->=
dev causes a guaranteed NULL pointer dereference, and on error paths leaks =
resources.
--

--- Patch [4]: [PATCH net-next v8 4/9] net: mdio: realtek-rtl9300: extend c=
ontroller structure lifetime ---
commit 34bdc9b9e9ece2a1428b242a3ed3e140500fd37f
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: extend controller structure lifetime

This patch changes the allocation of the otto_emdio_priv structure from
devm_kzalloc() to kzalloc() and introduces a kref counter. It attempts to
decouple the controller's lifetime from the platform device by tying it
to the registered MDIO buses via devm_add_action_or_reset().

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 73ac5fdcd2674..3b99978a2511e 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -617,6 +634,11 @@ static int otto_emdio_probe_one(struct device *dev, =
struct otto_emdio_priv *priv
> =20
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", dev_name(dev), mdio_bus);
> =20
> +	kref_get(&priv->kref);
> +	err =3D devm_add_action_or_reset(&bus->dev, otto_emdio_cleanup_bus, pri=
v);

[Severity: Critical]
Will this cause a list corruption crash unconditionally on every probe?

The bus structure is allocated via devm_mdiobus_alloc_size(), which returns
zero-initialized memory, meaning bus->dev.devres_head is uninitialized.
Calling devm_add_action_or_reset() here will attempt to append to this
zero-initialized list.

Additionally, if the crash is bypassed, devm_of_mdiobus_register() later
calls device_initialize(&bus->dev). This resets devres_head to empty,
destroying the action and leaking the kref.

Finally, if mdiobus_register() is never reached on an error path,
mdiobus_free() handles the MDIOBUS_ALLOCATED state by directly calling
kfree(bus). This bypasses device_release() and devres_release_all(),
permanently leaking the devres structure and the priv kref.

> +	if (err)
> +		return dev_err_probe(dev, err, "cannot register cleanup action\n");
> +
>  	err =3D devm_of_mdiobus_register(dev, bus, to_of_node(node));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729160227.1556=
13-1-markus.stockhausen@gmx.de?part=3D4
