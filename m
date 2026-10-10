Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F44B1D10
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658148; cv=none; b=OZMYzFcmwGcZBnJIYrtDIcU+cXBQNtr5ikBqGiYDd1fa5rpfC/cL/QHlINmjR5M1uL6RlF+S+h3fGbein5Vt5O5JtDgfW+gcM/Kh3LrXFQeRzQY/mYmgreIjW55X+Ea7HVkGOm+tQUo2wO70zCzQx/MApJy+pQ6/OB4wF0Msb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658148; c=relaxed/simple;
	bh=Zeh12rRGiXjv5UP4RXvtTbRSF+y8wPCRIzMh8LK5Otc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=INfAXYLbgpmafEzHzizBSTSB5WT8n58sn+cgwN2Kuh9LhSrgICMpqC0DLmT5taQObXG0D7I1XtWPaWQp8rHPkQEvCYUsax0TpNmFhQBcIWWtO7G36vMsGaPzR4wMSLipovkZazm5V8TZ5GWVhZ4aJBJLR76aDgxXKPj60WeFO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wxp8dyhK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wxp8dyhK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B8F1F000FF;
	Sat, 10 Oct 2026 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791658147;
	bh=xN+yidxhLaJ+KuQvstyogqMknUkPLZ9KeC4OtEV1/zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wxp8dyhKUYnE3eWQfn7PW3g9EmydgUCwa5w8bvK5ikCM5tlImbhlCWo286jPXyRTk
	 JIJAsk8R7xF8wSl5sk/uECE1jt0L9qRgkC3ApPUIpwrUXp7QiHqkkebMZtmUd+gS0g
	 ct2o+l7tSi8duxwO1pssl1lu7GqbwAQzup2thlyeiNES46/Ru7dP+dcvBhD5svxBdT
	 lI4rxErqmV80oJSdmr8oEO/mRBq7YWqRWgOefDT+fW7GZcdXsukkGrnlNSlLzyYsFx
	 2HsnFFBagzhP2K3niA4b+vrGfHJ0ysoJhJGCHvmoDSM6N1s0zgiCSsdTuP66uQyL7+
	 QbtcYpz9lGgdA==
Message-ID: <sashiko-outbox-166837@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 03/12] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009182836.50631-4-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
 <20261009182836.50631-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:49:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: pcs: fwnode_pcs_get_from_pcsspec() masks xlate errors and byp=
asses probe deferral
- [High] net: pcs: Use-After-Free during teardown due to missing module ref=
counting
- [Medium] net: pcs: fwnode_phylink_pcs_parse() ignores unprobed PCS provid=
ers and shifts array indices
- [Medium] net: pcs: fwnode_phylink_pcs_count() truncates array count on ma=
lformed DT nodes
--

commit 5776ecc6cd389824c086b9dad29a383f13c19ae9
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver
   =20
This commit implements the foundation of Firmware node support for PCS driv=
ers.
It introduces a simple Provider API where a PCS driver can expose multiple =
PCS
using a .fwnode_xlate function. Consumers can then access the PCS via
fwnode_pcs_get().

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> index 0000000000000..39550d9a12a2a
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
> @@ -0,0 +1,245 @@
[ ... ]
> +static struct phylink_pcs *
> +fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
> +{
> +	struct fwnode_pcs_provider *provider;
> +	struct phylink_pcs *pcs =3D NULL;
> +
> +	if (!pcsspec)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&fwnode_pcs_mutex);
> +	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
> +		pcs =3D __fwnode_pcs_get_from_pcsspec_provider(pcsspec, provider);
> +		if (!IS_ERR(pcs))
> +			break;
> +	}

[Severity: High]
In fwnode_pcs_get_from_pcsspec(), if a matching provider's fwnode_xlate()
callback returns an error pointer like -EPROBE_DEFER, !IS_ERR(pcs) evaluates
to false. Does this cause the loop to continue to the next provider (which
will mismatch on fwnode and return -EINVAL), overwriting the valid error
returned by the matching provider?

> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);

[Severity: High]
Does this unconditionally clobber any remaining error with -ENODEV? This
appears to completely break probe deferral because -EPROBE_DEFER is lost,
causing consumers to misinterpret the failure as the provider missing.

> +}
[ ... ]
> +unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_reference_args out_args;
> +	int index =3D 0;
> +	int ret;
> +
> +	while (true) {
> +		ret =3D fwnode_property_get_reference_args(fwnode, "pcs-handle",
> +							 "#pcs-cells", 0, index,
> +							 &out_args);
> +		/* We expect to reach an -ENOENT error while counting */
> +		if (ret)
> +			break;

[Severity: Medium]
If fwnode_property_get_reference_args() encounters a malformed node in the
middle of the list, it returns a parsing error like -EINVAL. Since the loop
fails to distinguish between the expected end of list (-ENOENT) and a parsi=
ng
error, does this blindly break and silently hide malformed DT entries?

Furthermore, because fwnode_phylink_pcs_count() returns an unsigned int, it
cannot propagate negative error codes to the caller. Does this silently
truncate the array length, causing the system to ignore the malformed node
and all subsequent valid nodes without failing the probe or warning?

> +
> +		fwnode_handle_put(out_args.fwnode);
> +		index++;
> +	}
> +
> +	return index;
> +}
[ ... ]
> +int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
> +			     struct phylink_pcs **available_pcs,
> +			     unsigned int num_pcs)
> +{
> +	unsigned int i, found =3D 0;
> +
> +	if (!available_pcs)
> +		return -EINVAL;
> +
> +	if (!fwnode_property_present(fwnode, "pcs-handle"))
> +		return -ENODEV;
> +
> +	for (i =3D 0; i < num_pcs; i++) {
> +		struct phylink_pcs *pcs;
> +
> +		pcs =3D fwnode_pcs_get(fwnode, i);
> +		if (IS_ERR(pcs)) {
> +			/* Exit early if no PCS remain.*/
> +			if (PTR_ERR(pcs) =3D=3D -ENOENT)
> +				break;
> +
> +			/*
> +			 * Ignore -ENODEV error for PCS that still
> +			 * needs to probe.
> +			 */
> +			if (PTR_ERR(pcs) =3D=3D -ENODEV)
> +				continue;

[Severity: Medium]
When fwnode_pcs_get() returns -ENODEV for a PCS provider that hasn't probed
yet, the code explicitly ignores -ENODEV and executes a continue statement,
skipping the advancement of the found index.

Will any subsequently found valid PCS be placed at a lower index in the
available_pcs array than its actual index in the hardware description? Could
this squashing effect decouple the returned PCS pointers from their physical
layout indices, breaking MAC drivers that rely on array position to map
specific PCS channels to hardware lanes?

> +
> +			return PTR_ERR(pcs);
> +		}
> +
> +		available_pcs[found] =3D pcs;
> +		found++;
> +	}
> +
> +	return found;
> +}

I also have a question about the teardown ordering introduced in the related
commit "net: phylink: support PCS provider release".

[Severity: High]
The fwnode_pcs_get() API does not appear to take a module reference
(try_module_get()) or create a device link to pin the provider in memory.

While the series attempts to mitigate this for phylink via a notifier, the
teardown ordering in phylink_destroy() and the error path of phylink_create=
()
unregisters the fwnode_pcs_notify_list notifier BEFORE it clears pl->pcs_li=
st:

    if (pl->fwnode_pcs_nb.notifier_call)
        unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);

    cancel_work_sync(&pl->resolve);
    mutex_lock(&pl->state_mutex);

    list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
        ...

If the PCS provider device is unbound concurrently (e.g., via sysfs) after =
the
notifier is unregistered but before phylink_destroy() clears the list, the
provider's devres callbacks would immediately free the PCS memory.

Does this create a use-after-free when phylink_destroy() then iterates over=
 the
freed pcs pointers, modifying pcs->phylink and pcs->list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009182836.5063=
1-1-ansuelsmth@gmail.com?part=3D3
