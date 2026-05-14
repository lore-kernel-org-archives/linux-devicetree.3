Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018D3314A98
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778781464; cv=none; b=rT9n+pWEYuQ1GJ3ZWPRmtR0xsOzSZz7XBe82UOixP21aENffpDCCKwZrWMokPWlbVCsFqAX9cEsTjbXqkE5Rd4phWt0wUHw07tBQ5zJi1s7uDR2/fm+dYqMMMt7s6nuHmJnQh0jKLU8JUyxMxTuArCJ04WHIKFlywvO5g413GOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778781464; c=relaxed/simple;
	bh=S7WqRXFsdtc3DMOYLKP2BhZkRpOaDK8Hrm3hBOcbD/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fMPoWmZQjyDuXT2MmQ/g8eb3mwlC/JSByY4pyHnKZ1WNhh2ccrFAoVR7m8mXbEc2RaObCpoB+ZC0XFpmshKroMOvo5Q/wFcta9axvyPN8ZINf8fiJIXzb15CAmQDVH+u4xw0UytYJp7h6gSqMHPDi8/4KoywmWwBR1NLNeeRlKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJmGnLBr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJmGnLBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AA8C2BCB3;
	Thu, 14 May 2026 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778781463;
	bh=S7WqRXFsdtc3DMOYLKP2BhZkRpOaDK8Hrm3hBOcbD/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CJmGnLBrH0HGlMB78+t07l9PxbjL2by6PNhIhRaQnnlanCst62jOWMe6LUUuBfYN5
	 LsJn1KM9D3UtFWv8SNuR/rIyCPjf1vDIGcZbIsjbU7RuZIRHJZsPbnN/SCkhZHr+TF
	 qcN+0Pr7nz4Si6BYWeFyHTvaZg3vWZGZoX9sdNYKuUnwDhYss/y8fberdZ4XWFWGP0
	 ITSaUD39GeJegOHUy61XwI7Nd/GyN1MiUsFlenx2vEPuzVCoHOADKyNCrfwgj36+mq
	 PwbtoxNg0NmlpTaFK6p+dmRg2/FGclx5rKzu4qfA2xLUvyYQRifnwNZnmn51159eF9
	 xM4h110dE3xOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260514070133.2275069-4-damon.ding@rock-chips.com>
References: <20260514070133.2275069-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 17:57:42 +0000
Message-Id: <20260514175743.73AA8C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Stack buffer overflow when parsing 'data-lanes' property on EXYNOS=
 platforms.
- [High] Incorrect hardware configuration for asymmetric lane mappings due =
to inverted logical-to-physical mapping.
- [Medium] Inconsistent endpoint node resolution leads to device tree parsi=
ng errors.
--

commit 433b68e59e322b480b7a41218242dfa6cb857ab3
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add support for optional data-lanes mapping

This commit parses the optional 'data-lanes' device tree property to
support custom physical lane mapping configuration.

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

[ ... ]

> +	num_lanes =3D drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
> +						   video_info->max_lane_count);
> +	if (num_lanes < 0)
> +		return -EINVAL;
> +
> +	endpoint =3D of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);

Can this inconsistent endpoint node resolution lead to parsing errors?

The drm_of_get_data_lanes_count_ep() call strictly searches for an endpoint
with reg =3D 0 on port 1, but the subsequent of_graph_get_endpoint_by_regs()
call uses reg =3D -1 to match the first available endpoint regardless of its
register value.

If a valid endpoint has a non-zero register, won't the first query fail whi=
le
the second would have correctly found it?

> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	ret =3D of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lan=
es);

Does this introduce a potential stack buffer overflow for the tmp array on
EXYNOS platforms?

The tmp array is allocated on the stack with a fixed size of LANE_COUNT4 (4=
),
but num_lanes is bounded by video_info->max_lane_count. Looking at the EXYN=
OS
platform parsing later in the same file:

	case EXYNOS_DP:
		...
		of_property_read_u32(dp_node, "samsung,lane-count",
				     &video_info->max_lane_count);

The max_lane_count is populated directly from the samsung,lane-count device
tree property without validation. If a malformed device tree specifies a va=
lue
greater than 4, num_lanes will exceed the size of the tmp array, causing
of_property_read_u32_array() to write out of bounds and corrupt the stack.

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

Is the logical-to-physical lane mapping inverted here?

The data-lanes device tree property semantics dictate that the array index =
is
the logical lane and the array value is the physical lane. However, the
ANALOGIX_DP_LANE_MAP register fields appear to configure which logical lane=
 is
assigned to a specific physical lane.

By assigning reg =3D lane_map[0] << LANE0_MAP_SHIFT, does this code write t=
he
physical lane assigned to logical lane 0 into the hardware configuration for
physical lane 0? While this works coincidentally for symmetric permutations
like <0 1 2 3> or <3 2 1 0>, it would result in incorrect lane assignments =
for
asymmetric mappings like <1 2 3 0>.

> =20
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514070133.2275=
069-1-damon.ding@rock-chips.com?part=3D3
