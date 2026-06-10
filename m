Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7912165EA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108185; cv=none; b=AmFYR8iyXVJvWpE/I9rBek2u6/nVNqIsgBEZc9S3jlg0SXGdl3meVgElpxsIFXfMSauWlDyiPO/kGT/YUOUBEUYvuPNry2h0vLRGDMNwykFQccCwayZGIZ7C/9L3Kj747TZqvlp2S7HPhoJf3fTGy396NMDFP1K5V3Sj2QgdReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108185; c=relaxed/simple;
	bh=xRIPpx6nShIx73o2uqEnebkeCDZSDHG4CQhdR1uU/xs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XYfSCHMI05ChiYi8w4FGR3IgvjA3k5VI5aNWyO+JJCtIlxmVli/0b8qd1hGsm09aLUTxkTCZTkerZZua61LrlUfmEZC2E2xJ2tRwSq94p4sEqDdT5X05xDwSrHcr9XefBxpEKJXII+YIbHeT20tNzN4Y2YrmOrg2sWbM7AdMTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bs+EAJiQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bs+EAJiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7008B1F00899;
	Wed, 10 Jun 2026 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108184;
	bh=t+gCVhqiOcvc4WzfHv4gcGjb8YORxpO7RF6jKe3s81E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bs+EAJiQfC+Lm20MGiv7G5ChMN4+Koxw65JlSm9xqKFUPu2RfmODL2Zz01EOD1elF
	 SOkGqLrryNHxygeQNgaaWFiXtsYy2tkGmhTc4s+hOUw4EsEQsbZLYYGr+sFjPrclFG
	 YZnTSuc0xGoA1PHlPbotmI29qdqFSJ+auz5v8g+tcc8+UBNI2PNU9Ua8Bw4GNN1J6T
	 oYKsMqAmUUKj+MvglacRiafIJN0+s4EIkaXZv8m6KOIPIf9AcXHGTn2ocRBk36a7/D
	 TBRR0On+aBUxrCz45ApilrF9hbxE69ibUeNaJs00eVu6gBh1PRuR9biFpWkmoyYbL4
	 aOEimaou0RLEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 04/12] net: pcs: implement Firmware node
 support for PCS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609151212.29469-5-ansuelsmth@gmail.com>
References: <20260609151212.29469-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:24 +0000
Message-Id: <20260610161624.7008B1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unprotected list modification and iteration in phylink PCS list ha=
ndling causes race conditions.
- [Medium] `fwnode_pcs_get_from_pcsspec()` incorrectly returns `-ENODEV` in=
stead of `-EPROBE_DEFER` when a provider is not found.
- [Low] `fwnode_parse_pcsspec()` passes a negative error code as an unsigne=
d index, masking the original error and causing out-of-bounds lookups.
--

commit 436ed2d38da7824de31cb0cb85a006f98cbdeb4b
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: implement Firmware node support for PCS driver

This commit implements the foundation for firmware node support in PCS driv=
ers.
It introduces a simple provider API where a PCS driver can expose multiple =
PCS
instances with a get function. It also adds a generic parsing function for =
MAC
drivers to declare PCS in DT or ACPI.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..72f56f55d198d
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c

[ ... ]

> +static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode, int =
index,
> +				const char *name,
> +				struct fwnode_reference_args *out_args)
> +{
> +	int ret;
> +
> +	if (!fwnode)
> +		return -ENOENT;
> +
> +	if (name)
> +		index =3D fwnode_property_match_string(fwnode, "pcs-names",
> +						     name);
> +
> +	ret =3D fwnode_property_get_reference_args(fwnode, "pcs-handle",
> +						 "#pcs-cells",
> +						 -1, index, out_args);

[Severity: Low]
If name is provided but fwnode_property_match_string() fails, it returns a
negative error code. Are we passing this negative value directly into
fwnode_property_get_reference_args(), which expects an unsigned int?

This could wrap around to a large positive integer, causing an out-of-bounds
fetch attempt that internally fails with -ENOENT. The original error code
would therefore be masked by -ENOENT.

Should this function check if (index < 0) return index; before proceeding?

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

[Severity: Medium]
As stated in the kernel doc for fwnode_pcs_get(), it must return
-EPROBE_DEFER if the PCS is not present in the global providers list.
Is it intentional that fwnode_pcs_get_from_pcsspec() defaults to returning
-ENODEV here when a provider is not found?

This could break the standard kernel probe deferral mechanism for the consu=
mer
driver, preventing it from deferring its probe to wait for the PCS driver to
load if fw_devlink is disabled or bypassed.

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
> +}

Regarding the integration of this feature with the phylink subsystem, is th=
ere a
risk of unprotected list modification and iteration causing a race conditio=
n?

[Severity: High]
The pl->pcs_list appears to be protected by mismatched locks. In
phylink_release_pcs() and pcs_provider_notify(), list modifications are
performed under rtnl_lock() but without holding pl->state_mutex:

drivers/net/phy/phylink.c:phylink_release_pcs() {
    ...
    list_del(&pcs->list);
    ...
}

Concurrently, the phylink_resolve() workqueue executes
phylink_major_config(), which iterates over pl->pcs_list using
list_for_each_entry() while holding pl->state_mutex but without holding
rtnl_lock():

drivers/net/phy/phylink.c:phylink_major_config() {
    ...
    list_for_each_entry(pcs, &pl->pcs_list, list) {
    ...
}

Since list modification and iteration are not synchronized by a common lock,
could this lead to linked-list corruption, torn reads, and use-after-free
crashes if the workqueue accesses a PCS that is being removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D4
