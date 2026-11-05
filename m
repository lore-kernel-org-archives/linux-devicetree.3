Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858824;
	b=cgkj76Kh1zBP3xH7zVJvclnjNP4yZresZ7y0XNqfdySW8xRg7mEzN75jFuItMt+jlXxg
	 vG9hLCXIjskcAXzAGD/udOrUM18yb4ZJoppJsYl/7BxO79xsrN6DLsYSBQXJyFzJ0QirD
	 2GSNZQqrfYY9S/3uSthKUi6ptUykRhaT40LIYHfT+xD1IDWu7XzXO7H1AU/ZpQLGu93x9
	 YPjyyIxHBxMah+Iss5eW5oaJ4nYoB56hQvPT70ysBTJ83K1umvpWrx26AeAKRhn7ONivi
	 ghd0CS/gz25W9ziYr2s0usg53hDdfs9ZS87TbSHxjFLJX8Ggyfi9zadXkAbidny8tfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5emfJlVxiRFWWi2A/8Yj2MXzvJ+Kkn8hJKVoehj4HvI=;
	b=Ujpn/t6wQXJKZGvDjjoaxlvYvpnHm3NlrPFInA1QsReO9LfDJzE3hsCOgjzWAtCtvrPq
	 rXSWQwvxX2Ho7NM+tCYZ9Wz+jsFjoHje+S0knCD1pKiFwEnqu4KHFOsxhvMD7Xo9THyOM
	 k2zuW4mAb2Tmsg9aD98hp8VKj2Vi9YgqrQ4YhEEKmxVLGDhHi79GjTgD4wTfO8nlj2b+t
	 lSUwHq3Yg1832N2THvVxhfl2laiFmQ3h27wPNvoPGWjt0cW5hR0HlbCZjUEC+PxfsqY3s
	 rlXEsmNormbUzfktC/Zox86HhoJoN1ofU2wmmXTz/vuRj+MkefmSEedZ0Du8A1dz2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeSIeGgJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C81606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeSIeGgJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6641F000C1;
	Thu,  5 Nov 2026 06:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793858823;
	bh=5emfJlVxiRFWWi2A/8Yj2MXzvJ+Kkn8hJKVoehj4HvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NeSIeGgJyYYu3JDGF+Skrg2vesXZNDOHdt3thPO+TUtyfEk4LVBaV0iDzrmyTllvW
	 +p36T30YG/xNsReS0K1AdHM2vyWsWdWfmv8R7RuC2U7Z1Z7sm6nLznHEKRaBr9yE8j
	 QFjpk7Rws5NvIhw3Qda8nGHN2epIlJNLVZVVJsZLKiu+3Uu18hpLYS7qMoWTyri29g
	 PUk/ECnTpTMBWtp7pW5mqFhZw9PWxBNruBUR85/qTdUJ3lTqmum+IWPuz9eLzJy7lR
	 n9eVQJpcejZkx++ZbV7wg4AloAlRApDkNceob3qTFh5bP1HE6cUBk24sl2Y9OIpAMQ
	 /sJGZd4mPrxjw==
Message-ID: <sashiko-outbox-198613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v28 3/3] net: phy: Add driver for Motorcomm
 Quad 2.5GbE phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104060636.3901918-4-kyle.switch@motor-comm.com>
References: <20261104060636.3901918-1-kyle.switch@motor-comm.com>
 <20261104060636.3901918-4-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 06:07:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: phy: motorcomm: broken sds_initialized tracking in yt8824_res=
ume()
--

commit 4e05c00d9c48d262e045a1a6c3ea0d87e1c1718c
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add driver for Motorcomm Quad 2.5GbE phy

This commit adds support for the Motorcomm YT8824 quad-port 2.5G PHY to the
motorcomm driver, using phy_package helpers to manage the shared top
extended register space.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 463e1ea3efc93..492e236ec9e31 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c

[ ... ]

> @@ -642,11 +950,1168 @@ static int ytphy_set_wol(struct phy_device *phyde=
v, struct ethtool_wolinfo *wol)

[ ... ]

> +static int yt8824_config_init(struct phy_device *phydev)
> +{
> +	struct yt8824_shared_priv *priv =3D phy_package_get_priv(phydev);
> +	int ret;
> +
> +	mutex_lock(&priv->shared_lock);
> +	if (priv->package_mode =3D=3D PHY_INTERFACE_MODE_INTERNAL) {
> +		ret =3D yt8824_config_utp_init_paged(phydev);
> +		if (ret < 0)
> +			goto err;
> +	} else {
> +		if (!priv->sds_initialized) {
> +			ret =3D yt8824_extern_config_sds_init_paged(phydev);
> +			if (ret < 0)
> +				goto err;
> +			priv->sds_initialized =3D true;
> +		}
> +		/*
> +		 * Configuring the MII registers of the SDS,
> +		 * which are private to each channel.
> +		 */
> +		ret =3D yt8824_extern_sds_softreset(phydev);
> +		if (ret < 0)
> +			goto err;
> +
> +		ret =3D yt8824_config_utp_init_paged(phydev);
> +		if (ret < 0)
> +			goto err;
> +	}
> +	mutex_unlock(&priv->shared_lock);
> +	ret =3D yt8824_soft_reset(phydev);
> +
> +	phydev_dbg(phydev, "%s done, phy addr: %d\n", __func__,
> +		   phydev->mdio.addr);
> +	return ret;
> +err:
> +	mutex_unlock(&priv->shared_lock);
> +	return ret;
> +}

[ ... ]

> @@ -3240,6 +4705,455 @@ static int yt8821_resume(struct phy_device *phyde=
v)

[ ... ]

> +static int yt8824_resume(struct phy_device *phydev)
> +{
> +	struct yt8824_shared_priv *priv =3D phy_package_get_priv(phydev);
> +	int ret;
> +
> +	mutex_lock(&priv->shared_lock);
> +	ret =3D yt8824_power_on(phydev);
> +	if (!ret)
> +		priv->sds_initialized =3D false;
> +	mutex_unlock(&priv->shared_lock);
> +
> +	return ret;
> +}

[Severity: High]
Does clearing priv->sds_initialized in yt8824_resume() cause the shared
SerDes to be reset and recalibrated repeatedly as each port in the package
is attached or started, while also inverting the initialization order on
system resume?

In struct yt8824_shared_priv, sds_initialized is a package-wide flag meant
to ensure yt8824_config_init() runs yt8824_extern_config_sds_init_paged()
only once for the 4-port package when priv->package_mode is
PHY_INTERFACE_MODE_10G_QXGMII.

However, during normal port attachment in phy_attach_direct(), phylib calls
phy_init_hw() followed immediately by phy_resume():

drivers/net/phy/phy_device.c:phy_attach_direct() {
	...
	err =3D phy_init_hw(phydev);
	if (err)
		goto error;

	if (phydev->mdio.bus->notify_phy_attach) {
		err =3D phydev->mdio.bus->notify_phy_attach(phydev);
		if (err)
			goto error;
	}

	phy_resume(phydev);
	...
}

When the first port is attached, phy_init_hw() -> yt8824_config_init() runs
yt8824_extern_config_sds_init_paged() and sets priv->sds_initialized =3D tr=
ue,
and then phy_resume() -> yt8824_resume() immediately resets
priv->sds_initialized =3D false. Bringing an interface up via phy_start() ->
__phy_resume() -> yt8824_resume() also resets priv->sds_initialized =3D fal=
se.

As a result, when each of the remaining three ports in the YT8824 package is
attached, priv->sds_initialized is false again, so yt8824_config_init()
re-runs yt8824_extern_config_sds_init_paged() on each port. That function
asserts the shared SerDes global reset (YT8824_CSR_US_GLB_RESET_N =3D 0) and
restarts SerDes calibration (YT8824_CALIB_SEQ_SW_RST and
YT8824_RESTART_CAL_CTRL_REG) while sibling ports in the package are already
initialized or active.

Conversely, during system resume in mdio_bus_phy_resume(), phylib calls
phy_init_hw() before phy_resume():

drivers/net/phy/phy_device.c:mdio_bus_phy_resume() {
	...
	ret =3D phy_init_hw(phydev);
	if (ret < 0)
		return ret;

	ret =3D phy_resume(phydev);
	...
}

Because yt8824_suspend() does not clear priv->sds_initialized, if
priv->sds_initialized is true prior to suspend, the first port to resume
sees priv->sds_initialized =3D=3D true in yt8824_config_init() (skipping Se=
rDes
re-initialization) and only clears priv->sds_initialized =3D false afterward
in yt8824_resume(), causing the second port to re-run package-wide SerDes
initialization after the first port has already completed
yt8824_config_init().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104060636.3901=
918-1-kyle.switch@motor-comm.com?part=3D3
