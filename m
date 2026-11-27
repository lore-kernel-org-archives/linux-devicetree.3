Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771315;
	b=5c5urOva+QYcC/UFFnoEd+GIvNr9Ieh8VAFv8XXL4ex1LY6K2QX64PqmAbI/9UmcIQR4
	 V2iy46NZadTmoEciUM66dxvYtza9zWq9pOwTM7r0owIHu1xZirxHy++McWzsPoSvjKwKr
	 /1GbGEjku9RmC/4XYuaeZMarT0QYkxCsGs+8Ux0Tg/XI5OkGS3vPPyXHXSHhjcMQIzZFU
	 +M9dNzBVLpGc1Ceykd5uZy4ELtJXH0hkALw5FS1FT2wqAYMHIy1c7T3W83nGiYFKvQz4Z
	 Ww29/XuPZOhzUvd7nEs59LTCT9RNCC11D66ABUcT5bTas3S39LTWBWd0AWTQTK0iWtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
	b=qv6an5BaJUfNXQzFzTT8n3VjZbIgDsNyltA/2iA7uR1gNHz3l2lAbvMRC+CAXAb7uLDr
	 QZryd6MynmG41QaOaW1r5yABFCfoxziR1odgB2RgqO8QKKkWCoPCnBuCBeJ1wBnqkXW+u
	 nnntend0xvOTeypvhqKad2GnYUVAhHziwjMZ77dfl2Fl8l5mJyWjbQKK8chSFodgx+2ex
	 iqnmACWnCy5f51IAllmy/GSN7aBToqLZ6LNOvH2PJlv5ivOpooWmL6dCM3hx4UXIdnt8F
	 HBjlJa7MGfM2izEH4IzOi0A1bEMkiW1cCI7tFt3ezIwQH4sxhJ8Xh5xtSFeMmm9QsFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db4rXmoK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD8606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FD8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db4rXmoK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3869f03af6aso6963149eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771314; cv=none;
        d=google.com; s=arc-20260327;
        b=mjc2Qrn6t2TpblgxCgVG7VW9iq0WFb2870RAJ/zqY1Co5mgkJn6PuwmxkZLQI4VOJh
         dGMpDyuTe3wmxn7l9qNMcXPawWetS3no2rwyYvCmi3Ris76e4H1rguKSNSOu+Xi2gjcf
         lb6nJWpeACRfYTWy9wlS6FCeBzZqYZIsqK5ADUsbAnryiYARUGiVFfiPzgwV9TOf8IUQ
         xHBOHBl/Me5jeoouUxIIqQS2iAy6AmLslNr63vT+mnj184Y3fc1/ebke3Ul90wpCtDF4
         1x3nMIyODybdPsV6iD5kjgRav3YOM3FCcz12PY4A6Eogacyp/vcaeI73NN2rIV/1jbAj
         /o2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        fh=x/TRXWOzD4oUykVdgDrn4otqR1DFHYhxUVqDbalUZeI=;
        b=XLylFt7VBOpUMsggQ7MnvrjHgLvvSxIiLcebrxMDE6pJh3j39G3/uPFYjJWJTckwyg
         0Kz+PYDDztcdHC67ClZ/IyEEB+hqLu0sek7oKtbyUV27qQ/H29RtwYbVwn7MusNAhuFc
         eACHKYV8M6bGiMTn25QcuO7f2lN4zXULeNgeUx9s1V110AKtxpdtkUWzjzQ3JIeb3+YN
         hspZDBW4fFNTz5MosW9rTKratGEmNZApR7FLNt/pZW6YIvMwUfb0ryU/JgO6Gx7gevKE
         Qp0EdsUESs2Aw8QhZEyl0pK4zU+fc3c0HBAeKIMi56MTgI6r4KFpvl5b/I91GraCU5yG
         83lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771314; x=1796376114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        b=Db4rXmoKZRcliDEDP8BIj49W67I5o1jlMhpiIMdBYulpofHZDKjqiALfNz7rvLeeyP
         TN4FKyPxCi1lEK5eWxGzaKTw/O0PcYG2PsGeweSc68Sf/jVStA9qIZ5z2QQmCTyXS8Zy
         CsgAc5PBfBOtDOY+iY6aHufIATlpMVKdc71RzvmsTdkmsNeJt3Q//K87qDiwAMH1knJw
         kW/EWLSVRLVAIda84zt7gHAByzyPB9ewmaFYCUTPusqiKH0R+MnEkSecPs29oRa3mPvz
         H6TcVgsm7r1VyvF3rb4eU3zXSeIZtSTdcuSaoBPasNuQvQwTla+TY8hteC6RC+dBYvce
         k2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771314; x=1796376114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        b=aJ/PKbgBH6umpcn9V6K6Oa9W2enU2MC95DD4niQdGKkKwk2gKpyoQh1wVfECeptbU0
         fgAWl2+DBDH0H20Lg+xUy/M8Nci8zXc12p/huaKCP/yitgo2lRgfMuWrsY2ul3fN/u8N
         4EdkPre/sZr9X5NiLdNb/3AnwdbYsU3M/mEIUWFzsclQDkJBJf0cgAbt6Fqf8xZ2dzaE
         Yo1s29UM3AFfiwiBvUTPEF8u8Gx0G8dbngqmGtd/Iyt3vtojebxTCBZAwOkVU8MCqre9
         jZ7A83IQZZpCt4bhpG1CKNUHR5s6ZJyeAF3wrWqJxyEaTp9L2hcSe1YZlmoFmXzDh806
         5IZw==
X-Forwarded-Encrypted: i=1; AL+hErEWVHc5g+Ok928KpgumUzAVfHDTdNfyUqB48HlbrKm+uzA9LYviVFe9rKpy3j7lEQ8dCWYAp26hsv9Z@vger.kernel.org
X-Gm-Message-State: APuU4Z9YxiIZ1MZTx7Cb4KwZ0sKuy6L2QDDsimj8GIhRqXK4gsgsCXBJ
	t76p3t9OamuCEPGyh0aIFgjhr8e32RgrJeUB+tdoth3pBOXtrKZyBN5UgM7pYAdI/Qcq6mZzt4S
	mRmjYLnfhhbtTnVMglQLLdc1NMJ+CUfQ=
X-Gm-Gg: AZFdTZcesfqjNdFEka0qICW6mfRceDEwYlqPArAhfNZBoo6twIbeAPqrJrs4QVCFgvS
	Bjz/0kaLRjbX/U0rGEgmw0698RekWRpukq37Jd77RMPsA26oAz4HoH0xB1hoPnWu03Cixs0UIE8
	xiTcknuZzK43KyItmQjK5sdpYgfBupwkAvnRp9TvOkDQ9YpQXFOUbdiwZ3nKkYY3ahSTR/H4DqC
	2ejsEOEpY5IRVTrvSpcJ+rAd6H9qwNfZlyjoUuS6k6+KcWjwLHu+IQEx6bz6gp4flcdohpFjy5c
	1j6OQiLe5TWjgE84Rk2dRGTZyZnDo4xPcVQ8ZeRFzQ3tmXNBphHWgimR4ubLueMof44r2SwqBLV
	gbqVfwp/rUZqGKNNbCjNC88c2OswFhJuon+Jlb+Oe/a+CiVMposm0V+Hhs5kgn9K128R45FhcfW
	yPFzScn8WS7BIETnBeYyHDrKrSVuHF8Q==
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id
 5a478bee46e88-3852ea8d7d4mr33082873eec.23.1795771313759; Fri, 27 Nov 2026
 01:21:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-11-clamor95@gmail.com>
 <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
In-Reply-To: <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:21:42 +0200
X-Gm-Features: Aa3M54r9PD-vpDJoY894sGmJ09TY6pWekwcQ8wsOPcIm9P2nFgYst_79Ta6LzYI
Message-ID: <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08:2=
2 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Parameterize configuration based on bus flags passed from the bridge or
> > panel. The list of supported flags includes now pixel clock polarity,
> > display enable (DE) polarity, and data alignment.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> > index d48d498068ac8..faecd6f94359f 100644
> > --- a/drivers/gpu/drm/tegra/rgb.c
> > +++ b/drivers/gpu/drm/tegra/rgb.c
> > @@ -5,6 +5,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/media-bus-format.h>
> >  #include <linux/of.h>
> >
> >  #include <drm/drm_atomic_helper.h>
> > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm_enc=
oder *encoder,
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_rgb *rgb =3D to_rgb(output);
> >       struct drm_connector_state *conn_state;
> > +     struct drm_bridge_state *bridge_state;
> >       struct drm_crtc_state *crtc_state;
> >       struct drm_connector *connector;
> >       struct drm_display_mode *mode;
> > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct drm_e=
ncoder *encoder,
> >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> >       mode =3D &crtc_state->adjusted_mode;
> >
> > +     /* Get but flags from the bridge state. */
>
> s/but/bus/
>
> > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, output->b=
ridge);
> > +     if (bridge_state)
> > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > +     else
> > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > +                         DRM_BUS_FLAG_DE_HIGH |
> > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > +
> >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
> >
> >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
> >
> > -     /* configure H- and V-sync signal polarities */
> > +     /* configure H- and V-sync and pixel clock signal polarities */
> >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
> >
> >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct drm_e=
ncoder *encoder,
> >       else
> >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> >
> > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > +             value &=3D ~BIT(PIN_LSC0);
> > +     else
> > +             value |=3D BIT(PIN_LSC0);
>
> I think this is the wrong way around: SAMPLE_POSEDGE means that the
> pixel data is sampled on a rising edge. That is, it should be driven on
> the low edge so it's ready for sampling in time for the rising edge.
>
> LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly, 1)
> corresponds to a data transition on the falling edge, i.e. sampling on
> the rising edge.
>
> Section 31.9.6 states this a bit more clearly: "an active low pixel
> clock means that the data changes on the falling edge of the clock, to
> be latched on the rising edge".
>

DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE

Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?

> > +
> >       tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
> >
> > -     /* XXX: parameterize? */
> > -     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
> > -             DISP_ORDER_RED_BLUE;
> > +     /* configure DE signal polarities */
> > +     value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > +             value |=3D BIT(PIN_LSPI);
> > +     else
> > +             value &=3D ~BIT(PIN_LSPI);
> > +
> > +     tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +
> > +     /* configure DATA order and alignment */
> > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > +             value |=3D DISP_ALIGNMENT_LSB;
> > +     else
> > +             value &=3D ~DISP_ALIGNMENT_LSB;
>
> DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/MSB
> bit ordering in a classical way, instead:
>
>   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
>   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
>               R[7:2], G[7:2], B[7:2]};
>
>   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
>   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
>
> I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> panels depending on the layout. So the correct value depends on how the
> panel is wired to the SoC on the board. Hence, I think we should
> describe this with a new property in device tree under rgb/dbi or
> endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> document that this means the above kind of wiring - not all RGB888
> panels use it.
>

Ugh, why is this so confusing...

> > +
> >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
> >
> >       tegra_dc_commit(rgb->dc);
> > --
> > 2.53.0
> >
