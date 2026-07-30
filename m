Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23B7449B0A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427411; cv=none; b=h7Lwnn44GHWK4L7HA1GOum5g9xyH9XGnjYc+0S1iLqaJlvRDD3maIpY902x1CIlj6lW8WjYWuUWnsKYXYgTxTatyHNNhtGsnB56eaLfsOLh8r0dirSrYEgCHUUVxGzCjNga2I3A1zMpPxZ6ix3j67paXDqXbn27FkP+X81QQgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427411; c=relaxed/simple;
	bh=yRJ01GkOq3/AJb8QriF4z0RSuzLXb3SQxQnP1HT5yIE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r2ccbyksqslR5UHxQ9bxZt2G10QFRkMRp++byzSCX/cJl8iL9Nzr95nE3RDx/5sm2LlBtcYRO/+Al1c7HjyP8gcZ2MlFL4yLOe7SWfSwQm8WwHvxEIG8/ctuDl/5a0567iWrihBF1kfPR8Attgi3lPpKzgI82q1qfmStxzO7yyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtpKyqWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtpKyqWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32ABC1F000E9;
	Thu, 30 Jul 2026 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427410;
	bh=8LOXZk5xlEDV1du8f7kkvWLKtPHVYKoPByZdYLRurVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtpKyqWiTE3y3jBMVkPqPigbVkxVwn6Jm2dO5heLbQBfqgAdz4IKZohTNIS10G6ol
	 wAZVrJbDDhJRCg0TDiDo9EgdT24dTLMLrAiZ72M4iLxXPc79tzQ9faQKd2Cv+BKu4g
	 OeYUIk5aaP+K6G7up80rMewZJokaYM8b4RX9VKaopc17zGXYYVJXLU//J6DzI8cwQD
	 wBn6+Lmzwg7nQuiS0XJx4rUzKhuHPpdnaRY6x2aN2omQsp/x1OIdhAbhO6XNMShJq+
	 lWGUZgD6ZKVqdstHSmGmAyIen0rL8DUjHCnL7QnpZTGQNlA8b6rWajXWLUFkFJXE/c
	 IE3Uadl5FTRxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 3/9] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729160227.155613-4-markus.stockhausen@gmx.de>
References: <20260729160227.155613-1-markus.stockhausen@gmx.de>
 <20260729160227.155613-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:03:29 +0000
Message-Id: <20260730160330.32ABC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling phy_attach_direct() on an already-attached PHY destructive=
ly tears down the existing valid attachment and leaves the bus driver state=
 dangling.
--

--- Patch [3]: [PATCH net-next v8 3/9] net: phy: add (*notify_phy_attach/de=
tach)() hooks to struct mii_bus ---
commit f45546de5e393510abd217da3bdb7bad6d759d93
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit introduces notify_phy_attach and notify_phy_detach hooks to
the mii_bus structure. This allows MDIO bus drivers to handle PHY specific
configurations, such as polling registers, symmetrically during attach and
detach phases.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/

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
>  	return err;

[Severity: High]
This is a pre-existing issue, but does this error path incorrectly tear down
a valid pre-existing attachment when phy_attach_direct() is called on an
already-attached PHY?

When phy_attach_direct() detects the PHY is already attached:

drivers/net/phy/phy_device.c:phy_attach_direct() {
        ...
        if (phydev->attached_dev) {
                dev_err(&dev->dev, "PHY already attached\n");
                err =3D -EBUSY;
                goto error;
        }
        ...
}

It jumps to the shared error path. Since the error path calls
__phy_detach(phydev, false) and phydev->attached_dev still points to the
old, valid network device, it destroys the existing attachment behind the
scenes.

Additionally, because the patch explicitly suppresses the bus detach
notification by passing false to __phy_detach(), doesn't this leave the
MDIO bus driver's state (like hardware polling configurations) permanently
out of sync?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729160227.1556=
13-1-markus.stockhausen@gmx.de?part=3D3
