Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930497;
	b=iCncGVpXtmNCY6Me7q7zJ7lyT30/swEg6Ff1v039jfMaScJLx6GgYkjcCttXTjNUe6md
	 HZYATOVrampllT2ad/oVEIbMOUj+XJidZd00wfv4nkdmehb54QAVg4utD63WYl4zIevGx
	 ZULR2pyiOVziFq5X7/sNn2gmTZTUys5yu4WP+pBn4IOrA/jZCrwX5ry1TIQcGdTzRXCjw
	 yQYCTWzwapu6Ko8zbB0TIOiMlbZKhRV/+PZKjGh20rIDWdv/zJMbfYgOsQTZZuSglWE/T
	 ITckSjpF/5dThuyevzIhpOLVL9HwRs6XZFx4GlVXD5ok76vjVUfEsFetCny8g7zS0gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930497;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=606mrV7NXxp3v4lx9Vet4gGxElTK6AqBs5xPL0gMyEA=;
	b=CKSsLA2GnoK96Wp5k6IDdswv9tEWqAfnT4QgpgASHyGYb5ZfLJy9dFJDSNO39AUyELQp
	 gy+vv9hwXYE/7Qyy8EneEmer8GeFe0C+1Jlqf+0waC19e7kIRpzzgDjIicIqzgycjUpKY
	 hwMozz/EU6Xg0IesvMNhw2aTYoiETyJyGauOJLhUt/Fgq9Gme3OPHjkfAdOdbdgRLxQ+a
	 BJ1tQYo5dkHnn/h/WlH5fIXsx90C6/3eL1k5LrlmND/2OGU5LECuDru8AI/Xl9nb4J283
	 oHIExGNs66xeY5xOQAQE1sYRRcb+30RtThjge3U7SJFyfrlKmY7+bl10t2/ICf/+SlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRUQuhAW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09318606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRUQuhAW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC2F1F000C4;
	Tue, 17 Nov 2026 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930496;
	bh=606mrV7NXxp3v4lx9Vet4gGxElTK6AqBs5xPL0gMyEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XRUQuhAWyrIwpXUrUMlL3JgW7cBDkrz1rx8EBlYUIVRI1Wq0nVvoSjnWNz9ywhE9k
	 X4m5QyKUKhSQRRukpuFB2XxGNbcfV8fZUj7/haciyaXtPL7HGHQfmPuWqWsLq+Ak0X
	 Y5bRfUQIWmT+0t3Nij2UE3BR1GAtKgehfWe0J5MmQJ8Ikvlt1tsO+k74QeqVbxXeW4
	 yKd9akEUaS4/cmbg4ZYk6GndyhsGuGNxDhSxmBI92ZF0DEHyTzalaDJPZsGCLdTRnb
	 TkCqb4VImPJqOwHaeQ8SjOzBiERrwh9szh9sDhg1OkehlW4FV4/tp2a+OlfxaATYaj
	 TA3M4AKzXm3gw==
Message-ID: <sashiko-outbox-219109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-6-32ff1546b0e4@collabora.com>
References: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
 <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-6-32ff1546b0e4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:48:16 +0000
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
- [Low] PM / devfreq: rockchip-dfi: kernel-doc mismatch on
  rockchip_dfi_variant
--

commit 56dc07283d381b00e4f393e46c72f76812bee4d3
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

PM / devfreq: rockchip-dfi: make RK3588 use its clocks

This commit adds optional bulk clock support to struct rockchip_dfi_variant
and populates the four DDRMON clocks for the RK3588 variant.

> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event=
/rockchip-dfi.c
> index 150fdf577e119..a97c63cdab57d 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -117,6 +117,18 @@ struct rockchip_dfi {
>  	const struct rockchip_dfi_variant *variant;
>  };
> =20
> +/**
> + * struct rockchip_dfi_variant
> + * @init: pointer to the variant-specific initialisation function
> + * @stride: address offset between the DDRMON per-channel instances
> + * @ctrl_single: whether only one DDRMON instance monitors multiple chan=
nels
> + * @max_channels: maximum number of memory channels for this SoC
> + * @clk_names: pointer to a constant array of constant clock name strings
> + * @num_clk: the number of elements in the @clk_names array
> + * @clocks_optional: whether not finding the clocks is non-fatal. Set if=
 the
> + *                   DT binding for this variant didn't require clocks i=
n the
> + *                   past, so that the driver remains compatible with ol=
d DTs.
> + */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
>  	int stride;
> @@ -124,6 +136,7 @@ struct rockchip_dfi_variant {
>  	unsigned int max_channels;
>  	const char * const *clk_names;
>  	unsigned int num_clks;
> +	bool clocks_optional;
>  };

[Severity: Low]
In the kernel-doc comment for struct rockchip_dfi_variant, @num_clk does
not match the member name num_clks, and the struct header line is missing
a short description, which triggers W=3D1 kernel-doc warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-rockchip-d=
fi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com?part=
=3D6
