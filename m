Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18D6FC3
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694782; cv=none; b=mdTv0SkGuYhZ8U6/7jlMz7z1SHwUG9xedsr8mNuFZLt7UjkpQwlK8LFftAskpSsl7Ohrnnh2fiEhXK7of2L+srw4j1+Cah84bAgwXlkJFv1EgHOPpBh5/tGw4eHaXyOA+VgDAi2WU9fvaegRcNDqbs3cwW2QWrQk+2+lYxtk12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694782; c=relaxed/simple;
	bh=Ml83agGrwbmcx9wuLB8ydnvu7kuIR1kaEAjSbP4D+Dk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yr5dkskm/2PjuaH9H7WNSize8ypU6/lRmq03A1YsGvqGPH/+lQbfcHxLWPU0uNuhD/JI7xPEiRjIzXS0HBfBo89ZsEKFxVw/orqcVx+njNjfjPyZtdSiFHL7okgcYkTNNYF8rfL7jUjyFTWoJTrYT2idfMmMzPR5TVcBzT363aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldSyZB9D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldSyZB9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC7E1F000E9;
	Mon, 25 May 2026 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779694780;
	bh=NdjexsjUL8poX7zAsA9UTVY8nB++iAxSgElIGvgMMf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ldSyZB9DC6kouJMQDIfZg1ubLOWyplPNKp3kgJk4KkLELerU/xFPlKgiPqQO2DHmP
	 KqNR9cKtUDASdmpaPRzgP2wrzWEdWHmaw8HFmYEI1Qs7DX20DMXigzDQAO3kRZ04If
	 cFmNixFVpFxpcLmDfOz/yBLuGb698Sy/usdRBfGrtcdI31a1SZ/+SFM0TymYyXZ0uu
	 tL745+NPhNQGCfpm6H5/rALj9wg7mTbhGTTXMlKtu9KKZpehSQyMkN+jSayQyFWBKJ
	 mfqr28Sbikb4mNsf19ycodsRuck2SmwEhRfH34oDJLXpw34izZVVfBeshQ1luTTaxp
	 K5Sm044eFle/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/9] i3c: master: Expose the APIs to support I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525064209.2263045-3-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:39:39 +0000
Message-Id: <20260525073940.9EC7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] `i3c_master_reattach_i3c_dev_locked()` does not validate slot av=
ailability despite documentation claiming it returns `-EBUSY`.

Pre-existing issues:
- [High] `i3c_master_reattach_i3c_dev_locked` corrupts the bus address stat=
e if the reattach operation fails.
- [High] Missing synchronization and improper error handling in `i3c_dev_di=
sable_ibi_locked` and `i3c_dev_free_ibi_locked` lead to Use-After-Free.
- [High] Missing memory barrier between `reinit_completion()` and `atomic_r=
ead()` can lead to a deadlock in `i3c_dev_disable_ibi_locked`.
--

commit 9189e89cd793462892bddcec9432ec1ed64052bf
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Expose the APIs to support I3C hub

This commit exposes several internal static I3C functions as public APIs
to support a new I3C hub driver. It adds EXPORT_SYMBOL_GPL and kernel-doc
comments for functions handling IBI operations and device reattachment.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c45b450af319d..ec3547f75469e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> -static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> -					      u8 old_dyn_addr)
> +/**
> + * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a =
new address
> + * @dev: I3C device descriptor to reattach
> + * @old_dyn_addr: previous dynamic address of the device
> + *
> + * This function reattaches an existing I3C device to the bus when its d=
ynamic
> + * address has changed. It updates the bus address slot status according=
ly:
> + * - Marks the new dynamic address as occupied by an I3C device.
> + * - Frees the old dynamic address slot if applicable.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 on success, or a negative error code if reattachment fails
> + *         (e.g. -EBUSY if the new address slot is not free).
> + */
> +int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> +				       u8 old_dyn_addr)
>  {
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
>  	int ret;

[Severity: Medium]
The kernel-doc mentions returning -EBUSY if the new address slot is not fre=
e.
Does the implementation actually check this?

It appears i3c_bus_set_addr_slot_status() is called unconditionally,
overwriting the slot status without validating if it was previously occupie=
d.

Since external driver authors may rely on this documented contract, could t=
his
lead to masking conflicts if they omit their own slot availability checks?

[ ... ]
> @@ -1677,6 +1692,7 @@ static int i3c_master_reattach_i3c_dev_locked(struc=
t i3c_dev_desc *dev,
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev_locked);

[Severity: High]
This is a pre-existing issue, but exporting this function exposes an error
handling path that can corrupt the bus address state. If the hardware reatt=
ach
callback fails:

i3c_master_reattach_i3c_dev_locked() {
    ...
    if (master->ops->reattach_i3c_dev) {
        ret =3D master->ops->reattach_i3c_dev(dev, old_dyn_addr);
        if (ret) {
            i3c_master_put_i3c_addrs(dev);
            return ret;
        }
    ...
}

Calling i3c_master_put_i3c_addrs() marks the device's dynamic and static
address slots as I3C_ADDR_SLOT_FREE. However, the device is not logically
detached, remains in the bus list, and retains its dyn_addr.

Since the bus allocator now views the slot as free, can subsequent dynamic
address assignments or hot-joins assign this address to another device, lea=
ding
to address collisions on the bus?

[ ... ]
> +/**
> + * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific de=
vice
> + * @dev: device on which IBIs should be disabled
> + *
> + * This function disable IBIs coming from a specific device and wait for
> + * all pending IBIs to be processed.
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + * Return: 0 in case of success, a negative error core otherwise.
> + */
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master;
> @@ -3216,7 +3242,22 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc=
 *dev)
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of a memory
barrier here risk a deadlock?

i3c_dev_disable_ibi_locked() {
    ...
    reinit_completion(&dev->ibi->all_ibis_handled);
    if (atomic_read(&dev->ibi->pending_ibis))
        wait_for_completion(&dev->ibi->all_ibis_handled);
    ...
}

Because there is no full memory barrier between writing the completion stat=
e in
reinit_completion() and reading the atomic counter, could store-load reorde=
ring
occur?

If a concurrent IBI workqueue handler decrements pending_ibis to 0 and calls
complete() before the completion reset is globally visible, the
wait_for_completion() call would block indefinitely.

[Severity: High]
Also a pre-existing issue, but does this lack synchronization with in-flight
interrupts?

If an IRQ handler is executing on another CPU right before
atomic_inc(&dev->ibi->pending_ibis) is called, i3c_dev_disable_ibi_locked()
could read pending_ibis as 0 and return early.

If i3c_dev_free_ibi_locked() is subsequently called to free dev->ibi, would=
 the
delayed IRQ handler then access freed memory?

[ ... ]
> +/**
> + * i3c_dev_free_ibi_locked() - Free all resources needed for IBI handling
> + * @dev: device on which you want to release IBI resources
> + *
> + * This function is responsible for de-allocating resources previously
> + * allocated by i3c_device_request_ibi(). It should be called after disa=
bling
> + * IBIs with i3c_device_disable_ibi().
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + */
>  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
> @@ -3301,6 +3366,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *d=
ev)
>  	kfree(dev->ibi);
>  	dev->ibi =3D NULL;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);

[Severity: High]
This isn't a bug introduced by this patch, but exporting these APIs highlig=
hts
a potential use-after-free vector.

i3c_dev_free_ibi_locked() {
    ...
    if (dev->ibi->enabled) {
        ...
        ret =3D i3c_dev_disable_ibi_locked(dev);
        ...
        if (ret)
            dev_err(&master->dev, "Failed to disable IBI before freeing\n");
    }
    ...
    kfree(dev->ibi);
}

If i3c_dev_disable_ibi_locked() fails to disable hardware IBIs, this functi=
on
logs an error but proceeds to call kfree(dev->ibi) and destroy the workqueu=
e.

Since the hardware might still be enabled and firing interrupts, won't the
master's IRQ handler attempt to access the freed dev->ibi when it receives =
the
next interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D2
