Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4B3F8709
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964025; cv=none; b=LQKSxTrCC2d+CUIMrhSEaY/V19xDFVgvX/d44TqinZmob0mxJGme2BcsU+mbSxVvC/d8tTJkuBYVQxPPj3ZQmdncd+vJ7YxpGTCDwa8WJZVL41HyTpYt56RcyukK5+Jjsragkpxr9us9gocHZqGjrikGbq+YVanSMrGVMp8URXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964025; c=relaxed/simple;
	bh=3VBBrN+ApQHlxJuAmxki8hnPee3sFSfk5yxy6F3jP84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HblcJhjGntwBpwCXavct63UZY9e9iESYNEKTFrnJRiesKe+Gf54laELmxNUqCGAkc2yICjv2pR/DNH1y6j7vri+JwwXB8MDsEcQ1bBo3FQ/qOCEd2PkaFvyuxIKC07z2I3Qaoevxrn0mJJl3Du927V+ZjQ/maQq4VTv9w/3RQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYuVUswI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYuVUswI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4517D1F000E9;
	Mon, 17 Aug 2026 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786964020;
	bh=8Ss4aMzUIM2rlzFPHf2eGphhVCFjbly0x8g/J9sFIw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYuVUswIoHf0t3VLFR2qIV+tqhrREwE9iWkR5SoVplU18Vt7j6R4ZroGWPlgt+Knc
	 tMNlgdm1xGkFMoWJKR7TuOS9uJKnTDYNkW/XEPHmY72aF4tOjw2aRs/+oqBXVDRk+x
	 gKgZK9hQ/fMUCOXHwJtczO9PtFrx+AqfZ05Qst6SmcuXXNFKo3APGd+YNjjSjBHIcx
	 hWd2yZFYbekf9LUkqfNjpVxzCCb9BOhItehQ7s8ha4y1Xtuer3AbeumVOAuLbgeBAL
	 s4beU0/T4fWX4I+np+TwJ5vcp03l14KkEiMmz/B9hI+aqD4pYsuOSM6bBYHIPtFm6J
	 oi3GC+fY9ZqNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260817103844.2142802-7-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:53:39 +0000
Message-Id: <20260817105340.4517D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Delegating DAA to the parent controller incorrectly instantiates d=
ownstream devices on the parent bus instead of the virtual bus.
- [High] Address reservation incorrectly skips assigned addresses that diff=
er from the static address, risking dynamic address collisions.
- [High] Freeing hub device data while IBI is active leaves dangling pointe=
rs in the parent controller.
- [Medium] Non-atomic overwrite of `parent_desc.info` causes data race with=
 asynchronous IBI handlers.
- [Medium] Nested acquisition of identical lock class triggers lockdep recu=
rsive locking warning.
--

--- Patch [6]: [PATCH v15 6/8] i3c: hub: Add support for the I3C interface =
in the I3C hub ---
commit b929a913a5f82c8ea68936fda262a420d33a7ea4
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: Add support for the I3C interface in the I3C hub

Add virtual I3C bus support for the hub and provide interface to enable
or disable downstream ports.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..04726393004b7
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,675 @@

[ ... ]

> +static int i3c_hub_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
[ ... ]
> +	data->parent_desc.common.master =3D parent;
> +	data->parent_desc.info =3D dev->info;
> +
> +	i3c_bus_maintenance_lock(&parent->bus);

[Severity: Medium]
Will this trigger a lockdep warning for recursive locking?

The core I3C subsystem already holds the virtual controller's bus lock when
invoking operations like attach_i3c_dev or enable_ibi. Since all I3C bus
locks are initialized with the same lockdep class, acquiring the parent's
bus lock here looks like it might require subclass nesting annotations.

> +	ret =3D i3c_master_attach_i3c_dev_controller(&data->parent_desc);
> +	i3c_bus_maintenance_unlock(&parent->bus);
> +	if (ret) {

[ ... ]

> +static int i3c_hub_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +				    u8 old_dyn_addr)
> +{
[ ... ]
> +	/* Re-sync device information after the address change. */
> +	data->parent_desc.info =3D dev->info;

[Severity: Medium]
Is it safe to perform a non-atomic update of this structure without holding
the parent controller's bus lock or the hub routing lock?

If the device has an active IBI, could the physical parent controller's
asynchronous IBI interrupt handler concurrently read this descriptor and
see corrupted or torn state?

> +
> +	i3c_bus_maintenance_lock(&parent->bus);
> +	ret =3D i3c_master_reattach_i3c_dev_controller(&data->parent_desc,

[ ... ]

> +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
[ ... ]
> +	/*
> +	 * The generic IBI lifecycle must be released before detaching the
> +	 * physical controller state.
> +	 */
> +	WARN_ON(data->parent_desc.ibi);
> +
> +	if (parent) {
> +		i3c_bus_maintenance_lock(&parent->bus);
> +		i3c_master_detach_i3c_dev_controller(&data->parent_desc);
> +		i3c_bus_maintenance_unlock(&parent->bus);
> +	}
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	mutex_destroy(&data->parent_desc.ibi_lock);
> +	kfree(data);

[Severity: High]
If data->parent_desc.ibi is non-NULL (triggering the warning), does
proceeding to kfree(data) create a use-after-free?

Because i3c_master_detach_i3c_dev_controller() does not automatically flush
or free the generic IBI workqueue resources, lingering asynchronous IBI work
items queued on the parent controller might dereference data->parent_desc
after it is freed.

Should the active IBI resources be explicitly flushed and released before
freeing this memory?

> +}

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
Does calling i3c_master_do_daa() on the parent controller cause newly
discovered downstream devices to be instantiated on the parent bus rather
than the virtual hub bus?

If they are bound to the parent controller, won't subsequent client transfe=
rs
go directly to parent->ops->i3c_xfers, entirely bypassing
i3c_hub_master_priv_xfers() and hitting the closed hub port?

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
[ ... ]
> +		ret =3D of_property_read_u32(child, "assigned-address", &assigned_addr=
);
> +		if (ret)
> +			continue;
> +
> +		static_addr =3D reg[0];
> +
> +		if (!static_addr || !assigned_addr)
> +			continue;
> +
> +		if (static_addr !=3D assigned_addr)
> +			continue;

[Severity: High]
Why do we skip reserving the assigned address if it differs from the static
address?

If static_addr !=3D assigned_addr (for example, expecting assignment via
SETDASA or SETNEWDA), this leaves the assigned address marked as free on
the parent bus. Could this allow the parent controller to accidentally
allocate this assigned address to another device during ENTDAA, causing a
collision?

> +
> +		i3c_bus_maintenance_lock(&parent->bus);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D6
