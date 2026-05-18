Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB43FD97C
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106348; cv=pass; b=TtbfA6IVSbgfK9Hlrusp2ejPnUK2ObspbaD+vlDPaDHpT2q4ux9OdmOuQyNf8KKSPXNRuW9QWi64H9De9XIXERq5n0Nic9Uefw1ktS6pb5/ygn8ToWyybKtG3mbAfHmGzYpxEjfkjI/XaWVZ+uNvHDdhIpaOL/FdDjgKH8Ge03Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106348; c=relaxed/simple;
	bh=+pjglSoNCdgBptdVhyy8LktTr3U1L09HEcs0xxWA71s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUtXm7LNzYLOEpS1q7aRtSf6D//EWdjiAYlp49tyhjLahcciIfu54I/HsB2ReDmaYdz4QipoE7eUaH1z0Cb9CJtotg442D69ezJbgrDqyYzVHuXexPceKbjQW5moU+ZxUeMTeYXBaEvDY07UymJDhKxJvq9nbAb7EdI+xeZJwKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwXs6OQ5; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwXs6OQ5"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-439cc157c21so993266fac.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 05:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106346; cv=none;
        d=google.com; s=arc-20240605;
        b=BiYpqsCAzIlwcOS6JHS1bePFRPk7QNY7Tai3a+Vd+wxvE22ed2wEqu4gc1SBbpxIhM
         ZYrdn81F+HgTbfIuXcAxEkoiLAhHKUDE4ktCosf2QYVethduH+mqhOkcd1bsBJd/RqMt
         vD8DNXNFaORvVoOx5dujq2JSlYJYMCOgD+lrW5kyguo4fRt9p1DoslQMDkBCR+ZYHptr
         YyhnMzq4oG+dZkJ+rNylUI/gfaz/xGx7zzG5CvgZEbZIr4q21LvTFUhZ8G9cNxN9b7vW
         rR81UdJXEOWtLle4efZedWO+qFSjaIgcVcxxve+usKlMdQg9d5g/hfbCRTzeMY6aIc8W
         THWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        fh=1xgawUadd33QZ6jrxgqag+sLZ+LUQH+/drINInBJNWE=;
        b=gdfYeJN9TnXgyOOmvd3qnf+yUdOQyzv/KMW3eOy0hRNA2wwBQfS0L8izx2PeWlKykX
         5y0SfVdnUj2ABWFhijuY/fArrejSvCfRVTYbHx4JRfhnUc3x1O6Y/cCVZTnmPwHFJ0ec
         CTqEOQ2eOcLp60TJR7jyDoJccIhogKNn2WdlWQYbL28kdO6P34befoxmYeEXxNIA6hbU
         dSkMZCEjZ+mWRBaF43MChoOa2HW7j+DCiAxkWNCnliOr3eZm/JTmakIDnc2sVEEa1n4M
         qOWjjAMnisw2NWAfXWCRBBHdbB3SVwT0QE3s/GK40C9P6MAcQrNEDje0cGyPMtOOSyoU
         RkaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106346; x=1779711146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        b=SwXs6OQ5z69J5tgJO1t2U5PncFxTxSL5u0eJE+wURW3jAebIi6YSPXxM4w4ibBxaDo
         Lv/yzPBPwvRZEq8TpuQDIvj4vvSJOXC+foRYmdpTy/I8YIGu4f8PEe3FKwWnGJEa1qVZ
         E47thJNv7LrP5SQagSmPZyLMerksScEN/ILDxpRsYvt3uwwOtwkOQ92HKGI9QQZEUjCF
         I0IRZmR76BndRqcKmoMcEbIT4fxbjXzkiPbtwob3r+BNUPJJmZOvbs/b+Ch196+6fP4K
         XMl1gYP5dQrIpgAlkhraRCTNxg3GHlPuwt8+fbLI2dvI0o9HwcVJFbMx8LTLHQdLZljx
         uoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106346; x=1779711146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        b=VzyQQgDnofRKooCEi5y+XxCHW2Q2GZcP9VEPYFyH22xVg8S/H/vDiwc5dwqiRsCxrA
         u99D8AqBztHwUD7iUArm/Mp9nYssiGOS+Y/e/Q2iuZX4JOmkXP6w6lY0Sk+e0Cf8lXpr
         edR+oCeM9uPEx7bT2gwXGkGJ9+It90k47hXMMrZkjsRHghX/dh0rrx74M+fBNAR9/MZK
         9sBCtnZqzpVbkDnKdz5oPLngHyjaR053LvY8+keUagKSsLbgB4wziZ8nhy8EzwGsUlfI
         2vvexNvRZS9U23zi/4QLTqeL9JVXBTGeKwvAmFaUaobe62gSs6L+DDRl9ogJJiRsj4AO
         jgLg==
X-Forwarded-Encrypted: i=1; AFNElJ9S4jWRiKX4c5y5Y6UQLTtTCRRzCGLYrBki+OLA1eNOy4d5CkumPOYwQvlUPHJThf09cmqkmMMDjGZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YyFeEroxBXRjD2px+JZiC+xEUG3LYdP+MGxBgreU5O2NGbOMgPI
	qpAEWgkQm1pfhMfkPwTIjRMsIypOql98z+R/N8E5QcSXEaoSSdSxFCogXc05QoEE5RPxr+hLr2H
	NJX6dsthy38tbAdm6H6cPHmMymcbkmZo=
X-Gm-Gg: Acq92OE3zlPM73O6KTrXwv7s0+UCifPCO9CCp8JUrgJeNZ5kpIMKbqjEYTQvFUEao97
	CJmGtn1mlyRJ5Iy1DafeRavdxcjAwJu6MpjC/Xd3S9+geazfexFJOpdgu4Y/QXyb5mELoFwoehm
	lI20+FmUDXaF++3diT7jOQc9wjXVTb+HHtjKlO4UExPPOdn+ZV/W7yM2Lmx/+v0+I55HBkI3ZtT
	y4IW97Wt0otDlH5LQSxw9IJSoRUqCUQKXuP7jfvObfnl/6mHGmIEF1YO1SH3DMt71uAI1DPhQLE
	WVWjh4u5TDt2ivj5wLQ=
X-Received: by 2002:a05:6870:f614:b0:435:25e8:35c6 with SMTP id
 586e51a60fabf-43a2dd80027mr9688351fac.23.1779106346181; Mon, 18 May 2026
 05:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com> <20260517-popper-rage-b675785e4d28@spud>
In-Reply-To: <20260517-popper-rage-b675785e4d28@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 20:12:14 +0800
X-Gm-Features: AVHnY4LDWingZwX-Nz3-YuHewnevoFTSPFgHGYd3CYxO_sW22m2PP6ryO25_4Js
Message-ID: <CAJsYDVK+tOUZcF7rzP+og5JV2gkNS4WfGhq_hJVNvfUvQLZZrg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, May 18, 2026 at 4:50=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> [...]
> > +
> > +  clock-names:
> > +    const: xin25m
>
> Is a 25 MHz reference required on this SoC? If not, name here is
> obviously problematic if it can be something else.
> Not much value in clock-names anyway when you only have 1.

You are right. I'll drop clock-names and use index to grab the
parent I needed in the driver in v2.

>
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - "#clock-cells"
> > +  - "#reset-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
> > +    / {
>
> Replace this / with "soc".

Will do so in v2.

>
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        xin25m: clock-25000000 {
> > +            compatible =3D "fixed-clock";
> > +            #clock-cells =3D <0>;
> > +            clock-frequency =3D <25000000>;
> > +        };
>
> Delete this node, it's not needed in the example. The tooling will fill
> it in.

Oh, I didn't know that. I'll drop it in v2.

>
> Also, please test your bindings since this doesn't pass.
>
> pw-bot: changes-requested

It's failing on the example as root node missing "model" and "compatible".
and it will be fixed after changing "/" to "soc".
I'll remember to run the full dt check instead of using DT_SCHEMA_FILES
for my single file next time.

--=20
Regards,
Chuanhong Guo
