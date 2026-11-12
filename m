Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510520;
	b=U9NVzeBjYp30c/Hqf6im1Y5UyJdAapgKE4eMl0gKFW2g/kw3sUKYhVHWDV6ExMjaAztG
	 wCVqz5hXZvDEVwcgAE1fkNZdLxC1lUol1RtkXzdJ5txGc/YGwbzGxw2xE8j+bKzEk/pav
	 EnjyYTaso2EB9asBlu4lDRV2Asr538esM2nOLwjwal0Q5Bg/bw0i9rJfyXqoua4VT/qUG
	 5/lEn6joBsgm2FsujSKKva3/Tu+kXrAWmHHnZ0OFNlEvf4rrwQC1pH7mjw2LqZgzNd89W
	 XalII8vVE1KwhazS1eyS5eCvPz3AW7jJ66nWLS+pQO9xUhPmpxUoYgcKyt/uKXf49vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iiSaMQzOzhlwg5YfP0vJhzy1vsAuPmG0Wiwm7O7S3bA=;
	b=IHVa/pp9ngF3yraFDaubj/DSR7trkI+SLnvDOTfCL3U7s0Nq9fkT4Xs+2yDv91w7q3oo
	 GrFhN0fWy1Vr8eDXiA7LtHWAH5Np4a4zwcAiRz4BVzKL3ZxQhOeUSZjKJhRunAV1nB6b0
	 7wksCLnKwv8DHCe7mudFcxZVKA54UDvKvBV8BpjIlb61qeC3vGU16ituqRkMXSalV30Fa
	 su5QW1UqOAVr1srOgFz39uhUj62nbdUxguIcbdHLiP4PD0fs/OujqjYTP5x9VPOm7l0Vv
	 JPAmXqYyRyaq4VO1UyZQaxcru22Y7zt7urEgPC5Opjn2OeiQWl7lasKdEaCIBBeKXTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ix0GeQnL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A760606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ix0GeQnL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1821F000C4;
	Thu, 12 Nov 2026 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510520;
	bh=iiSaMQzOzhlwg5YfP0vJhzy1vsAuPmG0Wiwm7O7S3bA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ix0GeQnLDCFIULxsluyCb1CGHMKk/WcoVDEEUCCtDJxvCLBUzcsYSHs3CjTvz0wtP
	 2utPRZGX6Q/yKzoudmBtHga/piYLmh0eN/NA8nBoiHuLwPYrQ92uqMbUp80sjV5C8N
	 c0U5UL0mhOf9OqqMV4hVeAqYvo5fwlyd3WFBupv0Tq8qW/YRiHCFgf8yJZz3En9/2y
	 QMvqWpVdrsko8RfxPHg5ymb4TcIq7nDEh+K2OAkqP4LYEEzVwOwVowtPv9QE76VDyo
	 mVEOnbnu7pEw0BT5736AGqlxL/FHhwNElbn/KrHLOBGaw+3G/y+ptqnQaytr00iEQ2
	 H4y2kqTDkRggA==
Message-ID: <sashiko-outbox-211745@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] i2c: mt7621: add support for Airoha AN7589
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112185820.1315718-4-john@phrozen.org>
References: <20261112185820.1315718-1-john@phrozen.org>
 <20261112185820.1315718-4-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:08:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] i2c: mt7621: unsigned underflow in mtk_i2c_init() divider
  clamp()
--

commit 36029923d9708d51405f55c0dcd224ddc5b82105
Author: John Crispin <john@phrozen.org>

i2c: mt7621: add support for Airoha AN7589

This commit adds match data to i2c-mt7621 to support the Airoha AN7589
variant, which uses an extended 16-bit clock divider in SM0CTL2 and
disables SCL stretching.

> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7=
621.c
> index 7a31cc8b89ce0..4a6504df0bc18 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
[ ... ]
> @@ -262,11 +296,16 @@ MODULE_DEVICE_TABLE(of, i2c_mtk_dt_ids);
> =20
>  static void mtk_i2c_init(struct mtk_i2c *i2c)
>  {
> -	i2c->clk_div =3D clk_get_rate(i2c->clk) / i2c->bus_freq - 1;
> -	if (i2c->clk_div < 99)
> -		i2c->clk_div =3D 99;
> -	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
> -		i2c->clk_div =3D SM0CTL0_CLK_DIV_MAX;
> +	unsigned long rate =3D clk_get_rate(i2c->clk);
> +	unsigned long div_min =3D 99;
> +	unsigned long div_max =3D SM0CTL0_CLK_DIV_MAX;
> +
> +	if (i2c->soc->ext_clk_div) {
> +		div_min =3D rate / I2C_MAX_FAST_MODE_PLUS_FREQ - 1;
> +		div_max =3D FIELD_MAX(SM0CTL2_CLK_DIV_EXT);
> +	}
> +
> +	i2c->clk_div =3D clamp(rate / i2c->bus_freq - 1, div_min, div_max);

[Severity: Medium]
Can div_min and rate / i2c->bus_freq - 1 underflow unsigned long here?

When CONFIG_HAVE_CLK is disabled (which is reachable via COMPILE_TEST),
clk_get_rate() returns 0, so div_min folds to ULONG_MAX while div_max is
0xffff.  That trips the BUILD_BUG_ON_MSG(statically_true(ulo > uhi)) check
inside clamp().

At runtime, if rate is smaller than I2C_MAX_FAST_MODE_PLUS_FREQ or
i2c->bus_freq, the unsigned subtraction also wraps to ULONG_MAX and
clamps i2c->clk_div to div_max instead of the minimum divider.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185820.1315=
718-1-john@phrozen.org?part=3D3
