Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6723EAAA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502099; cv=none; b=O6hUZzazlIgt8YlnNlDK8J0INJGlkwNrJVC4JiMAdntf3rQH9Zd9ZGRnYOPqdHspHIVgLpkLtVAdcEBFsA76UMujhQPQKXbIJIm87bcBhYOKPsKC+0ss77Yb+RiUjL0g0MhFE9dkzBbZr999n8BQoSam2YrEJrToptyeiwiZ3Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502099; c=relaxed/simple;
	bh=ai6LuTmfJBhfpGoNqdgMhRlfVT/b3JnW3qgyIaDu+mQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DVcAFToAWnd+drDtDkpYxcJQlxtEgeKk+tmUh7HoZZokr/L/wdmLYJlrSWyf9k3aeaEvlwrl/5r5AE8+5ID/le0R5HsyHcctF47YZYVfr8AAf66F3T2Sc/JiKyeGgNdaq6ACs3HprdJVSMKaCy98bAWN0vRjn1oV/4yEtjM2FWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTZ5DmP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTZ5DmP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58981F00A3A;
	Fri, 31 Jul 2026 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502098;
	bh=MWBaf1AdyagJA2szXLj/nP2zWoREX2jTfozwda+dd9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iTZ5DmP2LizPuveyULEneIXhiigOKUgZMslY8sqSqMgpyXvbg71uCguOwldnBytiO
	 UNGGvlu4fW4qTrtzXvm2DaUVJ5czosVeg/aXWMfiqjztPKo5AtasNZph31HJwbRVR8
	 uXhH0pCsGJ7GnsTmKsPBkuBlBsBx1rElCdWAjbOKQ7R9Ryz2H0IpTLbnGFIuSCjRdd
	 X6H8nmGz0GvvLxNhEioZ3UXt0AJy1ztVOuqR+H/03Mg2/OB/XJZ56VJjbGnR81uU22
	 MIIOp7qHpNKwOUzUPtSWIyAm2lBx6kGfCunAXcjOaUztjz7pszEnIhgpnHcH6MV1EK
	 MS/gOHvawoGSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 05/11] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730102444.1967900-6-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:48:17 +0000
Message-Id: <20260731124817.A58981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing unregistration of the global PCS notifier on `phylink_crea=
te` error paths leads to a Use-After-Free.
- [High] Premature registration of the PCS notifier before `pl->config` is =
initialized allows a NULL pointer dereference.
- [High] Unprotected list iteration and data race on `supported_interfaces`=
 in `phylink_create()`.
- [High] `pcs_provider_notify()` queries the wrong firmware node for multi-=
port devices, breaking late PCS attachment.
--

--- Patch [5]: [PATCH net-next v10 05/11] net: phylink: support late PCS pr=
ovider attach ---
commit d9b1d2d810fd485b6cc269c43b554af06d8f51d3
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach
   =20
This commit adds support for late PCS provider attachment to a phylink
instance by creating a global notifier chain that emits events when a new
PCS provider is added. Phylink instances subscribe to this notifier to
dynamically link PCS providers and trigger interface reconfiguration when
they appear.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 562e09d1838b0..d38820543ae4a 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1988,21 +2011,70 @@ static int phylink_fill_available_pcs(struct phyl=
ink *pl,
> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl =3D container_of(self, struct phylink, fwnode_pcs_nb=
);
> +	struct fwnode_handle *pcs_fwnode =3D data;
> +	struct phylink_pcs *pcs;
> +
> +	rtnl_lock();
> +
> +	/* Check if the just added PCS provider is
> +	 * in the phylink instance pcs-handle property.
> +	 */
> +	pcs =3D fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
> +						 pcs_fwnode);

[Severity: High]
Will this correctly handle multi-port MACs or DSA switches where the pcs-ha=
ndle
property is located in a child port's firmware node?

In phylink_create(), the port-specific firmware node is passed in as the
fwnode parameter. However, this callback queries the top-level
dev_fwnode(pl->config->dev), which may not contain the pcs-handle property
for individual ports.=20

Should the instance store the port's fwnode during creation so the notifier
can use it here instead?

[ ... ]

> @@ -2047,15 +2119,21 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	INIT_WORK(&pl->resolve, phylink_resolve);
>  	INIT_LIST_HEAD(&pl->pcs_list);
> =20
> +	/*
> +	 * First register notifier for late PCS attach to catch
> +	 * any possible provider that registers while we fill
> +	 * the available PCS.
> +	 */
> +	if (!phy_interface_empty(config->pcs_interfaces)) {
> +		pl->fwnode_pcs_nb.notifier_call =3D pcs_provider_notify;
> +		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +	}

[Severity: High]
Is there a race condition here if a PCS provider is registered concurrently?

By registering the global notifier here, pcs_provider_notify() can be invok=
ed
immediately on another CPU. That callback dereferences pl->config->dev:

pcs_provider_notify() {
   ...
   pcs =3D fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
                                            pcs_fwnode);
}

However, pl->config isn't assigned until further down in phylink_create().
Could this result in a NULL pointer dereference if a driver probes
concurrently?

>  	/* Fill the PCS list with available PCS from phylink config */
>  	ret =3D phylink_fill_available_pcs(pl, config);
>  	if (ret < 0)
>  		goto free_pl;

[Severity: High]
If phylink_fill_available_pcs() or subsequent initialization steps fail, wi=
ll
this leak the notifier block into the global chain?

The error handling path at free_pl calls kfree(pl). If the notifier was
registered right above this step, but isn't unregistered before freeing pl,
could the next system-wide PCS registration trigger a use-after-free and cr=
ash
when it walks the global fwnode_pcs_notify_list?

> -	/* Link available PCS to phylink */
> -	list_for_each_entry(pcs, &pl->pcs_list, list)
> -		pcs->phylink =3D pl;
> -
>  	phy_interface_copy(pl->supported_interfaces,
>  			   config->supported_interfaces);
> =20
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: High]
Does this list iteration need to be protected by pl->state_mutex?

Since the PCS notifier has already been registered globally above,
pcs_provider_notify() could be executing on another CPU, acquiring
state_mutex, and modifying both pl->pcs_list and pl->supported_interfaces.

Could iterating the list and doing the bitwise OR here without holding the =
lock
lead to data corruption?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730102444.1967=
900-1-ansuelsmth@gmail.com?part=3D5
