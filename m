Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9644052BA
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194835; cv=none; b=NtRnE0mezUWQXiG3Wq1EhwucmbOHxva2SMhrAkNo/gBX2pbJ2YpSvYKZHPzrmjtHaRFckjVV+u2qAE6OZQuzXbI1+kB5oGcHS7RBtgUGyrqOTyIjvq4mwSvua5XEMs5SOZ/Y3YCe6+cK3gOEDDcP1LJV8DnYVQR/HOsi3HfisIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194835; c=relaxed/simple;
	bh=wEOBAiYbI2mNaPW5jB5iv9aZ4fb9QnWVY52heDMs8wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YYJu/cBxTq81IzaOtQmNegvddbTwriTmk/2eo5sY0/kezrK9z5P/hrV/cOTQqnLTg3DZfSgQ8oFXvY+MtQKwR/ma4y6BC2MOQ5mwIX24Vml9SwRJ/H3DCnfCW06OukF6XPXJAjPEpgUo2egKDFgnoNpbi72TheBHZMUADBIoODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoUCm3pw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoUCm3pw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1351F00A3D;
	Sat,  8 Aug 2026 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194833;
	bh=r41BWia5TAWqPgjrzEAGpvD4SVapMVGPSQGXKnWbiRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AoUCm3pwOQ1E7KdZ5iBOlMdRgIG0U49IoBPhbyeP2tteRs59gtgcqwmp71+vw3nn8
	 d1RqGhYmjRSvHKNEuu0+HVfj5yR5ffSlt5fgVjjDFPmGe+0IZzP9LynILFlxwNorEl
	 1LWMS3vZGMpvPs7mvi46Ira/yc+Bwb4EWXMssY81QBntbRNsHK/PJv4OVc5B5MX+Kh
	 RLh9RhSvJGjQMeb73h4t7JONe/26xhlRnIlPbgf7uUkAY2xdIb+EhlX4BcOge4Nv8j
	 36mMAEttiN8gLS7R9oJb+do81I4wMKW8VOYiN8jzUKricNXF1RlTbZsc26koCyGHMM
	 6Y/8riWbgm12A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 05/12] net: phylink: support PCS provider
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807131301.192060-6-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:53 +0000
Message-Id: <20260808131353.6E1351F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] A self-deadlock (AA deadlock) occurs on `fwnode_pcs_mutex` when a =
PCS provider is deleted.
- [High] Unconditional `list_del()` in `phylink_del_pcs()` leads to a NULL =
pointer dereference or list corruption if the PCS was never added to the ph=
ylink's PCS list.
- [High] Lockless iterations of `pl->pcs_list` race with concurrent dynamic=
 deletion via `phylink_del_pcs()`, causing `LIST_POISON` dereferences.
- [High] Lockless access to `pl->pcs` in ethtool callbacks races with runti=
me PCS deletion, leading to Use-After-Free.
--

--- Patch [5]: [PATCH net-next v11 05/12] net: phylink: support PCS provide=
r release ---
commit a1d43d116ac4a79cbb3a27b395cf89f68d773799
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release
   =20
Add support for release of fwnode PCS from a PCS provider.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> --- a/drivers/net/pcs/pcs.c
> +++ b/drivers/net/pcs/pcs.c

[ ... ]

> @@ -67,6 +80,11 @@ void fwnode_pcs_del_provider(struct fwnode_pcs_provide=
r *pp)
> =20
>  	mutex_lock(&fwnode_pcs_mutex);
> =20
> +	/* Signal phylink to release any PCS from this provider */
> +	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
> +				     FWNODE_PCS_PROVIDER_DEL,
> +				     pp->fwnode);
> +

[Severity: High]
Does this sequence cause a self-deadlock? fwnode_pcs_del_provider()
acquires the global fwnode_pcs_mutex and then broadcasts the
FWNODE_PCS_PROVIDER_DEL event via blocking_notifier_call_chain().

This synchronously invokes the phylink callback pcs_provider_notify(),
which calls fwnode_phylink_pcs_get_from_fwnode(). That delegates to
fwnode_pcs_get() -> __fwnode_pcs_get() -> fwnode_pcs_get_from_pcsspec().

Inside fwnode_pcs_get_from_pcsspec(), the code attempts to re-acquire
the exact same fwnode_pcs_mutex. Since it is a non-recursive mutex already
held by this thread, could this hang the system?

>  	list_del(&pp->link);
>  	fwnode_dev_initialized(pp->fwnode, false);
>  	fwnode_handle_put(pp->fwnode);

[ ... ]

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> +static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	list_del(&pcs->list);

[Severity: High]
Can this lead to a NULL pointer dereference or list corruption?

In phylink_create(), the PCS notifier is registered before the initial
PCS list is populated. If a FWNODE_PCS_PROVIDER_DEL event fires concurrently
during this window, pcs_provider_notify() will look up the relevant PCS
and unconditionally call phylink_del_pcs().

Because the PCS has not yet been linked into pl->pcs_list, its list_head
would be uninitialized or zero-initialized. Executing list_del(&pcs->list)
on an unlinked node dereferences NULL pointers.

> +	pcs->phylink =3D NULL;
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
> +
> +		pl->force_major_config =3D true;
> +		WRITE_ONCE(pl->pcs, NULL);

[Severity: High]
Does clearing pl->pcs here race with ethtool callbacks, leading to a
use-after-free?

Functions triggered by ethtool, such as phylink_ethtool_nway_reset(),
operate with only the RTNL lock held and do not acquire pl->state_mutex.
They call phylink_pcs_an_restart(), which reads pl->pcs and
dereferences its operations pointer locklessly:

if (pl->pcs && ... )
    pl->pcs->ops->pcs_an_restart(pl->pcs);

Concurrently, this teardown path takes pl->state_mutex (but not RTNL),
detaches the PCS, and returns. The underlying memory can then be freed
by the provider driver. Could the ethtool path read a valid pl->pcs
pointer just before detachment, and dereference it after it is freed?

> +	}
> +}
> +
> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl =3D container_of(self, struct phylink, fwnode_pcs_nb=
);
> +	const struct fwnode_handle *pl_fwnode =3D pl->fwnode;
> +	struct fwnode_handle *pcs_fwnode =3D data;
> +	struct phylink_pcs *pcs;
> +
> +	/* Check if the PCS provider is relevant for this phylink instance */
> +	pcs =3D fwnode_phylink_pcs_get_from_fwnode(pl_fwnode, pcs_fwnode);
> +	if (IS_ERR(pcs))
> +		return NOTIFY_DONE;
> +
> +	mutex_lock(&pl->state_mutex);
> +
> +	phylink_del_pcs(pl, pcs);

[Severity: High]
Does dynamically modifying the list here race with existing lockless
iterations of pl->pcs_list?

Before this patch, pl->pcs_list was populated in phylink_create() and
treated as read-only. Existing readers like phylink_validate_mac_and_pcs()
and phylink_inband_caps() iterate over pl->pcs_list locklessly while
holding only the RTNL lock.

If a PCS provider is removed concurrently under pl->state_mutex, could
these RTNL-only readers follow poisoned list pointers resulting from
list_del(), crashing the kernel?

Additionally, the error path in phylink_create() iterates and unlinks
the list locklessly before unregistering the global notifier:

unlink_pcs_list:
    list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
        list_del(&pcs->list);
        ...
    }

Could this error path race with the notifier callback?

> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D5
