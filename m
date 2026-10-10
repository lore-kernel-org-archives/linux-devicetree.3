Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C3381EBE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658146; cv=none; b=Mj4EPAs/UBga54yJpcN0neTDI8fNCoTu05y021vkxHwtSzHNDbuOYIjjDht9EjYupCxNaXpv2W1LJm3Q++NGFtLqdUlkr1pm1JkzBno9Qpyp59nx6MpbqEZsOkhoH1q8KuL3xA/g7ooDjFb8kekN3HM1ZKhl8AtH6ZXNqS8SHws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658146; c=relaxed/simple;
	bh=ZKWMhEn34hC3biUNW4ez/b/bH+mupaGdBSRG3dRUSOw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LDmH8aHLpmWUX1b2S+BlBoyp9pexp93SwIBpwCvTKuqDzoTHkLBVT1yjc2iQTQ0bcQ9DykD3ffnb99T4jvGObiXqX5Jh1H5mjIYKurvkZ2eC3RGW7Myjij1KibNCBhJL4bNREIxL9u2sZka1x+YX5CHfVsjTnKSjRan67MC/Z7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PO3mVr9k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO3mVr9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BE51F00893;
	Sat, 10 Oct 2026 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791658145;
	bh=panFCpEtWYd0Pm2ZXLM7MBXPqaPp6/X+gUetjDaJ8rU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PO3mVr9ke9BwsCPhSKyoLQrQd4n/QFCJWtfutngBsFcR7tETSe54N9ixZNR0w/xxx
	 P4/3eqsjyzb+pz43EB+EAK5SkeO7XUMG9ERvzTxWZQ27rydw6vPltGZxI0GE79GPGN
	 vgKZX+s53MySfum4rqupu3hv5L+FM5VjGogBoT4ypqq7hdbfTwX6aCITTXORs5pBb1
	 yBtsXQzWQOa8IjKIzD+S7FFKqLkYwzuIjhzTMis40efSj2uS2Y9L/MHNqfd/gapMy9
	 pIDYescbYWD0rIoMz/1+UUuHYvzOV4l7VUkP/3REN2c2kjB1HMmstWRJVT+BXi5obG
	 ni8QrtPNRfLow==
Message-ID: <sashiko-outbox-166833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 05/12] net: phylink: support PCS provider
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009182836.50631-6-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
 <20261009182836.50631-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:49:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] phylink: self-deadlock in phylink_update_mac_pause_capabilitie=
s()
- [High] phylink: data race on link_config capabilities in pcs_provider_not=
ify()
- [Medium] phylink: pcs_provider_notify() silently destroys user-configured=
 ethtool settings
- [Medium] phylink: data race during phylink_create() due to early notifier=
 registration
--

commit 8c217ab877306546d11683a7a0d08e4946334358
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release

This patch adds support for releasing a fwnode PCS from a PCS provider.
It creates a global notifier for the PCS provider, allowing phylink
instances using fwnode to subscribe and dynamically handle PCS removal.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 9441afe372c33..019ce3d89da04 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -545,11 +547,15 @@ static int phylink_validate_mac_and_pcs(struct phyl=
ink *pl,
>  	unsigned long capabilities;
>  	int ret;
> =20
> +	mutex_lock(&pl->state_mutex);

[Severity: Critical]
Does this new lock acquisition cause a self-deadlock?

`phylink_update_mac_pause_capabilities()` explicitly acquires
`pl->state_mutex` and then calls `phylink_validate()`, which in turn calls
`phylink_validate_mac_and_pcs()`.

Because `struct mutex` is not recursive, attempting to acquire it again from
the same thread here results in a guaranteed self-deadlock.

This will hang the system for any network driver that dynamically updates M=
AC
pause capabilities at runtime.

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
> +
> +	mutex_unlock(&pl->state_mutex);
> +
> +	/* Recalculate capabilities */
> +	linkmode_fill(pl->supported);
> +	linkmode_fill(pl->link_config.advertising);

[Severity: High]
Does dropping `state_mutex` here introduce a data race?

While the mutex is dropped, `linkmode_fill()` is executed on
`pl->link_config.advertising`, temporarily flooding the link advertisement =
mask
with 1s to act as a generic starting point for validation.

The validation spans multiple nested lock/unlock cycles, leaving the struct=
ure
in an invalid state for a prolonged window.

Concurrently, the `phylink_resolve()` workqueue executes without `rtnl_lock=
()`.
It acquires the now-free `state_mutex` and reads `pl->link_config`.

`phylink_resolve()` will copy the torn or artificially fully-set advertisem=
ent
mask and propagate it to the hardware, potentially resulting in undefined
behavior or hardware crashes.

[Severity: Medium]
Will this unconditionally overwrite user-configured ethtool settings?

Users can restrict link modes (e.g., disabling Gigabit speeds) via ethtool,
which permanently modifies `pl->link_config.advertising`.

When a PCS provider is removed, executing `linkmode_fill()` before calling
`phylink_validate_mask()` resets the advertisement mask to the maximum
capabilities of the hardware.

This entirely wipes out any manual ethtool restrictions applied by the user
prior to the PCS removal.

[ ... ]

> @@ -2152,10 +2261,18 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
> =20
> +	/* First register notifier for hotplug PCS events */
> +	if (!phy_interface_empty(config->pcs_interfaces)) {
> +		pl->fwnode_pcs_nb.notifier_call =3D pcs_provider_notify;
> +		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +	}
> +
>  	/* Fill the PCS list with available PCS from phylink config */
>  	ret =3D phylink_fill_available_pcs(pl, config);
[ ... ]
> @@ -2170,13 +2287,15 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  				 pl->supported_interfaces,
>  				 pcs->supported_interfaces);
> =20
> +	mutex_unlock(&pl->state_mutex);
> +
>  	linkmode_fill(pl->supported);
>  	linkmode_copy(pl->link_config.advertising, pl->supported);

[Severity: Medium]
Is it safe to register the notifier before the capability bitmaps are
initialized?

By calling `register_fwnode_pcs_notifier()` early, the phylink instance bec=
omes
visible to asynchronous hotplug events before initialization finishes.

A concurrent `FWNODE_PCS_PROVIDER_DEL` event on another CPU could trigger
`pcs_provider_notify()`, which recalculates and mutates `pl->supported` and
`pl->link_config` under `rtnl_lock()`.

Meanwhile, `phylink_create()` continues executing `linkmode_fill()` and
`linkmode_copy()` on those same fields without holding `rtnl_lock()` or
`state_mutex`.

This unsynchronized data race on the capability bitmaps can corrupt the ini=
tial
link modes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009182836.5063=
1-1-ansuelsmth@gmail.com?part=3D5
