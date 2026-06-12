Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B832ED27
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264663; cv=none; b=biS4x8owzCGKZ7UyTJubeLWf/AOPUVwwttkIdAYH2SUxyPp7NjC604uqYte+KyWhpDTkt2GyxiL+fS5GuPOgKFB2TJyzfKMUA4SKzhc6zQhNe5c3NLIAyVvQ4M1yoGxOAvcQqb1v2Zfk24T7qTBagZm5lGELd89tNkyyt6mTkPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264663; c=relaxed/simple;
	bh=dzqBRrEgR9M/Qw4ETlnAiwQN9XBwKOXwg2qNDQl8w3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q1XbAy8nQinUdltGPhNR6HXSPyiOBq4JeVXjOjuozuL8dfyruWV/ugiJnaOHFA7f1T9jenouj+usJTQQNABNTd6mPGy5xJbRkRmCrSRpaDIFmFnXLarFIPi9CxT2Ht+Uf7fuqHS9ulrQ2zj/OqKxTuADLYAd+6AZawA+azpCWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0WQlqTM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0WQlqTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEE31F000E9;
	Fri, 12 Jun 2026 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264661;
	bh=HknA6+Kc/xT5OSoe2AARhGHPKqXwtm8+MNHylvC81h8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P0WQlqTMP+RGOGbBUswoNJcETyjYHHlaVl3o1E4mxQywrbO05zPYB8jOYVjT8DBaS
	 ZQxOXwETY4dJ43OKLbh1/zgN2/rwd9cqf0K1UAf57kFvLjV0RiFODgpc38g8X2EIzj
	 Lbs2kbM7PxG5mcpBOCJxWAAaEIxdgSJg4uAQ6GvvObfTNvIxFKxfzW6XPM9xMw7lX1
	 Vr5yqzDuJyh05XQVB1lRHkTChqb17THVxvm6kW2NtW7sdfm7xwGGP1uUfCdElE8nJ9
	 W5tR8iHwUPKjydHdjoOcIxskunwdLuzSrnxHpwEFy/l4TrS7tHFuCYkuyfJKtgBxvk
	 BJY6sxMXVoiVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/9] i3c: master: Expose the APIs to support I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260612111816.3688240-3-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 11:44:20 +0000
Message-Id: <20260612114421.2BEE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] API documentation mismatch: i3c_master_reattach_i3c_dev_locked()=
 claims to return -EBUSY on collision, but unconditionally overwrites slot =
status.
- [Low] Invalid lock context expressions and typos in newly added IBI kerne=
l-doc.

Pre-existing issues:
- [Critical] Multiple Use-After-Free vulnerabilities in i3c_dev_free_ibi_lo=
cked() due to improper synchronization and teardown order.
- [High] Unbalanced release of address slots in i3c_master_reattach_i3c_dev=
_locked() failure path leads to bus corruption.
--

commit 13a1ff5c64b48ceff03545ae3bebd5e60a136c1e
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Expose the APIs to support I3C hub

This patch exposes several internal I3C master functions to allow new I3C
hub drivers to use them. It adds kernel-doc comments and exports symbols
like i3c_master_reattach_i3c_dev_locked and various IBI handling functions.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c45b450af319d..ec3547f75469e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1652,8 +1652,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_ma=
ster_controller *master,
>  	return 0;
>  }
> =20
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

[Severity: Medium]
The kernel-doc states this returns -EBUSY if the new address slot is not fr=
ee,
but does the implementation actually check this?

Looking at the rest of i3c_master_reattach_i3c_dev_locked(), it appears
i3c_bus_set_addr_slot_status() is called unconditionally to set
I3C_ADDR_SLOT_I3C_DEV without first checking if the slot is available.

Could this silently overwrite an existing occupied slot if an external driv=
er
relies on the documented failure behavior?

[Severity: High]
This is a pre-existing issue, but does the error path safely handle a failu=
re
from master->ops->reattach_i3c_dev()?

When the reattach operation fails, i3c_master_put_i3c_addrs(dev) is called,
which marks the address slots as free. However, it doesn't appear to revert
the hardware device's assigned address.

Since callers like i3c_master_add_i3c_dev_locked() completely ignore the
return value of this function, could this leave the bus manager out of sync
with the hardware state and cause severe address collisions if the slot is
subsequently reassigned?

[ ... ]

> @@ -3195,6 +3211,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *d=
ev, struct i3c_xfer *xfers,
>  	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
>  }
> =20
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

[Severity: Low]
Is the lock context expression correct here?

The parameter is of type struct i3c_dev_desc, which does not have a desc
member, so &dev->desc->ibi_lock appears to be structurally invalid.
Should this be &dev->ibi_lock instead?

Also, there is a minor typo: "error core" should likely be "error code".

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

[Severity: Critical]
This is a pre-existing issue, but does this teardown order introduce a
use-after-free regression when exposed to external drivers?

Looking at the body of i3c_dev_free_ibi_locked(), the function calls
master->ops->free_ibi(dev) before destroy_workqueue(dev->ibi->wq).

If free_ibi() frees the underlying IBI pool memory, and destroy_workqueue()
subsequently flushes pending async work items, could those work items
execute and dereference the already freed pool?

Additionally, if i3c_dev_disable_ibi_locked() had failed to disable the
hardware interrupt, could a firing interrupt access dev->ibi after it is
unconditionally freed by kfree(dev->ibi) at the end of this function?

>  {
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
> @@ -3301,6 +3366,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *d=
ev)
>  	kfree(dev->ibi);
>  	dev->ibi =3D NULL;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612111816.3688=
240-1-lakshay.piplani@nxp.com?part=3D2
