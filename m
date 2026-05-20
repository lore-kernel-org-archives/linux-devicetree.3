Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76FD3B5854
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264859; cv=pass; b=PsYCSBPqZeQQLxFTKuzfYSCAF6el/HXmdVOGzmXBgd+E4zFRC8zZSmUdst+dNi6s5r5wTbxcAy4+l75p0uAWRZd0EtSWXH1ifokDEvsCSDvGAVvUFXLjgkWv+zL2QO15SUpY7JhxcuUZZX2rQnUjcFrPbq/0gYbf1OMMGMgxuww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264859; c=relaxed/simple;
	bh=mdrmSpedq9SgiBqKaKec57wdbb3zVbrGvOqWd3NWfWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQsUaxtrT0JaUx8g/UDG9IXSxYbqM8DokoWbRxgcIJZDKcHidFIzRz600Yhmhzb4YhMnVUyw4urF7h4EFvZiFbNETGnQ6BapLLlVeipneC/OPy7LbKZU5a5+19pfpTskGXLJ18GAh101ThKe7acF3mkxp15xTR/ZJ8tWMzmcR68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmjCkO18; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmjCkO18"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d75312379so3753784f8f.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 01:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779264856; cv=none;
        d=google.com; s=arc-20240605;
        b=OKad9PSU3DJNoN8F7PtyJ/zFYQF7VGXjy34EDaZo2VqkPtOPItcoUZIQ3o2IWzxyeQ
         H5BdXIU+DCXLG0fcKHbAngqZK+NKhuEUIEHG0roX9EXbCS0+b2Ep9x2Ou2jI3hy9uPwK
         sq4bjVMdugR/5vxhko15Szn3FXMBbULsQIi7tWYbx+KX1TjWzfILvJkZWceCTyPFUq0N
         ArakPXRt1mMX2FZoZFbWjVG6ONfigPN66SfDNIfh6ApYGk6BzA0piKd6+MvuSR+hXhLE
         qWArvy4RXKwJOOu1PYnPsghuxNOLKOx3wxSqMhwx8mL1p/STN/uFUkxuC8NA7d2fRup/
         j4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouGZIX16N7k23aqaPlMKraG3urpO1iCAJlk835dT/hs=;
        fh=bdHQyRplA4ZxTuEyL4RQLivSz4fc6mmoKWUGAhQGUw8=;
        b=SkSg5pozs5/XVtZDFnyAtntb0N0fI7dItSexjvTA2hyqFDZUF9INiCCTlpjJGeXkNB
         Je6LXtK7AuXAmwuP75epa/Td0nZVtjIrYyMqt/iIVPoKqTLS7nZc+lfBI0g6690cGAS6
         HpzYfJ81Ny3s74NQ5KqKX6ZSXoSNmx0hzQGUr/S2ImcpOllYod0KhQ7UiikBRzFEjscm
         Szdu530p3cYm5LwKUb2yCq0IwKrSdEj4e0vU2CbnxDbL2iA5hYH8U5dyxvUUHnKjz9KA
         NRiFq5oW+dhefZqtLHcmlSZTwnw5HaNawLkZ+t7TiB16O8IjSuk7IWSxcXlbdM84CO7s
         Wvyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779264856; x=1779869656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouGZIX16N7k23aqaPlMKraG3urpO1iCAJlk835dT/hs=;
        b=WmjCkO18LM5CRsgeWKHleFPa9WNuHelluCUvGppK2LvTY6jT6Fz/RENPjD4CjOXWcQ
         O/+31Q/I8fyr1jzdvHFKXGaAe3HjuW0GhDU/2l7kCmZPr6ur/6AmPdORjO2ZuyfkZI/r
         UKpyW6r+4Xcch+07pEEHLeFSX6pxROOb5VEh2vk0sykeWSAAEVznceb9APhFCuK5jJEh
         QTTIP55EkvKELbk83L2JWJ7LR8qultHwvcSg40mRVHXoFW8WFggn5eA84ax8aqbLEGxN
         rsfShSVhlTY3m6AW1tpzVv+ry7sETvw1ehWPn4KPDG+eAOss9s4spU2jhLWljEpvJpAj
         twUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264856; x=1779869656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ouGZIX16N7k23aqaPlMKraG3urpO1iCAJlk835dT/hs=;
        b=TSABIfi4KwfODMIPwXZWTX6z+kB/nMBw/2UMVtGRSfFHzOmcMusMzXnTUroDAfuQev
         uYUCIPWL55+Ry2KpdlRo+FThBuAPkN2dGkvpJL4vWVmxSZPMQiugi3xp5pA73+v1WiFD
         tZRNZvdPleecj7OEAB8+UYIRcqfx4a8pV6uOAwKGW5laNrooVBc5mkCvx0r0zaU1OaUp
         O1VrIJFcYS6lCHqBr5j8MYZ06/PpRXuxssCWNnASaPBsG5DwDyN4j7ILD3ej+PvgUg6c
         R+MIZoXY0G9aXQhLV7mnB5CajqRQWeKcf8a2Oy/x7Jd4tv36XKjjLwClQ4pybw5C8TiI
         9m4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8NOzA/JwW6+bcK1GX7tFEoo27bRQ26AU3oPlYbv6fsc4lpNojIxaixcF09EX18yOIb9amrSg2yeOGB@vger.kernel.org
X-Gm-Message-State: AOJu0YzfzikYkIeSCHuFsY71fXRGBQbxinHaBC2UF1KSqWskj6WF6Mx9
	bvzzeomIhe2cFA6RTjyXdDQTcvT3axYAJgnJLf/snGzPSpowjRctX4eT4sKVwzzr/+we1cUBtm3
	GMaIDwFAnWLXShgEWPxYG6Dbez8G5MBw=
X-Gm-Gg: Acq92OH+Ob4CUrCMX0eNSqp9TrPRQm8Lz6tFbAoXUbN2APQKhIpA4AdJq5q8KAdWypC
	NbOV9NRmDGq8fhwp+ssuj33ZG8NQS750rF1LCGXRw4N5SC/qGY7j/0X5HT9mo+FMfVYDUTB03YJ
	k/WYRMUHl9b+y51AGpQUunug1/hMmjgEVUmpNxDUTLIiBu6s+fg+e2+zWsls9Wulw7Hpaol0Eca
	tuTNOQKwC0HPlUjM4Qcq11str/70B4XQjd/ao5qAP5TG/x4h1qvUmQJvgM/5Uy/ghH20TFMqhsT
	pU8wxeA01gmpzM8MUA5GFZ9nrc6YzZ2Z1kz9DUD/f06WApeTIdGJe4UMnJACX4RejoyWsw==
X-Received: by 2002:a05:6000:402c:b0:453:9897:76aa with SMTP id
 ffacd0b85a97d-45d93eccfbfmr43930776f8f.21.1779264855863; Wed, 20 May 2026
 01:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260519160825.4082566-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346AD5B7CDBB72EC8FEA16686012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346AD5B7CDBB72EC8FEA16686012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 May 2026 09:13:49 +0100
X-Gm-Features: AVHnY4K6O83Oaua7x5OeGyEOVQr-EpCuxk3Ub_S6X1YfPWB6IzfjGTmlm_zyy3E
Message-ID: <CA+V-a8uReGLazx5xPfCG+EfSeT_zDy-xfq8Et2pEkmgOKT+8QA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Wed, May 20, 2026 at 6:36=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 19 May 2026 17:08
> > Subject: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to p=
er-SoC clock limits
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per SoC const=
raints stored in
> > rzg2l_du_device_info.
> >
> > Pixel clock limits differ across SoCs in the RZ DU family and cannot be=
 expressed by a single shared
> > rule. For example, RZ/G2UL and RZ/G2L limit the DPAD0 pixel clock to a =
narrow window, while other SoCs
> > such as RZ/T2H require a wider operating range.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to=
 describe the supported pixel
> > clock range for each SoC. Update
> > rzg2l_du_encoder_mode_valid() to check these bounds when evaluating
> > DPAD0 outputs, returning MODE_CLOCK_LOW when the pixel clock falls belo=
w mode_clock_min and
> > MODE_CLOCK_HIGH when it exceeds mode_clock_max.
> >
> > Populate the pixel clock limits for both the RZ/G2UL (R9A07G043U) and R=
Z/G2L (R9A07G044) variants to a
> > minimum of 20875 kHz and a maximum of
> > 83500 kHz.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Dropped per pad limits
> > - Updated commit message to reflect the change in approach.
> >
> > v2->v3:
> > - Moved clock limits from device_info to output_routing to allow
> >   per-output constraints.
> > - Updated commit message to reflect the change in approach.
> >
> > v1->v2:
> > - Dropped storing info pointer in struct rzg2l_du_encoder as it's not n=
eeded.
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 6 +++++-
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 9 ++++++++-
> >  3 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu=
/drm/renesas/rz-
> > du/rzg2l_du_drv.c
> > index 0fef33a5a089..1e4b9f38c55b 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > @@ -35,6 +35,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a=
07g043u_info =3D {
> >                       .port =3D 0,
> >               },
> >       },
> > +     .mode_clock_min =3D 20875,
> > +     .mode_clock_max =3D 83500,
> >  };
> >
> >  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {=
 @@ -48,7 +50,9 @@ static const
> > struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {
> >                       .possible_outputs =3D BIT(0),
> >                       .port =3D 1,
> >               }
> > -     }
> > +     },
> > +     .mode_clock_min =3D 20875,
> > +     .mode_clock_max =3D 83500,
> >  };
> >
> >  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info =3D {=
 diff --git
> > a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesa=
s/rz-du/rzg2l_du_drv.h
> > index 58806c2a8f2b..885558eb9547 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > @@ -44,10 +44,14 @@ struct rzg2l_du_output_routing {
> >   * struct rzg2l_du_device_info - DU model-specific information
> >   * @channels_mask: bit mask of available DU channels
> >   * @routes: array of CRTC to output routes, indexed by output (RZG2L_D=
U_OUTPUT_*)
> > + * @mode_clock_min: minimum pixel clock in kHz
> > + * @mode_clock_max: maximum pixel clock in kHz
> >   */
> >  struct rzg2l_du_device_info {
> >       unsigned int channels_mask;
> >       struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> > +     u32 mode_clock_min;
> > +     u32 mode_clock_max;
> >  };
> >
> >  #define RZG2L_DU_MAX_CRTCS           1
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers=
/gpu/drm/renesas/rz-
> > du/rzg2l_du_encoder.c
> > index 0e567b57a408..56220139a149 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > @@ -50,8 +50,15 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *enco=
der,
> >                           const struct drm_display_mode *mode)  {
> >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > +     struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->base.de=
v);
> > +     const struct rzg2l_du_device_info *info =3D rcdu->info;
> >
> > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
> > +     if (renc->output !=3D RZG2L_DU_OUTPUT_DPAD0)
> > +             return MODE_OK;
> > +
> > +     if (info->mode_clock_min && mode->clock < info->mode_clock_min)
>
> I will avoid checking the first part as it is mandatory for SoCs with DPI=
 support
> and DPI check above make sure that this part of the code is reachable onl=
y for DPI
> output.
>
Will you fix up while applying or shall I send a new version?

Cheers,
Prabhakar
> > +             return MODE_CLOCK_LOW;
> > +     if (info->mode_clock_max && mode->clock > info->mode_clock_max)
>
> Same here.
>
> Cheers,
> Biju
>
> >               return MODE_CLOCK_HIGH;
> >
> >       return MODE_OK;
> > --
> > 2.54.0
>
