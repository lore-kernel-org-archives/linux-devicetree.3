Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005768;
	b=di0CPM3S96/PkgJJV6PMkfKYTtG3wPoZFGd/zetqm4M1dWfvCislMjy3HCvKv8SRVHM9
	 2/CUJVeWboWHEYckz4WoZ9LdfMJxOoTVgiiBZP2hAjD1WhtNjcLvyhDI3bHc998BLev0U
	 6zGSLZVIsdUdQhIaXxYy/twFIRJJRKeGV1VF2fJO3JNV0OK/NHIAdVbZaWUp2pAduNxRa
	 xBp99qA2Je0B1hfGDN9tZH+2m8N0v/TcRJ77DrWp6vB3VWdzBj5wdXZqOpVfOEAWXlLFi
	 8WbPFQ2K9NPdhCV4dJ+Fr32VqgSVGaX07Z8j9nh2TaIBOxbMIwJrNyyInx810DoJVCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005768;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a9MtbnlOsyw3otrDk/ysXyAF/Klu3I27ju06A1X5PBs=;
	b=OopWtoBiflrKyCNKTMq5R7WRXSI9XN+uDgVVJINWN23ZlkCUNTy1XD6USwr5ory/DPb9
	 /R14N5I5ufoY0CJnbCmTpEbmzz3jdxhh+PkiFgVucsrcQrZVJ1si0IHS5ep6cLb0KxhQM
	 KVqo/kGtXcbq9Nd1n/3DMWtHCgpuk36eeyxwubsDJGeua1nsRKyU+mTybxrQLLt4amFvX
	 jlFM1OBV0lRVNWeW/YhdUBt5qOwZAvB0R0MJ2MAQhJuWcRy1Daww3V4lFk7tUzdgDDn5z
	 SYB8lTHQZdCJYP0vhTIS/ATsErZ+7KXSXyNfcTDfbXkmI42UadMBiKuDLzQ2vDx9Mpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLCKWO3i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A50606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLCKWO3i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0921E1F000C4;
	Wed, 18 Nov 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005768;
	bh=a9MtbnlOsyw3otrDk/ysXyAF/Klu3I27ju06A1X5PBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YLCKWO3iqvSSJd7GjF0xhbs/8Bu4X7eorQ2OUZQdO8cWLMVZh60uBOuOQTytWBgTX
	 PwNytRtvac/HVBCPF3p0lQepJQitY6U663u9F/49pZa7fy98dqL0jILoUVM5pdQZ0E
	 B5MUKppdW2vg4vmCkkAcJIdslslP9awn3Imx+nnHh6XIBAnodO0JkzK+5em6A9gVXx
	 dQ547GTaBT68tvvIPDueT5DZLyRIsKlI+W0pZk/QLyVgBWdCWOYZFgvQ6M35V6psAX
	 Tz97kZ+3eJHbFqIRE2o3Zx5tZCdt8fyJSyv6kvAnwreKf4+K2zrFbBRT9a/JsAB7aF
	 oPRp2OhW3ikIA==
Message-ID: <sashiko-outbox-220921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 01/15] net: phylink: make PCS phylink
 instance access RCU protected
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-2-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: phylink: missing RCU grace period when pl->pcs becomes
  NULL before destroy
--

commit 68e1704bb1480c2bf9abea1eeb40960aa3c24786
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: make PCS phylink instance access RCU protected

This commit protects pcs->phylink with RCU so that phylink_pcs_change()
safely dereferences the phylink instance under rcu_read_lock() and
phylink_destroy() clears the pointer and waits for a grace period before
freeing the phylink structure.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e7734e45376cd..d9d0ace2042e5 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *=
pl, bool restart,
>  		phylink_pcs_disable(pl->pcs);
> =20
>  		if (pl->pcs)
> -			pl->pcs->phylink =3D NULL;
> +			rcu_assign_pointer(pl->pcs->phylink, NULL);
> =20
>  		if (pcs)
> -			pcs->phylink =3D pl;
> +			rcu_assign_pointer(pcs->phylink, pl);
> =20
>  		pl->pcs =3D pcs;
>  	}
> @@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> =20
> +	if (pl->pcs) {
> +		rcu_assign_pointer(pl->pcs->phylink, NULL);
> +		synchronize_rcu();
> +	}
> +
>  	cancel_work_sync(&pl->resolve);
>  	kfree(pl);
>  }

[Severity: Medium]
Can phylink_destroy() still free pl while phylink_pcs_change() is using it
if a prior phylink_major_config() switched pl->pcs to NULL?

When mac_select_pcs() returns NULL for a new interface mode (for example,
when switching from SGMII to RGMII), phylink_major_config() clears
pl->pcs->phylink and sets pl->pcs =3D NULL without waiting for an RCU grace
period.  If phylink_destroy() then runs, it skips synchronize_rcu()
because pl->pcs is already NULL:

CPU0                                  CPU1
                                      phylink_pcs_change(old_pcs, ...)
                                        rcu_read_lock()
                                        pl =3D rcu_dereference(old_pcs->phy=
link)
phylink_major_config(pl, ...)
  rcu_assign_pointer(old_pcs->phylink, NULL)
  pl->pcs =3D NULL
...
phylink_destroy(pl)
  if (pl->pcs) -> false
  cancel_work_sync(&pl->resolve)
  kfree(pl)
                                        phylink_link_changed(pl, ...)
                                          pl->link_failed =3D true
                                          phylink_run_resolve(pl)
                                            <-- use-after-free

Calling synchronize_rcu() unconditionally in phylink_destroy(), or waiting
for a grace period when unpublishing pl->pcs->phylink, would close this
window.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D1
