Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F84315A
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 03:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775187313; cv=pass; b=lW+eBA8kB7/7UN3vH+a7vEpURUGbQ7r8q+1Swqv8YOc1tcjG6GASSfXC4Cjgl3fxjsGcp2hG72PgwvdgPubbEMKBbAnaGgk3CxrpXysz+310jAKeS1nFFokzm9YmIQhz/YqWspAPhTKw0nnrUzjUHT00L9n/LhyF2pQb1Qdsf4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775187313; c=relaxed/simple;
	bh=+0MwXn0LJEuitKVf35y/AcyJhu9pLZu7swqJVU6DXVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXzBNRgLTYum8H+T/nm7Zsbo78q96nyqBi7DIRBTVY37cg4UCk8xI/cbtSou1ZvnP9HDKBSMsnhna729MPC58ARrDlVgbx48ViDW2TRb9AJiu1mu2XMUOBZPP6Fes0tNuZ7YLDdC+Bua/WPHKeU26t0udbqFznTpPN0eFirulTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icYl7E5D; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icYl7E5D"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so952138a91.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 20:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775187312; cv=none;
        d=google.com; s=arc-20240605;
        b=Ivv+YCdajcth/D7Mg246GaaccRrfSvjWvmt1ttaLqM5neTBvLv6ZILRZO3Rs7XaOHF
         04fQZlkls1a6tfUG731RAOI/iuW3SXWy73jJQLlxCgBxjW48gRMZa4sN2jOxk/GWyHQc
         Ieu6JvEl5OOT/HVOL+hl4StRiS3Z1Yk9qz0DhxGK6RhWcywhbcgptzD8phXotBMFRGYN
         59vb184f7JgvEIO+aQ0rJoEzGhjKoAhcMbu5O7Trx69nBoIgVyH49vBvYPYXtWe0wstE
         F9uGFrQ7rqzH8yQkZ+yyVQYCgweIE9Z0looxL+TFgyyARQYwjBtsaR1ztR+l1oz1c4eG
         Bndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahAWEcg4rYVlFXBXuYLShZwIh35ovqR23fOGx9fT9qw=;
        fh=/zDveny2pJ3yYjOGBMrkaZUH0kSVdLPPzgWE05BGk2I=;
        b=kRj/z3RHrGiE6hvtkqpm9M0VuWHb0FHz4RoqD12sfjkrCNPaY/sRLkXyq/rj7J+4lq
         3Oip4Yxj/vqjsKWBcajgLlEN6iHXUDF5d1ayUCTtIiSPOjjBbx1dHHR7dtRgFaOqrsRt
         5fPv0DAWfd4lPdtltyUVunfLCqRQm1uKLgYh1k1MFLJy/VhT5Lqy2q48WxKHr2YUf8Fu
         WxVPNufbY+E4e4Mj+XfRSBD4HLn7au5jplfTnFoOILLT9TphrZiq5iyn7l/sXZvnjaim
         9213fyX0mMOl2x6HHlDVf7fNbJU4jljjQUi/4gMDfOXpqwnGk8h4tdZGdkQJFDN3E2eP
         3jRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775187312; x=1775792112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahAWEcg4rYVlFXBXuYLShZwIh35ovqR23fOGx9fT9qw=;
        b=icYl7E5DKorRnLxtiToowarc4hXGctXcoq3zaQpMdWidKaFZwNtXR4HmrLSlItWxr0
         lGr6RcjrtB2MHUB70KjrmkysQJbskdkxny2VWzx+Yzn/5W+KGfIZOTpgpa4Vgt8l+RW4
         O81aT+5TAkukTif5Bk5yoUXPIDtkJJtJ1VlrAtu41W34+a4LeUhCRumjXQaqJITYx8mB
         RJ8LpcRTIo/PhW4pwpkCVrlbjaa66bnwhyD3wVncQQefp9M3SzPbyj6ZoQWO85cc14IO
         Mq+3Oa3DaQWJxpLHrsHaF9QkQ6lsE+cjsYE5uzKxLx5qYIvPeb7NFfHeGgDP5YaCzmmt
         u2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775187312; x=1775792112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahAWEcg4rYVlFXBXuYLShZwIh35ovqR23fOGx9fT9qw=;
        b=mSXJRHPMaTABXnXGVGlzJ73RyL5wnd2haB0y5s5b1YXDq1El06SNdqsDrrTSYGEZPY
         iDyOEFl7kDduzFxBK0OCZ3SJk45xfLXv45xnI7u25xdaj1pSiYskg5e37wzH9FfYEmTe
         +MOA3qStxeUYr3v8e0fRTwWp0pdbj+zEAtYjfgKJz9EYAk/Jw9R6AHY7Gc2Hx4XfRnFf
         dVTOzCYfXXFzyRTIjMRPfCjgGTKUjbFnX9+g+6vw2LtsU4/lVFl8Xj6odr3d0FQi/lbM
         V8BZqwyFoh/NVXVTMAiDVQ8bHpbIrbuASYpqwZpwBs0MLyeQMUh82K2m2cGUlR0KoAys
         3dHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz4mwPjRsiBrF+vn7jm/xXTJkRMARws3UlMcQibDa0ySbp+8MBoEmj/+JZ4ofS6+IBkhNsGryJDDPH@vger.kernel.org
X-Gm-Message-State: AOJu0YzXI5UwRvnjdvq6wfhSkrhu0COy7o5aYJmY68WpY1dRJzfjppmd
	tINL8WzF1D0pyFs5DC6Cw8/rvIeHNByK1/C6bbnOOemA5D/j3ReifmaPNLywYx8I7gnL4fx6kGK
	Udoe5Fk9EptghHY/+RVHs+HqlxpdE1JE=
X-Gm-Gg: AeBDieu1McNf48bka+0R0yGx1xMCXrFGER9o17WEvFyarzjzzk7F5wnb0mir1OYIXvi
	d2dcmNecNKwkJcsKKWQ7Rld/veQAEjFXxdLoluG6NA7q+7MoNeovOhsvr565Qkp98zM02iTAnSC
	2BDe0F8aC0D29pwxhSUDpiu4Z6SOqToQKwOtLVOzjAVxfvQnooWjQ3iCvXbsyjHVNR8727v2qvy
	T1UYCtohjBh9am/IDrR4KI4vlAYk6ubzZSjUyrhLwBfO7ggbgQD19kte+gWjgVDIpWzW4og0+bK
	PrpWx3GrPBrIO+yudIvWuJZ1otPjkVnJo26YfA==
X-Received: by 2002:a17:902:e751:b0:2ae:b807:da61 with SMTP id
 d9443c01a7336-2b2817b422fmr17307015ad.35.1775187311715; Thu, 02 Apr 2026
 20:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318083124.21793-1-phucduc.bui@gmail.com> <20260326141551.GA2304345-robh@kernel.org>
In-Reply-To: <20260326141551.GA2304345-robh@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 3 Apr 2026 10:35:00 +0700
X-Gm-Features: AQROBzBK98OPGZHdV69IVsBAyLP_4-EkBm5a428QbKTLn_9UWmvRwVCS8EXNElE
Message-ID: <CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAuz9=w@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: input: touchscreen: ti,tsc2005: Add wakeup-source
To: Rob Herring <robh@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, conor@kernel.org, 
	devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, krzk@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, marex@denx.de, 
	mingo@kernel.org, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob, Krzysztof, Conor,

Thanks for the discussion.

The core schema already defines "wakeup-source" as a common property
(using oneOf for boolean or phandle-array), so defining the type here is
redundant.

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/wake=
up-source.yaml

I'll update it to "wakeup-source: true" in v4.

Best regards,
Phuc

On Thu, Mar 26, 2026 at 9:15=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Mar 18, 2026 at 03:31:24PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Document the "wakeup-source" property for the ti,tsc2005 touchscreen
> > controllers to allow the device to wake the system from suspend.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >
> > changes:
> > v3: Remove blank lines
> > v2: Revise the commit content and remove patch1 related to I2C and SPI
> > wakeup handling
> >
> >  .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml    | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc=
2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.=
yaml
> > index 7187c390b2f5..a9842509c1fe 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.ya=
ml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.ya=
ml
> > @@ -55,6 +55,9 @@ properties:
> >    touchscreen-size-x: true
> >    touchscreen-size-y: true
> >
> > +  wakeup-source:
> > +    type: boolean
>
> wakeup-source already has a defined type.
>
> wakeup-source: true
>
> > +
> >  allOf:
> >    - $ref: touchscreen.yaml#
> >    - if:
> > @@ -97,6 +100,7 @@ examples:
> >
> >              ti,x-plate-ohms =3D <280>;
> >              ti,esd-recovery-timeout-ms =3D <8000>;
> > +            wakeup-source;
> >          };
> >      };
> >    - |
> > @@ -124,5 +128,6 @@ examples:
> >
> >              ti,x-plate-ohms =3D <280>;
> >              ti,esd-recovery-timeout-ms =3D <8000>;
> > +            wakeup-source;
> >          };
> >      };
> > --
> > 2.43.0
> >
