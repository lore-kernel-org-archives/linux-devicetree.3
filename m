Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5C361651
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620344; cv=none; b=SfljSMHG8GX7PWUnnO1K7hoFYaCVw5BMVMaw82z0wqZMyKGBahrJEZ9gOILSnhYALyBHT4XbXGb+hxnbPhUsW+1ylqGNr9vG4nGjfYP1Qatbc0SIM6/1CLKFnG551HydJ1R4io6o9EtOXCTOQwjvwJ+KF1wK/YcXdg/e5KZoqU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620344; c=relaxed/simple;
	bh=qWybPPyWRhyKCxgD7JJIsnR0znWXu5bVhRWiWQjlIT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mro80UEjkJnILxtpxSDnPQQHlr3Vek0ZPm7VQhL817m8DLKeLz0hwRCqElim+Q47TBbvoOlzTn7mIJDQVDFDPKhIfCaOcNPZNnE3//dwVFQKpwGKOyXRpKLWqjJCRzclG2xX44zoqFrim2enzyVGPyQCE3a1I0Rb6BdIkMMHnaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH2mXk0o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH2mXk0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FCE1F00A3D;
	Tue, 16 Jun 2026 14:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620343;
	bh=iE0eKdJXuh0AmYYp7xpwJDnOpmsWLUcxclGeazRSTmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oH2mXk0o3pbpj1LHqnjYjDsAM+Q2g7vpHYR1bxafVE8YzxzN1stLX4Vs+dW5opDkn
	 O5ODlguF0yq0BHg5Kg2p1dQ7TiDRfssYzWhvAqBzV8kIn6V565Oak/TPxHb+zbcs++
	 2OZ4sMDiGiPjXPd1cQeXQSTkdXxe3eDWrfbF+O5IeKH7iwwILJTi70beHFoX5REVsy
	 eBfM1Ykk4Sm5/yyRYOl1VSO+HyHZRoAWDRTywetu8Tta3CIv06yDAf7rZsHiLT5Tc/
	 UjDeNpL6bOXrHxgPh+j2yYoyUzZ2lBnpjxANKGioqb9U5fOhdAvsDTkK1kErhYiFeS
	 SfWFVobl5FYXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615122950.22281-4-ansuelsmth@gmail.com>
References: <20260615122950.22281-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:32:22 +0000
Message-Id: <20260616143223.44FCE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Lockless modification of `pl->pcs_list` races with the `phylink_re=
solve` workqueue, leading to list corruption and use-after-free.
- [High] The active PCS is disabled prematurely before the MAC link is brou=
ght down, violating the standard teardown sequence.
- [Medium] `pl->supported` link modes are not updated when `pl->supported_i=
nterfaces` shrinks, leading to stale ethtool capabilities.
- [Medium] `pl->sfp_interfaces` is not updated when a PCS is released.
--

commit 0240edfdad0af399cf16b6105ab8d1a7a62254fb
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add phylink_release_pcs() to externally release a PCS

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index cb07184ce82f3..ca4dad4b140a0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -918,6 +919,58 @@ static void phylink_resolve_an_pause(struct phylink_=
link_state *state)
>  	}
>  }
> =20
> +/**
> + * phylink_release_pcs - Removes a PCS from the phylink PCS available li=
st
> + * @pcs: a pointer to the phylink_pcs struct to be released
> + *
> + * This function release a PCS from the phylink PCS available list if
> + * actually in use. It also refreshes the supported interfaces of the
> + * phylink instance by copying the supported interfaces from the phylink
> + * conf and merging the supported interfaces of the remaining available =
PCS
> + * in the list and trigger a resolve.
> + */
> +void phylink_release_pcs(struct phylink_pcs *pcs)
> +{
> +	struct phylink *pl;
> +
> +	ASSERT_RTNL();
> +
> +	pl =3D pcs->phylink;
> +	if (!pl)
> +		return;
> +
> +	list_del(&pcs->list);
> +	pcs->phylink =3D NULL;
> +
> +	mutex_lock(&pl->state_mutex);

[Severity: High]
Does this list_del() race with the phylink_resolve() workqueue?

Since phylink_resolve() does not hold rtnl_lock, it takes pl->state_mutex
and traverses pl->pcs_list in phylink_major_config().

If list_del() executes completely locklessly with respect to the
phylink_resolve() traversal, will the iterator follow poisoned list pointer=
s,
resulting in a page fault and kernel panic?

Also, in phylink_destroy(), does clearing the list before canceling the res=
olve
workqueue without state_mutex open another identical race window?

> +
> +	/* Check if we are removing the PCS currently
> +	 * in use by phylink. If this is the case,
> +	 * force phylink resolve to reconfigure the interface
> +	 * mode, disable the current PCS and set the
> +	 * phylink PCS to NULL.
> +	 */
> +	if (pl->pcs =3D=3D pcs) {
> +		phylink_pcs_disable(pl->pcs);

[Severity: High]
Is it safe to disable the active PCS here before the MAC link is brought do=
wn?

At this point, the MAC link has not been brought down (i.e. netif_carrier_o=
ff
and MAC teardown haven't occurred) because phylink_link_down() is deferred =
to
run inside phylink_resolve().

Could disabling the PCS while the MAC is still actively transmitting/receiv=
ing
violate hardware sequencing and trigger bus stalls, dropped packets, or
hardware hangs?

> +
> +		pl->force_major_config =3D true;
> +		pl->pcs =3D NULL;
> +	}
> +
> +	mutex_unlock(&pl->state_mutex);
> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: Medium]
Will ethtool advertise stale link modes since pl->supported is not updated?

This code correctly shrinks pl->supported_interfaces to exclude the released
PCS's capabilities, but fails to correspondingly re-evaluate the global
pl->supported link mode mask.

[Severity: Medium]
Should pl->sfp_interfaces also be updated when a PCS is released?

sfp_interfaces represents the intersection between the currently inserted
SFP module's capabilities and pl->supported_interfaces. Since
pl->supported_interfaces shrinks, not updating pl->sfp_interfaces might lead
phylink to incorrectly validate or attempt to configure an SFP link interfa=
ce
mode that is now impossible to satisfy with the remaining hardware.

> +
> +	phylink_run_resolve(pl);
> +}
> +EXPORT_SYMBOL_GPL(phylink_release_pcs);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122950.2228=
1-1-ansuelsmth@gmail.com?part=3D3
