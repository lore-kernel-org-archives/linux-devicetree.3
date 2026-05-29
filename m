Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25444377EBA
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780032709; cv=none; b=rLCpanUWhqS1TBamGEQF131TMwBvLCh3hIYWx0E27Z6difYi2Gfzok6Kz++gL8s0fAt+Ic5sES+rCnmtL5ZY0CEaB9hfs3CeQU/3NbCJ3NQ6ULuQjO9trqrZyLpBygKZoBO51LhDqEiyekVZkxOV+ddqcAwCUEre/COVYyfcezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780032709; c=relaxed/simple;
	bh=a5uGGsKKTmEQbeJ1MjcJdCf2x8gQYa1n+IBHROENI+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pj/sUqIeMzuktpHgcUPdtRx2nIvkGGEBv4HZ3s16FMGqRLrYMQz1ujckqBifDcfBQNonfsrPCe8rZDe/PhVG+/FEmMPbeoyfwH1yfmbjbeMsq9dFaHqrl0JAHPqrxtQXfljGY35ykrMRyFsnb1Wkb+DM5SkqRh1JmsVTT+9o6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8DGC3Fp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8DGC3Fp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2871F00893;
	Fri, 29 May 2026 05:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780032707;
	bh=19bcZSLe8NVNEqbs4U4ZWcK5B+ejLvkjp5J43hzk+w0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N8DGC3Fp6zfUHx7kBTB0RZDLmH5KOAwtsntUO5yv7baEfAWlHYzznG0kXwLdZ00tb
	 7obaNOK7ZQi/evFEckhKz8J9Y53WMMnZrlaxGfK/9fpXz3RcNZ/6gEhzzBRh+fWkeU
	 XLXe/X6FUUBnELS4BubZHxWbvEgC5jHUt7+JwPcEFD6iKii786zyH7ySUMd2AHyxvQ
	 uqVqjBlZuiherCR3btEX2Owe0VFjrLQ86znTgZCrRATYTyhxMP+H9arg/ACzObMQg4
	 2RBolt8EXeCHzoeioaCnmRNsJmgVmF4GGv9HZY4+e3Zz/KQgmlrlh8RSBXk0JcL3Gf
	 1HSMP9vkmt/HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529040530.741336-3-damon.ding@rock-chips.com>
References: <20260529040530.741336-3-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 05:31:47 +0000
Message-Id: <20260529053147.8F2871F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The bounds check for `samsung,lane-count` incorrectly accepts inva=
lid lane counts (like 3) and can be entirely bypassed with large values due=
 to signed comparison, leaving a heap overflow vulnerability unfixed.
--

commit f84cb246760d7a4c631b55b3c7a41c458926dcf4
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add validation for samsung,lane-count property

This patch adds a range check for the samsung,lane-count device tree proper=
ty
to avoid invalid values. The validation is only applied when the property
exists to maintain backward compatibility.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

[ ... ]

> @@ -1260,8 +1261,16 @@ static int analogix_dp_dt_parse_pdata(struct analo=
gix_dp_device *dp)
>  		 */
>  		of_property_read_u32(dp_node, "samsung,link-rate",
>  				     &video_info->max_link_rate);
> -		of_property_read_u32(dp_node, "samsung,lane-count",
> -				     &video_info->max_lane_count);
> +		ret =3D of_property_read_u32(dp_node, "samsung,lane-count",
> +					   &video_info->max_lane_count);
> +		if (!ret) {
> +			if (video_info->max_lane_count =3D=3D 0 ||
> +			    video_info->max_lane_count > LANE_COUNT4) {

[Severity: High]
This is a pre-existing issue, but does this bounds check effectively
prevent all invalid lane counts?

Since max_lane_count is defined as an enum link_lane_count_type, on ARM
architectures (following AAPCS) enums without negative values that fit in a
signed int are represented as signed int. If of_property_read_u32 writes
a large unsigned value like 0xFFFFFFFF into this enum, it is interpreted
as -1. The signed comparison -1 > 4 evaluates to false, which bypasses
the validation.

When this large value is cast back to u32 later in the driver, it could
allow dp->link_train.lane_count to remain at a malicious value read from
the sink's DPCD, eventually leading to a heap buffer overflow when
initializing the cr_loop array which is sized for only 4 elements.

Additionally, does this check inadvertently allow 3, which is an invalid
DisplayPort lane count?

Would it be safer to read the property into a local u32 variable, validate
it strictly, and only then assign it to video_info->max_lane_count?

> +				dev_err(dp->dev, "samsung,lane-count =3D %d is out of range\n",
> +					video_info->max_lane_count);
> +				return -EINVAL;
> +			}
> +		}
>  		break;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529040530.7413=
36-1-damon.ding@rock-chips.com?part=3D2
