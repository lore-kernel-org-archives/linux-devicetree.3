Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE7535FB3
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074401; cv=none; b=mSAhVmFxdrmGR3JX4LSj9UP0gpiYlDZXlmiW0fUsv1PEHXc+BbUK4nVeZDClw22KNLbvETCLXI0XZfcaKAujMcRijInG/Z71abr70NvVpOxS+kdT9rF9Rdfk5UgaegRIuZKpJfSZrFcsJsAwtGjIM/SLticpbvtBxaKSwLYpCSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074401; c=relaxed/simple;
	bh=phM6b5nxbwDLcnWqdARsUXK2QwmwE6e2PkJmh2Vgpew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ENrOOLc63hdINTXLIh9dqcKoLSpICe+eCIY/W2XPlLZQBUc82lJLcPt5u9bJB878FwlIjRDUz2L7iEwPL9lNkJWu6vC+w5XxFSj1MoccfmMfOY8rE3+l5gBB8ySEm72QrJmmnaYaqHeeYGq9Zp+CMtbZTtmtVn0P3W11B2FcB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGAUqW6Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGAUqW6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F431F000FF;
	Tue, 22 Sep 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074396;
	bh=9gX/7loJZxrdXBpa90Qqw2w5Xsy64j/sH1+mLHVUGF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGAUqW6YD7xQzbf3csEfEhn2k7ulTE+yd8FqJ4yqOgNuxUzLIrOlA0PEYLnB9TK/z
	 6p3zKGGCx7dv6G83ZZOHyLtesosqIFG+Y8E7b72Us8YeKBUNrHqinGXntZgRYFQ3O7
	 T6XE19BsVUAPrnotZrMvJsgprM/sg67WKTtJRFdyX3AoiUMZwiiuFr1h/2XTEspfK0
	 5rmnKRH6ZJPQtqJbFbdDZJneOgVySui23Lt1d0KglmgdKreCnaX59uTqTk0pn83oBZ
	 p+dYsE2iQ0uQPAnEOdbDenlZFkYPPxbV3Tp5DLLON7nOkAU5JS2TSd6n0tGzfj4iNf
	 jWZjFDy2SvoXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-wiznet-link-gpio-v10-3-5874a7a147a2@marmottus.net>
References: <20260921-wiznet-link-gpio-v10-0-5874a7a147a2@marmottus.net>
 <20260921-wiznet-link-gpio-v10-3-5874a7a147a2@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:53:15 +0000
Message-Id: <20260922105316.82F431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: w5100: race in w5100_suspend due to incorrect detach ordering=
 and missing work flushes
--

commit 4b50b6b7047dc53f16eedfdba4f4a537ef54c0fd
Author: Arthur Crepin Leblond <arthur@marmottus.net>

w5100: detect carrier state using link status bit and optional interrupt

This commit adds support for detecting the carrier state on the w5500 Ether=
net
controller using the Link Status bit and an optional interrupt. It also
refactors the bring-up and teardown operations, including changes to when
net device registration and work queue cancellations occur.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c
[ ... ]
> @@ -839,9 +997,20 @@ static int w5100_suspend(struct device *dev)
>  	struct w5100_priv *priv =3D netdev_priv(ndev);
> =20
>  	if (netif_running(ndev)) {
> -		netif_carrier_off(ndev);
> +		disable_irq(priv->irq);
> +		if (priv->link_irq > 0)
> +			disable_irq(priv->link_irq);
> +
> +		cancel_work_sync(&priv->restart_work);
> +
>  		netif_device_detach(ndev);

[Severity: High]
Does this code leave a race condition in w5100_suspend() due to the detach
ordering?

If a TX timeout occurs between cancel_work_sync(&priv->restart_work) and
netif_device_detach(), wouldn't restart_work be re-scheduled because the
netdev watchdog is still active?

Also, rx_work, tx_work, setrx_work, and napi do not appear to be flushed or
disabled in w5100_suspend(), unlike in w5100_stop(). Could this allow them
to execute concurrently with or after w5100_hw_close(priv) and access
suspended SPI hardware?

> =20
> +		if (priv->link_irq > 0) {
> +			mutex_lock(&priv->link_lock);
> +			netif_carrier_off(ndev);
> +			mutex_unlock(&priv->link_lock);
> +		}
> +
>  		w5100_hw_close(priv);
>  	}
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-wiznet-lin=
k-gpio-v10-0-5874a7a147a2@marmottus.net?part=3D3
