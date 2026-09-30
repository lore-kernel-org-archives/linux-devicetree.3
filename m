Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60373C0A06
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753890; cv=none; b=NK1iol3uK51veAGm9LL5eSDI8SIQDzalWzj9IlxfZgCRSUDxY1ijYSMM1TqIxz5RaiJczmA4g6SLEb2rBkImKKNYxAGwCSpQBEHRG/YKj1CPQoR+LAl5e6agCY5XTzL2w6ErwndY/hWvnC2YEQCIR/jA4JUIHa1ZHWsIPmELmQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753890; c=relaxed/simple;
	bh=5CMDXMy0cwBwGX6qaRM8IcwhOrDuqtMlr/IINFEk90U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a5edXYmU5WlZ+FI7k+icxebGLjsxl/LszqPk6JrJgtQ064AgrEm+JpbUsnseJNWYfX4umT3rwZOtMEMzbp+NVL8SwU98zsfnuVImRq6BxMB9r/xH3C7B+2bGonbU0xIbHnNvLe9gNAa+pZ3Lq5YFzxoZrdYhmOuhzPkR+uXsEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gc7P09mm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gc7P09mm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19041F000FF;
	Wed, 30 Sep 2026 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790753889;
	bh=tEIlDpf8qZDfu9vXtL2PzehNLauFNtdfCT24Nh2LIw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gc7P09mm9ugKzX/dfcEqF4hf8Wb4QNpaxvHUrDuNkiOnrOyKadLTMGvyqZcX6OKph
	 CWnK1pRjBdjYc/uv9v4sU4YIh3KwDoKMYMcCWtSyM/w0qbhUayrYXYprVGiSXxuH7X
	 XVGYxxprJtBQdFLthH6KUGampePHIEoSXGJGCzUrAdwXHOfb6PNX4zmzPMABOvb+FD
	 DyeTbyv5GE3ncnb/C7AtXMY1xe0KAYur4h4qZQX9ceqBHvui0+EdDv9p0crZnadhvQ
	 rB8/QuJDyATnjPurZKhLQVBTXv//jPFDnw1UC92oTn7BQ87nxv8DCGM93fkK2OWU91
	 xC/qXndpsWqfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/6] drm/tegra: rgb: Parameterize configuration based
 on bus flags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930070535.47130-3-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
 <20260930070535.47130-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:38:08 +0000
Message-Id: <20260930073808.E19041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/tegra: rgb: NULL pointer deref in tegra_rgb_encoder_enable()
- [High] drm/tegra: rgb: pixel clock polarity regression for legacy panels
--

commit 54b0f3191ac9412b6aca8d1f4028b3159a42b6a2
Author: Svyatoslav Ryhel <clamor95@gmail.com>

drm/tegra: rgb: Parameterize configuration based on bus flags

This commit parameterizes the RGB display configuration based on bus flags
passed from the bridge or panel. It updates pixel clock polarity, display
enable polarity, and data alignment according to the input bus configuratio=
n.

> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -104,14 +105,19 @@ static void tegra_rgb_encoder_enable(struct drm_enc=
oder *encoder)
>  	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
>  	struct tegra_output *output =3D encoder_to_output(encoder);
>  	struct tegra_rgb *rgb =3D to_rgb(output);
> -	u32 value;
> +	struct drm_bridge_state *bridge_state;
> +	u32 bus_flags, value;
> =20
> +	/* Get but flags from the bridge state. */
> +	bridge_state =3D drm_bridge_get_current_state(output->bridge);
> +	bus_flags =3D bridge_state->input_bus_cfg.flags;

[Severity: High]
Does this introduce a NULL pointer dereference for non-atomic bridges?

Looking at drm_bridge_get_current_state(), it can return NULL if the
attached bridge does not support atomic state:

static inline struct drm_bridge_state *
drm_bridge_get_current_state(struct drm_bridge *bridge)
{
	...
	if (!bridge->base.state)
		return NULL;

	return drm_priv_to_bridge_state(bridge->base.state);
}

Since bridge_state is unconditionally dereferenced to read
input_bus_cfg.flags, will this crash the display pipeline during
tegra_rgb_encoder_enable() for any devices using non-atomic bridges?

[ ... ]
> -	/* configure H- and V-sync signal polarities */
> +	/* configure H- and V-sync and pixel clock signal polarities */
>  	value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
> =20
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> @@ -124,11 +130,31 @@ static void tegra_rgb_encoder_enable(struct drm_enc=
oder *encoder)
>  	else
>  		value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> =20
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
> +		value |=3D LSC0_OUTPUT_POLARITY_LOW;
> +	else
> +		value &=3D ~LSC0_OUTPUT_POLARITY_LOW;

[Severity: High]
Can this cause a regression for legacy panels by inverting the pixel clock?

The previous code preserved the initial state of the
LSC0_OUTPUT_POLARITY_LOW bit (which is initialized just prior to this block
via tegra_dc_write_regs(..., rgb_enable, ...)).

By forcefully clearing LSC0_OUTPUT_POLARITY_LOW when the
DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE flag is absent, doesn't this break
existing hardware relying on older device trees that do not explicitly
specify this bus flag?

> +
>  	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930070535.4713=
0-1-clamor95@gmail.com?part=3D2
