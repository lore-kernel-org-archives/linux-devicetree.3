Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F41DD0EF
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365275; cv=none; b=U8osG0r8LeCt49CXX+HhTVFpQXfSWAsgxSKAVBPvHFKujX05mgC/Mov/kh+mC04oeb2JSakK5aFXoC8HqMf2/inEy3RFuxYJhj1jvWmTlIoC7JcNlZs4AQnZsTXx+Kvaz5YQBt/Af4b4iJKqWRWiG9SbdycHZ2gafXH7iUEV2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365275; c=relaxed/simple;
	bh=rMBptVlMqvlXGwz4iLjFkvz1xuVGPZHE32iZRcnNW0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M9o4O2xxQI8NemFBR9UKHRDvKuQEucRXbMq9L5dFEXfXSfQfPwSxYM6mw12jEQQd/+ccxHPF/ZGyS66b/YQhUiW2o9xxnIMm/kTgqHQ6E6TQR7fwEXBT+O1cy0iN2+4+4AP39iTpc1w5s9NW94wdyG645PXk3V0E742XQYk8eBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao8KBOlm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao8KBOlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B275D1F000E9;
	Sat, 18 Jul 2026 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365273;
	bh=fayga3POyiV8RI9Mhs4NR268tM/FAqP/w0xKfG2g1ZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ao8KBOlmYVqjFkL9YSW8l4Yd2YFJZF0Oz9CsCqokZ6t7S4YTbqx568oNCGVIQspiJ
	 i8iqZAh/pYvzFy/m5Tt/ttPc93Fn71/kkIfeR24s62NvOjhQfRsv96gjaytukVNQMI
	 TleR1MLiZbk1FnvUmsoDQNU8ZURq5jV7JCdgdu8rxLSNIaGOnBD2fyM/CBrBQNc25z
	 xX/3WVwDArig2a6eNzjgDicAdTJIPChoa2mD3+deSy7XeOBtLd6g+0xygQHvZ32+If
	 FtTxAEOmWZaSKr/2QA41XkIzZLF9Tw4n5K0dQ7Tmt3A+Ae7oHXPOML/NNaz2gQm4hZ
	 fpSokCJqJT6jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 05/12] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717065448.1498335-6-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:13 +0000
Message-Id: <20260718090113.B275D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Missing PCS removal notification leads to Use-After-Free when =
a PCS module is unloaded.
- [High] A TOCTOU race condition in `phylink_create()` can cause a newly ad=
ded PCS provider to be permanently missed.
- [High] Unconditional `list_add()` in `pcs_provider_notify()` causes doubl=
y-linked list corruption during concurrent additions.
- [High] Late PCS attachment fails for multi-port devices (e.g., DSA switch=
es) due to incorrect fwnode lookup.
- [Medium] Synchronous acquisition of `rtnl_lock()` in the blocking notifie=
r chain introduces a fragile self-deadlock risk.
--

--- Patch [5]: [PATCH net-next v9 05/12] net: phylink: support late PCS pro=
vider attach ---
commit 0738f7b893f648f2683558ff4efb6327359c5920
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

Add support for late PCS provider attachment to a phylink instance.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

[ ... ]

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 986e0c1e3d678..1d83b31874fb2 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1999,6 +2001,53 @@ static int phylink_fill_available_pcs(struct phyli=
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
> +	rtnl_lock();

[Severity: Medium]
Does unconditional acquisition of rtnl_lock() here risk a deadlock?

If a network driver registers a PCS provider from a context that already
holds rtnl_lock() (which is common in network driver probe or open paths),
wouldn't the synchronous notifier callback attempt to recursively acquire
the lock and hang the system?

> +
> +	/* Check if the just added PCS provider is
> +	 * in the phylink instance pcs-handle property.
> +	 */
> +	pcs =3D fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
> +						 pcs_fwnode);

[Severity: High]
Will this lookup fail for multi-port devices like DSA switches?

It seems to fetch the fwnode from the parent device (pl->config->dev) rather
than the port-specific fwnode passed during phylink creation. If the
pcs-handle property is in the port's subnode, will this return an error and
silently abort the late attachment?

> +	if (IS_ERR(pcs)) {
> +		rtnl_unlock();
> +		return NOTIFY_DONE;
> +	}
> +
> +	/* Add the PCS */
> +	mutex_lock(&pl->state_mutex);
> +
> +	/* Link PCS with phylink */
> +	list_add(&pcs->list, &pl->pcs_list);

[Severity: High]
Could this corrupt the doubly-linked list if the PCS is already present?

If a PCS provider is added concurrently, it might already be picked up by
phylink_fill_available_pcs() and then passed to this notifier. Calling
list_add() unconditionally on a node already in the list overwrites its
pointers and causes list corruption.

> +	pcs->phylink =3D pl;
> +

[ ... ]

> @@ -2116,6 +2165,12 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,
>  	if (ret < 0)
>  		goto unlink_pcs_list;
> =20
> +	/* Register notifier for late PCS attach */
> +	if (!phy_interface_empty(config->pcs_interfaces)) {
> +		pl->fwnode_pcs_nb.notifier_call =3D pcs_provider_notify;
> +		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +	}

[Severity: High]
Is there a race condition between fetching available PCS providers and
registering this notifier?

In phylink_create(), the list of available PCS providers is fetched earlier
via phylink_fill_available_pcs(). If a PCS provider calls
fwnode_pcs_add_provider() exactly after the list is fetched but before
register_fwnode_pcs_notifier() is called here, wouldn't the provider be
permanently missed since it wasn't in the global list initially and the
notification was missed?

>  	return pl;
> =20
>  unlink_pcs_list:

[ ... ]

> diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
> index b7cfdd680b2ab..45e8f96662db2 100644
> --- a/include/linux/pcs/pcs.h
> +++ b/include/linux/pcs/pcs.h
> @@ -4,7 +4,36 @@
> =20
>  #include <linux/phylink.h>
> =20
> +enum fwnode_pcs_notify_event {
> +	FWNODE_PCS_PROVIDER_ADD,
> +};

[Severity: Critical]
Does the lack of a removal notification event create a use-after-free risk?

If a PCS provider module is unloaded, fwnode_pcs_del_provider() is called to
free internal state, but phylink is never notified because there is no
FWNODE_PCS_PROVIDER_DEL event.

Won't the freed pointer remain linked in pl->pcs_list and be dereferenced
during the next phylink_resolve() run triggered by a timer or link state
change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D5
