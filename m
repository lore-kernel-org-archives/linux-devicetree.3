Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA582D8762
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618486; cv=none; b=dBp5KDu8mT9iEUjL0xilzrp+eZwMDdnFOzXVhOr+h+BYku2TrNG2tFafmzPuz0rZ6Ecv6cImvo5r6b4KHpDTrSI4uMxysbn62L+N02GoaVumnPGeRmOa1SbmBQUmV+KJkC38AiotjUu9sKMl2xXqY/op/8dIvmOUMQpZ1PAYGB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618486; c=relaxed/simple;
	bh=cdxg4lDdDL8JiItbxIV0pslnSrGYRVyC4GIAkbKQta4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=avC9RkdQvSJtYACEPz+T4vNJf2LryqJ5gZbkj0pGgxk8cJRlgZUUp4z4BqbDSbKNO9TlIgS1Ht2TyJoTdXKNHkixOF9WjOlpyP2k/A7Zjj5Lh6g9stqDrLZbUPXaxJGx+Sy4MCsK0KrZMKkmVfTtaAXe4MGYSDQzl5O+iYas7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUKKnoBq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUKKnoBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A55A1F00A3D;
	Tue, 21 Jul 2026 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784618485;
	bh=pTLTBl3hGZ5qngcN4DiWZhg2v0RiX4jScLGVHre3RHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DUKKnoBq5DbAlxtj04NqUgK8TX3YkNYYV5I4BeJyvvGjyUvyWbuNOxLkeyNfSIVcd
	 WORxAWRTWSb/Y//8XGDJkEJC3JS5HQiw+VY7r1uuay8yU1SzYHxL40lzjmXjRXM1TS
	 /zTTLUK6bN1LCa03zfOHuAQcwzuAvcVuavLvJHnj8r6k3iBMOb1Z+ph6ONTt8obpZF
	 n4dwAc0WLvX1a112TtIjrc6BPifj1tgjGb/ZhHo2XGqXqYj2QIHcEWynNXUgCkBWdH
	 CkilcV2qBcgVwSiCRzQOBNIjTEdnE86L7sNM6iuSgkfCTiGhOjfq+aspDadeOC4HK3
	 ummRUyuI/NKNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] drm/bridge: ti-sn65dsi83: Add reversed lvds
 lanes support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wojciech Dubowik" <wojciech.dubowik@mt.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721071253.1098652-4-wojciech.dubowik@mt.com>
References: <20260721071253.1098652-1-wojciech.dubowik@mt.com>
 <20260721071253.1098652-4-wojciech.dubowik@mt.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:21:23 +0000
Message-Id: <20260721072124.9A55A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing error check causes genuinely malformed 'data-lanes' prop=
erty to be silently ignored.
--

--- Patch [3]: [PATCH v6 3/3] drm/bridge: ti-sn65dsi83: Add reversed lvds l=
anes support ---
commit b4313ac661e9afa3be192ed6d9fd4791e5f7c33a
Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

drm/bridge: ti-sn65dsi83: Add reversed lvds lanes support

This commit adds support for parsing an optional "data-lanes" property to
configure the ti-sn65dsi83 chip when LVDS output lanes have been reversed,=
=20
allowing it to program the corresponding hardware registers accordingly.

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index 1869ebe13366c..e1b6e22bed359 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c

[ ... ]

> @@ -845,6 +863,19 @@ static int sn65dsi83_parse_lvds_endpoint(struct sn65=
dsi83 *ctx, int channel)
>  	else
>  		return -EINVAL;
> =20
> +	ret_data =3D of_property_read_u32_array(endpoint, "data-lanes", data_la=
nes,
> +			ARRAY_SIZE(data_lanes));
> +	if (!ret_data) {
> +		if (memcmp(data_lanes,
> +				supported_data_lane_mapping[LANE_MAPPING_REVERSE],
> +				sizeof(data_lanes)) =3D=3D 0)
> +			ctx->lvds_reverse_lanes_conf[channel] =3D true;
> +		else if (memcmp(data_lanes,
> +			   supported_data_lane_mapping[LANE_MAPPING_NORMAL],
> +			   sizeof(data_lanes)) !=3D 0)
> +			return dev_err_probe(dev, -EINVAL, "invalid data lanes mapping\n");
> +	}
> +
>  	ret_data =3D of_property_read_u32_array(endpoint, "ti,lvds-vod-swing-da=
ta-microvolt",
>  					lvds_vod_swing_data, ARRAY_SIZE(lvds_vod_swing_data));

[Severity: Medium]
If the "data-lanes" property exists but is malformed (for example, containi=
ng an
incorrect number of elements and returning -EOVERFLOW), ret_data will be
non-zero and the error is ignored. The ret_data variable is then immediately
overwritten by the next property read.

Should we check for error codes other than -EINVAL (which indicates the opt=
ional
property is absent) and return an error, rather than silently ignoring malf=
ormed
device tree properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721071253.1098=
652-1-wojciech.dubowik@mt.com?part=3D3
