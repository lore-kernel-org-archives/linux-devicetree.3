Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2937AA97
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365278; cv=none; b=kZLEWA+DeZb92kZMgLAADrjNSgwzFtWd9MiVGjywSs/8rQqxpqgYYWMedNSNRbglsJ5dvjr8dGnQLiBfBBV2L2qqSlxFyJBSYqwDuzFkoAHw0XRC0AIu+xSqLlglM3PmWf0Utlj+Tv7OAPo56gpwnzpDc5YzBHOO1fsiUfMi0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365278; c=relaxed/simple;
	bh=f7R+l0JTK1c+VJk6NsDsp6nrsoh+BspwU6E6s0p9gcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cq3BvAGJ7y/BYepXpWbzXg4ILxvw6P9AwHtOABXf6/MCni0l1kY9vxBfv4lHYmDAxd+x80tKoKQqSLA7/wsg2YzrGtHg1b1jp8qCA+g5I48tH0MuxbsSfJkQoDByAcElVGzwLU97W1yv1XcMdclGz6vW32goIoCOX5KM/WxcDcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAhGw1Ww; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAhGw1Ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF841F00A3A;
	Sat, 18 Jul 2026 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365277;
	bh=RuzugZwlxdZZQPCX73GS44RTOZV+vL6qpO7/WGh968c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DAhGw1Wwl+9FT4jIikxcpXcLRjNVcgMVYOlNppHBOspcW+vwhOH1Z5Wpxi2n1ex69
	 Tyepej0vqcHf49khIutLXn18szfUMzzns9rXjBgWnL50vFg5RroUMKK+tgsEWH0laB
	 +VwfWlELF88fUn1rxnENJWaOZF53SsYRy5JnqjvFaAKQ2lEYmiDLvyZwhJUkQSC/Mv
	 ntkfArOGLfL473RZ+sdUh5aawpTBgKGqBLfHZt5wrLD0T7Sh6cfv66hGXDxd28jFYK
	 JV9EoNYaAJM5LvVg+IPAYota7rnYy8iv+5rfJYfZ24iicBLd7Ws0ibYpDxZ4JKZHvZ
	 c3GL+LDkDcOYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 04/12] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717065448.1498335-5-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:16 +0000
Message-Id: <20260718090116.CDF841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The PCS provider API lacks module reference counting or device lin=
king, creating a use-after-free vulnerability.
- [High] Ignoring missing PCS providers breaks probe deferral and corrupts =
the mapping of the retrieved PCS array via unintended array squashing.
- [High] Potential AB-BA deadlock due to calling provider callback while ho=
lding global fwnode_pcs_mutex.
- [Low] API Misuse: Passing -1 to the unsigned int nargs parameter.
--

--- Patch [4]: [PATCH net-next v9 04/12] net: pcs: implement Firmware node =
support for PCS driver ---
commit 9d0c6df31924499c98bee1b3b6194d084ae4c002
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

Implement the foundation of Firmware node support for PCS driver.
To support this, implement a simple Provider API where a PCS driver can
expose multiple PCS with an xlate .get function.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..0cc4daf7beeae
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
> @@ -0,0 +1,212 @@

[ ... ]

> +int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> +			    struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> +						       void *data),
> +			    void *data)
> +{

[Severity: High]
Does this API need a way to track module ownership or establish device link=
s?
Since providers don't pass their module owner (e.g., THIS_MODULE) or a devi=
ce
pointer during registration, consumers can't hold a reference to the provid=
er
module. If a provider module is unloaded, could it leave consumers with
dangling phylink_pcs pointers resulting in a use-after-free?

> +	struct fwnode_pcs_provider *pp;

[ ... ]

> +static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
> +				int index, const char *name,
> +				struct fwnode_reference_args *out_args)
> +{

[ ... ]

> +	ret =3D fwnode_property_get_reference_args(fwnode, "pcs-handle",
> +						 "#pcs-cells",
> +						 -1, index, out_args);

[Severity: Low]
Is it intentional to pass -1 to the nargs parameter of
fwnode_property_get_reference_args()? Since nargs is an unsigned int, this
will be implicitly cast to UINT_MAX.

> +	if (ret || (name && index < 0))
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static struct phylink_pcs *
> +fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
> +{
> +	struct fwnode_pcs_provider *provider;
> +	struct phylink_pcs *pcs =3D ERR_PTR(-ENODEV);

[Severity: High]
Should this default to -EPROBE_DEFER instead of -ENODEV? If a provider hasn=
't
probed yet, returning -ENODEV will prevent the consumer from correctly
deferring its probe.

> +
> +	if (!pcsspec)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&fwnode_pcs_mutex);
> +	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
> +		if (provider->fwnode =3D=3D pcsspec->fwnode) {
> +			pcs =3D provider->get(pcsspec, provider->data);

[Severity: High]
Can calling the provider's get() callback while holding the global
fwnode_pcs_mutex cause an AB-BA deadlock?

If an advanced provider needs to acquire a driver-local lock in its get()
callback, it creates a lock order of fwnode_pcs_mutex -> local_lock.

During provider removal, the driver might acquire local_lock before calling
fwnode_pcs_del_provider(), which then tries to acquire fwnode_pcs_mutex.

> +			if (!IS_ERR(pcs))
> +				break;
> +		}
> +	}
> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return pcs;
> +}
> +
> +static struct phylink_pcs *__fwnode_pcs_get(struct fwnode_handle *fwnode,
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
> +	fwnode_handle_put(pcsspec.fwnode);
> +
> +	return pcs;

[Severity: High]
Since this returns a bare pointer to the consumer without taking a reference
on the provider module, and there is no corresponding put() API, what preve=
nts
the provider from freeing the PCS memory while the consumer is still using =
it?

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
> +							 "#pcs-cells",
> +							 -1, index, &out_args);

[Severity: Low]
Is this another location where we are passing -1 to an unsigned int paramet=
er?

> +		/* We expect to reach an -ENOENT error while counting */
> +		if (ret)
> +			break;

[ ... ]

> +int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
> +			     struct phylink_pcs **available_pcs,
> +			     unsigned int num_pcs)
> +{
> +	unsigned int i, found =3D 0;

[ ... ]

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
Does ignoring -ENODEV and continuing without incrementing the "found" index
corrupt the hardware mapping for the MAC driver?

By not storing a placeholder or deferring probe, any subsequently probed PCS
will be shifted into the wrong index in the available_pcs array. If the MAC
driver expects index i to map to physical lane i, won't this result in
incorrect routing?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D4
