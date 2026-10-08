Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485C3A59A8
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477472; cv=pass; b=a83TC6cRtP0EFe97jtmYng3jYGPo3h1SAWYYa8b8R4a4BvMPG6cRh99KMWPDNwG9g9NkvW/TgAjNyuLLxKQyxCnaDwav2Ghd1nQ/a994LApkIicnq6GFqCYnRDJY+kK7tJPseccNVtQ1xYxSOUupebZ7Qg+BNrtyg92WTdLXR2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477472; c=relaxed/simple;
	bh=En5U5u49w4UmshWqOnBCL/m93syLvZU8NeEuJpf26Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS65PnT0k+4hjsz2ZWZa38VYTJoDDmSQ74grhg8fWFRzlGG9UKdaQlwyoC0xWucJwWJvEbGatC/AeiWDbFKfYWOVCA1wqovHTp3izYOoB/ZKf3SvBbFflE5+NtRmtwyxQM2xrIm0SatUjPV8KOu+yP0OkJjfu6GNEtowMJ1OZMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtcgEUU7; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtcgEUU7"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49429181ce9so1720424fac.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791477469; cv=none;
        d=google.com; s=arc-20260327;
        b=g0hCOaxqCSXOx+r5M3r9QGCogmAHj0NPUqKrwhEIVNzt5eetlTTrmaATcA8ocJxB86
         lKbeTiWiKGbRVg2aM0qX+veLkU1jJoOh1orzhZHNjP9zWYNxrP78+W0PSkf1/Sn/kENc
         9P1GMviHlS87GaeA373Js3gUzGJEI0yhPXaMFkJrsDTe/kxmqvm4CbGc0D/sTMKuX2YJ
         2yfoTAFcl51/h9wLffl+xMh2C1ZRCJUPDVRYNpKXt0GsOtwniD7Bc/x4CzRD71WfWZ47
         9WAdmEbdQQ6ibVCLPk8QDpe3OhIBL00JkSw1hvo2t8SXmNAhBhrzSgdfRsD7umWBIQHo
         qr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWfZrABJb9vZdtlqeyCN1MT17SR0Qr3TXZnegaH4SR0=;
        fh=htxTa+iw1X9E7xsOrGcF+JbA6le/g0nVuI1FI67CZrQ=;
        b=UNKwmmrZmQWc4IGWffzq3xr1TTUr13FjQxdA0MF0qjpCGLgvHGeyutZsfpL6xl5vzk
         LUAOqv4YaB1oxdyFLYHRVaXZXTcywbhWEcaBSb3p2xibjc5VqLKZ68B0hadwbtMjW1HA
         4o2cAv2Pf4IzedBpZ7/mclLe7XK7j+w2p48lN0l/dSNFzTLNwV0D8s+7UzcewNQy1Jb9
         5IrBdB+8oilLIp7y4e7byGGbxCxHg+6wLealNNLTGwRMGD2fm41GEB4tVU1eBKI9z+G1
         CFY9eYXZt3YYFGOI71J0e+3Iw8yE+M3ijImsS9s7MHdGp6IMknDbQEXpqxE31mqaE8gS
         5yZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477469; x=1792082269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWfZrABJb9vZdtlqeyCN1MT17SR0Qr3TXZnegaH4SR0=;
        b=XtcgEUU76y9VIuuSH8DsNQaTGx0B9Roqxzx6aOAzW4VLt3/lDIuBm2p8L/fCLjjSr8
         0vOPN3lqoqvucYhPs9EkOoIqFKZ5lIqArsP1e2ceIUDpGFoyzYDQi0IhPVMSiRDwmt/6
         jYFdFp7B5G0KxOoO2OBLgXOAgY2fI5YcfHN43gIjR2YGO1xZ6/VXrag3wsmGWRjfHHIa
         bQBJrw5RCuMNOMXVdH0/uty5/jLmhaF+2o/93eXDs3G4bqyt0RqrYQa8yQszrK44B0YD
         vxuR7RR1mVJ1DniowFmT2mmDNjazTGpuQ1QQGMS+OL3yKgVl+6lau3b2Yh9uc9tXD/3C
         tjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477469; x=1792082269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWfZrABJb9vZdtlqeyCN1MT17SR0Qr3TXZnegaH4SR0=;
        b=2XejoyHB8TCbKSgjVYXGjbyF9nJQ5YnOo1xGenXDRJa5G0H8lPA7XABCRCv00hS4Mw
         lKfBh/tEE34LySAshFVQYoYaLJQhnirb2Ho74+b75A3nfawKOCPDAaqjCNbyfOjG280i
         mcxBZv4SsK6ZshskR5LvCN89pRqqpJ5hewwXGLXxovEwRcvtt5YDku/JQA88l/2X1yo1
         w9dv1gNb2dNoCraG1To2G0m01JKMULcb+7MOwfqbUW9f9FJSNATzVwzDy+bU1Tpzxehs
         GrhdKlCSml4ZSuUpp1KQXwevlnBO04awlOj+Ew2seW83566ikLvrGqZSop24w5qon8XD
         UUyA==
X-Forwarded-Encrypted: i=1; AKwUvBxHArEi0WzavdStgAKKFyhpQ7xLW+3590+8HWztv17O8S9Q8ZC+3WgI8DNpklcSjoE3pOIvmBZXddUF@vger.kernel.org
X-Gm-Message-State: AFuF++l/73Uv8R+sGtnV0CDWei/gfqedhS8eMxJW/TWDu1eggpbWzj3s
	r5SloFmlYt6E4AoBR/J3HrV8oI9ulA8/R79tt5b6FhnKRJIwH2O7lRsoCd+V0VcTTTKTSgmUEuQ
	W0xMiwpHJOe0nDkBQG42ig5DbjWtMVMs=
X-Gm-Gg: AYBFou2T9/g7+w0rHBD1PzVg4qqj4kMeERAS7smQY3GbV5AOdKl1BkISDRXc8ST8p21
	1NXYONbYXqbL9YBVf8mdp45Iq106NFAtPJzS9aj4RzOP3lNcQandzsFIio+ui2IlN34jSr8qhHh
	TvJRcXgS+tficOoNe52JR5zXic8ObErukS7j/Mj0wvS4OqYch2R2nIc5BEdMSbfxbsXV4H5lGLu
	ZVGWLSNZZ8Mp/F6G6+GldBFAUbciIMhxNzPG69oI75dGPHc429N0efResfqBwjGBg2qwnp0z5sd
	q8PddWyzPonkLj7LUzfjNTuzeEf+2m05tWbiD1GjMXtNRkgyFN5CwqcBFDwmrpfDAJP4hChXgKy
	Q/ZGPqM46nw==
X-Received: by 2002:a05:6808:50a0:b0:4e8:18ee:eb4d with SMTP id
 5614622812f47-4fc45d5e66fmr6923456b6e.20.1791477469015; Thu, 08 Oct 2026
 09:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008155727.3801095-1-mmyangfl@gmail.com> <20261008155727.3801095-3-mmyangfl@gmail.com>
 <sashiko-outbox-164366@kernel.org>
In-Reply-To: <sashiko-outbox-164366@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 9 Oct 2026 00:37:11 +0800
X-Gm-Features: AclHuK9fhidRIKiHbhhSf7GOuQfr19VhGOH1frhLvA-cSkV3GxZ1gjBKfdjhS1M
Message-ID: <CAAXyoMM_VD+g4Q3QUWfB90mjyWK4VO0xwq+MU0nwP=oN4-muUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] regulator: histb: add voltage regulator driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 12:06=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] regulator: histb: set_voltage may apply voltage exceeding max_uV=
 constraint
> --
>
> commit 800fca6de780a18cd0c58b4d9fc8681fea0944fb
> Author: David Yang <mmyangfl@gmail.com>
>
> regulator: histb: add voltage regulator driver
>
> Add a driver for the voltage rails on HiSilicon STB SoCs which are
> controlled by the PMOC block through a PWM signal, as described by the
> hisilicon,histb-volt binding.
>
> > diff --git a/drivers/regulator/histb-regulator.c b/drivers/regulator/hi=
stb-regulator.c
> > new file mode 100644
> > index 0000000000000..77073a646e493
> > --- /dev/null
> > +++ b/drivers/regulator/histb-regulator.c
>
> [ ... ]
>
> > +static int histb_regulator_set_voltage(struct regulator_dev *rdev, int=
 min_uV,
> > +                                    int max_uV, unsigned int *selector=
)
> > +{
> > +     struct histb_regulator *priv =3D rdev_get_drvdata(rdev);
> > +     unsigned int duty;
> > +     u32 val;
> > +
> > +     if (min_uV >=3D priv->max_uV)
> > +             duty =3D 0;
> > +     else if (min_uV <=3D priv->min_uV)
> > +             duty =3D HISTB_PWM_PERIOD;
> > +     else
> > +             /* rounding down keeps the output at or above the request=
 */
> > +             duty =3D DIV_ROUND_DOWN_ULL((u64)(priv->max_uV - min_uV) =
*
> > +                                       HISTB_PWM_PERIOD,
> > +                                       priv->max_uV - priv->min_uV);
> > +
> > +     val =3D FIELD_PREP(HISTB_DUTY, duty + 1) |
> > +           FIELD_PREP(HISTB_PERIOD, HISTB_PWM_PERIOD + 1);
> > +     writel_relaxed(val, priv->base);
> > +
> > +     return 0;
>
> [Severity: High]
> Could this rounding logic result in applying an output voltage that excee=
ds
> the max_uV limit?
>
> Because a smaller duty cycle yields a higher physical voltage, rounding d=
own
> the duty cycle ensures the output voltage is at or above min_uV. However,
> if the exact requested voltage range does not perfectly align with one of
> the 240 PWM steps, the resulting physical voltage might exceed the strict
> max_uV constraint requested by the consumer.
>
> Should the driver verify if the achieved physical voltage violates max_uV
> and return -EINVAL here instead of applying the setting and unconditional=
ly
> returning success?

The counter spans 240 steps, so a request off the grid is at most one
step (2.3 mV over a 550 mV range) high. Rejecting a 240-step miss
would just break DVFS: single-cell opp-microvolt is a zero-width
window.

> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008155727.38=
01095-1-mmyangfl@gmail.com?part=3D2
