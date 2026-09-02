Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815BC3E7167
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337857; cv=none; b=qKlVj8Sunw26tRh58Mwebv/SRNDOdYrbeuINu9zI4uZqHITWtlco+IRpKm5g0KKxOvWuTVYN+UjeG9+AqHRUNBG9/8Gt/BKR+CJXFq3+PFu+pT8EFqEyuK/oWT9QJClsvlSZ8GAqXhz+Ygnwly9hrPH5y4I0nsaFwB3yZq7PXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337857; c=relaxed/simple;
	bh=N9TeGGF7vDI8/EEpEDbi2K+QEZ7bXnKHryNJTbarkpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DtXuN7/xd/Jhx9q2oa/eRL5HyAubaEGMaw42eKS9VP/kD5Od9TEL94VI8MbvdAAUU6qbxHGs6uWvFufBoNJRd/Jpnz56iYCQ00+Ow1JWe2azxNdmxxbqc4SutECdBGBKLe0DDrbJJGHmvepqsNAzqrS3in8JhinbFKdLSzfoV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hChvdgpW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hChvdgpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE2C1F000E9;
	Wed,  2 Sep 2026 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337856;
	bh=uyxBWuQBtDi2SVcg6lr8jOkywLH23dUFfBYwruTHZFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hChvdgpWuog5aJW/M/VKPCLoF46jyWsntYuqn6Xg56BJ0xfJS887JDjHUbsSTOE3A
	 Aq8c6mXCiLK2vaC9/KBwqBvbFNuA4/A9KZT1KIHIIriShQtJJ8ST0tq3Ynq0PxIoaY
	 qF0XH9C686G4VGS/1B+MUI8KPaT9wfMuEBJnLjQxQ5ShjUmx67kzBD+1nI534+F11l
	 H4n9qZt/YyA2G2A0Hrxi9ULMHZiGn3eqoFICBDfAwoSAQBnWgmI5/sVZklELs97TLy
	 1YTNPpz/Xes98JqZFmtrFfZYFlnoUvSwY+YXx44JzCQj3Wd2ds2NBLX2/GQMbJxF4e
	 0dHNALz8yl5yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901083001.8044-2-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
 <20260901083001.8044-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:30:55 +0000
Message-Id: <20260902083055.ADE2C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Destructive masking of `pl->sfp_interfaces` permanently loses SFP =
capabilities, breaking dynamic PCS addition.
- [High] Dynamic PCS addition does not update `pl->supported` ethtool linkm=
odes, causing userspace to see stale capabilities.
--

commit fc5f6243a996e15a09d68ff84a3f016539fde123
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: keep and use MAC supported_interfaces in phylink struct

This patch adds a copy of supported_interfaces from phylink_config into the
phylink struct and uses it instead of relying on the phylink_config value.
This prepares the driver to support internal PCS handling, where a PCS can
be added or removed dynamically after the phylink is created.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 3ec3bb4391095..7f7a7328124f2 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1904,6 +1909,9 @@ struct phylink *phylink_create(struct phylink_confi=
g *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
> =20
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +
>  	linkmode_fill(pl->supported);
>  	linkmode_copy(pl->link_config.advertising, pl->supported);
>  	phylink_validate(pl, pl->supported, &pl->link_config);

[Severity: High]
Since the goal of this patch is to support adding a PCS after phylink
creation, does this leave pl->supported with stale capabilities?

When a PCS is dynamically added, pl->supported_interfaces is updated,
but it doesn't appear that pl->supported is recalculated here or during
the update. Would this cause userspace ethtool to see incorrect or stale
supported linkmodes for the network device?

[ ... ]
> @@ -3758,14 +3766,14 @@ static int phylink_sfp_config_optical(struct phyl=
ink *pl)
> =20
>  	phylink_dbg(pl, "optical SFP: interfaces=3D[mac=3D%*pbl, sfp=3D%*pbl]\n=
",
>  		    (int)PHY_INTERFACE_MODE_MAX,
> -		    pl->config->supported_interfaces,
> +		    pl->supported_interfaces,
>  		    (int)PHY_INTERFACE_MODE_MAX,
>  		    pl->sfp_interfaces);
> =20
>  	/* Find the union of the supported interfaces by the PCS/MAC and
>  	 * the SFP module.
>  	 */
> -	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
> +	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
>  			  pl->sfp_interfaces);

[Severity: High]
Does this destructively mask pl->sfp_interfaces against the current
(potentially pre-PCS) supported_interfaces?

If an SFP module is probed and inserted before the dynamic PCS provider is
attached, this operation will permanently drop capabilities from
pl->sfp_interfaces. When the PCS is later added and supported_interfaces
expands, the SFP module will have already lost those capabilities, which
might cause it to fail to link or be restricted to a suboptimal interface.

[ ... ]
> @@ -3936,7 +3944,7 @@ static int phylink_sfp_connect_phy(void *upstream, =
struct phy_device *phy)
> =20
>  	/* Set the PHY's host supported interfaces */
>  	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
> -			  pl->config->supported_interfaces);
> +			  pl->supported_interfaces);

[Severity: High]
Similarly, does this irreversibly limit the PHY's host_interfaces based
on the current supported_interfaces before the PCS is attached?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083001.8044=
-1-ansuelsmth@gmail.com?part=3D1
