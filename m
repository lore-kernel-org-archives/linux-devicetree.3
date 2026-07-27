Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236693DDDC1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140753; cv=none; b=heR+bQh3YwAVi4LXNeQHrDF0gsjblLpxzAJXS/Uk5ovXQPGmIp9gy1Z87m/KVr72WqkvGKLHEyKWgWUkPE8uNMkzV6OFdT+6UnPLhTY1CMdoN4d7W/qFSlZOxTFzjpNpnZ8uY73ATTGRL3DubGB4sBC2IkVuzXJ7S0p7j9/nmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140753; c=relaxed/simple;
	bh=doOxW3+33T9343MNIAI7HAgk3b1ei2NNBAKayq5L1Qc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dVaaPhJEfS+gUQ99cN9xT5BP2hQmw4zK8wyXixOCALUMgOhau2T5BRiK911mmImiFb5MPNB+1f2jNNdmWbP5ORUHxEfWBA1qTHaIiPm0AIpIfcj1abMID5mBFbvd4qMIiJvqke4tlpjm1b7h+3y/Ek4vYzzygy2Yjni3nIuIajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjUMdcal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjUMdcal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1761F00A3F;
	Mon, 27 Jul 2026 08:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785140751;
	bh=QaqHFytc/fZtx3ZeHQ1s5roWEcIVp5K9z4haQ38THJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JjUMdcalv9+KI4juNCrj34bvL6ePL2cuwrRrOugup0+KQ6LoNS61+9jwM3vlT94bc
	 otbAPDAk72Xf0PzIZmmOS6WepQPzGORtVI8AfOeJt6vi1C4Va6yXNR1lrYoj982y8g
	 ZPVhqlwPLAP0/2tl/89LCovRLmFZQM/8iaCneTlQHEHZmx3C+gFTaTGEOrYVvrBbCn
	 NXMwgSF7qxkAlKl5CWwMjcKYvYa5zV6p3VElNhOok/X/KEvN9SEIyYsK2rXRA5o3X+
	 MgkNNkQbOmZEaSbs4kpucGX46488i0LH322cVOKZZ3LRlFZUf5WjkRhKkXiJyuPcrA
	 16mD3Hd406itw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] drm/msm/dsi: Support dual panel use case with
 single CRTC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-4-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-4-c042266b9eeb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:25:50 +0000
Message-Id: <20260727082551.6C1761F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Mutating the shared `dsc->pic_width` field in the DSI host driver =
corrupts the upstream DPU DSC configuration for dual-panel displays.
--

--- Patch [4]: [PATCH v5 4/6] drm/msm/dsi: Support dual panel use case with=
 single CRTC ---
commit ab7fbd44233bae5d942988068bde384adcd14200
Author: Jun Nie <jun.nie@linaro.org>

drm/msm/dsi: Support dual panel use case with single CRTC

Support a hardware configuration where two independent DSI panels are
driven by a single, synchronous CRTC. This configuration uses a bonded
DSI link to provide a unified vblank for both displays.

> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi=
/dsi_host.c
> index ca9862848a6ab..badddb534b01a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
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
Does mutating the shared dsc->pic_width here corrupt the upstream DPU DSC
configuration for dual-panel displays?

In a dual-panel setup, dsi_timing_setup() overwrites the shared
dsc->pic_width with hdisplay (which is already halved for bonded DSI).

Later in the atomic commit sequence, dpu_encoder_prep_dsc() reads this
mutated value:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:dpu_encoder_prep_dsc() {
    ...
    pic_width =3D dsc->pic_width;
    ...
    enc_ip_w =3D intf_ip_w / num_dsc;
    ...
}

Because dsc->pic_width is already halved here, dividing it again by num_dsc
(2) results in each DSC encoder being incorrectly configured to process a
quarter of the screen width instead of half.

Could this misconfigure the DPU pipeline and lead to display corruption?

>  		dsc->pic_height =3D mode->vdisplay;
>  		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-sm8650-7-1=
-bonded-dsi-v5-0-c042266b9eeb@linaro.org?part=3D4
