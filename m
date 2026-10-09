Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2644CDA1C
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545969; cv=pass; b=KR9Pj44wNLzOr/QvSvSZADeHQZarzTm6DqBNQiQsKK/41zpMow9U5ZuDtNs7f1PdM27jrQ3JhxLVGSz4nDm8wtL+8IHUeUkiB1ydghEppHnAzv61FULilDHxaERhiZKI69WfPmopKuUiiRzseBWRAJDJ8nbVf9KbIAUkH+I8L9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545969; c=relaxed/simple;
	bh=C53y5eHVm02NRhVf3GQWkstdsW5FKQKH/LzQH4a4y1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hmbo0kbyld2NrGCjDubCWaViVKqXfqikdqZEqKnaoK3DCWaB2FvgMMsfG8VYwQecEO/dHl9KDPCY0EUVmfhOhi7fhR8ELOXUnWyrFbCinPMvwvjG5L2Baa8Gc2Qm3KU6MmaxSP9ERDYole89QqUD0k17Vr/kAFzQ6w7QzF0RifQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD9syIPz; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD9syIPz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a166199820so10399675e9.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545960; cv=none;
        d=google.com; s=arc-20260327;
        b=cRAa3MvKLS5C2KUMYUDrE5n6IALFETtL+EEReg43iJwpzxecsSFDAclA7FMWNPvok0
         zLGDrs4Gc10QI4wym8TPmiY24TaG5+PTGVAO8W7htqU8tdW1sukPKf686GJttpAS26Sb
         scLk3gGfBpgti7lMvMuwp3elDxKMcDfqzych5wbm7gm+BwJxNhPwxf4tU/U+745rgjoj
         AeRoMm6uvVS+AmNVHRINwsZXyYdMtmdJCo0mgJRNIdE6WLg0c7wzHPWxQiJhDIBMZF+N
         3x/D8b+/2cNs5Sr8ZEEG+rai8FgwUX05uBk8fnYu+Hp8LdRWD7JpTlb1rp68QZPm3ds6
         +C7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zimi7cKuxcUlgp7UpEfU2fGEv64UYy0GKgKjfilsD2U=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=hyCJ8DBa59RyTj2sUCpXB4t1Hkn5D4lqdFRteMhGlDae6Acv5O89fWEbrzQzQTEyDX
         TFIACvIWQoRo9U47Do17fX9U3/6T/Y/bR0bc4UqFJsDCxuyVBr/rqWY1Jc9mHLC8xO4c
         gI0QySXXy6ajl6QcPtRo4Dczse4/LYY3hCcNc63AJ+q5WMbucC4o6cePMHE1UYWbFObK
         JXltzOBM2bA9h/ty6rQhhTIwv1WhCFw5PgZ2rMoAqEygnvwcamXCMt2A8c/ia8O+UUHe
         jX/hx/xKa5q+yfLsOdnbTu5GgPv2qYEgMTZcjc6s/SS4lNijYFHa7COo5SYjQIC82vYB
         RSUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545960; x=1792150760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zimi7cKuxcUlgp7UpEfU2fGEv64UYy0GKgKjfilsD2U=;
        b=CD9syIPzcuz2KYYF7bRbeNJ7DHQwXFDUvI8nru9CBh/OtzjNQjM7VW7teuRSFZf/5Y
         CIHSIho2zfbm1yjOGjNgGn2H+/lojDBK8KTNXvM2ybwUDOUvHEJ/PvsSSEAx0oCW/fa/
         iaybOyzc75cOilRx/PwbR4Vgg7qV8RXsuEMxOskExFkyhRldwKt3Xx3rZBL71QBoB4eh
         ZR2rJsrKaRhM56R1H3PMauZvAN1as4C98SbhfYjx3OTfVLgVA0WHybncB/jvkknuK395
         n1sRE6U6ILXCODXprjIUQACTe7Mf/1zX9n/uJwdHylOpCMPr0NXnC2h5hoGRaqXkapgi
         VOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545960; x=1792150760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zimi7cKuxcUlgp7UpEfU2fGEv64UYy0GKgKjfilsD2U=;
        b=jvs5Do0/zCJ5th92X4fkIWUtnOXpgwuIkzLCNshiK8BHbBDjwXH1jY7tJ5Iq/LZHBf
         TnUIzlZ4Dul23lhXZlkQi7NF6GJcMsMn/zalqKfokELNJALffC/RyrOPFY5eBwoJb+SY
         c92hXKERHJJhIQMfHNPJ6wr3NAPTH36pBni8HErYyc+95XJnTUbauP0XnjkifVw2DZRY
         Ab+zrHpvLBLZYMV/IompR8eixkP4FEpVhNbOvSrhMoS/gtlXe98gRqX6liD5kJ7thI+j
         l0VDt8ASy8yrm5Ojhw0nQYA2cY85ajkRuT42a3nc+bmuMKWGOEDfqj5o3+r9M6DGSiEG
         TTxQ==
X-Gm-Message-State: AFuF++n8liOgWQXT0JTTgTt15JxixRQG6gJyzXkxHyiDaQBuZp0+Zana
	q97tLvfRp4ZODh7emeYUZMkGSgB171vTuNTom1YMJLZsNwErWMbVR7GAt3mTY6qYleGATu9lP3K
	lTzn/rwyxxgSvLtbW8UVldHCQOIFKFX0=
X-Gm-Gg: AYBFou0Sz+YXYTmwNjovf9TdYktlqP05KLv6zsps3FquDBIeaOzRZ80FpMIz1QNg1QT
	vZZyQcMGj2smr4Q9vIQgOyh6jbtU1KK9leAMISO5g42TNk2t6444TYsyS4LuBrFRWDuoEKt2FOX
	vLmIANadTNAReyEZNZ0YXBune1KmnymNLP/Gsg6Xb7dImKy979TF7JDE2y5jE+jxd3PsUxDrRtb
	VkPjB6D69LwRYD4pHnrgJmEtAbv9JTzVPhKAT3Qzd5jeRnF2+JBnTQO3AUuB9gGgIlQkyzSRq8J
	twBADqMK6Txe30diK6snDYEVb2tkbULdS6JaZwHiCP9Wzww3ImwClg68YbiA0RdtE6w1o4giJw0
	I291cWybFmcxdm4lpKt+jB2B+xwl0nIbhgPquxsw/f6QPVzOuqigvCp7Oo331ETsfNsziV+11xQ
	==
X-Received: by 2002:a05:600c:a219:b0:49d:2589:d8e9 with SMTP id
 5b1f17b1804b1-4a18dcc9696mr23982235e9.11.1791545960167; Fri, 09 Oct 2026
 04:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929125807.35C131F000FF@smtp.kernel.org>
In-Reply-To: <20260929125807.35C131F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Oct 2026 12:38:52 +0100
X-Gm-Features: AclHuK8-9CW2XbXbQxya7GHaAMIQisQ-m3E94Ic3jTqTyMe54MVLfxYt1EYvEIQ
Message-ID: <CA+V-a8v-s_zQLfG-Vm7z465ZEEH=XFdnjhGCsMF_Z-eRw4gHBA@mail.gmail.com>
Subject: Re: [PATCH 4/8] iio: adc: rzt2h: Add optional reset support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 1:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] iio: pm: shared reset_control deassert_count leak on driver unbi=
nd
> --
>
> commit 2c9879cdb042266b9cb867be82cd949d29dd6f14
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> iio: adc: rzt2h: Add optional reset support
>
> Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
> that is not present on RZ/T2H. Asserts the optional reset when the ADC is
> runtime-suspended and deasserts it on runtime resume before calibration.
> Uses a shared reset control to support SoCs where the reset line is share=
d.
>
> > diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> > index f1a830da6f9b7..4726f892da232 100644
> > --- a/drivers/iio/adc/rzt2h_adc.c
> > +++ b/drivers/iio/adc/rzt2h_adc.c
> [ ... ]
> > @@ -706,6 +708,10 @@ static int rzt2h_adc_probe(struct platform_device =
*pdev)
> >
> >       platform_set_drvdata(pdev, adc);
> >
> > +     adc->rstc =3D devm_reset_control_get_optional_shared(dev, NULL);
> > +     if (IS_ERR(adc->rstc))
> > +             return PTR_ERR(adc->rstc);
> > +
> >       ret =3D rzt2h_adc_parse_properties(adc);
> >       if (ret)
> >               return ret;
> [ ... ]
> > @@ -767,10 +773,22 @@ static const struct of_device_id rzt2h_adc_match[=
] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
> >
> > +static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
> > +{
> > +     struct rzt2h_adc *adc =3D dev_get_drvdata(dev);
> > +
> > +     return reset_control_assert(adc->rstc);
> > +}
>
> [Severity: High]
> Does this driver leak the shared reset control's deassert count when unbo=
und?
>
> If the driver is unbound (e.g., via sysfs or module unload) while the dev=
ice
> is in the RPM_ACTIVE state, devm_pm_runtime_enable() merely calls
> pm_runtime_disable() which forcibly cancels pending autosuspends without
> invoking the runtime suspend callback.
>
That's not true; see the code below:

static void pm_runtime_disable_action(void *data)
{
        pm_runtime_dont_use_autosuspend(data);
        pm_runtime_disable(data);
}

The action disables autosuspend and calls runtime disable which will
asserts the reset back.

Cheers,
Prabhakar

> This RPM_ACTIVE state is reliably reached if unbind happens while the IIO
> buffer is active (where IIO core triggers an asynchronous
> pm_runtime_put_autosuspend), or within 300ms (the autosuspend delay) afte=
r a
> single-channel read_raw operation.
>
> Since the driver lacks a .remove callback or custom devm action to
> synchronously suspend the device on teardown, this
> rzt2h_adc_pm_runtime_suspend() is completely bypassed and
> reset_control_assert() is missed.
>
> Will this cause a permanent denial of service for shared hardware resourc=
es,
> preventing the physical reset line from being asserted for other ADC inst=
ances
> until a reboot?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929124248.23=
7032-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
