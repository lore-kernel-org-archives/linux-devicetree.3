Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3336F8EC
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705866; cv=none; b=eb/H5lj+M8YxP7gRTYlN/3js16vTwYwmTYidYld4TFPHhB3tl1rPszJzcUVGfSgdMLuNuRSAyLhTqRNbXI5Uh+vO6112flsYBBBWFMojuKtx5h7FYk9l1VJQ5BqFoNvpkaEhHpdvAMbr4eOqdiRnmxw6et0js6n+aCecWlo+Zlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705866; c=relaxed/simple;
	bh=1u146kq8pE9E1IKnPKrREKeLzXPUbcI9NE6xmLShV/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ujqfsb9jOgj+8fbdSBrtAfCKYzgkLsA5CbxitbkaQBTen+fulUXst5iLpVOyCrTibyXqmngzdZWcnCxemvbEVO7At016YtWm/6z2AXoAyhWQu+X0LNig7r63XJHyqtMA3kPihglAJ6bNoFBCDKBEwo/ruU3urGpvT3r0Us7beo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWYgLIDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWYgLIDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A151F000E9;
	Mon, 25 May 2026 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779705865;
	bh=A/Qlwg2OjYBySHVVTMXEdmT5Y5yAvmnprnXA+q2NxSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kWYgLIDaLvItcDX4T73LT4IB/xlVJ2A6FKmlQx2vlfVoF8QFGu2BaOfEQYBQQyZT4
	 OSoQ+b/TK5srYbxaiH+W4zVLGHlPnfbhZS20/ccGvN2PnDfPLuYXrhQr/VcnedZuBK
	 bXHVQrtH7uAitn9HuWPtBJxnVvQU4b8ovqRF6p5mqHBxjGs/91hJe0L7v8HNozOHsA
	 3JFDBaEySnwFGsU2CvJJ00G8MgLoPbSxqmg/DXwi1NHbxx3DtYpmNNTUVz6NplKiIo
	 fGjyupsTCcRWUV8qastKApCShmkxX11xTxu2syBnl64hitzb01ys5LNiDT8FnGNb1U
	 UDoU9IXQFq/eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525094731.121380-3-damon.ding@rock-chips.com>
References: <20260525094731.121380-3-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:44:24 +0000
Message-Id: <20260525104424.E2A151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] A stack buffer overflow occurs when parsing the `data-lanes` prope=
rty if the maximum lane count from the device tree exceeds 4.
- [High] Incorrect physical-to-logical lane mapping inversion when configur=
ing the `ANALOGIX_DP_LANE_MAP` hardware register causes display failures fo=
r asymmetric lane configurations.
--

commit fd335049da543c9f60be19d9bdefbf50e51341e2
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add support for optional data-lanes mapping

This commit parses the 'data-lanes' device tree property to support custom
physical lane mapping configuration. If no valid configuration is found, it
falls back to a default mapping automatically.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
[ ... ]
> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
> +{
> +	struct video_info *video_info =3D &dp->video_info;
> +	struct device_node *endpoint;
> +	u32 tmp[LANE_COUNT4];
> +	u32 map[LANE_COUNT4] =3D {0, 1, 2, 3};
> +	bool used[LANE_COUNT4] =3D {false};
> +	int num_lanes;
> +	int ret, i;
> +
> +	memcpy(video_info->lane_map, map, sizeof(map));
> +
> +	num_lanes =3D drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
> +						   video_info->max_lane_count);
> +	if (num_lanes < 0)
> +		return -EINVAL;
> +
> +	endpoint =3D of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);
> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	ret =3D of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lan=
es);

[Severity: High]
Can this cause a stack buffer overflow of the tmp array?

For Exynos platforms, video_info->max_lane_count is read directly from the
"samsung,lane-count" device tree property in analogix_dp_dt_parse_pdata():

	of_property_read_u32(dp_node, "samsung,lane-count",
			     &video_info->max_lane_count);

If a malformed device tree provides a lane count greater than 4, num_lanes
could exceed 4, causing of_property_read_u32_array() to write beyond the
bounds of the 4-element tmp array on the stack. Should the maximum limit
passed to drm_of_get_data_lanes_count_ep() be strictly bounded by
ARRAY_SIZE(tmp)?

[ ... ]
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
[ ... ]
> -void analogix_dp_lane_swap(struct analogix_dp_device *dp, bool enable)
> +void analogix_dp_lane_mapping(struct analogix_dp_device *dp)
>  {
> +	u32 *lane_map =3D dp->video_info.lane_map;
>  	u32 reg;
> =20
> -	if (enable)
> -		reg =3D LANE3_MAP_LOGIC_LANE_0 | LANE2_MAP_LOGIC_LANE_1 |
> -		      LANE1_MAP_LOGIC_LANE_2 | LANE0_MAP_LOGIC_LANE_3;
> -	else
> -		reg =3D LANE3_MAP_LOGIC_LANE_3 | LANE2_MAP_LOGIC_LANE_2 |
> -		      LANE1_MAP_LOGIC_LANE_1 | LANE0_MAP_LOGIC_LANE_0;
> +	reg =3D lane_map[0] << LANE0_MAP_SHIFT;
> +	reg |=3D lane_map[1] << LANE1_MAP_SHIFT;
> +	reg |=3D lane_map[2] << LANE2_MAP_SHIFT;
> +	reg |=3D lane_map[3] << LANE3_MAP_SHIFT;

[Severity: High]
Does this program the mapping backwards for asymmetric configurations?

The device tree bindings define the "data-lanes" array as a
logical-to-physical mapping, where the array index is the logical lane and
the value is the physical lane. The driver stores this directly so that
lane_map[logical] =3D physical.

However, the ANALOGIX_DP_LANE_MAP hardware register expects a
physical-to-logical mapping scheme. LANE0_MAP_SHIFT configures which logical
lane is output on physical lane 0.

If the device tree specifies an asymmetric lane mapping like <1, 2, 3, 0>,
lane_map[0] would be 1. Using lane_map[0] << LANE0_MAP_SHIFT incorrectly
programs physical lane 0 to output logical lane 1 instead of logical lane 3,
which scrambles the lane configuration and breaks display output.

Should the mapping be inverted (e.g., map[tmp[i]] =3D i) during the parsing
step to generate the correct physical-to-logical hardware configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525094731.1213=
80-1-damon.ding@rock-chips.com?part=3D2
