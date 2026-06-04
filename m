Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67AE3AFAE0
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563860; cv=none; b=oiMjkPfqvbwPUwmX5cHpykc9nbBcZhKCIX+xUkLxh88Ey5jWvgReL2mO86MWaXNMQxLbbNJg6YGUcL83gzj7jMuwsPMTc6HY/EhiYYH6cL2XtagdLLIPMa/pH0bfv2EunePvZSxxqLzwXyYgL+LT61UU8AdklU+7c7SRn87Be7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563860; c=relaxed/simple;
	bh=kCgSuh1ligH+kXnF8CZB9D0PKPCEdn10TlgVuEmjMCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GfTSWRVYsCoM2hXyTLEFMLJD0I0CemtRSYKNp1XCS0wLU3RBe6oovo4FkOPUOcJ8bL42ZeXdq6o4KbLzMsnlPufW+alkdhKybPNZejzYPH2vikWiK2EbebIhNqQoZHgZT5r+vci5zBAJ0tx5c5frw5+SDVTYno3CoCgx84bVQeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPE307I3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPE307I3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3003E1F00893;
	Thu,  4 Jun 2026 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780563859;
	bh=+fLXV4pvkD+MbfAV1J1L+L3bo7Dsh9tsoeEEPsNbQyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPE307I3m0d/ILEy0r17KTgqtKH3Pgf/x+Nn25Wt16hBhR4qd5qEBGoVsfZu+klkh
	 Q/8a52mw6fMC8aveKfTPSQ3XgCVgWIwcAK5RH4+kwa1zH/D67+GIgyb3LFP388t77T
	 MjOnm6XacCrY7v6db1ZWjNX/x84+SFIzyKoNwruhY6MsCwo8owRj6hnEHGs3tE7hun
	 /yukH4wvMjvKGSgVyRXnxQIei/OOdUwCqrH9Hh7dTHHR3j72EWRz6+FySCU8IggNNg
	 4GkEsEefXUyak0yjCpMTR2IQsm1A7JaniaivCmeH29r36a7aLO8bpV5D6zRPkHbT6X
	 v1zKTcVY/mkQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604085220.2862986-5-damon.ding@rock-chips.com>
References: <20260604085220.2862986-5-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 09:04:18 +0000
Message-Id: <20260604090419.3003E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The logic-to-physical lane mapping is mathematically inverted when=
 programming the hardware, breaking support for asymmetric lane swap config=
urations.
- [Medium] Inconsistent endpoint resolution when reading the data-lanes pro=
perty.
--

commit b6abf6d746df1b04ca60b36cd37e77da204d915a
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add support for optional data-lanes mapping
   =20
Parse the optional 'data-lanes' device tree property to support
custom physical lane mapping configuration. If no valid configuration
is found, fall back to the default lane map automatically.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f23c2ae6e10d0..2dfe7de5d3101 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1234,6 +1234,59 @@ static const struct drm_bridge_funcs analogix_dp_b=
ridge_funcs =3D {

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

[Severity: Medium]
Will this result in reading from an inconsistent endpoint if port 1 has
multiple endpoints?

The call to drm_of_get_data_lanes_count_ep() above explicitly passes 0
for the endpoint reg, but this call uses -1. If there are multiple
endpoints, this could return the first one it finds rather than endpoint@0,
which might lead to reading the lane map from a different endpoint than
the one used for the count.

> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	ret =3D of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lan=
es);

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
Does this logic mathematically invert the lane mapping for asymmetric
configurations?

The device tree data-lanes property specifies a mapping from logical to
physical lanes, so that lane_map[logical_lane] =3D physical_lane.
However, when programming the hardware, it expects the logical lane index
to be placed into the bit-field corresponding to the physical lane.

Here, the code shifts the physical lane number by the logical lane's
bit-shift, effectively programming the logical lane into the physical lane's
field. This happens to work by coincidence for symmetric mappings like
<3 2 1 0> or <0 1 2 3>, but it will corrupt asymmetric configurations
like <1 2 3 0>.

Should the logical lane index instead be shifted into the physical lane's
bit-field? For example, using reg |=3D i << (lane_map[i] * 2).

> =20
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604085220.2862=
986-1-damon.ding@rock-chips.com?part=3D4
