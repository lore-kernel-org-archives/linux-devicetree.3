Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCA3A9018
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767310; cv=none; b=d/++nXhXMUG65jtrUmxPFdUUaVqQH/UIryUBd9lBbkk82ZWLNPcXy4xBXxiixqEtUm2/yMaD6SFtTS0e5NYuxEzHQqh8uj8ChjTL5BaJVWWp9eZLh+DYZh9jZfRZuSSoCNBaVHbSAzC8fJmNuSRKnybGy4qKabDaSYxIfxYsjcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767310; c=relaxed/simple;
	bh=WEqqTSXggy3uwSX1HIkQscgRlxJtuGwcwfZe8AMxqvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oz6iPUKAmr6mQ5barm5j/11VGByKJrxwIwGi3kll/TbbXXUUtVAlB4ltiU1gR6L23hvT5Q/AlXUQSs3b+AAhDODdX6PZclxpVFOrWpZMtQgvCBjwDh58pIKGV0SBFDIbzP5Oo8vhZiHlJWn1CSMekOw8KUXXuiKPdhjQSe332YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuXVHSRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuXVHSRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789E01F000E9;
	Sat, 11 Jul 2026 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783767307;
	bh=mJ4s+Arxu6hpWe2P4sbqENunVk87A6ger+WAWrYy2Zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuXVHSRfV1225c+6NoYdONXi+3KffTCrkZb5nh7OvP6JsT3467IGj0F2zeHNfrVXb
	 jP18KdNljP/Q2Wm02kP6g+spy5yePuKkZsvJNAE5qlXPT8oBU4buFSKBR8OPVTpnP7
	 wQiAvp82IwDql5onIKg8kOXhBGC3UwUbq0OX7WeCdrXBL9KN0DOoR6u4m38ivf35lq
	 mFmYEcprWGenq5XyL+Ky9Cm8yKRgk56cBleIyoZ3H2sQCQYXHOVbrql03y+Ut1nQSY
	 1uaLkzJwDpdyZugW34VbXbjdO4FMtkwss7ti7fZI+T/rvQOo6nggYgtXuT4mqF9m2y
	 U60FxZ7xlRx4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: dsa: mt7530: add EN7528 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Naseef" <naseefkm@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
References: <cover.1783680864.git.naseefkm@gmail.com>
 <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 10:55:07 +0000
Message-Id: <20260711105507.789E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] ID_EN7528 writes to an MT7531-specific register, MT7531_DBG_CNT(=
i), inside mt7531_setup_common().
- [Medium] Missing stabilization delay after hardware reset of PHYs before =
issuing MDIO writes.

Pre-existing issues:
- [High] ID_AN7583 incorrectly falls back to MT7530_MIRROR_EN (BIT 3) while=
 using the MT7531_CFC register format, failing port mirroring and corruptin=
g CPU packet forwarding logic.
- [High] ID_EN7581 and ID_AN7583 are missing from the MT753X_FORCE_MODE mac=
ro, causing them to use the MT7530 bitmask instead of the MT7531 bitmask.
--

--- Patch [2]: [PATCH net-next 2/2] net: dsa: mt7530: add EN7528 support ---
commit 6e316acbfa461fc0e2739fe9d461c2511b9c012c
Author: Ahmed Naseef <naseefkm@gmail.com>

net: dsa: mt7530: add EN7528 support
   =20
This patch adds support for the EcoNet EN7528 SoC switch. It introduces the
ID_EN7528 variant, reusing mt7988_setup() and indirect PHY accessors, while
handling the switch core as an MT7530 derivative rather than MT7531.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3c2a3029b10cf..2aecad77af9ad 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -3342,6 +3375,17 @@ static int mt7988_setup(struct dsa_switch *ds)
>  	/* Reset the switch PHYs */
>  	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
> =20
> +	/* The EN7528 LAN GPHYs advertise EEE by default, but negotiating EEE
> +	 * with common link partners (e.g. Realtek GbE NICs) results in an
> +	 * unstable link with dropped frames. Disable EEE advertisement on
> +	 * them.
> +	 */
> +	if (priv->id =3D=3D ID_EN7528)
> +		for (i =3D EN7528_GPHY_BASE;
> +		     i < EN7528_GPHY_BASE + EN7528_NUM_GPHYS; i++)
> +			mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN,
> +						 MDIO_AN_EEE_ADV, 0);

[Severity: Medium]
Does this sequence need a stabilization delay before issuing MDIO writes?

The switch PHYs are hardware reset via SYS_CTRL_PHY_RST just before this,
and hardware PHYs typically require a few milliseconds to exit the reset
state and initialize their management logic.

Could issuing MDIO C45 writes immediately after asserting the reset result =
in
the PHYs ignoring the transaction or the MDIO controller timing out?

> =20
>  	return mt7531_setup_common(ds);

[Severity: Medium]
Does mt7531_setup_common() write to MT7531-specific registers that shouldn't
be accessed by the EN7528?

The commit message states that the EN7528 switch core is an MT7530 derivati=
ve
and not an MT7531 derivative. However, mt7988_setup() returns by calling
mt7531_setup_common(), which executes:

mt7531_setup_common() {
    ...
    for (i =3D 0; i < priv->ds->num_ports; i++) {
        ...
        mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);

Could writing MT7531_DIS_CLR to the MT7531_DBG_CNT(i) offset on an MT7530
derivative cause hardware errors or state corruption?

>  }
> =20
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index dd33b0df3419e..5f1e841f42c0e 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h

[ ... ]

> @@ -21,6 +21,7 @@ enum mt753x_id {
>  	ID_MT7988 =3D 3,
>  	ID_EN7581 =3D 4,
>  	ID_AN7583 =3D 5,
> +	ID_EN7528 =3D 6,

[Severity: High]
This isn't a bug introduced by this patch, but are ID_AN7583 and ID_EN7581
missing from the MT753X_MIRROR_EN and MT753X_FORCE_MODE macros?

In drivers/net/dsa/mt7530.h, MT753X_MIRROR_EN is defined as:

#define MT753X_MIRROR_EN(id)        ((id =3D=3D ID_MT7531 || \
                                      id =3D=3D ID_MT7988 || \
                                      id =3D=3D ID_EN7581) ? \
                                     MT7531_MIRROR_EN : MT7530_MIRROR_EN)

Because ID_AN7583 is omitted, it falls back to MT7530_MIRROR_EN (BIT 3).
When mt753x_port_mirror_add() uses the MT7531_CFC register format for
ID_AN7583, it applies BIT 3. In MT7531_CFC, BIT 3 is part of
MT7531_CPU_PMAP_MASK, which controls CPU packet forwarding logic.=20

Does this break port mirroring and corrupt the CPU forward control for
ID_AN7583?

Similarly, MT753X_FORCE_MODE is defined as:

#define MT753X_FORCE_MODE(id)       ((id =3D=3D ID_MT7531 || \
                                      id =3D=3D ID_MT7988) ? \
                                     MT7531_FORCE_MODE_MASK : \
                                     MT7530_FORCE_MODE)

Both ID_EN7581 and ID_AN7583 are missing here. When mt7531_setup_common()
attempts to force all port links down during setup, it applies
MT7530_FORCE_MODE (BIT 15) instead of MT7531_FORCE_MODE_MASK.=20

Does this fail to correctly disable the port links during switch
initialization?

>  };
> =20
>  #define	NUM_TRGMII_CTRL			5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783680864.gi=
t.naseefkm@gmail.com?part=3D2
