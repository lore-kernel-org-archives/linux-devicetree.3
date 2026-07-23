Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25A43E3163
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845720; cv=none; b=pkeRgE6yEd/RjeUcetXVytDghh9YQD+nJZnaJzcp4keyWvSS7TnNxqRmOBOtl1vGZbhvPHcDup75VTeFaVFyrUB8mHKV0FK82fUkpp7eHVXf4UvWwV4Pe2J7IrsDeOM3reUXx/QbkneGRnOa1CkR9Avtkr8I/PX4e+lh5IF4DNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845720; c=relaxed/simple;
	bh=pIGDvYeqMm8uAK4yeIkl+fFoD2ZiUBtiudNBlcmhqpY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pcZJkCrVy8G2bJ38Uc+ENMQAIjOCwuBwbRcCB8mX652ZCIFIS5P2lGsDU9RCwqdp0+0xWnsKth1SlIM+5tg0gP5QvhONYHbBKpwk9MnwVR20T++EDs03YdhYy7KeP8xO2LJHfovwI11wS1MBMmNZ+DyUVsAAntyhGK7L4NF0IN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RK7mGMlP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RK7mGMlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252C31F000E9;
	Thu, 23 Jul 2026 22:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784845718;
	bh=4C67VVSIDj2YOyBtxE5l5v+S5gb7tXKE1DpFMJPXVe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RK7mGMlPYdHc5x5hb06gxUOo5qJm5cYw9IxFyhrIl0r1aTNp2ejUrEnR4ijiXSSBr
	 zeRF8+84jqCU5TTkyP/AkpAzl8bMN/BdEJSMIWB/ubX5oMUPhmqaz4z3qp1xcFIO9N
	 q9R+0oRoMCcGmmSe0BimkieK4Cdtb5Q72JlMIYCN3mzYqClqTRFAMWIufnwe7vkZ8K
	 eQa6S0e14Vb19NFiU3ZimWSsZ3ffttGtiGT/Bb91iVDZAPjIt/Z9uzAEOB3pOGaVJT
	 DztQtIUdbgzDzWYOv2ezptHgWAgUFu0q3CKu5gX1D45kR1K1+i+2PTJMPPpeFNKz1Q
	 qUc00V38/z4jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/15] drm/bridge: synopsys: dw-dp: Move
 dw_dp_bridge_atomic_get_output_bus_fmts()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-4-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v5-4-9445c2e87441@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 22:28:37 +0000
Message-Id: <20260723222838.252C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The dynamically allocated `output_fmts` array is leaked when no ma=
tching bus formats are found.
--

--- Patch [4]: [PATCH v5 04/15] drm/bridge: synopsys: dw-dp: Move dw_dp_bri=
dge_atomic_get_output_bus_fmts() ---
commit c989bc992dcfd432abf52123b03475b9fb318ca0
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Move dw_dp_bridge_atomic_get_output_bus_fmts()

This commit moves dw_dp_bridge_atomic_get_output_bus_fmts() before
dw_dp_bridge_atomic_check() in preparation for reusing it. No functional
changes are intended.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index b28040d69fabf..3dec7777fb285 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1522,6 +1522,54 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_au=
x *aux,
>   * 2. the minimum hsync should be 9 pixel;
>   * 3. the minimum hbp should be 16 pixel;
>   */
> +static u32 *dw_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *b=
ridge,
> +						    struct drm_bridge_state *bridge_state,
> +						    struct drm_crtc_state *crtc_state,
> +						    struct drm_connector_state *conn_state,
> +						    unsigned int *num_output_fmts)
> +{

[ ... ]

> +	output_fmts =3D kcalloc(ARRAY_SIZE(dw_dp_output_formats), sizeof(*outpu=
t_fmts), GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dw_dp_output_formats); i++) {

[ ... ]

> +		if (!dw_dp_bandwidth_ok(dp, &mode, fmt->bpp, link->lanes, link->rate))
> +			continue;
> +
> +		output_fmts[j++] =3D fmt->bus_format;
> +	}
> +
> +	*num_output_fmts =3D j;
> +
> +	return output_fmts;

[Severity: High]
This isn't a bug introduced by this patch, but does this code leak the
dynamically allocated output_fmts array when no formats match?

If a display mode has a very high pixel clock, dw_dp_bandwidth_ok() might=20
return false for all formats, leaving j as 0. The function then sets=20
*num_output_fmts =3D 0 and returns the allocated output_fmts array.

In the DRM core, if drm_atomic_bridge_chain_select_bus_fmts() receives 0 in
num_out_bus_fmts, it immediately returns -ENOTSUPP without calling kfree()=
=20
on the returned pointer. Since this can be repeatedly triggered via the=20
atomic test ioctl by a process with DRM Master privileges, could this be=20
exploited to exhaust memory?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v5-0-9445c2e87441@collabora.com?part=3D4
