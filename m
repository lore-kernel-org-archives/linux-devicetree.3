Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB02390995
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941123; cv=none; b=Ezdzq0ULCLMJPJ5AectA483qA5SWiLy9O8NVlPSDrRyQQHkTffS/08CZRqpjUCYHEzyI/hYYXxULl+frG4h6l61zAYrV/tDfmT/vAwBIiVMKL57T9U2KbRPJM26TrOmauRfsfZF7fKn79P9ZKEiAqhNp62OczKExCB5MOzW28Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941123; c=relaxed/simple;
	bh=cb5S5rq7t0/utZ7o46f1Ln7CN0UdYU63Kkxs+ed8l4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RPQvjPWEMvJ5WPfAXdDHmEUuc+rZns75BO1y37nvbf0Av+nIlOF26TrRHuS0HJqQ7GhwbE/dpm0B9dnJt/SW9Y7rs0LCiAySRgjs6nATsxMLM29a8u/L32+3N0HmYDyM0RSFCekQwxwtLwaVoHTsoLkD5ybm4FnokVbIas53/xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7Um3NRd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7Um3NRd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADB91F000E9;
	Wed,  5 Aug 2026 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785941121;
	bh=mswLvOkTmPsAN/4HfUz/+XejB06MJw0eujlTgjdOgAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7Um3NRdQ8STXafLhcmQyrA2CKzEjLLMdtLN/Szj0a0FjuYgCu4uHTieD5VbA2tb5
	 s5dfDbTM7M1tZnxLl5tXpWt0rbO000+koqvuYhNWX7l7DoUkLCwatH4nGkqWtR8hPE
	 iLa7tR03vo5E/+2P9Q2B0ZmHzYk23Qk1fOBWQk84GrFdON3orX7W/Cyf0o5/35MrA3
	 yuHxWYPfkwr3X/7Lk3FD3fb3ivH/pfTRaogZhz9OS0QQ7Wmh/4obwcZs1iGrUz6Vj3
	 1uZO8hS6LHFgaq5Y6Qve6kQsUdxQGDc3SdwgRIxlbsDO7xqdV0BCsHc9b3sZvwkyfB
	 0Hox/nQfN4vuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] w5100: restore GPIO-based link detection
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXJ0aHVyIENyw6lwaW4gTGVibG9uZA==?= <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804-wiznet-link-gpio-v1-1-b626fd4f7ccb@marmottus.net>
References: <20260804-wiznet-link-gpio-v1-1-b626fd4f7ccb@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 14:45:20 +0000
Message-Id: <20260805144521.6ADB91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The link_gpio descriptor is released via gpiod_put() before unregi=
ster_netdev() is called, allowing concurrent access to the freed descriptor.
- [Medium] Calling gpiod_get_value() instead of gpiod_get_value_cansleep() =
in the interrupt handler causes a WARN_ON if the GPIO is on a sleepable con=
troller.

Pre-existing issues:
- [High] register_netdev() is called before fully initializing driver resou=
rces, exposing an uninitialized device to userspace and causing a NULL poin=
ter dereference.
- [High] Workqueues are destroyed before unregister_netdev(), allowing work=
 items to be queued to a destroyed workqueue.
--

--- Patch [1]: [PATCH] w5100: restore GPIO-based link detection ---
commit cb90c7abab96f3cb827517717f36ffb68ab9ffc0
Author: Arthur Cr=C3=A9pin Leblond <arthur@marmottus.net>

w5100: restore GPIO-based link detection

This patch restores GPIO-based link detection for the w5100 driver, adding
back link_gpio handling that was previously removed.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> index 53d8dc642fbd6..c9d1891f37b98 100644
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c

[ ... ]

> @@ -616,6 +629,24 @@ static irqreturn_t w5100_interrupt(int irq, void *nd=
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
Since the link GPIO could be provided by a sleepable controller like an I2C
expander, should this be gpiod_get_value_cansleep() instead?

Calling the non-sleeping gpiod_get_value() in w5100_detect_link() can trigg=
er
a WARN_ON stack trace if the underlying GPIO controller requires sleeping.

> +			netif_info(priv, link, ndev, "link is up\n");
> +			netif_carrier_on(ndev);
> +		} else {

[ ... ]

> @@ -803,13 +850,40 @@ int w5100_probe(struct device *dev, const struct w5=
100_ops *ops,
>  	if (err)
>  		goto err_hw;

[Severity: High]
This is a pre-existing issue, but is it safe to expose the device to
userspace before its internal resources are fully allocated?

Looking at w5100_probe(), register_netdev() is called before priv->xfer_wq
is allocated:

w5100_probe()
{
        ...
        err =3D register_netdev(ndev);
        if (err < 0)
                goto err_register;

        priv->xfer_wq =3D alloc_workqueue("%s", WQ_MEM_RECLAIM | WQ_PERCPU,=
 0,
                                        netdev_name(ndev));
        ...
}

If a userspace daemon like NetworkManager immediately configures the interf=
ace
and attempts to send a packet, ndo_start_xmit will execute and queue work
onto a NULL xfer_wq pointer, causing a dereference crash.

> +	if (priv->link_gpio) {
> +		char *link_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-link",

[ ... ]

> @@ -822,6 +896,10 @@ void w5100_remove(struct device *dev)
> =20
>  	w5100_hw_reset(priv);
>  	free_irq(priv->irq, ndev);
> +	if (priv->link_gpio) {
> +		free_irq(priv->link_irq, ndev);
> +		gpiod_put(priv->link_gpio);
> +	}

[Severity: High]
Does this prematurely free the GPIO descriptor?

Since unregister_netdev() hasn't been called yet, the network device is sti=
ll
active in w5100_remove(). A concurrent ethtool command or interface up event
could call w5100_get_link() or w5100_open(), accessing the freed link_gpio
descriptor and causing a use-after-free.

>  	flush_work(&priv->setrx_work);
>  	flush_work(&priv->restart_work);

[Severity: High]
This is a pre-existing issue, but does this destroy the workqueue while the
network device is still fully active?

Looking further down in the w5100_remove() function:

void w5100_remove(struct device *dev)
{
        ...
        flush_work(&priv->restart_work);
        destroy_workqueue(priv->xfer_wq);

        unregister_netdev(ndev);
        free_netdev(ndev);
}

Since unregister_netdev() is called after destroy_workqueue(), a concurrent
packet transmission could trigger ndo_start_xmit and queue work onto the
already destroyed xfer_wq, resulting in a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-wiznet-lin=
k-gpio-v1-1-b626fd4f7ccb@marmottus.net?part=3D1
