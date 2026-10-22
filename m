Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691131;
	b=tfbffdPSnzdD5mFxjtWLLJZ8KaKKRgesR7yCId17N2u1WYgO1ecO3rRs7p4I6gZloPct
	 Lxk6xgk5nkrY6xjCyTgyydYATgWUyQKh6VtLbQeoEStXhDZBe71dEAnPSBPsHJoLrPpkS
	 Wv4bVDp9flEIsS2j28RlSYbk0fN3M2Wk0iwWzg3yu5OyTQyN654Jxcg8mAA2LvzpbYzQO
	 ymhLlKAS01sl74/xmJ8C88bEQsdLYtqH/K6793IROSwnsk4NmdrOfuh8D582JBTjmlboJ
	 PHUpdn0lBI8u5CSC7BD7GAvzaPq4xneTTBi0e2s+L+jaF1ND0BWtTZXGdAYDPUaUeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tLk92lYKWLkFW4Y/L1cCSqM3az3GGQIUkJZFcbWn/8o=;
	b=e7AXhUdG6+j7uNp6LDKKiDg64OK9vDj1jpJLnSK0EuQu5l+bmoJcpr4pU4VyAVV8TcPO
	 y+QwWbq+ET9QeAlV4cLcgl/WXSg7OsvDDMQ0n9sXrjbS1vUSB5q7lTllU70oYSH0Qpkru
	 s8U0ePFidITadWJqPuz/3lxyuAMws4SXfdhRJG6K3YuhV6XnQBfqKfLdzYnttxX/zXL8n
	 JL6oO0Y3+U/31KLhVOpgeGAM6GBPkUYm4cPr0snRQYwhmYUb1nXorHjMxdeHWJ3nrIx4o
	 o8JXYDy4RxIM7KDPcZPAq3afD7GF7pVxwzw1T4wzBTSjUS0vGP9XXhfIhHJfxdh8vew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PoHbkX3u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBCD606A32A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PoHbkX3u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0D81F01828;
	Thu, 22 Oct 2026 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691131;
	bh=tLk92lYKWLkFW4Y/L1cCSqM3az3GGQIUkJZFcbWn/8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PoHbkX3uSq05uf4GDJGjxH6/p1vMDjYe+ClMdyz3O8TmQqnyh2EbO/Yk0UJzxRPxK
	 znZiZEM5I6mSMkj553ptwI52nGd0VJ2QkKF3Vt5Z26BFB4dyzgQrHkImJumGuMCMqP
	 0xVH+Y4wxQssT3Pre4ggY9E8QU4FkUXPmEIxgIf7dKinjO80RtUg5+bVC5sYFJvG5W
	 49mO88614hABoGe90amQBzqe1Vzig/4gZ1mqg9ccbS6NlqTlQhOItXNZrNn26x6bQZ
	 IUiEad3ot/ArQhpreKJhko6580bxY9ay54Vt7RoiP0SXQKPXAeQQodfjLH3xrcUEad
	 TlHF7i13t6iQg==
Message-ID: <sashiko-outbox-181884@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 18/18] media: sony-starvis2: Add support for IMX676
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261022-media-starvis2-v6-18-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
 <20261022-media-starvis2-v6-18-374343f55fd3@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 17:45:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: sony-starvis2: missing static qualifier on imx676_variant_def
--

commit ad4e5f8fc225f04551d4a1deea68f04e64abc8ec
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: sony-starvis2: Add support for IMX676

This commit adds register definitions, variant parameters, and compatible
strings to support the Sony IMX676 12.63MPix Starvis 2 sensor.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index 5c407211edc81..8e574a9e920fd 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
> @@ -1380,6 +1380,179 @@ static const struct starvis2_variant imx585_varia=
nt_def =3D {
>  	.shr_min =3D 8,
>  };
> =20

[ ... ]

> +static const u16 imx676_min_hmax_2lane[] =3D {
> +	[STARVIS2_LINK_FREQ_297MHZ] =3D 2744,
> +	[STARVIS2_LINK_FREQ_360MHZ] =3D 2277,
> +	[STARVIS2_LINK_FREQ_445MHZ] =3D 1854,
> +	[STARVIS2_LINK_FREQ_594MHZ] =3D 1410,
> +	[STARVIS2_LINK_FREQ_720MHZ] =3D 1176,
> +	[STARVIS2_LINK_FREQ_891MHZ] =3D 965,
> +	[STARVIS2_LINK_FREQ_1039MHZ] =3D 838,
> +	[STARVIS2_LINK_FREQ_1188MHZ] =3D 743,
> +};
> +
> +const struct starvis2_variant imx676_variant_def =3D {

[Severity: Low]
Should imx676_variant_def in drivers/media/i2c/sony-starvis2.c be declared
static, matching imx585_variant_def and the other starvis2_variant definiti=
ons
in this file? Without static, building with sparse or W=3D1 warns about an
undeclared global symbol.

> +	.name =3D "imx676",
> +	.id_reg =3D CCI_REG16_LE(0x4d12),
> +	.id_mask =3D 0xfff,
> +	.id_value =3D 0x676,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-media-star=
vis2-v6-0-374343f55fd3@raspberrypi.com?part=3D18
