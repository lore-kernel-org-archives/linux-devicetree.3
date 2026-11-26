Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676012;
	b=VrfJ2bybT2dsdxYytmyDBJt6OgV1jRc4CtbRosSpNvqwuvORkfOy+uCkxFsf11zNuwjg
	 M73f7DgM0WeGjmhZ1xo6qXZ0FWXCaszYLQYRPwVp77EgomeOLP054BnTpzbPwmQxKsYDh
	 Lo+AjydG9w4umNP+rXBshVgw8y2+NfsbsMJ/E0lRaOFPmBkORlfiiIW8K38X1ZKchSGnh
	 HKh6ySgdKB6PRAzTTv+2S2v+8ihDwYdFZO65mQODkKpApydnDIXbrcrYAhp0mirReyyvT
	 lWokuu1TChq9kgByGLKvmNLWaqsALkZKaaumQ8XmLhR1JL9LN58gX2SIiXF3Y1HYAuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676012;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oejMnKtm417sOeGwsVA3HgYFBALDLa3xcFY2ZkAZQFE=;
	b=4U8Vv1ZIBEHu/ObuzpRDR357dJIQIZ69GXkQNk/PIGNnhO9YU0j/wol6orH+w1+U3WAw
	 t2MNO7p2taA6spnjgHkJ6v0TxYS4b4EBCdWu4VCvltiKdapVmlrMXVKiguppNLmVEJNJD
	 jjceuRr3Ix/sOL+H9u3dC/V8AJejETXxbwLQfDSF0bwRSAHQKahPE4BF+XX1KKvNZTf4n
	 EA3Mhbo1kbZOWS59EdAQOofy2d2XMloQYdFpbVaWXY0GU2ZUVoIodHrBZqtvvSzKq262a
	 7wq8d/6not6d5XZ8mRNZguSKPZEa0cG3AkEdWkYRzAWtdoNlhnpvF1lJiZ0LnATNwvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTpsU6h9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22392606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTpsU6h9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB871F000CF;
	Thu, 26 Nov 2026 06:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795676012;
	bh=oejMnKtm417sOeGwsVA3HgYFBALDLa3xcFY2ZkAZQFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZTpsU6h9tyo6MeUxVf5sBXS0JhDL5jPT7WW8fI9vCrvI6azUN/5O03K8jFR8A4zvp
	 TGh6QPgVnUOM4AO3c0E/xpe13CfQ2l/smUeY2SbDmcmWG12lrK7uZash96jmIVgJs9
	 iP/33GZalbH+67votGwQkJ9vPisvDrkjWEjkacpwXAOgQJU9cRi1ctYFDatCZeO4Uh
	 6styJl4cDoev7IjUQHHCrQAlba4zMhcOLVe7bpcZN9IMILhM9O1UYmrHfQpojtIc0+
	 0duKMl/V6OSHdGiF50n3StthsatgcRdwrPKAVUKf0eMZOKsi+0873MNWqmitIpXNhI
	 XgwVaZHZvmlvA==
Message-ID: <sashiko-outbox-234913@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/21] drm/msm/dcp: Integrate the DSI bridge with KMS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jayant Shekhar" <jayant.shekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-15-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
 <20261126-jshekhar-v3-dcp-v3-15-f1e9d7505039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:53:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/msm/dcp: dcp_crtc_atomic_begin() opens session on
  non-modeset commits
- [Medium] drm/msm/dcp: bridge post_disable clears session before CRTC
  disable runs
- [Medium] drm/msm/dcp: per-frame session_lock contention in
  dcp_crtc_atomic_begin()
--

commit e01cd206b38110292d233f3ada806c2481168944
Author: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

drm/msm/dcp: Integrate the DSI bridge with KMS

This commit connects the DCP DSI bridge to KMS by preparing the bridge
display session during CRTC atomic begin and propagating the dirtyfb
requirement to visible planes during CRTC atomic check.

> diff --git a/drivers/gpu/drm/msm/dcp/dcp_crtc.c b/drivers/gpu/drm/msm/dcp=
/dcp_crtc.c
> index f58667ca458e9..a79bf9189e744 100644
> --- a/drivers/gpu/drm/msm/dcp/dcp_crtc.c
> +++ b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
[ ... ]
> @@ -149,6 +150,12 @@ static void dcp_crtc_atomic_begin(struct drm_crtc *c=
rtc,
>  		return;
>  	}
> =20
> +	ret =3D dcp_dpu_kms_prepare_crtc_session(dcp_kms, crtc);
> +	if (ret) {
> +		cstate->hfi_error =3D ret;
> +		return;
> +	}
> +
>  	if (!dcp_crtc_get_session(crtc, &session_id)) {
>  		cstate->hfi_error =3D -ENODEV;
>  		return;

[Severity: Medium]
Can calling dcp_dpu_kms_prepare_crtc_session() unconditionally in
dcp_crtc_atomic_begin() open a half-initialized HFI session on a
non-modeset commit?

If an earlier modeset failed in dcp_dsi_bridge_prepare_session() or rolled
back in dcp_dsi_bridge_atomic_enable(), crtc->state->active remains true
while dsi_bridge->session_open is false.  On the next page flip or plane
update, dcp_crtc_atomic_begin() calls dcp_dsi_bridge_prepare_session(),
which opens a new HFI session and publishes session_id to the CRTC.
Because drm_atomic_crtc_needs_modeset() is false,
drm_atomic_helper_commit_modeset_enables() skips dcp_crtc_atomic_enable()
and dcp_dsi_bridge_atomic_enable(), so the session never receives
HFI_MODE_DPMS_ON, DISPLAY_POST_ENABLE, or HFI_EVENT_FRAME_SCAN_COMPLETE
registration, causing subsequent commits to stall until the 500ms frame
done timeout in dcp_crtc_wait_for_commit_done().

[Severity: Medium]
On display disable, does dcp_dsi_bridge_atomic_post_disable() clear the
CRTC session before dcp_crtc_atomic_disable() can use it?

During drm_atomic_helper_commit_modeset_disables(),
drm_atomic_helper_commit_encoder_bridge_post_disable() runs before
drm_atomic_helper_commit_crtc_disable().
dcp_dsi_bridge_atomic_post_disable() closes the HFI session and calls
dcp_dsi_bridge_clear_session(), which clears dcp_crtc->session_valid:

drivers/gpu/drm/msm/dcp/dcp_dsi_bridge.c:dcp_dsi_bridge_atomic_post_disable=
() {
	...
	ret =3D dcp_hfi_display_post_disable(kms->hfi, dsi_bridge->session_id);
	...
	dsi_bridge->session_id   =3D 0;
	dsi_bridge->session_open =3D false;

	dcp_dsi_bridge_clear_session(dsi_bridge);
}

When dcp_crtc_atomic_disable() then runs, dcp_crtc_get_session() returns
false, skipping the bandwidth vote clear (dcp_hfi_crtc_set_bw()),
HFI_MODE_DPMS_OFF, and HFI_EVENT_VSYNC deregistration.

[Severity: Medium]
Does calling dcp_dpu_kms_prepare_crtc_session() before
dcp_crtc_get_session() on every active commit contend on
dsi_bridge->session_lock during steady-state page flips?

dcp_dsi_bridge_prepare_session() acquires dsi_bridge->session_lock before
checking dsi_bridge->session_open, while dcp_dsi_host_transfer() holds
that same mutex across synchronous VirtIO HFI DCS transfers in
dcp_hfi_dcs_transfer().  As a result, every plane update or page flip
stalls behind in-flight runtime DCS commands (such as DSI backlight
updates) even when the session is already open and published to the CRTC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-jshekhar-v=
3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com?part=3D15
