Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC594AA01E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638118; cv=none; b=t1WAGiU3+7czUcOCuoExvDgc8dxiIbGGoSJz/C4BpA30Q/HVZjsZ5iBQQyaAZfLGTIDnP369Lyau6pdVWEPutoP9rh4ijTM1OfxYap8147XeFH4yt/mlvFhs9JXR9hkx21gglBdK0fqQ4b4+tEua4wtObzF3oZfvwwIF6tpxbCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638118; c=relaxed/simple;
	bh=lqZnHipy3IjLRTZB+jbeI2tFyj3mADolHHnXun34Ntw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ces5eUc0DO4oo812wTwzlQxI2DgG3DFTRgFrQyL3sxC+ErxZTfKnIMWwHkpDK93PI4a4Fs1sYmV1lklLzC4w5GSGwvVkYCSCXpqMMrzdwMf9lYRxol6HvkDv8/gBK7w5r6Hv4N1lAtBf3UgA3klWrLX9Sna626EYlncQgsr+nxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDv8CnB/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDv8CnB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18531F000FF;
	Sat, 10 Oct 2026 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791638117;
	bh=0z0afTyrzdqcLqQBXHvxIR+ekgMyD+Zp1xMiZZEuUPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VDv8CnB/EJMABhFW5qOcu3nQ3j98aGj2nSTet/MQikDzRY8HK8VvY6b0tgiq1vWsz
	 GUwoRPCYJyfoCtuy3DpVhlVSqtx0WQKsaYLnbyQ+l1V5l0A5AG3Oll0APYujln/bIc
	 pW44UsThfUJBCrtWSGghvXmfaXPcC+REJ80DTL6IkrjZrE5KWXx1S6wrHSALv/58Ew
	 8OwjDLf0cRrZseWj+WZKUvnXoNCQouLpZ7JSWe6qhuC660kMpeh7SOU2MIq1MNQ4Yg
	 dNDyNxxWc8HHHdOy7YmdB7ROgq2q55UyHtbU2RLpkxIbQyYyXmeQgVrAe/5/kY6GfD
	 wjjHJyvEEfywA==
Message-ID: <sashiko-outbox-166581@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/24] clk: zte: Add ZX279128S CRM clock and reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261010130024.177503-8-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-8-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:15:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mm: memory leak of 'rst' on reset_controller_register() failure
--

commit 89917541059d6bdb4e5407b41363569ca035d1d3
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

clk: zte: Add ZX279128S CRM clock and reset driver

This commit adds the ZTE zx279128s CRM clock and reset driver. It reads the
bootloader PLL and bus setup, and provides peripheral gates, muxes, dividers
and USB resets.

> diff --git a/drivers/clk/zte/clk-zx279128s.c b/drivers/clk/zte/clk-zx2791=
28s.c
> new file mode 100644
> index 0000000000000..1282d17fcfaff
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx279128s.c
> @@ -0,0 +1,460 @@

[ ... ]

> +static int __init zx_top_reset_init(struct device_node *np,
> +				    void __iomem *base)
> +{
> +	struct reset_simple_data *rst;
> +
> +	rst =3D kzalloc_obj(*rst);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&rst->lock);
> +	rst->membase =3D base;
> +	rst->active_low =3D true;
> +	rst->status_active_low =3D true;
> +	rst->rcdev.ops =3D &reset_simple_ops;
> +	rst->rcdev.owner =3D THIS_MODULE;
> +	rst->rcdev.nr_resets =3D TOP_NUM_RESETS;
> +	rst->rcdev.of_node =3D np;
> +
> +	return reset_controller_register(&rst->rcdev);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Does this code leak the memory allocated for rst if
reset_controller_register() fails? It returns the error code directly
but fails to free the locally allocated rst object.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D7
