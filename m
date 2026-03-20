Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670D027AC48
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029728; cv=none; b=l4hBhRDMPI3QqreKxe82TjFMthYYphfQBgbR+ei7XIh4cvSSsnEVYVT+F13gorJFU80P1xbQy1/gTU/5dKZ58JmR16detr4WqTcW6Qb8HoWRbXzYdNUY9J9qQjAygHIpiT2dbLBvJSHt8frH91uRLcz8isFX62kjiJahG/EINLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029728; c=relaxed/simple;
	bh=H5gU9h2LDuhmCwxdc44WNBFzgg5aMPEZxwZGz+ZhDAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AHmwoAgX/3EZBAxifJ3/sgik23kUe05HVezW09YivVo+hTsx6UGIRRB7najk6zTGB/LMcNHm7rE5M931FK6z3yM1KVb9C9azvAj59mlR1E+iPP1aBERZZGu+vxjBx738bsj1gW/oSXgv6h0h/SH9SN7VRjVlah1W1WJRGzgbybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=OeIV0rgv; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="OeIV0rgv"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8cd767d2d70so193461285a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029724; x=1774634524; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Onnst1Yk+/sF58VoWLFIxA1fIHkkY4f4Vk4kcTJKl0c=;
        b=OeIV0rgvLRjU3mkwzj/5s18UbCw/ox0v3JKYLo3uYoYxWCJNUO5wBsMNvg8rLLHHbi
         ydpZj6WWbaLhMESCLCN6UBmctdGvw9M20/32LLntIEuZ6JnWB1AvqcAuYxR7onlaqBz+
         r3Nh1K56XSMBLlQDlVIMviNIVuVAq1/ii/f/CsSV++hp4i7KUYMOWJUWQ51eYuOxkG4k
         Ue+QIzrlY8gi1HrM8/l2mnLJVHXn6sqdpHqIb92phAGxOWbrr1GpO0YfMNggpjKrLySN
         rLHL3812y+TRA8FVuGs2b+TFGwILp29aGyaUkoicNBT3I1EdwmWBr5uDmeJBbLnl33D3
         6u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029724; x=1774634524;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Onnst1Yk+/sF58VoWLFIxA1fIHkkY4f4Vk4kcTJKl0c=;
        b=FYsOH9hGI8mYV87GqzX12RxXmLAfrRmBTUapc91YAyhMlR6wxt4jAmvwMR5icnoHwc
         Xf/c+L0Bv07jp15dtqRZpKScIA9c54Zjhnc7unameNgOVSX09cnRWwIab6cmC++tgSTo
         Utrkcel2XAYH15UpHJsL7Wof31f8BP0lh+gFG1c4kcuaqEgyKkdUk/+9nKL5PxQneJjL
         8goIhwKOLqmlzYQX8s5mFkErFS06WYcqSmS+pOaa5QuR7gsRSEV0fKCZQz8CtpWCaEa/
         HHG4SYbdzxgTtTMXL/TPrSJS5Ykv1SyrubuDh9SAlT7m0P4sxPajvcJsfwMPxFxJNITs
         I2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXs6q+Yt8AkQWCAXxbdrOFg/1cWdkljTXfxkxNdNWapPAgFxd8pfgqI5FeLPc7XMP1G69pAQ5nluQM5@vger.kernel.org
X-Gm-Message-State: AOJu0YzV9TJRaodjVZIiSyaKw7ZD+8meRTmsY6tuHqjiBxmZcx1Vo28t
	qpHUxYBBrVCl4P3NBEtg/OjWy3XpAvIf162m/iz8q0U+NhxK5KgBHWnWdA2wgpjrESA=
X-Gm-Gg: ATEYQzyz0bcNoedK1ksKf1MIOWBimR38LkYJoZ/8cmfuEA13shVvXO1LlJoVFxthhEy
	CS28ONlJrgqWUUpLRUPao1ZPDmo9CxUwde2y7S937ikzk4Zq/cX7wBWjdfPZN2Tkgpjw1DLZkSE
	xyKPSukkXKTH+Shl/+mF91y331C/wnkNYDUs56f+TmjSiLjAKQjgPZJu6E3AEDURKJAi8dTz/SQ
	kCbdZpUh6kllekppN2Qb+0s63MtFLXskkH93q7E5Fe+hQxhl7HVNlSuPwSm1vBozFJOnWENH5wL
	jf1KmBLRtSHU6nCTp9r0I193q8PKJVvTf1UIemlhAZ5ynHzAk/AOLAhgTqJ03rv1LndBd//DH1q
	1vsl/EmvBP+yXEOsIF5ADrr/hzWnCpPXRIHHFPRpNoVmMu40Dd9dxhwE51r6bu+vRwp1yzgx/Pl
	lhiqP2/2xp+CT7NbuxvqYW6szx9sWn
X-Received: by 2002:a05:622a:258c:b0:50b:277f:3c46 with SMTP id d75a77b69052e-50b375f0215mr59663181cf.69.1774029724099;
        Fri, 20 Mar 2026 11:02:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e80cb9sm25129221cf.25.2026.03.20.11.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:02:03 -0700 (PDT)
Message-ID: <42883104d21844b34959945e9af161c92644bd81.camel@ndufresne.ca>
Subject: Re: [PATCH v3 25/27] media: rockchip: rga: disable multi-core
 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 14:01:59 -0400
In-Reply-To: <20260127-spu-rga3-v3-25-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-25-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-z2my5z6cvzeWllcl7dyY"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-z2my5z6cvzeWllcl7dyY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Disable multi-core support in preparation of the RGA3 addition. The
> RK3588 SoC features two equal RGA3 cores. This allows scheduling of the
> work between both cores, which is not yet implemented. Until it is
> implemented avoid exposing both cores as independent video devices to
> prevent an ABI breakage when multi-core support is added.
>=20
> This patch is copied from the Hantro driver patch to disable multi core
> support by Sebastian Reichel. See
> commit ccdeb8d57f7f ("media: hantro: Disable multicore support")
>=20
> Link: https://lore.kernel.org/all/20240618183816.77597-4-sebastian.reiche=
l@collabora.com/
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 47 ++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43644995c152e..e45b9c853d659 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -708,6 +708,49 @@ static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/*
> + * Some SoCs, like RK3588 have multiple identical RGA3 cores, but the
> + * kernel is currently missing support for multi-core handling. Exposing
> + * separate devices for each core to userspace is bad, since that does
> + * not allow scheduling tasks properly (and creates ABI). With this work=
around
> + * the driver will only probe for the first core and early exit for the =
other
> + * cores. Once the driver gains multi-core support, the same technique
> + * for detecting the main core can be used to cluster all cores together=
.
> + */
> +static int rga_disable_multicore(struct device *dev)
> +{
> +	struct device_node *node =3D NULL;
> +	const char *compatible;
> +	bool is_main_core;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret =3D of_property_read_string(dev->of_node, "compatible", &compatible=
);
> +	if (ret)
> +		return ret;
> +
> +	/* The first compatible and available node found is considered the main=
 core */
> +	do {
> +		node =3D of_find_compatible_node(node, NULL, compatible);
> +		if (of_device_is_available(node))
> +			break;
> +	} while (node);
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	is_main_core =3D (dev->of_node =3D=3D node);
> +
> +	of_node_put(node);
> +
> +	if (!is_main_core) {
> +		dev_info(dev, "missing multi-core support, ignoring this instance\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int rga_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga;
> @@ -718,6 +761,10 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	if (!pdev->dev.of_node)
> =C2=A0		return -ENODEV;
> =C2=A0
> +	ret =3D rga_disable_multicore(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
> =C2=A0	if (!rga)
> =C2=A0		return -ENOMEM;

--=-z2my5z6cvzeWllcl7dyY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2LmAAKCRDZQZRRKWBy
9MZsAQCqTBzD03pb+ti7XEpzLUwzJaRWq1EGrE7Yap2Xjv5SlQEAq+a51F+Itk6Y
QK1DHm1sCQVkk8iD50vTHHHekOqdxwk=
=poHg
-----END PGP SIGNATURE-----

--=-z2my5z6cvzeWllcl7dyY--
