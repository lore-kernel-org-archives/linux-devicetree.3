Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B93FDBFD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592339; cv=pass; b=LSEEfosf0/79rXIfFfQUqeMCEaRG+fsrFPuZdG27TDfbWy/wdDaIopAIM9e94keVCL6q1hPqq4S/etqH+Sa5bn0YI7kBJ7hVUWmmMQwPJJxgRnIkY6VDaJm9LhoftbvjvPVQKmuE4v2XIMK//Ea8A3l5dYxyscPHDiBfjTkt4+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592339; c=relaxed/simple;
	bh=9MITQHlZE2jQG0r+zMqCjYjCQ3rQ90HVws6GvzoB1Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcCFA2v7//9+UMyq8SMsqovgsBAEjmAd0k0TIxSaBykgeFVwd8Y9Nope1GH6tGFZlhyGyJddUs468WSCPIOB2SZdWZfC8FySyA2b9DVuIBl31dyubYKgb2H8XSAV/URVMzPxNM4O0cZmTO6tAyk2x6hDBEkIB4VkQ2BhLhsP/uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/GjyagX; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/GjyagX"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13988680a69so559600c88.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781592337; cv=none;
        d=google.com; s=arc-20240605;
        b=c8rKzULbo9aFcpx8pui8an6OIqetHfHsM9KkJ1wIxhw4F+22pIAq18HWBdLfAzQUl+
         Dw9xo2Ck+xaLYZzWZitu87DfZyEszhe0i6P0GGST5n5lp7EEu+yPEC/ssmZwakv1OpDC
         2OopP2bgvZxRSjCwrFOXGUjpqrG2qnBd4VtYWQxhsrBCgjg4qh6z+6Cr+Zd+wm8Guyz8
         x7/AjHv+qMG5rJKEmemQAMhfjD0g4xNRaavwC4ngJG5wsw5uzTQWFNiXoJA2lwRcaV3h
         D2SeF1VK2Js84HPNB1vUxwP0M9xcqIjpLiEBcOeCnoPScaoveEylcYAcqTa9Ky3yxBmu
         dNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8kFsmTNaVGUIcmzldWaeRj4JyXsXyJHFJfqk2C+U9Gs=;
        fh=jNdj9pFGVRJLEZ8gvvfsS7pismaKy9zMay+SV/sce40=;
        b=GNv85OEqtmDVFy+d45SYOXm1UHy8EH5ZbY2xt0vIIU+eYh62ugcghxEnDi6QhicosI
         fjtYqMxL53LpTkntbp8RdkEyMbm42d8NAhk7RBskIfPik2uOn7cKTZYTN/ufiBvOcxo5
         T33UxM8GcQl7DYL6Xaxj2eOg2EUX/dKHBjvoMP8ogOZ0NDD5BeQMkr47pkpyUaDNzGin
         3S4hSgi7wrhaSW5S8/uylSVk1sRE8BYZq/9Y0BTjRGabYK44Nh0IQMuo72OQPoNnsRRk
         Qcw82BMu0oA2+uFVLN046a7OBN4lur5kzeIT/7ehETD59x8He+bTzaNHQY0yHIjqp+Uk
         Khhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781592337; x=1782197137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kFsmTNaVGUIcmzldWaeRj4JyXsXyJHFJfqk2C+U9Gs=;
        b=p/GjyagX+PBrsY8ZGDhoJ2tR7Mc6RyJJuOwO1LieKk78tt8H7G0A1xzgN1G+1Ppet+
         iOka0pCUUSrxyhorKchevKQ72l4Cbx7Td3JfpN2eH2Ev8xa+avjwW5h11YUaFyFKOpuS
         nWWck7SesawjEWhBJuBeUoNG0lNTjjAVl/5T82eqyg0TO3vaU4Vz2VvrRknTqrkzhHeh
         n818B30I+vhZDfUSRLE83U9per5I6GHkDGq/F06yo2uC8zzTuaclUB4aG/q9SCNntdSG
         NuoRDzsvYrzqfE2+fOU4Io1TeD2ZBV8ltHNnPPQ3W8cVhXJXlVAEmx8k/Uss0hqDdkbJ
         ajVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781592337; x=1782197137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8kFsmTNaVGUIcmzldWaeRj4JyXsXyJHFJfqk2C+U9Gs=;
        b=rmVrS4IXTWFlrQYjAYPBQmsvb/Ik3YQhezblK116xdMiFvxwAMwAgyKImJdK9+ppbj
         sqbNg68bdF94YSkXyJY4XBnxLdWyr8mJXGm7Ho4Ze7oLzbMPgJ9M/fDhUOfJ0b9A2Glk
         +xBwdorOCnKFMaUBzIxtJS3UlaRJRdNxB+eqqb3y2im+ChOsrUrL7Of9XfQ5ZCKhmddy
         JQpX5Fz+35pSmuwEkKdImydbBAtHEf6hfTOmgnbP8PLTuVwU8pL3tzFBKGyH1iE5Buwe
         o+iRLLNrx2BeeoQYu/ImiqjPd8w0ktjiBB8xdw/5hC147b1tb+GphC1mvCabxK6tZ2Pt
         lqkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mzP1mYiOThLGtdfsxfRTB0n+DqadOSBWJyx2koj8KZDHsuuvbFlomNjArbpd2xa1/ghSfO66wWmD6@vger.kernel.org
X-Gm-Message-State: AOJu0YxcNDuSo5S46pmLSaHRhYeBz371NAW5BGQY5oZBlrTRAFAz6JYo
	tNoFX2+8fO4tlzCTm8iIyOVlPVTsj+tH5LyFXe32/FwDU/pN1rsCRH2oEwRocFu9dUVHMoSf9fC
	vyh0C/dQRI1V0Nf6mQmFf2ExyJQE1/n7Zrg15
X-Gm-Gg: Acq92OFuBnICJ7v/XV+cGSO1dAG6vmlwtBnfzOYXmgNXgcJHk2xcVGMZ3oxhnwmBeBU
	UW6izFtbs1IMHvvxbX+ZgIi5m1k8zgP+3ovuKOw5Z6//8m7bxTErKrrh5Q1je/ApT68xHFc84Xq
	sSjCXA/fmJ28eeIEFaPa7c346Uzf30xuND6v2aocJ1iJVbmF3BF0O+7FRVzj+mW8jb34aLTOGWe
	ZGa4B0+grbq0VJdGxx2rDsPgYNRe0Pi9WOXJl5tabHhHxX8aF/OsUDCRd2JIS4RvhxOFXhq8oH+
	oJKPb+MhA7pUAMxZwG8=
X-Received: by 2002:a05:7300:7481:b0:304:d32e:65f5 with SMTP id
 5a478bee46e88-30940261180mr8677062eec.26.1781592337166; Mon, 15 Jun 2026
 23:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512102445.55372-1-clamor95@gmail.com> <20260512102445.55372-3-clamor95@gmail.com>
 <CAPVz0n3Dw6Vtqqn8if=MYkBbYittXqsBKbDvrs1ntbD5Zn6iig@mail.gmail.com>
 <CAPVz0n3iCSeT3xJ2XkwZ6PYofwSLkc0gfm+iYo4xbKBkAtihcQ@mail.gmail.com> <ajDEsU8oZWT7KB9d@google.com>
In-Reply-To: <ajDEsU8oZWT7KB9d@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 16 Jun 2026 09:45:25 +0300
X-Gm-Features: AVVi8Cdni-YgjbkGwaPHD4SvqBamlP3Fi3rQTRtFFK2Yd7Pl3xlrNDqDtcouRWU
Message-ID: <CAPVz0n26H2t=pi_C+t8jP_cWXGSa5pk=1cpTZtkBh3=RQsUk2g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 07:1=
6 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Mon, Jun 15, 2026 at 09:19:27AM +0300, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
08:38 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 13:24 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > From: Linus Walleij <linusw@kernel.org>
> > > >
> > > > The ISA1200 is a haptic feedback unit from Imagis Technology using =
two
> > > > motors for haptic feedback in mobile phones. Used in many mobile de=
vices
> > > > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsun=
g Beam
> > > > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> > > >
> > > > The exact datasheet for the ISA1200 is not available; all data was =
modeled
> > > > based on available downstream kernel sources for various devices an=
d
> > > > fragments of information scattered across the internet.
> > > >
> > > > Tested-by: Linus Walleij <linusw@kernel.org> # GT-I9070 Janice
> > > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/input/misc/Kconfig   |  12 +
> > > >  drivers/input/misc/Makefile  |   1 +
> > > >  drivers/input/misc/isa1200.c | 524 +++++++++++++++++++++++++++++++=
++++
> > > >  3 files changed, 537 insertions(+)
> > > >  create mode 100644 drivers/input/misc/isa1200.c
> > > >
> > >
> > > Hello Dmitry! Do I need to make any further adjustments to this drive=
r?
> >
> > Hello Dmitry! Do I need to make any further adjustments to this
> > driver? This driver is hanging in LKML for some time already without
> > responds from input maintainer. It is still relevant and I would like
> > it to move forward.
>
> There were valid sashiko comments on the patch regarding resetting
> "level" to 0 and also potential racing conditions, as well as suggestion
> to check number of gpios specified in the device tree.
>
> Please see if the following works for you:
>
> diff --git a/drivers/input/misc/isa1200.c b/drivers/input/misc/isa1200.c
> index ff82252a08e1..c61adc4b605c 100644
> --- a/drivers/input/misc/isa1200.c
> +++ b/drivers/input/misc/isa1200.c
> @@ -131,6 +131,7 @@ struct isa1200 {
>         struct work_struct play_work;
>         struct isa1200_config config;
>
> +       bool suspended;
>         bool active;
>         int level;
>  };
> @@ -247,17 +248,21 @@ static void isa1200_stop(struct isa1200 *isa)
>                                isa->supplies);
>
>         isa->active =3D false;
> -       isa->level =3D 0;
>  }
>
>  static void isa1200_play_work(struct work_struct *work)
>  {
>         struct isa1200 *isa =3D container_of(work, struct isa1200, play_w=
ork);
> -
> -       if (isa->level)
> -               isa1200_start(isa);
> -       else
> -               isa1200_stop(isa);
> +       struct input_dev *input =3D isa->input;
> +
> +       scoped_guard(mutex_try, &input->mutex) {
> +               if (!isa->suspended) {
> +                       if (isa->level)
> +                               isa1200_start(isa);
> +                       else
> +                               isa1200_stop(isa);
> +               }
> +       }
>  }
>
>  static int isa1200_vibrator_play_effect(struct input_dev *input, void *d=
ata,
> @@ -280,7 +285,8 @@ static int isa1200_vibrator_play_effect(struct input_=
dev *input, void *data,
>
>         if (isa->level !=3D level) {
>                 isa->level =3D level;
> -               schedule_work(&isa->play_work);
> +               if (!READ_ONCE(isa->suspended))
> +                       schedule_work(&isa->play_work);
>         }
>
>         return 0;
> @@ -292,6 +298,7 @@ static void isa1200_vibrator_close(struct input_dev *=
input)
>
>         cancel_work_sync(&isa->play_work);
>         isa1200_stop(isa);
> +       isa->level =3D 0;
>  }
>
>  static int isa1200_of_probe(struct i2c_client *client)
> @@ -331,6 +338,9 @@ static int isa1200_of_probe(struct i2c_client *client=
)
>                 return dev_err_probe(dev, PTR_ERR(isa->enable_gpios),
>                                      "failed to get enable gpios\n");
>
> +       if (isa->enable_gpios && isa->enable_gpios->ndescs > ISA1200_EN_P=
INS_MAX)
> +               return dev_err_probe(dev, -EINVAL, "too many enable gpios=
\n");
> +
>         ldo_node =3D device_get_named_child_node(dev, "ldo");
>         if (!ldo_node)
>                 return dev_err_probe(dev, -ENODEV,
> @@ -479,9 +489,9 @@ static int isa1200_suspend(struct device *dev)
>         guard(mutex)(&isa->input->mutex);
>
>         if (input_device_enabled(isa->input)) {
> +               WRITE_ONCE(isa->suspended, true);
>                 cancel_work_sync(&isa->play_work);
> -               if (isa->level)
> -                       isa1200_stop(isa);
> +               isa1200_stop(isa);
>         }
>
>         return 0;
> @@ -493,9 +503,11 @@ static int isa1200_resume(struct device *dev)
>
>         guard(mutex)(&isa->input->mutex);
>
> -       if (input_device_enabled(isa->input))
> +       if (input_device_enabled(isa->input)) {
> +               WRITE_ONCE(isa->suspended, false);
>                 if (isa->level)
> -                       isa1200_start(isa);
> +                       schedule_work(&isa->play_work);
> +       }
>
>         return 0;
>  }
>
> --
> Dmitry

I have tested your code on my P895 and it works perfectly fine. Should
I resend with these changes or you can integrate them while picking
patchset?

Thank you for your suggestions and efforts!

Best regards,
Svyatoslav R.
