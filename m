Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086A36A34C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378656; cv=none; b=hEI29jSVajBObkJ5FlXRFYqRQjy+sWj7E0YzkJYmeSSgiavd7IQdf3JcqvhRaLAU7UJ0TwQYvy/XEAH+aMRNwWC7auw25wH5xqPb7Fp04Xp1HlqG7De3TpUTGfrNgJwMOmDYzvVMDNzgyI8z8hyQKlpEXYGql8+LmClc4xGcBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378656; c=relaxed/simple;
	bh=en9WwN6CQim2LkMYVDsNsmVA8jTo8vUnMb9zjN4UVQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bh+V6nEvk3sqW8mMssP9tuOD+Dm9wAhaDeBIk2CgznvWwLFhWGnPnuoLh/uCBBO7e2cB7xINmfoYV1bb8NbRs8d7P9LCm3l+81uQ6BC1KkpW8Mk1C1zYPhKMtqi60EpEToWGeTUwZ1XmjqnwpqRtBOR0F92rmkcgPqBCyz38FzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhZJmF3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhZJmF3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245961F000E9;
	Thu, 21 May 2026 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779378655;
	bh=8fN0+bBfFYQZdK0lvhbreFdvXRCiJc2QMqpAg0NBHgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dhZJmF3gR2DrYLrbgOIc/zIGhGoK9cvGQlf7VpQyrLyET6EtJLaaw5cUSGVwr0pJ0
	 bHczqErYzkEYq8wMdqGn6N8fR4EM/8wujZuSsZSD6sBL3I71uTxmy083R/BlH59ojF
	 ZRYbtSMqgG+cmq11u28BCF82NQ8+i5qWQtneKxYhDbbkOtYfv9jPS37WDMQRnVZdji
	 TVwHj+j8SWWlYaYmB7v79qMyg7KO3wBNeyjDYw18N+pXHg3g1qktpXT/haGd1SCWjA
	 FUBOkDjP81QifvdxrEzYsdJl3VmdH2XUWt0n2tfdjLDioc7rG/Ni69SghsaH1ohX06
	 z/ia+Rf9EoKsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] drm/msm/dsi: Support dual panel use case with
 single CRTC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-3-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-3-a4dd5e0850f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:50:54 +0000
Message-Id: <20260521155055.245961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Halving `dsc->pic_width` for dual panels causes the DPU DSC encode=
r to incorrectly program the DSC hardware, resulting in a halved processing=
 width and hardware underflow.
--

commit d23a05783cbe32106f4e17b417f7304f721a2609
Author: Jun Nie <jun.nie@linaro.org>

drm/msm/dsi: Support dual panel use case with single CRTC

This commit adds support for a hardware configuration where two independent
DSI panels are driven by a single, synchronous CRTC. The driver halves the
CRTC's horizontal resolution before configuring the DSI host and any DSC
encoders to ensure each panel receives the proper half of the framebuffer.

> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi=
/dsi_host.c
> index 10589389650fc..4a391cdd4030a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
[ ... ]
> @@ -1024,7 +1025,10 @@ static void dsi_timing_setup(struct msm_dsi_host *=
msm_host, bool is_bonded_dsi)
>  			return;
>  		}
> =20
> -		dsc->pic_width =3D mode->hdisplay;
> +		if (msm_host->is_dual_panel)
> +			dsc->pic_width =3D hdisplay;
> +		else
> +			dsc->pic_width =3D mode->hdisplay;

[Severity: High]
Can setting dsc->pic_width to the halved hdisplay cause the DPU DSC encoder
to incorrectly program the hardware?

The struct drm_dsc_config is shared with the DPU encoder driver, which expe=
cts
dsc->pic_width to represent the total picture width across all DSC encoders
for the CRTC.

If the DPU driver calculates the encoder processing width by dividing this
value by num_dsc (which is 2 for a dual DSI setup), won't this result in a
processing width that is a quarter of the total CRTC width?=20

This looks like it could lead to incorrect pipeline delay calculations and
cause the hardware to process only half the intended width, potentially
leading to display corruption and hardware pipeline underflows.

>  		dsc->pic_height =3D mode->vdisplay;
>  		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sm8650-7-1=
-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org?part=3D3
