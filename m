Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5820E023
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070376; cv=none; b=boFzi/i7yHkzbmfWe8cSt98xIsSkYv8OrW+jfZkBoW1ntGp73tr/wSljRU3r8O3xkwmrsIM2voYmro/nK4IkcHZHud1hySEBVU/KS9Z9phH6IcubkYOergq6LU86/N8paTzQxkWX+HW8cCJ5D3vKlHOwFY4z7mP0kElkP5yX4VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070376; c=relaxed/simple;
	bh=gzxO7g/dKMIYNs6apNOkwQJBj84VQatAJl6wnz6Ol3A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=V1HWenlvn6EwtmWWMssjxbWJ7mcuF41Mal2n3A+7djIOcnPpHS8a1gIvg6pxY0s8wRhq2h7rBHVS28yLdf9jKQx3QdgHjcVBVINTFroiBQqMwVjZDGlJ7np0msu26oWAPvYSEagAt7qHWuWnoy9fEUH0lunwT7SkQbtiMryIJck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLH0Bg+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLH0Bg+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427651F000C5;
	Thu, 15 Oct 2026 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070372;
	bh=R5sFiZGx+jK4yQvnjyVxS1kcotV7+vknQwu/08l+7Xw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aLH0Bg+0P6FN+C9P2P07N7mWhTLxqbqfF0f6l1d/OxUrOxhZMdYe0IaC/KMJ0YS+7
	 HRQzwO0eovB7STTvqc+TPkwx7iw7zVDGcOaJb102RvyFhEMQNDND8CxszefDqOqyMh
	 n5JfiSnGqabz4bavxICU1ALw4D1IAuPISocEvx/NCnyReVLZyazl0pxkEX6erMtKuk
	 H7NK86pogoqFceSYFroeRjBhrobiDzhFZ8lp9DIikXHhVj74piVWxsSSYbg+pHT3p3
	 uCuF8StevAu4Fm4CITgNqr0eNBslOlb2oyPdkS09nWEDE1kfHWWcZmup69hKoQlrkU
	 ThP4kr1CDxyXw==
Message-ID: <sashiko-outbox-172919@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 09/13] net: dsa: rzn1-a5psw: Get switch info
 via OF data
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261014131906.990077-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261014131906.990077-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:19:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: rzn1-a5psw: missing NULL check for of_device_get_match_d=
ata
--

commit d0e877d4584f59434a728598a2547f8f5e97b982
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Get switch info via OF data

This commit introduces an a5psw_of_data structure to hold per-SoC switch=20
information, replacing previously embedded constants to support newer hardw=
are=20
variants with different port counts.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index bdfa84745eda4..c8197ef62fd2d 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
[ ... ]
> @@ -1226,7 +1228,8 @@ static int a5psw_probe(struct platform_device *pdev)
>  	if (IS_ERR(a5psw->base))
>  		return PTR_ERR(a5psw->base);
> =20
> -	a5psw->bridged_ports =3D BIT(A5PSW_CPU_PORT);
> +	a5psw->of_data =3D of_device_get_match_data(dev);
> +	a5psw->bridged_ports =3D BIT(a5psw->of_data->cpu_port);

[Severity: High]
Does this code dereference a NULL pointer if the driver is bound via sysfs?

If a privileged user manually binds the driver to a platform device via sys=
fs=20
(e.g., using /sys/bus/platform/drivers/rzn1_a5psw/bind) that lacks a device=
=20
tree node (dev->of_node is NULL), of_device_get_match_data() will return NU=
LL.

Since a5psw->of_data is dereferenced immediately on the next line in=20
a5psw_probe() without any validation, this could lead to a kernel panic dur=
ing=20
probe. Could a check be added here to safely handle a missing OF match?

> =20
>  	ret =3D a5psw_pcs_get(a5psw);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014131906.9900=
77-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D9
