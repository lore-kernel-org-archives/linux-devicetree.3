Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C88F3B47DF
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 23:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390365; cv=none; b=WEorKB/2A/tIZFF5PG9cNj+tOveIKveY2MVqkmpEvMTf1+eq//QAjQ87454TyIb1s0cC7o9E2g717nM45DUU6/kKE2lTpI+3cQYNY1en8NUTx7/0cCOlQgGQW9gxrIZRS8ZGh/stTVU/ZK7IMHZHbnYYHeSonRTb6+cE3YI/Fw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390365; c=relaxed/simple;
	bh=tV+tEnGz0O5qW6AxV3wekb8Xk5zLeFSmu45SmxCHj8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BgrM+RyKNqG0hNBbKecAZdaxWNDw/1RqLLIc04yop+tU5cTOSqAXtBkwNv44E7Y5R4+kaxhPe8JVfCULVIZlqpstTP6p1J7uHLbjT4yRkk39zKGRu8GIptBwsiN/EgIjdBq/Loy09adJqKR/lphNR95EQoz4gCAe37dcwcjBS6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYJdpxXA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYJdpxXA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5C61F000E9;
	Wed,  2 Sep 2026 23:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788390364;
	bh=l5gYv3qCWnNgSqMrivbHCUl8Z6YxRtMrPzgEbPYBN84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYJdpxXA1gag9js5w+PzqqmHyFRjmHlZYyy8GmP03KkeggvsqzT2VL6Dtty2HA2Xv
	 mUZCW7zs7+P7mU96oljvvcKfWrI8EUxdhlKzpimtrktKX+UACuRfNo+NwkzQISt2JY
	 Zuk3ITVtxn71lkqrmzU/kuqd7CyN2rvSS9t6SslQQCYnAkWCg35tCiZ/YlDe43F0lQ
	 h4C4x8eaxcaP74sxbJUlmlD2dtOTE66MJdGN3y/iOkHLxWeOTu4V8sT2jayMLtqNwo
	 B6OMBQoOIiFIH1Wjwg51GYVw+0iFFidmBW6ydAYRq1bc69g0dEPMdnkSX2y7hpWEK7
	 eMmQc1XXeIQ/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/14] drm/rockchip: dw_hdmi_qp: Support 10-bit
 YUV422 output format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-12-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
 <20260903-dw-hdmi-qp-yuv-v4-12-fb45bf4147eb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 23:06:03 +0000
Message-Id: <20260902230603.AF5C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Modifying hardware state and global driver state during the atomic=
_check phase.
- [High] drm_atomic_get_bridge_state() error code masking breaks wait/wound=
 mutex backoff.
--

commit d0dd6a8692e00076c21b4fe6dcb51ded1a0bb7d0
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format

This commit adds support for the 10-bit YUV422 output format to the Rockchip
DW HDMI QP encoder. It also configures the HDMI PHY with 8 bpc when YUV422
is in use to keep its output clock aligned with the TMDS character rate.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c4cf68d79d50..78473f9a0fce3 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

[ ... ]

> @@ -226,7 +227,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_=
encoder *encoder,
>  	}
> =20
>  	phy_cfg.hdmi.tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
> -	phy_cfg.hdmi.bpc =3D conn_state->hdmi.output_bpc;
> +	/*
> +	 * YUV422 always transmits two 12-bit components per clock cycle,
> +	 * regardless of the color depth, which from a rate perspective is
> +	 * equivalent to three 8-bit RGB components.  Force 8 bpc here to
> +	 * keep the PHY PLL output aligned with the TMDS character rate.
> +	 */
> +	phy_cfg.hdmi.bpc =3D (s->output_mode =3D=3D ROCKCHIP_OUT_MODE_YUV422 ?
> +				8 : conn_state->hdmi.output_bpc);
> =20
>  	ret =3D phy_configure(hdmi->phy, &phy_cfg);
>  	if (!ret) {

[Severity: High]
This isn't a bug introduced by this patch, but does calling phy_configure()
and modifying hdmi->tmds_char_rate inside atomic_check illegally commit
changes to global hardware tracking state?

In the DRM atomic KMS framework, atomic_check callbacks must be strictly
stateless and free of side-effects because they are frequently executed dur=
ing
test-only commits intended purely to validate configurations. By calling
phy_configure() here, the driver incorrectly modifies physical hardware
registers during a test phase, which can cause display glitches, sync loss,
or hardware lockups.

Additionally, upon success, the function updates the global state:

	if (!ret) {
		hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
		s->output_type =3D DRM_MODE_CONNECTOR_HDMIA;

This permanently corrupts the driver's cached state. A subsequent real comm=
it
may skip hardware configuration entirely because hdmi->tmds_char_rate match=
es
the requested rate, leaving the device out of sync and breaking display
output. This fundamentally breaks compositors that rely on test-only commit=
s.


There is also another pre-existing issue earlier in the same function:

dw_hdmi_qp_rockchip_encoder_atomic_check() {
	...
	ingest_fmt =3D dw_hdmi_qp_rockchip_get_vop_format(encoder, conn_state);
	if (ingest_fmt < 0)
		return -EINVAL;
	...
}

[Severity: High]
This is a pre-existing issue, but does swallowing the error code here break
the wait/wound mutex backoff mechanism?

dw_hdmi_qp_rockchip_get_vop_format() calls drm_atomic_get_bridge_state(),
which uses wait/wound mutexes to lock bridge states and can return -EDEADLK
if the lock is contended. Returning -EDEADLK signals the DRM core to back
off, drop all locks, and retry the commit.

By checking if (ingest_fmt < 0) and returning a hardcoded -EINVAL, the
-EDEADLK error is swallowed. This breaks the DRM atomic commit WW mutex
backoff mechanism, causing valid userspace commits to fail spuriously with
-EINVAL under lock contention when multiple threads or processes attempt
atomic commits concurrently.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dw-hdmi-qp=
-yuv-v4-0-fb45bf4147eb@collabora.com?part=3D12
