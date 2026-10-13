Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C19E52120B
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898472; cv=pass; b=MtcrWH4Qiwj/gBV0kOWI7535QEIN5eBU67SJf22wZmgafVCOOWtEPkraxyY4ps5fUfT21FRAFHfVnHnVjCOmQhaervIEiYgwsOy9WCVmbJ7ZGxZb8mVg00k7Dom0rfn36hJSX0uCIKJtsNcuoYNje44gwuXD/vrsN8SuBwF3MKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898472; c=relaxed/simple;
	bh=rum1qEWxnjQkNc/QZyRngUhFTPTCbS/MB5RebliGBbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7wSfYggmJPVbufj3KTzADGXq+WRSten2pJplLvPjhi4ws8uo+uIxKU101nWQwRunz+APV85h4+S6V9wUMrJvMEsCI2f5PO/3wruH1jt2XDpqSSLwFzmX/fO3SeU9T62crakGWWO+031L22RWToY6hsHZhtJNiulhbXbz72MCiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNNJ3kor; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNNJ3kor"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so17875375e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791898469; cv=none;
        d=google.com; s=arc-20260327;
        b=IGoEm6fyNEwuNi6/OjnjEaTxFoxrFMnd5j5qaT4Yjjb2OCnb1girGND0HRd5W3vmYG
         6nVZDWFQgLt5uxLxxOV9fKsKl6eLKjpkZ0slnNhF42bpQQBfROD3DWshI2DrD0SvbtV0
         qgx4DAcPC5DQ3cITAyaCWOjcpSh1A6T5/7cbyOfgel0evLk9AYr0fgJwaWWJlqwnbePT
         sfNu8X79n08BrSghSiyq8tnYKM5b3kXFR8Rc+XkAKRQxHyKvNmny4tFJB+ibkDXesKb/
         RnvKlIyDYCOsRdwkb2VwlJqfW5FKK8atOMrx0RvPnaxxZzqZJEdivsgyL3tpHqBvs7yd
         gaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8ODZ279ysMIjt8ws2/8idiazas6JnMazE457gGy3Tk=;
        fh=IT2ogckakrSRjqzNcxBTSGospuGJTXdLWkJYQpxnM5g=;
        b=mL/MiE6gnSMdCPKgiMlkhspCQZpjjR69/YkI+xsjHdGHRUnIYavvMl03wGsL7AsuM1
         f+SDRVN9jK3eRIv0g4vDnh4kHMxpUHUKx1rYVD7hikRmRU+8LGsm5A2qpJTcCs37PFWo
         UUGpAxFq3pkrF7s/scOz/kPtiHlaajBdzFwJSIU7AsJGJewcyXkObN25vHdamzU1IFZT
         +7uNIfJ/5B5I4cZEwbV9HFnhykHCrCSTFPAv3s2VDsdog9S+yjJN4X5kqz0O7j+YlO91
         v1yoFQRD2tgnhtA084jSXFSioESEaG4neCl0jESk4BsrGLhy752nk1sSUeTG5r/INsxB
         vIig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898469; x=1792503269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8ODZ279ysMIjt8ws2/8idiazas6JnMazE457gGy3Tk=;
        b=WNNJ3kor6tD0u/S+MqG+ODAoPMq/PZq4nszdb/VjaCtcmEY7+YHFXstAH/0nqHwA8u
         LspQD/G3k7lWSKWoGtiUum+hbc++18+JGez1AQRR55FXhwDaKhL1pjlzR6WAHxqaG3Ua
         t3ZBggEBLzLX5i87apQH36t2SyYdKYHf/+c3o6j4VR0nrKAORhVsngyNzD3+Fwwe5K0f
         65dRe+DdDpAjWl/I6KpVX2LYMOFCtKfFv6LRKx7lnoI5MxFbP1Yuga0Xk9jtU15LxhYq
         33hIY9USM6xb5AlwNuXa7faYQh3BUlD4WKvD/HsdFw9M7vAYIuu4Bw/hsizyk/vDAq+Z
         AUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898469; x=1792503269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8ODZ279ysMIjt8ws2/8idiazas6JnMazE457gGy3Tk=;
        b=jXxCf4TXNMViqzsw9/tSCasj7kUgEFJEw73MSrhKdunqSbtZdoP4E958YL3RJXyT/L
         FbxWH16Glpj5t0BzvGCRJo3yJwfOtsbMEiymnhPshteXsjru3UXl9afZA3Vj2WRIQYYi
         E5hCsm7Sbu81IhExo6R/smtcSHe8nPhUOpz6kU4rmmt1VuaojBXlUg/AFKPNQmY3gFR8
         UBg5G+2MahIJp0zILSE64dKIkUhCUvdkF9tdvSaMwKbE630tULukB3S/OxQ137chH2Gq
         Bw1FUuu8O9onjvIXtwxaa873xASRDB+khmzVN/4wH8WaFnu4MK0trAt4i8CdCrQ1NVy+
         fvew==
X-Forwarded-Encrypted: i=1; AKwUvBzdlz4ttmzy49ms5io61Em8k39Wm4y0NiJGbAVEYgIlsLkKwxKXdQECf09Qtb+kRUnmOe5m3mH9ckkI@vger.kernel.org
X-Gm-Message-State: AFq9FYIVsBlHMCAAMcnzfIdm65j1R6sSbGB7rtcNpyw9AuBQVRcfhifv
	8iusN20eAVNWk/MrovmZrQFmXWumO9LrtoBPLnfguKC2oyI2fuwwX22Gd6MM3+QV7Sdp314WDLD
	KUvtAPrIYY66DW/k0xCFaimYRjvaVCl8=
X-Gm-Gg: AYBFou18VBcSCh1JFFerTu8+mhG95j3lFqAxA93f83w9S5PZBGyXC5YKA4kwSJs8GQb
	IHDLS1XBWm6nnLR/PDvrPTn1b6q7/hwHbPYXsOuGOS5eYVi8zw50bPQWsVytPNxCKD1bpkPoV1Y
	m08goELk2o8lYgGImSMbPEYfFM6W+cstWw04O+qiZzNEBef0oosomwjgeYouFpHbRQ2deJMb/gq
	HmvhTRlMlZkaBEunp/78HQt6rmQ3dcDl/PnifPppk9Zhb76oSquoyuCpvjwmnyLtEhs2xomlE2l
	meO1xe/FuUJc7WAedifeUFN0h7LPnLcTjj1bDQLVLpC+4iVfrlV/CTyiMkMS5CBKV/tvlDaFB8p
	H+4Hgs1qRJi8jddMrvxcm8cL0XxftB3hws4pfWRNkCWRFXR40mVQ4aidMQqamB4wlXdkiw5H4gQ
	==
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id
 5b1f17b1804b1-4a18e4d55f2mr282596195e9.31.1791898468395; Tue, 13 Oct 2026
 06:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <sashiko-outbox-165990@kernel.org>
In-Reply-To: <sashiko-outbox-165990@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Oct 2026 14:34:01 +0100
X-Gm-Features: AclHuK9yXvosqpoEdi8gTLFoTZpA9vUA7jJSVlp6BidQuyc7Xjr_s0G1mkXtk4A
Message-ID: <CA+V-a8tmMnGiVTSGQsbFe6eKvgGowLaiM-+eAccofh_DsWERPg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 9, 2026 at 8:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pm: hardware stabilization delay is bypassed for SoCs without ca=
libration
> --
>
> commit b9111d7d4d36117212882ae96747fcfe15f3bdd8
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
>
> Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which shares
> the RZ/T2H ADC IP but differs in channel count, sampling, calibration and
> resolution support.
>
> > diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> > index 0703c2025e3fc..be8273f3b61d3 100644
> > --- a/drivers/iio/adc/rzt2h_adc.c
> > +++ b/drivers/iio/adc/rzt2h_adc.c
>
> [ ... ]
>
> > @@ -818,6 +1005,12 @@ static int rzt2h_adc_pm_runtime_resume(struct dev=
ice *dev)
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D pwrseq_enable(adc->pwrseq);
> > +     if (ret) {
> > +             reset_control_assert(adc->rstc);
> > +             return ret;
> > +     }
> > +
> >       if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
> >               return 0;
>
> [Severity: High]
> The datasheet note below indicates a 0.5 =C2=B5s delay is required after
> releasing the module-stop state before starting A/D conversion.
>
This delay is only needed for RZ/T2H and RZ/N2H SoCs where calibration
is performed; it is not required for the RZ/V2H and RZ/V2N SoCs.

Cheers,
Prabhakar

> With the newly added RZ/V2H(P) SoC that lacks the calibration feature,
> rzt2h_adc_pm_runtime_resume() returns early here, completely bypassing th=
e
> stabilization delay.
>
> Will this lead to hardware being accessed before the analog circuit has
> settled, potentially resulting in corrupted or inaccurate data on this ne=
w
> SoC?
>
> >
> >       /*
> >        * Datasheet Page 2810, Section 41.5.6:
> >        * After release from the module-stop state, wait for at least
> >        * 0.5 =C2=B5s before starting A/D conversion.
> >        */
> >       fsleep(1);
> >
> >       ret =3D rzt2h_adc_calibrate(adc);
> > -     if (ret)
> > +     if (ret) {
> > +             pwrseq_disable(adc->pwrseq);
> >               reset_control_assert(adc->rstc);
> > +     }
> >
> >       return ret;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009184122.13=
78797-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D8
