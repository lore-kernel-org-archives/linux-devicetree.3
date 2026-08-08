Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F207321F5F
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194833; cv=none; b=SsFyAeylSpqPkmmDGv2lyV8VsEBQvUfHPNRocNnNAKLkW6ZBrA5rh8xrN2jL9XQw7ZKDc+G6FZ6gtGrCrAZa+KLtZJ53O2YCxM8zdOHFmVzj5Xeu4wMgY5sTy7YCgWubs6N0kFP55jf5uP2F80fvxa0YDbls0GyqjeGQbuc+tek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194833; c=relaxed/simple;
	bh=YlnqU+H5M4zMLCHVrFMQsn0qPl7fMAIlrEb676OnYxE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=geAMXAicZ9wkoGqvMEuMn7ga0Q2bkwEJNMouhM3PimxY5w9UGtOJcDTbaAeLkzGd7EaFQe9kA+5lAmW3nfbMy2NC3Gs3gENi6uPYZKfsusejs0cp4DgdSoSvteDrAD75vXeiofCtdLnV06mg5ScbqKIEeDENz1r4Po4T8rX83kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kshOycsn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kshOycsn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A8E1F00A3A;
	Sat,  8 Aug 2026 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194832;
	bh=yZKDTo/iEFcbL+38Tn07BXrgUJC5eSIrRgKAJhyHT1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kshOycsnujWt15EuMuCQt9Z6qeSlqTr20Kh0/7lUNTxeXAmVTNaE4KRs8Pki+CLYv
	 XYYNAKzRttFPlpgMyaVukHVGQkfPKoEOfjECsasko0YUrI+a0kE+7KeHHMx71GKgny
	 4v5GesAUfYaN6HnDhAtR5xS6mgJcgkp16QIGROfE/nH9LTFMU9PQiajZX7ZAqyywlB
	 w/ZaeME3woYdexSF19RvuwnuAmCC+lx00q0LJij/k5FXt4Z58jPjxrA7644d3THEdB
	 MMRuONUiNtalR8gQDmF5YVPZBZBNsynqXso8tJVB4keghuFxqkGiMJht+1td9UQa/+
	 oACgc737NNv6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 03/12] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807131301.192060-4-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:51 +0000
Message-Id: <20260808131351.E8A8E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Provider module unload causes use-after-free due to missing module=
 and device lifecycle references in fwnode_pcs_get().
- [High] Returning -ENODEV and compacting the available_pcs array breaks pr=
obe deferral and destroys hardware port mappings.
- [Low] devm_fwnode_pcs_add_provider() unnecessarily allocates devres memor=
y for NULL fwnodes.
- [Low] Redundant condition in fwnode_parse_pcsspec() leads to dead code.
--

--- Patch [3]: [PATCH net-next v11 03/12] net: pcs: implement Firmware node=
 support for PCS driver ---
commit 9eb9adef70448b865a27066bb2a6ee2e49d74279
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

Implement the foundation of Firmware node support for PCS driver. This adds
a Provider API where a PCS driver can expose multiple PCS with an xlate
function, and consumers can request them.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..7f6d9941c1e36
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
> @@ -0,0 +1,240 @@

[ ... ]

> +struct fwnode_pcs_provider *
> +devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *f=
wnode,
> +			     struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> +							void *data),
> +			     void *data)
> +{
> +	struct fwnode_pcs_provider **ptr, *pp;
> +
> +	ptr =3D devres_alloc(devm_fwnode_pcs_del, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pp =3D fwnode_pcs_add_provider(fwnode, get, data);
> +
> +	if (!IS_ERR(pp)) {

[Severity: Low]
Does this unintentionally allocate devres memory for NULL fwnodes?

If a driver calls this with a NULL fwnode, fwnode_pcs_add_provider() returns
0 (NULL). Since IS_ERR() does not catch NULL pointers, !IS_ERR(pp) evaluates
to true, resulting in a devres entry tracking a NULL provider.

> +		*ptr =3D pp;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return pp;
> +}
> +EXPORT_SYMBOL_GPL(devm_fwnode_pcs_add_provider);
> +
> +static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
> +				int index, const char *name,
> +				struct fwnode_reference_args *out_args)
> +{
> +	int ret;
> +
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	if (name) {
> +		index =3D fwnode_property_match_string(fwnode, "pcs-names",
> +						     name);
> +		if (index < 0)
> +			return index;
> +	}
> +
> +	ret =3D fwnode_property_get_reference_args(fwnode, "pcs-handle",
> +						 "#pcs-cells", 0, index,
> +						 out_args);
> +	if (ret || (name && index < 0))

[Severity: Low]
Is this (name && index < 0) check unreachable?

Since the earlier block already returns if index < 0 when name is provided:

	if (name) {
		index =3D fwnode_property_match_string(fwnode, "pcs-names",
						     name);
		if (index < 0)
			return index;
	}

Could this redundant check be safely removed?

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
> +
> +	if (!pcsspec)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&fwnode_pcs_mutex);
> +	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
> +		if (provider->fwnode =3D=3D pcsspec->fwnode) {
> +			pcs =3D provider->get(pcsspec, provider->data);
> +			if (!IS_ERR(pcs))
> +				break;
> +		}
> +	}
> +	mutex_unlock(&fwnode_pcs_mutex);
> +
> +	return pcs;

[Severity: High]
Does this allow a use-after-free if the provider module is unloaded?

The phylink_pcs pointer is returned to the consumer here without acquiring
a module reference (like try_module_get) or establishing a device link
(like device_link_add).

If the administrator unbinds the PCS provider driver, it looks like
fwnode_pcs_del_provider() tears down the provider without revoking
consumers' dangling pointers, which could lead to a crash during subsequent
phylink operations.

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
Does continuing on -ENODEV break probe deferral and misalign the array?

If a MAC driver requests multiple PCS nodes and one has not yet probed,
fwnode_pcs_get() returns -ENODEV. By continuing without returning
-EPROBE_DEFER, the loop skips the unprobed PCS without incrementing the
found counter.

Could this cause subsequent valid PCS entries to be stored at the wrong
indices in available_pcs, leading to hardware being configured incorrectly?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D3
