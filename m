Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797FF3C1976
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778815465; cv=pass; b=MxpzGI/WHIbq4oRsqEcpNm5f132W/pbQ8ajEGeZ7JdepFplHbSto9Oe6yXgWnchzHMWwqFQK1ihzfTt60iMipYscKCUz9KH7rynhN0GgtSQPGNPKB6jujdnB/2jS/BMEw7R6VEtcojEPimUn+H+g/uUSWFotmi/tonNhESB692s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778815465; c=relaxed/simple;
	bh=mkwC+8CvYatI3+0Up9f0yscSqB3m+C8rVY2wDv4jTq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRrV1ZiWp3FJXEeZGzSADfqykk89KuYS73UdhyzR/3vQpF6uooz/l6ln5o8+nbOeEA4zU2U+n4JHPok1QtrdHrh1WtoGP0Bukp8t8lYhARQ000z/0QOpQOEuRekeHrSNdoE36tzLYrsrFPObaSBCywjln+tCLx0nWI427OblgdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hpxa0utF; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hpxa0utF"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso8088928e87.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778815461; cv=none;
        d=google.com; s=arc-20240605;
        b=AAc6DBZB4HDfUgEVmvqcRfDJjVsFv5MXtzsUwPTrhvmGSYOAfbfmNqXNgDaLzyMn12
         7hNFt5EHdWNgEhIS3HCMUjHSiD8xzEZMcc3X/WnPITmh8RLTWIowwndoZNItWZEhYfRQ
         P9CVn328f7LeYe7e7XumnCwyqGzEHf5W2egPzn7P521p9GqI0RsetWC2t1oOffGoUaKg
         /hOm9FVe0RmT5hTPD10Kc6rJSgFAh5AHZ+oH73nYzb+QIJHRx3uMiMo2Jo8brVs8YwOD
         8SUnyGkCA68M58GuJ7PaeBhQzz6Gz7t7ngL0tZSNM3NhmYl0Gt7bo5XuoZODxnisOkjK
         3rUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BXRFfm4vMifR4mdkk20waoXn3Z90riflbxeppB+VHLs=;
        fh=qVLnaucBQaRSa5jMAgxCa/Xa5C9yRZw3x4P3W/mDRPk=;
        b=V0Z/u+TanEUX4MCosBNq94YWesPTD5YGDDF8nN0j6IxHUpkF9jXWpI2D2lY48oImQ/
         uRfg4PWxuFUk2b84yQab64BghG2ka4P0cPtWj8sZjb5wFV/6300IhX07m3aiByUgnqON
         BGMeIAO3MdIlNwFk2xQ1sbLxtMa+aGDRQKlSJCOstTvCvwfSBiULHouBUeN4l2RvXFTe
         g0JYbUXBHAULlqPoJ628uOOwgbxI3FoEHLW9RroixpvKyvin16mXB80qyQx5LuozE0Yn
         BkRbWe3fyHW3rLVxJfe6+NzxYLUqc3qk6EXAdgly15Y/FINtgJxvLUwqZj7a3dYZNQVC
         Lluw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778815461; x=1779420261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXRFfm4vMifR4mdkk20waoXn3Z90riflbxeppB+VHLs=;
        b=hpxa0utF82p4cAbHrZ8NrlXr8v4vh1GSBNjnUz+CszEyjJ9CM4w9+P0hG+0zQvwCU2
         0ciwxYGM6Cm/tq0rSQU8oLSZoNlavIk4TS4JLMfN1lSNOgRTscM76bkt+yq9HBtw2AsW
         zC1KCyFx2aMZr6BllVq2EWPnF18PGNSPAAckM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778815461; x=1779420261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BXRFfm4vMifR4mdkk20waoXn3Z90riflbxeppB+VHLs=;
        b=FUluUt6WN6oX/gy9Vp7iKSFQgEVCaeKMEqG+4fsGQg76szETzHxinJLjLOqluiwP6I
         UZh8pLZx2xR4SQ7bM0M4+BqPK2TBphOamIwgFb7PLKlSQR3zSEnFJ6eOa1tP5B8XU2cg
         6bYDArPV/yp4qn9exDKNUpjIgV+BhjG7vg2TPTy1PW//NmeZudTl/yF/ZR30vF7/prUn
         hrJenEgYO7FfkPdjyZ8wqACBBKUDxOvVVRsDif30XLUUUro0u8JqkQnl6gXoV1JWUoqx
         dJf4NfzVm1Ld5mtqQ8qL5E/UQtD4gH1mfRKPqcVYMCUOpdOAEj6V8vVYHwuB2lEmsxwJ
         0Gqw==
X-Forwarded-Encrypted: i=1; AFNElJ+G5JdkIMFStpA0HObxU/6jxClQWsKTyiDpDTbRKZNR4kaXHJ1IL9DGwNvGYd6+BSNR2+nYNLM3M06g@vger.kernel.org
X-Gm-Message-State: AOJu0YzxALWzInq7ofHzlc4hnmOsfh7Cl05tD6pqShSVHb2GwanZFcqx
	XjR1LIRYf4cA7vlAOmjlCfl+3bm8vQAAD8nTnxJXvYY2rZqAKUPJRD9RL+2YF7VgCdmjHOqdIoj
	gu8gy0EQf3B49lqtyCxSUQ4NXRfuZQjYz7sbOwe4e
X-Gm-Gg: Acq92OE0l46S81kXHpoS/r1SpUtWR/CwzHqttfhtK7m8/4JDVVdePCPnfv9u6NKNX1c
	NxYDGy4pYQvT/B/b5l84YbPpItphodzsmN2Ag0HmWBtyljgE0bkfc8G53QDou652UZwqeGpWwc+
	kMRtRcsi2O4Y2BqOYl83N08fn5uAUhFx1iwhRrs/SQrZhPXeWtb65enCZDJTFo/ynFc3f75CGjq
	7EgKW2LDFHbY1zBy+eSs9gcbVgHJFFdy4z8ZOlaNFxTA5JbvdTm4NNqDnghZJrASApdaxN/XVjO
	E1zE1BXviMurZqfsEKTab6WPkGAWZhiY7jgfng==
X-Received: by 2002:a05:6512:401f:b0:5a8:8b42:4ea0 with SMTP id
 2adb3069b0e04-5aa0e7487f6mr427256e87.18.1778815460666; Thu, 14 May 2026
 20:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514105151.2771474-1-wenst@chromium.org> <agYJJVfMBVL0KB05@google.com>
 <1eee92b884068d649ef7be9f7d931da27aa04536.camel@perches.com>
In-Reply-To: <1eee92b884068d649ef7be9f7d931da27aa04536.camel@perches.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 May 2026 11:24:09 +0800
X-Gm-Features: AVHnY4JJ2NEmjmGVO_-Oe8QLBifxhYq3mEMpnnEPnPIo4uf-0dFjr4dcUFs7LfI
Message-ID: <CAGXv+5HrunhENv3QD4uG0ZLs8BvdOdrQcfn_82DRP51+_+ECUQ@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: Don't emit warnings for USB & PCI device DT
 compatible prefixes
To: Joe Perches <joe@perches.com>
Cc: Brian Norris <briannorris@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yingying Tang <yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:10=E2=80=AFAM Joe Perches <joe@perches.com> wrote=
:
>
> On Thu, 2026-05-14 at 10:40 -0700, Brian Norris wrote:
> > Hi Chen-Yu,
> > On Thu, May 14, 2026 at 06:51:50PM +0800, Chen-Yu Tsai wrote:
> > The USB and PCI device bindings define some compatible patterns based
> > > on device IDs that use the comma to separate vendor and product IDs.
> > >
> > > These patterns include:
> > >
> > >   - usb[0-9a-f]{1,4},[0-9a-f]{1,4}
> > >   - pci[0-9a-f]{2,4},[0-9a-f]{1,4}
> > >   - pciclass,[01][0-9a-f]{3}([0-9a-f]{2})?
> > >
> > > These are not real vendor prefixes. Don't emit warnings for them.
> > >
> > > Signed-off-by: Chen-Yu Tsai <[wenst@chromium.org](mailto:wenst@chromi=
um.org)>
> > > ---
> > > This is a simplified version of what Brian Norris previously posted [=
1],
> >
> > Wow, almost forgot about that one. Thanks for the blast from the past.
>
> You know Brian, you're different than me.
> I completely forgot about that one.
>
> > > but more comprehensive and more perl-y than what Yingying Tang posted
> > Is "perl-y" a good thing? :)

Well it depends on who's asking. :p

Seriously though, it matches the code style around the change.

> My sweet wife thinks so.  It's spelled differently though.
>
> > > Hopefully everyone likes this version.
> > I like any version that eliminates obvious false positives!
> >
> > But one thing that can be improved: your version still requires that th=
e
> > full ID string be documented explicitly. For example, this still gives =
a
> > false warning:
> >
> > $ git format-patch -1 --stdout 24af105962c8004edb9f5bf84bc587cbb30e52de=
 | scripts/checkpatch.pl
> > [...]
> > WARNING: DT compatible string "pci0014,7a24.0" appears un-documented --=
 check ./Documentation/devicetree/bindings/
> > #234: FILE: arch/mips/boot/dts/loongson/ls7a-pch.dtsi:37:
> > +                             compatible =3D "pci0014,7a24.0",
> > The dtschema is clear that anything matching the pci pattern is OK, and
> > we don't need to list every possible variation in a yaml file.

I guess that means matching the full compatible string against the
pattern.

Joe, any concerns?

> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > > @@ -3795,6 +3795,9 @@ sub process {
> > >
> > >                             next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
> > >                             my $vendor =3D $1;
> > > +                           next if $vendor eq "pciclass";
> > > +                           next if $vendor =3D~ /^pci[a-f0-9]{2,4}$/=
;
>
> Maybe
>
> +                               next if $vendor =3D~ /^pci[a-f0-9]{2,4}/;
>
> ?

Does that make a difference? The vendor prefix '$vendor' is already
split out at the comma, or rather captured using the regex above,
from the full compatible string.

> > > +                           next if $vendor =3D~ /^usb(if)?[a-f0-9]{1=
,4}$/;

Sashiko mentioned that this papers over the fact that the matching
in checkpatch.pl doesn't consider regular expressions used in the DT
schemas. I suppose we won't be supporting that?

We could import Documentation/devicetree/bindings/processed-schema.json
and match against the compatibles and vendor prefixes from that. It
might actually be faster (vs grepping through the entire DT bindings
directory), but it requires the user having run make commands that
produce it.


ChenYu
