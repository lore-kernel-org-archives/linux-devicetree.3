Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C02F616B
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294927; cv=pass; b=VC2ghkP4OU41mJxYOp+VBnoRNQnOTulZI+1vjOIIUd69cqPMNt0xLtCJlIgXBr8K7+CzI44Jz5h9/YN5kzFiVjsn1GjAP/Xm3pWLFT+qVm/VLGN8kPMsuEAg1cOpOq0JeK8kHdYfELemRLhXdw3iD2Cq34XB5Ksn9/LtUh38Jk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294927; c=relaxed/simple;
	bh=RTViPFoJlknzBdTZe5oQ+ExhGFDjG4WdUKnM3LA4GVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGNVUzYvX4mhl5STe0tTgL0FdnmAgJWAPxTS7yr1P1Ngy9ipW18POdij3mVCVuH16q5fhbdoX98Cr/o4u5YOGOK45/0+3sHpsurPcLXxgnQb/6kXIqMjfpcjEVOMmYgL2QHbOzLtI5mteValU8MbZfBSdQEjByyHLf7ESiDP3no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYNGvz8Z; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYNGvz8Z"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c74722e27so8959981fa.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 23:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787294924; cv=none;
        d=google.com; s=arc-20260327;
        b=AnbGXomgMyMvIGI/nOTYoe507TNoyGPNlouU5JZeBMHfwfJqdsykz1sni+BoHAaM6U
         KzaWr6JhzqQHukU4GFRtSdsNisDzPclnqHuVQTrYspC73KIgEhCuIa1Z6DYcw+I85mtw
         kw92Oyoy5QmzgrVWiU24cyIquWPHj9R3lB8eL8ifyF+29wmCLFeIfOOvcXFmt2CLuZYT
         UN7f45C6dHTnGP/Fgwdr5Th218OibiF7zG/YSf6d0nXUSnHJrNJJR6UQDXU8Yd6SldFK
         j5NlvB/kcgDAG1l5EJpjfln9D5wdEPJZXeFedjxnixVAqQPJ85TEJuDiZavF4keRanra
         X3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZV2eo8l44i659VRpU6Jc0rPYdN+/WIVgMkUx/EFXO4=;
        fh=CrFpeN82h5htB90GYJYLt3SnQjJ3pkeHP7KH5FHS/zY=;
        b=en3Ticaj0mGEV1tMyKLbzOL0wqJs65SOiJI9AbRdE2mRVESv+OZ3STwUZEP10n29C+
         eSGeISfBZEkmzNssRqD+rjoTzbocldbzTL0VTqLh1oCfV91xTC0YOGm0KuKyVWzeGt9z
         Z6NUp9DV5GFSHNKm8jLJJziWLSibC2oT/DGK8EdTwkzqSfABA0RvCOK9eEF69UB9ZKiA
         j3JGG+dHvWI0qoZ1jh0y+s8X58xUFdB4Nke6ix+MDGjJfjAydiQVXAfZDw+XZmZfAZUR
         vR2DQ2C2Ay0gN1bXdgKia3sVSM9sJfEgvJn1YG9CbELwi6k4xqVr1JAy0Hb83o6elas0
         hqHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787294924; x=1787899724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZV2eo8l44i659VRpU6Jc0rPYdN+/WIVgMkUx/EFXO4=;
        b=OYNGvz8ZdDrp6EoYQxeYuuoK38DenM8HFORbEVYM2zwqi8P60M0fGssITKHRUwfunD
         AFrLAfCbgGGe4VgOiAaI8Hjuy0Y3AtEEJHXS669B5fVhWrhoiOsxnWeUw6t5zJ9+U9oj
         n9IKodj6hbK4c5rDTb5QJ18rXuvynWU1WFLzIozc+340k6ctDmFu8Lp7wKcFwJVPIKWY
         fm3dcDpYeS3zr5rM6CySOLhBv1dFHs9NNdrtNwsNJ/hGwjmNGs+IwJ0O/O899wHTBu3G
         4Q+KyaBpYg1sqg3v8MRR/mgTnhqapJbs74qkqcl/FMxnvEcjkb6SVgdycKUXuqIhx7Qh
         0W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294924; x=1787899724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZV2eo8l44i659VRpU6Jc0rPYdN+/WIVgMkUx/EFXO4=;
        b=jC1vL0qYjU3sde12v5Ev0LnlowU1bSfi81GNYMZSN6WEkJc/My598liVP02Cab63DW
         zl8dlrcofmNd8mDxog6A+e/s9nHtRjze5WzIH8jK2Ci/n9U/+xIF2CO6syknhbGX/CTZ
         XRADPHV5oicNmFmOKAUB1WuVPf6hRBl95YcodecIsFfhK1hUYGMHgB1rlWLix3QcOigN
         UA7T1LOKGBF+zDyEOYHq3wZMpH9xAp7OiifqDXHGLP1O7YxSsHmq1+qNtRNF9sjzi59c
         FmZ66WkVm37JhwjlJ4YwqEU7q8SLW/HscUTIoZPhVWkMDShbiNc5On0qQ7Rb3wiXESg5
         QZvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpkDX5sYrDxqjyGZdI7lb4cfGxsueiS+QaEi9hHh5B+RjZs5u0qLh+SYSbo+Jfm7c+JGI/nrbs3vf5@vger.kernel.org
X-Gm-Message-State: AFuF++nXwuapJFK8JHn0xLbsMnat/Ok2/GDex3BBpev0zvT4pMHf0Mid
	98v0nydxcr1o71JEMQaSkNkHv5THOupQ+YLoyi5fwtcPWGh6frIjmdrD7R+NIFZmGbybl6Rsabc
	xpaO8B7wSNaA4Ig/x28xtM4KZosefdas=
X-Gm-Gg: AR+sD12GsY9ba4Plyfg0W82INO3sxd0VXdQQJGaoS88+9wBkMQ7P1w3a3Q0/EJm1ZRk
	gljKhlVrnOFgli2aEUwhcgZBj9g1KSgHcgKQg3tXW40F94zOsYszQ18w0Asm+amy3MnHwbobxxW
	YmIjmjJt0Jg+Zj43whJFiF9/IuAbBXDaxMqdkAF6Swziz/xXZJ+Y6FOgVIbWTRY6plKm1X0uIBi
	zDieLS742n/TCmcmOdOt1kgbK7wfU/5/oKLBrCQtBZf3otb5vLVukHYspM5qltmvmPcUiurvBQF
	vRPYkxVZukfDcsr5wxbu7cFOwtMFS3UhcDqwHyZmz7mjOA==
X-Received: by 2002:a05:651c:222b:b0:3a1:8dd6:aada with SMTP id
 38308e7fff4ca-3a1b0e134edmr3994451fa.4.1787294924052; Thu, 20 Aug 2026
 23:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
 <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com>
 <178724902712.20555.7009712214570349708.b4-review@b4> <CAF7HswN1ZzwjfXjG2hV5tEkVZkZYp0CiVNSo_9A4m3tsqQp_Bg@mail.gmail.com>
In-Reply-To: <CAF7HswN1ZzwjfXjG2hV5tEkVZkZYp0CiVNSo_9A4m3tsqQp_Bg@mail.gmail.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 21 Aug 2026 14:51:47 +0800
X-Gm-Features: AcwNN1U6V2Do82rvIt74ZZ-aX7aerlDnXhaA1qYUWN10XHuS2TwjSTUhQfWOomU
Message-ID: <CAF7HswMpfibMRysJQYrkA4EC2Ks3C_20nZkhpVPP3w-J4BoxQA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Tan Siewert <tan.siewert@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Aug 21, 2026 at 2:31=E2=80=AFPM Kyle Hsieh <kylehsieh1995@gmail.com=
> wrote:
>
> Hi Tan,
>
> Thanks for the review.
>
> On Fri, Aug 21, 2026 at 2:04=E2=80=AFAM Tan Siewert <tan.siewert@9element=
s.com> wrote:
> >
> > Hi Kyle,
> >
> > > Ventura2 is a Rack Management Controller. It is a modular
> > > device designed to manage liquid cooling systems and monitor hardware
> > > states within an IT rack. The system uses an AST2600 BMC for manageme=
nt.
> > >
> > > RMCv2 serves several critical roles:
> > > - Detects liquid leakage at both tray and rack levels.
> > > - Communicates with and controls liquid cooling equipment.
> > > - Manages leakage events and executes system recovery protocols.
> > >
> > > Key hardware features include:
> > > - An extensive I2C and IO expander topology to support comprehensive
> > >   sensor monitoring and backward compatibility with legacy trays.
> > > - MCTP over I2C support for asynchronous device communications.
> > > - A dual-flash design for BMC firmware redundancy.
> > >
> > > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> >
> > *snip*
> >
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > > new file mode 100644
> > > index 000000000000..f1273ca31bf8
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > > @@ -0,0 +1,3005 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2023 Facebook Inc.
> > > +/dts-v1/;
> > > +
> > > +#include "aspeed-g6.dtsi"
> > > +#include <dt-bindings/i2c/i2c.h>
> > > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > > +
> > > +/ {
> > > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> > > +     model =3D "Facebook Ventura2 RMC";
> > > +
> > > +     aliases {
> > > +             /*
> > > +             * Pre-allocate I2C bus aliases for userspace predictabi=
lity.
> > > +             * Several I2C channels are intentionally left empty in =
this
> > > +             * DTS as they are strictly reserved for future hardware
> > > +             * feature expansions and add-on boards that will interf=
ace
> > > +             * with these busses.
> > > +             */
> > > +             /*
> > > +             * i2c switch 0-0077, pca9548, 8 child channels assigned
> > > +             * with bus number 16-23.
> > > +             */
> >
> > This alignment is one of the things that seem to be a false-positive fo=
r
> > dt-check-style in strict mode (value-whitespace). See [0] where Krzyszt=
of said
> > that it may report false-positives, and "Review and investigate warning=
s from
> > 'strict' mode, but do not fix them automatically without thinking".
> >
> > @Krzysztof wdyt about this one?
>
> You're right, and this is a regression I introduced in v9. In v8 these co=
mment
> blocks used the standard kernel style. While running dt-check-style, I ap=
plied
> the strict-mode output too mechanically and dropped the space before '*' =
in all
> 38 comment blocks in the file. I will restore to the standard style in v1=
0.

This is the part I'd like your input on, since it goes against your v8
review where you asked me to fix the 49 mixed-indent-chars reported in
relaxed mode.

Looking at the output again, all 52 hits on the current file are on comment
lines. The standard kernel comment style '\t * ' is a tab followed by a
space, so the tool flags every correctly formatted multi-line comment. The
49 you saw in v8 were the same thing. [property-order] on the spi node
behaves the same way - it wants #address-cells and #size-cells split apart,
which is what Tan asked me to change back.

So I can either restore the kernel comment style and note these as false
positives in the cover letter, or keep the v9 form that satisfies the tool.
Which would you prefer for v10?

Thanks,
Kyle Hsieh
