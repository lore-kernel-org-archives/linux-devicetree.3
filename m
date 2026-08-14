Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E23B1ED1
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696603; cv=none; b=DOLMIPw/MECs5DkqTQemCixptQekueDjGXd19W+r5413a+nL5VyXj6HpXMtp7t7gjrS5c3oOZ8gL96DBNHvd9rbdmzfl2U3xBOrdJJ/GZjMUTAL5wzxbIl6slG81rZ33QLkqR192SzO8KJKMH1MQvLBTTUfU7DmnGbvUPYD8gr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696603; c=relaxed/simple;
	bh=VPDHouXWeMwo5sDKF39LL7f7UKMz51IZpPY2y0h5fQA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ldv5MeLKpCXfqUvdgb4qHpLLePF2vtOp3RellpysghYW1z/v8a8SciHS5XTPHGqOY6+yoqIrlePD7tqIPKsSt5DbQGfffh/bduUQrYXOm86ESLfkMKsacqWmH/mGI+pKOBe28a6Kb/nN8hiw/9PGUQcZ7i64RoOW/CGAnGn5nyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUTb35yQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUTb35yQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D8B1F00A3D;
	Fri, 14 Aug 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696595;
	bh=A0E+05mghm4hLHy9CSr00XBptLLTFqCP2P9lVDfI2jI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fUTb35yQmXhwls8Llkb4ohQZYtZt90gfD/O+zbW8iy6xZtiZaJShCMZGVMtjyVtRh
	 qNoUzGLB1A8s4+JDZjr1/Bg/ShTWnD+81LjvFgLyqlppN4xR7P70iRqupHIzEXZr0p
	 ZW1CEaVU7nDIzcUFzxddD3lHJWgBfwXW5j+mwUtqJCD9vmIzCEVH5ahYbcYeSPwBeQ
	 S6d7QicLKDL9xhcvgSG5Qlq3xWQL+yn08oSFeC/JxxiTdx7WkQvqROoeplcit5ZYUO
	 il2IiErhNMz2+9F7CeFxmVTqGxZ0NzkxGmrRpdbiAJxfvnjsZrhS3lC+2S0dj76RKH
	 oItPYd4EiwclA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 03/12] net: pcs: implement Firmware node support for
 PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813083536.970196-4-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260813083536.970196-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:36:34 +0000
Message-Id: <20260814083635.06D8B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Lack of lifetime management between PCS consumer and provider allo=
ws Use-After-Free vulnerabilities.
- [High] Missing PCS providers are silently ignored instead of triggering p=
robe deferral (-EPROBE_DEFER), breaking MAC linking and array indexing.
- [Medium] fwnode_pcs_get_from_pcsspec() drops error codes from the provide=
r's xlate function and incorrectly continues searching the list.
--

--- Patch [3]: [PATCH v14 03/12] net: pcs: implement Firmware node support =
for PCS driver ---
commit 7bea9f15dae43881372af44cc139395687f3fc53
Author: Christian Marangi <ansuelsmth@gmail.com>
Date:   Thu Aug 13 08:35:08 2026 +0000

    net: pcs: implement Firmware node support for PCS driver
   =20
    Implement the foundation of Firmware node support for PCS driver.
    To support this, implement a simple Provider API where a PCS driver can
    expose multiple PCS with an xlate .fwnode_xlate function.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
[ ... ]
> +struct fwnode_pcs_provider *
> +fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> +			struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcs=
spec,
> +							    void *data),
> +			void *data)
> +{
> +	struct fwnode_pcs_provider *pp;
> +
> +	if (!fwnode)
> +		return ERR_PTR(-EINVAL);
> +
> +	pp =3D kzalloc_obj(*pp);
> +	if (!pp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pp->fwnode =3D fwnode_handle_get(fwnode);
> +	pp->data =3D data;
> +	pp->fwnode_xlate =3D fwnode_xlate;

[Severity: High]
Should struct fwnode_pcs_provider track the module owner or device to allow
reference counting? Without it, there doesn't seem to be a way to prevent
the provider module from being unloaded while consumers hold a pointer.

> +
> +	mutex_lock(&fwnode_pcs_mutex);
[ ... ]
> +static struct phylink_pcs *
> +__fwnode_pcs_get_from_pcsspec_provider(struct fwnode_reference_args *pcs=
spec,
> +				       struct fwnode_pcs_provider *provider)
> +{
> +	if (provider->fwnode !=3D pcsspec->fwnode)
> +		return ERR_PTR(-EINVAL);
> +
> +	return provider->fwnode_xlate(pcsspec, provider->data);
> +}
> +
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

[Severity: Medium]
The loop breaks only if !IS_ERR(pcs). If the fwnode matches but the
provider's fwnode_xlate function returns a legitimate error (like -EINVAL
for bad arguments), won't this loop just continue to the next provider
instead of aborting and propagating the error?

After checking all other non-matching providers, it looks like it will
unconditionally overwrite the actual error code with -ENODEV below.

> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);

[Severity: High]
If a provider is not yet registered, this returns -ENODEV. Should this
return -EPROBE_DEFER instead, so the consumer knows to retry when the PCS
driver probes later?

> +}
> +
> +static struct phylink_pcs *__fwnode_pcs_get(const struct fwnode_handle *=
fwnode,
> +					    unsigned int index, const char *con_id)
> +{
> +	struct fwnode_reference_args pcsspec;
> +	struct phylink_pcs *pcs;
> +	int ret;
> +
> +	ret =3D fwnode_parse_pcsspec(fwnode, index, con_id, &pcsspec);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	pcs =3D fwnode_pcs_get_from_pcsspec(&pcsspec);

[Severity: High]
Does this return a raw pointer to the consumer without pinning the provider
module in memory (e.g., via try_module_get)?

If the provider driver is unbound or unloaded via rmmod, could this leave
the MAC driver with a dangling pointer and lead to a use-after-free during
network operations?

> +	fwnode_handle_put(pcsspec.fwnode);
> +
> +	return pcs;
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

[Severity: High]
By explicitly catching and ignoring -ENODEV, doesn't this break standard
probe deferral, causing the MAC driver to initialize without its required
PCS?

Also, since the loop variable i increments but found does not when a
device is skipped, wouldn't subsequent valid PCS devices be shifted into
earlier array indices in available_pcs, corrupting the expected hardware
mapping?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813083536.9701=
96-1-ansuelsmth@gmail.com?part=3D3
