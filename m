Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C432349CFC
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367022; cv=none; b=Azg2O+cbh/GVsKUmXSPds0rnMignaOy8YsVuIwOdRsgk/Y6Cx2cOzbjyG4YVwz2yC6+LeMYexha5GPUA9L6YsyC+9rv0il7feqaCJKnQH5ifLoYH90JwBGwsRIQKL+1d9UMRMDAWSO8SYEcxLvVMQrd3BIOVijzXoTW3GzgxPI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367022; c=relaxed/simple;
	bh=k+3LE+ilgPc/TesO6X6mRjg/1RdEVpsXmuvOWBp3wL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dA9uFVQvjFWD+pBsJMboUnNLOL2sqDF0CUWGpX/nmkDddEc1CYc0DN9mlfoO4zJxo9fPdq3Ro5fdvs4Ylra0HZMDcD2rbOrumuyCWzVKifEN7yjQvWoIKFhuCvGyRvjs2rXdYlflWjsq/KKpCcqVdSktxPgkLWrZOlYoxEzJYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA5ly8zC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CA5ly8zC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D871F000E9;
	Mon,  6 Jul 2026 19:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783367018;
	bh=LpYBDzzTpttvxZ5Prf6UTUzPZ6dzUGSbel8XI7kLx+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CA5ly8zCxElI0S9SwfsRdKOPley0dGdAR4UN/USh7CXrLnT7DufZzWgpPo4f3VBwT
	 oEoXXCQhH0IkSuVMGO3+zLxy37q6dTyt1SxU8ta6wGhmQKk6tsOpWucJiww8fvwWn8
	 q7nBJnQDRLGC3XxVcyxPC1i/k8x0XgunsaUK7WFFOZ2HmnQ/ro3qdMZu328lsbPI9d
	 DW22fhWhkAyExxKGm+qO+PV2ysz+ehLCLgme+UOEfjYXTPDURMBBGLdDX+R2eGSISY
	 ejY4Chzb6siLy+GfhGG1P+kS15rCgAmvXIBreSeuK2l6FNPUDfPV33CZd6FZ+xavAk
	 q/B6AzlWL/FGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/13] drm/rockchip: dw_hdmi_qp: Support 10-bit
 YUV422 output format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260706-dw-hdmi-qp-yuv-v2-11-b91beb33dedf@collabora.com>
References: <20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com>
 <20260706-dw-hdmi-qp-yuv-v2-11-b91beb33dedf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 19:43:37 +0000
Message-Id: <20260706194338.68D871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `atomic_check` callback incorrectly modifies driver private ha=
rdware state (`hdmi->tmds_char_rate`) and invokes PHY configuration functio=
ns (`phy_configure`), violating the stateless nature of atomic checks.
--

commit 6a5a6d9518ed6863c0bd7d0093aee570c295458a
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format

This commit adds support for 10-bit YUV 4:2:2 output to the DW HDMI QP
encoder by configuring the PHY with 8 bpc when YUV 4:2:2 is in use. This
keeps the output clock aligned with the TMDS character rate.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c4cf68d79d50..78473f9a0fce3 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -215,6 +215,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_e=
ncoder *encoder,
>  		s->output_mode =3D ROCKCHIP_OUT_MODE_AAAA;
>  		break;
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
>  		s->output_mode =3D ROCKCHIP_OUT_MODE_YUV422;
>  		break;
>  	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
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
>  		hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;

[Severity: High]
This isn't a bug introduced by this patch, but does this violate the DRM
atomic API contract?

Modifying physical PHY hardware state and persistent driver state
(hdmi->tmds_char_rate) during the stateless atomic check phase could cause
problems if userspace issues a test-only atomic commit.

If a compositor issues DRM_MODE_ATOMIC_TEST_ONLY, phy_configure() will prog=
ram
the PHY hardware and hdmi->tmds_char_rate will be mutated. When the test-on=
ly
commit is discarded, the PHY is left in an unexpected state.

A subsequent real commit might then hit the fast-path check earlier in this
function:

    if (hdmi->tmds_char_rate =3D=3D conn_state->hdmi.tmds_char_rate &&
        s->output_bpc =3D=3D conn_state->hdmi.output_bpc &&
        s->bus_format =3D=3D ingest_fmt)
            return 0;

and skip PHY configuration entirely, leaving the hardware incorrectly
configured.

Could this lead to hardware misconfiguration, visual glitches, or black
screens?

>  		s->output_type =3D DRM_MODE_CONNECTOR_HDMIA;
>  		s->output_bpc =3D conn_state->hdmi.output_bpc;
>  		s->bus_format =3D ingest_fmt;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dw-hdmi-qp=
-yuv-v2-0-b91beb33dedf@collabora.com?part=3D11
