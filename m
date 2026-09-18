Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53025175A64
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692324; cv=none; b=ukyt1R4+l44+bW3FOVEQuHDnhdksfTrbAhuGIYVsfgSL5Iod67Klx8uJo++I+gYPMmFuFUXm0/oS3IA9Vw1q3DeYNOxO5ux9xhHvMEWiOoauTIvy4Y+SsS/1QjWpcDsMvMXbuF/1Mg/o9H4y9kmiDWDrqB+kmEwo6foBITs38w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692324; c=relaxed/simple;
	bh=fof9TctqWK3exOzoPAy/2oeZxLno/qEj/oOvhVvK/98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y5PLq1PoP/AZ5kaZmJVdesQ/2NOLcEXNTCCo7ZKq1Hkr1IzZnMCFCyXuBL+QGxdU1nPJiZKCDOVUMRp/Sft+J8n+FW0cx+20OWKoOe/0Fb82XQceZdAbmYj88yYGDAz7zHNZ13xWsT0MCxr8/7qDfTJU8C4vnyj0guqsVGBimZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRRF2zK2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRRF2zK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5DF1F00893;
	Fri, 18 Sep 2026 00:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789692321;
	bh=Va87/TGLRy0EXD8hgYCIy6y3c4fULbE4u7+35V8fwik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aRRF2zK2Ro1BfTCjebErmHtxSQlh19/086AD0H6PztuqiRlpRLU1iIMPUXA+JeId9
	 BQxfj8gktI+SO1LmwYcCFJb9ZBcdN7nBzQY5QZWqt7c//NQ2IQ0psTcG61gVJPlEfh
	 Dv37Fl/rELpwBemgb3h7HXXjz7yLDAJ7M61Yhvo0y1MExSOK5/H3MsmQXO340cQcuc
	 ca56n/TFEV4zo87KoJMCIdO4R+l/t89njM16wTdpNGzaWaWlQmXeQEVhWmUeS9LZZx
	 R2M9G+s7EKJfltTZAvZDWxpolYlGBSMnxVXjuA6bscnj3WfIcJGpXH21KKWvNCahji
	 aEqMgutRLrubA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916235200.20712-3-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260916235200.20712-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:45:20 +0000
Message-Id: <20260918004521.4B5DF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: phylink_validate_mac_and_pcs() fails to return error when r=
equired PCS is missing
- [Medium] net: phylink_create() unsafely expands MAC supported interfaces =
with generic PCS capabilities
--

commit 5b275072f20518c6dfff0e7c6d9837800cd61c3e
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces internal handling of PCS for phylink, moving the PCS
selection logic entirely to phylink using the supported_interface value in
the PCS struct. This provides an alternative to the .mac_select_pcs callbac=
k.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index d67a5184c524f..417d2f1e54b72 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -530,6 +549,21 @@ static int phylink_validate_mac_and_pcs(struct phyli=
nk *pl,
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +	/*
> +	 * Find a PCS in available PCS list for the requested interface.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		struct phylink_pcs *tmp;
> +
> +		list_for_each_entry(tmp, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
> +				pcs =3D tmp;
> +				break;
> +			}
> +		}
>  	}
> =20
>  	if (pcs) {

[Severity: Medium]
If the requested interface requires a dedicated PCS (the pcs_interfaces bit
is set), but the loop finishes without finding a matching PCS in the
pcs_list, pcs will remain NULL. Should this code return an error here
rather than falling through?

If it doesn't return an error, phylink might falsely advertise unsupported
link modes during auto-negotiation, and later phylink_major_config() could
attempt to configure this mode, fail to find the required PCS, and fatally
abort configuration.

[ ... ]

> @@ -2031,16 +2150,31 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
> =20
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret =3D phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D pl;
> +
>  	phy_interface_copy(pl->supported_interfaces,
>  			   pl->config->supported_interfaces);
> =20
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);
> +

[Severity: Medium]
Does this safely handle MAC capabilities, or could it incorrectly expand
the MAC's supported interfaces with generic PCS capabilities?

Generic PCS blocks often support interface modes that the specific MAC or
board trace routing does not. By ORing in all interfaces supported by the
attached PCS modules, this might cause phylink_validate() to incorrectly
accept unsupported interface modes (since MAC drivers often only check
speed/duplex in their mac_capabilities).

>  	linkmode_fill(pl->supported);
>  	linkmode_copy(pl->link_config.advertising, pl->supported);
>  	phylink_validate(pl, pl->supported, &pl->link_config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916235200.2071=
2-1-ansuelsmth@gmail.com?part=3D2
