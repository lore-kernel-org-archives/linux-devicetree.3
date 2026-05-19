Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46104332610
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201615; cv=pass; b=YRUARi4kV1knPt1QBwfqHghuygRqVQoNKHXhg5YELyiV6boyjaz2kLMu8Nnc3aC4CqHn1N3rm6V5BkIfGMtXCVg74SamlooVnM5on71Nt4XqZiYh8WFLwPHhXKciV6/bUx110ihPDHKYeZQEw42zYpWUONl0S8ubUwICq8JU9+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201615; c=relaxed/simple;
	bh=mKNJGtr3yWibnoSdxnmBVT/wVtCQ3PzhjynqR7ll3rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZk+WhehH1sqjeyB4g1P8DmfOushT3uXSvYxbr9wIwk5fHTaQcHPeeSJYmOI0Hl0NRrzg4dN8B8jeywfXtrso9kQc0nGCJYvavT6kKw3xWu4i1I3s1fK9LLETxh0k75rfT8paihvPuPcTGBY08zGNLiDIIvtuzec4b5j9NqyR1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TigZf9yW; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TigZf9yW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d734223e4so2345569f8f.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779201612; cv=none;
        d=google.com; s=arc-20240605;
        b=Y9QGene1CD+o0bCPKS3H3xEP4Td009DxA4Cvsx8bqN36+L8hVjAJumIHqgIlIOqDTM
         M+dSCOJJBdHquK8vxPo6rVlnTaiRERPWZZgvbNmVPvw7dEKpRZhiJCZn8bwdToGpvqmB
         OGUEmEvcPpaLUpXllsVlua2OCnqIEHepPOmC5ImX5qbdAYDfGkXhy5HCEc08Efysi5CP
         k3NjKXYog8uf+i3fWItp9FSGc7UXcGEEppt/BJJI+lHzK9F3tPc5ScnHEPqtCr+M5bK0
         q6F5mnEfS4Cz62Xp3V/cUryeyGwPywYZM4mFV4qMHNVt3ISdvtOB5WHSed71qf9Dm0+Q
         HuRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OmyzMyEm/LGiksBOL5pvZw6xuB+Es7o+zSzCGxEqtw=;
        fh=F27j7k8Mi2ws/VxNy+k6UkDWlFVNi8TH71b9wUGeZNI=;
        b=D/JrUQMwRr4M1V8PyDQ0UHDMRNtuI1fmqFp6mFwMzW1cLibxSDjKfia6rt21HlY81h
         kxlRMA2hZRdk7IYPuMlvYQaKR0nP51cX791CmiZtd9QYmj9DWz+vwESOc6RL1YwsH987
         jU7sKDd24yQW5pouePD24Ag372g1gZ5ad9o6fmv/S5PJDELmR1GjsDPff/sNHRlBD2lh
         sWvcQ3i7MhbBYyNP2jGndihfkXfuh8VZ67n/ZgrRJdvJuVgFysVFohNQvSajupK2dUUr
         5Gr3wq7mTZ6drUf21QdZHopjmo3Xn0ibqJqbSLA0jkJqUouy+PI0yu74bLMaF3BnnPFo
         W/aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779201612; x=1779806412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OmyzMyEm/LGiksBOL5pvZw6xuB+Es7o+zSzCGxEqtw=;
        b=TigZf9yWHnLF8kUvfK5iLuJKCKcDdRlg2TMbhiwgqi3F4DrMd9M/U/GN2KqznWJv6m
         z1/P/Dc4ko4YtoJ23CtIzgBtg2Q5Evo4jBSEfoj7RNolbH2iBllVU1FXacyPOKTZ0Wtd
         jXjd5zQ28zKjpVPYN2hbK+5kV5e501NRDvos0THhLlnXFQL7aHuV/zS3NGgq5GDPIxzC
         pLH5wrOQ3kx3OMU3sYMLDxyNATVx+TShc+SEAdtg1Bs3mQ5f6ytTzOb/HcNPyl/vjHM+
         42knd499w7MnNu947k6aMY6MGaqlXKSAuewwCMcgjndnSSYKiV1QRHExCMLdma+jDvfI
         Q7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201612; x=1779806412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OmyzMyEm/LGiksBOL5pvZw6xuB+Es7o+zSzCGxEqtw=;
        b=pW0JYjwAwamtxlWIh6371cICzsea2bsmEyfL787zYRwa4wnK8cIENSlVKSUC5wXWB5
         q3cp7m5sGXoV7iiH8OH8cWzeTSgpJpgI6NHZ5m+861ofZf7rSh6uRAUUUgtNdnRYjB0Y
         hfCHi9rPQaK3e0W4peuRnMXgu1HZZwhS+p0BIfKY2NHwy61+nfG4VDt1+TB/+YbBGDhh
         8eaj1pFMuCYZux6iq6ZZIrlPZMiSYfdvpuALwPkRaCdvx+0d3M/qfKvZFcoR9xqcKByZ
         LLvZVwfdcUJtqO00SNELloc4pLs2rmOdHnreOGUw4CK3oULgOU4erzt5uFkDOVYLLcNw
         Fcdw==
X-Forwarded-Encrypted: i=1; AFNElJ86XpAjv9OUAjD8n395ntbMpscPQUWCBz/1FF880TSIyIXZbt4CnPb9auM2aVzOR4LsoyHXgkIMziI6@vger.kernel.org
X-Gm-Message-State: AOJu0YysuBD1Xxfrny9j5CzGD9qsL8hmXydZOzjL8afyR890aiCNVs6R
	z5rCYeH+nl3BP7qDoS4SoNqQb+MTCK4v9nEbxY6JvKRpWDjppi0Hwmaaqk5O5xs+saR5naII49B
	k/QXa1Wapw5zqd9UpHaM2TDcj6ijRc70=
X-Gm-Gg: Acq92OE6k1CjkFSuM68FdrkI7fSaKN9enm2RjDfsUhv0lMTl8dDyp9lQ8RewbWRD0Nu
	XxYt5ebZXW5CPvtbz7/ClSzQQog9cUBa79JEVJEI+RTbi87Z5OK3maQZ6HSuJvUGBVj6ReSG+XK
	ywJOzjnow0pB2fApIvUfkwFL+hL3epqtdQxHS84wAUSwV8HPevsnyIl1rB3Nn0iCLd7fjkhZ9Pf
	IEbEu6uOjb6dNGljc9Mee3AtnjcjEHBZr1TAi5WKm4iOrtTpEWF061MtIotiHFvF9OqADDlr+IE
	Te7qs2JmiSKkMF9IvyhJ56r5a7kfBfJAPuigPyyWsMXM9m9y+mdUKKVqszZwj0hl/C5v
X-Received: by 2002:a5d:5850:0:b0:452:f380:5508 with SMTP id
 ffacd0b85a97d-45e5b681925mr31609485f8f.0.1779201611516; Tue, 19 May 2026
 07:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346174DD5FFD70AB39F570086022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v_gmPEcWgFsC3Kv4X_M_qzbVHeEY=EmzdYxzy+PkyB-Q@mail.gmail.com> <TY3PR01MB11346178F22560ED8A8A38DBD86032@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346178F22560ED8A8A38DBD86032@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 15:39:44 +0100
X-Gm-Features: AVHnY4LmRnxW-jhziRMaTvD5C7T7dWBrBp1GfrKUh4KZMXnga4r65Ov9CP8dIJo
Message-ID: <CA+V-a8sfvB5uEr8x6FkzxY2LcnUhyFfWRx9aLN2aFoyZ0CQt+Q@mail.gmail.com>
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

On Mon, May 18, 2026 at 8:12=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 17 May 2026 21:30
> > Subject: Re: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic =
to per-output clock limits
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Sun, May 17, 2026 at 6:59=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 12 May 2026 15:41
> > > > Subject: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic
> > > > to per-output clock limits
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Move pixel clock validation from a fixed encoder check to per-outpu=
t
> > > > constraints stored in rzg2l_du_output_routing.
> > > >
> > > > Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5
> > > > MHz upper limit specifically for DPAD0. This approach cannot scale
> > > > across the RZ DU family because pixel clock limits vary per SoC and=
 per output interface.
> > > >
> > > > Add mode_clock_min and mode_clock_max fields to
> > > > rzg2l_du_output_routing so that clock constraints are expressed at
> > > > the granularity of individual output interfaces rather than globall=
y
> > > > per SoC. Update
> > > > rzg2l_du_encoder_mode_valid() to look up the routing entry for the
> > > > active output and return MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the
> > > > pixel clock falls outside the declared range. A value of 0 for eith=
er field means no bound is
> > enforced in that direction.
> > > >
> > > > Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875=
 MHz minimum and 83.5 MHz
> > maximum.
> > > > RZ/G2L and RZ/G2LC (R9A07G044) share the same DPAD0 pixel clock lim=
its.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v2->v3:
> > > > - Moved clock limits from device_info to output_routing to allow
> > > >   per-output constraints.
> > > > - Updated commit message to reflect the change in approach.
> > > >
> > > > v1->v2:
> > > > - Dropped storing info pointer in struct rzg2l_du_encoder as it's n=
ot needed.
> > > > ---
> > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 4 ++++
> > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
> > > >  3 files changed, 13 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_du_drv.c index
> > > > 0fef33a5a089..d1bc205eb5f8 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > @@ -33,6 +33,8 @@ static const struct rzg2l_du_device_info rzg2l_du=
_r9a07g043u_info =3D {
> > > >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> > > >                       .possible_outputs =3D BIT(0),
> > > >                       .port =3D 0,
> > > > +                     .mode_clock_min =3D 20875,
> > > > +                     .mode_clock_max =3D 83500,
> > > >               },
> > > >       },
> > > >  };
> > > > @@ -47,6 +49,8 @@ static const struct rzg2l_du_device_info rzg2l_du=
_r9a07g044_info =3D {
> > > >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> > > >                       .possible_outputs =3D BIT(0),
> > > >                       .port =3D 1,
> > > > +                     .mode_clock_min =3D 20875,
> > > > +                     .mode_clock_max =3D 83500,
> > > >               }
> > > >       }
> > > >  };
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_du_drv.h index
> > > > 58806c2a8f2b..307ae70dd382 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > @@ -30,6 +30,8 @@ enum rzg2l_du_output {
> > > >   * struct rzg2l_du_output_routing - Output routing specification
> > > >   * @possible_outputs: bitmask of possible outputs
> > > >   * @port: device tree port number corresponding to this output
> > > > route
> > > > + * @mode_clock_min: minimum pixel clock in kHz
> > > > + * @mode_clock_max: maximum pixel clock in kHz
> > > >   *
> > > >   * The DU has 2 possible outputs (DPAD0, DSI0). Output routing dat=
a
> > > >   * specify the valid SoC outputs, which CRTC can drive the output,
> > > > and the type @@ -38,6 +40,8 @@ enum rzg2l_du_output {  struct rzg2l=
_du_output_routing {
> > > >       unsigned int possible_outputs;
> > > >       unsigned int port;
> > > > +     int mode_clock_min;
> > > > +     int mode_clock_max;
> > > >  };
> > > >
> > > >  /*
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_du_encoder.c index
> > > > 0e567b57a408..4af2ae09ff39 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > > @@ -50,8 +50,12 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *=
encoder,
> > > >                           const struct drm_display_mode *mode)  {
> > > >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > > > +     struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->bas=
e.dev);
> > > > +     const struct rzg2l_du_output_routing *route =3D
> > > > +&rcdu->info->routes[renc->output];
> > > >
> > > > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock =
> 83500)
> > >
> > > Please retain the check for DPAD output, to avoid checking the same f=
or DSI and LVDS.
> > >
> > This patch checks only for pads that have added constraints.
>
> It will lead to two checks route->mode_clock_min and route->mode_clock_ma=
x.
>
> Whereas by checking
>
> if (renc->output !=3D RZG2L_DU_OUTPUT_DPAD0) is a single check and it is =
meant
> for skipping DSI and LVDS as the respective encoder drivers do have mode_=
valid().
>
Ok, I will move the constraints out for per pad and make it global and
add a check for RZG2L_DU_OUTPUT_DPAD0.

Cheers,
Prabhakar
