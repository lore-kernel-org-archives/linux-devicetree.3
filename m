Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3CD378D72
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620342; cv=none; b=rmTHd+65nPWn9KOkcM1PVsV6nByG2OX4kmgXuqnG4RMuMfPBENm0FE4/Em9K7gouE45cmCgPpdoGZHWmjnzY3QrWqzD5PoRi1wuyrn4YgPFybxIU+byLwC+dX9D8DaX/xO1ROL+1aoLWnIF0QBio4MCMeSpj2Ef3uhJKTYXq02s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620342; c=relaxed/simple;
	bh=fE2TtmuoVgJ7bGRbXsCVBzxDxf26oDJmkZfeaBkMmmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rmh8jlb12Ase5XS7H+t5SpWc2MHz7JW4wd18h7aMWwzg2XbGgbzeOpiqkLLW+oo8V7cTkeEcsg8ivF98lN2MNQ/ljnJ3WQhzumWGUxQKsLemaiGPb39lAcy+rJFtI9jvodpA+MTdWh2KK76hFLwQNnHn03faZm35KKsdqmHPUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IY8rQfC9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IY8rQfC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7D81F00A3D;
	Tue, 16 Jun 2026 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620341;
	bh=dETsmP/46YaE9cQgum8/eKLP3RfVU/gcZxi3iUC8y+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IY8rQfC9Sdz1kpRbPSmyCX3CPbdmLjHVlY0md1ZdoPXaBlE5C2yF6IQAVcQo71DhA
	 YSbu/Uyx7aLqk5R+cPbOEc13Fdf22kYdgOItN3VtQ3kvl9xLJG10qzze703WVepKTQ
	 5Gi4NSuuZLhu8M3UGvO8PZj6VyF01umPIQb7MPAErPO/6TBzQKwHdL9Kl63k5m0yQ0
	 0TesZw77Tf/qP8HDGmnrsvr/5SbuYM5ugW1CjoF6mruIojCAkf87YejIQIGjf04hAm
	 wsn8ZKkNiw13/YvQ+fUd1NRhFQxyLwkbIyb8vSR5iKuLqXEiPaVUn8SAtaTQX3manE
	 14bHf32hgrGVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 09/12] net: phylink: add .pcs_link_down PCS
 OP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260615122950.22281-10-ansuelsmth@gmail.com>
References: <20260615122950.22281-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:32:20 +0000
Message-Id: <20260616143220.DF7D81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Data Race and Use-After-Free in `phylink_destroy()` due to incorre=
ct cancellation order
- [Medium] Missing Link Teardown Callback (pcs_link_down) on PCS release
- [Low] Missing Kernel-Doc for `pcs_link_down`
--

commit 33892cef9bd3c637bb8d5d91bf19b186872ff8bf
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add .pcs_link_down PCS OP

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS. This might be needed for some PCS that reset
counter or require special reset to correctly work if the link needs to be
restored later.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 0734c98498a99..1bedac517d213 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1736,6 +1742,9 @@ static void phylink_link_down(struct phylink *pl)
> =20
>  	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
>  				   pl->cur_interface);
> +
> +	phylink_pcs_link_down(pl->pcs);

[Severity: Medium]
Will this callback be missed if a PCS is released?

In phylink_release_pcs(), pl->pcs is disabled and set to NULL while the link
is logically UP:

	if (pl->pcs =3D=3D pcs) {
		phylink_pcs_disable(pl->pcs);
		pl->force_major_config =3D true;
		pl->pcs =3D NULL;
	}

When this triggers phylink_resolve(), which attempts to bring the link down
using phylink_link_down(), pl->pcs is already NULL. The released PCS never
receives its .pcs_link_down() callback, which might break link lifecycle
symmetry and fail to reset internal counters.

> +
>  	phylink_info(pl, "Link is Down\n");
>  }
> =20
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 15e6b1a39dfe2..eb6c6ca34147f 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -528,6 +528,7 @@ struct phylink_pcs {
>   * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
>   * @pcs_link_up: program the PCS for the resolved link configuration
>   *               (where necessary).
> + * @pcs_link_down: tear down link between MAC and PCS.

[Severity: Low]
Is there a missing kernel-doc entry for the function signature of
pcs_link_down?

The @pcs_link_down callback is added here, but the detailed function signat=
ure
appears to be missing from the corresponding "#if 0" block in
include/linux/phylink.h (for kernel-doc purposes only), where other PCS
callbacks like pcs_link_up() are fully documented.

>   * @pcs_disable_eee: optional notification to PCS that EEE has been disa=
bled
>   *		     at the MAC.
>   * @pcs_enable_eee: optional notification to PCS that EEE will be enable=
d at
[ ... ]


[Severity: High]
Does the incorrect cancellation order in phylink_destroy() cause a data race
and use-after-free?

In phylink_destroy(), pl->pcs_list is modified without holding
pl->state_mutex:

	/* Remove every PCS from phylink PCS list */
	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
		list_del(&pcs->list);

	cancel_work_sync(&pl->resolve);

If the background work pl->resolve is currently running, the worker thread
executes phylink_major_config() and iterates over pl->pcs_list while holding
pl->state_mutex. Because phylink_destroy() modifies the list concurrently
without synchronization and before canceling the work, the worker thread can
traverse corrupted list pointers, resulting in a use-after-free. Should
cancel_work_sync(&pl->resolve) be called before modifying the list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122950.2228=
1-1-ansuelsmth@gmail.com?part=3D9
