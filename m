Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8231F9A7
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611791; cv=none; b=uBEmrC4HH4ilngSKxQuyX7AEmcXA0tJzoI+Wqk1ejmtNw0DbVqrcbAiwvmvsLMhGRLPhlwWZqQaa6/WW5wNnx24Lwg7O6GeDE8p21DvPoveNCYPeO27yn++rWbte7as7FAEgsqT/PX416xRNE9GqcF8cvSf1DtqHYhqyS1Men0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611791; c=relaxed/simple;
	bh=8XvsgREUbrkFcyQdrLnjUQZVD1pnTAU4PBy68MXnxN0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HHJrLdeGQi4T9g5XYplEfGZHhppHBLYCeh0E6sT74ULptgeSL9ViC63Q1hl+uVahzYOjG23FLg3J/H95YgPYGHFTC51d3EL2cnWaYn+o2fuEyGi1qfPden4Pb2GRmgD5HoTf/vwcPZur+9b4Or38cclD45TseAZi9ubO64SlV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baVhKTaZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baVhKTaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1171F00A3E;
	Sat,  5 Sep 2026 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788611789;
	bh=2PGQ6DVfMZWXFsCPCgpN3DV9tL58QrWOWehfzUZ36F8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=baVhKTaZMTbrAUSXXu4vMN10tIk2M2u0CgxI3o//wTkYmxO+RQ75ZWZ4Iy7HB+7/c
	 /Q57esn6Tm80wSO9uAOYlGwpYDxJo2dlNezbRLoeA6IGlAK2bIaxjZUKhRTZH83T4u
	 UGUtaIed9XNkJL+cynmGqA6nESlWJw8LQD87xzRgD8MZ8+uA/nQBoLohs3iwKZVMS+
	 UJ37xJp3Dzdg0ck0RqyXy77V4+bmw6HM7cCmVAV5p6V6EAbkL+U9g7+Qx+MW8TzY3M
	 OsAKbLx5ppn5G8tXRBrw0dw8y+p96fhI2udAUrb6nspMqiPrf+ckNkaF/Uf+tE+q/R
	 8Aw9aSdrZLH1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260904-wiznet-link-gpio-v7-3-69f01b70c96f@marmottus.net>
References: <20260904-wiznet-link-gpio-v7-0-69f01b70c96f@marmottus.net>
 <20260904-wiznet-link-gpio-v7-3-69f01b70c96f@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 12:36:29 +0000
Message-Id: <20260905123629.8D1171F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Interface becomes permanently stuck in NO-CARRIER if brought up wi=
thout a cable and link_irq is not provided.
- [Medium] Race condition in w5100_open() and w5100_resume() causes permane=
nt incorrect carrier state due to stale read.
--

commit 25ad966bc1cae0a5e447949792be215c893866af
Author: Arthur Crepin Leblond <arthur@marmottus.net>

w5100: detect carrier state using link status bit and optional interrupt

This commit adds link status detection for w5500 devices using the PHY
Configuration register. It also introduces an optional interrupt to track
subsequent link state changes.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> index 53d8dc642fbd6..ecb99621d0a1e 100644
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c

[ ... ]

> @@ -659,6 +711,15 @@ static int w5100_open(struct net_device *ndev)
>  	w5100_hw_start(priv);
>  	napi_enable(&priv->napi);
>  	netif_start_queue(ndev);
> +
> +	if (priv->link_irq >=3D 0)
> +		enable_irq(priv->link_irq);
> +
> +	if (w5100_get_link(ndev))
> +		netif_carrier_on(ndev);

[Severity: Medium]
Could this introduce a race condition where a stale link state overwrites
a newer one? If the physical link state changes exactly after
w5100_get_link() reads the hardware register but before this thread
evaluates the result, the newly unmasked edge-triggered interrupt handler
might run first. The handler would read the new state and update the carrie=
r,
but then the main thread would resume and apply its stale read, overwriting
the correct state. Since the interrupt is edge-triggered, no further
interrupts would correct this until the link changes again.

> +	else
> +		netif_carrier_off(ndev);

[Severity: High]
Does this leave the interface permanently stuck without carrier if the
link_irq is not provided? If the interface is brought up while the cable is
disconnected, this explicitly calls netif_carrier_off(). Without the option=
al
interrupt (which is the case for most legacy device trees), there appears
to be no polling mechanism to ever turn the carrier back on when a cable is
subsequently plugged in.

> +
>  	return 0;
>  }

[ ... ]

> @@ -857,6 +952,12 @@ static int w5100_resume(struct device *dev)
>  		w5100_hw_start(priv);
> =20
>  		netif_device_attach(ndev);
> +
> +		if (priv->link_irq >=3D 0)
> +			enable_irq(priv->link_irq);
> +
> +		if (w5100_get_link(ndev))
> +			netif_carrier_on(ndev);

[Severity: Medium]
Could this face the same race condition as w5100_open()? The edge-triggered
interrupt is enabled before the local state read, so a concurrent physical
link change could trigger the interrupt handler, update the carrier, and
then be overwritten by the stale state read here.

>  	}
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-wiznet-lin=
k-gpio-v7-0-69f01b70c96f@marmottus.net?part=3D3
