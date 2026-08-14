Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB942C51A
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697930; cv=none; b=T9B8mpm3ZFPkm5ZJ11dUxtoWL0JjTSaDp7en4/LRCzgl4BlygEpdgYWQ5k5KQrke0T6dONZnQuvXZAtxKXuC/4Ij9eVJhYS6UeYzMu6T91C5vT/FHn1Yujnehi0Vtz3WN3kHE0d7RUFyrgR/7Dqs/01zfk1xnwUAx4qBEWk0uD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697930; c=relaxed/simple;
	bh=UlWJOm5zO6B9x2KUEY0qUQt6QErkab/HfX3mgE5WKpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PpYIARf4S+rm2oyfoaF4MC+YD1lhCg8eiNZfCOvJz40YfYwsNcTzmPMqUiMnRi8P1LbynKM4eD1b3V0Du1EsYMHg4MXIxkl5UKFIe2bFrKQed7uYUDJlFISq0JzaxQeWpaG6W7NqaoMC+pF5ySj11ucyJXhm0UIJ9KHsmdooBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftQA9Ax4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftQA9Ax4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1B21F00A3A;
	Fri, 14 Aug 2026 08:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697928;
	bh=ipButaF2fccuLcZnOvYpLYNu2kepCIQSKQEqpGk4jKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftQA9Ax4IKyU8b/AUVVHQZCLi+Zjhj1sBpNIaylbFSLA/fenKT/tFIK598Dd//QOy
	 6XxLjoPaYBjZOLgrTJLB10s16EO0wQHOx2IRLoDGAVqgPR7twfv9PtVD7e5BCTwDzC
	 3UsJ562xpenv7JxbB9dGEUzu2s72yV4NNOG8c5ZzSLCEzNG76QiPyulWiiIv3Pqbjl
	 X+ObNqUKwuvNHEtXOakQ19FUV/sb7UiBZAIy1pTTT9zFl5V6b/0YexnGN49DmULY1k
	 9dAmqO9JxlYmNrT8ef+iaTdF4rDK66D1VnyucnJ1E+oFeySdkiGvviuOaiCqSRZJos
	 hjfnB41YijK7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-wiznet-link-gpio-v5-3-ac8046f24413@marmottus.net>
References: <20260813-wiznet-link-gpio-v5-0-ac8046f24413@marmottus.net>
 <20260813-wiznet-link-gpio-v5-3-ac8046f24413@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:58:46 +0000
Message-Id: <20260814085848.1B1B21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] W5500 devices without the optional link interrupt can become perma=
nently stuck with the carrier off if initialized while disconnected.
- [High] Reordering unregister_netdev() before flush_work() leaves the hard=
ware active and unmasked after driver removal.
- [Medium] A Time-Of-Check to Time-Of-Use (TOCTOU) race condition in link s=
tate initialization.
--

--- Patch [3]: [PATCH net-next v5 3/3] w5100: detect carrier state using li=
nk status bit and optional interrupt ---
commit d746a0d78f3b21d66ca77ce59de3867ee0ba026e
Author: Arthur Crepin Leblond <arthur@marmottus.net>

w5100: detect carrier state using link status bit and optional interrupt
   =20
Detect the link status on the w5500 using the Link Status bit from the
PHY Configuration register. Add an optional interrupt to detect link
status changes and read the PHYCFGR register. Make sure the netdev is
registered last in the probe function.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> index 53d8dc642fbd6..b5976d5e6c60c 100644
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c
[ ... ]
> @@ -659,6 +705,15 @@ static int w5100_open(struct net_device *ndev)
>  	w5100_hw_start(priv);
>  	napi_enable(&priv->napi);
>  	netif_start_queue(ndev);
> +
> +	if (priv->link_irq >=3D 0)
> +		enable_irq(priv->link_irq);
> +
> +	if (priv->ops->chip_id !=3D W5500 || w5500_get_phycfgr_lnk(ndev))
> +		netif_carrier_on(ndev);
> +	else
> +		netif_carrier_off(ndev);
> +

[Severity: Medium]
Could this introduce a race condition during link state initialization?

If the physical link changes state right after enable_irq() is called but
before the manual PHY state check:

CPU1                                      CPU2
w5100_open()
   enable_irq()
                                          w5100_detect_link()
                                             w5100_get_link() -> link up
                                             netif_carrier_on()
   w5500_get_phycfgr_lnk() -> link down
   netif_carrier_off()

Will this leave the interface permanently stuck in a no-carrier state despi=
te
having a valid physical link?

[Severity: High]
Does this code permanently break connectivity for setups without a link
interrupt?

If the device tree does not provide the optional link_irq, and the driver is
initialized while the physical cable is disconnected, netif_carrier_off() is
called here.

Since there is no polling mechanism to detect a subsequent link-up event, h=
ow
will the carrier ever be turned back on once the cable is plugged in?

>  	return 0;
>  }
[ ... ]
> @@ -820,6 +902,13 @@ void w5100_remove(struct device *dev)
>  	struct net_device *ndev =3D dev_get_drvdata(dev);
>  	struct w5100_priv *priv =3D netdev_priv(ndev);
> =20
> +	unregister_netdev(ndev);
> +
> +	if (priv->link_irq >=3D 0) {
> +		free_irq(priv->link_irq, ndev);
> +		priv->link_irq =3D -ENODEV;
> +	}
> +
>  	w5100_hw_reset(priv);
>  	free_irq(priv->irq, ndev);
> =20
> @@ -827,7 +916,6 @@ void w5100_remove(struct device *dev)
>  	flush_work(&priv->restart_work);
>  	destroy_workqueue(priv->xfer_wq);
> =20
> -	unregister_netdev(ndev);
>  	free_netdev(ndev);
>  }

[Severity: High]
Can this reordering leave the hardware active after the driver is removed?

unregister_netdev() was moved to the top of w5100_remove(), which gracefully
stops the hardware early via ndo_stop().=20

However, flush_work() is called later in the teardown process:

w5100_remove()
   unregister_netdev()
      ...
         w5100_stop()
            w5100_hw_close()
   ...
   flush_work(&priv->setrx_work)
      w5100_setrx_work()
         w5100_hw_start()

If setrx_work or restart_work are pending in the workqueue, they will execu=
te
and call w5100_hw_start(), which re-enables hardware interrupts and opens t=
he
socket after the OS interrupt handler has been freed. Is it safe to execute
flush_work() after unregister_netdev()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-wiznet-lin=
k-gpio-v5-0-ac8046f24413@marmottus.net?part=3D3
