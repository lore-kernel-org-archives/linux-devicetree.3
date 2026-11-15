Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739514;
	b=fRVKtMhtEOifoLRtYIx598FFUiMiUxrURGTDfjwLFmtj0UiH6ZaQPdxEgxlVWC0BXf7w
	 W8tKEpQWDyNCOqWWIYtaKTlmCcSckY+Ii6Rce+JMgg9zpGCgen2hOL0c46C5/GoYR3uzq
	 Buuboxf+cZAm51Vrv8zeukiVrd7WB1rNvBp1xyvC0Ro/V7K61GkHVF5OinkpCZ6tfof2v
	 16nmUuXWD5yR9NFCgHxC1LzSd+1vhSs8wPNkzUdTSHF0anKIGT6RHI8Cf9QPO6EC+6Cjr
	 +/7D0x94fCRW6qYxeOdXgRBrrhe3/+1MUhjOb7kUDdmADLFw9ypg5CWLFT7JuIrknSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2COpm5ds43UfVY0C+LR2AnXrtb+rQxJoiWSP7/DFx3c=;
	b=A6jNrdYSDNolOCq9GiORH25z5AEOk6jDs1m+fjdtOu1EoyxHGMTWfNF0FfG4uMBDqIEJ
	 489cVFqOTDWnN+W5qY8DC2tEANbP7sPrVW9RvAP2fejd/PGkAMOZhx6pHVnybCsz+DF1L
	 pr2HCVfLGFmKy1WoXzF7WkLl8hnHmHiiYJrxuR/i8sWxOd33HMhu9fvOALMPNeEDJGAvI
	 Ec9fHmV1QQbrYp7BSAcIXFZcDNIDYgErFwPiUnGfHZxFBAfZnCG4P7VT9t64D9Dm9GhkP
	 7cFjOuTXiBOt/FKEgrxI8gHcQJxiXnGdaGwmlCt8KdcgmRft77UhfidstNw0APQ0Fjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bySg7nIU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B9606A33F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bySg7nIU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BA21F000CB;
	Sun, 15 Nov 2026 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739514;
	bh=2COpm5ds43UfVY0C+LR2AnXrtb+rQxJoiWSP7/DFx3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bySg7nIUzckMCO7TTcIeAjzO3hTIexWHvfrL0Yr13032taYfSGNbtxbRLd/qjvulB
	 BB2agnjUCLzW4IfYLH9SiaFDfUGw7ZMjZkxU8WpinQMv6DzRPS4TT9pwAGldnbLCUD
	 awvXw6h1UOokFCCPSSOxnnCqtxyYcexGB9V9se06iTuLmP4bmfLcmlN8n36z7rDM8b
	 thm3qBMh2FVq5mapf1dLsJ2m2vM0PmzD9vtWT+ScfVxppOezjGx+LxZsOGDeAbPZz0
	 ouHAQo845ZX8rLHhmS5ceUgHOenX3IymsMBQWhLQJyyO6O7OUO3tisBfZtfF7+ognG
	 /0xsCO5N0Ds7w==
Message-ID: <sashiko-outbox-215393@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 02/15] net: phylink: make PCS phylink
 instance access RCU protected
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-3-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] net: phylink: NULL deref and stale pointer in
  phylink_major_config()
- [Low] net: phylink: missing Fixes trailer for commit 24699cc1ff3e
--

commit 85080154c47d10a2333a2099ea90e555d71ad4e7
Author: Christian Marangi <ansuelsmth@gmail.com>

> net: phylink: make PCS phylink instance access RCU protected
>
> In the context of phylink_pcs_change(), phylink instance is dereferenced
> from the pcs pointer present in the phylink_pcs struct.
>
> There is currently a fragility where this pcs pointer is never set NULL in
> phylink_destroy() and would reference invalid memory after phylink instan=
ce
> is freed.
>
> In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
> memory can be dereferenced and phylink_link_changed() is called on freed
> memory.
>
> To address this, make the phylink instance saved in phylink_pcs struct RCU
> protected and access it under RCU lock.
>
> Also correctly reset the phylink instance pointer on phylink_destroy() and
> syncronyze RCU to catch an execution of phylink_pcs_change().
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

[Severity: Low]
Since this fixes a use-after-free in phylink_pcs_change(), should it
include a Fixes tag for 24699cc1ff3e ("net: phylink: add support for PCS
link change notifications")?

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 6c339b25926cc..51c147eb8c2b6 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *=
pl, bool restart,
>  		phylink_pcs_disable(pl->pcs);
> =20
>  		if (pl->pcs)
> -			pl->pcs->phylink =3D NULL;
> +			rcu_assign_pointer(pcs->phylink, NULL);
> =20
>  		if (pcs)
> -			pcs->phylink =3D pl;
> +			rcu_assign_pointer(pcs->phylink, pl);
> =20
>  		pl->pcs =3D pcs;
>  	}

[Severity: High]
Should this clear pl->pcs->phylink instead of pcs->phylink?

When switching from an active PCS to an interface mode where pcs is NULL,
dereferencing pcs->phylink causes a NULL pointer dereference, regressing
0e4d7df2f3b2 ("net: phylink: fix NULL pointer deref in
phylink_major_config()").  When switching between two non-NULL PCS
instances, the old pl->pcs->phylink is never cleared, leaving a dangling
pointer to pl after phylink_destroy() frees it.

This regression is fixed later in the series by commit "net: phylink:
introduce internal phylink PCS handling".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D2
