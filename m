Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B6B28150F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547642; cv=none; b=L/FGDsaeZdzcM6K0U96wr1YAc2ZCbuBNpuCCfjgBs0k/ZXd62mLLrYk+PzgQf1b1YeW98u9QEo4zcTcBZrLmB6vuxehR++L/YAP1DdlkoNc69gx7/mlTaN/ITdSx+PFxgTFU5+dz9K3pNQKzD8Dy5KIt+6hSuGGdIb6wxPzzDj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547642; c=relaxed/simple;
	bh=BtEo97daQ1NkZ1Q9Ncx/C+ux1mtySgn5qhN/+4QLWWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lOhOKJLLCLQuGWFkt45tTjMYGvwqSJLmf43p+60PQjySlH8IAO0/eTOgrrOSaMIhYrH5DnJ656oSTjPV7tVUyHaUH2ZUGNi1BozacKylD4RJjYVvDU8VvuX0VVv663ibGgD0+Q58+tF5Hokw3ue9Dlv9tIqyORzhKwanQ+6UdPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmSHMXzh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmSHMXzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB23A1F00A3A;
	Wed,  8 Jul 2026 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783547641;
	bh=+DbcHoKhTH0+WI7MX38Y6OlMCbwZgwmtaM7cp/TesrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DmSHMXzh+gxzlrNlTvyPA4N6SMltw05B9OMaaf0kewkzy2/YGvHhFuilNrpxqmsXY
	 /7uEQGgOkebweOl/BWODY4U0ek4Hndw2y7hKHRbOBb6cEiAmneG4QRd6csJQhCtMfv
	 Oo02V8b0ju3JFRpGkAdyKbwsIwL9+DyU2T+Dn56TrF+etA1rXKaVcumuYaNsjgSnVb
	 onB8n6E4FEZ5RpNUlvmrXzR02EQmjVnuqfA+re6G34vskTDMDdO/7+4dezcNqEvBQN
	 l06B+0doJfRNlJOyE6v/736ajatpMb84H/Kck4yUJ0x/CUJ4iRmrFF0pFqtKLEfkR6
	 o2S2/lYXujE9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] drm: panel: jd9365da: Add prepare_prev_first flag
 to drm_panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc-Olivier Champagne" <marc-olivier.champagne@savoirfairelinux.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260708213500.1867092-3-marc-olivier.champagne@savoirfairelinux.com>
References: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
 <20260708213500.1867092-3-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 21:53:59 +0000
Message-Id: <20260708215359.EB23A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Redundant duplicate assignment of `prepare_prev_first` flag.

Pre-existing issues:
- [High] Missing cleanup in the error paths of `jadard_prepare()` causes a =
permanent leak of the regulator enable counts.
- [High] Premature publication of the panel in `jadard_dsi_probe()` allows =
a race condition leading to a NULL pointer dereference.
--

--- Patch [2]: [PATCH 2/5] drm: panel: jd9365da: Add prepare_prev_first fla=
g to drm_panel ---
commit 1a793dbc7476444fc7003da84dbce8a3bff9ad98
Author: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>

drm: panel: jd9365da: Add prepare_prev_first flag to drm_panel

The DSI host must be enabled for the panel to be initialized in
prepare(). Set the prepare_prev_first flag to guarantee this.
This fixes the panel operation on Renesas RZ/G2LC SoC DSI host.

> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/g=
pu/drm/panel/panel-jadard-jd9365da-h3.c
> index 1ef0c937863a2..a79dc8f8d5af9 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -2993,6 +2993,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device =
*dsi)
>  		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
>  				"failed to get vccio regulator\n");
> =20
> +	jadard->panel.prepare_prev_first =3D true;
> +

[Severity: Low]
Does this introduce a redundant assignment?

Looking further down in jadard_dsi_probe(), the exact same flag appears to =
be
set again just before panel registration:

jadard_dsi_probe() {
	...
	jadard->panel.prepare_prev_first =3D true;

	drm_panel_add(&jadard->panel);
	...
}

Can we remove one of these duplicate assignments?

[Severity: High]
This is a pre-existing issue, but does jadard_prepare() leak regulator
reference counts on error paths?

If regulator_enable(jadard->vccio) succeeds, but a subsequent step fails:

jadard_prepare() {
	...
	ret =3D regulator_enable(jadard->vccio);
	...
	ret =3D regulator_enable(jadard->vdd);
	if (ret)
		return ret;

and later with mipi_dsi_dcs_nop():

	ret =3D mipi_dsi_dcs_nop(jadard->dsi);
	if (ret)
		return ret;
}

The function returns without disabling the previously enabled regulators.
Because the panel prepare fails, the DRM core won't mark it as prepared, and
jadard_unprepare() will never be called to clean up.
   =20
Can this prevent the system from entering low-power states or re-initializi=
ng
the display properly?

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition wi=
th
premature panel publication in jadard_dsi_probe()?

The panel is added to the global list before its required internal pointers
are initialized:

jadard_dsi_probe() {
	...
	drm_panel_add(&jadard->panel);

	mipi_dsi_set_drvdata(dsi, jadard);
	jadard->dsi =3D dsi;
	jadard->desc =3D desc;
}

If a display controller finds the panel concurrently (e.g., via probe defer=
ral
resolution) and calls drm_panel_prepare(), jadard_prepare() could execute
before jadard_dsi_probe() finishes:

jadard_prepare() {
	...
	if (jadard->desc->vcioo_to_lp11_delay_ms)
	...
}

Can this dereference a NULL jadard->desc pointer? Should drm_panel_add() be
moved to the very end of the probe function?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708213500.1867=
092-1-marc-olivier.champagne@savoirfairelinux.com?part=3D2
