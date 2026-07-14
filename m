Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE9D37DE98
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027675; cv=none; b=AB9nCVp6oOR54j0vGYX7NBJGKp5D/BAziC/kUwEhIPf5IlvnAbfXdb9kmBOkjj+gvRFUitjPMTHtia8nWxVhn8X/oIMSOY7ZVH+QTBMQ1YKt6L4QPmxUK+WiX9cQvIs9WV6mzqXoWVBSVix+bxyMNqTti24p353bgFvCMGmLS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027675; c=relaxed/simple;
	bh=pfCTKdcvKaSg9oN2jVa8B2BBErG0YXuTqSEcIa26Mj0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uyc3yAdWrbkTxvgYY9dDwPmIcy4Pv3g1Yh0mzoLqy521ZehmYjjVHbDqiU2TL6Be9/cZc/vd9g1zPoZhJO8TpGqEBuGKmmFEohO58IoRuD05mZrZyu/gxwS92LMxxMsHUbB4XhKmCo9KQfzHz+DvfEd7S8ZJ5lmtpnuoqZg9vSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CO2uXR0q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CO2uXR0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33891F000E9;
	Tue, 14 Jul 2026 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784027674;
	bh=nBMBZk/qqZXEz8kQDgWMRRZhqCt2GlX/dZfpUwL++CA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CO2uXR0qmy3m2ys/euVa9r/aYAUqVQy6req3SGNhpPWZWCbyXctqCiw6G3VLzRSRN
	 TLZmvJ5Gnhv5AssQmIrTZ/2b2sNiQIkzGh1vnJn7dIIHyBK5afyX2DX9fqSgmH5Pks
	 3wh336pdUPc/H9guUTwXzVnT/wrCD9verHl+xGCWlRCqTK2cAU45LCXa/PaOTBR+uW
	 qTy/UzsjnjeaBZ2xkG+EUcosdQt2rjdDNR2m43Tf5z0hTSjOGrm6zz7AJ38TYTtUgD
	 KznepsQ71/XdqDDow8Py3we5iF9cS8muhkCYks9p2e22J7T9xk48JvJIOgRRTSsiWc
	 SkdM2xhVwVNDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714092053.2461482-7-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 11:14:32 +0000
Message-Id: <20260714111433.C33891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Temporary hub address swapping in `i3c_hub_master_priv_xfers` perm=
anently frees downstream address slots.
- [High] Detaching the downstream device in IBI request/free paths uncondit=
ionally frees its parent bus address slots.
- [High] Forwarding DAA directly to the parent controller attaches downstre=
am devices to the wrong bus topology.
- [High] The no-op `recycle_ibi_slot` callback permanently leaks hardware I=
BI slots allocated by the parent controller.
- [High] `i3c_hub_request_ibi()` fails with `-EBUSY` due to conflicting add=
ress reservations or corrupts parent DAT.
- [High] Recursive lock acquisition of `hub->lock` causes deadlocks with IB=
I workqueue handlers.
- [High] Modifying the device descriptor's master pointer under a shared re=
ad-lock causes data races, misrouting private transfers.
- [High] Forwarding direct CCC commands unmodified through the hub causes a=
 NULL pointer dereference in the parent driver.
--

--- Patch [6]: [PATCH v14 6/8] i3c: hub: Add support for the I3C interface =
in the I3C hub ---
commit 02e794653daf2b554f0c962c355d0bb7abb26374
Author: Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: i3c: hub: Add support for the I3C interface in the I3C hub

This commit adds virtual I3C bus support for the hub, creating virtual
master controllers for downstream ports and forwarding operations through
the parent controller.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> index 0000000000000..6105bb710be69
> --- /dev/null
> +++ b/drivers/i3c/hub.c
[ ... ]
> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
[ ... ]
> +	/*
> +	 * Downstream devices reachable through hub target-port routes share the
> +	 * parent controller's I3C address space. The hub gates access to a
> +	 * target-port network, but it does not create an independent dynamic
> +	 * address domain per virtual bus.
> +	 *
> +	 * Run DAA on the parent controller so dynamic addresses remain unique
> +	 * across all downstream devices, even when they are behind different
> +	 * target ports.
> +	 */
> +	ret =3D i3c_master_do_daa(parent);

[Severity: High]
Does forwarding DAA directly to the parent controller attach dynamically
discovered downstream devices directly to the parent bus instead of the
virtual hub controller?

If these devices are bound to the physical parent, subsequent transfers=20
might bypass i3c_hub_master_priv_xfers() entirely, leaving the hub port=20
closed and causing communication to fail.

[ ... ]
> +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> +				struct i3c_master_controller *controller,
> +				struct i3c_ccc_cmd *cmd)
> +{
[ ... ]
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +	ret =3D i3c_master_send_ccc_cmd(parent, cmd);

[Severity: High]
When forwarding direct CCC commands to the parent controller, the command=20
structure still contains virtual bus descriptors in its dests array.=20

Since virtual devices do not allocate a physical master_priv context, can=20
the physical parent controller driver dereference a NULL pointer here when=
=20
it assumes these devices are natively attached?

> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
[ ... ]
> +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_xfer *xfers,
> +				     int nxfers,
> +				     enum i3c_xfer_mode mode)
> +{
[ ... ]
> +	if (hub_addr !=3D target_addr) {
> +		hub_dev->info.dyn_addr =3D target_addr;
> +
> +		ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);

[Severity: High]
When the hub address is temporarily swapped here, does=20
i3c_master_reattach_i3c_dev_locked() unconditionally mark the original=20
address (old_dyn_addr) as free?

This appears to permanently free downstream address slots and could lead=20
to address collisions on the parent bus.

> +		if (ret) {
> +			hub_dev->info.dyn_addr =3D hub_addr;
> +			goto out_unlock_parent;
> +		}
> +	}
[ ... ]
> +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> +			       const struct i3c_ibi_setup *req)
> +{
[ ... ]
> +	i3c_bus_maintenance_lock(&parent->bus);
> +
> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);

[Severity: High]
Is it safe to modify desc->master here while only holding a read lock=20
on the bus?

A concurrent private transfer might read desc->master and resolve it to=20
the physical parent controller, misrouting the transfer and bypassing=20
hub routing entirely.

> +
> +	/*
> +	 * Downstream devices are exposed through the virtual hub controller.
> +	 * Private transfers only use the hub device temporarily with the
> +	 * downstream device's dynamic address; they do not attach the downstre=
am
> +	 * device to the parent controller.
> +	 *
> +	 * Attach the device to the parent controller before requesting IBI so
> +	 * the parent can allocate any controller-private IBI state.
> +	 */
> +	ret =3D i3c_master_direct_attach_i3c_dev_locked(parent, desc);

[Severity: High]
Could attaching the downstream device directly to the parent controller=20
fail with -EBUSY if the address was already reserved?=20

Additionally, if it succeeds, might this leave duplicate DAT entries in=20
the parent hardware when the hub later masquerades as this target address?

> +	if (ret) {
> +		i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +		i3c_bus_maintenance_unlock(&parent->bus);
> +		return ret;
> +	}
> +
> +	if (desc->ibi) {
> +		if (desc->ibi->wq) {
> +			destroy_workqueue(desc->ibi->wq);
> +			desc->ibi->wq =3D NULL;
> +		}
> +
> +		kfree(desc->ibi);
> +		desc->ibi =3D NULL;
> +	}
> +	ret =3D i3c_dev_request_ibi_locked(desc, req);
> +	if (ret)
> +		i3c_master_direct_detach_i3c_dev_locked(desc);

[Severity: High]
Does detaching the downstream device here unconditionally free its static=20
and dynamic addresses on the parent bus?=20

The device is still physically present and using those addresses, so freein=
g=20
them could lead to address collisions.

> +
> +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +
> +	i3c_bus_maintenance_unlock(&parent->bus);
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
> +{
[ ... ]
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +
> +	i3c_bus_maintenance_lock(&parent->bus);
> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> +	i3c_dev_free_ibi_locked(desc);

[Severity: High]
Can holding hub->lock here cause a deadlock if there are pending IBI work=20
handlers?=20

Calling i3c_dev_free_ibi_locked() blocks while destroying the workqueue.=20
If an active IBI handler attempts to read the IBI payload, it will invoke=20
i3c_hub_master_priv_xfers(), which attempts to acquire this exact same lock.

> +
> +	/*
> +	 * Drop the temporary parent attachment created for IBI setup.
> +	 * The downstream device remains exposed through the virtual hub
> +	 * controller.
> +	 */
> +	i3c_master_direct_detach_i3c_dev_locked(desc);

[Severity: High]
Does detaching the device on this path also incorrectly free the=20
downstream device's addresses on the parent bus?

> +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +	i3c_bus_maintenance_unlock(&parent->bus);
> +
> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +}
[ ... ]
> +static int i3c_hub_disable_ibi(struct i3c_dev_desc *desc)
> +{
[ ... ]
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +
> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> +
> +	i3c_bus_maintenance_lock(&parent->bus);
> +	ret =3D i3c_dev_disable_ibi_locked(desc);

[Severity: High]
Could holding hub->lock while calling i3c_dev_disable_ibi_locked() also=20
lead to the same ABBA deadlock with pending IBI workers trying to acquire=20
hub->lock via i3c_hub_master_priv_xfers()?

> +	i3c_bus_maintenance_unlock(&parent->bus);
> +
> +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +
> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
> +				     struct i3c_ibi_slot *slot)
> +{
> +	/*
> +	 * TODO: Forward IBI slot recycling to the parent controller when
> +	 * downstream-device IBI support is fully enabled. Current users only
> +	 * rely on the hub device IBI path for SMBus-agent events, so no parent
> +	 * hardware slot is recycled through this virtual callback currently.
> +	 */
> +}

[Severity: High]
Does this empty implementation permanently leak hardware IBI slots=20
allocated by the parent controller?=20

Over time, failing to return these slots could exhaust the pool and prevent=
=20
further IBI reception.

> +
> +static const struct i3c_master_controller_ops i3c_hub_master_ops_data =
=3D {
> +	.bus_init =3D i3c_hub_master_bus_init,
[ ... ]
> diff --git a/include/linux/i3c/hub.h b/include/linux/i3c/hub.h
> index 0000000000000..8ad2cf3c9d5b8
> --- /dev/null
> +++ b/include/linux/i3c/hub.h
> @@ -0,0 +1,102 @@
[ ... ]
> +static inline struct i3c_master_controller *
> +i3c_hub_update_desc_parent(struct i3c_i2c_dev_desc *desc,
> +			   struct i3c_master_controller *parent)
> +{
> +	struct i3c_master_controller *orig_parent =3D desc->master;
> +
> +	desc->master =3D parent;

[Severity: High]
Does modifying desc->master here create a data race with concurrent=20
transfers using the I3C core transfer functions?

> +	return orig_parent;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714092053.2461=
482-1-lakshay.piplani@nxp.com?part=3D6
