Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3827FB18
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108185; cv=none; b=T7KxcimOk7riPWjEjLGNdZHRUIVoZTn/1mN7Dx7aE6pQcT8NB3Rh+4r1MB3QkeoOCEE2+7yp638pi62Uvao64Zjukct4lqWhzqvqDT40vZwXh46yhf/dYbW4k7gbwbQh0/S3XP/P2aXENnksi2Y6m/uJDHOZzXh2rWw+UriByAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108185; c=relaxed/simple;
	bh=/CCUmu4Km1nustBlHIX+Vr8aqjOkANS9U3vUfJBjc0w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qwOYmoy+ZIJ5NAW+O0jZ75+nKqevEMbw0vJG4lL7co+0SBJxIjCHNpN7P/Y839lout2LDbFjgSsO0PyIeCgkb7lYkKw/Y/2PL8FA2DEhwL/MnzNnDOtiTFcapNBuUGjDAUvpRP9dGqfLl6K+B+ypoP3/I055HXdcXgPiT+ZbPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbDvygeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbDvygeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87F31F00898;
	Wed, 10 Jun 2026 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108184;
	bh=8hJJhUDjeSJB6qGUTnQiuEjXoLqcKcZs6uNtq+ZP+oI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hbDvygeAz/fF9cit2rm5gotOMUy0WD5u/4RGryWMlfwi6Jb5BRgD4lmg+suFALS6L
	 zlZbA/eTd+hZkqMBh/b61hIj87rfsGfYcPL9+HWMam3hDBKi0E25xZ/qm/93GO1Q4+
	 e/OCjtTLomi5Px3uMxQ0iqXSdqafrk5SYoHw082fjDVPZGysUdiOjjY7QGZbynJG1r
	 CgK7G1n6wdEAcS54wcp3/zpZJD5Mb8nmmJHvaHjHrEYr++jd6FNBpdpWCsVjVWdBma
	 EbhYi33kvKfNOikkTZrY8WJZntVDLnyYmnCk81339hzd7Ltb2m22CTCuYt1OqkA2Ey
	 +ezznI2kSuPDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609151212.29469-3-ansuelsmth@gmail.com>
References: <20260609151212.29469-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:23 +0000
Message-Id: <20260610161623.B87F31F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] phylink_stop() permanently deletes PCS-supported interfaces from t=
he phylink mask.
- [High] Inactive PCSs attached to the phylink instance can spuriously trig=
ger link changes.
- [Medium] PCS selection logic inconsistently applies pcs_interfaces, causi=
ng validation and configuration mismatches.
- [Low] Mutual exclusion check for PCS methods is placed in a validation lo=
op, causing excessive log spam.

Pre-existing issues:
- [High] Missing cleanup of `pcs->phylink` for legacy `.mac_select_pcs` cod=
e paths leads to Use-After-Free.
- [High] Missing `IS_ERR` check on `mac_select_pcs` return value in `phylin=
k_inband_caps`.
--

commit 0ed3c25ac9713ad466d414b45a844576296e0982
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: phylink: introduce internal phylink PCS handling
Summary: This patch introduces internal PCS handling for phylink as an alte=
rnative to the MAC .mac_select_pcs callback. It allows MAC drivers to provi=
de an array of available PCSs during creation, which phylink manages as a l=
inked list to dynamically select and validate the appropriate PCS.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 4d59c0dd78dbf..4d6ffda0cdd61 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -518,22 +523,59 @@ static void phylink_validate_mask_caps(unsigned lon=
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
>  	if (pl->mac_ops->mac_select_pcs) {
> +		/* Make sure either PCS internal validation or .mac_select_pcs
> +		 * is used. Return error if both are defined.
> +		 */
> +		if (!list_empty(&pl->pcs_list)) {
> +			phylink_err(pl, "either phylink_pcs_add() or .mac_select_pcs must be =
used\n");
> +			return -EINVAL;
> +		}

[Severity: Low]
Is this the best place for this structural check? Since
phylink_validate_mac_and_pcs() is called iteratively for every supported
interface mode during mask validation, won't a misconfigured driver
trigger this error message dozens of times? Could this check be moved to a
one-time initialization path like phylink_create()?

> +
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +
> +		pcs_found =3D !!pcs;
> +	} else {
> +		/* Check every assigned PCS and search for one that supports
> +		 * the interface.
> +		 */
> +		list_for_each_entry(pcs, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
> +				pcs_found =3D true;
> +				break;
> +			}
> +		}
>  	}

[Severity: Medium]
Does this validation logic properly account for the pcs_interfaces mask?
In phylink_major_config(), the PCS list is only searched if the interface
requires a dedicated PCS via test_bit(state->interface,
pl->config->pcs_interfaces). Since this loop unconditionally checks the
PCS list, could it incorrectly constrain validation by the PCS capabilities
even if the MAC handles the interface directly?

[ ... ]
> @@ -965,12 +1004,22 @@ static unsigned int phylink_inband_caps(struct phy=
link *pl,
>  					 phy_interface_t interface)
>  {
>  	struct phylink_pcs *pcs;
> +	bool pcs_found =3D false;
> =20
> -	if (!pl->mac_ops->mac_select_pcs)
> -		return 0;
> +	if (pl->mac_ops->mac_select_pcs) {
> +		pcs =3D pl->mac_ops->mac_select_pcs(pl->config,
> +						  interface);
> +		pcs_found =3D !!pcs;

[Severity: High]
This is a pre-existing issue, but does this correctly handle error
pointers returned by mac_select_pcs()? If it returns an ERR_PTR on
failure, !!pcs evaluates to true, causing phylink_pcs_inband_caps() to
dereference the error pointer later in this function. Could we add an
IS_ERR() check here?

> +	} else {
> +		list_for_each_entry(pcs, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(pcs, interface)) {
> +				pcs_found =3D true;
> +				break;
> +			}
> +		}
> +	}

[Severity: Medium]
Similar to phylink_validate_mac_and_pcs(), this iterates the PCS list
without checking if the interface requires a PCS via
pl->config->pcs_interfaces. Is it possible for this to return inaccurate
inband capabilities if a MAC supports an interface directly without using
an available PCS?

[ ... ]
> @@ -1953,10 +2081,16 @@ EXPORT_SYMBOL_GPL(phylink_create);
>   */
>  void phylink_destroy(struct phylink *pl)
>  {
> +	struct phylink_pcs *pcs, *tmp;
> +
>  	sfp_bus_del_upstream(pl->sfp_bus);
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> =20
> +	/* Remove every PCS from phylink PCS list */
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
> +		list_del(&pcs->list);
> +
>  	cancel_work_sync(&pl->resolve);
>  	kfree(pl);
>  }

[Severity: High]
This is a pre-existing issue, but is it possible for a legacy PCS to
access freed memory here? For MAC drivers using the legacy
.mac_select_pcs callback, phylink_major_config() sets pcs->phylink =3D pl,
but that pointer is never cleared during teardown. If the PCS driver
outlives the phylink instance and triggers phylink_pcs_change(), it would
dereference the freed phylink pointer.

[ ... ]
> @@ -2437,6 +2571,7 @@ static irqreturn_t phylink_link_handler(int irq, vo=
id *data)
>   */
>  void phylink_start(struct phylink *pl)
>  {
> +	struct phylink_pcs *pcs;
>  	bool poll =3D false;
> =20
>  	ASSERT_RTNL();
> @@ -2463,6 +2598,10 @@ void phylink_start(struct phylink *pl)
> =20
>  	pl->pcs_state =3D PCS_STATE_STARTED;
> =20
> +	/* link available PCS to phylink struct */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D pl;
> +

[Severity: High]
Does attaching all available PCSs to the phylink instance create a risk
of spurious link changes? Since all PCSs in the list receive the phylink
pointer, any of them can call phylink_pcs_change(). Because
phylink_pcs_change() does not verify if the calling PCS is the actively
selected one (pl->pcs), couldn't an interrupt from an inactive PCS
(like a loss of signal) falsely trigger a link state change and disrupt
the active connection?

[ ... ]
> @@ -2507,6 +2646,8 @@ EXPORT_SYMBOL_GPL(phylink_start);
>   */
>  void phylink_stop(struct phylink *pl)
>  {
> +	struct phylink_pcs *pcs;
> +
>  	ASSERT_RTNL();
> =20
>  	if (pl->sfp_bus)
> @@ -2524,6 +2665,14 @@ void phylink_stop(struct phylink *pl)
>  	pl->pcs_state =3D PCS_STATE_DOWN;
> =20
>  	phylink_pcs_disable(pl->pcs);
> +
> +	/* Drop link between phylink and PCS */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D NULL;
> +
> +	/* Restore original supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
>  }

[Severity: High]
Will unconditionally clearing the supported interfaces permanently
break PCS capabilities on a link down/up cycle? During phylink_create(),
pl->supported_interfaces aggregates capabilities from all attached PCSs.
When phylink_stop() resets this to the base MAC capabilities, the PCS
capabilities are lost because phylink_start() does not reconstruct the
aggregated mask. Could this prevent the link from coming back up in modes
that rely on a PCS after the interface is bounced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D2
