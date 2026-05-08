Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C007637AA8B
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234446; cv=pass; b=cL3iVNmdCUSf5BR/nuiAJ8pe5aGy0X4+kq2tdROCbHz6r39tkpGbYUOLBwKRm+b6ITe3UzBYC87BtCtMUKZkl0T+JWgAFj5g60OYiKUs2AgwGh63mE8kVIbfoUT+JFqC+FhADkoWYvLjOvRY+YZgB+tmUtj9q+eUtLcON5uP/s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234446; c=relaxed/simple;
	bh=m0x77AzGjGh0isowfSdBEMq0CPkAgUrYvNRavBNdh2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la4iYzERgdG2W79LdFybmbNluaMJp0wnhPm71BXODmo1iLOkfeBvaCtK3WZsDzi9fF4jAxLqoVht76eTzOzDoCCy9n3LmlU+EQ8AJbbt1hewoJLvUgV/DWYTPVCOo2kUK3gh98T/VhBkHRuPPFblCM2DnwvMYT+s6DizSSuFGtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlE/lom5; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlE/lom5"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1106222f8f.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778234442; cv=none;
        d=google.com; s=arc-20240605;
        b=RVl6aNCICxZTjPeUvT55NHawZBfSTqvBAjIBel1deDJS+sIjHw9Zz8RTCbgmtmiLjm
         Vyr7bjRHsdIkVSLh0nUlc92Y5GvMmZv+wqODWruOEvWXnYQjjsWMGDs8Rm5EuCFiwcEP
         RQGrK3hLbaJQt/H/ws15fMqs3rB1zxvqQLHudNEvqn8Mi0ondMPtJzPpBYtMYVAcHo1y
         4CN83gj4osOT3Fsdd+LTaLFOikb3OkajP3494XsF1AvqMptPOzjMDmmq7hRurEUnCuUd
         xp5yYiRWCBozg0Fo4TbeeZgwOEJz1MYu/H01DVxKNzLn64LDxYSxdvQ5nqdnL0lVDRz0
         pVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u+geW7HzvpvuwmCodYfbhbpyQH/Dv/H3RYeFTEhDvMY=;
        fh=MhBUWwpktiL5cnxKtQQW2M2FvoL+EEhl474sY8BmqlY=;
        b=WI8rcDlf0R6+6TuW6E8qvZsTNu63CpVbnz3asaPNnFsju3vD4Boy2T2l1y8VUnycV9
         o8IhaSQ+1FIWnrJ2Zt+7LIQm86E3oJbR8ru9SjycJdmm0dOgOsbWa4W4M1Ke3hWx+8li
         Uqk04WR3ch0xSsDmO0VpsYYN2KdGBLxSdYvaEW8LrLiddWjYhUKiATVGNhUlVK5Bv/0n
         98l/LCxcNytCYwyjT/feeKny4CNTDLbPMHYI/0B2t3fqCkFxjetlVZ+56R3GaE2vVfWC
         tXDlFrUIbFeat0UD528a8k/EqHUN9VvDWJ2cwXTRKamfOiikrYxWdHytrvh0QdBxXLyz
         RUGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778234442; x=1778839242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+geW7HzvpvuwmCodYfbhbpyQH/Dv/H3RYeFTEhDvMY=;
        b=KlE/lom5IRyPonrqxV45mZiuDRdla2MN9mU/YtiQhTwxPdnuUPsZREoZ2RZ5Q9n9tV
         adBD6ziAvdQjFmHmC9nWNqDev+5YrTJ3Pp3naoq0n9MZQ4AXgvF3+pGZ9hSV6s1Cp+Zr
         QcdcVKmp09ZUMZ5sJQMtmWyi23DGibz7X2F791MdMgHc9SPlV8nrz+EarTyAi/TbuIf0
         Vb39AnRr9nu+W05+mQOO5O2lBhsgVm+CUriu1eQOdX2+pjt+JYhOeyOoBOSv2E0QPW59
         4uqbn+03cl+0Cr5dVbhqQ2rinzao16naIS8ev0x3hycozekXvKCT9z3482yvIzfLnHvG
         VoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234442; x=1778839242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+geW7HzvpvuwmCodYfbhbpyQH/Dv/H3RYeFTEhDvMY=;
        b=iK8AiOwwTC7oDQ6+joYauTQwDmqNj8GPIzjkERoq/NBN0QXegBVbTcrgCQPUJDIpfF
         5nz8pSIN3L7AK1iIYMi4FhV6KhXDplrADsKBUbJoCFz2jm/9vF5kbrNadBnGYkdugE2a
         Z9f/8MagU1CxqRoB1oQR3p3Wmk3F/0jMX/EEL24BY4ur859oTThkcMQuqiJw4aZIrd9D
         yHWm7xcSWu4XmG36jxEbT4u2aYdv0dQnmo4r8bMFzT6pwy4CbncmDGK/UvChh0Lx+Sx6
         c8rrHOFUDVVPwkp5hpVJBwBvOFRzb9AlAJ0ftzEl/Bj18iLjXy8ja9Y7mpkRLTImSVF3
         6kog==
X-Forwarded-Encrypted: i=1; AFNElJ/U6k+pX8XBFXu7ZCzM2gz/Q9uLFvv8Mp6U7Jrk2EPGW1HSObvhsjvvU5ksubrD2oX64e30lL/2TjWP@vger.kernel.org
X-Gm-Message-State: AOJu0YxAN0OACsDmC2ITk1Jf/8bW5Cecyq7x8/zKUc8qzLidC5F7C0AB
	HjsE/eRIYbEICrGDPPVaOifXstctICp1AYdbfEcLUido/ZwzNI7l2NsXBknLCmr06gWP4hZ82YF
	PRhx/hyPOk1xdQEwHtZFem8bU521ymQk=
X-Gm-Gg: Acq92OFkvpwDtsskdOpQkCcOPyCGtBsQTUY3+PDXYwCTN6qKhUuJeDkJQ/aJMAQFmEP
	dfYomVqFgvJteG1girvGeBP09dYVx4TT3ufhOKb22dalJiVCmds/eKUa8rKyzUrSIw1YaIkjVY6
	sueHM6uFXUOKujePaq9qTnU//Ko7WuQc6kddoaTrIo1Se7H14HpAebe7sGunt9uipmQgHbZAfDQ
	nibE3wg8sHScs22fZAhg8MQAVgh4iQt6wPa2T0Lhl91j82IzZVpYuQ09TrwRdeOolgy1EaLAAaJ
	2dGdrH8GT3/U0a0XYBVJObaThkPjxERemSwMqI5+9WVcEd/W9LBTcIvecv2Vl4XsacoQXgx4TQY
	99K3Q
X-Received: by 2002:a5d:5f90:0:b0:448:7049:a6c9 with SMTP id
 ffacd0b85a97d-4515b056c3emr18956040f8f.5.1778234441801; Fri, 08 May 2026
 03:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506201400.GC1652535@killaraus.ideasonboard.com>
In-Reply-To: <20260506201400.GC1652535@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 May 2026 11:00:15 +0100
X-Gm-Features: AVHnY4LP8csuKz7LBRlHomSywlqEiEgGQCH4EJ0easAGNDrVsix2yt5Y_eKl99w
Message-ID: <CA+V-a8u_74SmeAKAXUqSKyWvp41pJavd_b_ESUOozCnrifBEpA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm: renesas: rz-du: Move mode_valid logic to per-SoC
 clock limits
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Wed, May 6, 2026 at 9:14=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 29, 2026 at 06:00:11PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per SoC
> > constraints stored in rzg2l_du_device_info.
> >
> > Pixel clock limits differ across SoCs in the RZ DU family and cannot be
> > expressed by a single shared rule. For example, RZ/G2UL (R9A07G043U)
> > limits the DPAD0 pixel clock to 83.5 MHz, while other SoCs such as
> > RZ/T2H require a wider operating range.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to
> > describe the supported pixel clock range for each SoC. Update
> > rzg2l_du_encoder_mode_valid() to return MODE_CLOCK_LOW when the pixel
> > clock falls below mode_clock_min and MODE_CLOCK_HIGH when it exceeds
> > mode_clock_max.
> >
> > Set the pixel clock limits for RZ/G2UL(R9A07G043U) to 20.875MHz minimum
> > and 83.5MHz maximum.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 2 ++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h | 2 ++
> >  4 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu=
/drm/renesas/rz-du/rzg2l_du_drv.c
> > index 0fef33a5a089..3b7162c6e1f4 100644
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
> >  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu=
/drm/renesas/rz-du/rzg2l_du_drv.h
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
/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > index d53068733c66..ad02efec1c23 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > @@ -50,8 +50,11 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *enco=
der,
> >                           const struct drm_display_mode *mode)
> >  {
> >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > +     const struct rzg2l_du_device_info *info =3D renc->info;
>
> You could use
>
>         struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->base.de=
v);
>         const struct rzg2l_du_device_info *info =3D rcdu->info;
>
> and avoid the info pointer in struct rzg2l_du_encoder. Up to you.
>
Agreed, I will drop the info pointer for now.

> >
> > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
> > +     if (info->mode_clock_min && mode->clock < info->mode_clock_min)
> > +             return MODE_CLOCK_LOW;
> > +     if (info->mode_clock_max && mode->clock > info->mode_clock_max)
> >               return MODE_CLOCK_HIGH;
>
> The new check now applies to all outputs, not just the DPAD0 output. Is
> that intentional ?
>
The RZ/G2UL SoC only supports DPAD0 so the check is redundant.

> >
> >       return MODE_OK;
> > @@ -107,6 +110,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *=
rcdu,
> >       if (IS_ERR(renc))
> >               return PTR_ERR(renc);
> >
> > +     renc->info =3D rcdu->info;
> >       renc->output =3D output;
> >       drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_func=
s);
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h b/drivers=
/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > index 3e430c1f6132..39a1d178b856 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > @@ -14,10 +14,12 @@
> >  #include <linux/container_of.h>
> >
> >  struct rzg2l_du_device;
> > +struct rzg2l_du_device_info;
> >
> >  struct rzg2l_du_encoder {
> >       struct drm_encoder base;
> >       enum rzg2l_du_output output;
> > +     const struct rzg2l_du_device_info *info;
>
> If you want to keep a pointer here to avoid going through
> to_rzg2l_du_device(), I would store a backpointer to rzg2l_du_device
> instead of just an info pointer, it could come handy in other places.
>
As agreed above I will drop this pointer for now.

Cheers,
Prabhakar
