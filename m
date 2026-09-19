Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E63655C7
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830863; cv=none; b=l+NPAYr3hXqxf07QL8b1qt9fjh0b6DMZmlIre9T8wdKB+fQAXz0GzyOr/TE3A2M7HzJYRzAlSvB5tpVtJ4TnAKy8g4cPTnY7q7jnf9402x6aIaOg/ERnDKxMeuSWUGx01CHBl70yvl1r0jqJtr08jFJL0Pt+2dtvcb3erDFUJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830863; c=relaxed/simple;
	bh=dgrp0C6TxWeH4/aPrYTRmGKEl7gmQBprJPtv23OjwRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LpYJ5wtOLISDvhqAeopTVxSdDiac9kGwcWaQsvMY0H9DJP6ZMc9H5oghcBKUkppUdjeUeKAv+E+S1UeAuEWaVz53tVq0Io40eywJE2KbxZJTpi0ua448jLdjdEUHcjNbfD6KFan03427YuzNqkvosznnDtucmQZXTnFc7qMZNrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT0elHlJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT0elHlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE471F000FF;
	Sat, 19 Sep 2026 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789830861;
	bh=oX7PkNckd+snPr12OvoloR1o00yOjw/6E/aWRD3K9VM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TT0elHlJmO8t3FBZT+B5QMOIhlICEiZULUZoZ7jAgYHQEh1VXttBXKfyW298l3SOe
	 gG5JkWOyeV6lyfS2y38M9hAFSBFAJhXxZduKas18fvE/hch+JfE+iQ/77edMCkuFbI
	 WOAj7MA8vR6ILTwdxnlyexyswkDXUrhNzdBE4VW0ytHHYeFzkaRZmVnF1Seoj550WG
	 sEwyRA1EypUebWH85+3KAhOVzTKk95PTGmljY52gylNaTaH6elKUZQXt4ToybuAGF2
	 Dp603Vf7AfRT96vWDjng7Fl5aVbxK4/ILvHH0wuAkXfwub8J8OMaS1Pf/K9xcHxRAP
	 xBZfQyhob45VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-wiznet-link-gpio-v9-3-5536f24d8d6d@marmottus.net>
References: <20260918-wiznet-link-gpio-v9-0-5536f24d8d6d@marmottus.net>
 <20260918-wiznet-link-gpio-v9-3-5536f24d8d6d@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 15:14:20 +0000
Message-Id: <20260919151421.2FE471F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: w5100: sleep in atomic context in w5100_restart()
--

commit d7738510984843a0b85d7198fe804aebe167d280
Author: Arthur Crepin Leblond <arthur@marmottus.net>

w5100: detect carrier state using link status bit and optional interrupt

This commit introduces carrier state detection for the w5500 Ethernet
controller via the PHY Configuration register. It uses an optional interrupt
wired to the LINKLED pin to handle link status changes, and refactors sever=
al
aspects of the driver's initialization and teardown sequences.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c

[ ... ]

> @@ -448,12 +526,25 @@ static void w5100_restart(struct net_device *ndev)
>  {
>  	struct w5100_priv *priv =3D netdev_priv(ndev);
> =20
> +	if (!netif_running(ndev) || !netif_device_present(ndev))
> +		return;
> +
> +	disable_irq(priv->irq);
> +	if (priv->link_irq > 0)
> +		disable_irq(priv->link_irq);
> +

[Severity: Medium]
Is it safe to call disable_irq() here? disable_irq() is a sleepable functio=
n,
but w5100_restart() can be called from atomic context when using memory-map=
ped
I/O.

Looking at w5100_tx_timeout(), which executes in atomic context, the timeout
handler falls back to calling w5100_restart() directly if the device cannot
sleep:

w5100_tx_timeout() {
    ...
    if (priv->ops->may_sleep)
        schedule_work(&priv->restart_work);
    else
        w5100_restart(ndev);
}

While current in-tree drivers might set may_sleep to true, this code path
explicitly exists to support may_sleep =3D=3D false. Could this introduce a
'scheduling while atomic' panic for non-sleepable devices?

>  	netif_stop_queue(ndev);
>  	w5100_hw_reset(priv);
> +	enable_irq(priv->irq);
>  	w5100_hw_start(priv);
>  	ndev->stats.tx_errors++;
>  	netif_trans_update(ndev);
>  	netif_wake_queue(ndev);
> +
> +	if (priv->link_irq > 0) {
> +		w5500_report_carrier_state(ndev);
> +		enable_irq(priv->link_irq);
> +	}

[Severity: Medium]
Similarly, w5500_report_carrier_state() attempts to acquire a mutex
(priv->link_lock).

If priv->link_irq > 0 and priv->ops->may_sleep is false, wouldn't taking
this mutex in the w5100_tx_timeout() -> w5100_restart() call chain also
result in sleeping in atomic context?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-wiznet-lin=
k-gpio-v9-0-5536f24d8d6d@marmottus.net?part=3D3
