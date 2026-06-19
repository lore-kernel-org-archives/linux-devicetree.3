Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B433121C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878274; cv=none; b=E3zjdInqT7LbBAm8uk+YfMddBqyEBsV7vf+/fQwX4ryIcJoKqgJOHhd3BPGYYdy2fy+wsynBG2oUSgeEFTKdfHPadVrJZ4CYC7n4p+JqDbki3A0dQrCbpf9ODQhGecMHzoO6uCee//2D4gxjQS2kR+U5sEvxgOky43vdDaNzN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878274; c=relaxed/simple;
	bh=2b9m8KQGH79yuFSh8Nd5jwo0hwxfZJsZQ010o22P1Ug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BnDRR1mEda1UgHVwySUfm0hUrCzJtvv9PAgfMzarYbQ4V4QNmR+RzyTm6d0o74bjKxOMb3wzbduV1c0xdy8lJ+hxm+30kH/4+cV27FtOR7fxziaM7diIOT9Pp5FqAdstjFUzarZRsuYjRMZZ8uPoCEX4l83WAiEhN3zXIW3M8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmJK9fG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmJK9fG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9351F00A3D;
	Fri, 19 Jun 2026 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781878271;
	bh=bxa6cPAOAPBMpl2FK5XauHH0DSV4VMCLAY8WIAPNCQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UmJK9fG66FBu0ujsfqxAc60I7CHu2qjQTuzLKHJGdLmt7JCjp2ojgQyCLF6yvm1uN
	 JF45jjXjczd7NI2FSDQD7kbEtx8bfZgfTEYNEiaGNYLgDzxddMYB6L8ArEExsg8lA/
	 9OfZ6sfYac5a5tmHVAyqBX05IURvAX3gxhF3JyP029kX1DAf1VqJ6lQmzKq/uexUER
	 XlvNRGNEPXmT9UQ2CWQ35uKlISLQZhSkAftXgtYU+Q/nP8CRdvRdJ7pZ2wzYplUuL5
	 ZJzIMTUcOVIDlXDxSsOvmsin9vhGfv8jqpyTCHra0+AcYmzdKG92yOy+Fbn6aO5V3j
	 qSOm7vmMp1lfQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v8 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618125752.1223-3-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 14:11:10 +0000
Message-Id: <20260619141111.2A9351F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing `list_del(&pcs->list)` in the error path of `phylink_creat=
e()` leaves dangling pointers to freed memory.
- [High] `phylink_validate_mac_and_pcs()` fails to return an error when a r=
equired PCS is not found.
- [High] `phy_interface_or()` mishandles the 'empty means all' semantic for=
 `pcs->supported_interfaces`.
- [High] Race condition causing a Use-After-Free in `phylink_pcs_change()` =
during `phylink_destroy()`.
- [Medium] `phylink_fill_available_pcs()` reverses the priority order of th=
e provided PCS array.
--

commit b5576005f95ddfaef269adf2938d4dda4a006f6b
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces an internal linked list implementation for handling
PCS devices within phylink, providing an alternative to the .mac_select_pcs
callback. It allows MAC drivers to provide an array of available PCS devices
which are automatically mapped and selected based on the interface mode.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 4d59c0dd78dbf..c38bcd43b8c8b 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -518,12 +523,29 @@ static void phylink_validate_mask_caps(unsigned lon=
g *supported,
>  	linkmode_and(state->advertising, state->advertising, mask);
>  }
> =20
> +static int phylink_validate_pcs_interface(struct phylink_pcs *pcs,
> +					  phy_interface_t interface)
> +{
> +	/* If PCS define an empty supported_interfaces value, assume
> +	 * all interface are supported.
> +	 */
> +	if (phy_interface_empty(pcs->supported_interfaces))
> +		return 0;
> +
> +	/* Ensure that this PCS supports the interface mode */
> +	if (!test_bit(interface, pcs->supported_interfaces))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int phylink_validate_mac_and_pcs(struct phylink *pl,
>  					unsigned long *supported,
>  					struct phylink_link_state *state)
>  {
> -	struct phylink_pcs *pcs =3D NULL;
>  	unsigned long capabilities;
> +	struct phylink_pcs *pcs;
> +	bool pcs_found =3D false;
>  	int ret;
> =20
>  	/* Get the PCS for this interface mode */
> @@ -531,9 +553,24 @@ static int phylink_validate_mac_and_pcs(struct phyli=
nk *pl,
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +
> +		pcs_found =3D !!pcs;
> +	/*
> +	 * Find a PCS in available PCS list for the requested interface.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		list_for_each_entry(pcs, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
> +				pcs_found =3D true;
> +				break;
> +			}
> +		}
>  	}
> =20
> -	if (pcs) {
> +	if (pcs_found) {

[Severity: High]
Does this code incorrectly fall through and return success when a required =
PCS
is not found?

If test_bit(state->interface, pl->config->pcs_interfaces) requires a dedica=
ted
PCS, but none in pl->pcs_list matches, pcs_found remains false. The function
then skips the pcs_found validation block, proceeds to validate MAC
capabilities, and successfully returns 0.

Could this falsely advertise the interface as supported, leading to failures
later in phylink_major_config() where the missing PCS causes an abort? Shou=
ld
there be an explicit error return when a required PCS is not found?

[ ... ]

> @@ -1834,6 +1906,44 @@ int phylink_set_fixed_link(struct phylink *pl,
>  }
>  EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
> =20
> +static int phylink_fill_available_pcs(struct phylink *pl,
> +				      struct phylink_config *config)
> +{
> +	struct phylink_pcs **pcss;
> +	int i, ret;
> +
> +	if (!config->num_possible_pcs)
> +		return 0;
> +
> +	if (!config->fill_available_pcs) {
> +		dev_err(config->dev,
> +			"phylink: error: num_possible_pcs defined but no fill_available_pcs\n=
");
> +		return -EINVAL;
> +	}
> +
> +	pcss =3D kzalloc_objs(*pcss, config->num_possible_pcs);
> +	if (!pcss)
> +		return -ENOMEM;
> +
> +	ret =3D config->fill_available_pcs(config, pcss, config->num_possible_p=
cs);
> +	if (ret < 0)
> +		goto out;
> +
> +	for (i =3D 0; i < config->num_possible_pcs; i++) {
> +		struct phylink_pcs *pcs =3D pcss[i];
> +
> +		if (!pcs)
> +			continue;
> +
> +		list_add(&pcs->list, &pl->pcs_list);
> +	}

[Severity: Medium]
Does this loop reverse the intended priority order of the provided PCS arra=
y?

The function iterates sequentially through the pcss array and uses list_add=
()
to insert each PCS at the head of the list. When evaluating the list from h=
ead
to tail later (e.g., in phylink_validate_mac_and_pcs()), the MAC driver's
lowest-priority PCS (last in the array) will be checked before higher-prior=
ity
ones.

Should this use list_add_tail() instead to preserve the array order?

[ ... ]

> @@ -1872,10 +1993,26 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	mutex_init(&pl->phydev_mutex);
>  	mutex_init(&pl->state_mutex);
>  	INIT_WORK(&pl->resolve, phylink_resolve);
> +	INIT_LIST_HEAD(&pl->pcs_list);
> +
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret =3D phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D pl;
> =20
>  	phy_interface_copy(pl->supported_interfaces,
>  			   config->supported_interfaces);
> =20
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: High]
Does this loop mishandle the empty means all semantic for supported
interfaces?

The subsystem defines that an empty pcs->supported_interfaces mask means the
PCS supports all interfaces (as handled in phylink_validate_pcs_interface()=
).
However, OR-ing an empty bitmask into pl->supported_interfaces contributes
no interfaces at all.

Could this silently drop capabilities for generic PCSs that leave their
supported_interfaces empty?

[ ... ]

> @@ -1917,28 +2053,29 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	phylink_validate(pl, pl->supported, &pl->link_config);
> =20
>  	ret =3D phylink_parse_mode(pl, fwnode);
> -	if (ret < 0) {
> -		kfree(pl);
> -		return ERR_PTR(ret);
> -	}
> +	if (ret < 0)
> +		goto unlink_pcs_list;
> =20
>  	if (pl->cfg_link_an_mode =3D=3D MLO_AN_FIXED) {
>  		ret =3D phylink_parse_fixedlink(pl, fwnode);
> -		if (ret < 0) {
> -			kfree(pl);
> -			return ERR_PTR(ret);
> -		}
> +		if (ret < 0)
> +			goto unlink_pcs_list;
>  	}
> =20
>  	pl->req_link_an_mode =3D pl->cfg_link_an_mode;
> =20
>  	ret =3D phylink_register_sfp(pl, fwnode);
> -	if (ret < 0) {
> -		kfree(pl);
> -		return ERR_PTR(ret);
> -	}
> +	if (ret < 0)
> +		goto unlink_pcs_list;
> =20
>  	return pl;
> +
> +unlink_pcs_list:
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D NULL;
> +free_pl:
> +	kfree(pl);
> +	return ERR_PTR(ret);
>  }

[Severity: High]
Does this error path leave dangling pointers to freed memory?

The loop clears pcs->phylink but fails to call list_del(&pcs->list) before
freeing pl. Because the phylink_pcs structures are long-lived and owned by =
the
MAC driver or provider, their list nodes are left pointing to the freed
pl->pcs_list memory.

If a driver retries initialization and provides the same PCS objects, could
this list corruption lead to a use-after-free crash during the list_add()
step?

[ ... ]

> @@ -2413,8 +2560,15 @@ void phylink_pcs_change(struct phylink_pcs *pcs, b=
ool up)
>  {
>  	struct phylink *pl =3D pcs->phylink;
> =20
> -	if (pl)
> -		phylink_link_changed(pl, up, "pcs");
> +	/*
> +	 * Ignore PCS link state change if the PCS is not
> +	 * attached to a phylink instance or the phylink
> +	 * instance is not currently using this PCS.
> +	 */
> +	if (!pl || READ_ONCE(pl->pcs) !=3D pcs)
> +		return;
> +
> +	phylink_link_changed(pl, up, "pcs");
>  }

[Severity: High]
Is there a race condition here during phylink_destroy() that can cause a
use-after-free?

If an external PCS driver triggers an interrupt and calls phylink_pcs_chang=
e()
concurrently with phylink_destroy(), pl might be read as non-NULL before
phylink_destroy() unlinks the PCS and frees pl.

Without proper synchronization (like RCU or a lock), could the interrupt
handler be preempted, and subsequently dereference pl via READ_ONCE(pl->pcs)
after it has been freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618125752.1223=
-1-ansuelsmth@gmail.com?part=3D2
