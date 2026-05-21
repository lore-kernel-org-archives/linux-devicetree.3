Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D4F347BD7
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376136; cv=none; b=t4/4PobI287wXUwp+Q0p+1Om06sqzTpPZ2PTJmPiggsXJHyr9QMv2vwlYN4seL6Tij0rfuYqkXY4InuThkCt2ADXbG18iLPMRqY8jzzBX/Le5PV44bPWokVToWFsExoZffrvw6OPoqrc4xCPtqF0EaQTpGWQnjYDNvNSj9L4Cdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376136; c=relaxed/simple;
	bh=Q/z/ME+rOqmH2CEAK5U7U1JU26DR/q1ddXd/woZCseU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hb94zWcDPDFKChBXSnKukn4EIoZ0mwJdigT2mkt3O465os8aPbLraV1e1IlXkryxAebQ8m4q5SVRoW2qqiBaQPH1BBHYM3oh5pAQSSQguFKzrfiJGiPZD/nlVR9GDC/k0booHxMeWRWU1zMX9EaUsAqnnNN1rezecfOP4h8d3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/AA6XJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/AA6XJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB9D1F00A3B;
	Thu, 21 May 2026 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779376134;
	bh=wBZnRerxBnIPKqEkFoHIOHsRlqHRmRL+50IEQjaerR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n/AA6XJm2b/3OnJPPbs++5TK+LjMRGOE0nKbjUQWv7RNUoFe2lBq7hRUzZn5O74aS
	 QUF6AuDwTFQIUaAYnMwYCwdFlQ5gnj72x9aZBC9ryBX/9stG0R/xjjJj6hFBY6ReNy
	 3wagWHMGmqcA/eyL4kkFvaES506Uld0jXg+J2SIRzJbYQcMGqv3F4ffc/gWY/JpLo7
	 +mOkfbsDkKlHK9r8VOjw6OZU5LclCuricypWiZoQmp02jj+i9U+VehaBVIUSx9gsLa
	 AxCKT/tfTaj5Q1FcWbTgKJI3GDCV/SdU/JPE3VMxYXATxPsuFrLoODInTMP/Mh+52J
	 khU1hdeX0HuLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-1-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-1-a4dd5e0850f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:08:54 +0000
Message-Id: <20260521150854.ACB9D1F00A3B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failure to clear `msm_host->dsc` and `dsc_slice_per_pkt` when a pa=
nel without DSC is attached leads to a potential use-after-free.
--

commit 4b3fdd757a84f263ad4c869c8ef48cdc07ee2b22
Author: Jun Nie <jun.nie@linaro.org>

drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

This commit adds support for sending multiple DSC slices in a single packet
for the MSM DSI driver. It introduces a dsc_slice_per_pkt member into struct
drm_dsc_config and updates the relevant timing calculations.

> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi=
/dsi_host.c
> index 565d425f88b86..10589389650fc 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c

[ ... ]

> @@ -1718,8 +1708,11 @@ static int dsi_host_attach(struct mipi_dsi_host *h=
ost,
>  	msm_host->lanes =3D dsi->lanes;
>  	msm_host->format =3D dsi->format;
>  	msm_host->mode_flags =3D dsi->mode_flags;
> -	if (dsi->dsc)
> +	if (dsi->dsc) {
>  		msm_host->dsc =3D dsi->dsc;
> +		/* for backwards compatibility, assume 1 if not set */
> +		msm_host->dsc_slice_per_pkt =3D dsi->dsc->dsc_slice_per_pkt ?: 1;
> +	}

[Severity: High]
This is a pre-existing issue, but does failing to clear msm_host->dsc and
dsc_slice_per_pkt when a panel without DSC is attached lead to a potential
use-after-free?

When a panel driver is unbound, the DRM pipeline is torn down, and the pane=
l's
memory (including the embedded drm_dsc_config structure) is freed.

However, the msm_dsi_host structure persists in memory because it belongs
to the DSI host controller driver. If a new panel without DSC is subsequent=
ly
bound, dsi->dsc will be NULL, causing dsi_host_attach() to skip the assignm=
ent
and leave msm_host->dsc pointing to the freed memory.

When the display is later enabled, dsi_timing_setup() executes
if (msm_host->dsc) and performs a use-after-free write
(dsc->pic_width =3D mode->hdisplay;).

Since this patch extends this pattern to the newly added dsc_slice_per_pkt
field, should there be an else branch to clear these fields when dsi->dsc
is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sm8650-7-1=
-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org?part=3D1
