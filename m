Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E413D3302
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952725; cv=none; b=Y/NkiZTxKOX3HyEY/tgEwSAJVBD5SJ/Eb5ttjYU3XJoF6Bf80LJJwxzQB7IiTkXiKwRzPifcoGQA0n/eftcQBs+zFNTsIIAjkkT/c//c+ACr2JfzVVbduzUAaT6ZmYBfUzxvHoylDzdpU8DI+/5RN1Lqj6IpHB8Cfobudk8sljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952725; c=relaxed/simple;
	bh=9sbzVV6llOu04fTO3K6Cau13mCo8kwbH+AgVIMepeO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wm/oZy4tcxuexBvD6ZmuRPDk34j1R/9weIoeF2BhocCK/CHg0EP0dkUwutMwTWvUGfc6WQkUvM1d8ls10sDEmaNNhSw7NTMnnO5gjJV0eIqRspw/bs4TtjomjzJxJoW+LVu9+HufYzRzY8JjWTDTZtPIeVhvnr33iaWQEem0gS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YReHS7ZX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YReHS7ZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955B61F000E9;
	Wed,  5 Aug 2026 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785952722;
	bh=hVATG2yJYnxFLG8GdhGttOFSziHYrDfQ+O7xBcYwrYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YReHS7ZXxQccvRyFyFQlbYGRPMd1excY8D4KkQ8bqpMxQr5OXKAu3rMTf7ve+TzEK
	 8CHSPLkdV4lkexgav5w5cMqgH5nTcpzeesTWC3Pey7ljynq4/et73mGXuAa1Wgei1J
	 bz4yPctKe6H/mn26F5B11VHA5/IJFyAgYBYZArps7a7nTVup+wXJvBE1ZbVfMdUn8T
	 5iyqjeOAMcdLXrfJKsFgnw89+iv37BqzSbT4Vu3gxGFwstBRlJXoWqqoqo8CoZ+Nol
	 1ELYaVd6VnVanzOehU5lF7XUB5h4dnrjJOfOrYOxK9qULSEYOaDmPRoG94PaJDFOkW
	 Jo1GfLEZmfTxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] w5100: restore GPIO-based link detection
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXJ0aHVyIENyw6lwaW4gTGVibG9uZA==?= <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804-wiznet-link-gpio-v2-1-3b1d0c870f35@marmottus.net>
References: <20260804-wiznet-link-gpio-v2-0-3b1d0c870f35@marmottus.net>
 <20260804-wiznet-link-gpio-v2-1-3b1d0c870f35@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 17:58:42 +0000
Message-Id: <20260805175842.955B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The devm-managed link IRQ outlives the manually freed network devi=
ce, leading to a Use-After-Free in the interrupt handler during driver remo=
val.
- [Medium] The threaded interrupt handler uses the non-sleepable `gpiod_get=
_value()` instead of `gpiod_get_value_cansleep()`, which will trigger a ker=
nel WARNING if the GPIO chip can sleep.
- [Medium] Race condition between the initial link state check in `w5100_op=
en` and the edge-triggered link IRQ, leading to a desynchronized carrier st=
ate.
--

--- Patch [1]: [PATCH v2 1/2] w5100: restore GPIO-based link detection ---
commit 48dd7a12d64614af31aae8617e2d9b17300b7e8a
Author: Arthur Cr=C3=A9pin Leblond <arthur@marmottus.net>

w5100: restore GPIO-based link detection

Commit dacf281771a9 ("w5100: remove unused gpio link detection")
dropped the link_gpio/link_irq handling on the grounds that no
devicetree user passed a "link" GPIO at the time.

This isn't a plain revert of that removal. The link GPIO is now
bound from the device tree link-gpios property using the resource
managed GPIO descriptors.

The link IRQ is also requested with devm_request_threaded_irq()
instead of request_any_context_irq(), so it is released automatically
on driver removal or probe failure.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> index 53d8dc642fbd6..1410a9fcfa921 100644
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c
[ ... ]
> @@ -616,6 +628,24 @@ static irqreturn_t w5100_interrupt(int irq, void *nd=
ev_instance)
>  	return IRQ_HANDLED;
>  }
> =20
> +static irqreturn_t w5100_detect_link(int irq, void *ndev_instance)
> +{
> +	struct net_device *ndev =3D ndev_instance;
> +	struct w5100_priv *priv =3D netdev_priv(ndev);
> +
> +	if (netif_running(ndev)) {
> +		if (gpiod_get_value(priv->link_gpio) !=3D 0) {

[Severity: Medium]
Will this trigger a warning if the GPIO controller can sleep?

Since w5100_detect_link() is registered as a threaded IRQ handler, it is
allowed to sleep. If the underlying GPIO controller is sleepable (like an I=
2C
or SPI expander), using the non-sleepable gpiod_get_value() will trigger a
WARN_ON. Should this use gpiod_get_value_cansleep() instead?

> +			netif_info(priv, link, ndev, "link is up\n");
> +			netif_carrier_on(ndev);
> +		} else {
> +			netif_info(priv, link, ndev, "link is down\n");
> +			netif_carrier_off(ndev);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
[ ... ]
> @@ -659,6 +689,14 @@ static int w5100_open(struct net_device *ndev)
>  	w5100_hw_start(priv);
>  	napi_enable(&priv->napi);
>  	netif_start_queue(ndev);
> +
> +	if (priv->link_gpio) {
> +		if (gpiod_get_value_cansleep(priv->link_gpio) !=3D 0)
> +			netif_carrier_on(ndev);
> +		else
> +			netif_carrier_off(ndev);
> +	}
> +

[Severity: Medium]
Can this race with the w5100_detect_link() IRQ handler?

If a physical link change triggers an interrupt right after the GPIO value
is read but before netif_carrier_on/off is called, the IRQ handler will run
and correctly update the carrier state.

Once the IRQ handler completes, w5100_open() will continue and overwrite the
carrier state with the stale value it read earlier. Because the link IRQ is
edge-triggered, no further interrupts will correct this desynchronization.

>  	return 0;
>  }
[ ... ]
> @@ -803,8 +849,29 @@ int w5100_probe(struct device *dev, const struct w51=
00_ops *ops,
>  	if (err)
>  		goto err_hw;
> =20
> +	if (priv->link_gpio) {
> +		int link_irq =3D gpiod_to_irq(priv->link_gpio);
> +
> +		if (link_irq < 0) {
> +			err =3D dev_err_probe(dev, link_irq,
> +					    "No corresponding irq for link gpio\n");
> +			goto err_gpio;
> +		}
> +
> +		err =3D devm_request_threaded_irq(dev, link_irq, NULL,
> +						w5100_detect_link,
> +						IRQF_TRIGGER_RISING |
> +						IRQF_TRIGGER_FALLING |
> +						IRQF_ONESHOT,
> +						"w5100-link", priv->ndev);

[Severity: High]
Does this introduce a Use-After-Free during driver removal?

Since devm_request_threaded_irq() is used, the IRQ is automatically released
by devres after the driver's remove function returns.

However, w5100_remove() manually frees the network device:

drivers/net/ethernet/wiznet/w5100.c:w5100_remove() {
    ...
	unregister_netdev(ndev);
	free_netdev(ndev);
}

If a link interrupt fires after free_netdev() but before devres cleans up
the IRQ, w5100_detect_link() will be called and dereference the freed ndev
pointer.

> +		if (err < 0)
> +			goto err_gpio;
> +	}
> +
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-wiznet-lin=
k-gpio-v2-0-3b1d0c870f35@marmottus.net?part=3D1
