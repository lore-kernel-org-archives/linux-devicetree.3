Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B501DE2D8
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839407; cv=pass; b=HVjbP2rOkd16Ox9GZBPTnXH6krC3pSjiAlJTDPPoCRyHWiynV7ghwXPemjHfYPy+jGa/uf2wQAziZN6P4+QUYIcLNYiFUcjFF+kCrYHCAik0Ofcs1gB85lzF9zfZM8WPBPYwhI0HYdPG5A6gjaWPZJg3rWIXrRvfmZLXaenEkBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839407; c=relaxed/simple;
	bh=N/aab0P1/zcuAtJ05K8PuDPEsKQcK5U1IySWx7B6g7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyuQM40Ivpylbnk3ouC8guVXVcGKEu37gxZk72fdQqDD42eKiKjziFxKi4sgBQE7gf5WCG+M1HOHIMcrjVuV2SNwWgXL7ruSCXFBJY+uIkANUA4huymDPA0vW/D/uWWkzWOCX/IWGGxj5yiE5b7ztp4Zwm6kNeiPhsJCXxy4RKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7J8FV05; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7J8FV05"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d734223e4so3432190f8f.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 23:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776839404; cv=none;
        d=google.com; s=arc-20240605;
        b=GBUvCTOPcKrtEbxAvUu4A3fHpEcjL+9RRKrDSSPDRhgw8VeuYzRRg8P0QnKa0Csscn
         lXrBq+0qzJo/x54xURzNCAPoB3F7/EHs0IqcibJhk/xVBHe2ryPPN6sUh9/h9rgI0hX/
         7JaLQgMBY8FlwwwpptuNW8FE9QMfP3Wn7rIhsFkT3aidN/dVdPI1HZ6HTiuMsL4/u9yI
         r4vyBJoBNE7aG7onjnItaTuo5XuubYK1D6OrlkuBMf7cfPMk6JH4cmylyoJ7/Nc1/GdP
         49FRAXHqTuEOLfTf+dFB47A40AeLJq9+wZdywyQm4z1xZyEUqWlvCxs7E/6e3jDvm41P
         vJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        fh=ow7de8NqO48zwVLVY4jeCks5YgvtEqW5m6kvDUgyV0w=;
        b=dmiLSNuhZ9tqWbQBp8evfGhpaur8dPy2NlJhFQOnAM3K/dLDvzifDJEw30tayoanyM
         IIvOTYRSAfIokWOEY6bLeZUZF+0Nnf0Ij/imSACzCxKjOviQ1XqfW7QuigApX9bWjfW7
         bv+4IoAJ2Fh9z5YIxD7hCnKXJ02845p3Jlra8S3JbRZwoloOLh63xbRstZK4DWhxRTMK
         3SWaXHonToB0YMPJvrshOfaDbuEksdemGz2p+h0Pw+dKLC9Tfb+e9HvsTQzmXYEUt9F5
         /lOvB9wodK/mlznrVkpEDRtE1GT0gFBzu1LnEHdh5dN57IS2d/f8C1V+8yTACDzzVolS
         V6nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839404; x=1777444204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        b=G7J8FV05RLy8+mWTi/dsxyKZPUPWLk2/zBOM/1xz8ByLwT/ghF4XexMUttDdX+XgfC
         IqHfpN4yhFHKSk9uJpCNM59gLroeIzTCygttourgcoCTwqyMCNXW2bVGA6I+c03QyMOF
         KDpozqQ4nO/8H/jgbaweAUqxMZHdWoZOXsiW0AelQLIU7NwBCv3aoxZVDIPuFFkS77CO
         A5Aw7+OlXLsf4kUagEH0lgIXwSqqG/yWfZPoHbBGsY5YPrYgsOPNF8NVjS3usCE51oA9
         /iwoCjwdYp1PGriYuiPuHXbdNldErYfp9FN4zxvgvnhAONLKXG/cA1dngTbi3l95PzPn
         vDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839404; x=1777444204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        b=DzkcInkDrmvoh6gWJU4VxnP8JMTn3oaAKhmKZu5gDgN/f9NliLWtDU7zz56AZDbnV3
         NSKw8V7ZGxbTfQ+hnL4t4Eu/Luh5XZG394OF+lb189uRSgGb7ZpRZd8dBtbUWd1BHIco
         5ClzfVG/nJ45UA/JNbSF9LLx3qKXWtOgmQDcpvg0yqSM7nluPWvkRPgjIPMjjS3T9V5e
         stHS/mAch4zpDeG1QboBHhgl9tdRldXFlnmo2GGEjBLbOIBY5HR0SGn3MJt/pipRayyC
         gTjW3MOKPV9fYY5ehhqbAXI4UwQVibC4ppQjxOsirjXQhSeDmD6wZ7XgNnslQwsAVL6J
         fH9A==
X-Forwarded-Encrypted: i=1; AFNElJ+q51KgOC7oQXl/AKNdoMuRzl0IKKH4EGY8uy9YEsltmM/4y/rJGLFRrZV+eQVNP+UoNOJtFuCnbm4S@vger.kernel.org
X-Gm-Message-State: AOJu0YzZATSDuOmGXRrlIY85n7rZNOzyZ/Sc/PuOyq3adClWo7Rz5XcG
	g13OPSkb3u0RHXO6DpgivE3IQvSoyNFlQ3rK2jDNXr5F/uIovfFjTKOFQx3mLn25+7YjcaG1CvL
	v8dKC+8NzoZHufiVo/gk9DUeUwnrbGoVZCBR2
X-Gm-Gg: AeBDiesv514ZT+V72loMkln1gMdBRWw5bsFB6ocCxI1IyaDgSwyuB3IsIM/fWbfZnW7
	2x/xbDxWMpTVcbA9WaANqXjpVlcL45sHOl/ci38spPJ36XiIkwX+v++779npoAgGLUCsLUx+bud
	I+qWUUgIIPDF7XYmmxKOsxvRGYq+sONUDzEvcNuz0D7KapkgiBD5MkfiQCn68AGq/TzAmDun5sM
	1ePXq++Pv8yfZjrL4nh17U/AojJFaCenVeCWtFKVDVMNmZUt0nTmkOUE6vYVpiouLXv39VZMvlA
	RdkooEr0NAmDPXpR3Do=
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id
 ffacd0b85a97d-43fe407383cmr31782916f8f.11.1776839403432; Tue, 21 Apr 2026
 23:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain> <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain>
In-Reply-To: <aefXJebe2F4Z193F@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 09:29:51 +0300
X-Gm-Features: AQROBzAhN7JR2HJrSfb1mWoH-p2DrxcB5H5ma8lTP3SIqR0-3wJUIBxxFdGDYh4
Message-ID: <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:5=
9 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Apr 21, 2026 at 08:32:16PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
19:44 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi Shyvatoslav,
> > >
> > > On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> > > > @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_fl=
ash *flash)
> > > >       return rval;
> > > >  }
> > > >
> > > > +static void lm3560_power_off(struct lm3560_flash *flash)
> > > > +{
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > > +     regulator_disable(flash->vin_supply);
> > > > +}
> > > > +
> > > > +static int lm3560_power_on(struct lm3560_flash *flash)
> > > > +{
> > > > +     int rval;
> > > > +
> > > > +     rval =3D regulator_enable(flash->vin_supply);
> > > > +     if (rval < 0) {
> > > > +             dev_err(flash->dev, "failed to enable vin power suppl=
y\n");
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > > +
> > > > +     rval =3D lm3560_init_device(flash);
> > > > +     if (rval < 0) {
> > > > +             lm3560_power_off(flash);
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused lm3560_pm_runtime_resume(struct device *=
dev)
> > > > +{
> > > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > > +
> > > > +     return lm3560_power_on(flash);
> > > > +}
> > > > +
> > > > +static int __maybe_unused lm3560_pm_runtime_suspend(struct device =
*dev)
> > >
> > > Could you change lm3560_power_o{n,ff}() take struct device pointer as=
 the
> > > argument?
> > >
> >
> > What benefit it will bring? Unless you propose to use on/off functions
> > in pm directly, I don't see any benefit in this change.
>
> You get rid of two redundant wrappers.
>

Noted. Any changes required into the other patches of the patchset?

> >
> > > > +{
> > > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > > +
> > > > +     lm3560_power_off(flash);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > > > +{
> > > > +     unsigned int i;
> > > > +
> > > > +     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++) {
> > >
> > > You could define i here.
> > >
> >
> > You mean:
> >  for (unsigned int i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)?
> >
> > If yes, I would like to keep it as is, it looks cleaner to me, and
> > this part was transferred from remove as is.
>
> Works for me.
>
> --
> Regards,
>
> Sakari Ailus
