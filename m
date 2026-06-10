Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88C2D7DD7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108188; cv=none; b=kAQRJjIA/5DyvJyoDNfVMlgIDhFTWysrMEy2TYv6o5nNDAnOCYM8Gbc3+4yPHvs8Mb+jWUEChzIyy/L41iuxrQops8C6biGbavK4PROJAWY1UmPeD+Y2Trf0HmYm3awRRdW0sZrj/seP6DE7J9GNFUTY4APz/5K0dyg/33SLrBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108188; c=relaxed/simple;
	bh=kLzvSdcZJI8CbkKrMwJrQ9qtYeY4qy5m3lt2NSp9FNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OVQ0Uhi3HpzR7UppD+RZGiOQTN98HtV0hXIRqA9HZTmsch17wXg/7Qzzmzhme/am+ut7juh7+a0R2EFbc4c1QoeKNSvyFxf21fRL1cySa57OpQmMgNBWHCtpeU2qtIzbKCeKmNAEGtEOmuFEDhBltXtaA4R6236Gsz7N3hxYQsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCPADgkZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCPADgkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF641F00899;
	Wed, 10 Jun 2026 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108186;
	bh=qeB5+E/K9z1KLpPRj0JcU4+n+vw2qCHFyhdGYcXQr6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCPADgkZjyBSnnYWAn8DBP5sER08DNsbxVjbxobaYULUeumUk96C5ag9tGspsKj8x
	 OHRTbOl5+wMmPx4q2B3uNNLhn9JO1nW1Isj+1zgbRXphPl2PTCRMTL/uivn/QizjkF
	 sBHyleByANoaXaoq6GLFAnIgj3kk+wblqRH36AjQbRkCOQUwL2QM5XMXme2P6HyQyw
	 Bjxr8U0jM7MPvA/sPDlzaQW2UNm2/VG5n/OcEAlAq5P69d0ELcWt0/RmIShZPnA3rT
	 Vgq8gHu+mIs5IG7oB5+p43VBIP1vnEeO+iz6JgEjKKDtCVNWWrhmwaGm6W+geV++JB
	 FmUD9wrI5fFdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 09/12] net: phylink: add .pcs_link_down PCS
 OP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609151212.29469-10-ansuelsmth@gmail.com>
References: <20260609151212.29469-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:26 +0000
Message-Id: <20260610161626.8FF641F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Memory leak/Use-After-Free due to missing notifier unregistrat=
ion.
- [High] Hardware Teardown Sequence Error violating symmetric LIFO teardown.
- [High] Data Race and list corruption in `pcs_list`.
- [Low] Incorrect grammar in callback documentation.
--

commit db8b84b7398b2a4cfe29ace55d1aefced615f8e2
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add .pcs_link_down PCS OP

This commit introduces a new pcs_link_down callback for PCS drivers to defi=
ne
specific teardown operations. It updates phylink_link_down to invoke this
new operation before taking down the MAC. This allows PCS drivers to perform
necessary resets or counter clearing when the link goes down.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 65b67c33e12fd..38428b375eca3 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
> =20
>  	phylink_deactivate_lpi(pl);
> =20
> +	phylink_pcs_link_down(pl->pcs);
> +
>  	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
>  				   pl->cur_interface);

[Severity: High]
Does this break the symmetric LIFO teardown order? During phylink_link_up(),
the PCS is initialized before the MAC. Calling phylink_pcs_link_down() befo=
re
mac_link_down() leaves the MAC nominally active while the underlying PCS
connection is severed. Could this inconsistency lead to MAC hardware lockup=
s,
AXI bus hangs, or transmit queue timeouts?

> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index b65f91c78d8cc..79a1496fa519c 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -528,6 +528,7 @@ struct phylink_pcs {
>   * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
>   * @pcs_link_up: program the PCS for the resolved link configuration
>   *               (where necessary).
> + * @pcs_link_down: torn down link between MAC and PCS.

[Severity: Low]
this isn't a bug, but there is a grammar mistake here (torn down instead of
tear down).

[Severity: Critical]
Is there a missing notifier unregistration for the fwnode_pcs_nb block?
Looking at phylink_create(), it registers the embedded notifier block:

drivers/net/phy/phylink.c:phylink_create() {
        ...
        register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
        ...
}

However, phylink_destroy() and the error paths in phylink_create() do not
seem to unregister it. When the phylink struct is freed via kfree(pl), the
embedded notifier remains linked in the global chain. Will any subsequent
PCS provider registration system-wide iterate over the freed memory and cau=
se
a kernel panic? (Note: introduced by the earlier patch net: phylink: support
late PCS provider attach in the same series).

[Severity: High]
Is there a data race when mutating pcs_list in phylink_destroy()?

The pcs_provider_notify() callback asynchronously adds newly discovered PCS
providers to pl->pcs_list while holding the rtnl_lock(). However,
phylink_destroy() iterates over and deletes entries from pl->pcs_list witho=
ut
holding the rtnl_lock():

drivers/net/phy/phylink.c:phylink_destroy() {
        ...
        /* Remove every PCS from phylink PCS list */
        list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
                list_del(&pcs->list);
        ...
}

If there is a concurrent PCS provider registration via the global notifier
chain, could this lead to unsynchronized mutations and list corruption?
(Note: introduced by the earlier patch net: phylink: support late PCS
provider attach in the same series).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D9
