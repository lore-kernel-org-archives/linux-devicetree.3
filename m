Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549201;
	b=sxpcF0reupBc8D/0cSZD9GgqGxh1nKMKgxShqVK+LDE475PYhU7qHknCVOGPpB5rlfT9
	 rI1JaQt/m/Loc1FFlH4LRfzeZ0TC5Cd9vL4sIE1KF7DK3WP6n2JAoicpykgeK4XHRFsG2
	 r1oVoXl5dTRu5/dpRljYgdY+RNAHX7dTjTYU6oPgKhqNkBWccL/rufzZDybHakWbgJNMq
	 kaaiShNcy+5nZDvDqbbU5M6vGSf7I3QdnhZoLXqSMw8sGLXEVtNytiMlJ7tGFSEpXMilq
	 vJPhscFR/eDG3sSjtjXWhnPZBQ3LsjuJ3uXPAygR35bYXh8L2h/JsQzSUAH7Rp3Sv6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K79AH26X08t8ZM0c8RWa+yYQY7tSwdtnq3j1xV7PFrk=;
	b=rYYdZMlXEzbrWD9gZfzMUJf8eyb1cVxpZCNsqITAZqke/4LnXnQNNlTCgvU36ZyXmKkF
	 3nTEqGzWC6roAimbwdxUh2cDHbwkrFdVTCl/AuyLV/JBXeR6pV4MJotLr+GgnrOOskeTx
	 Q16Z1SP0fq4JqI+lK4cd2gzHYkQrNlTYtfvgizamrZeb0wIEiPHPrXl/SaRIaw2HNI2qI
	 b2lRSIEdPt9HjcrfKURpQVmf8YW99GsZsBjBDYShiPNJ4xx/OzUA+KItpIAUli6TjgMly
	 thwc7AfqO2qbPpv8HNf8Ot77o9l4RuWqs6nIRkCVpIILeT9zWyG6mk5R08cuGfLgHVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jxg/MQmY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B14606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jxg/MQmY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FCD1F000CA;
	Wed, 21 Oct 2026 02:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792549200;
	bh=K79AH26X08t8ZM0c8RWa+yYQY7tSwdtnq3j1xV7PFrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jxg/MQmYiSIG6U16ILD8zAxjj3Q17O0pahnmMcDxKVkDAlICHpNYzENFi9DxaQzLD
	 MfydBbNTRIzige1gs3sC9yVQ+FHu8cuyX8EQMyDceGYL4noqYsyH/hM+MeYH/TqBlW
	 wxFIyeBcqon9c474XpgrxYMj82G2dK++yJkd4SoPeAqaARm8m7vJovJIZFkbldAE7H
	 bd0nrC2TqJ0oZgbu1EXN+ZYjg0yVVPXTyEl7xQQZ73v4qrIsADX+Y8BqrGY5JTnGC9
	 Ahz8dcn/5wFaeAuoYUjjKMyRe2FPdYU7huQYrRUDrjisM8TenHLgU6/ual2Ij5aRjf
	 ZZhKZnsMbxA6A==
Message-ID: <sashiko-outbox-179697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v27 3/3] net: phy: Add driver for Motorcomm
 Quad 2.5GbE phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020021929.3028490-4-kyle.switch@motor-comm.com>
References: <20261020021929.3028490-1-kyle.switch@motor-comm.com>
 <20261020021929.3028490-4-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 02:20:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] net: phy: motorcomm: yt8824_read_status_paged() clears forced sp=
eed and duplex
- [Medium] net: phy: motorcomm: stale 2.5G lp_advertising in yt8824_read_st=
atus_paged()
- [Medium] net: phy: motorcomm: BMCR_PDOWN not cleared in yt8824_config_utp=
_init_paged()
--

commit 5e6afad50de750fec66b609e0dfb0e9ed5ab8ac1
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add driver for Motorcomm Quad 2.5GbE phy

This commit adds support for the Motorcomm YT8824 quad-port 2.5G PHY to the
motorcomm PHY driver, using phy_package helpers to access the shared top
extended register space.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 463e1ea3efc93..6628ebcca0819 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
[ ... ]
> @@ -638,15 +949,1165 @@ static int ytphy_set_wol(struct phy_device *phyde=
v, struct ethtool_wolinfo *wol)
[ ... ]
> +static int yt8824_config_utp_init_paged(struct phy_device *phydev)
> +{
> +	int ctrl =3D 0;
> +	int mask =3D 0;
> +	int ret =3D 0;
> +	int val =3D 0;
> +	int r;
> +
> +	ret =3D phy8824_page_write_with_lock(phydev, YT8824_RSSR_UTP_SPACE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, BMCR_PDOWN);
> +	if (ret < 0)
> +		goto err_restore;

[ ... ]

> +	/* reset */
> +	ret =3D genphy_c45_template_testmode(phydev, MDIO_PMA_10GBT_TESTMODE_1);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +
> +	ret =3D phy_modify(phydev, MII_BMCR, BMCR_RESET | BMCR_ANENABLE,
> +			 BMCR_RESET | BMCR_ANENABLE);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +	ret =3D phy_read_poll_timeout(phydev, MII_BMCR, val, !(val & BMCR_RESET=
),
> +				    50000, 600000, true);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +
> +	ret =3D genphy_c45_template_testmode(phydev,
> +					   MDIO_PMA_10GBT_TESTMODE_NORMAL);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +	return 0;
> +
> +err_restore:
> +	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	return ret;
> +
> +err_restore_normal:
> +	r =3D genphy_c45_template_testmode(phydev,
> +					 MDIO_PMA_10GBT_TESTMODE_NORMAL);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	return ret;
> +}

[Severity: Medium]
Does yt8824_config_utp_init_paged() leave BMCR_PDOWN set in MII_BMCR on the
normal return path?

At the beginning of yt8824_config_utp_init_paged(), BMCR_PDOWN is set via
phy_modify(phydev, MII_BMCR, BMCR_PDOWN, BMCR_PDOWN). Near the end of the
function, the reset is issued via:

	ret =3D phy_modify(phydev, MII_BMCR, BMCR_RESET | BMCR_ANENABLE,
			 BMCR_RESET | BMCR_ANENABLE);

Because phy_modify() performs a read-modify-write and BMCR_PDOWN is not in
the mask, it writes BMCR_PDOWN | BMCR_RESET | BMCR_ANENABLE back to
MII_BMCR. The subsequent yt8824_soft_reset() -> yt8824_utp_softreset_paged()
call in yt8824_config_init() also uses phy_modify(phydev, MII_BMCR,
BMCR_RESET, BMCR_RESET), which preserves BMCR_PDOWN as well.

Both error paths (err_restore and err_restore_normal) explicitly clear
BMCR_PDOWN, but the success path returns 0 without clearing it. When
phy_init_hw() is called without a subsequent phy_resume() (for example via
phy_mii_ioctl() on SIOCSMIIREG with BMCR_RESET, or by a MAC driver resetting
an active PHY), phydev->suspended is set to 0 while the UTP port remains
powered down.

[ ... ]
> @@ -3240,6 +4701,450 @@ static int yt8821_resume(struct phy_device *phyde=
v)
[ ... ]
> +static int yt8824_read_status_paged(struct phy_device *phydev)
> +{
> +	int ret;
> +	int val;
> +
> +	ret =3D phy8824_page_write_with_lock(phydev, YT8824_RSSR_UTP_SPACE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D genphy_read_status(phydev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (phydev->autoneg =3D=3D AUTONEG_ENABLE && phydev->autoneg_complete) {
> +		ret =3D genphy_c45_read_lpa(phydev);
> +		if (ret < 0)
> +			return ret;
> +	}

[Severity: Medium]
Can guarding genphy_c45_read_lpa() with phydev->autoneg_complete leave
ETHTOOL_LINK_MODE_2500baseT_Full_BIT stale in phydev->lp_advertising when
the link goes down or autonegotiation restarts?

Inside genphy_read_status(), genphy_read_lpa() only clears Clause 22
link-partner advertisement bits when !phydev->autoneg_complete:

	if (phydev->autoneg =3D=3D AUTONEG_ENABLE) {
		if (!phydev->autoneg_complete) {
			mii_stat1000_mod_linkmode_lpa_t(phydev->lp_advertising,
							0);
			mii_lpa_mod_linkmode_lpa_t(phydev->lp_advertising, 0);
			return 0;
		}

Meanwhile, genphy_c45_read_lpa() has its own cleanup path when
MDIO_AN_STAT1_COMPLETE is not set:

	if (!(val & MDIO_AN_STAT1_COMPLETE)) {
		linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
				   phydev->lp_advertising);
		mii_10gbt_stat_mod_linkmode_lpa_t(phydev->lp_advertising, 0);
		mii_adv_mod_linkmode_adv_t(phydev->lp_advertising, 0);
		phydev->pause =3D false;
		phydev->asym_pause =3D false;

		return 0;
	}

By skipping genphy_c45_read_lpa() when !phydev->autoneg_complete (and not
calling mii_10gbt_stat_mod_linkmode_lpa_t(phydev->lp_advertising, 0)), a
2.5G link that drops or restarts autonegotiation will keep
ETHTOOL_LINK_MODE_2500baseT_Full_BIT set in phydev->lp_advertising.

> +
> +	if (!phydev->link) {
> +		phydev->speed =3D SPEED_UNKNOWN;
> +		phydev->duplex =3D DUPLEX_UNKNOWN;
> +		if (phydev->autoneg =3D=3D AUTONEG_ENABLE)
> +			phy_resolve_aneg_pause(phydev);
> +		return 0;
> +	}

[Severity: Medium]
Won't overwriting phydev->speed and phydev->duplex when !phydev->link break
forced speed modes (phydev->autoneg =3D=3D AUTONEG_DISABLE)?

Earlier in yt8824_read_status_paged(), genphy_read_status() handles both
AUTONEG_ENABLE and AUTONEG_DISABLE: when autonegotiation is disabled, it
calls genphy_read_status_fixed() to populate phydev->speed and
phydev->duplex from MII_BMCR even while the link is down.

Unconditionally setting phydev->speed =3D SPEED_UNKNOWN and
phydev->duplex =3D DUPLEX_UNKNOWN when !phydev->link clobbers the forced
settings whenever the cable is unplugged or the link has not yet come up
after _phy_start_aneg() -> phy_check_link_status(). If the interface is
later cycled while the link is down, _phy_start_aneg() ->
phy_sanitize_settings() -> phy_caps_lookup() will see SPEED_UNKNOWN and
reset the forced link configuration to 10baseT/Half.

Also, in the same !phydev->link block, phy_resolve_aneg_pause() only updates
phydev->pause and phydev->asym_pause when phydev->duplex =3D=3D DUPLEX_FULL=
, so
calling it right after setting phydev->duplex =3D DUPLEX_UNKNOWN has no
effect, and genphy_read_status() has already cleared phydev->speed,
phydev->duplex, phydev->pause, and phydev->asym_pause for the !phydev->link
case. Is this !phydev->link block needed after genphy_read_status()?

> +
> +	ret =3D phy_read(phydev, YTPHY_SPECIFIC_STATUS_REG);
> +	if (ret < 0)
> +		return ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020021929.3028=
490-1-kyle.switch@motor-comm.com?part=3D3
