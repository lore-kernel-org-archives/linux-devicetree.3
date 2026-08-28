Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE851A680B
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928982; cv=none; b=GvTqSngOVcpgHxXW8hD/PfzQvP2AvdGpToVLZjdMF7AG16vo8wHbqHmeXmcXTTlBQhM5hUovKfO4ZkP56N/qh2qw3oFCjsNRxFx99EOpUumspSXFyI//FTVREnrHCWAQ687aYLp+NSJvEoA32IIWe6syPPE/h3vhv3x2JdXgZic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928982; c=relaxed/simple;
	bh=+tRgaRnde7E2zEIHGzB8yKAnwIJauN9iFmg6NmtH6f0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HpTYTHdediSxbNIIZTQMPfahN79YBx18mWLkUVdtskhYy+e8wJ/WoEhK+aAY6M4ImxmDdC8VWJ9RKO3GL+X90YP/AL8qUOcvPQrC76cEGpvRIQfrLGrO5J1di3z7UheH1HT3rXQ/gyD+VQuizsg7g2b4EWrSoDNkEb9Fae/nRZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMGlAiHr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMGlAiHr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045E31F000E9;
	Fri, 28 Aug 2026 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787928981;
	bh=1GuHB5Y4UbuvIkYl2bbs2yVLMRACo/95c2P6aWdPsx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JMGlAiHrb7XrrxOqWi14qNPJp4VhzrEy3Q5J0E48/tQKzH3k5LkwC7HiZ9iFsOAug
	 tYgC+1wmLSJRdxO1UHmxj0jodsmi0g0IkirmnG2ghtjoWt1g/HiJa78fA601BvQ7oD
	 JpCrfvuO0Uljb9zBLLqhcBqiIgR4HAAB7AC+j8JWkQpfASSGSvzYasGU8l50ZXWCZz
	 2//puXa4CiYDXkLRiKhpOcXKb3LTDARr0OJYme3pbwAW+ZxuF1h1Krvg2oxhCPFaZ0
	 qcjoYuGooE3ba4WjKU9SaT/nu14o5KoJxpeLe0Ip1TvxGzVyTVI9j+2/8nS8bvN7iU
	 do853fN+emvkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: tegra186: Add support for Tegra268
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-tegra-tegra268-gpio-v1-2-317bd91295e2@nvidia.com>
References: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
 <20260828-tegra-tegra268-gpio-v1-2-317bd91295e2@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 14:56:20 +0000
Message-Id: <20260828145621.045E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Omitting Port X from `tegra268_main_ports` creates a zero-initiali=
zed array hole at index 7 that inadvertently overwrites Port T's interrupt =
routing configuration with zero, disabling its interrupts.
--

commit 8b9bac08700ce95c0c1a37f57510a697c2d7b282
Author: Jon Hunter <jonathanh@nvidia.com>

gpio: tegra186: Add support for Tegra268
   =20
Add support for the 3 GPIO controllers, main, AON and UPHY, that are
present on the Tegra268 device. Tegra268 has the same 3 GPIO controllers
as Tegra264, but a subset of the GPIOs. Therefore, we can re-use the
Tegra264 device-tree port definitions for Tegra268 and avoid duplicating
these.

> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index d9a2dedf50eae..34e084c95d7a9 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1419,6 +1419,71 @@ static const struct tegra_gpio_soc tegra264_uphy_s=
oc =3D {
>  	.has_vm_support =3D true,
>  };
> =20
> +static const struct tegra_gpio_port tegra268_main_ports[] =3D {
> +	TEGRA264_MAIN_GPIO_PORT(F, 3, 0, 8),
> +	TEGRA264_MAIN_GPIO_PORT(G, 3, 1, 5),
> +	TEGRA264_MAIN_GPIO_PORT(H, 1, 0, 8),
> +	TEGRA264_MAIN_GPIO_PORT(J, 1, 1, 8),
> +	TEGRA264_MAIN_GPIO_PORT(K, 1, 2, 8),
> +	TEGRA264_MAIN_GPIO_PORT(L, 1, 3, 8),
> +	TEGRA264_MAIN_GPIO_PORT(M, 1, 4, 2),
> +	TEGRA264_MAIN_GPIO_PORT(P, 2, 0, 8),
> +	TEGRA264_MAIN_GPIO_PORT(Q, 2, 1, 8),
> +	TEGRA264_MAIN_GPIO_PORT(R, 2, 2, 8),
> +	TEGRA264_MAIN_GPIO_PORT(S, 2, 3, 2),
> +	TEGRA264_MAIN_GPIO_PORT(T, 0, 0, 7),
> +	TEGRA264_MAIN_GPIO_PORT(U, 0, 1, 8),
> +	TEGRA264_MAIN_GPIO_PORT(V, 0, 2, 8),
> +	TEGRA264_MAIN_GPIO_PORT(W, 0, 3, 8),
> +	TEGRA264_MAIN_GPIO_PORT(Y, 0, 5, 8),
> +	TEGRA264_MAIN_GPIO_PORT(Z, 0, 6, 8),
> +	TEGRA264_MAIN_GPIO_PORT(AL, 0, 4, 3),
> +};

[Severity: High]
Does omitting Port X from tegra268_main_ports[] create a zero-initialized
gap in this sparse array that inadvertently disables Port T's interrupts?

The TEGRA264_MAIN_GPIO_PORT macro uses designated array initializers mapped
to explicit enum indices. By omitting Port X (index 7), the array has a
zero-initialized hole at index 7 with bank=3D0, port=3D0, and pins=3D0.

Later during the driver's probe phase, tegra186_gpio_init_route_mapping()
iterates up to num_ports:

drivers/gpio/gpio-tegra186.c:tegra186_gpio_init_route_mapping() {
    ...
    for (i =3D 0; i < gpio->soc->num_ports; i++) {
        const struct tegra_gpio_port *port =3D &gpio->soc->ports[i];
        unsigned int offset, p =3D port->port;
        ...
        offset =3D TEGRA186_GPIO_INT_ROUTE_MAPPING(p, 0);
        ...
        value =3D readl(base + offset);
        value =3D BIT(port->pins) - 1;
        writel(value, base + offset);
    }
}

Because the loop iterates without skipping empty entries, when it reaches
index 7, it maps the coordinates to bank 0, port 0. This overlaps exactly
with Port T which was already configured at index 0.

Could this cause the code to calculate BIT(0) - 1, yielding 0, and write
0 to the INT_ROUTE_MAPPING register, overwriting and destroying the valid
configuration previously set for Port T?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-tegra-tegr=
a268-gpio-v1-0-317bd91295e2@nvidia.com?part=3D2
