Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6F22165EA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108187; cv=none; b=cDljNOcQNavs8Di+qAKT7D71uWBHNQ+HFaWE6BvwFWp03BGpxumaAp33rZD3t6o1HgT3xCACHXaZJR7/zO9ZnR0oUNt/51g5pOtJAMt4CKu8iwnQeA1ZpWYLIuxT0JVNv53MQPDaeyQveBczWivkzF0KkMCWB2bak0h4n1LEX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108187; c=relaxed/simple;
	bh=GuTxcuY4hVcQ9kTdImKY5Vs+9xMv3/4bKk/2H27YyEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SDWM3TM0x6md0a7eZuysoiPIjjH6NsJC69aPWLAdc3K9x5tkEN77qH2JuKZBwsHjS+O+YTk5jWTG+QS6GkyRq40ynDbErs1u8gzWKJdn5fDRjgtq4MDZST6IDYI6/OBi1tFzmdnY5sy83OTRk6oJDzph5DWviEEB0GpXFiVl5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTDe/9EJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTDe/9EJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18941F00898;
	Wed, 10 Jun 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108186;
	bh=3pUpr0TTkN/PRWMkBE+W2MAx/PHEqRoVFOCtrnnjd5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XTDe/9EJFjzYl2mmEbBXYnBvvSBJcgWCo1fxg/oEfNE4gDuK8gI3S/oc4koo42NK5
	 T5CS2eIHAwscaCZXIEgvOxLx1e7A1KMjE1EW3xL3OoOcVAchU2Ra0k1Arjrc42izYT
	 ptjTrHpRjXewWhC/vedhiV776gudp5guWHESoGzPCYuGkbP7nAOog2hTzjgsHoSB6a
	 4LbIf0WAXF3nhj9OA7xnsOJ4hFRW6WVqVG1WLTinWL/pdTRk8CATI45nWgVYeVhAj5
	 rIDlvTJN57T2zWyt56+pRdfrykrpi0qqNCdE1X/HhGxdekLPPNFIMJ4gIZb9T9ltYZ
	 gW67uCNaoVQ6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 05/12] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609151212.29469-6-ansuelsmth@gmail.com>
References: <20260609151212.29469-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:25 +0000
Message-Id: <20260610161625.D18941F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use-After-Free due to missing notifier unregistration when phylink=
 instance is destroyed.
- [High] Use-After-Free due to incomplete PCS detachment logic when the phy=
link instance is stopped.
- [High] Data race between `pcs_provider_notify()` and asynchronous readers=
 leads to `pl->pcs_list` corruption.
- [Medium] Memory leak of `fwnode_handle` references in `fwnode_phylink_pcs=
_get_from_fwnode()`.
--

commit e4be489886d6b3bd45151876412cae4ab8aa7956
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

This commit adds support for late PCS provider attachment to a phylink
instance. It implements a global notifier for the PCS provider, allowing
phylink instances to subscribe and attach the PCS when it becomes available.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> index 72f56f55d198d..911d95cf1b09c 100644
> --- a/drivers/net/pcs/pcs.c
> +++ b/drivers/net/pcs/pcs.c

[ ... ]

> @@ -147,6 +158,35 @@ struct phylink_pcs *fwnode_pcs_get(struct fwnode_han=
dle *fwnode, int index)
>  }
>  EXPORT_SYMBOL_GPL(fwnode_pcs_get);
> =20
> +struct phylink_pcs *
> +fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
> +				   struct fwnode_handle *pcs_fwnode)
> +{
> +	struct fwnode_reference_args pcsspec;
> +	int index =3D 0;
> +	int ret;
> +
> +	/* Loop until we find a matching PCS node or
> +	 * fwnode_parse_pcsspec() returns error
> +	 * if we don't have any other PCS reference to check.
> +	 */
> +	while (true) {
> +		ret =3D fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		/* Exit loop if we found the matching PCS node */
> +		if (pcsspec.fwnode =3D=3D pcs_fwnode)
> +			break;

[Severity: Medium]
Does this leak a fwnode_handle reference?

fwnode_parse_pcsspec() internally acquires a reference to pcsspec.fwnode.
However, on both the break path (when a match is found) and the loop
continuation path, this reference is never released with
fwnode_handle_put().

Will this leak a reference for every successfully parsed PCS specification?

> +
> +		/* Check the next PCS reference */
> +		index++;
> +	}
> +
> +	return fwnode_pcs_get(fwnode, index);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_get_from_fwnode);

[ ... ]

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index b45bee9273007..65b67c33e12fd 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1998,6 +2000,51 @@ static int phylink_fill_available_pcs(struct phyli=
nk *pl,
>  	return ret;
>  }
> =20
> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl =3D container_of(self, struct phylink, fwnode_pcs_nb=
);
> +	struct fwnode_handle *pcs_fwnode =3D data;
> +	struct phylink_pcs *pcs;
> +
> +	/* Check if the just added PCS provider is
> +	 * in the phylink instance pcs-handle property.
> +	 */
> +	pcs =3D fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
> +						 pcs_fwnode);
> +	if (IS_ERR(pcs))
> +		return NOTIFY_DONE;
> +
> +	/* Add the PCS */
> +	rtnl_lock();
> +
> +	list_add(&pcs->list, &pl->pcs_list);

[Severity: High]
Is it safe to mutate this list while only holding the rtnl_lock?

pcs_provider_notify() adds a new PCS to pl->pcs_list under the
rtnl_lock().

However, asynchronous readers like phylink_major_config() executed from
the phylink_resolve workqueue traverse this same list using
list_for_each_entry() while only holding pl->state_mutex.

Since list_add() is not atomic and the locks are disjoint, can concurrent
access cause readers to traverse a partially updated list structure?

> +
> +	/* Link phylink if we are started */
> +	if (!pl->phylink_disable_state)
> +		pcs->phylink =3D pl;

[Severity: High]
Does this create a use-after-free when a phylink instance is stopped?

When the interface is stopped, phylink_stop() clears pcs->phylink by
setting it to NULL for every entry in pl->pcs_list.

If the underlying PCS driver is unbound while stopped, it calls
phylink_release_pcs(), which checks if pcs->phylink is NULL and returns
early, failing to remove the PCS from pl->pcs_list:

phylink_release_pcs() {
    pl =3D pcs->phylink;
    if (!pl)
        return;
    list_del(&pcs->list);
}

Will this leave a freed PCS structure dangling in pl->pcs_list which
could be traversed when phylink_start() is called later?

> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[ ... ]

> @@ -2053,6 +2100,11 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,
>  				 pl->supported_interfaces,
>  				 pcs->supported_interfaces);
> =20
> +	if (!phy_interface_empty(config->pcs_interfaces)) {
> +		pl->fwnode_pcs_nb.notifier_call =3D pcs_provider_notify;
> +		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +	}

[Severity: High]
If the phylink instance is destroyed, is this notifier ever unregistered?

If phylink_destroy() frees the phylink instance but doesn't unregister
the notifier block, will it leave a dangling pointer in the global
fwnode_pcs_notify_list? If so, won't this cause a kernel panic when the
next PCS provider is added?

> +
>  	pl->config =3D config;
>  	if (config->type =3D=3D PHYLINK_NETDEV) {
>  		pl->netdev =3D to_net_dev(config->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D5
