Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1C3442B1E
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512340; cv=none; b=DJNuXIPGFgKM6s8M41CdzmfRhHZMTGtocb4/ego1KoJlkjTQiioKr72ZbtaBN2eFzIve9EXN8F5eD2YvYjQpLXHYlY6gS3wtmVMgdOW/4k+KiCUPZ1v7nNBEbgObofq7pLdi+esdRqz6OlSoV1KpJuumsySM2vIy5a0nXGe0dLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512340; c=relaxed/simple;
	bh=u/vztVAGm7zdWoFw4xYZvLrLKyKNZG9NrxH8t79VXXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p7ovkUQ9QMYSPdffMIt+aHvu0wM1Z66C18QBkWqxkGkuWrm0HpP/lrC6drtkM/7UEnzSZg6TKTSUg9AeEERanMnll0sbmyDsQAziNbpI7fV8uDCvG52OWgCeS/JtOCVKo7EKZ+/9wFnkxd9QxioY+WNvAb5xKd5lzyBA8WHHFpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8zDNAsI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8zDNAsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EDE1F000E9;
	Fri, 31 Jul 2026 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785512339;
	bh=XBFcqaRSdrmN1bTDIsg17jrvm7k/gI6rGWVc+HnWbDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E8zDNAsIZ1UF2YrUscbiTixhsUmzihdZDIfc5U40TH1PRl42xQDzy0pQBwmOjYjYr
	 C6LygrkgBmFq6F5RqKFDSL5NJ1OMduoKSyIR/Aw0QEv8Nf01ODBkQUrS84goAfkXss
	 QUGPM+j76GKYsniqM2KbrFUxIFPHcjNSWTdtHFZdIxCnoOTx3jsojMjzVGCY5mCg6e
	 9MPfiVynPYMysHbSbMfp/Xytf6Yv4rRwisozkNuDyRjenMKWRTUJ0xQtohJxU1oMDb
	 STPHiy3gDgYFsHFhOBURjfGSrvBOpvsqeCaTBWCfawTSJRBOwHkBqWftSuD+CoSrjs
	 aQbn9A6hJNQpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-4-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-4-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 15:38:58 +0000
Message-Id: <20260731153858.A6EDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The bridge subclasses the atomic state (`struct dw_dp_bridge_state=
`) but fails to implement `.atomic_create_state` correctly and does not ful=
ly copy subclass fields during `.atomic_duplicate_state`.
--

--- Patch [4]: [PATCH v8 04/21] drm/bridge: synopsys: dw-dp: Document missi=
ng reset line deassert ---
commit eae7b13a259bfd47bfead9cca99a86275cf00d9a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

    drm/bridge: synopsys: dw-dp: Document missing reset line deassert
   =20
    If the driver uses devm_reset_control_get_exclusive_deasserted() instead
    of devm_reset_control_get() and thus automatically deasserts during
    probe, the SoC will hang when the device is unbound.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 6289ed06e2317..a8ae13cf91d60 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2076,6 +2076,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *=
pdev, const struct dw_dp_plat_
>  		return ERR_CAST(dp->hdcp_clk);
>  	}
> =20
> +	/*
> +	 * This reset line is deasserted by default; asserting it hangs the SoC=
 if the
> +	 * related power-domain is still active.
> +	 */
>  	dp->rstc =3D devm_reset_control_get(dev, NULL);
>  	if (IS_ERR(dp->rstc)) {
>  		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");

While reviewing this, I noticed a pre-existing issue in the same file:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:
> static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struc=
t drm_bridge *bridge)
> {
> 	struct dw_dp_bridge_state *state;
>=20
> 	state =3D kzalloc_obj(*state);
> 	if (!state)
> 		return NULL;
>=20
> 	__drm_atomic_helper_bridge_duplicate_state(bridge, &state->base);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but does this correctly copy
subclass fields?

The generic helper __drm_atomic_helper_bridge_duplicate_state() only copies
the base struct size, failing to carry over the subclass-specific fields
to the newly allocated state.

[ ... ]

> static const struct drm_bridge_funcs dw_dp_bridge_funcs =3D {
> 	.attach =3D dw_dp_bridge_attach,
> 	.detach =3D dw_dp_bridge_detach,
> 	.atomic_duplicate_state =3D dw_dp_bridge_atomic_duplicate_state,
> 	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> 	.atomic_create_state =3D drm_atomic_helper_bridge_create_state,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is also a pre-existing issue, but is the initial state allocation large
enough for the subclass?

When drm_mode_config_reset() creates the initial atomic state using the
generic helper, the allocated object is only sizeof(struct drm_bridge_state=
).

If a hotplug event occurs before the first modeset, dw_dp_hpd_work() calls
dw_dp_link_retrain() -> dw_dp_link_downgrade(), which fetches the initial
state via dw_dp_get_bridge_state() and reads subclass fields like state->mo=
de
and state->bpp.

Could this result in a heap out-of-bounds read because the custom subclass
state wasn't fully allocated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D4
