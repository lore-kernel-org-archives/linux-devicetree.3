Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4B4EFFCC
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166916; cv=none; b=dIr0jrAGM57JHahDNCLJ3PXfo34OTTOzWHYO/xQQPg4fKNAcBBKZWtsMlKTfp8sJVAQGGJjBnAiqxHWuiGzXaX5oAsn5sfLmaeUX2SmGUeGYQ0pMLj/sWdf/LS67523G5nVxxM4oUSSUuMgNPijGKYlWvUm1Dj4l3iV058xv0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166916; c=relaxed/simple;
	bh=8A1d+qHHMFQaSJTrPG2tv/uY9JQA2ctyWGVH/vz47R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i35J9tKTGBxsI4GpJSal6yNj2JJCgJdE5uWbsGtexuZBgvnOTG+DusPFPIuuybJXkZLs4/ORt/d0wK8EeTEBydXZfD7LiLbQexTul6GMK7gctDiDcu/1Hbjy9orbieTWBAh165/ETHpWT/nn0E5mVs2ulStpwuYUFu/Iv0hstPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9908c849564so46305241.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166914; x=1792771714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EBoejTYsbTcBCosEo6zoo5hOecy+fLbrjfkaXbBdKs=;
        b=MP2/NFt/Pc+PBz1j+ppdGejwTwFkooEjAxVvxvpKlNEmpi14em+SzcXYlanI1pKr5c
         wFJkvCUql9OaQdufInLkE8duJhicmNDNnsrNUSnWePK0k8IejYdSE8M0oEEXUVGsEXMU
         +3Sx4sXDgmsOpwX+F3Y+b577etIqABFUdPJ8V3TEDn7iq3SttPX0UhniEEqJ3tDr3Eyx
         il8JvewjYrDY5ExXCE5pE8RFZpCsexXsRjzBYb6xc5OZGO51llSpp5GRca6GaB0o0IQs
         Qck3qLJX5D6X77trXk3oTnlL+8gvdt8tLyKPpk9K2Spmmo8KgGGu0OoCg12QyLB50cYI
         eyjQ==
X-Gm-Message-State: AFq9FYLfTasrrupq02KGI/dl/rTaffN0YU0bKeEtuqwyZ8Bj6sj+yMsH
	BIjXHsuVbEyRq9dtrCwMzSOKEc/ipT4J3oWVQZ3U+2b2ZDVljj35Nv+FnGhKBxrW
X-Gm-Gg: AYBFou23nJ0rQiN7jhrEXQzZhLFLBdwq48fHeC/ukAVq5SkC3RGNzfhXLj/CIjPrZjO
	01VBqexwYeKqcjdM7U8DUtO6DLVmWWBu2vOl6ZtSWZRpRElVeTEpxPb8HQ3wK53Y2dDMJaVVKAP
	Ds6czQVm8lD0Cr+MA1afqJhsZ15/BepXx6BZE4OHocvfPQyiYIyT/+fCIpIb3smVGOV2i8X2/vD
	UV3Z5E6cx1tyhtqJjGbz5BdO2UaQRZaGo0iXvNaOCv4j7LgaNygLo2uwMV1kJsXJts8C9IIb4M+
	g29JMI8r8T+68R2bbUcRo39dtUeGx3NlSEsQAqUVzVBItREWAPSN+9vsP8mfmAhnpb3iunBTMMC
	b5ltCIwYeAdQqteB6dUfK9Wm1rVWQZTrFhhryh7Dm36AVHTAliIJlRztnC94UcqC7v1gJk2vLwD
	q5h0b/viAwIImvhOqJDbf7Fq0J0HwzNujON08fb8E2RIlmK7vFnjzEPWiICk9eVB0JwEdx3epJW
	uwCczg3zpx9s3DBiBDTj+56fhB9fCzOhuzXWGSf7et5ikU=
X-Received: by 2002:a05:6102:a47:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7cc18c28d51mr1227524137.14.1792166913650;
        Fri, 16 Oct 2026 09:08:33 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc197e7362sm2463901137.4.2026.10.16.09.08.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:08:33 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7907f01e487so3831137.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:08:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:7a1:fa0f:1106 with SMTP id
 ada2fe7eead31-7cb3a1baeabmr5620835137.36.1792166912166; Fri, 16 Oct 2026
 09:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174595@kernel.org>
In-Reply-To: <sashiko-outbox-174595@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Oct 2026 18:08:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyr7MN3Q_p2xYWukmbwdSPCmR90++AJWohsS7TWqxp-g@mail.gmail.com>
X-Gm-Features: AclHuK94_MM_qmX3UtowEDModV_nQO7Yoe2DHkKw0PQAKUP0rJtGNhubnONEYfQ
Message-ID: <CAMuHMdWyr7MN3Q_p2xYWukmbwdSPCmR90++AJWohsS7TWqxp-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] reset: Add reset_control_get_from_provider_exclusive()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:02, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] of: memory leak of device node reference on error path
> --
>
> commit 6e1c5e27c808997c3ce5fe5fc257fedbfabb6954
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> reset: Add reset_control_get_from_provider_exclusive()
>
> This patch introduces reset_control_get_from_provider_exclusive() to allo=
w
> looking up and obtaining an exclusive reference to a reset controller fro=
m
> a provider. It modifies the existing __reset_control_get_from_provider()
> helper to support this lookup.
>
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 0e11f4c81c10d..421bcc4c89cc2 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -1153,18 +1154,30 @@ __reset_control_get_from_provider(const struct =
fwnode_reference_args *args,
> >       if (WARN_ON(args->nargs !=3D rcdev->fwnode_reset_n_cells))
> >               return ERR_PTR(-EINVAL);
> >
> > -     if (rcdev->of_xlate && is_of_node(consumer)) {
> > -             struct device_node *np =3D to_of_node(consumer);
> > +     if (rcdev->of_xlate && is_of_node(fwnode)) {
> > +             struct device_node *np =3D to_of_node(fwnode);
> >               struct of_phandle_args of_args;
> >               int ret;
> >
> > -             ret =3D of_parse_phandle_with_args(np,
> > +             if (consumer) {
> > +                     ret =3D of_parse_phandle_with_args(np,
> >                                        gpio_fallback ? "reset-gpios" : =
"resets",
> >                                        gpio_fallback ? "#gpio-cells" : =
"#reset-cells",
> >                                        gpio_fallback ? 0 : index,
> >                                        &of_args);
> > -             if (ret)
> > -                     return ERR_PTR(ret);
> > +                     if (ret)
> > +                             return ERR_PTR(ret);
> > +             } else {
> > +                     of_args.np =3D of_node_get(np);
> > +                     of_args.args_count =3D args->nargs;
> > +
> > +                     for (unsigned int i =3D 0; i < args->nargs; i++) =
{
> > +                             if (args->args[i] > U32_MAX)
> > +                                     return ERR_PTR(-EINVAL);
>
> [Severity: Medium]
> Will this leak the device node reference acquired above?
>
> When consumer is NULL in __reset_control_get_from_provider(), the code
> acquires a device node reference via of_args.np =3D of_node_get(np).
>
> If an argument exceeds U32_MAX, the function immediately returns
> ERR_PTR(-EINVAL). This early return skips the of_node_put(of_args.np) cal=
l
> at the end of the block, permanently leaking the OF node reference count.

Yes it will!

This can easily be fixed by moving the for-loop to the top of the
branch, i.e. before the of_node_get().

BTW, perhaps the time is ripe for helper functions to convert between
fwnode_reference_args and of_phandle_args?

>
> > +
> > +                             of_args.args[i] =3D args->args[i];
> > +                     }
> > +             }
> >
> >               rstc_id =3D rcdev->of_xlate(rcdev, &of_args);
> >               of_node_put(of_args.np);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.=
git.geert+renesas@glider.be?part=3D4

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
