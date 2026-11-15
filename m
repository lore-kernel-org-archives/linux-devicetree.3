Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739517;
	b=gUwsS3UCEFkbQu0py3noPZZVutrIS/0nFJn146xzDdxOSWnw4ogXMdF8lI7yPjMK6Opk
	 Dg/AHLJXDhPo2r31raSZ+VICkA1QbDyDJwhVUG3Ze9S3FJ+3wZJOJoEbcRRx9p5WKzHuL
	 SHiLvjvomj+qxqEdsZ5ZmTtjh4s4DHJtLzZO3zU1CH89acsngTPznr4YcCmKYOfvdEf3j
	 6ul8PTB4ebC7Urae0P7zRE0HW47EYMYwa31c8kyzFb7W/4K9fJA0VDdra9+qDXKYcMSOz
	 qUbyUDxbKffdoaU+57QSguop+jjVK1khHGqzVN25F+vRQ9X55ArUjoYsBirpu4j2tDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739517;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KCGLtb/ldHze3r5amzjqlVaV+enXxs/o7fMurmVkaLo=;
	b=eBD0Akg7XAq0IiHzVO9OYdY++Dijp04MwpGTsl02VsA0YlEKo9K7QNi5AbBT99hLXHnU
	 HhFtt9Tmzg47OIvewhFPJxpdxXGpPAzjA4wo0fHCAH0bzEsuFJ3KRGj9t87G5wEMqz1L2
	 VfNW1yYviW1sx9KdAftZqd2ANGyZ4WguchN42OqSmD1rNhTYQvVI3BrbIQz+4b1kjd7EA
	 3LGsn5j2cS6w+DuC402q0r1ABjaJzbVXOm7zL6ra1zvdK8PNQaXx77VhPJOiRZNWGCpq6
	 6uJAdFnEg65c5iCFbOBh1P/p4ViEYVVRLyN+PzRW5KGGYC4zcW94xWRZs1IesAHkbIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dksLkNeF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA70606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dksLkNeF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5865A1F000D1;
	Sun, 15 Nov 2026 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739517;
	bh=KCGLtb/ldHze3r5amzjqlVaV+enXxs/o7fMurmVkaLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dksLkNeFrYjO9qvnaThvd7xtFueDQvdc7VZv2u3lgFEhMFUUclFhyAyQwYMeMO26f
	 CmzPEhlFkRygG2Oopf0ACbL49Py4HBPumH9QEWN6eu5TgZjWuBjVhUqZeR0Uh1KDqQ
	 0oVum1Z1YjhalH0WDtwkaQNWwLtVIS6atrRZ47EQVib/E6h51u7QeaCtkaUaKntHy1
	 lhEe89EhCqxF9+9htrF2x5VTjXdE8TK/plV8QH3DPNHnzPgBexsrAVvi8RhHiS0Prk
	 nLmXUWJptz70PYZaPKS8mJVePPCWrB0irNtkjNjqYbYRBFQpnH+6fZyoVnkDeDPtaX
	 eYFVNZY2KdyGA==
Message-ID: <sashiko-outbox-215399@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 08/15] net: phylink: support PCS provider
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-9-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [Medium] net: phylink: unchecked validation in
  phylink_calculate_capabilities()
- [Medium] net: phylink: pcs_provider_notify() clobbers mode and media
  linkmodes
- [Medium] net: phylink: duplicate phylink_pcs_disable() in
  phylink_del_pcs()
- [Medium] net: phylink: force_major_config in phylink_del_pcs() runs
  when disabled
- [Medium] net: phylink: race in phylink_create() after registering
  fwnode_pcs_nb
- [Medium] net: phylink: missing !pcs check in
  phylink_validate_mac_and_pcs()
- [Medium] net: phylink: UAF of phylink_pcs in phylink_destroy() and
  phylink_create()
--

commit 9f425957f6e59d4881b3a8c251eeacc60b88a666
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release

This commit adds a blocking notifier chain for fwnode PCS provider
removal so phylink instances can detach removed PCS instances, refresh
supported interfaces and capabilities, and trigger link resolution.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 46b2aba336bd1..e807fcccb5de9 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -722,6 +725,8 @@ static void phylink_calculate_capabilities(struct phy=
link *pl)
>  {
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
> =20
> +	lockdep_assert_held(&pl->state_mutex);
> +
>  	/* Get user-disabled advertising modes */
>  	linkmode_xor(disabled_advertising, pl->advertising,
>  		     pl->link_config.advertising);
> @@ -729,7 +734,7 @@ static void phylink_calculate_capabilities(struct phy=
link *pl)
>  	/* Calculate the full supported advertisement */
>  	linkmode_fill(pl->supported);
>  	linkmode_copy(pl->link_config.advertising, pl->supported);
> -	phylink_validate(pl, pl->supported, &pl->link_config);
> +	__phylink_validate(pl, pl->supported, &pl->link_config);

[Severity: Medium]
Does phylink_calculate_capabilities() leave pl->supported and
pl->advertising filled with all ones when __phylink_validate() fails?

When pcs_provider_notify() removes the PCS that provided
pl->link_config.interface and rebuilds pl->supported_interfaces,
pl->link_config.interface still holds the removed interface mode.
__phylink_validate() then returns -EINVAL at the test_bit() check before
clearing or masking pl->supported or pl->link_config.advertising:

drivers/net/phy/phylink.c:__phylink_validate() {
	...
	if (!test_bit(state->interface, interfaces))
		return -EINVAL;
}

Because the return value is ignored after linkmode_fill(pl->supported),
every ethtool linkmode bit remains set in pl->supported, pl->advertising,
and (except for previously disabled bits) pl->link_config.advertising.

[ ... ]

> @@ -2066,11 +2084,91 @@ static int phylink_fill_available_pcs(struct phyl=
ink *pl,
>  	}
> =20
>  out:
> +	mutex_unlock(&pl->state_mutex);
> +
>  	kfree(pcss);
> =20
>  	return ret;
>  }
> =20
> +static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	rcu_assign_pointer(pcs->phylink, NULL);
> +	synchronize_rcu();
> +	list_del(&pcs->list);
> +
> +	/*
> +	 * Check if we are removing the PCS currently
> +	 * in use by this phylink instance. If this is the case,
> +	 * tear down the link, force phylink resolve to reconfigure the
> +	 * interface mode, disable the current PCS and set the
> +	 * phylink PCS to NULL.
> +	 */
> +	if (pl->pcs =3D=3D pcs) {
> +		if (pl->old_link_state) {
> +			phylink_link_down(pl);
> +			pl->old_link_state =3D false;
> +		}
> +		if (pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND)
> +			timer_delete_sync(&pl->link_poll);
> +		phylink_pcs_disable(pl->pcs);

[Severity: Medium]
Can phylink_del_pcs() call phylink_pcs_disable(pl->pcs) a second time
when the phylink instance is already stopped?

phylink_stop() sets pl->pcs_state to PCS_STATE_DOWN and calls
phylink_pcs_disable(pl->pcs) while leaving pl->pcs non-NULL.  If the PCS
provider is removed while stopped, phylink_del_pcs() calls
phylink_pcs_disable(pl->pcs) again without an intervening enable,
breaking PCS drivers that refcount enable and disable calls such as
mxl862xx_pcs_disable().  Should this check pl->pcs_state !=3D
PCS_STATE_DOWN before disabling the PCS?

> +
> +		pl->force_major_config =3D true;
> +		WRITE_ONCE(pl->pcs, NULL);
> +	}
> +}

[Severity: Medium]
Should pl->force_major_config be set when pl->phylink_disable_state is
non-zero?

In phylink_resolve(), pl->force_major_config bypasses the mac_config gate
that normally suppresses reconfiguration when pl->phylink_disable_state
is non-zero:

drivers/net/phy/phylink.c:phylink_resolve() {
	...
	if ((mac_config && link_state.interface !=3D pl->link_config.interface) ||
	    pl->force_major_config) {
		...
		phylink_major_config(pl, false, &link_state);
		pl->link_config.interface =3D link_state.interface;
		pl->force_major_config =3D false;
	}
}

If phylink_stop() runs phylink_run_resolve_and_disable() after
timer_delete_sync(&pl->link_poll) while pl->force_major_config is set,
phylink_major_config() reconfigures the stopping link and calls
phylink_pcs_poll_start(), which can re-arm pl->link_poll after it was
deleted.  If the interface was already stopped when the PCS was removed,
pl->force_major_config stays set until the next phylink_start(), causing
phylink_enable_and_run_resolve() to run a duplicate phylink_major_config()
right after phylink_mac_initial_config().

> +
> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl =3D container_of(self, struct phylink, fwnode_pcs_nb=
);
> +	struct fwnode_pcs_provider *pp =3D data;
> +	struct phylink_pcs *pcs, *tmp;
> +	bool resolve =3D false;
> +
> +	rtnl_lock();
> +	mutex_lock(&pl->state_mutex);
> +
> +	/*
> +	 * Loop all the PCS for phylink instance and check if
> +	 * this notification is relevant for some of them.
> +	 */
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> +			continue;
> +
> +		phylink_del_pcs(pl, pcs);
> +		resolve =3D true;
> +	}
> +
> +	/* Exit early if nothing has changed */
> +	if (!resolve) {
> +		mutex_unlock(&pl->state_mutex);
> +		rtnl_unlock();
> +		return NOTIFY_DONE;
> +	}
> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: Medium]
When a PCS is removed and pl->supported_interfaces is reset from
pl->config->supported_interfaces, can __phylink_validate() still treat an
interface in pl->config->pcs_interfaces as supported without a PCS?

Drivers populate pl->config->supported_interfaces with all MAC-supported
interfaces and mark those requiring a dedicated PCS in
pl->config->pcs_interfaces.  When no matching PCS remains in
pl->pcs_list, phylink_validate_mac_and_pcs() leaves pcs as NULL without
returning an error and validates against MAC capabilities alone:

drivers/net/phy/phylink.c:phylink_validate_mac_and_pcs() {
	...
	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
		struct phylink_pcs *tmp;

		list_for_each_entry(tmp, &pl->pcs_list, list) {
			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
				pcs =3D tmp;
				break;
			}
		}
	}

	if (pcs) {
	...
}

Should phylink_validate_mac_and_pcs() return -EINVAL when !pcs in the
pl->config->pcs_interfaces branch, matching phylink_major_config()?

> +
> +	/* Recalculate capabilities */
> +	phylink_calculate_capabilities(pl);

[Severity: Medium]
Does calling phylink_calculate_capabilities() from pcs_provider_notify()
clobber mode- and media-specific masks in pl->supported and
pl->link_config.advertising?

After phylink_create() runs phylink_calculate_capabilities(),
phylink_parse_mode() (for MLO_AN_INBAND), phylink_parse_fixedlink(),
phylink_bringup_phy(), or SFP insertion restrict pl->supported and
pl->link_config.advertising without updating pl->advertising.  When
pcs_provider_notify() later calls phylink_calculate_capabilities(),
linkmode_xor(disabled_advertising, pl->advertising,
pl->link_config.advertising) treats those mode, PHY, or SFP restrictions
as user-disabled bits, and linkmode_fill(pl->supported) followed by
__phylink_validate() overwrites pl->supported and pl->advertising with
unconstrained MAC/PCS capabilities.

[ ... ]

> @@ -2281,10 +2379,18 @@ struct phylink *phylink_create(struct phylink_con=
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
>  	if (ret < 0)
> -		goto free_pl;
> +		goto unregister_pcs_notify;
> +
> +	mutex_lock(&pl->state_mutex);
> =20
>  	/* Link available PCS to phylink */
>  	list_for_each_entry(pcs, &pl->pcs_list, list)
> @@ -2301,9 +2407,11 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,
> =20
>  	phylink_calculate_capabilities(pl);
> =20
> +	mutex_unlock(&pl->state_mutex);
> +
>  	ret =3D phylink_parse_mode(pl, fwnode);
>  	if (ret < 0)
> -		goto unlink_pcs_list;
> +		goto unregister_pcs_notify;

[Severity: Medium]
Can pcs_provider_notify() race with phylink_create() because
pl->fwnode_pcs_nb is registered before initialization finishes and
pl->state_mutex is dropped between steps?

phylink_create() is called without rtnl_lock() held, so only
pl->state_mutex serializes it against pcs_provider_notify():

CPU0                                  CPU1
phylink_create()
  register_fwnode_pcs_notifier()
  phylink_fill_available_pcs()
    mutex_lock(&pl->state_mutex)
    list_add_tail(&pcs->list, ...)
    mutex_unlock(&pl->state_mutex)
  ...
  mutex_lock(&pl->state_mutex)
  phylink_calculate_capabilities()
  mutex_unlock(&pl->state_mutex)
                                      fwnode_pcs_del_provider()
                                        pcs_provider_notify()
                                          mutex_lock(&pl->state_mutex)
                                          phylink_calculate_capabilities()
  phylink_parse_mode()
    linkmode_zero(pl->supported)  <-- data race on pl->supported /
                                      pl->link_config.advertising

pcs_provider_notify() can also run between phylink_fill_available_pcs()
unlocking pl->state_mutex and phylink_create() re-locking it before
pcs->phylink and pl->supported_interfaces are initialized.

[ ... ]

> @@ -2322,14 +2430,18 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  release_link_gpio:
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> -unlink_pcs_list:
> +unregister_pcs_notify:
> +	if (pl->fwnode_pcs_nb.notifier_call)
> +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
>  	list_for_each_entry(pcs, &pl->pcs_list, list)
>  		rcu_assign_pointer(pcs->phylink, NULL);
> -
>  	synchronize_rcu();
> -
> +	/* PCS notifier might queue a resolve, cancel it */
> +	cancel_work_sync(&pl->resolve);
> +	mutex_lock(&pl->state_mutex);
>  	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
>  		list_del(&pcs->list);
> +	mutex_unlock(&pl->state_mutex);
>  free_pl:
>  	fwnode_handle_put(pl->fwnode);
>  	kfree(pl);
> @@ -2355,6 +2467,10 @@ void phylink_destroy(struct phylink *pl)
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> =20
> +	/* Unregister notifier for late PCS attach */
> +	if (pl->fwnode_pcs_nb.notifier_call)
> +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +
>  	/* Remove phylink instance from every PCS */
>  	list_for_each_entry(pcs, &pl->pcs_list, list)
>  		rcu_assign_pointer(pcs->phylink, NULL);
> @@ -2367,10 +2483,14 @@ void phylink_destroy(struct phylink *pl)
> =20
>  	cancel_work_sync(&pl->resolve);
> =20
> +	mutex_lock(&pl->state_mutex);
> +
>  	/* Remove every PCS from phylink PCS list */
>  	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
>  		list_del(&pcs->list);
> =20
> +	mutex_unlock(&pl->state_mutex);

[Severity: Medium]
Can unregistering pl->fwnode_pcs_nb before detaching pl->pcs_list in
phylink_destroy() and the phylink_create() error path cause a
use-after-free on struct phylink_pcs?

fwnode_pcs_del_provider() relies on fwnode_pcs_notify_list to detach all
phylink consumers before returning to the PCS provider driver, which then
frees its struct phylink_pcs:

CPU0                                  CPU1
phylink_destroy()
  unregister_fwnode_pcs_notifier()
                                      pcs_driver_remove()
                                        fwnode_pcs_del_provider()
                                          blocking_notifier_call_chain()
                                            /* pl already unregistered */
                                        kfree(pcs)
  list_for_each_entry(pcs, ...)
    rcu_assign_pointer(pcs->phylink, NULL)  <-- use-after-free
  synchronize_rcu()
  ...
  list_del(&pcs->list)                      <-- use-after-free

Unregistering the notifier after removing all PCS entries from
pl->pcs_list and clearing pl->pcs would prevent fwnode_pcs_del_provider()
from returning while phylink still holds pointers to those PCS instances.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D8
