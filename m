Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD133D891A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789910; cv=pass; b=VQ9Pn1/ynrhiZXTFjUdAzyi61eOd0zVgF2Y7EgtCWw64kDrTU59hs6sOFyzhPq0518VL8RLYJ8vTjRChfYgBicJ1aVq3zlVrfjEqzYCtW+qlJbfeBKQsUoEAuDO2sREFfVKnRcOxyZVdgatdmltWK4f+Nn4YPd/8KH9/pQplSxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789910; c=relaxed/simple;
	bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA4jOyzoarV8jFMkmatxWDfQXa70cyg+SQ6uDA9u9P2TctIBYgYwjICbO3VTmw3pcSbE1c71wORNugxcy2UyTwv5idsZ49oEOcTivAEUH26IvYs4KxYYCK8JjZxiYHBImtLPortwwnoi+iwFuT2Y+TQTbd1PPskAA5O8eN6QFp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcxGy1rP; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcxGy1rP"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-651bc83e74aso10602878d50.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789907; cv=none;
        d=google.com; s=arc-20240605;
        b=PsXSzWC2OEyEDkIs6LltHfvhkejMJtnkmkp+xh8OlTvhLDP+xTlSjc2q6uQ4UAuo/P
         XmaWDSahcd9GfAgjnrZggLoMj0XfMeYckj3V2YmRioe4A4cNpMaZw3Z+qkWOm7wxerAS
         jiAtFwvHxoSL2tHGPypKZ84Z88v+qaBaYFfnR7pKkyvIcTMsKoeM9Ux9amp3r5pL+nRF
         Slt07SLxvJHIUfbfUG4TaDeZOk9ESv/s59jPYuVvv2n3dplEk1GrwpBvY+L4ZtCaCvn/
         xQ23qD98P7WhM/EkRuswtLJHzPwp5ADi7iCNpeVRS8KoOkEfrogW+ASp+mOQheLR/Ug/
         ubqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        fh=rw3FQNcrbAB65C/hBh3prr24k0iJNJZUcZMRbuu6Uvw=;
        b=iJsiX8At2iE0ycA0ujrDRD0KZACJ3Y0Qj2EdhthkXADOFFU4ZItUfi2TzHsHpj4d4v
         Xb/CDuQPGyhDwJhqqEm/yGotJzTVtCJK4em+wpLZaldDZis+HwYrBIHvbdiS43OGuUYS
         x8ctycVHXYOgwyAhs3rvmgQbJKcCbs8/uJOt5mw9XOppa4i1TWsaRrKalJeZad62lOdt
         6sfjglumlXvK5GgZX8LDoe9a0rpVKizzfemYcWWBkrEC28YwzPzx6eNKJF7xnC8WkpUA
         8+PL0Iya0v0wiZ7UCenZDNZRhyPp3Fm2pL299d3V5T6ZuhNFdfkzYMxV6G0Nc9qNkxo7
         qSfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789907; x=1780394707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        b=DcxGy1rP/N3fAuH5v+M2SY9kXUz9RxajECSpDOQ3lX4UJFi3LhF1qnN1BUfo+hflR3
         //GpI0BdBAalDiZeZIowruBzXxzZ/+Zd1LCiw6DaO77MKoInjWj6IWfixgDTxvNpk32v
         HbC8hN/Pnya96PCC6MtQfDjmYiDGdQ5ZARGLO9AMhoTq4nGKT1MAioQwCfgSmrA1/Am5
         lnPrCYjjMsE25DHe5BtqLgA619m03lUvoB9OH8HIdzLn4cXGEiwkNGwl9qK/FEh8Jdjs
         obhxNGPAq7+2BlZmvkSKxJ60qIk6aKw+6OcjMIUqUmnCsfGYLJGsmqEuuK55IPdXqAS4
         slrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789907; x=1780394707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        b=szynmnlYjXFEqHlkp5FsjIEffkwNLrMeoBOtO9EVw8Xxe6Lio1SVhHwYR9AuhmkVUZ
         e2EEVwp8dvpSq4yyOfLE8KmXvi0JlevgWHcPV/UClLVr8/rjKsSjVx1l/+8TjkPVGTA0
         XvXqS8aVeZAy6xd+0Ij6oQBunAA+8cXu14qFZoAKazstD8A9m+ZBoH9Hk8i7xLSeYtUT
         DtZgJJFdxqF2P7WbnabfncOSE/zrAmi+1N7wyw+ycwXsx7McNyV4WMQ8oJVqECyoYIDF
         pZ47csdD7MHrdUDh3BesaataYudZp8Rmkt6ESB+LnUiNaXR3N7Xnm0hUyQJlRvrJmyPN
         O/2g==
X-Forwarded-Encrypted: i=1; AFNElJ/ZXSc5spm6I5NszZG6OwhzWupaPRqH1HrqyK4fxXC+i/Oh1PM5HM9l6kHhs5N5u48AeJSYG0rBf7I9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7IGlFdGGdAIBgspnmUXD4uAOAbP0V2NW/lgRm0iAARQpn09aH
	zJq3bz4izyBjLYT+6fHrJTDqrRlySI6jb/Dl0ysblWu7XpnyYqfm6M6hJbjog7OJbzmmp+WGrAI
	R8ARPbV//ekhvkGix1yo2bvWryyx/oX0=
X-Gm-Gg: Acq92OFoySPxdFPuG038Z1GtQ82enghB9NpdSViILxyKcz2As68UwOVZ2khludpjKuP
	Lp7alfdZUPJ/udib5QSy3dOowLHiLC4+vdUngOvgosx67rxXiDe1zxdEogIrfVSFJrgGh0HgxG9
	lNHmapOoMLQSiO6NPy7sXv+CWtF1XLmwZR28sAWR9GUyb6UplKwRlNCZbFp2x1bdlQZBSI3p+5c
	8JeXgCcdRIm1jbIYwb1klmjKQQvxbpihnQ4GllrtgpTAJQAdct5ouUMSCb8uibSy3QLlgf1CvsG
	8GYeLic=
X-Received: by 2002:a05:690e:25d0:b0:65c:747b:485b with SMTP id
 956f58d0204a3-65ec99ce8eamr13546771d50.58.1779789907432; Tue, 26 May 2026
 03:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4> <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com> <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
 <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com> <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
In-Reply-To: <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 26 May 2026 12:04:56 +0200
X-Gm-Features: AVHnY4IxXGGNE6MCQzRPM_4hQIgOZYw7rJR2PEvw9EaDz3r-wxcgt_U1xXrcwuc
Message-ID: <CABdCQ=NOvzmzqS5WJG0CQ35Nd+Mh-Px5Z7ELqC_eDSqob0Jbdg@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Andre Heider <a.heider@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulfh@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Vincent Legoll <legoll@online.fr>, 
	Margherita Milani <margherita.milani@amarulasolutions.com>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 25 may 2026 a las 18:45, Andre Heider (<a.heider@gmail.com>) escrib=
i=C3=B3:
>
> Hi Iker,
>
> On 25.05.26 11:36 AM, Iker Pedrosa wrote:
> > Hi,
> >
> > Sorry, I've been on vacation and I haven't checked my emails.
> >
> > El mi=C3=A9, 20 may 2026 a las 13:11, Trevor Gamblin
> > (<tgamblin@baylibre.com>) escribi=C3=B3:
> >>
> >>
> >> On 2026-05-20 03:53, Andre Heider wrote:
> >>> Hi Trevor,
> >>>
> >>> On 16.05.26 2:35 PM, Trevor Gamblin wrote:
> >>>>
> >>>> On 2026-05-15 22:57, Yixun Lan wrote:
> >>>>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
> >>>>>> This series enables complete SD card support for the Spacemit K1-b=
ased
> >>>>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> >>>>>> high-performance SD card operation.
> >>>>>>
> >>>>>> Background
> >>>>>>
> >>>>>> The Spacemit K1 SoC includes an SDHCI controller capable of suppor=
ting
> >>>>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> >>>>>> currently lacks basic SD controller configuration, SDHCI driver
> >>>>>> enhancements for voltage switching and tuning, and power managemen=
t
> >>>>>> infrastructure.
> >>>>>>
> >>>>>> [...]
> >>>>> Hi Iker,
> >>>>> I've picked patch 1-3, for [4/4] I think it should be merged after
> >>>>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.c=
om/
> >>>>
> >>>> Hi Yixun,
> >>>>
> >>>> That makes sense. In response to your earlier feedback I had drafted
> >>>> a more
> >>>> complete dts after another schematic comparison, but Iker and I
> >>>> discussed it
> >>>> and opted to avoid changing scope too much. Andre's series includes
> >>>> the bits I
> >>>> wanted to add and more, so that works out.
> >>>
> >>> I have 4/4 rebased on my series anyway, do you want me to send it?
> >>
> >> If you have an update to make, please do!
> >
> > So, how has this turned out in the end? Andre, will you take care of
> > sending the latest version for the MUSE Pi Pro?
>
> Yes, in fact I already sent it last week:
> https://lore.kernel.org/spacemit/20260520130624.1763487-1-a.heider@gmail.=
com/T/#u
>
> You should have received that (unless I messed something up) ;)

It's there, it's just that I wasn't looking for it. Thank you!

>
> Thanks!
> Andre
>
> >
> >>
> >> Trevor
> >>
> >>>
> >>> Thanks,
> >>> Andre
> >>>
> >>>>
> >>>> Thanks!
> >>>>
> >>>> Trevor
> >>>>
> >>>>>
> >>>>> Applied, thanks!
> >>>>>
> >>>>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl
> >>>>> support
> >>>>> https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269=
c1fc1d6a659d4260fb
> >>>>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support
> >>>>> with UHS modes
> >>>>> https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a6=
7d1e3ed9c73fd7f381
> >>>>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support wit=
h
> >>>>> UHS modes
> >>>>> https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703=
f26857a58bdf6a0042
> >>>>>
> >>>>> Best regards,
> >>>
>
