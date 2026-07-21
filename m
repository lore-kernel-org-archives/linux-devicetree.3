Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE946D2D1
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657148; cv=none; b=Bk3ObuKhXib4jEKFwBmKLdsKfwuCJ01Ao7lwUAWNDJHGsOxtIzEt/eO3sj5L4xWUET1Vryfipm2b8VXg7SvEvC9I17uE9AzvlUqdEeU7x2eBQ+DY8zbOK6J0rNLanN45vBOp5u1k0FW45AcoRhs2Av7ogbJesiWLy5GoeOFJtMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657148; c=relaxed/simple;
	bh=g8HopFZZ75QmhdA6DMkqi8tA1R9geiww2u70FwOWhAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s6gNi2ZReoYreqHFMPJJXeNTU7z3Zxn4AqOgykaPvkr994kCaili21p+X9i1DpoVnzw43epia6goFntAKyM62S+90c57V1WHRwO3CehOFsNqbk6/3otiqAvmUACVMw9gQgf7Imyi6oCgmSdKSwtEw8UZhLSWhFF3echooL5ZSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GItmKjC5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GItmKjC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C6C1F00A3A;
	Tue, 21 Jul 2026 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657147;
	bh=Ur1O1dH+i+Fdb9qTo9vP9daq7x7A/QUow6dus6AACuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GItmKjC5/6m2Kdy6MZMR2lnYhrw7X0Ua1huy3Qaypije7DnuYFyDInnAdslQ3detZ
	 XjKF/bMPeUe4l80CRsA3SRd87bjAQG6O0Pe92DbmwIkMKCcrnizz0yMY98I68UGcWF
	 EBkbPaXzq6O7Cdjgq/6+TMEHmpSVJYZXlN3eOasUcWXem+yjJFrPUbiDdHERSKORzj
	 KZkjqdaT7MOnGQjB+CYwseAWYbH9oL4LD0O8EJ4qWAiNSuhbeqKlBHO72uPtb+O2XA
	 rQxqLDebz+mi412u/vhOMHZA4V8lCiQ8880THI2i70A1GTH9nU4ORi4Mp8HWpW8pWC
	 tI3Fj2yeaEuug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/10] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-2-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-2-f0f4a4ede712@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:05:46 +0000
Message-Id: <20260721180547.00C6C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The bridge configures itself for RGB888 when MEDIA_BUS_FMT_FIXED i=
s requested, but fails to propagate this requirement to the upstream encode=
r during bus format negotiation.
- [High] Forcing 24 bpp (RGB888) when MEDIA_BUS_FMT_FIXED is requested bypa=
sses DP link bandwidth validation, allowing display modes that exceed the p=
hysical link capacity.
--

--- Patch [2]: [PATCH v4 02/10] drm/bridge: synopsys: dw-dp: Support MEDIA_=
BUS_FMT_FIXED ---
commit 98faee8d93ff4e450a6ec04ce4882b2871508172
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Support MEDIA_BUS_FMT_FIXED

Add support for MEDIA_BUS_FMT_FIXED, which is requested when the downstream
bridge does not implement atomic_get_output_bus_fmts(). This patch coerces
MEDIA_BUS_FMT_FIXED to MEDIA_BUS_FMT_RGB888_1X24 in the atomic check phase.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 368e1f85e6253..aca6816febe67 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1538,7 +1539,10 @@ static int dw_dp_bridge_atomic_check(struct drm_br=
idge *bridge,
>  	state =3D to_dw_dp_bridge_state(bridge_state);
>  	mode =3D &state->mode;
> =20
> -	fmt =3D dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
> +	if (out_bus_format =3D=3D MEDIA_BUS_FMT_FIXED)
> +		out_bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;

[Severity: High]
Will this coercion fail to propagate upstream?=20

The dw-dp driver still uses the generic helper
drm_atomic_helper_bridge_propagate_bus_fmt for its .atomic_get_input_bus_fm=
ts
hook. This helper propagates the originally requested MEDIA_BUS_FMT_FIXED
format to the upstream encoder, rather than the locally overridden RGB888
format.=20

If MEDIA_BUS_FMT_FIXED is propagated to an upstream encoder (like Rockchip
VOP), could it choose an incompatible default output format (like YUV422)
since dw-dp operates strictly in RGB888? Should this driver implement a
custom .atomic_get_input_bus_fmts hook to propagate MEDIA_BUS_FMT_RGB888_1X=
24
instead?

[Severity: High]
Could forcing MEDIA_BUS_FMT_RGB888_1X24 (24 bpp) here bypass DP link
bandwidth validation?=20

When the downstream bridge lacks an .atomic_get_output_bus_fmts() hook, the
DRM core skips the output format validation. Since dw_dp_bridge_mode_valid()
only verifies bandwidth against a minimum possible bpp (e.g., 18 bpp), could
we end up allowing display modes that physically fit at 18 bpp but exceed t=
he
DP link capacity at 24 bpp?=20

Should this code call dw_dp_bandwidth_ok() after forcing the format to ensu=
re
the hardware link can actually support 24 bpp?

> +
> +	fmt =3D dw_dp_get_output_format(out_bus_format);
>  	if (!fmt)
>  		return -EINVAL;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-synopsys-d=
w-dp-improvements-v4-0-f0f4a4ede712@collabora.com?part=3D2
