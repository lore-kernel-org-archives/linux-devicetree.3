Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BB5471CEC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522575; cv=none; b=WQplABvGU6A5bRgh1wdz08FjANuRresHE51NpXavJIPzbPNME0Xgg2EOe04J+s1f0AtCscSBiO0jJ9VEwsr2aOAYAjutBrT3Ra1A0jreACbwYqy1Mj+IOLbyCcaphROxiFXh2zRpr9rgu4ljFnZjaXh2SwCqO2IS4qabInAtFps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522575; c=relaxed/simple;
	bh=iKaLlrcL5FJcDZMeCe5GsSVaKTbr3DEW/iPGDr4PCw4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DwCRxkrF4yUKC5Wcgqd1pDPCy/2H8T/aK568y3914qN1X/8lxc802w6BAtN6LthUAx4kXIqYD90/yhtq/XzOKzKCH36npN0d1EvazhWDQT1xkm94UfEgfIdzvE0uRgJV6lWp2cAVJGsZW24ka4Xm0bBpR3p+zxUIzQElYwi0/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtgeFNcB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtgeFNcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF081F00AC4;
	Fri, 31 Jul 2026 18:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785522574;
	bh=HBY+A5rlhzdFyquEWiYW2ZRVN2OC91gRWqsnex5DLOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NtgeFNcBUGKfkQGB93yJSf0l24rk6sCsJ+cJGsC9Sc3pygSFgLXCvMK3ovyTdo6VQ
	 tDsNyatzQAM6Pw+yNSfdbcX0JNS+H8YwFGJjfgLOevUYQgqQNgg8QdsHRTpjf/eevL
	 DRgZR+cUfHTKwDX07qTRAM/6OyW+30sf9gDp02HFvqwavrw9j1QuDk4CbfDT4bHAQh
	 FBd/zRUFsc96lxQ7GV1o0tcKbjPJAwOgVCcVTSkG3OT/wRilPgCdZ76hyrJDi07HBP
	 ryjFb+liD8367XW5UYcO8gBQBLfUMFaWoQd7UK1XTS43aF3D8OKSnItgbshr0SGyka
	 7MTvqiYyGGu9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 19/21] drm/bridge: synopsys: dw-dp: Use
 regmap_set_bits in dw_dp_send_sdp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-19-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-19-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:29:32 +0000
Message-Id: <20260731182933.EAF081F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] A mutex is acquired in dw_dp_send_sdp(), which is called from the =
bridge's atomic enable path, violating atomic context rules.
--

--- Patch [19]: [PATCH v8 19/21] drm/bridge: synopsys: dw-dp: Use regmap_se=
t_bits in dw_dp_send_sdp ---
commit fbf6588f46fe1b8bc7ef347644cccb5c7a752410
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Use regmap_set_bits in dw_dp_send_sdp

This commit simplifies dw_dp_send_sdp() by making use of regmap_set_bits
instead of regmap_update_bits. No functional change is intended.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1070,14 +1070,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struc=
t dw_dp_sdp *sdp)

[Severity: High]
Does this function sleep in an atomic context?

Looking at dw_dp_send_sdp(), it acquires a sleeping lock via
scoped_guard(mutex, &dp->sdp_lock) earlier in the function. However, this
is called from the bridge's atomic enable path:

drm_atomic_helper_commit_tail()
  -> dw_dp_bridge_atomic_enable()
    -> dw_dp_video_enable()
      -> dw_dp_send_vsc_sdp()
        -> dw_dp_send_sdp()

Can this sequence cause a kernel splat ("BUG: sleeping function called from
invalid context") or potential deadlocks when modesetting, since it executes
within drm_atomic_helper_commit_tail() where sleeping is forbidden?

>  			     FIELD_PREP(SDP_REGS, get_unaligned_le32(payload)));
> =20
>  	if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
> -		regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
> -				   EN_VERTICAL_SDP << nr,
> -				   EN_VERTICAL_SDP << nr);
> +		regmap_set_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
> +				EN_VERTICAL_SDP << nr);
> =20
>  	if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
> -		regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
> -				   EN_HORIZONTAL_SDP << nr,
> -				   EN_HORIZONTAL_SDP << nr);
> +		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
> +				EN_HORIZONTAL_SDP << nr);
> =20
>  	return nr;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D19
