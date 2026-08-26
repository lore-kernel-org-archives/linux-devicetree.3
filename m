Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212273E5EFD
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742256; cv=none; b=HaRj+1Mf/4g5vqA1kWDERYIDX+2kFXZIFk2FZTxw/hcUC18RACTgNJDlIO39Vi9rpSuUMQD5sphuPhbxI8sprjfC9dseEtnTZKoIky4I6oRkIphdfmsIVmL+w2AVTzl+ACpmquBKXZ/SpSAoCAnUi8ZFjEF2meWUSj885lFKy5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742256; c=relaxed/simple;
	bh=II//pgk7K5GccKj3wbSHRaa+A+8ns91UAgdqDPxa1+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uoia5zwdw1FkuFySamU31vo9WptFotIDejAnw7aEW50eO23EM+wuJDkBfsK3Ks2PmbiopVHgTi9e7sC0YKBqJvBSrpNDU6AMvEnzb3rBNIMO2jxCxt7qUML799hpmSffuTnJ6MZmtt4Sbp7aDvsoiluqaGFN1EV9BXWFCT/SOgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtDzHPew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtDzHPew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF461F000E9;
	Wed, 26 Aug 2026 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787742247;
	bh=/silV9NurI0YAP0vORMsQqp5NaleRhZHq0G5SYodBr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XtDzHPewJM68gOvDGKWheJkWPvXOwoaPxrqyFDk8UPbDMNlMAeVRgpmuVMIqgKsTQ
	 1UOerYx3BDjSvabZjXYj9lwfV/PUg5vVBZ7vuYwSTACdazuJjOPQ1KdK/xDpfL/tem
	 E0KFxtD6vlMoJciECmRiHw9ErmFlBaZT60uCa8irtTcawXPq2O3s1SBZQtiRPScttq
	 ggURtXvX/VYWgy0nK41qJdLIQcd2+tLzPaTaQRitR+3nOxca3F7BcSURGEEAkIXqrN
	 6fcckowtbWW7LwtSOIpJdezvowjGUcmljf9FAQKFCPscSE9MM4Y43H1uKPf2vCIjH0
	 Jzs3S1QjXpsrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260826103819.1614843-7-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:04:07 +0000
Message-Id: <20260826110407.8FF461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Freeing `i3c_hub_dev_data` while it may still be referenced by=
 the parent controller's asynchronous IBI path leads to a Use-After-Free.
- [High] Dynamic downstream devices discovered via DAA are erroneously regi=
stered to the parent controller's bus, making them completely unreachable f=
or subsequent transfers on port-switching hubs.
- [High] Reserved address slots on the parent bus are permanently leaked wh=
en the hub driver is removed.
- [Medium] Forwarding broadcast CCCs to the parent controller breaks virtua=
l bus isolation by unintentionally affecting the entire parent bus.
--

commit 94c62ce56dcc9d461749adc3db10a8061865dc9b
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

    i3c: hub: Add support for the I3C interface in the I3C hub
   =20
    Add virtual I3C bus support for the hub and provide interface to enable
    or disable downstream ports.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..6f5227215ae22
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,798 @@
[ ... ]
> +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_hub_dev_data *data =3D i3c_dev_get_master_data(dev);
> +	struct i3c_master_controller *parent;
> +
> +	if (!data)
> +		return;
> +
> +	parent =3D i3c_dev_get_master(&data->parent_desc);
> +
> +	/*
> +	 * parent_desc.ibi should already be cleared by i3c_hub_free_ibi()
> +	 * before we get here. If it is still set, the kfree(data) below frees
> +	 * a descriptor the parent controller can still reach via un-flushed
> +	 * asynchronous IBI work (use-after-free, not just a leak).
> +	 */
> +	WARN_ON_ONCE(data->parent_desc.ibi);
> +
> +	if (parent) {
> +		i3c_bus_maintenance_lock(&parent->bus);
> +		i3c_master_detach_i3c_dev_controller_locked(&data->parent_desc);
> +		i3c_bus_maintenance_unlock(&parent->bus);
> +	}
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	mutex_destroy(&data->parent_desc.ibi_lock);
> +	kfree(data);

[Severity: Critical]
Does this code introduce a use-after-free when IBI is still active?

If data->parent_desc.ibi is not NULL, as explicitly checked by the
WARN_ON_ONCE, the parent controller's asynchronous IBI path may still
have a work item queued referencing data->parent_desc. By unconditionally
calling kfree(data), we allow the pending async work to dereference
freed memory when it executes.

> +}
> +
> +/**
> + * i3c_hub_do_daa() - Perform DAA via hub port
> + * @hub: Hub instance
> + * @controller: Virtual controller for a hub port
> + *
> + * Enables the port connection, performs DAA on the parent controller,
> + * then disables the connection.
> + */
> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;
> +
> +	if (!hub || !hub->hub_dev)
> +		return -ENODEV;
> +
> +	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	/*
> +	 * Lock order: hub routing mutex before the parent bus lock (taken here
> +	 * inside i3c_master_do_daa()). The depth-keyed lockdep classes above
> +	 * keep this nesting acyclic when the parent is itself a hub.
> +	 */
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +
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
Does delegating DAA to the physical parent controller break reachability
for downstream devices?

When devices respond to ENTDAA, they are instantiated on the parent bus
rather than the virtual bus. If drivers subsequently initiate transfers, th=
ey
use the parent controller's transfer operations directly, bypassing the
hub's i3c_hub_master_priv_xfers(). As a result, the hub target port is
never enabled during the transfer, leaving these downstream devices
permanently unreachable.

> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
[ ... ]
> +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> +				struct i3c_master_controller *controller,
> +				struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;
> +
> +	if (!hub || !hub->hub_dev)
> +		return -ENODEV;
> +
> +	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +	ret =3D i3c_master_send_ccc_cmd(parent, cmd);

[Severity: Medium]
Can forwarding unfiltered broadcast CCCs to the parent controller break
virtual bus isolation?

If a driver on a specific virtual bus issues broadcast commands (such as
SETMRL, SETMWL, or ENEC), this forwards them to the parent controller which
broadcasts them globally. This will unintentionally alter the configuration
or event state of all peer devices on the parent bus and other open target
ports.

> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
[ ... ]
> +int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *=
hubc,
> +					     struct device_node *node)
> +{
> +	struct i3c_master_controller *parent =3D hubc->parent;
> +	enum i3c_addr_slot_status status;
> +	u32 assigned_addr;
> +	u32 reg[3];
> +	int ret;
> +
> +	if (!parent || !node)
> +		return -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(node, child) {
> +		/*
> +		 * Only consider addressable bus nodes: a valid "reg" is
> +		 * required to describe a device, but its static-address value
> +		 * does not affect the reservation below.
> +		 */
> +		ret =3D of_property_read_variable_u32_array(child, "reg", reg, 1, 3);
> +		if (ret < 0)
> +			continue;
> +
> +		ret =3D of_property_read_u32(child, "assigned-address", &assigned_addr=
);
> +		if (ret)
> +			continue;
> +
> +		/* Skip nodes without a usable dynamic address. */
> +		if (!assigned_addr || assigned_addr > I3C_MAX_ADDR)
> +			continue;
> +
> +		i3c_bus_maintenance_lock(&parent->bus);
> +		status =3D i3c_bus_get_addr_slot_status(&parent->bus,
> +						      assigned_addr);
> +		if (status =3D=3D I3C_ADDR_SLOT_FREE)
> +			i3c_bus_set_addr_slot_status(&parent->bus,
> +						     assigned_addr,
> +						     I3C_ADDR_SLOT_I3C_DEV);

[Severity: High]
Does this code permanently leak parent bus address slots when the hub driver
is removed?

The address slots in the parent bus state are set to I3C_ADDR_SLOT_I3C_DEV.
However, there appears to be no corresponding teardown mechanism provided
to revert these slots to I3C_ADDR_SLOT_FREE when the virtual controllers
are destroyed or the hub driver is unbound. This leak can eventually exhaust
the address space and cause failures for subsequent devices.

> +		i3c_bus_maintenance_unlock(&parent->bus);
> +	}
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826103819.1614=
843-1-lakshay.piplani@nxp.com?part=3D6
