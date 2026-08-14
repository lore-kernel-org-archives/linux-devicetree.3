Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19576175A80
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786666734; cv=none; b=r3MKy1mJe3kWEexMCBqk/29E3pgozIJMy4vvhpKaaAw3q7A4jtPsiU+AjFxfQ8JGwQX5sIRNLVkqyz0WZa8DmrM7NbD6ImVU3cdhApe76m5ezwe/cO08HLC0Fmf70UTFzA4JynODPowQVWpViBY1DnUbKBh6IH9nx884Zw3YROQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786666734; c=relaxed/simple;
	bh=K/u7FhsGQuhOctj9LNHMoojT5gqU35rkufpzCSW6B/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NVsDhh4XKW+P1KeF0x7FrPnUt5tuRKBgsIohT4Cl9LhaVLX/HwxiXcCTgItxFHp7MfsJlxB1PW+QJ39T8CErX3GFR7Uoh48FHwckKCI+lyZaq0bMql20BPdPRpIaGv/k45rSEs7w7YWvJn4RHzvW3PBmQpLFEBD1SLGd1QZD7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/xW+J8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/xW+J8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AFA1F000E9;
	Fri, 14 Aug 2026 00:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786666732;
	bh=RRo//RUuVnZRQfOLlltOs+eFMqdXSbJi39KV9fELxlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c/xW+J8IM+sBY0/2YfPmkFAOTwSY5fIm+IjEs233e0gEFf+QreRzVTjuAJE723pcU
	 zDMzAc4Yp6t+zV9UC3AXLf4ZnLKyM0J1WohEK3AvSLqZpEyEewRIgYwJYs2fFaVd20
	 xArO1LYJCWFEPc5N0u6IYzf2Vq7S7ld2coNVq+X/pRjsPMK3tABGhnu/f24/gXpVCL
	 DSnqUbf3ZoJ4rEtUAdrmBVVQim9xpHa3qofRxHRXq/AWnPX0PuAMT4kaJYVc7JiWBq
	 M9cxlrUt9Ai5ZXRFdE/IRuy2QUFYQTrLBcinCqUfH5/v8lr/D7nlxEYCbtZIl+hZ6m
	 /gySL3z3cIxLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/21] drm/panel: himax-hx8394: set
 prepare_prev_first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260413-waveshare-dsi-touch-v3-8-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-8-3aeb53022c32@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 00:18:47 +0000
Message-Id: <20260814001852.45AFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrectly setting `prepare_prev_first =3D true` reverses the pow=
er-on sequence, causing the DSI host to drive the PHY (LP-11) before the pa=
nel is powered on, risking hardware latch-up.
--

--- Patch [8]: [PATCH v3 08/21] drm/panel: himax-hx8394: set prepare_prev_f=
irst ---
commit c09b3f2141b3b76647c1bce815022a8389dcf60f
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/panel: himax-hx8394: set prepare_prev_first

This commit sets the prepare_prev_first flag for the Himax hx8394 panel.
The flag reverses the pre_enable and prepare ordering in the DRM bridge
chain so the DSI host powers on before the panel.

> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point.

Is this description accurate? Looking at panel-himax-hx8394.c, the DSI
commands are actually sent in the enable callback, not prepare():

drivers/gpu/drm/panel/panel-himax-hx8394.c:hx8394_enable() {
    ...
    ctx->desc->init_sequence(&dsi_ctx);
    ...
}

During enable, the DSI host is already fully powered on and initialized,
rendering prepare_prev_first unnecessary.

> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm=
/panel/panel-himax-hx8394.c
> index c4d3e09a228da..d64f3521eb15b 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -792,6 +792,8 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
> =20
> +	ctx->panel.prepare_prev_first =3D true;
> +

[Severity: High]
Does setting this flag reverse the power-on sequence, causing the DSI host
to drive the PHY (LP-11) before the panel is powered on?

Because of this flag, panel power-on executes after the host has already
driven the DSI lanes. For example, in hx8394_prepare():

drivers/gpu/drm/panel/panel-himax-hx8394.c:hx8394_prepare() {
    ...
    ret =3D regulator_enable(ctx->vcc);
    ...
}

This executes after the host is initialized, which is a hardware sequencing
violation. Could this lead to current leakage, potential hardware latch-up,
or PHY initialization timeouts on strict DSI hosts?

>  	drm_panel_add(&ctx->panel);
> =20
>  	ret =3D mipi_dsi_attach(dsi);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260413-waveshare-=
dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com?part=3D8
