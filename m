Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52D5678FA
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962287; cv=none; b=EsHldIYQGwnhLF3wthaS8fxIjMFBeTDsFFUwmLU4ECjuGYXMNve9MYAb82zjqzoOLZq4v8nLX9xEiX8Zn4XFDUnlRDiLnc2pbuNt0o8fTcH+ftHIDdK31q/COf9Bbw/ymOeW/fmOTO2gQVl79mK6SnIlzzIJfjvu54zRqbBGG40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962287; c=relaxed/simple;
	bh=CcKAjDss9MmchJrCmUEW6HzwblPM9ix3CqLeRPrag+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tXtah6oh5ji3zwBkDqcVCLfJOL0UUOqyR3rmR3QeEYtzeefWBqS+t9eFbrv52ZBjvi0FfIxcXs4ogB0tZjag+mQ/4/aXT7yCQ+Hayg+6tTSx+1ItQ3qeW+XsxDHEMnaTU111E4LYeqaQfBtpW3yvntqrdls8ou29Lnyin1m6Izk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVskkqsB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVskkqsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFBB1F00A3F;
	Wed,  9 Sep 2026 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788962286;
	bh=8dgx8m0Hye6PYZGfyqfJcDvM+fniSOb72l8VZVinduc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVskkqsBhvuFeQtZRyWS736OWphyyeSvKU7kw3TPj5MhcFKVkXTwoeeu/BcYhZeaG
	 g/bqyHGwDEKfSMEx2VEHbFDqRoLf5B1UHH8PVioYl5pIn40YjTELtEH3wIJiRoMJFy
	 I+0LCUD5xHV82RKS0VIMUFq2IIYOUW0B/g0GTWsqBOFohW4iRxbiLRwYOFJRSGVQZJ
	 7uaJa5JgjMGg5B3q5/hmQ9PtyPN8yRmIcXqorswX3hsGARev3nCjxIyC9m6p/b+ONG
	 1ioAt6+RHFpk4FlszN2NZYe0BPlk/R6fqzICCd6a2xzF3XvdN6tv2Zdso94xSON8zk
	 Wl/ipeWizBVBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 20/22] media: i2c: maxim-serdes: add MAX96724 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260909-gmsl2-3_serdes-v17-20-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-20-002499e534e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:58:05 +0000
Message-Id: <20260909135805.DCFBB1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] TOCTOU race in stream enablement leads to a kernel stack out-of-bo=
unds read and info leak via Virtual Channel mapping.
--

commit 09e380cc5beec37cc922ac65a1a89a282d99562a
Author: Cosmin Tanislav <demonsingur@gmail.com>
Subject: media: i2c: maxim-serdes: add MAX96724 driver

This commit adds a new MAX96724 driver that supports MAX96712, MAX96724F
and MAX96724R quad deserializers. It integrates the devices with the common
deserializer framework.

> diff --git a/drivers/media/i2c/maxim-serdes/max96724.c b/drivers/media/i2=
c/maxim-serdes/max96724.c
> new file mode 100644
> index 0000000000000..458e78f285111
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96724.c

[ ... ]

> +static int max96724_set_pipe_remap(struct max_des *des,
> +				   struct max_des_pipe *pipe,
> +				   unsigned int i,
> +				   struct max_des_remap *remap)
> +{
> +	struct max96724_priv *priv =3D des_to_priv(des);
> +	struct max_des_phy *phy =3D &des->phys[remap->phy];
> +	unsigned int phy_id =3D max96724_phy_id(des, phy);
> +	unsigned int index =3D pipe->index;
> +	int ret;

[ ... ]

> +	/* Set destination Data Type and Virtual Channel. */
> +	/* TODO: implement extended Virtual Channel. */
> +	ret =3D regmap_write(priv->regmap, MAX96724_MIPI_TX14(index, i),
> +			   FIELD_PREP(MAX96724_MIPI_TX14_MAP_DST_DT,
> +				      remap->to_dt) |
> +			   FIELD_PREP(MAX96724_MIPI_TX14_MAP_DST_VC,
> +				      remap->to_vc));

[Severity: High]
Can a TOCTOU race in stream enablement lead to a kernel stack out-of-bounds
read and an information leak here?

When max_des_update_streams() is called, it fetches the remote sensor's fra=
me
descriptor twice: first in max_des_populate_remap_context(), and later in
max_des_get_pipe_remaps(). If a concurrent V4L2 ioctl on the sensor changes
the Virtual Channel (vc) ID between these calls, a race occurs.

During the second pass, max_des_get_pipe_remaps() invokes the getter without
re-validating the newly fetched src_vc_id:

max_des_get_pipe_remaps() {
    ...
    ret =3D max_des_get_src_dst_vc_id(context, pipe->index, hw.phy->index,
                                    src_vc_id, &dst_vc_id);
}

Inside max_des_get_src_dst_vc_id(), this results in an out-of-bounds read
on the stack-allocated context array if src_vc_id is modified to bypass
bitmask checks (e.g., if it is a multiple of BITS_PER_LONG):

max_des_get_src_dst_vc_id() {
    ...
    *dst_vc_id =3D context->vc_ids_map[pipe_id][phy_id][src_vc_id];
}

The out-of-bounds stack data is then assigned to remap->to_vc and passed to
this hardware driver. By programming remap->to_vc into the hardware register
here, is it possible that up to 2 bits of kernel stack memory per race could
be leaked onto the observable MIPI CSI-2 bus?

> +	if (ret)
> +		return ret;
> +
> +	/* Set destination PHY. */
> +	return regmap_update_bits(priv->regmap, MAX96724_MIPI_TX45(index, i),
> +				  MAX96724_MIPI_TX45_MAP_DPHY_DEST(i),
> +				  field_prep(MAX96724_MIPI_TX45_MAP_DPHY_DEST(i),
> +					     phy_id));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-gmsl2-3_se=
rdes-v17-0-002499e534e8@analog.com?part=3D20
