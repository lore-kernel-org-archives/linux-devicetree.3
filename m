Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA40E1F91D6
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136726; cv=none; b=puoCmyXupolt457tERl6j9/DdZj3bunjkkrnO0suytxS4iWEkVjSq8NvFUqLeSBTN3GFloNtj8B9M2hQi6aspK88+dNLyUEUOYn/FSLbaRibT4QENPljC+LD/ffa2KfBKjGwSRy0UBc62RaMpDt5cva7XZ1fW22+8LkNouS/tek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136726; c=relaxed/simple;
	bh=sm/S6xrmqYEKzjbhgv62vwIbPj3Y6C4wuih8eSB1gHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YlDb5xYXSAn/J5I3ouVOApGS8xzJ6R2F4mDiO64RybzO//enh6BqMusSxRKa2EBOCxyiy3n4u+Iy48a5qXgqiO4sszsnuf8xEQEKoIxISNM8tcWuPXy6zqDj8TqUixFF/Z8rAqWAycr6Isw9Hc7t0WOQPKKZ1yKhTqpBhBUy6L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtFvmfRg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtFvmfRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2741F00A3A;
	Mon, 27 Jul 2026 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785136725;
	bh=IADPRscmIPPLEx6gyXOQVBBEruo2VIylSC7NI3unhlQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VtFvmfRg0kgyvbOqbSHVhMnTDG3QEuUk+v66vWRcYjdWB77B5kvZoH/q89tjoD4lu
	 WjulPHt+lXyORNlmf484G0BIImtWpnQXeATWgwflIRwQSTQhLyVVAIeewnvCN+jmid
	 6NCdQtX9SuS48KBCKiLmZpVtAlWJWC6uZxb/fK4kkkbOWcMbxiDvKA5T2L4VYg2DZH
	 Q4ZgoOtxsL2sbPq5mKYwjjmHcEgDz3heJbzFlTIv8RSgfEmvXYrfxvxv81qH2ST057
	 ANTZZt2omeJl3yYWEBF/kLJE3I3DNvYSZTWr9pT50+Fuw0GpQuPcP+iScWhrv3jSsA
	 zeYVa2vrBx6QQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 3/8] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260726071751.1359156-4-markus.stockhausen@gmx.de>
References: <20260726071751.1359156-1-markus.stockhausen@gmx.de>
 <20260726071751.1359156-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:18:45 +0000
Message-Id: <20260727071845.6C2741F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `phy_attach_direct()` on an already-attached PHY destructi=
vely tears down the existing attachment and corrupts module refcounts.
--

--- Patch [3]: [PATCH net-next v7 3/8] net: phy: add (*notify_phy_attach/de=
tach)() hooks to struct mii_bus ---
commit f981bcd4f5183a24448425da1f5f3cc2787f456b
Author: Daniel Golle <daniel@makrotopia.org>
Subject: net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit adds notify_phy_attach() and notify_phy_detach() hooks to
struct mii_bus. This allows MDIO bus drivers to be informed when a PHY
is attached or detached. The teardown logic from phy_detach() is moved
into a new __phy_detach() helper to handle the notification conditionally.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..233622e9ba61f 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -1890,8 +1986,8 @@ int phy_attach_direct(struct net_device *dev, struc=
t phy_device *phydev,
>  	return err;
> =20
>  error:
> -	/* phy_detach() does all of the cleanup below */
> -	phy_detach(phydev);
> +	/* cleanup without bus notification */
> +	__phy_detach(phydev, false);

[Severity: High]
This is a pre-existing issue, but is it safe to call __phy_detach() here
if we reached this error path because the PHY was already attached?

Earlier in phy_attach_direct(), if the PHY is already attached, it jumps
to the error path:

	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}

By calling __phy_detach(), it destructively tears down the existing attachm=
ent.
It nullifies phydev->attached_dev and removes links:

drivers/net/phy/phy_device.c:__phy_detach() {
	...
	phydev->attached_dev->phydev =3D NULL;
	phydev->attached_dev =3D NULL;
	phy_link_topo_del_phy(dev, phydev);
	...
}

Could this lead to unexpected device detachment and potential use-after-free
or null-pointer dereferences in the original owner's driver?

Does this also corrupt the module refcount for bus->owner? The module_get()
in phy_attach_direct() is conditional on the new device's owner, while
the module_put() in __phy_detach() relies on the old device's owner.

Would it be better to add a separate error label that skips __phy_detach()
for cases where the attachment hasn't been established yet?

>  	return err;
> =20
>  error_module_put:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726071751.1359=
156-1-markus.stockhausen@gmx.de?part=3D3
