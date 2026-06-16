Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4E361651
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620346; cv=none; b=Y2T3X0yyxpdoES0PBvb+ibONphQ3ftih6d/jPcwbqPyvWlZmhkj4ABr2zj20pesjurEFtF3H9ao++2dJrXauaR1Z5VCMin8t/5NXdJPUwsX7++PgSp5IVqS+lvD3oZhgLt9pPYaFLSjCl7cr+SHGiGkxMLYCrsCJay6LTk5/ZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620346; c=relaxed/simple;
	bh=tQVA0iIwwWhhGlb1bnOEI5FjVS/ScYakEi4dllW9FiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FGlBqd0yuJShPty9FQmBwAYIpLA50bTQdBdeHgzXt+BwEusPEi6ZV3nXO5oalSimEDW7PZMivSn2tXvv+0Vm0tbeStcJsNizMoLCjJP5fQ85qkM2DiQJYNfoGYTi6ddie93y+jEwnVYnxsOO6uJ3YK5xdc+unCl58Zht/FW0VoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bphL+WxE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bphL+WxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2BC1F000E9;
	Tue, 16 Jun 2026 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620345;
	bh=Klawy/+T/h3J1K65VoxBmnstqXmzumT8adUC3zMzVM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bphL+WxEUs24KqntLDaaXPy5rfzXdPrefBs4vpFLfHLSQAmCU/k/q1GOFR0QcyJU0
	 MdT9adyQvrinm2jqnq2AzS46Z7pij0iHYhEiRMZTbf0beoDLjgb+k0N6td0Je9f18Z
	 YzfC/rG3hU0NCPC68RPHj66CqedxvP4vtZqKAypwKgH0uc/M/Z5JsU+rJNhqXe9lOX
	 /bRkYjPqlaERIAkR1fWTHCapgHZn9w2Sli5p/10q7Kh5YtH28i6MIXRY5UXSCBwfA7
	 RRNIismN+DkPNJ1YjvJsBkWBIbm1XL1gg3zvOL8PzTGqmYEVFhrs9bW9FjlrR6DKgA
	 nEd1yhPeJTgMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615122950.22281-3-ansuelsmth@gmail.com>
References: <20260615122950.22281-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:32:23 +0000
Message-Id: <20260616143224.9D2BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Dereferencing the uninitialized pointer `pl` in `phylink_creat=
e()` causes a kernel panic.
- [High] Error paths in `phylink_create()` fail to unlink PCS objects and u=
nregister notifiers, leading to Use-After-Free and list corruption.
- [Medium] `phylink_validate_mac_and_pcs()` falsely reports an interface as=
 supported when a required PCS is not found.
- [Low] Lockless data race on `pl->pcs` between process context and interru=
pt context.
--

commit 5bb4efcfcad2f214630e951f75ab343ec05780b5
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: phylink: introduce internal phylink PCS handling

This commit introduces internal handling of PCS for phylink, moving the
selection logic of the PCS entirely to phylink. MAC drivers can now provide
a callback to fill the available PCS into an array which is then parsed
into a linked list.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 4d59c0dd78dbf..cb07184ce82f3 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
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

[Severity: Medium]
If the MAC explicitly requires a dedicated PCS for the requested interface
mode but the loop doesn't find a compatible one, pcs_found remains false.
Because the code then skips the pcs_found block and validates only the MAC
capabilities, it seems it could return 0 (success) instead of an error like
-EINVAL.

Does this unintentionally mark the interface as supported despite missing a
required hardware component?

[ ... ]

> @@ -1295,11 +1365,13 @@ static void phylink_major_config(struct phylink *=
pl, bool restart,
>  	if (pcs_changed) {
>  		phylink_pcs_disable(pl->pcs);
> =20
> -		if (pl->pcs)
> -			pl->pcs->phylink =3D NULL;
> +		if (pl->mac_ops->mac_select_pcs) {
> +			if (pl->pcs)
> +				pl->pcs->phylink =3D NULL;
> =20
> -		if (pcs)
> -			pcs->phylink =3D pl;
> +			if (pcs)
> +				pcs->phylink =3D pl;
> +		}
> =20
>  		pl->pcs =3D pcs;

[Severity: Low]
Is it possible for the compiler to optimize this assignment inappropriately?
Since phylink_pcs_change() reads this pointer locklessly from interrupt
context, should we use WRITE_ONCE() here to prevent a potential data race?

[ ... ]

> @@ -1865,6 +1976,16 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> +	/*
> +	 * Make sure either PCS internal validation or .mac_select_pcs
> +	 * is used. Return error if both are defined.
> +	 */
> +	if (config->num_possible_pcs && pl->mac_ops->mac_select_pcs) {

[Severity: Critical]
Does this dereference an uninitialized pointer? The local variable pl has n=
ot
been allocated yet. Should this use the function argument
mac_ops->mac_select_pcs instead of pl->mac_ops->mac_select_pcs?

> +		dev_err(config->dev,
> +			"phylink: error: either phylink_config .num_possible_pcs or .mac_sele=
ct_pcs must be used\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	pl =3D kzalloc_obj(*pl);
>  	if (!pl)
>  		return ERR_PTR(-ENOMEM);
> @@ -1872,10 +1993,28 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	mutex_init(&pl->phydev_mutex);
>  	mutex_init(&pl->state_mutex);
>  	INIT_WORK(&pl->resolve, phylink_resolve);
> +	INIT_LIST_HEAD(&pl->pcs_list);
> +
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret =3D phylink_fill_available_pcs(pl, config);
> +	if (ret < 0) {
> +		kfree(pl);
> +		return ERR_PTR(ret);
> +	}
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
> +
>  	pl->config =3D config;
>  	if (config->type =3D=3D PHYLINK_NETDEV) {
>  		pl->netdev =3D to_net_dev(config->dev);

[Severity: High]
If the configuration validation fails later in phylink_create() (for exampl=
e,
if config->type is invalid or phylink_parse_mode() fails), the error paths
call kfree(pl) and return.

Does this leave the previously populated PCS objects with dangling phylink
pointers and corrupted list nodes? If a MAC driver defers probe and retries,
could this result in list corruption or a use-after-free when accessing the
dangling pcs->phylink pointer?

[ ... ]

> @@ -2413,8 +2562,15 @@ void phylink_pcs_change(struct phylink_pcs *pcs, b=
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
> +	if (!pl || pl->pcs !=3D pcs)
> +		return;

[Severity: Low]
Since pl->pcs is updated in process context without WRITE_ONCE(), and we re=
ad
it locklessly here in interrupt context, should this use READ_ONCE(pl->pcs)=
 to
avoid a data race? Even if it's benign, the compiler might perform unexpect=
ed
optimizations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122950.2228=
1-1-ansuelsmth@gmail.com?part=3D2
