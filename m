Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0813E5ED0
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337856; cv=none; b=o6RxfiPTRXe10ox2vc8swgGbzqOBsX7qzPBNTcArjvmRnxBntVVU/L3UUQ92VPhQJvaCS93zNjFYhn09NNy1mgR5TYgyeMI0nxnM6yhiiOV633adFEZyoXWgUCByVrssK6WEwzgnEGxIwcRO5EIkkf4Uu7HxpaAq3VbR9NI4bwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337856; c=relaxed/simple;
	bh=7cOQlVlShiKf70mw02KPB7CBWJQ+Fbgh0APeEUzg7nk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TS43WwJrlsc6YBOVTzeg03y6xmv+1JtfLs0k0c8s+rZ6T7s4CvXYpJlRwKF5zkMbd6g+asM32Bo6Qo82oVjqE4D2jjZgRe+7CzpR9g/T9t3eQmfCWf/mTkcXbpme3FzRJ+zPXWiqki3xE6g84xbX/6D5iWytlbC8jSk3EZXAavI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYCxV/tY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYCxV/tY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B951F00A3D;
	Wed,  2 Sep 2026 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337855;
	bh=06EUayU5n7MXlPpNv6Ke/lCSaS27u4hUfEGRWHP1H/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYCxV/tYG0ygyQxuDHdNSz9bOT2W+1aK4mlMA0lryDhPJ5mjbXkMXylzqPSbJYwsu
	 7iQHQ+y+cezjYs2GJRHocKJ+qiVzcrSbYLPHMbDjXBdRCODj+b5fqk7LmNQM3hx5JY
	 UJZ9KpUee14zlStti2Tbmjhm+3rqGMui3l5h7f7URgAnyEQ3JsjbyzwgQuJXqYE7bF
	 5Rs7HCVrct08LCzUoSCLFA5htfGT69lxpqHJ8Ltpt9N6U4QMEu4S1C4V1Xnh1ypi4N
	 P7bgV8+rfj0vMVzv1LCtOG8snwF4494XW0c84MFwfRJzo24kmPVjGPoZJyvJcy8J/r
	 I//hzDXlBrROw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 05/12] net: phylink: support PCS provider
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901083001.8044-6-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
 <20260901083001.8044-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:30:54 +0000
Message-Id: <20260902083054.D9B951F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Lockless access to `pcs->phylink` in `phylink_pcs_change()` races =
with `phylink_destroy()`, leading to a use-after-free.
- [Medium] Concurrent lockless read of `pl->supported_interfaces` races wit=
h modification in `pcs_provider_notify()`, causing spurious validation fail=
ures.
--

commit 9d64e413cfd8c4a13418afd3ec905227f98db552
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release

This commit adds support for the release of fwnode PCS from a PCS provider.
It implements a global notifier that phylink instances subscribe to, allowi=
ng
them to dynamically remove released PCS interfaces and reconfigure the link.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 96f72eb5a6fad..e88c1effe880f 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{

[ ... ]

> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: Medium]
Does this non-atomic modification of pl->supported_interfaces risk racing
with lockless readers?

In pcs_provider_notify(), pl->supported_interfaces is overwritten and
rebuilt while holding only pl->state_mutex. However, concurrent callers
like phylink_validate() read pl->supported_interfaces holding only
rtnl_lock():

drivers/net/phy/phylink.c:phylink_validate() {
    ...
    const unsigned long *interfaces =3D pl->supported_interfaces;

    if (state->interface =3D=3D PHY_INTERFACE_MODE_NA)
        return phylink_validate_mask(pl, NULL, supported, state,
                                     interfaces);

    if (!test_bit(state->interface, interfaces))
        return -EINVAL;
    ...
}

If phylink_validate() runs between the phy_interface_copy() and the
completion of the phy_interface_or() loop, could it observe an incomplete
bitmap missing the PCS interfaces and spuriously reject a valid link mode
with -EINVAL?

[ ... ]

> @@ -2102,14 +2221,22 @@ void phylink_destroy(struct phylink *pl)
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> =20
> +	/* Unregister notifier for late PCS attach */
> +	if (pl->fwnode_pcs_nb.notifier_call)
> +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +
>  	cancel_work_sync(&pl->resolve);
> =20
> +	mutex_lock(&pl->state_mutex);
> +
>  	/* Remove every PCS from phylink PCS list */
>  	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
>  		pcs->phylink =3D NULL;
>  		list_del(&pcs->list);
>  	}
> =20
> +	mutex_unlock(&pl->state_mutex);
> +
>  	fwnode_handle_put(pl->fwnode);
> =20
>  	kfree(pl);

[Severity: High]
Could clearing pcs->phylink here and subsequently freeing pl race with
lockless readers?

The phylink_pcs_change() function is typically invoked asynchronously from
a PCS hardware interrupt and reads pcs->phylink locklessly:

drivers/net/phy/phylink.c:phylink_pcs_change() {
    ...
    struct phylink *pl =3D pcs->phylink;

    /*
     * Ignore PCS link state change if the PCS is not
     * attached to a phylink instance or the phylink
     * instance is not currently using this PCS.
     */
    if (!pl || READ_ONCE(pl->pcs) !=3D pcs)
        return;

    phylink_link_changed(pl, up, "pcs");
    ...
}

If a MAC driver is unbound concurrently, phylink_destroy() clears
pcs->phylink and frees pl without an RCU grace period or synchronization
with concurrent readers.

If phylink_pcs_change() is preempted after reading the pointer but before
dereferencing it (e.g., when evaluating READ_ONCE(pl->pcs)), could this
lead to a use-after-free regression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083001.8044=
-1-ansuelsmth@gmail.com?part=3D5
