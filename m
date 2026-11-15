Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739518;
	b=Eh2FqMWlxCc/Qw7imLAu5R8hqa/yyU07uML12fAb5wXb1u5qTmVSZZIjlIRBNXRIZTh+
	 HU7NR8nbOvbwzcO9QcV4eR6qMWBel3g4VHuf5K+JhpPXc803oeS3Vc5vLXH9oPWsZ6VG0
	 Gmtz4+rYli/1a3w16Q3ELOZ7F+hisC92cT8V709Qld1iArMi5Xu2bCUiacnIRpDQmsGqm
	 3YlcSbcclhfZNst19Jd+hQjRW3w74aNtVXs7eWMqzukjVu3vTxv+n8DKU8+B8wypW9/ww
	 U0xrdsXlzqbPTIOhID0a8Z6nF/N26+ZC5JOqmvVtO7TewGl5YTaFV6rnuIH94C5TA7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=txA3wyhr4RFPDe4EWlounFQyQ3tUGyO1Oay/QNzsIT8=;
	b=r1/xLEkgZMNj8XbF+gGngxJ9CGsxINVIzBuwvxpsGBBcF6SVGI+srxvtXLpup3wFMk5F
	 ua0Mu65LtlJdfhdWrKS1adQUGLVWUn299kR8DK9gvteWD7s5mDaOSZ/J0HrDCOu2UK0LQ
	 gDmtrbn0+iMUId691Cbi7jf8+vaPrkSYrV0nIJl+binoZXngh77aAIPPsFqAtItBpj0/a
	 ZMQtXnJhuS8LCydrOaEce+sGbgqmlm7hXe7+5Esws+f553/5OvcfgxkTU4e/IjQozs4uq
	 0B/lFkqmuS5Kwn6aKulSnPs5liYq9e0gkVS6RDpKh4MyyuLDXsQcR7Jucp8q93th2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULfy2AoO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D9606A88B
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULfy2AoO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE5B1F000D4;
	Sun, 15 Nov 2026 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739518;
	bh=txA3wyhr4RFPDe4EWlounFQyQ3tUGyO1Oay/QNzsIT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ULfy2AoO074NUxu1qGxNXTAaV9Nwbo+0FOohoUGBiyFmOwK9sHBUIQ1+Fxs+bSRFF
	 IHR6lMFoj5xEUA/bdnwN6jnx9hMNqOWHc0Pctp99Wen3xrUC3THfsOPVhGkS1tym0M
	 YEntNk/V/MiYoHJ6MtWTFLwsXROcqGjqsVMbrNW265so87mjiX0yvfSSd09UPqT1Rc
	 Pu9RVc0MRui4YVgB+pnFJceqX2iEWqJBGVZswD+v7LNh/tmxgn7YBKyGICXSFuLrNs
	 uRmrcA7ICs0/eYKAUJfStA57D9/mteMQHu+9smtArJWpEi1fOjOFCPrCUxYPOvqscE
	 o/me6mWpGScuA==
Message-ID: <sashiko-outbox-215400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 09/15] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-10-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] net: phylink: broken MLO_AN_FIXED and MLO_AN_INBAND recovery in
  phylink_resolve()
- [Medium] net: phylink: capability mask corruption in
  phylink_calculate_capabilities()
- [Medium] net: phylink: data race on linkmode bitmaps in
  phylink_create()
- [Low] net: pcs: inaccurate Returns kernel-doc for
  fwnode_pcs_get_from_provider()
--

commit 483dcebdc3997073778f57fa52e0f5ffb3f2eaf9
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

This commit adds the FWNODE_PCS_PROVIDER_ADD notifier event and
fwnode_pcs_get_from_provider() helper so phylink instances can attach
PCS providers that register after phylink creation and re-trigger link
resolution.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> index 25b3248e8b93b..fef560eddf2a9 100644
> --- a/drivers/net/pcs/pcs.c
> +++ b/drivers/net/pcs/pcs.c
> @@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> =20
>  	mutex_unlock(&fwnode_pcs_mutex);
> =20
> +	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
> +				     FWNODE_PCS_PROVIDER_ADD,
> +				     pp);
> +
>  	pr_debug("Added pcs provider from %pfwf\n", fwnode);
> =20
>  	return pp;

[Severity: Medium]
Can firing FWNODE_PCS_PROVIDER_ADD here cause a data race on
pl->supported, pl->link_config.advertising, and pl->supported_interfaces
if a PCS provider registers while phylink_create() or
phylink_validate_phy() is running on another CPU?

phylink_create() registers pcs_provider_notify() before setup is finished
and releases pl->state_mutex before calling phylink_parse_mode() and
phylink_parse_fixedlink() (and phylink_create() is called without
rtnl_lock):

CPU0                                  CPU1
phylink_create()
  register_fwnode_pcs_notifier()
  ...
  mutex_unlock(&pl->state_mutex)
                                      fwnode_pcs_add_provider()
                                        ...
                                        pcs_provider_notify()
                                          mutex_lock(&pl->state_mutex)
                                          phylink_calculate_capabilities()
                                            linkmode_fill(pl->supported)
  phylink_parse_mode()
    phylink_set(pl->supported, ...)  <-- data race

phylink_validate_phy() similarly reads pl->supported_interfaces outside
pl->state_mutex before phylink_bringup_phy() acquires the lock, racing
with pcs_provider_notify() updating pl->supported_interfaces.

[ ... ]

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e807fcccb5de9..b2d5ced432091 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -2127,20 +2151,42 @@ static int pcs_provider_notify(struct notifier_bl=
ock *self,
>  	struct fwnode_pcs_provider *pp =3D data;
>  	struct phylink_pcs *pcs, *tmp;
>  	bool resolve =3D false;
> +	int count, i;
> =20
>  	rtnl_lock();
>  	mutex_lock(&pl->state_mutex);
> =20
> -	/*
> -	 * Loop all the PCS for phylink instance and check if
> -	 * this notification is relevant for some of them.
> -	 */
> -	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> -		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> -			continue;
> +	switch (val) {
> +	case FWNODE_PCS_PROVIDER_ADD:
> +		count =3D fwnode_phylink_pcs_count(pl->fwnode);
> +		for (i =3D 0; i < count; i++) {
> +			pcs =3D fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
> +			if (IS_ERR_OR_NULL(pcs))
> +				continue;
> +
> +			/* Trigger a resolve only if a PCS is actually added */
> +			if (phylink_add_pcs(pl, pcs))
> +				resolve =3D true;
> +		}
> +
> +		/* Force an interface reconfig if major config fail */
> +		if (resolve && pl->major_config_failed)
> +			pl->force_major_config =3D true;

[Severity: High]
Does setting pl->force_major_config here actually recover MLO_AN_FIXED and
MLO_AN_INBAND links when phylink_major_config() previously failed during
phylink_start()?

When phylink_start() runs before the PCS provider is registered,
phylink_major_config() fails and returns before phylink_pcs_neg_mode()
can set pl->act_link_an_mode, leaving pl->act_link_an_mode at 0
(MLO_AN_PHY):

drivers/net/phy/phylink.c:phylink_major_config() {
	...
		if (!pcs) {
			phylink_err(pl,
				    "couldn't find a PCS for %s\n",
				    phy_modes(state->interface));

			pl->major_config_failed =3D true;
			return;
		}
	}

	pcs_changed =3D pl->pcs !=3D pcs;

	phylink_pcs_neg_mode(pl, pcs, state->interface, state->advertising);
	...
}

When the PCS provider later attaches and phylink_resolve() runs,
phylink_resolve() selects the link_state source using pl->act_link_an_mode
before calling phylink_major_config():

drivers/net/phy/phylink.c:phylink_resolve() {
	...
	} else if (pl->act_link_an_mode =3D=3D MLO_AN_FIXED) {
		phylink_get_fixed_state(pl, &link_state);
		mac_config =3D link_state.link;
	} else if (pl->act_link_an_mode =3D=3D MLO_AN_PHY) {
		link_state =3D pl->phy_state;
		mac_config =3D link_state.link;
	} else {
		phylink_mac_pcs_get_state(pl, &link_state);
	...
	if ((mac_config && link_state.interface !=3D pl->link_config.interface) ||
	    pl->force_major_config) {
		...
		phylink_major_config(pl, false, &link_state);
		pl->link_config.interface =3D link_state.interface;
		pl->force_major_config =3D false;
	}
}

Because pl->act_link_an_mode is still MLO_AN_PHY, phylink_resolve() copies
the unpopulated pl->phy_state (where link is false and advertising is
zero) into link_state.  For MLO_AN_INBAND 802.3z links without a PHY,
phylink_pcs_neg_mode() sees ETHTOOL_LINK_MODE_Autoneg_BIT cleared in
state->advertising, selects PHYLINK_PCS_NEG_INBAND_DISABLED, and programs
an empty advertisement into the PCS.  For MLO_AN_FIXED links without
polling or a link GPIO interrupt, link_state.link is false,
pl->force_major_config is cleared, and the fixed link stays down forever.

Even when pl->act_link_an_mode is already MLO_AN_INBAND (such as after
FWNODE_PCS_PROVIDER_DEL followed by FWNODE_PCS_PROVIDER_ADD),
phylink_resolve() calls phylink_mac_pcs_get_state() while pl->pcs is still
NULL, before phylink_major_config() attaches and enables the new PCS, so a
non-polled PCS is never queried for its link state after attachment.

> -		phylink_del_pcs(pl, pcs);
> -		resolve =3D true;
> +		break;
> +	case FWNODE_PCS_PROVIDER_DEL:
> +		/*
> +		 * Loop all the PCS for phylink instance and check if
> +		 * this notification is relevant for some of them.
> +		 */
> +		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> +				continue;
> +
> +			phylink_del_pcs(pl, pcs);
> +			resolve =3D true;
> +		}
> +		break;
>  	}
> =20
>  	/* Exit early if nothing has changed */

[Severity: Medium]
Does calling phylink_calculate_capabilities(pl) below this check in
pcs_provider_notify() overwrite the mode-, PHY-, and SFP-restricted
capability masks in pl->supported and pl->link_config.advertising?

After phylink_calculate_capabilities() runs in phylink_create(),
phylink_parse_mode(), phylink_parse_fixedlink(), phylink_bringup_phy(),
and phylink_sfp_set_config() narrow pl->supported and
pl->link_config.advertising to the active link mode, attached PHY, or SFP
module without updating pl->advertising.  When pcs_provider_notify() later
calls phylink_calculate_capabilities(), it refills pl->supported with all
ones and validates only against the raw MAC and PCS capabilities, wiping
out those restrictions:

drivers/net/phy/phylink.c:phylink_calculate_capabilities() {
	...
	/* Get user-disabled advertising modes */
	linkmode_xor(disabled_advertising, pl->advertising,
		     pl->link_config.advertising);

	/* Calculate the full supported advertisement */
	linkmode_fill(pl->supported);
	linkmode_copy(pl->link_config.advertising, pl->supported);
	__phylink_validate(pl, pl->supported, &pl->link_config);
	...
}

In addition, if pl->link_config.interface is only supported by a PCS that
has not attached yet (or was just removed), __phylink_validate() returns
-EINVAL early when test_bit(state->interface, interfaces) fails, leaving
pl->supported and pl->advertising filled with all ones and causing
phylink_parse_mode() or phylink_validate_phy() to fail with -EINVAL before
the PCS provider can attach.

[ ... ]

> diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
> index 83e0a2ad4b099..00a636c82c65f 100644
> --- a/include/linux/pcs/pcs.h
> +++ b/include/linux/pcs/pcs.h

[ ... ]

> +/**
> + * fwnode_pcs_get_from_provider() - Retrieve a PCS from a specific provi=
der
> + * @provider: PCS provider to use
> + * @fwnode: firmware node
> + * @index: index fwnode PCS handle in firmware node
> + *
> + * Get a PCS from the firmware node at index specifically provided by
> + * passed PCS provider.
> + *
> + * Unlike fwnode_pcs_get(), this function does not search the global lis=
t of
> + * PCS providers. The caller must provide the provider responsible for t=
he
> + * referenced PCS.
> + *
> + * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
> + * return -ENODEV if the PCS is not present in global providers list (ei=
ther
> + * due to driver still needs to be probed or it failed to probe/removed)=
 or
> + * can return -EINVAL if the PCS provider doesn't expose any PCS for the=
 fwnode.
> + */

[Severity: Low]
This isn't a bug, but the Returns description says
fwnode_pcs_get_from_provider() can return -ENODEV if the PCS is not
present in the global providers list, which contradicts the preceding
paragraph and the implementation in drivers/net/pcs/pcs.c (which only
checks the passed provider and never searches fwnode_pcs_providers).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D9
