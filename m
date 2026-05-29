Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C1F351C1F
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034210; cv=none; b=LKa+GYXyoxiFxCKdBRr2FF8zQ+ObRCwUSOltkWLYu2lbj1e8BGERL/4UdByHVdjbG/Gj4PxRIx00K2EL6tkPhmlIcFemmh8M3dMdUqWGvwwcN4OUX+eydNe+4OcYee5mSAGykoeo1c/JASofj2Yx5LfeLicXZ8RrzXs2WhvyOcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034210; c=relaxed/simple;
	bh=i/eYjFs9xOp1evH0RSEkLthuNjViQj73lk56Y+VDAsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TiyEDJ8iTAWrsBIA+hRnu0LWsUTLPA7jy5Jcd3R+5HBGhytsUnNQIFfBdpmeidYGq50ZoFr3a6ox3zRiQCT9V2+itMvuZheSY/HvLfQ9op167WJrIvwai8G3ybYnYteT8UBpJDIWhXcuB2KP7/Ms1haGFPCCInL6p1+pDmxTdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZF+KduX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZF+KduX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833551F00893;
	Fri, 29 May 2026 05:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780034208;
	bh=9lCr/m4eiIcEJ2C8LrURddN9Kul6Xv/27H3qycrXmis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jZF+KduXk1t1d4AFXybK4A82VruTgW9okny9NnlqdZga48ydnRTIRliKm7biAppC3
	 Fzk+cBfMVBlV4gjIwew4l2Y0URBJvCrkxkCm42gd1eTSiotEzKPoJBwC6RGeA54Fo2
	 DaPiTb45ho4cTiLlzFBtmAr65EFzfv77+wW8BgjrX3FohUvwOTN8DDAcnJrfg5eeas
	 Fs2BOCsYqayidjCHE/FYieTnR+wczJALTIMaQh5v9Zy0mgKhKmGG5O9hZ1XqemdwyR
	 DC8IP13XQklgsff6Kg+80+XUnZjpkL40gXiqFeCIx0a7cI+j5MNvtY8W+NSOTVEqX9
	 uvRJTrrLmzw8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529040530.741336-4-damon.ding@rock-chips.com>
References: <20260529040530.741336-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 05:56:48 +0000
Message-Id: <20260529055648.833551F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect physical-to-logical lane mapping programmed into hardwar=
e register.
- [Medium] Inconsistent endpoint resolution when validating and parsing the=
 'data-lanes' property.
--

commit b0396fb13d86cb1835c8181f73f2c91f756c7665
Author: Damon Ding <damon.ding@rock-chips.com>
drm/bridge: analogix_dp: Add support for optional data-lanes mapping

This commit parses the optional 'data-lanes' device tree property to support
custom physical lane mapping configurations. If no valid configuration is f=
ound,
it falls back to the default lane map automatically.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 699a7f380c56c..b2e729850391b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
[ ... ]
> @@ -1234,6 +1234,59 @@ static const struct drm_bridge_funcs analogix_dp_b=
ridge_funcs =3D {
[ ... ]
> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
> +{
[ ... ]
> +	num_lanes =3D drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
> +						   video_info->max_lane_count);
> +	if (num_lanes < 0)
> +		return -EINVAL;
> +
> +	endpoint =3D of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);

[Severity: Medium]
Is there a risk of inconsistent endpoint resolution here?

The call to drm_of_get_data_lanes_count_ep() strictly searches for the
endpoint with reg =3D 0 under port 1. However,
of_graph_get_endpoint_by_regs(..., 1, -1) matches the first available
endpoint regardless of its reg value.

If a device tree defines multiple endpoints under port 1, could these calls
resolve to different endpoints? This might cause the driver to validate the
lane count against one endpoint but parse the mapping from another.

> +	if (!endpoint)
> +		return -EINVAL;
[ ... ]
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 38fd8d5014d29..45c7652645a13 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
[ ... ]
> @@ -48,16 +48,15 @@ void analogix_dp_stop_video(struct analogix_dp_device=
 *dp)
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
Does this code program the hardware register with the correct mapping?

The data-lanes device tree property defines the physical lane for each
logical lane, meaning lane_map[i] holds the physical lane assigned to
logical lane i.

However, the hardware register ANALOGIX_DP_LANE_MAP appears to expect the
reverse mapping, where it is divided into bit fields per physical lane that
must be programmed with the desired logical lane.

Writing lane_map[0] << LANE0_MAP_SHIFT assigns the physical lane index into
the configuration field for Physical Lane 0. While this might work for
self-inverse mappings, could it produce a scrambled configuration for
non-symmetric mappings?

> =20
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529040530.7413=
36-1-damon.ding@rock-chips.com?part=3D3
