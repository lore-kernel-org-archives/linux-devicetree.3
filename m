Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C821D3F5
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779049857; cv=pass; b=pJPmWNO1m7a+sF/8gJAZRewcIvA4cgixPMnvubxItzgAR+5mLTMml8ZGU4isVuYAg2S23Z+eZmpZ1gxOoVcDHO4KKrMHrtpDICJIBZehGnrSemArLRC3MquLMqvRlH4DNFvXIP8wNLtcl6ZO+r0QiY8svyrKphLyEm4Haptxg/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779049857; c=relaxed/simple;
	bh=50C7JM4Fkn1oeuiBJSXgulYieHOs0OaBMs+8C//qUxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ni89CPzanNuNRinusS+yQVz7uzJOohcPUSc2zFuc+f2aUptiDO/Y3Mz7GKwG0UcDe8cQ5KEDqtzq1pYZCrulkOKZPutndyhjB+zWntFFnnQ17zj7bR+m6mMr3XglmNefm6jnliVGzQGAZQXW6SMXtCF/ZY2uDCEvtBPQ3xHeEyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fv5b/zMw; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fv5b/zMw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so18187685e9.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779049854; cv=none;
        d=google.com; s=arc-20240605;
        b=D4YLi0wYInSnwRLhnEB9webqxirwFs+boeAAZrSNsHtHizYmCDhrv/OCXJbbIqLgKw
         cwFggWCwa51zwPL6bcwPl3yq2hP9Y7WerievpWL3zdwLt5IkFrG9JxMLhwPLkgs54QJr
         4YFmEM8brGyh3EvNs0UB9gJveS12zb28U9l4TaaVOo7mo9ooYF9BC6sRnx3yL1NgTD5r
         yaoSI/bsc2dZ5qAaJZRrEKzljDI/OJvbGWMIuu1PKFFEwWBscD3hxCX81XJuUvLZy+je
         f0NC3wmFLbcKCRCR3iySbsENio0fKIDfb6lyfGKKnSpwoXrUjo8H2f4e0k9vDhiHqNQn
         CTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m5W2yksOeDngCRoP0/L217ADV5Bob6V0u6vG3fCF/SQ=;
        fh=YaKfdomFeZbhfKIqiCycRFke9umD66qtSHQr/LLDyGs=;
        b=SAlxTs5KY3GWF/4M3H8uaG1xpjXcxmcj09QgkE8sS/REYvtzSJhpzCOmTinmYMywAo
         WVnM6Lss4xhTzDWmAJ6q3dj61eN0VGUf8dxKfd3VYZ0/cVmK+rbqwgn/1khPyQP7OZnW
         7Wzzi8dCmskjHCmSNGj//UQ5lIQqWv0MWACZZvAGIKumADsj2Twjq1yOLFMYwh0C8Gfr
         5IacSf/uVVlUN+pjN7oZWh/gge00DI423qXa9HNZpxiyy7tln43RPpJoDG6ieYdYcqDX
         liGao9q3f00lSp7aRiB+SinlG5BCSmJxDcE2VGWEO4wnVGc2ow7oxfbh4v68MgtsY2uv
         GuAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779049854; x=1779654654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5W2yksOeDngCRoP0/L217ADV5Bob6V0u6vG3fCF/SQ=;
        b=fv5b/zMw3ZkJz83Vu9XsS9My5k2TmQpz521lVaHHMmxvg5BpCHX+Iq410ijt2s8oir
         1o+nMcUOAfiAyEh+8tYVs6+yInHfLYhWiSFdBqvO6sgxQADqi5A83NOokQ9Rq4W4s/Nj
         E+V9EpPN0Izvyl9r0UR22/koStBuC/r1wxDD1t+iyfXJqVA5LNU5fMPckbIZxm0o47EC
         d2o685E74CR/u+L5zTelk1iIzPlDln6nlQB8wDrdeCzZlL4ChEgkK4LAFkFW+syWxpqP
         Ogi0hRm6zmJVQs2euaFp/ylAzuiNaMCNtHTFMhdNsTnQ1PgEcPXpYkttdk/aqgBWWiwf
         cYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779049854; x=1779654654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5W2yksOeDngCRoP0/L217ADV5Bob6V0u6vG3fCF/SQ=;
        b=svHqR5CsdgAjcnrGrNgnK/3gQm/N0fA/Re2U+73C+z3CohztYf4oubXOH/FYEbEVHw
         QDDDkACquecZxFdS9kjVOCrAp+X6yHh3zhKoyqx0sGDlwh8kWQTXpBFi4leOigpMf74T
         jmBf3q+ybjSRJgpi1pvY4wJg9/CMzDlsZ4HNi+rTeOd0QIAtfKmdE0CE4XrUuK6ctd8K
         gDz6kXO1u0quo3rf5Oe88XmA+udULdvKtQb3CrJneKDHy40dVtyzOjWE0x5Gk0alfO9c
         y03bFVuMOgXyBUqB+p9+7Zw74vAsVXB/6O4ZZR71RDtfjrRUl9nXMWrafOUtVvBk7Oqn
         TvGg==
X-Forwarded-Encrypted: i=1; AFNElJ8JAwpFV2x4m+lO2z1MFk46EN9AbNyFv5aH7T/sV9eB1m7qrWw2vO8aCpHCJftzyuW02qAAneywGSBo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8AyarPEMO22PDV72hNbAveulQfgW3dg0Chez5/YhEafCYkmkS
	XXBEAMH6pUcj3cl+8o+nLkeUXXyHil3InuuJ8t6a+FwJuZt8KQxFdNuo6NByhpv7CqCvvRMDLAg
	GZJlWhmUucCN444XT9Sed5xPln5l5WSc=
X-Gm-Gg: Acq92OHDghldJitKLpgT3Bm5FZPg/sldWYkeXgkac3RxDZLCOPTKBFOl2zP19mjwVT5
	gXRkxkF2hQwo8JTqlRCyHhAiBGyirUJyClyk72OPlFOFnqCWHYFYDewDa/Eq0yDF3ULP7irrQRd
	k0Fpdfp859E8folYYCxF94JBcGuliw1vHVeJkXbqYbi9qdzV05fKXHcE9qWNW1nS9s5i1uA7Zy2
	pvonZQI6jQHmq+/GMd3+tKVJd02Jv6qv3byu/eYXdzO4n0Sp0hYQuAalfYJbrUB6xNaz9ylTQcs
	2vl9+/BbNzV/NlatwUGkbWhYrqgx+pQc8nfQy9w/RjvSF+Q7aLMZZVDav2dURoeYB2Adk+zHth8
	PjCc=
X-Received: by 2002:a05:600c:4e02:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-48fe6322416mr195114775e9.18.1779049853553; Sun, 17 May 2026
 13:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346174DD5FFD70AB39F570086022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346174DD5FFD70AB39F570086022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 17 May 2026 21:30:26 +0100
X-Gm-Features: AVHnY4L4Iw5hWO4PauuBTrDRjWPhgs5UmEFDfgWOBP_KZfNbj_cxu6qjfmeyJWg
Message-ID: <CA+V-a8v_gmPEcWgFsC3Kv4X_M_qzbVHeEY=EmzdYxzy+PkyB-Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-output clock limits
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

On Sun, May 17, 2026 at 6:59=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 12 May 2026 15:41
> > Subject: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to p=
er-output clock limits
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per-output co=
nstraints stored in
> > rzg2l_du_output_routing.
> >
> > Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5 MHz=
 upper limit specifically for
> > DPAD0. This approach cannot scale across the RZ DU family because pixel=
 clock limits vary per SoC and
> > per output interface.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_output_routing=
 so that clock constraints are
> > expressed at the granularity of individual output interfaces rather tha=
n globally per SoC. Update
> > rzg2l_du_encoder_mode_valid() to look up the routing entry for the acti=
ve output and return
> > MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the pixel clock falls outside th=
e declared range. A value of 0
> > for either field means no bound is enforced in that direction.
> >
> > Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875 MHz=
 minimum and 83.5 MHz maximum.
> > RZ/G2L and RZ/G2LC (R9A07G044) share the same DPAD0 pixel clock limits.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Moved clock limits from device_info to output_routing to allow
> >   per-output constraints.
> > - Updated commit message to reflect the change in approach.
> >
> > v1->v2:
> > - Dropped storing info pointer in struct rzg2l_du_encoder as it's not n=
eeded.
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
> >  3 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu=
/drm/renesas/rz-
> > du/rzg2l_du_drv.c
> > index 0fef33a5a089..d1bc205eb5f8 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > @@ -33,6 +33,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a=
07g043u_info =3D {
> >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> >                       .possible_outputs =3D BIT(0),
> >                       .port =3D 0,
> > +                     .mode_clock_min =3D 20875,
> > +                     .mode_clock_max =3D 83500,
> >               },
> >       },
> >  };
> > @@ -47,6 +49,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a=
07g044_info =3D {
> >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> >                       .possible_outputs =3D BIT(0),
> >                       .port =3D 1,
> > +                     .mode_clock_min =3D 20875,
> > +                     .mode_clock_max =3D 83500,
> >               }
> >       }
> >  };
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu=
/drm/renesas/rz-
> > du/rzg2l_du_drv.h
> > index 58806c2a8f2b..307ae70dd382 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > @@ -30,6 +30,8 @@ enum rzg2l_du_output {
> >   * struct rzg2l_du_output_routing - Output routing specification
> >   * @possible_outputs: bitmask of possible outputs
> >   * @port: device tree port number corresponding to this output route
> > + * @mode_clock_min: minimum pixel clock in kHz
> > + * @mode_clock_max: maximum pixel clock in kHz
> >   *
> >   * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
> >   * specify the valid SoC outputs, which CRTC can drive the output, and=
 the type @@ -38,6 +40,8 @@ enum
> > rzg2l_du_output {  struct rzg2l_du_output_routing {
> >       unsigned int possible_outputs;
> >       unsigned int port;
> > +     int mode_clock_min;
> > +     int mode_clock_max;
> >  };
> >
> >  /*
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers=
/gpu/drm/renesas/rz-
> > du/rzg2l_du_encoder.c
> > index 0e567b57a408..4af2ae09ff39 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > @@ -50,8 +50,12 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *enco=
der,
> >                           const struct drm_display_mode *mode)  {
> >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > +     struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->base.de=
v);
> > +     const struct rzg2l_du_output_routing *route =3D
> > +&rcdu->info->routes[renc->output];
> >
> > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
>
> Please retain the check for DPAD output, to avoid checking the same for D=
SI and LVDS.
>
This patch checks only for pads that have added constraints.

Cheers,
Prabhakar
