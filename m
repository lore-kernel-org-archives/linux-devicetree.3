Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5F40B6F4
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194835; cv=none; b=XxI0iXwdIis2QcWd4Jk0rfaXTVtMUuuIFN3dmYfPM/AlcvFNSDlefLsqrbeDZODk3+P00UA0xHnoYIMnAq5QVWBQnyD3bs+q1skqDZ719K5ZdDgnWRRh6za1pdtjld31vqXmL4n8yYZ6nvSYI2vyjOzecBQNF2lEW1ADWAODkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194835; c=relaxed/simple;
	bh=PBFE/PHdHO2myD67NzWHwdIOykuIWR7TtCC1z+SF3zk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBUMVX+jDSvGIRaK9ZhzIY4+G0TYDqYGViy2bbGAfQr3jBMx10FF4FKg/tkz/0UaCw8r4iXKBZ/YlbfcrDe46C8CTc/oWLfx2xAl+fVdMvoDih4cyru2GWrjlX64Y9GcTtdW+wXiKwROUBRFI/VE3SIcxwgXiL26WIaWn3X8yOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqPLUKR0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqPLUKR0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1311F00A3A;
	Sat,  8 Aug 2026 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194834;
	bh=2W/CeBBlW5Vy8L4jXS3tUysbzxe8fYDl/XD4ibvzd+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VqPLUKR0E2LNXuJo+cd5ANOgBKbSHrnoHLeXbs0hwQOJ9Hs382r3/rKlMOtuADyNo
	 BungRIWwpwdiIpYmIEBCcobw2s1x6PRlfuSovxbPDC6dv1fpZygVMh/Wh9FlmP0yI5
	 pX+9Xg5QPYmiFB/89xuwMbmrlP6FfyBK/mg8D5qmez7jZojbxCj6wpaIKjaP6rksVI
	 m4gZbllkY44m5c41r+F9XQo9Ij+L/yejNjCjS/0x9DkTAWYjovKqBIqiAULAHeCphZ
	 1hg4c8IH5N1EJDL/O+IcmGIqUj3do62Zy+8rZvsZKMbUBVtXzUkoDS3VyURIIfObqa
	 Vfwwfl64S1zTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 06/12] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807131301.192060-7-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:53 +0000
Message-Id: <20260808131354.3C1311F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Self-deadlock in fwnode_pcs_del_provider via FWNODE_PCS_PROVID=
ER_DEL notification.
- [High] Error paths in phylink_create skip necessary cleanup, leading to U=
se-After-Free of the phylink instance and dangling PCS pointers.
- [High] phylink_del_pcs unconditionally calls list_del, crashing on PCS st=
ructures not tracked in the phylink list.
- [High] Missing reference counting on struct phylink_pcs pointers allows a=
 TOCTOU Use-After-Free during asynchronous provider removal.
--

--- Patch [6]: [PATCH net-next v11 06/12] net: phylink: support late PCS pr=
ovider attach ---
commit d404b5bc48ec98384e8bad4f7b0b1af967121eee
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

This patch adds support for attaching a PCS provider to a phylink instance
after the instance has been created and started. It introduces
FWNODE_PCS_PROVIDER_ADD to notify phylink when a new PCS provider becomes
available, linking it and triggering a resolve step to recover links.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 548e783ae2aaa..69d4f6675db0f 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1939,7 +1960,7 @@ static int phylink_fill_available_pcs(struct phylin=
k *pl,
>  		if (!pcs)
>  			continue;
> =20
> -		list_add_tail(&pcs->list, &pl->pcs_list);
> +		phylink_add_pcs(pl, pcs);

[Severity: High]
Could the lack of reference counting on the returned phylink_pcs pointers
lead to a use-after-free here?

fwnode_pcs_get() and its underlying provider callbacks return a pointer
without taking a reference. If a concurrent provider unbind occurs right
before pl->state_mutex is acquired, the provider could be removed and the
memory freed.

When the lock is finally acquired in phylink_fill_available_pcs(), could
this add a freed pointer to the list?

>  	}
> =20
>  	mutex_unlock(&pl->state_mutex);
> @@ -1991,7 +2012,19 @@ static int pcs_provider_notify(struct notifier_blo=
ck *self,
> =20
>  	mutex_lock(&pl->state_mutex);
> =20
> -	phylink_del_pcs(pl, pcs);
> +	switch (val) {
> +	case FWNODE_PCS_PROVIDER_ADD:
> +		phylink_add_pcs(pl, pcs);
> +
> +		/* Force an interface reconfig if major config fail */
> +		if (pl->major_config_failed)
> +			pl->force_major_config =3D true;
> +
> +		break;
> +	case FWNODE_PCS_PROVIDER_DEL:
> +		phylink_del_pcs(pl, pcs);

[Severity: High]
Will this cause a crash if the PCS being removed was never actually added to
the list?

When handling a provider removal, phylink_del_pcs() is called
unconditionally based purely on its presence in the device tree. If the
driver's fill_available_pcs() omitted it, or if phylink_create() failed
before it could be added, the pcs->list remains uninitialized.

Would this lead to list_del(&pcs->list) dereferencing a NULL pointer?

[Severity: Critical]
Could this notifier chain lead to a self-deadlock when removing a provider?

When fwnode_pcs_del_provider() is called, it acquires fwnode_pcs_mutex and
fires the FWNODE_PCS_PROVIDER_DEL notification.

This notifier callback, pcs_provider_notify(), responds by calling
fwnode_phylink_pcs_get_from_fwnode():

pcs_provider_notify()
   pcs =3D fwnode_phylink_pcs_get_from_fwnode(pl_fwnode, pcs_fwnode);

This subsequently calls fwnode_pcs_get_from_pcsspec(), which attempts to
acquire the exact same fwnode_pcs_mutex lock.

Since the lock is not recursive, will this result in a deadlock on the
thread removing the provider?

> +		break;
> +	}
> =20
>  	/* Refresh supported interfaces */
>  	phy_interface_copy(pl->supported_interfaces,
> @@ -2077,10 +2110,6 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,
> =20
>  	mutex_lock(&pl->state_mutex);
> =20
> -	/* Link available PCS to phylink */
> -	list_for_each_entry(pcs, &pl->pcs_list, list)
> -		pcs->phylink =3D pl;
> -

[Severity: High]
Does the error handling in phylink_create() leak dangling pointers and use
freed memory if a failure occurs after the notifier is registered?

The PCS notifier is registered early in phylink_create(). If an asynchronous
FWNODE_PCS_PROVIDER_ADD event fires concurrently, pcs_provider_notify()
can queue the pl->resolve work item.

If phylink_create() subsequently fails (for example, in
phylink_fill_available_pcs()), the error path jumps to unregister_pcs_notify
and frees the phylink structure:

unregister_pcs_notify:
    unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
free_pl:
    kfree(pl);

This path does not call cancel_work_sync(&pl->resolve), leaving the queued
work to execute on freed memory.

Additionally, because the error path skips unlinking the PCS list, any PCS
dynamically added by the notifier will be left with a dangling pcs->phylink
pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D6
