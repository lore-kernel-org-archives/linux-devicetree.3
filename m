Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5C3413231
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194836; cv=none; b=AsOTmxOBqXU/+ObrN8vWRvukYByZail9JML2lrZrOv6Pv5oJUbsiChcceZWBeOi1I2I1qqeYuuhUlfD9hsDjmS96qGJsRRFA8m8fk30ALnZcRWYqmckk2qDivqorSGD5+CunexESAl+Oqi5Idi3yww5lCwXeK6YB2e1f1035zzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194836; c=relaxed/simple;
	bh=U8qaJrFXVBCnQvFPqF7CE6f0mfcD20QYoD1CShox2Qk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sw6WZffeoerqTaPX3eM5IGobWrobLXV+aPc3Y+xHMbb3GJgOdFls3atcBeL2xKrV3TeDFWT/0ljGCabjYXylehA7j7+JOgjVeJqZzrD2AdXwu/KnKDOKaJUx7JfPTG29YX3eU/f22lX7X3DCvm1HL9mQ0fGxQCrDWl5nYONloD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW2AxBoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW2AxBoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E031F000E9;
	Sat,  8 Aug 2026 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194835;
	bh=iJyu6mXSeJwTj7K1RvsXKe/Q4K7AuQzwOuGS2vEX3U8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PW2AxBoJi7EZ3FXNB4VYx1TI2wmpeHO7vIGeog0hc5SOQb7VzigQavt74PFn9Jgsi
	 RwmlTYNnRLWbOknzEx4JHg0J/vjULbTJwJAuTme4+M1amSDwM4bhQP44Xj26q5Vk10
	 vuOpdvbxlR/XzCY8zLI9iGQChDZiF4++mYvH/dAhaph/sS7kQmqjVJAAm8m4rnuNCp
	 3JzMlmjyKMfdiTcvprZyXaRA5GwnlxBCZ3zv3YYMyCg+Ouik0DNLAgROcZWjCcsejh
	 fnFAovNPTRbKzuQOLKhQlmo7h9IisooqKm6gRpFJOtk3dANk9QLlDOI4VWItL6Qnbk
	 TJDmCP7fEot8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 07/12] net: Document PCS subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807131301.192060-8-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:54 +0000
Message-Id: <20260808131355.09E031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mutex deadlock during fwnode_pcs_del_provider() due to notifier ca=
llback re-acquiring fwnode_pcs_mutex.
- [High] Concurrent list modification in phylink_create() error path due to=
 missing mutex and incorrect cleanup ordering.
--

--- Patch [7]: [PATCH net-next v11 07/12] net: Document PCS subsystem ---
commit 0d23601c1b08a3129af4d3f510928e8e13e5be2d
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: Document PCS subsystem
   =20
    Add extensive documentation of the new PCS subsystem and the fwnode
    implementation with producer/consumer API.
   =20
    Also update the sfp-phylink migration guide.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> new file mode 100644
> index 0000000000000..79fa596c2900d
> --- /dev/null
> +++ b/drivers/net/pcs/pcs.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

[ ... ]

> +void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
> +{
> +	if (IS_ERR_OR_NULL(pp))
> +		return;
> +
> +	mutex_lock(&fwnode_pcs_mutex);
> +
> +	/* Signal phylink to release any PCS from this provider */
> +	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
> +				     FWNODE_PCS_PROVIDER_DEL,
> +				     pp->fwnode);

[Severity: High]
Does this code cause a mutex deadlock?

When fwnode_pcs_del_provider() is called, it acquires fwnode_pcs_mutex to
protect the providers list before triggering the blocking notifier.

The registered notifier pcs_provider_notify() runs in the same thread conte=
xt.
It handles the event by calling fwnode_phylink_pcs_get_from_fwnode(), which
cascades down to fwnode_pcs_get_from_pcsspec():

pcs_provider_notify()
  fwnode_phylink_pcs_get_from_fwnode()
    fwnode_pcs_get()
      __fwnode_pcs_get()
        fwnode_pcs_get_from_pcsspec()
          mutex_lock(&fwnode_pcs_mutex);

Since fwnode_pcs_mutex is a standard (non-recursive) mutex, attempting to l=
ock
it twice would result in a deterministic deadlock during normal teardown pa=
ths.

> +
> +	list_del(&pp->link);
> +	fwnode_dev_initialized(pp->fwnode, false);
> +	fwnode_handle_put(pp->fwnode);
> +	kfree(pp);
> +
> +	mutex_unlock(&fwnode_pcs_mutex);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_pcs_del_provider);

[ ... ]

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index b241768edbcba..69d4f6675db0f 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1928,6 +2171,13 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,
>  release_link_gpio:
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> +unlink_pcs_list:
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +		list_del(&pcs->list);
> +		pcs->phylink =3D NULL;
> +	}
> +unregister_pcs_notify:
> +	unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);

[Severity: High]
Can this error path lead to concurrent list modification?

In this error path, pl->pcs_list is manipulated without holding
pl->state_mutex, and this occurs before the PCS notifier (pl->fwnode_pcs_nb)
is unregistered.

If a provider addition or deletion event fires concurrently,
pcs_provider_notify() will be invoked. The notifier safely acquires
pl->state_mutex to modify pl->pcs_list, but because this teardown path does
not hold the mutex while executing list_del(&pcs->list), it creates an unsa=
fe
data race.

To safely fix this, could the teardown unregister the notifier first and th=
en
hold pl->state_mutex while iterating the list, similar to how it is handled=
 in
phylink_destroy()?

>  free_pl:
>  	kfree(pl);
>  	return ERR_PTR(ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D7
