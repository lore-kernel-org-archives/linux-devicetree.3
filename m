Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A792E06E6
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126664; cv=none; b=rdMjQyj02FewCkUoNXd59mCNd4RqR2/oe6GWVEXsYyyeuIpuJgSeUhB9dQ0iO4De2b8zdq8StPCgylmfCDvxQXLSnu6YT1PPvWzmwgJHPp0kYFL6GONqpUVT7oEN350m+vEB+nIjbIgTB9J5xWbbRsq0zn8ITMa0KGOLWZBGWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126664; c=relaxed/simple;
	bh=EresFaffTCd3NoCseHryaC6modwrn7sZ/er0NiLJnEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B7pkmjo8z4wnOm8+AxHw6qrosjNAyK17HDUkxPga9no6A3JY9uiYWusmRjMKQUWADLJY7ITZT03PJg+wIpyBKzHgdC1lGIazqmU/CnJk5x1OeZEo8+QWRQ6kMFot66Nkw9XKQ0OspCf87dT+Q86LoI0cljO+/vIOjf27ttx2Glo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arMdSiGJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arMdSiGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816771F000E9;
	Wed, 19 Aug 2026 08:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787126662;
	bh=2fzZ0837s6AiOCFo7j+2eTZLglcotO8+c2hY3m4f5xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=arMdSiGJRFxyqTvc105uUJ+FRO3eaSt03fXuow73g8VOvhvNJZM/tvjBV71cLAlC3
	 Z9u3mM7Ktybd/zNZOAhLAIRvQ0kPSXl+PqhND6WxySHeFRgbT7SEp5oogxv4vEcp4J
	 J1sGzVkm3Dt148pj6AF8fd+DdxOvk6pWGbY/Jm8+sSikif96/bZEv0O9s2ESfm65Tv
	 9zXYYM2dqx2XZZzR11iIhU1+szuDPHLw9nCPI5gRtS2vkqSmgdCNoykyEB6lBwQkpg
	 ymOXRrKJ0iXMc4b3pALmHlHmqCJmm8q2j58pMSgg+i10WBsRqlNW/h7xnnuco6YT6a
	 +32JdhZ5yq4Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260819075238.3007087-6-damon.ding@rock-chips.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-6-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 08:04:22 +0000
Message-Id: <20260819080422.816771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Logic error in hardware lane mapping configuration causes inverted=
 assignments for non-symmetric maps.
- [Low] Device Tree endpoint lookup inconsistency when querying lane counts=
 versus reading properties.
--

--- Patch [5]: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for opti=
onal data-lanes mapping ---
commit 1c15eb6132eedc3d606168644e5f97918c8e3651
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add support for optional data-lanes mapping

Parse the optional 'data-lanes' device tree property to support
custom physical lane mapping configuration. If no valid configuration
is found, fall back to the default lane map automatically.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 039e076d2b8ab..cb06347196cef 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
[ ... ]
> @@ -1240,6 +1240,59 @@ static const struct drm_bridge_funcs analogix_dp_b=
ridge_funcs =3D {
>  	.detect =3D analogix_dp_bridge_detect,
>  };
> =20
> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
> +{
[ ... ]
> +	num_lanes =3D drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
> +						   video_info->max_lane_count);
> +	if (num_lanes < 0)
> +		return -EINVAL;
> +
> +	endpoint =3D of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);

[Severity: Low]
Does passing -1 here potentially retrieve a different endpoint from the one
validated with reg=3D0 above?

If multiple endpoints exist on the DP port and the target endpoint is not
positionally first, could this mismatch result in reading the data-lanes
property from the wrong endpoint?

> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	ret =3D of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lan=
es);
> +	of_node_put(endpoint);
[ ... ]
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index ea8401293a23a..c1344a3f013ab 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
[ ... ]
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
Does this logic incorrectly assign the physical lane value to the logical
lane's field?

By shifting the physical lane index (lane_map[i]) into the register field
assigned to the logical lane index (LANE<i>_MAP_SHIFT), it appears this
inherently applies the inverse of the requested mapping.

While this silently succeeds for symmetric maps (e.g., swapping 0<->3, 1<->=
2),
will it fail for any non-symmetric map (e.g., <1 2 3 0>) by causing physical
lanes to carry the wrong logical lanes?

Should the bitwise construction instead be reg |=3D i << (lane_map[i] * 2)?

> =20
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819075238.3007=
087-1-damon.ding@rock-chips.com?part=3D5
