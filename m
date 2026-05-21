Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F793D810C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368355; cv=none; b=DUfxUIaq4ulU9XHMALDd5duO1ddOSptX3Uav2wxaBtOi65OhyL3AIL+GVT0cY9oT5cffhmfr96wd62ha+mHFOAZG8f7jTprdcjfy9FellLU4avkrx5UCo5EZWJBWjS/YTbc0ai0aGKIQwQJCAwPqb+GCPU06vE9qo80WImXhtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368355; c=relaxed/simple;
	bh=R44zYGC9MsuL+8vBAe4X0HIPbPWaKjbRL4VQj1dW6iE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tf7EYx9DVObje7IQL6os3IZboROZMwH1ZdvCnuRjbzaqVrrNGqzcmeZOoCCEUe5h4MTIYsA0FY/NF9fO56+ZFb3MPVdFtAc0aZNHzQRt1SRNCTHn9FyvTonJaDU97d3j/dgZ2VQ/JYeNTcWrsbdcaZtrGlJNZyaHawnghW0Szs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjvN5OWs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjvN5OWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164441F000E9;
	Thu, 21 May 2026 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368353;
	bh=PQRNXDqRA1BDEnRH/N1VjPvCauT0lYdZHO7A+qiMuE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DjvN5OWsIBJ+TzLUX5rBortS4uYSBVXokeT4bE/k6mWEtGvi+rHybwqJIRWhlCET+
	 KIYwHVcgex7IM95SlXzIBjVUwxwrjZ9wzZMh/qu2yoilyHebLn6Hk+2Z3MvRUb8//5
	 vpayqdyxz0G9zTKkS8fLYNQ5LnKWHDp+X8miGzkkvsVoebg8m6A3sgJdgmqc3lW5r9
	 X3u8wWeOd4AtlPSvYLSekJeMS2ZqoDeMaM0h89zwZXXA2JB91/ZY+ya7sf/PIWBUMd
	 SaCciguAQ7e23HaMqT40n9Rgw1Lm9f+VDzpZ6V6hWbW5/t5Nh3G6AIhf6sj1LvrOvZ
	 YE1oCpGaPji6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521114459.1394264-4-damon.ding@rock-chips.com>
References: <20260521114459.1394264-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 12:59:12 +0000
Message-Id: <20260521125913.164441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect logical-to-physical lane mapping causes inverted mapping=
 in ANALOGIX_DP_LANE_MAP.
- [High] Potential stack buffer overflow when parsing `data-lanes` if `max_=
lane_count` exceeds 4.
- [High] Custom lane mapping is not applied to the PHY configuration during=
 link training.
- [Medium] Inconsistent endpoint `reg` matching between lane counting and e=
ndpoint fetching.
--

commit 85a24e4079e66f4ed5dd4c98ce61e660ea4f5de4
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add support for optional data-lanes mapping

Parse the optional 'data-lanes' device tree property to support
custom physical lane mapping configuration. If no valid configuration
is found, fall back to the default lane map (0, 1, 2, 3) automatically
and keep the driver running.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8cf6b73bceac0..d53ab25bc57b1 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1234,6 +1234,59 @@ static const struct drm_bridge_funcs analogix_dp_b=
ridge_funcs =3D {
>  	.detect =3D analogix_dp_bridge_detect,
>  };
> =20
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

[Severity: High]
Can this cause a stack buffer overflow if max_lane_count exceeds 4?

On Exynos platforms, max_lane_count is read directly from the
samsung,lane-count device tree property without validation. If a
misconfigured device tree specifies a lane-count greater than 4,
drm_of_get_data_lanes_count_ep() will return a num_lanes value up to
that maximum.

Will the subsequent call to of_property_read_u32_array() then write past
the end of the tmp array?

> +	if (num_lanes < 0)
> +		return -EINVAL;
> +
> +	endpoint =3D of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);

[Severity: Medium]
Are we matching inconsistent endpoints here?

The earlier call to drm_of_get_data_lanes_count_ep() hardcodes reg =3D 0 to
search for endpoint@0. However, this lookup via of_graph_get_endpoint_by_re=
gs()
uses reg =3D -1, which fetches the first endpoint under port 1 regardless of
its address.

If the device tree defines multiple endpoints, could the driver count the l=
anes
in endpoint@0 but then mistakenly read the data-lanes array from a different
endpoint?

> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	ret =3D of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lan=
es);
> +	of_node_put(endpoint);

[ ... ]

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 17347448c6b0b..634fad241e69d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -137,6 +137,8 @@ struct video_info {
> =20
>  	int max_link_rate;
>  	enum link_lane_count_type max_lane_count;
> +
> +	u32 lane_map[LANE_COUNT4];
>  };

[Severity: High]
Is the custom lane mapping applied to the PHY configuration during link
training?

During link training, the driver extracts voltage swing and pre-emphasis va=
lues
per logical lane and assigns them directly to the PHY.

Because the DP MAC routes logical lanes to different physical lanes via
the custom mapping, do the analog adjustments need to be applied to the
corresponding mapped physical lanes to avoid breaking link training on
boards utilizing lane mapping?

[ ... ]

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 38fd8d5014d29..45c7652645a13 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -48,16 +48,15 @@ void analogix_dp_stop_video(struct analogix_dp_device=
 *dp)
>  	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
>  }
> =20
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
Does this write the physical lane index into the logical lane bit-field
instead of the other way around?

The ANALOGIX_DP_LANE_MAP hardware register expects the logic lane number
to be written into the bit-field dedicated to the physical lane. The
current bitwise shift writes the physical lane index into the bit-field
for the logical lane.

For symmetric permutations like <3 2 1 0> this might work by coincidence,
but could this result in an inverted mapping for non-symmetric permutations
(e.g., <1 2 3 0>), causing link training and display output to fail?

> =20
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521114459.1394=
264-1-damon.ding@rock-chips.com?part=3D3
