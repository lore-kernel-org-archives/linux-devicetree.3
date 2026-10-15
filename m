Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF13FFAD7
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 17:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084048; cv=pass; b=txw2bbOp5ZhgsEuYHMAzaW4ZbZSbkoXGjp8IZmuSUEsAFmNwhw6xW0Mo4LPtE62d6zQOENMQcka4Wjv30f/hoCg+HV+IpRTjAKywtwz5wyZ2SKM568X3WzaRcMYBHYEBJMVYHJXi4NdEw5zP0+Oo5mfM97NPUYq+t+hPZh8DRZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084048; c=relaxed/simple;
	bh=TQWSF+hQXVkwcjIKu5CbKZ1m9kqfy6YQdFbRnYAAUMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljY3ID3/Dwr13SFE/8/ktMWyOrvancZYumQcIaf5VrYvplh/q12WETOI47iXiWhlpz/EbItKb5WxKsGvRtq48n86DBzRIfAy3e1LAP7qtr4efN1AAbWpBqnEfMMJH5v6sVq9rjWLNrxXo+Fi854zLGbnJRq7OYBdLTO/lAQftzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6kD8zXW; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6kD8zXW"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67921b515a7so5627062d50.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084034; cv=none;
        d=google.com; s=arc-20260327;
        b=gUuEUgEqi7twER3vQk5BG2ryVTdKC0CAr+lWCvfqUL/e/52ku7EltQRt2KCxq0BCzk
         a1tgH68DjjSqagddXv8eqxVcIovkw0HQETc78YNSKnzPETCRE4q3O0TsqAdDZzQDia1h
         d0Qku+t9VJMRmy01EaNGBAxNXimtzlTNqsBcoDe9BsemaFOsFJlnrGX3nOBrNl/mf+R8
         dpN2l1BdnsFmZYmNRbENNu4puOpub0pMQo6vv3vRJF5bUsJywNdSRpTgMG2D32rzJJrL
         b/tiRfc/8eeEkyhoTvqy6bHHefTuhsEWyai7pxpR7r0eBKFbXyd+pB77Yy+zOlscWvJ9
         WzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        fh=n3H2DMxokrZ7rTxVe4BPU8YlRzM4FzP26pDQ+sNt1ws=;
        b=Sw6wbtHpO+0OnhqGeoSRW6SCRSSRqatNJdwsX7nc+c9Y4aYN7U4CjlABh+h6ZnoKto
         a3smbuuvseXmoOJjUZq+nByGKfn0sEINQ/+zvEZC/Z6T0S70hR5bCjzM0Cdfby3N02vJ
         eXn54t2/tBZT6p22WBJwzO1xNrBiT9wxDQEBWhUVH0HijjCexKDOHp10sL1T195hIdHA
         DFvA4gG8DdybJZpTRNYZktNU0TdHuLXn/fsgozcSu2e+plgtjvSvxxhMQh88oyVZie6S
         EQJQW/DG6Lv9rTKnVxP/5EqCZ1g1Yur6gxCiRwN9zwSrZejUaM1c3JMQMMthgvCl2s+D
         V5Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084034; x=1792688834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=m6kD8zXWcnmAiMQzVyuLdidYavXtf+nQ7ABr3woBFglpqfezYAe8wvEANjiTg5RvWv
         ou5XcH4D+9KegDL6JVchuviQsJjDVplt1gMuB2Jo5ABdm57SXXfwq7IEx4dySTyuvTrp
         Kcuf0Rn0dbOzVLf9byOY0ksZjidHLtNZKtVqnn9kHHZtYgzJJZDMz8B6OumJYNWngfr/
         1L1tNCawWilOWbVq1B8cOqWtBNdG/yRYT/Jav85vZAySj9zP3D7TxP7sX8fjeKW/SA2m
         /BojeSywaiHwEJEmP+lx4E52BeSt+DqmZ4yblcJYt4f28++i8Cfx2t/RRDxzJp439Hpx
         y6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084034; x=1792688834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=WyxzMjbiHVU4Llb57ilEj/obH0gcScVU6ka+ZQBvHZYrn0x2aoDxJnKAz7yo6i0Zu3
         iRXFyitoWqRgg23kEKsUomVI9It74kUY96hl5vTAAOBYqPuoY2XpCsJDctUS23cjsnqx
         pQCxpMHdplIgn0dsCLg1br6MCFN1ZRTRBX/xnH44kI55sQvov4ckbu51jlukXpBMcbe8
         m8NYTWhncfFGIyksWnTea1G0GE2zZq+CTPZgnN5N7he96ARNUHy6eSHiPolLqr5Fa307
         nu+PAkPy72A0DbRkGMme7mEbhkKvh/CmuFWYr3bKjj6ek4ocuRbRZNIZgvSmCQJEjspD
         YjUA==
X-Forwarded-Encrypted: i=1; AKwUvBz4IX0b27ZePFd1ZxE+2LoIOpPsKgpWsOYZvbJuEQbkkZCLduMAezFPCCKhfJCQsaGyg3irfxHrVR+d@vger.kernel.org
X-Gm-Message-State: AFq9FYLaDTfSVHJKFEGlJy6cafKycPRIlrXutxLboW7jnFV0V9xEczwW
	oUU/w5RKxC8xe28/BTelST7xNRv3je84OGOC8r+Qw5xHRxVFw6AxN+WCWy6H70xNis6Y38Ou1NC
	qal+eob1bIu3mOSTgkOgYEB7vjSzVCKg=
X-Gm-Gg: AYBFou0q3bVX0OtX31kleEoldBSRkKHLift8Fpn5FqY8pYcj8VOt+5YK9z0yBksF0B8
	SXgWE+iZc6QRiTws45/m2YD8FDng/NGbjcQmn2JDn2xUZfQGvgdlNI0FhiLR8b+alKx7LU7jDQ+
	uEWmo8WKZtDQajJKVwkDC7BE7HtObk9ukm1zXrJYLdyOJXEwMeGnspRAdndYgzLaq6LRPfGWuqz
	+Pa0G7eL0cPk8BI5bCbeclSRiMlJpID2TYnJiaGLVMmQTPhiwxUxzQkg97PxGNUoRuoop7ggKs5
	EZLButa5Iyv7SC9hbEeCtsj4ACUjwEMa/nzNQyJ5iGVfVZ1a2awTg5qE
X-Received: by 2002:a05:690e:bc5:b0:679:8da6:28cf with SMTP id
 956f58d0204a3-6798da62973mr1956198d50.98.1792084033716; Thu, 15 Oct 2026
 10:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org> <20261008-df80c21d73b287d09b6baa78@squawk>
 <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
In-Reply-To: <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:06:00 +0200
X-Gm-Features: AclHuK8t02_cYn6UunMFOXXUfkheTlCkH2rjdH9KDS5vlihve2Jh2xK0A1qMWCU
Message-ID: <CABdCQ=MQ5soNSRQ97aOytYCjtKpqZJ0frP3mqh+mL2Dsw+A7Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
> Domain Controller is SoC internal module which is part of APMU (Advanced
> Power Management Unit), it is responsible for managing power across multi
> power domains, which includes power on/off, isolation, power-on sequence.

Tested on an OrangePi RV2 as part of basic enablement for the PowerVR
GPU. An RFC series for basic GPU support will build on this.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El jue, 8 oct 2026 a las 12:31, Icenowy Zheng (<uwu@icenowy.me>) escribi=C3=
=B3:
>
> =E5=9C=A8 2026-10-08=E5=9B=9B=E7=9A=84 08:27 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> > > Add initial power domain driver support for SpacemiT K1/K3 SoC, The
> > > Power
> > > Domain Controller is SoC internal module which is part of APMU
> > > (Advanced
> > > Power Management Unit), it is responsible for managing power across
> > > multi
> > > power domains, which includes power on/off, isolation, power-on
> > > sequence.
> >
> > You should prob mention that this APMU is already documented
> > elsewhere.
>
> Maybe it's also meaningful to mention that APMU already has #power-
> domain-cells property, because the first reaction of me is to add such
> a property (and then found it already there).
>
> Thanks,
> Icenowy
>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  include/dt-bindings/power/spacemit,k1-power.h | 14 ++++++++++++++
> > >  include/dt-bindings/power/spacemit,k3-power.h | 12 ++++++++++++
> > >  2 files changed, 26 insertions(+)
> > >
> > > diff --git a/include/dt-bindings/power/spacemit,k1-power.h
> > > b/include/dt-bindings/power/spacemit,k1-power.h
> > > new file mode 100644
> > > index 000000000000..41ef540b5c44
> > > --- /dev/null
> > > +++ b/include/dt-bindings/power/spacemit,k1-power.h
> > > @@ -0,0 +1,14 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +
> > > +#ifndef _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> > > +#define _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> > > +
> > > +#define K1_PMDOMAIN_VPU            0
> > > +#define K1_PMDOMAIN_GPU            1
> > > +#define K1_PMDOMAIN_LCD            2
> > > +#define K1_PMDOMAIN_ISP            3
> > > +#define K1_PMDOMAIN_AUDIO  4
> > > +#define K1_PMDOMAIN_GNSS   5
> > > +#define K1_PMDOMAIN_HDMI   6
> > > +
> > > +#endif
> > > diff --git a/include/dt-bindings/power/spacemit,k3-power.h
> > > b/include/dt-bindings/power/spacemit,k3-power.h
> > > new file mode 100644
> > > index 000000000000..519fbf946312
> > > --- /dev/null
> > > +++ b/include/dt-bindings/power/spacemit,k3-power.h
> > > @@ -0,0 +1,12 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +
> > > +#ifndef _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> > > +#define _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> > > +
> > > +#define K3_PMDOMAIN_VPU            0
> > > +#define K3_PMDOMAIN_GPU            1
> > > +#define K3_PMDOMAIN_AUDIO  2
> > > +#define K3_PMDOMAIN_LCD0   3
> > > +#define K3_PMDOMAIN_LCD1   4
> > > +
> > > +#endif
> > >
> > > --
> > > 2.56.0
> > >
