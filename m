Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785673;
	b=Uo/8pE+7AbK137MX7+MEsFroLBzg46fizF0+xNTKip17vA6DYTI16KF31dKmQuaOU5DL
	 XyiXBRjcoPSxEOhkfI5RDZ0u/j5DJGwNGOtpMn5b0GOqLtiD728zmdDO/iLbyPdCwM3dY
	 UJwxphnQqC0EnO+ZrJSINSmGvhtIMZ7a4IyjXHH6z0E9GzWDhPTcs9y6b7T9OYnGJSjId
	 qdGz9p/3vBJEfA2D4XroTiM5WYG//AUXaxeD60/vzemvll12DsJs/HM/P+A7srpLCqY+7
	 sqYUYc7pBRNSR9AFqtzyZIbGLxGlG3RJqYnj1FP3I+lo6fFVMqCRPa0ZyXZwAWorPIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
	b=J9USM9jCoP6UZUxs89OZ138kNOOsEt49PWhenckfFbDQtizCw+d6wvDHJflEgWZerosC
	 VLji6O5FsgewVtZRgRN2+Fs1Qouf4yIRHRwccN9lVL+1xg2Ckf8sNkBXUCRStMYddsIpQ
	 CmMxDzt7UsPcVf1fofnrNhCKL5vFzRJqxwWjgJGx+qwaD9n0tPz4QJffvKCKk0OLM76Hk
	 3tyAwUnsvgPqNUUpoFoaqDIlgPU0yBlciH6oylfMFf2GTb+AZEdAsNCop2nzEKQHesNhT
	 dzQMa8lrA1ImP+mvVJyE3Hq0XWqu2Vj9KY9K1NXLaSbFOeJRvEHnrndUWXe2dIZxlww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HFQU6E/Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2E606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFQU6E/Q
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380c28f9e35so8944262eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795785673; cv=none;
        d=google.com; s=arc-20260327;
        b=EqGp9gAQ4g5Ywj7Z0qmOMvVeytFCfsDecHTcrPKYAc6MksjHiM+eZv52gG66t9HgTa
         ruXiRlDBfzhnTkrsHAPhSZ4EuA4dH3p7nzg2l1R/vdd6rXSrZGWEAP+L/z0oD2ILrYyV
         OkHiu7DOWt5Fli2IFHqXwihVmxs4BMjTzWPE7q2W2hvaw/xYqgySxDxZVzZNcX/0C4Bx
         MKnsMLH3eJ7Ya/3kEMMeZFsaxVUkk5ENi2ohGCPdiQQIvTw89ba8ApUz6dwkyh4ht0xP
         LLgHBm4LQDRPRWHYeb1aJRKVmmzhw/o+uzh+f17kdLf2a/mZcZktswy41WeORDlIGhM+
         SdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        fh=hYrUnh3yyo+PLPuNfeqp0mYvRTvtLT3kf8U/0+9jooc=;
        b=dSlknwsNOxF0qT+JdLN13larP+iJZqlsrSRsZnf+8j69vM9uTUYVwjSYa284oLO7dS
         8HE/Xxff4774wUbRWTcDDB7WW2/7wYNnfNLjJ4UpBLbrRm2qjPwdJH//msRxHf6ufoIF
         1BD94AAxGsX7l2gDVTZgWXBBBvdYGcCuhvJUtMrNIKlgA10CbdVEzKqg4Fs7Ti3+sHvg
         RJO6h03n3E5xTVlc697bmwmQP1dKPmIp9bu8MIyPRaWbCuFSO3L3MQjh9TFP+J87QD5e
         D/HE7QfR4uvwwNvkDpH7DrXvUfSW5oJwOwsy30EISahobJF1cIwngCa7MWHY3A8ijrTs
         2KIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785673; x=1796390473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        b=HFQU6E/QtvmBDmwLiDq9kncfd3FKte+jfI7n3fsgpKrU+ujHcifftF3NYaZBdCJdQH
         OK4kfsInbBbGoAgA5CTZV9ia1gTMWToM4NqB4nSh0LHN2XxREa8Cpq4t1HMzC3+2IpSq
         9KNb8hGyxna/08v9lqKFbJ/Ya9M5uiUWpJWCMDpsjz0V5Rf8UShGJSXe3Ovb8nia8X7z
         7r/3tM9hVsGdixiM1KQHinV2Vb0N2Z+jSEgtZ0XOW+LRAjfUnn9rsT+3ObOWGFF0XhyM
         6zDHZwBMwDn0oWLBZFKhzd7/RLn5xFEX+Ynjn/ECjWoLdygu2nYmv2asT16ADGuXeg/Y
         3Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785673; x=1796390473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        b=hB3VNnpUTXj4FFVdR1cZJcbnXhw+pwQaiH2bGnCw0Py/w//d6CoOLYPy1VM7GP5P9p
         +P1kToZgpomuxMKrIhCaysTx5JEgwGm5rvMSlyeAfYKZx3mgagpTABzcxTKQkkNOXNpb
         EEUcXzGOLqpES22eB9S8a4TKlK2rW9cNY0N0OsaeZTGLBtf7KPGXL6g2bkbkbT2W4cyA
         xXzXrJYwrEwG/4q7I34PWI036tJAXE+p6tZdroq4f/wrAQNOJXbJAHJz2xVwUaWDPj4w
         Far/f1QODAUT/oSKflkb+Ilaye02bGw6UmQ6maTYXleTnD+ywwvaChbn7y/d72VkiZwT
         197Q==
X-Gm-Message-State: APuU4Z8fSAyRQ7o6q4mfpsOKkpBAFY4jF2M6ju6irAbJL4ZAdcJJpKNR
	wukdkY/3Heh+oeLL6dkG/YAv8oj9q0aHa1ktdsuZywzgfejC+CbedWpQij1wgjUIvv+DxDCRP9u
	iSbtBlTfxP1s6dm8NL318Wc0Y+zhM47M=
X-Gm-Gg: AZFdTZdOIZiV+AiASTmTSOeuupIGznO05FF73Ua4ML2r2Bbn9UCf5DPf7aQ7Bb+qZZi
	DNlVWmDgrXt8AoHMnjQxw2uIhMjMp2RlRwEWCtsy4BP+xwvkNnY6JRQdWZ5MJOSx3Yx1a25mXnW
	8zK75l1nbuQCpcIAwUt+3Lp6GVR9/5jZqJg8BBuFX0/74YHKGmraNs8esVSzu8IxFw7lo7rvVDb
	xtD8xOlU2fyn8rQoMLgqDIh8FTU09HUMmhxKcdPkg5sgCpgRm54f0N/Bqy0w0BX2SwCWFtfWuRV
	LMKe9cjYMUp8L8NZMk9d/0u57nxzGUYDPQeK4dniwbvsd4OpB+3LP216GyWOLxd0qK6jy8qxFvL
	7fp9KrOZgzXFxIA0d3tqd2Esc6a8z8SbMKZr3zVMy9gVCUlBjfBuFiXwyT52bA0vdzTIFwHhyx0
	Tq53B3bsKrRe5s9cwqlnm/MuYB6wDfPg==
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id
 5a478bee46e88-384b3986edamr24820513eec.7.1795785672262; Fri, 27 Nov 2026
 05:21:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
 <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com> <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
In-Reply-To: <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:21:00 +0200
X-Gm-Features: Aa3M54q49lQTvJf3rTm0bm2TUGaSnY3ikhfCBwYj5e-cBK25rEq9w8C0KAb2mko
Message-ID: <CAPVz0n2xxEG5vR4X_dZeyQfN9TVSCBn+2uW1wY7Z+P3N8BhNqQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:3=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Parameterize configuration based on bus flags passed from the bridg=
e or
> > > > panel. The list of supported flags includes now pixel clock polarit=
y,
> > > > display enable (DE) polarity, and data alignment.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++=
----
> > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rg=
b.c
> > > > index d48d498068ac8..faecd6f94359f 100644
> > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > @@ -5,6 +5,7 @@
> > > >   */
> > > >
> > > >  #include <linux/clk.h>
> > > > +#include <linux/media-bus-format.h>
> > > >  #include <linux/of.h>
> > > >
> > > >  #include <drm/drm_atomic_helper.h>
> > > > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm=
_encoder *encoder,
> > > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > > >       struct tegra_rgb *rgb =3D to_rgb(output);
> > > >       struct drm_connector_state *conn_state;
> > > > +     struct drm_bridge_state *bridge_state;
> > > >       struct drm_crtc_state *crtc_state;
> > > >       struct drm_connector *connector;
> > > >       struct drm_display_mode *mode;
> > > > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct d=
rm_encoder *encoder,
> > > >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_stat=
e->crtc);
> > > >       mode =3D &crtc_state->adjusted_mode;
> > > >
> > > > +     /* Get but flags from the bridge state. */
> > >
> > > s/but/bus/
> > >
> > > > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, outpu=
t->bridge);
> > > > +     if (bridge_state)
> > > > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > > > +     else
> > > > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > > > +                         DRM_BUS_FLAG_DE_HIGH |
> > > > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > > > +
> > > >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enabl=
e));
> > > >
> > > >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
> > > >
> > > > -     /* configure H- and V-sync signal polarities */
> > > > +     /* configure H- and V-sync and pixel clock signal polarities =
*/
> > > >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(=
1));
> > > >
> > > >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct d=
rm_encoder *encoder,
> > > >       else
> > > >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> > > >
> > > > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > +             value &=3D ~BIT(PIN_LSC0);
> > > > +     else
> > > > +             value |=3D BIT(PIN_LSC0);
> > >
> > > I think this is the wrong way around: SAMPLE_POSEDGE means that the
> > > pixel data is sampled on a rising edge. That is, it should be driven =
on
> > > the low edge so it's ready for sampling in time for the rising edge.
> > >
> > > LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly, 1)
> > > corresponds to a data transition on the falling edge, i.e. sampling o=
n
> > > the rising edge.
> > >
> > > Section 31.9.6 states this a bit more clearly: "an active low pixel
> > > clock means that the data changes on the falling edge of the clock, t=
o
> > > be latched on the rising edge".
> > >
> >
> > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGE=
DGE
> >
> > Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?
>
> No -- with the current code, let's say
> DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE is set. I.e. the panel tells us that
> it will be sampling pixel data on the positive (rising) edge.
>
> LSC0_OUTPUT_POLARITY will be set to 0. The TRM documents the value 0 as
> "active high", and "means that rising edge coincides with data
> transition". That is, the display controller will change the output pin
> state to color data on the rising edge. So the SoC pins will change
> state at the rising edge, and the panel will sample at the rising edge.
>
> But the pins will take some time to take their new values, so this might
> not work or could be unreliable depending on all kinds of timing
> factors. So if the panel is sampling as the rising edge, the SoC should
> be driving the pins at the falling edge, that way there is time for the
> pins to settle before the panel samples them.
>
> So the value written to LSC0_OUTPUT_POLARITY should be the opposite of
> what it's now. If that breaks the panel, either it's reporting the
> incorrect DRM_BUS_FLAG_PIXDATA_SAMPLE_* value or something else is
> incorrect.
>

This may/will cause regressions across multiple panels and devices.

> >
> > > > +
> > > >       tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1)=
);
> > > >
> > > > -     /* XXX: parameterize? */
> > > > -     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
> > > > -             DISP_ORDER_RED_BLUE;
> > > > +     /* configure DE signal polarities */
> > > > +     value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(=
3));
> > > > +
> > > > +     if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > > > +             value |=3D BIT(PIN_LSPI);
> > > > +     else
> > > > +             value &=3D ~BIT(PIN_LSPI);
> > > > +
> > > > +     tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3)=
);
> > > > +
> > > > +     /* configure DATA order and alignment */
> > > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > > +
> > > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > > +     else
> > > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> > >
> > > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> > > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/M=
SB
> > > bit ordering in a classical way, instead:
> > >
> > >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> > >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> > >               R[7:2], G[7:2], B[7:2]};
> > >
> > >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> > >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> > >
> > > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > > panels depending on the layout. So the correct value depends on how t=
he
> > > panel is wired to the SoC on the board. Hence, I think we should
> > > describe this with a new property in device tree under rgb/dbi or
> > > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > > document that this means the above kind of wiring - not all RGB888
> > > panels use it.
> > >
> >
> > Ugh, why is this so confusing...
> >
> > > > +
> > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTRO=
L);
> > > >
> > > >       tegra_dc_commit(rgb->dc);
> > > > --
> > > > 2.53.0
> > > >
>
>
>
>
