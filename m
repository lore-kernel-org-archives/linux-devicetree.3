Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CED478869
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114836; cv=none; b=daPpR/yhpfplhVHu/JKob4b3z78GqzdtSfRn8ezY0ws3Ad+45ef1cwJf6WlQLkmqrKmph6I5iaAFIKTuFpJafExdLIdD5DvjDgqCgyS3AzMTlLtO3Bz7ay6Qt/ObCXWjT27Zf16H28oUmnJ19cK2UhAd0azMtIItM7jxg/64UbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114836; c=relaxed/simple;
	bh=S39ZnEa3QM7csvKS38ktNMltaxIFTNGb1mmxJHFfb/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OYqlJU5GTbs0FuWHCp1TGFyMLMgys/hkeojQ7w+iBw03ZdEIdtq5UinUuLYexDldQxUpiXsuwewtDJ5eRPRD9ImVl/qq256lPZrUXyPnFMKJibv3bWhLOsKAfBA/eeivee4MDgySE7ft5KizYvxEVIHW6IixkOtQE5WZqfc87YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMnN8kOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMnN8kOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216CF1F00A3D;
	Fri,  7 Aug 2026 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786114835;
	bh=F+W3nvCgYt1F6U2tc0YVHnDANvPKOkmc52id0Zg9QUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VMnN8kOsvByrf0hGv0UwhkDQv8qEsFPsjH2E5dzfOs6L1N1vDl+ReW8wg85CH9bAr
	 5yhDEpowQjS2JC0uaZJucN5vsNbaPD5hfHWqTX3B24KbGYCD27WhyOYY+P7rtT11aL
	 DJ3lKO7CuGLVrIeXYNd70E7aGRAZozgLWamoHABLMCDVeCsXrMSON18JB56OhX26+U
	 t1xqrum5bPFKBPc5kr/tO7UqIqv4mu2L116ObgBI/wTKLM2l+8etApt7OjYU3VLABy
	 wAo0v6OH17QBL9DeWIoa343QSh69IlORttqGCQWzLzQwKOC6JR0H1O4hi+o7GKELrG
	 O2koW25yUMGwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/3] w5100: detect carrier state using link
 status bit
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXJ0aHVyIENyw6lwaW4gTGVibG9uZA==?= <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-wiznet-link-gpio-v3-3-532d4a143805@marmottus.net>
References: <20260806-wiznet-link-gpio-v3-0-532d4a143805@marmottus.net>
 <20260806-wiznet-link-gpio-v3-3-532d4a143805@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 15:00:34 +0000
Message-Id: <20260807150035.216CF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Using `devm_request_threaded_irq` for the link interrupt causes a =
use-after-free on module removal because the network device is manually fre=
ed before devres cleanup.
- [High] W5500 interface becomes permanently stuck with the carrier off if =
the cable is plugged in late and no optional link GPIO is configured.
- [High] Link detection is broken for W5100 and W5200 hardware when a link =
GPIO is used, as the driver always incorrectly reports the link as 'up' on =
every interrupt edge.
- [Medium] `w5100_get_link()` does not handle negative error codes from `w5=
100_read()`, causing SPI read failures to be misinterpreted as a valid link=
 state.

Pre-existing issues:
- [High] Early device registration in `w5100_probe()` exposes uninitialized=
 driver state and hardware to userspace.
- [High] `unregister_netdev()` is called after destroying the workqueue and=
 freeing interrupts, allowing active network operations to use destroyed re=
sources.
- [High] The probe error path unregisters and frees the netdev without canc=
eling pending asynchronous works, leading to a Use-After-Free.
--

--- Patch [3]: [PATCH net-next v3 3/3] w5100: detect carrier state using li=
nk status bit ---
commit 6726aad63717b1d64239168658010e6e77a6636c
Author: Arthur Cr=C3=A9pin Leblond <arthur@marmottus.net>

w5100: detect carrier state using link status bit

Detect the link status on the w5500 using the Link Status bit from the
PHY Configuration register.

Also add an optional GPIO line that can be wired to the LINKLED pin of
the w5500 as an interrupt to detect link status changes and read the
register.

On chip variants other than the w5500, which lack this register, the
link is always reported as up.

Commit dacf281771a9 ("w5100: remove unused gpio link detection")
dropped the link_gpio/link_irq handling on the grounds that no
devicetree user passed a "link" GPIO at the time and that it used the
old gpio interface.

This isn't a plain revert of that removal. It uses the new managed GPIO
descriptors so that the resources are released automatically on driver
removal or probe failure.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> index 53d8dc642fbd6..6707a6f273954 100644
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c

[ ... ]

> @@ -414,6 +418,16 @@ static void w5100_get_drvinfo(struct net_device *nde=
v,
>  		sizeof(info->bus_info));
>  }
> =20
> +static u32 w5100_get_link(struct net_device *ndev)
> +{
> +	struct w5100_priv *priv =3D netdev_priv(ndev);
> +
> +	if (priv->ops->chip_id =3D=3D W5500)
> +		return w5100_read(priv, W5500_PHYCFGR) & PHYCFGR_LNK;

[Severity: Medium]
Does this correctly handle negative error codes from w5100_read()?

w5100_read() delegates to SPI read functions which can return negative error
codes (e.g., -EIO or -ENOMEM) upon transfer failure. Because negative numbe=
rs
are represented in two's complement, an error code like -EIO (-5, which is
0xFFFFFFFB) will have the lowest bit set.

Could this cause the driver to incorrectly interpret an SPI read failure as=
 a
valid "link up" state?

> +
> +	return 1;
> +}
> +

[ ... ]

> @@ -616,6 +630,24 @@ static irqreturn_t w5100_interrupt(int irq, void *nd=
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
> +		if (w5100_get_link(ndev)) {

[Severity: High]
For non-W5500 chips (like W5100 or W5200), w5100_get_link() unconditionally
returns 1.

Since the new link GPIO interrupt is configured to trigger on both rising
and falling edges, does this mean any link state change (even a cable unplu=
g)
will be incorrectly interpreted as "link is up" on older chips because the
actual GPIO value is never read?

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

> @@ -659,6 +691,12 @@ static int w5100_open(struct net_device *ndev)
>  	w5100_hw_start(priv);
>  	napi_enable(&priv->napi);
>  	netif_start_queue(ndev);
> +
> +	if (w5100_get_link(ndev))
> +		netif_carrier_on(ndev);
> +	else
> +		netif_carrier_off(ndev);

[Severity: High]
If the cable is disconnected at open time, this explicitly turns the carrier
off.

If a board does not define the optional link GPIO in its devicetree, the
driver skips setting up the link IRQ. Since there is no fallback polling
timer implemented when the interrupt is unavailable, is there any mechanism
to detect when a cable is plugged in later, or does the interface remain
permanently stuck with the carrier off?

> +
>  	return 0;
>  }
> =20

[ ... ]

> @@ -751,6 +790,13 @@ int w5100_probe(struct device *dev, const struct w51=
00_ops *ops,
>  	priv->ndev =3D ndev;
>  	priv->ops =3D ops;
>  	priv->irq =3D irq;
> +	priv->link_gpio =3D devm_gpiod_get_optional(dev, "link", GPIOD_IN);
> +	if (IS_ERR(priv->link_gpio)) {
> +		err =3D dev_err_probe(dev, PTR_ERR(priv->link_gpio),
> +				    "failed to get link GPIO\n");
> +		priv->link_gpio =3D NULL;
> +		goto err_register;
> +	}

[Severity: High]
This is a pre-existing issue, but does registering the netdev this early
expose uninitialized state to userspace?

Later in w5100_probe(), register_netdev() is called before critical
initialization steps like allocating priv->xfer_wq, executing INIT_WORK(),
and performing a hardware reset.=20

If userspace attempts to use the device immediately after registration (e.g=
.,
via udev bringing the interface UP), could ndo_open() and transmit paths
execute on uninitialized hardware or attempt to queue work to a NULL
priv->xfer_wq?

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
Can this devm-managed interrupt trigger a use-after-free on module removal?

The devm cleanup runs after the driver's w5100_remove() callback returns.
However, w5100_remove() calls free_netdev(ndev) to synchronously free the
network device before returning.=20

If a link change triggers the interrupt during this window, wouldn't the
active threaded IRQ handler w5100_detect_link() execute and dereference the
already-freed ndev pointer?

> +		if (err < 0)
> +			goto err_gpio;
> +	}
> +
>  	return 0;
> =20
> +err_gpio:
> +	free_irq(priv->irq, ndev);
>  err_hw:
>  	destroy_workqueue(priv->xfer_wq);

[Severity: High]
This is a pre-existing issue, but is it safe to destroy the workqueue before
unregistering the netdev?

By calling destroy_workqueue() before unregister_netdev(), the network
device is still registered and active while its workqueue is being destroye=
d.
Could a concurrent packet transmission attempt to queue work to the destroy=
ed
workqueue?

>  err_wq:
>  	unregister_netdev(ndev);

[Severity: High]
This is a pre-existing issue, but does this error path leak pending
asynchronous work or cause a use-after-free?

If an error occurs after register_netdev() succeeds, the error path
unregisters and frees the netdev. Because the device was visible to userspa=
ce,
actions like ndo_set_rx_mode might have already scheduled priv->setrx_work
onto the global system workqueue.

Since cancel_work_sync() is never called for these global works before
free_netdev() is invoked, could the pending work execute later and
dereference freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-wiznet-lin=
k-gpio-v3-0-532d4a143805@marmottus.net?part=3D3
