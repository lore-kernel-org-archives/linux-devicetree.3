Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DC239F193
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352054; cv=none; b=kywGYfhSdexbZyOtxxlXx4SOPf3G9StrAa5effHe5KM5hEjKH3tFkE/4V8R6y/mMnFVXjF/CkJB8Rg8zXcdf7MQIEKtQEVzRnhALhE0BMZ692UUuMaHNbVDWvEnNWxBFCG3v2V2Eb8ZUNxr64ya6tXcHPwPAkCYrMiK9wUqyDnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352054; c=relaxed/simple;
	bh=zScHOQxS+ndsPgH3aIkG65c0iIMV6CHQhUIypGTlVcE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/hBP1IgtYIK8/iMVc+DrsqlCvd2KmMxb9gOAnm5cEkieh80wzy5PEOEPPaHaXftatpUsdCAGsmwAdYRQAl89sGoQ7xFcmwEqgQfTo4q3xRsQPyf93GbGiw8mYv/tx5EF/XNOpPIxNcXG/DWtnk3tzH9rp+SpFfuRGHNRWK3Qf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvDibZ72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvDibZ72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5681F000E9;
	Thu, 21 May 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779352053;
	bh=UvluotnJxxMo1iojmNF0GPYMsSGzYEqmBiNny3YuBh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IvDibZ72mjXEk5f4aLxLlkcss2TOhoi2D9J6Gjy6BOLUx1i0p6m2X6h8rWP0MPVKm
	 La0+RSDsPKg6QRVzOeg9GCEqeyaBXUrNNWEjjAhbEH8LLU/pfK7zjRWZHdCww+8Tm8
	 7zrwOG/DsgErQH+SvbeB21tM8zPN2scSjcktsFssTDkbUstWDwZ/NkxmnHkljXs03M
	 3otK4fjm7TPH8RexFglN0ytVEoNvARyruTXWAJ6S8NLtNi5GCItFd/lTvy4ygJWzaQ
	 pOhmeNwivRinIYwz++EbZ+ksph/wUHejX1P78QGhIV8ueZ8E3lKkzvSe+8VhxK+OcV
	 CUZdfQVH5PUkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/10] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521080835.1362416-9-damon.ding@rock-chips.com>
References: <20260521080835.1362416-9-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 08:27:32 +0000
Message-Id: <20260521082733.2D5681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Modifying global connector state in atomic_check callback.
- [High] Calling sleeping functions from atomic commit callbacks.
--

commit c77fcbd07b0455b2897dddc1d458e692b59b3b2f
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Rename and simplify is_rockchip()

This commit renames the inline helper is_rockchip() to
analogix_dp_is_rockchip() and replaces its chained equality
comparisons with a switch-case layout for better readability.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8cf6b73bceac0..116de3bd83a30 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -870,7 +870,7 @@ static int analogix_dp_bridge_atomic_check(struct drm=
_bridge *bridge,
>  	struct drm_display_info *di =3D &conn_state->connector->display_info;
>  	u32 mask =3D BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COL=
OR_FORMAT_YCBCR422);
> =20
> -	if (is_rockchip(dp->plat_data->dev_type)) {
> +	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
>  		if ((di->color_formats & mask)) {
>  			DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
>  			di->color_formats &=3D ~mask;
>  			di->color_formats |=3D BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  			di->bpc =3D 8;
>  		}

[Severity: High]
This isn't a bug introduced by this patch, but does this correctly adhere to
DRM atomic KMS principles?

Mutating the global connector state (di->color_formats and di->bpc) inside
the atomic_check callback can cause unintended side effects.=20

Since atomic_check may be invoked for test-only commits or in parallel,
modifying persistent properties here means these changes will remain even if
the commit fails or is rejected, potentially leading to incorrect functional
behavior in subsequent commits.

[ ... ]

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 38fd8d5014d29..6207ded7ffd5e 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c

[ ... ]

> @@ -329,7 +329,7 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>  			reg &=3D ~mask;
> =20
>  		writel(reg, dp->reg_base + phy_pd_addr);
> -		if (dp->plat_data && is_rockchip(dp->plat_data->dev_type))
> +		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
>  			usleep_range(10, 15);
>  		break;

[Severity: High]
This is a pre-existing issue, but is it safe to call usleep_range() here?

According to subsystem guidelines, atomic callbacks (like bridge enable and
disable routines) run in atomic context during non-blocking commits, where
sleeping functions are forbidden.

If analogix_dp_bridge_atomic_disable() invokes this function (for example,
via analogix_dp_disable_psr()), the sleep could cause kernel warnings,
system instability, or deadlocks. Should this be replaced with a non-sleepi=
ng
delay like udelay()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521080835.1362=
416-1-damon.ding@rock-chips.com?part=3D8
