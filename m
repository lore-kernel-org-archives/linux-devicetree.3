Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E97B3E3DA4
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337855; cv=none; b=npE200/fK+Uj1ZHR+7JmZnKawFq/FSBYKj6FzXLv1V61EQOz2h1RAyrf49Wwm6fXSf3bZP0AhVxo7DTakazom0GyavvZ4lYvxTfo17rLEQgMhzqiuo7F27TxZo1G6/VoOdtMOACU5Sah6muhQXeV22MIm64pldhz47XIilr41cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337855; c=relaxed/simple;
	bh=FRav0Sn9y//YrHingnvUbpVZX1+ooLQAhFLm3MSlYP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jCzHZSsGLns9yp1EOXUPWwxfjsg/R4TwMS/0a+n4n/BFb8JVQ0BVs3PC2swxtx5ygPBbvII6ZVi9rK4x69A4h3ysOD+/wwg5cSlBSmB8Lk1uBHcWKlVniykmDpk1ZXFVZuaSKndjOGn4N0FC0o0AMnJhoCfMtqAsdXAQfxnQczM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=macWrUsO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="macWrUsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4806D1F000E9;
	Wed,  2 Sep 2026 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337853;
	bh=4Zl7xkodshdEg9mgVGOAyTiEADhZum824PJPstsTA4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=macWrUsOcvYXaGBm6rrP0GK0eDUd7qWzQWG2fZrmh/HsesvWfz7++7Qi1I6BBxHdJ
	 +lp2jdRK+0bxVRhcupO2p+bgkZFvrEUKqoYp+JmHBShTHWOI5jRwTDYGemA6MT48af
	 EE327t9SB10Jf1cQ/AWbqxEGP1keVlp1oM0NyUpDjgnJppLyWXR01PA0HlG1bkZ0Qp
	 xTelv4PdbcrWnHInoQ1XVE0pLnUEl0uooI6QAVz+S3vqzccvK3hhLOWJh4FdGMC96c
	 h+306TcmZZ4wPJMOUAeMzccsM6u3T9v7uL/d9PpOShQ6uAx/egtwnbm3TA/+2QJkG4
	 bolNpDfqdOGFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 06/12] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901083001.8044-7-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
 <20260901083001.8044-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:30:52 +0000
Message-Id: <20260902083053.4806D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing capability recalculation of `pl->supported` after a late P=
CS is attached.
- [High] Data race on `pl->supported_interfaces` due to missing `rtnl_lock(=
)` in `pcs_provider_notify()`.
- [High] List corruption in `phylink_add_pcs()` when a PCS is shared across=
 multiple phylink instances.
--

commit 5584b5ab8035c3438b3834406ac1b9de7eaf5243
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e88c1effe880f..a68d77ba57282 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1926,6 +1926,27 @@ int phylink_set_fixed_link(struct phylink *pl,
>  }
>  EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
> =20
> +static void phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	struct phylink_pcs *tmp;
> +
> +	/*
> +	 * Make sure state mutex is locked to protect concurrent
> +	 * access to phylink instance PCS list from
> +	 * initial fill_available_pcs and late PCS attach
> +	 */
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	list_for_each_entry(tmp, &pl->pcs_list, list)
> +		if (tmp =3D=3D pcs)
> +			return;
> +
> +	list_add_tail(&pcs->list, &pl->pcs_list);
> +
> +	/* Link PCS to phylink */
> +	pcs->phylink =3D pl;
> +}

[Severity: High]
Does this code risk corrupting the list if a PCS is shared across multiple
phylink instances?  If a misconfigured device tree maps multiple MACs to the
same PCS node, multiple phylink instances could call phylink_add_pcs() with=
 the
same phylink_pcs pointer.

Would list_add_tail() unconditionally overwrite the pcs->list pointers and
destroy the list integrity of the first phylink instance that claimed it?
Should there be a check to ensure pcs->phylink is not already assigned to
another instance?

[ ... ]

> @@ -2004,27 +2025,57 @@ static int pcs_provider_notify(struct notifier_bl=
ock *self,
>  	struct fwnode_pcs_provider *pp =3D data;
>  	struct phylink_pcs *pcs, *tmp;
>  	bool resolve =3D false;
> +	int count, i;
> =20
> -	rtnl_lock();
> +	/*
> +	 * On PCS provider deletion hold rtnl lock as one of
> +	 * PCS can be currently in use by the phylink instance
> +	 * and ethtool OPs can reference it.
> +	 */
> +	if (val =3D=3D FWNODE_PCS_PROVIDER_DEL)
> +		rtnl_lock();

[Severity: High]
Does skipping rtnl_lock() for FWNODE_PCS_PROVIDER_ADD introduce a data race?

Further down in pcs_provider_notify(), the code updates
pl->supported_interfaces:

    phy_interface_copy(pl->supported_interfaces,
                       pl->config->supported_interfaces);
    list_for_each_entry(pcs, &pl->pcs_list, list)
        phy_interface_or(pl->supported_interfaces,
                         pl->supported_interfaces,
                         pcs->supported_interfaces);

Since pl->supported_interfaces is mutated without rtnl_lock(), could a
concurrent ethtool command or SFP hotplug calling phylink_validate_mask()
(which runs under rtnl_lock() and iterates over pl->supported_interfaces) r=
ead
a torn or partially empty mask, leading to spurious capability validation
failures?

[ ... ]

> @@ -2038,7 +2089,8 @@ static int pcs_provider_notify(struct notifier_bloc=
k *self,
> =20
>  	mutex_unlock(&pl->state_mutex);
> =20
> -	rtnl_unlock();
> +	if (val =3D=3D FWNODE_PCS_PROVIDER_DEL)
> +		rtnl_unlock();
> =20
>  	phylink_run_resolve(pl);
> =20

[Severity: High]
Is a capability recalculation of pl->supported missing after a late PCS is
attached?

In pcs_provider_notify(), pl->supported_interfaces is updated when a new PCS
is attached (just above the mutex_unlock() shown here). However, it doesn't
appear that phylink_validate() is called to update pl->supported and
pl->link_config.advertising to reflect the new interfaces.=20

Could this cause new interfaces supported by a late-attached PCS to be omit=
ted
from pl->supported, resulting in SFP hotplug validation failures and ethtool
hiding the capabilities?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083001.8044=
-1-ansuelsmth@gmail.com?part=3D6
