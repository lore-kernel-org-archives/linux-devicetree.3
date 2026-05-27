Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88B262FD0
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779850458; cv=none; b=Y7BJCfx3P7O+NkWFxd0sxIRkuOSY20SINOcjwWZvNr3GzCzmqvD/XFlLYWg8VAOW1v/fZzJWKPnQyUSao0qpjuATCCtLQwXn4k8o97rdjvSn1QI+PIHt0ceA3juyAKGhaF/xRpKugX3TBdNaP7UPaVBPCFvN1/+BnV16gfSNZqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779850458; c=relaxed/simple;
	bh=3A8jzEMleLvlSedt6Eeo5dZKBnk+Qs74JuKiDZ7AXOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EXCXIztNhL9kpsdBS/s3IUXKYf6FCnqybijHD7SNR29Ip/jVdoQaBCfp2rHDD5hNs//nooFT9kK2nRwcKh93ghFkpK14dhuwahAKI0xzEHHO9EzAI1kJpyxDgVMa/ofSq19rP0AgWZDLrCyX0RHi1y1CpXvFkRTCztT2sASjv6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBk1yDvd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBk1yDvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277AA1F000E9;
	Wed, 27 May 2026 02:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779850457;
	bh=ZNFTOOyKY4woHqdwyFUp2yKhm7hMgvuGG2mqRz4+PAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBk1yDvdmC68lpN3CWAsCP3J0JsUbn7sseAU7NrC182ri/W7I+dcgdRIRrefEq1LF
	 CwmcmZ4TfOQMUE7u6Tj4xs9XIJeoyWRkAJTP6G6kPcEdpVWS4Qena7f3pN9jPgadau
	 E8nn2eK367ZokoK9Coszr2hzoNAS+SatMBapdgAZEqosubEBFAeE59E94xNnsqUVhy
	 MPMEP2cZXuPkZkLZ0RZwO9G4GD5SZDqCAodKN6DFP5wNTrKCXYFXUSsUOIrsJNSuL/
	 C9DI2jqoarhWJHM2Zp0WywW/LtSIRrMtFC6inn57/ySelbJ2XVA8EtzUR2XNm0/v/p
	 ioCuMOHjb8zJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/10] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527024336.191433-9-damon.ding@rock-chips.com>
References: <20260527024336.191433-9-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 02:54:16 +0000
Message-Id: <20260527025417.277AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The atomic_check callback modifies the global connector->display_i=
nfo state, which violates the DRM atomic API contract. This problem wasn't =
introduced by this patch, but modifying persistent objects in atomic_check =
causes test-only commits to have side effects.
--

commit 644453a6e6cb6a36d4d9248a4a519cc2c40ae524
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Rename and simplify is_rockchip()

This commit renames the inline helper is_rockchip() to
analogix_dp_is_rockchip() to follow driver namespace conventions. It also
replaces chained equality comparisons with a switch-case layout for better
readability.

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

[Severity: High]
This isn't a bug introduced by this patch, but does modifying di->color_for=
mats
and di->bpc violate the DRM atomic API contract?

The atomic_check callbacks can be executed for both real and test-only
commits. By modifying conn_state->connector->display_info directly, aren't =
we
altering the persistent connector state rather than the duplicated atomic
state?

This could cause test-only commits from userspace to incorrectly mutate glo=
bal
state and potentially break subsequent real commits or format negotiations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527024336.1914=
33-1-damon.ding@rock-chips.com?part=3D8
