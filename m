Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795852438;
	b=XroaVLk0sONAcl7kNZYt8JRFqlyNTsnaFrE+XoZWcff48HKUfWrjdyiAqevfXM1KtyJf
	 OaDVu3IiGDFkYeAtEosjiQUALsiut6rNZZ9nUxyRYlOp3ccGl3IHbnMfg+PYRoXa1i8k1
	 K6uPVf2Gy/7S46YYwA4+Z0mqqmY7jNFMY0hyrBQac57A6RxqzpwRtBPcA5UysGqWY+StD
	 FerkqM5vuLx4ABVg9iYQDx1TLKgGI4CQERiIHWVr2vdP6v6O+jGX5OmlZuc12pn0EclWO
	 zS3GSG82rwGcXZAzeSEXDeopdvUy2gAKzaNhqDIqGSdDFEQwqIR6RkRkqyd53DpNobQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
	b=5Wa/6nJ3VXZz0nMILskd3qXzZel/pXvp84y89fVGCEAOi/9g/1J4f3+Dksp7MtDaHXoS
	 jjzuVVhATTbWWr/m9G8c3QZMmlZb5ZqGqnYc9bQzMvbvg4EPwqJNJnldOW+c3x0IHU6bM
	 fdSPhQr2mZrV/hJtwisfZP8dgIcvdfpLcvkHdIR3g9tQtSB6/Xg06NU+sn0HSvTqpinJ2
	 vwyzMfUFhEUmQKv1IdVd5R7B6njZXetswYoT6sGwN8VqOr0usU27KwoO7Zt59JkbhfejM
	 cj8ow39sKu03k6pjQJDQC1kV1w3EnOTk96oC3AjeX5j4w4SYWGxNbyLXm7cBTgJlHMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltiIC14N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FC606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851FC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltiIC14N
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38699cf08dfso11407812eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795852437; cv=none;
        d=google.com; s=arc-20260327;
        b=OucQaUi9ZUt8lzJ+iJ12yPsGa+Wj3YS9EedYCUTmGHrYSJwNh7381W1ISmODAUuhHm
         CyF6J88Wn7rQSOC8a8e0UJGW9AccE8Ya1b4vyMt/9rVxiwz/h55HpTCp6PTpDQ6vAAQS
         LPfIfgLrN0C8YTZNwXCZ3BZQOkmP14OUP4E5O8cTQBQMahH5TbQZ/k7N+RSB7u52Yahh
         K/lCLxnC2DuEJsvYIl1WLHQBTgOOHv7/wtqbn1RlmRrvfQzPQ9CKIw1twPpR5ZCZ0Zbn
         e6n2hs/vG+MXUWNcODBgJHLadyQ2zCnobHAWBN16T4YBX5SKzvlXx++BI8GhPhHRm7X0
         BVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
        fh=hYrUnh3yyo+PLPuNfeqp0mYvRTvtLT3kf8U/0+9jooc=;
        b=hK8ZOlIyQ5x8zyOySpTV7cyul8N1v81NDYUOhydatUlWT8xvUDvU+btTlvNx8z8990
         hnrfrTJKKU/xyyH3tqdPrru9Ex4So18eoLlJq3QVbOldIYF8jKPtZcGeC0yjjxJrEuww
         NiGkTO6lHEiBUFOxPwLtz85SXpmfFodKmA+Odf/u2/oMnEO8aKZzbRShLQQ9+4sp9c+w
         UBfRzzRAyU53wVw0cy4rqDK9EbF1Zc8fpCeBAstRSC53lofhBWLTe6/uYXcgFcXxCyCD
         QZCGC/CrdZ2RP0LRvCI5h9A2ECj5AhhMrAe67x7xyUSKNwyasiFMMjsUUDRkFBItUXd+
         Q47A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852437; x=1796457237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
        b=ltiIC14NGhhf1LBTp/gVQSt09VevCzt+8DroWCWbHEVNDFbQUEL7yuDlNlFOd4Amal
         Fm9UVQk3U4XOCt0JYGwOhjK2SC61q0x4RrsuSHYknRSn1xT+oAws3L9Uu2/+BJT2MyUf
         B0deuVXxV8ddF9o4UCF/ihpskUrtfoZiGXFadG7FX7pYEeP/RSkSUndufPfoqa4pg0+j
         cOo0SRMsgY0CNue0YGJHNlLUOW6w6xFiqmBmKUYPckcu4ywV5NHcwYmLk4Hs0efSn35Z
         PemD+i9gWfb6s2ttvZxVUFg5ZicyqMmeE2uK4iCEwKyruJpPfuUmoqF8WPhu2Uh15HAp
         ZI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852437; x=1796457237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
        b=NLcXUf1wt49KgSik3Z5GMaqfNr5OM47JJRIz1arH5FnLUbMjMa9hFNt6pWTH1zNZ+q
         UAPEsSvcvo7vfO9iskrVFxTmGvQWMExdPOQxMDt+jbHZLb+ngMgUE2z2azUea+AcVeqp
         U4b49IMnaZToxYnuAU6BTiPZ9qRAUI18Z6funvUVT6/9tvXJ5JjgKjM5GXYr6NSSPkYe
         gIcu09uCoplL2y3hq2E1wCpkBIXaDZKON/ii80pKw7kl5jSzbXkE6YIvd3qK6i/Ey7Dj
         wCeIdnNWex/tvoOReZZ5W5UKmYeHGOiaNYdiQIdAHhGmjQ1F4buJqfz0sBreyQRoowoY
         kIvg==
X-Gm-Message-State: APuU4Z+C+6njjCUoHICMuZeWuYRatuNu0lt36ndHkyddIwnrtYFn6ToQ
	PGmgwf/w6jERaxho21oHBeaovsyqEvWjkRBKGe0NS6YnwATlekA97eWkoefWAYeYlS/ucnTK1Co
	0XdWUyfysW+nJ8VnHeHaQEk3ErGwy5U8=
X-Gm-Gg: AZFdTZcMS/lXODmqUCHq/22E+/PkgDrSEo0c4mPjfNEacXpBW2ew+8bGH+lZQY2HfjJ
	yBkXxIIuNM818PST4Z5H2B3lx6gzdkjeUuOIssUlCMqC+OLsWTzzgtnzFN6smVfmncRQppIV/rC
	aTUx/xGmQL3MX+Alw1aPtUvNLU0eLB7am5gUT6dWs22//AYj0Ul3Nm/JUuLZXqrcLhVNEUWD23r
	CDUo+6NAswcl7dp4GRVwUlfjq3ZFw52VpS05hRauk6v2yrl4rYyjoqoQnGTtxv/P5HGpF8CURDq
	hWNDS4YXmvfPfZ980uB0wWmQjLwCwBLdRNWsg+/qLUe/iOepnx6/ApgCg2Ch0qZmU+6pW8jOgOJ
	ZNBTr5wkrgTUfNJRNHtsmkFhcIjCzA0YAwF6/oNz8RBWxVwBHmRUXdG2hnOxRdesqGtkXFBasWj
	fYi6cznxRP7URZ9HJtswcuPr90frpkog==
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id
 5a478bee46e88-3860b999354mr23606691eec.40.1795852437505; Fri, 27 Nov 2026
 23:53:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
 <CAPVz0n2xxEG5vR4X_dZeyQfN9TVSCBn+2uW1wY7Z+P3N8BhNqQ@mail.gmail.com> <TYDAsh0fQ52x0yM4_wAp5A@nvidia.com>
In-Reply-To: <TYDAsh0fQ52x0yM4_wAp5A@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 28 Nov 2026 09:53:45 +0200
X-Gm-Features: Aa3M54q-zu7VNZG7RQnUkD49ZZ4GXHDbs3pfd4VbGKumQK7WmjGiO3UixS-hPEM
Message-ID: <CAPVz0n2no09Dkf_+wBf_f0dejHxCkLtnjB-Tu-PKjn5PMQHuTg@mail.gmail.com>
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

=D1=81=D0=B1, 28 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:2=
8 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 10:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
14:35 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Friday, November 27, 2026 6:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wro=
te:
> > > > > > Parameterize configuration based on bus flags passed from the b=
ridge or
> > > > > > panel. The list of supported flags includes now pixel clock pol=
arity,
> > > > > > display enable (DE) polarity, and data alignment.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++=
++++----
> > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegr=
a/rgb.c
> > > > > > index d48d498068ac8..faecd6f94359f 100644
> > > > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > > > @@ -5,6 +5,7 @@
> > > > > >   */
> > > > > >
> > > > > >  #include <linux/clk.h>
> > > > > > +#include <linux/media-bus-format.h>
> > > > > >  #include <linux/of.h>
> > > > > >
> > > > > >  #include <drm/drm_atomic_helper.h>
> > > > > > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct=
 drm_encoder *encoder,
> > > > > >       struct tegra_output *output =3D encoder_to_output(encoder=
);
> > > > > >       struct tegra_rgb *rgb =3D to_rgb(output);
> > > > > >       struct drm_connector_state *conn_state;
> > > > > > +     struct drm_bridge_state *bridge_state;
> > > > > >       struct drm_crtc_state *crtc_state;
> > > > > >       struct drm_connector *connector;
> > > > > >       struct drm_display_mode *mode;
> > > > > > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(stru=
ct drm_encoder *encoder,
> > > > > >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_=
state->crtc);
> > > > > >       mode =3D &crtc_state->adjusted_mode;
> > > > > >
> > > > > > +     /* Get but flags from the bridge state. */
> > > > >
> > > > > s/but/bus/
> > > > >
> > > > > > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, o=
utput->bridge);
> > > > > > +     if (bridge_state)
> > > > > > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > > > > > +     else
> > > > > > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE=
 |
> > > > > > +                         DRM_BUS_FLAG_DE_HIGH |
> > > > > > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > > > > > +
> > > > > >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_e=
nable));
> > > > > >
> > > > > >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> > > > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIO=
NS);
> > > > > >
> > > > > > -     /* configure H- and V-sync signal polarities */
> > > > > > +     /* configure H- and V-sync and pixel clock signal polarit=
ies */
> > > > > >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLAR=
ITY(1));
> > > > > >
> > > > > >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > > > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(stru=
ct drm_encoder *encoder,
> > > > > >       else
> > > > > >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> > > > > >
> > > > > > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > > > +             value &=3D ~BIT(PIN_LSC0);
> > > > > > +     else
> > > > > > +             value |=3D BIT(PIN_LSC0);
> > > > >
> > > > > I think this is the wrong way around: SAMPLE_POSEDGE means that t=
he
> > > > > pixel data is sampled on a rising edge. That is, it should be dri=
ven on
> > > > > the low edge so it's ready for sampling in time for the rising ed=
ge.
> > > > >
> > > > > LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly=
, 1)
> > > > > corresponds to a data transition on the falling edge, i.e. sampli=
ng on
> > > > > the rising edge.
> > > > >
> > > > > Section 31.9.6 states this a bit more clearly: "an active low pix=
el
> > > > > clock means that the data changes on the falling edge of the cloc=
k, to
> > > > > be latched on the rising edge".
> > > > >
> > > >
> > > > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_=
NEGEDGE
> > > >
> > > > Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?
> > >
> > > No -- with the current code, let's say
> > > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE is set. I.e. the panel tells us t=
hat
> > > it will be sampling pixel data on the positive (rising) edge.
> > >
> > > LSC0_OUTPUT_POLARITY will be set to 0. The TRM documents the value 0 =
as
> > > "active high", and "means that rising edge coincides with data
> > > transition". That is, the display controller will change the output p=
in
> > > state to color data on the rising edge. So the SoC pins will change
> > > state at the rising edge, and the panel will sample at the rising edg=
e.
> > >
> > > But the pins will take some time to take their new values, so this mi=
ght
> > > not work or could be unreliable depending on all kinds of timing
> > > factors. So if the panel is sampling as the rising edge, the SoC shou=
ld
> > > be driving the pins at the falling edge, that way there is time for t=
he
> > > pins to settle before the panel samples them.
> > >
> > > So the value written to LSC0_OUTPUT_POLARITY should be the opposite o=
f
> > > what it's now. If that breaks the panel, either it's reporting the
> > > incorrect DRM_BUS_FLAG_PIXDATA_SAMPLE_* value or something else is
> > > incorrect.
> > >
> >
> > This may/will cause regressions across multiple panels and devices.
>
> Looking at the panels we have, if we retain the previous behavior when
> neither PIXDATA_SAMPLE_POSEDGE nor PIXDATA_SAMPLE_NEGEDGE is set, then
> we'll retain the same programming as we've had before.
>
> Actually, from what I can tell, the change in this patch will change the
> programmed polarity compared to before the patch for the panels/bridges
> on the Colibri/Apalis/TF700T boards, which do specify SAMPLE_POSEDGE.
>
> So if we flip the logic around, and default to SAMPLE_POSEDGE if neither
> is specified, we should retain previous programming for existing panels.
>

so default to

+             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+                         DRM_BUS_FLAG_DE_HIGH |
+                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;

and this remains same?

+     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+             value &=3D ~BIT(PIN_LSC0);
+     else
+             value |=3D BIT(PIN_LSC0);
