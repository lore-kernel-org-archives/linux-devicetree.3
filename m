Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7492B3B52EF
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273339; cv=none; b=R8tP008OVW9ExeNVE/hjWVhSe696j3u8nR2agcaa5doDQLj/i2L6QsYPb699BrhJfeuM/WO+5R/YApkEDottYOimKar5a2KeQO1N8TgF57sfBNnuEBXsBtssWIMF3UKOw7yPERItJsLPVzKjca8ugmRNw1ryVMzUlI4WIfUYPHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273339; c=relaxed/simple;
	bh=xeeJHmJj3/XacC96S+Q6EX/SbrPseexcMBzm1cfjleU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UWANh65ihgM0q5bYlsgFCnqN3QtslKSjtPr++q8Xy4WXLlZd9mKAfUUy/CadNaO3O5Nq7z3U6VzT1kVBQrgBsbIHduP8e9qVhTXxBUx/jhPbNOQi8J8t18XFvOYbuk4HRkFgwuK0GMNHIUH82Pdb7Q3ZVOoUYt7A9AYKwfQHMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqILAZjO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqILAZjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE31F00A3D;
	Tue,  1 Sep 2026 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273338;
	bh=ipm/DHiTh9BdH3lRehK6mT88lKaivlXPOH6TXJBB+w4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UqILAZjOIgWMrtCuXuaVkkmTQf5gI8C0hv03inCrQpHU9akW6A6RVRddTG+lp5Axx
	 kOBxsiScx5PaxpAHrSaV12WLOORhCE5fmO2qGw2TJV1IB6NLCGkHOqqCiL0EW+xnCj
	 WqgYAgFkIrm4jEYcU64Jt6+GrWgzbKywSHL1IaoFLuy6CVLMQyZilcmeBtMCAL+Gm9
	 BRgjLW6YJg232kV2/pdkctKWmntLsz2t0jag4zPtwpGrzTjwk/UFngG3R4IM+i4qdO
	 Ot4s03Ts/aqlAry8BZi/EaBAx/N/JaCUwLK64coSwZdfxDtwY+bffFL4/Oqi1LsXAK
	 NNiGuwO6uosXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 07/13] net: mdio: realtek-rtl9300:
 Configure hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831143439.2404484-8-markus.stockhausen@gmx.de>
References: <20260831143439.2404484-1-markus.stockhausen@gmx.de>
 <20260831143439.2404484-8-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:35:37 +0000
Message-Id: <20260901143537.CBAE31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing bug in `phy_attach_direct`: the error path for an alr=
eady-attached PHY inadvertently tears down the existing attachment.
--

commit b9cbeb0822e562618f953089bee5ff136bf2e472
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

This commit synchronizes hardware polling with the kernel's MDIO driver by
disabling polling at driver start and just before PHY detach, and re-enabli=
ng
it after PHY attach. It introduces regmap bit access to handle these polling
state transitions and gracefully handles deferred probing of PHYs.

Link: https://github.com/openwrt/openwrt/blob/main/target/linux/realtek/fil=
es-6.18/drivers/net/mdio/mdio-realtek-otto.c#L818
Link: https://lore.kernel.org/netdev/680696024a8648535ce6dee771fe4de67802e0=
e8.1769053496.git.daniel@makrotopia.org/

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 7de8adec243ba..a925640290cb0 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -625,6 +664,9 @@ static int otto_emdio_probe_one(struct device *dev, s=
truct otto_emdio_priv *priv
>  		bus->write =3D otto_emdio_write_c22;
>  	}
>  	bus->parent =3D dev;
> +	bus->notify_phy_attach =3D otto_emdio_notify_phy_attach;
> +	bus->notify_phy_detach =3D otto_emdio_notify_phy_detach;
> +

[Severity: High]
This is a pre-existing issue, but while looking at how phy_attach_direct()
calls notify_phy_attach(), I noticed a bug in the error handling for
already-attached PHYs.

Does this error path inadvertently tear down an existing valid attachment?

If a second MAC driver attempts to attach to a PHY that is already attached=
 to
a different interface, phy_attach_direct() catches the error and jumps to t=
he
error label:

drivers/net/phy/phy_device.c:phy_attach_direct() {
    ...
	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}
    ...
error:
	/* phy_detach_internal() does all of the cleanup below */
	phy_detach_internal(phydev, false);
	return err;
}

This unconditional cleanup calls phy_detach_internal(), which nullifies the
existing pointers:

drivers/net/phy/phy_device.c:phy_detach_internal() {
    ...
		phydev->attached_dev->phydev =3D NULL;
		phydev->attached_dev =3D NULL;
		phy_link_topo_del_phy(dev, phydev);
    ...
}

Will this cause a NULL pointer dereference or use-after-free in the original
MAC driver when it next tries to access the PHY, as its phydev pointer has =
been
unexpectedly cleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831143439.2404=
484-1-markus.stockhausen@gmx.de?part=3D7
