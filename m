Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DC3B3C12
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267277; cv=none; b=QoRpyfCUm58AtuNpVhEmqazxfK5SVk/3N5bot6L7EhsQQhG4GUOwhYAf/C2kR3OtXUFNksoE3wP6zUgk+ccu/PSTY6GzExZGDWdZmdTVvPDnm8D3o2iyVEVbplSq0K2qos9TZo95u5Ff+xuiURj+9QeuGxyGro302+lNdzsgB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267277; c=relaxed/simple;
	bh=9TcnNyUB0tW2wEpWiM9pRC7FXQYnA8niZqFHIpUuxAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BSiff16abFfmTcoI2mPNmTR95cOgO2ozTBVxQmdtxZtv+GfeeJUtCT9MC5yYSk3hRIKcfixCqpmrzDOQJmItsdHU3l4VKKtTQFyA4tLGvkhxy6rzibWNOGCBaj4dLl1xiiCGhZnlnx/CxH6qoc2e0FCXpOTAz/awVC7cJXoiehI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzb/ZoI5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzb/ZoI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B17F1F000E9;
	Tue,  1 Sep 2026 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267275;
	bh=c33OJOqFwQbhfL9wwL7F5KTNJJu7ExfYd7jpL6bpZgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kzb/ZoI57fneTmtZfGCLGfcT18nDAeI3cF0E2F9pXll5W0ZdzY98sQuGKUDw6VjFY
	 EZVPy1hMWIpuEiV4NJgll2gXv06Ok0xLXc48Pn/jEz3rkw7vNdz6IK+sMsLr1yhmTI
	 hMXW5IIpJ2h1MLxzATFEWg3GfQSc5haGMWjnLoarmVJz0w/ih2RoE31jrCUS6WTKIo
	 o3LZUDm5bc3LndL/s3p/aplOEzDBAL6gmJQLpOtFKQoMympSCeozBWH1DBlGLw330q
	 PZGj4wH6LGRkHzxpnSXYdoO68M6fyN4ut8FmgOYC6eudqFHGEI1amZu/NSEXDnvYxa
	 pB7seK963IPJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831-wiznet-link-gpio-v6-3-abee6c5c966e@marmottus.net>
References: <20260831-wiznet-link-gpio-v6-0-abee6c5c966e@marmottus.net>
 <20260831-wiznet-link-gpio-v6-3-abee6c5c966e@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 12:54:34 +0000
Message-Id: <20260901125435.3B17F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Teardown order and race condition in `w5100_remove`
--

commit 2d15b81e4c22951dac168989fccf463a39479cef
Author: Arthur Crepin Leblond <arthur@marmottus.net>

w5100: detect carrier state using link status bit and optional interrupt

This commit detects the link status on the w5500 using the Link Status
bit from the PHY Configuration register. It also adds an optional
interrupt wired to the LINKLED pin of the w5500 to detect link status
changes, and registers the netdev last in the probe function.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> index 53d8dc642fbd6..d91881ecd797c 100644
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c
[ ... ]
> @@ -667,6 +722,10 @@ static int w5100_stop(struct net_device *ndev)
>  	struct w5100_priv *priv =3D netdev_priv(ndev);
> =20
>  	netif_info(priv, ifdown, ndev, "shutting down\n");
> +
> +	if (priv->link_irq >=3D 0)
> +		disable_irq(priv->link_irq);

[Severity: High]
In w5100_stop() (drivers/net/ethernet/wiznet/w5100.c), can w5100_remove()
and w5100_stop() race here?

If an interface shutdown (ndo_stop) executes concurrently with w5100_remove=
(),
w5100_stop() could evaluate priv->link_irq >=3D 0 to true, get preempted, a=
nd
then call disable_irq() after w5100_remove() has already freed the interrupt
descriptor.

[ ... ]
> @@ -820,14 +902,20 @@ void w5100_remove(struct device *dev)
>  	struct net_device *ndev =3D dev_get_drvdata(dev);
>  	struct w5100_priv *priv =3D netdev_priv(ndev);
> =20
> +	if (priv->link_irq >=3D 0) {
> +		free_irq(priv->link_irq, ndev);
> +		priv->link_irq =3D -ENODEV;
> +	}
> +
>  	w5100_hw_reset(priv);
>  	free_irq(priv->irq, ndev);
> =20
> +	unregister_netdev(ndev);

[Severity: High]
In w5100_remove() (drivers/net/ethernet/wiznet/w5100.c), does this expose
the driver to concurrent operations on reset hardware?

unregister_netdev() is called after w5100_hw_reset() and free_irq(), which
means the network stack might still be actively transmitting or calling into
the driver while the hardware is in a reset state.

This is a pre-existing issue, but this change exacerbates it by introducing
the link_irq race described above.

> +
>  	flush_work(&priv->setrx_work);
>  	flush_work(&priv->restart_work);
>  	destroy_workqueue(priv->xfer_wq);
> =20
> -	unregister_netdev(ndev);
>  	free_netdev(ndev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-wiznet-lin=
k-gpio-v6-0-abee6c5c966e@marmottus.net?part=3D3
