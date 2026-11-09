Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217705;
	b=RNVCaqt02cR1EmcnA8EugQCS8rLdVHlzAE54TknidOIY+TmXi4wk7XtSzb/X2WN7gOAN
	 Q/yZAF6m71s3sNcz8NUhq1HV9onxQUf6SlS9zZKa7FomnnexW8vRLEm3i/YX8tVlg0/Y4
	 qFEd6LfylTIY+36PDExyX51aPq72XmtIHu8aTku5UpAbl2unINmOdfgpCZa39lfbo+uFD
	 nqL2PL9IkCVy9OaKVsGs5zWKPYao4qejhvilCEDNURXDP640vHS/0GCxXLwrweCBXmAIo
	 1SrspjF6OtORGVNnxSP5Kg0dcH8eRPgxXFzHlTJ+XC1DyUxtY6DYIRg1r6iguIPoosg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
	b=HGxxpCtrUxquVvax1DrX2HcvSEpxeZl5Z6Z4KFOmqf/0jKUegBBTmHI6P4PPeH1ZtZs8
	 /j9F9B9wPWmnKu9k9Dw0kGytel8igp7petPBJORMrS1MjMw3Nflri0pAKu8KQ0PCUqhaL
	 SAyWnTT2GwxE+yyCNde5VQVVJovQLFfvbtW2YbsA4NxuSTvsAJIvcmdaUkSb840oKC+yx
	 CFpy0QennD/Yq6DbJRQwOweUusy3MdbfbN/YrRqH0Ri6tMuZgXlzPHzzzVGb/hTtsY7da
	 V85YMXvrfKKy9Ss55oe5P8d+QixQK6BMMxJ+c9AqUkK4EOJcegP8WOskxyLpAaUVLMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZlXBi8H9;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80035606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80035606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZlXBi8H9
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so1637215ad.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794217704; x=1794822504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=ZlXBi8H9C2Qa2qEGgPdejR/SS31GPaYygbtar6zhc8SyfN1DctEWEA2i+UaAJg6+5z
         Gxgajq92FoClUY92/FrgKYVXG71iQC6yUOwaPDrpygQuYVxkHJv52k/C77+oyZ8J/rjh
         iAN3RIydrnJT/whqUyD2xQsbFL5bKUmNUZ8Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217704; x=1794822504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=m0hSz/jXpOvnxzRAVpsTgr0Vj5UHsE+2PeRr3gzkR+3nW7phoL7bE2wGyTJdEDMqsr
         e1KI2r0kbLc53i2X4jYeTQKXWx1uwd6F6DWvEfBqjlTCnKZEr6IauQFIhCM6LUtO8j1H
         xB3que5f0YTqqrKXaNIiG3mop60vmFauWqeUD7rhmEcDSSbD8bVFamESeAOTt60NpYxN
         +W3JdI7Q7tnNoCGyUJHhhlhoCLkF/fU2KnVDCGFDeHvyK351SF2J6UUdE7x9oaPD/X2N
         DjlweqtpntnVSyTSK87jF2L68wgTLQ3bB8HGoHrmsD1lZksIEkVOzSA6ZKSq4cENS/OW
         A7DQ==
X-Forwarded-Encrypted: i=1; AL+hErETpIiAQH5DoHsRuvKnXvIFhDDhVu/zK6kzAPEh2T15FF7rpjYnJZpoRo11UDXNic82uTnamfLYtX0A@vger.kernel.org
X-Gm-Message-State: APuU4Z/c77DLN5lP+sI6TjJ4el+ygBIUg+Fz7XUnmI7G6/jFKvWsll8g
	lNhAeLYuTOAenIGCQkCT7r2WCSLrAAcLR5e3D1vXX4so1cSvZhhwHcAEcG/DfZhkrLLEK9AWcSZ
	mbf4=
X-Gm-Gg: AYBFou1g9lJwS0EHZPuzll7crECmFZzlLcLYyNy/yjx1BMi4xsDtFKaLoubMQvaTCuC
	sG4MNmYwru3A9pAZVNJo9sxuIghLxuuq5EinEd4BopoHT+zNd+xZQFVuCdrT4Kh3aOK5tC5hYEn
	fCZmz9VGCSKj8crnYUhlHsr34uENUY6CbKPh2A8/eSAt8QWF+NqExu9VvEsxpJkh7I+TwM9/zQq
	QbxPXE5BSZFxSlsKdoRJmeToBBdngOGjbjHL+kCw+TcPFM7wxzKyJWdOP89iWmLQ5oEeDWEbqJE
	4LZQKOj19JKP6IF3zhxGfxItI5eyYO1VWbNj/kbX9TLR66HENrpqa80t7E1jzBPpZpOf5POrivc
	FLl8E1cPCRnS2vYb2VkgVUb/nxpJ0mrLXrXSjTGNvRo4HxjXXKC6zI6flwmBewCxSqEoKtZM+CB
	KBEGgZ6F+olCi90eOMDXaHGT0qMw/Mr17fodW3alWYTAwpnKJL32RNtTpE0n14s4JeMMmzJFw7G
	jE5KSprH1E0BxlUXmCqeuJrRn2dg0uMNOE4Iu5TLOqiQx4yx0Ww+Yyq2vfUoYrG/hrFyhAIHUDM
	Qykjrs0IJgh8nYHn9/kx9vYYBQ232dKWgQz+GvlFYxm115VEM9I73kWOQNu9ldyrvLslxZLD1Tk
	BMZAeYegn
X-Received: by 2002:a17:90b:2d84:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b12d0e9771mr3248263a91.6.1794217703916;
        Mon, 09 Nov 2026 01:48:23 -0800 (PST)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com. [74.125.82.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1032c4508sm5603312a91.2.2026.11.09.01.48.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:48:23 -0800 (PST)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1028169c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:48:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFfGGq/Cvpy1MWYH3p6E0xzK9l2/qgm7spir03DdlSNGFIkYiBQIj2fIEOtX+3tBAqpFmX2yAd+6qZX@vger.kernel.org
X-Received: by 2002:a05:7300:ce86:b0:35e:f1a5:9ba6 with SMTP id
 5a478bee46e88-37252b4c091mr6436576eec.5.1794217702332; Mon, 09 Nov 2026
 01:48:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 9 Nov 2026 17:47:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
X-Gm-Features: AclHuK_kbp2RlyhWxo_Xx4hVQaPPUEY10kfNvYs17nATUWr47nBdslkFDfWhjSg
Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
Subject: Re: [PATCH v2 09/46] drm/mediatek: De-duplicate internal component checks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Both mtk_ddp_comp and mtk_drm_drv are performing similar checks
> to distinguish components that have an external driver from ones
> that don't - with the exception of mtk_ddp_comp also checking if
> the component is related to a backlight driver.
>
> Create helper functions in the main component management driver
> mtk_ddp_comp, one to check if the currently checked component is
> internal/simple, and one (static, internal to mtk_ddp_comp only)
> to check if it is a backlight related one.
>
> Since the amount of internal/simple components is lower than the
> amount of ones having a specific driver, and since it is expected
> that most of (if not all) of any new hardware support will need a
> specific driver as well, the helpers are doing an inverted check
> compared to what the code was doing before, as both mtk_ddp_comp
> and mtk_drm_drv were checking for external component explicitly,
> while now they're doing the same, but checking if NOT internal.
>
> Also, while at it, for the OVL_ADAPTOR components case, instead
> of checking for MTK_DISP_OVL_ADAPTOR, call the already provided
> mtk_ovl_adaptor_is_comp_present() function to check for this type
> of component.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 46 ++++++++++++++-----------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 16 ++-------
>  3 files changed, 29 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.c
> index 2ba2123238b3..a9c3e29fb340 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c

[snip]

> @@ -700,26 +720,12 @@ int mtk_ddp_comp_init(struct device *dev, struct de=
vice_node *node,
>         if (ret)
>                 return ret;
>
> -       if (type =3D=3D MTK_DISP_AAL ||
> -           type =3D=3D MTK_DISP_BLS ||
> -           type =3D=3D MTK_DISP_CCORR ||
> -           type =3D=3D MTK_DISP_COLOR ||
> -           type =3D=3D MTK_DISP_DSC ||
> -           type =3D=3D MTK_DISP_GAMMA ||
> -           type =3D=3D MTK_DISP_MERGE ||
> -           type =3D=3D MTK_DISP_OVL ||
> -           type =3D=3D MTK_DISP_OVL_2L ||
> -           type =3D=3D MTK_DISP_PWM ||
> -           type =3D=3D MTK_DISP_RDMA ||
> -           type =3D=3D MTK_DISP_WDMA ||
> -           type =3D=3D MTK_DISP_DPI ||
> -           type =3D=3D MTK_DISP_DP_INTF ||
> -           type =3D=3D MTK_DISP_DSI)
> -               goto end;
> -
> -       ret =3D mtk_ddp_comp_init_internal_comp(dev, comp->dev);
> -       if (ret)
> -               return ret;
> +       /* If there's no external driver for this component, allocate and=
 init now */
> +       if (mtk_ddp_comp_is_internal_comp(type) || mtk_ddp_comp_is_backli=
ght_comp(type)) {

If I understand this correctly, MTK_DISP_BLS and MTK_DISP_PWM are
bound by the standalone pwm-mtk-disp driver. Initializing them as
internal components requests the same exclusive MMIO region and fails
with -EBUSY on whichever driver probes second.

Drop `mtk_ddp_comp_is_backlight_comp()` here so backlight nodes skip
internal init as before.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index e956e1966b86..18683aee61ff 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1166,20 +1166,8 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>                  * blocks have separate component platform drivers and in=
itialize their own
>                  * DDP component structure. The others are initialized he=
re.
>                  */
> -               if (comp_type =3D=3D MTK_DISP_AAL ||
> -                   comp_type =3D=3D MTK_DISP_CCORR ||
> -                   comp_type =3D=3D MTK_DISP_COLOR ||
> -                   comp_type =3D=3D MTK_DISP_DSC ||
> -                   comp_type =3D=3D MTK_DISP_GAMMA ||
> -                   comp_type =3D=3D MTK_DISP_MERGE ||
> -                   comp_type =3D=3D MTK_DISP_OVL ||
> -                   comp_type =3D=3D MTK_DISP_OVL_2L ||
> -                   comp_type =3D=3D MTK_DISP_OVL_ADAPTOR ||
> -                   comp_type =3D=3D MTK_DISP_RDMA ||
> -                   comp_type =3D=3D MTK_DISP_WDMA ||
> -                   comp_type =3D=3D MTK_DISP_DP_INTF ||
> -                   comp_type =3D=3D MTK_DISP_DPI ||
> -                   comp_type =3D=3D MTK_DISP_DSI) {
> +               if (!mtk_ddp_comp_is_internal_comp(comp_type) &&
> +                   !mtk_ovl_adaptor_is_comp_present(node)) {

And here, pwm-mtk-disp isn't a component driver and never registers a
component. Adding a backlight component may prevent the DRM master
from ever binding on SoCs.

Add `!mtk_ddp_comp_is_backlight_comp()` here, and in
`mtk_drm_register_sibling()` in patch 40/46.

Regards,
Fei
