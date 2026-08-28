Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC72199920
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900567; cv=none; b=XGv+KWiNy20OjQ932jMqUb+szK34Ie7dRADZRvy0egR+a6xbBE3ijLe2IEbAJlBo8totcGEuGtftJ/RSyKeXafnsW6CvLfaKOGhX2QFNCp75MX/3LXc4+AB7i3gcytzsqUPNxzW71PxbrEC5h7QrD/PMvWMZcsQlJvbO4CbVvfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900567; c=relaxed/simple;
	bh=p6+pbKsmSz3VmgSC5gQVgJIcczQGlL9g/tjK5gifeYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BTqGNJS24BrbbsaGyN2R82lvvHeqeej//udK62ZdBQEIuhEQf1yQvZjFcGFdI19zui/EpkYX7Y7HECJEN9cBgeG0ePZ6tnGYWuGrkvnw4L70lQeUgn1HL8HZL3t1XLA2RJD8gNCgsDr6SCrRwhiKFyBxSNseiqhiUE9L0s8W/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcU1IPDF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcU1IPDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849DA1F000E9;
	Fri, 28 Aug 2026 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900565;
	bh=+a7GdgOMcJk4X7XMTFSPz6+85imM70GdNDcQ+KGn58Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FcU1IPDFQf3cdDn17NBQNRySPzDmDFwTSvUFTZKcNGHFIYNolpaEOluT+hrzzvA0x
	 zslhFCpa6LFwU0VdQb/C2aAJ6x43uJXIgJjQFjnv6pbJBt9Z8UGA9KVVD33meDHY+H
	 nDPrnN7XbhVZ0qeUBxwPcPWoiIDRzRMQrAbkjigE+T7rMDiA1RcxLf0k1jae6noJrs
	 Y/bDHeRHk7u8W2cMWQ3F7aEB1LyVzfRntypCdmD1G7+1Rp56K2g8NrtQAZVKUm7BlQ
	 PPAytgg2C5L5HVMg9eS6/4Xg5BJGYDbu5tMvTIa5URK6c2Slf6EVNiXIs+jdupWOws
	 tZnWfwyAT4dLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260828065153.590802-6-damon.ding@rock-chips.com>
References: <20260828065153.590802-1-damon.ding@rock-chips.com>
 <20260828065153.590802-6-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 07:02:45 +0000
Message-Id: <20260828070245.849DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect hardware lane mapping due to logic-to-physical vs physic=
al-to-logic mismatch, effectively programming the inverse of the intended m=
apping.
--

commit 83b65668f019b59b41d7d71bc5a8a34dd644922a
Author: Damon Ding <damon.ding@rock-chips.com>
drm/bridge: analogix_dp: Add support for optional data-lanes mapping

This commit parses the optional 'data-lanes' device tree property to support
custom physical lane mapping configurations. If no valid configuration is
found, it automatically falls back to a default lane map.

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
Does this logic unintentionally program the inverse of the intended lane=20
mapping?

The data-lanes device tree property specifies the physical lane for each
logical lane, where lane_map[logical_index] =3D physical_index. However, the
ANALOGIX_DP_LANE_MAP register is structured to select a logical lane for ea=
ch
physical lane.

In analogix_dp_lane_mapping(), the code uses the logical lane index to
select the shift mask (e.g., LANE0_MAP_SHIFT) and assigns the physical lane
index (lane_map[0]) as the value. This configures physical lane 0 to output
logical lane lane_map[0], which results in the inverse of the intended mapp=
ing
when an asymmetric configuration is used.

Would it be more appropriate to write the logical lane index into the shift
corresponding to the physical lane? For example, by doing something like:

    reg |=3D logical_index << (lane_map[logical_index] * 2);

> =20
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828065153.5908=
02-1-damon.ding@rock-chips.com?part=3D5
