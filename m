Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A41A6828
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121834; cv=none; b=EmAZq2wabWmTOaf9igRVJBJ58jd1pC/4fvzK7tT8wTL6N6fhxQljOUpKdXxcUK9m5RIug4t6qGnCXkBjsYrhDX8zWVlM+YLIii1ckHnS8CXbgHAcNjZil2ABcYlk8KqNz1D+bmW32B2QFKsEZnfJlX/oYw3OicbA/lQSkZFYtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121834; c=relaxed/simple;
	bh=Z4owJBpDKKcJzeDjfVCKehQ7vClAgnqhstIYwecTgUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E4IGo5YzBmHoxqRhWSxU6wb5OcDpEBVT0/pgBnRuDFv8dSSLo7vQ1kriorCvwJ2R2L+7Qlmep57prdWtOXPb+4HaznIyVxaYJvXhOYT+L/B1q9Iu9aDkYxpumpvnJ8lqcAhqtMu6E6xE0A7BobtzUb0QKhv51CqnJEm+3KNt1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bu6eYiEO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bu6eYiEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266FF1F000E9;
	Sun, 30 Aug 2026 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788121832;
	bh=QxCajnppGknjryhB5VcoBlJwO+qC73OJ1A1znE4sKTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bu6eYiEOxTkj1HZ8o2UTbSGSfUKbznT/loVQtXnA2o4Fvyw0/uxn/+ruqy7mDewWi
	 UrYYotp2IUzBBv/I8S86s4vKUvjTNZfn9QmvpHyfkbgmkAig2xkvjCy5tLDyp/MAYX
	 Y2Jm6Y3l9rYVG4zBkxmZJTdHu63t64yoWPtb6o7rlEQQc9vfvEilBhQNFjgIJhQT8E
	 6p9tZZYbWTHVYgHmkpjSMt1Nj8rjVRHtzhhvQSG/d2/Q5Otz0G1/mxd7lomS3cLKjV
	 7x/bfQecy7l1sEpmc5tU4SkD0LfWbHrpu1GxXSb4myMs+MA5K68+DQsBc374DPcCnW
	 vK1TXhwblYBIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/19] usb: typec: Add thunderbolt switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:30:31 +0000
Message-Id: <20260830203032.266FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Failure of `try_module_get()` is ignored, allowing the consumer to=
 obtain a switch linked to a module that is being unloaded.
- [High] Unprotected access to `parent->driver` can cause a fatal NULL poin=
ter dereference if the parent device is unbound.
- [High] The `typec_thunderbolt_switch_set()` callback can be invoked after=
 the provider driver has unbound, leading to a Use-After-Free of provider p=
rivate data.
--

commit 96a5ceca9e0641da0cd0d5f342a8b7d8ed98e9af
Author: Sven Peter <sven@kernel.org>

usb: typec: Add thunderbolt switch

On Apple Silicon the USB4/Thunderbolt host router can only be brought
up after the Type-C PHY has been configured and requires cable details
known only to the Type-C port controller.

> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 9b908c46bd7df..8339846ba355e 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c

[ ... ]

> +struct typec_thunderbolt_switch *
> +fwnode_typec_thunderbolt_switch_get(struct fwnode_handle *fwnode)
> +{

[ ... ]

> +	sw =3D kzalloc_obj(*sw);
> +	if (!sw) {
> +		put_device(&sw_dev->dev);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	sw->sw_dev =3D sw_dev;
> +	WARN_ON(!try_module_get(sw_dev->dev.parent->driver->owner));

[Severity: High]
Does this code handle the case where try_module_get() fails?

If fwnode_typec_thunderbolt_switch_get() is called while the provider module
is unloading, try_module_get() will return 0. The code triggers a warning b=
ut
continues execution, returning a switch backed by a dying module instead of
returning an error like ERR_PTR(-ENODEV).

When the consumer later calls typec_thunderbolt_switch_set(), it could exec=
ute
freed module memory. Furthermore, typec_thunderbolt_switch_put() will
unconditionally call module_put(), dropping a reference that was never
acquired.

[Severity: High]
Can sw_dev->dev.parent->driver be NULL here?

If the provider device is unbound from its driver concurrently (for example,
via sysfs unbind), the driver core clears parent->driver to NULL.
Accessing driver->owner unconditionally could result in a fatal NULL pointer
dereference.

> +
> +	return sw;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_typec_thunderbolt_switch_get);
> +
> +/**
> + * typec_thunderbolt_switch_put - Release handle to USB4/Thunderbolt swi=
tch
> + * @sw: USB4/Thunderbolt switch
> + *
> + * Decrements the reference count of @sw and releases the handle.
> + */
> +void typec_thunderbolt_switch_put(struct typec_thunderbolt_switch *sw)
> +{
> +	if (IS_ERR_OR_NULL(sw))
> +		return;
> +
> +	module_put(sw->sw_dev->dev.parent->driver->owner);

[Severity: High]
Could parent->driver be NULL when this is called during teardown?

If the provider driver has already unbound, parent->driver will have been
cleared by the driver core. Accessing it unconditionally here to get the ow=
ner
could cause a NULL pointer dereference.

> +	put_device(&sw->sw_dev->dev);
> +	kfree(sw);
> +}
> +EXPORT_SYMBOL_GPL(typec_thunderbolt_switch_put);
> +
> +/**
> + * typec_thunderbolt_switch_set - Forward cable details to USB4/Thunderb=
olt switch
> + * @sw: USB4/Thunderbolt switch
> + * @data: Cable state and details
> + *
> + * Called by the Type-C port driver to forward the cable details
> + * out-of-band to the switch handler whenever a USB4/Thunderbolt
> + * connection comes up or goes away.
> + */
> +int typec_thunderbolt_switch_set(struct typec_thunderbolt_switch *sw,
> +				 const struct typec_thunderbolt_switch_data *data)
> +{
> +	if (IS_ERR_OR_NULL(sw))
> +		return 0;
> +
> +	return sw->sw_dev->set(sw->sw_dev, data);

[Severity: High]
Is it possible for the set() callback to be invoked after the provider driv=
er
has unbound?

If a physical Type-C plug event occurs concurrently with a privileged sysfs
unbind, the consumer driver might call typec_thunderbolt_switch_set(). This
would blindly invoke the callback, potentially accessing driver-private data
that was already freed during unbind.

> +}
> +EXPORT_SYMBOL_GPL(typec_thunderbolt_switch_set);

[ ... ]

> +/**
> + * typec_thunderbolt_switch_unregister - Unregister USB4/Thunderbolt swi=
tch
> + * @sw_dev: USB4/Thunderbolt switch
> + *
> + * Unregister switch that was registered with
> + * typec_thunderbolt_switch_register().
> + */
> +void typec_thunderbolt_switch_unregister(struct typec_thunderbolt_switch=
_dev *sw_dev)
> +{
> +	if (!IS_ERR_OR_NULL(sw_dev))
> +		device_unregister(&sw_dev->dev);

[Severity: High]
Should unregistration clear the set callback or synchronize with consumers?

Since unregistration does not clear the callback or wait for consumers to
release it, the provider driver's remove callback will proceed to free its
private data, leading to the use-after-free mentioned above if consumers
are still actively invoking sw_dev->set().

> +}
> +EXPORT_SYMBOL_GPL(typec_thunderbolt_switch_unregister);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D2
