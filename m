Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE544370D6E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658147; cv=none; b=pFppPrxWf+rTeIjGjwSkDw0twqukfWt6+dSQLWhJbpPeZplDjJ5c2HF4e+SN6g7IFk8/teg7twcTI3wLdrU4+ufi7W8WCtOSAMhlyH302NU2KCuKaulTnBcWZcrEHuNZL9mPFFl0S+aoAyyST1XABVdl1sHXndP+siVpCBdPf4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658147; c=relaxed/simple;
	bh=NtDKGKt0v3zityxWnK84/KkWaWDLqu0yq5EM16KIOsY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fFf1oOPkHEGRvgCRUEBw/VenyTPKx+XS1QBzWkNKH2i36+95W++V7ztbrOQSmUS6pOAkF8sBABdEHjq5ck6wLig2XZeUGfUK494RWlPwbs7l2KTMNO+31zG/w2OrKT7vxFO2Adz3yiSF1D3wayQLAR8EuqoLC5qU+EMUJ0cyf94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh2JUAEt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh2JUAEt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422C31F00898;
	Sat, 10 Oct 2026 18:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791658146;
	bh=AcHL9P+TF9c/g64a5HJAMvUOgspnhq1cxYHv/I0w6gU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oh2JUAEtm/7VzRtHWCUm2xstCeKofqeEXGD278VsTljup5kVa4HYhqxv5zswqBBpj
	 jIqkilw9a6kytZAoZOUYKkqiRORXRdezyNh8GfT7r2kD4hVAvTmkodUvR6yPgyEF3F
	 Y4lXMzSUqBymRPolHq4KT2EdCfWg2gw8bXM+4gL02XuxgAt1epCCNL1/BI6jgY72iO
	 7wKD+B76MMYpCgblAUa42pU8kc8QciB/enx1zPzpEkyYeD+hiDgE/4oidM3Mk+HyOD
	 mV8tL+NjSunGl/0z8RfdjK5/kv8j++kygD3eA6eez6kU8D9Ddp8NtxiUYRIIsIqMjc
	 8M93W8BJFJrFA==
Message-ID: <sashiko-outbox-166836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009182836.50631-3-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
 <20261009182836.50631-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:49:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: phylink: UAF of phylink struct in phylink_pcs_change() during=
 concurrent teardown
- [Medium] net: phylink: missing validation failure when a required PCS is =
not found
--

commit 7ece69b824da0eb34269e858e3ce098347af5b79
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces internal handling of PCS for phylink by migrating the
selection logic to use a list of available PCS attached to the phylink
instance. It updates validation and configuration functions to search this
list if a dedicated PCS is required for the requested interface mode.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a98e62fa4bd26..1156e6c61a08b 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
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
If the MAC requires a dedicated PCS for the requested interface but no PCS =
in
pl->pcs_list supports it, pcs remains NULL. Since there is no check for !pcs
here, the function will bypass the if (pcs) validation block and incorrectly
return 0 (success).

Will this cause unsupported link modes to be falsely reported as supported
during phylink_validate()? It appears that later during
phylink_major_config(), the exact same lookup correctly checks for !pcs and
fatally aborts the link configuration. Should this return an error like
-EINVAL when a required PCS is not found?

[ ... ]
> @@ -2076,11 +2215,20 @@ EXPORT_SYMBOL_GPL(phylink_create);
>   */
>  void phylink_destroy(struct phylink *pl)
>  {
> +	struct phylink_pcs *pcs, *tmp;
> +
>  	sfp_bus_del_upstream(pl->sfp_bus);
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> =20
>  	cancel_work_sync(&pl->resolve);
> +
> +	/* Remove every PCS from phylink PCS list */
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +		pcs->phylink =3D NULL;
> +		list_del(&pcs->list);
> +	}
> +
>  	kfree(pl);
>  }
>  EXPORT_SYMBOL_GPL(phylink_destroy);

[Severity: High]
Does this teardown path properly synchronize with concurrent PCS events?

This path clears pcs->phylink and frees pl unconditionally, without an RCU
grace period or synchronization against concurrent execution. If
phylink_pcs_change() is called by an external PCS driver (e.g. from an
interrupt handler) and is delayed, a concurrent MAC driver unbind could
invoke phylink_destroy().

Because the teardown frees pl without waiting for pending PCS interrupts to
finish, this might leave readers in phylink_pcs_change() vulnerable to a
use-after-free.

[ ... ]
> @@ -2546,8 +2694,15 @@ void phylink_pcs_change(struct phylink_pcs *pcs, b=
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
>  EXPORT_SYMBOL_GPL(phylink_pcs_change);

[Severity: High]
Can pl be a dangling pointer when this READ_ONCE() is executed?

As noted above in phylink_destroy(), pl could be freed if teardown happens
concurrently after pl is read from pcs->phylink but before this READ_ONCE()
completes, resulting in a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009182836.5063=
1-1-ansuelsmth@gmail.com?part=3D2
