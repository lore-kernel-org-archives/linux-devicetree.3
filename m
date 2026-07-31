Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7C426697
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502098; cv=none; b=KZP9SIDgtRz0NZ/eg+BrC0mRhxL7peoSec3nyRxm1vlHMy2yKrgL26vLh2FU3IIjTvnL9fRQnibJkrfTKwlSMr3ujSXjUWkFCaDN685wGxG8dAvkRqLKeGSp1bMytogbvHLNgAd2Ai+D0T3uuzofK7asA+DYAkbS139ECVKM9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502098; c=relaxed/simple;
	bh=9IAT4jJUjPIpS7tra0/NIMp38LIYfGMSMG4vtzFQfdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qs8Wr3z0zw9P6xF3WIvzDK74ZWUwfyMM29/vAv8NwcM3tozcIdVFzJyZdnEatmKhiuxzG49cnge0x/DgUg7A3cReqm1MATBY5f0IUkT2RD9qFX3X5mzMZ7uPgjKUp3j39A5OcnkEGUkpTctYWfM+lusBMsnymV8wQ3aOXcDAChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvoruOo0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvoruOo0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4B81F000E9;
	Fri, 31 Jul 2026 12:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502097;
	bh=2GxLD+iQmk0NM7MZLvHJBefRNjDQ3ddpocdCNrFcKLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QvoruOo0uhrVDUu/uLEwbawASDkjRvBYAWW0fG2/smW4rZgmQRmw/kkTN9YUuyqbi
	 049yOj5i1e6ntPc5YAScC7RBTzvgAaEKskPlx9t/gnJDKMPx8oOWpS2Rk2eATM81/3
	 BmpmIl6z1OM8RvAFuVzco+vHoDwVN9efluT4kF5tfFmhGio+T0K89TGmUrn26AZaNX
	 bEb+e7raS09uzzCzkM1y1EsovOReXtjkuHkUnseFVcss6vCZaTJ5FO5j7iNPef5GRP
	 a8IzdmZBWSqBicDKDhebAxkVhqICgoTLihRbVAN2kdpKpVDRz/pzuPe5ojpPhkyNCg
	 Zsu26MJYIe27w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 04/11] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730102444.1967900-5-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:48:16 +0000
Message-Id: <20260731124816.AA4B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] fwnode_phylink_pcs_parse() ignores missing PCS providers, breaking=
 probe deferral and shifting array indices.
- [High] The PCS framework returns raw pointers to consumers without taking=
 a module reference or establishing a device link, allowing the provider to=
 be unloaded while in use.
- [Low] Missing dummy stubs for the provider API in pcs-provider.h when CON=
FIG_FWNODE_PCS is disabled.
--

--- Patch [4]: [PATCH net-next v10 04/11] net: pcs: implement Firmware node=
 support for PCS driver ---
commit d0c8f24c0baae704d5686e9b3a0c34423583e32b
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

Implement the foundation of Firmware node support for PCS driver.
To support this, implement a simple Provider API where a PCS driver can
expose multiple PCS with an xlate .get function.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..fa8ab67076e24
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
[ ... ]
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

[Severity: High]
Does this safely manage the lifetime of the provider module?

When a consumer gets the PCS pointer here, there is no try_module_get()
or similar call to pin the provider module in memory. Because fw_devlink
doesn't automatically parse the pcs-handle property, no automatic device=20
links are created to enforce unbind ordering either.

Can the provider module be cleanly unloaded while the consumer is still
actively using the returned struct phylink_pcs, leading to a=20
use-after-free?

> +		}
> +	}
> +	mutex_unlock(&fwnode_pcs_mutex);
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
Does this break the standard probe deferral mechanism?

If a consumer driver calls fwnode_phylink_pcs_parse() during its probe
sequence and the PCS provider hasn't registered yet, skipping the -ENODEV
error allows the consumer to successfully complete probing despite missing
hardware.

Also, because the loop continues without incrementing the `found` index,
the available_pcs array is compacted. If pcs-handle specifies multiple
PCS components that map positionally to specific hardware lanes, doesn't
skipping an unprobed PCS shift the array indices and associate the wrong
PCS with a given hardware lane?

Should this code return -EPROBE_DEFER instead of dropping the error?

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
> +EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_parse);
> diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-pro=
vider.h
> new file mode 100644
> index 0000000000000..ae51c108147e3
> --- /dev/null
> +++ b/include/linux/pcs/pcs-provider.h
[ ... ]
> +int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> +			    struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> +						       void *data),
> +			    void *data);
> +
> +/**
> + * fwnode_pcs_del_provider - Removes a PCS provider
> + * @fwnode: Firmware node
> + */
> +void fwnode_pcs_del_provider(struct fwnode_handle *fwnode);
> +
> +#endif /* __LINUX_PCS_PROVIDER_H */

[Severity: Low]
Are static inline fallback stubs needed here for when CONFIG_FWNODE_PCS
is disabled?

While include/linux/pcs/pcs.h correctly provides dummy stubs for the
consumer API, the provider API declarations lack an #else block. If a
driver conditionally exposes a PCS and includes pcs-provider.h in a
configuration where CONFIG_FWNODE_PCS=3Dn, it could fail to build at link
time due to unresolved symbols for these functions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730102444.1967=
900-1-ansuelsmth@gmail.com?part=3D4
