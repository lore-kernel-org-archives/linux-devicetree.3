Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EBE35F5EF
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628935; cv=pass; b=WjXoR+rV4876tGy9wvjPv3zmvAkdffkS3aDILOLC/S7blP/jj+6MBMIMgbowjAkZiErFdzIPmjKdhCqklZx5KChlE+xyeNPAsQ2yeb41Gzg/weN7plzb2JCSJh9YpRCl6fU40LuM0EV8J3N1ne0zO5nhDO83S2ohMnRIk7/zm1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628935; c=relaxed/simple;
	bh=WbbLhkVNtqLBCeaIQPA5z7yBHDUV8kDXRQ/fRnuO5Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWFVyjYhYtVAXBwowKg8VjC/tbYhWerlgTbOHGgFdmJ0r7iaWJ9t+CbmB+BFMkF7KN8phWECsMIawdfVlpVYDXnNUmz24N8MXBjGp8k2AORPA4ag3OrhoFErlM8Q5ddLUnDltpDWUQIBg9xr1KLE00u/u7Fb4S5b+Z0ouvm64H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=hRhGpswx; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hRhGpswx"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-797ab169454so94309707b3.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 23:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775628933; cv=none;
        d=google.com; s=arc-20240605;
        b=DkWh1EI+Z8Pn8xoWXCwbCjgazWQ8A1gwTOwensfbsbFrfQif6cRBsBdfPhTFS5QV6n
         WJta+krUu4h0QjrNZHoDnPTJT+6MuPSiH13CcPwZRPsg8WNO5bFmKXcjdkwjBZ0z422k
         RDcs/L7o16IzuRPq8BDlZ68AnYM9E7ruITq/ay4VBLCVczIlabf0OGi4cVReXRzngKbk
         2KfRbJ9Sa8ja0BozLWX3ivynni05R3BvIaO1GYTpqgGZVSfs1BUu4q1NECNwtqEhJ1w7
         WfVQ9GVkXYg09cV6PoRZ/IUwPjycxS5nWlZdK3ALq79/5hSBZFnI6WXpueoAUcajUsLG
         pCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qBbsUuQfJADTXtwaYtDrI/eiB3XSYduasp97QwWvDxk=;
        fh=dXAPhdQTjMZUvyjruNJko82Irmr8viMoyxGtK3y3OpA=;
        b=cGr/LFW3JOpeKwuHi/1ZQabyHS9CXB7dADfalr3qywfmx+YUAQBa35VA4Ty3FysmwZ
         kRlZ/tqa96NWujkDCd0L4sCEyLHnBfI2efHUw7/rPVUYImF5514sk8z59BYFuQNZDi3H
         sJ5Tuv7KnCHyxGCzLNQYItjBPvuBjYqJT2VvEX5OM8ueruYRBmQLwnhpk6i7g3foZKLT
         LEDTmM8KJnlvhw3X1o3rgJoevPqaIZ7eFktgMughvR3xQZJviNve1+dYKNM++G7QLzas
         /OgHynp9M6bI2D3k0uflrDRokAznwk/cSc1PQHKeO06a8vYZvSlLB4j89BVuSYE/xSR4
         00cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775628933; x=1776233733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBbsUuQfJADTXtwaYtDrI/eiB3XSYduasp97QwWvDxk=;
        b=hRhGpswxWtfACVNerH7kJT0+QG+BVM2+RjanV8YhFMsfjYQkq3yDYKWpZNnmsqxiBy
         r8jPCCTtCziXf0WjuXpmMF+gvvPnmeTYi1hG53fDVAAC2kpmA8FZRkUaj9RP9RF4LeHc
         kTOj6rzMH6rpj6ntTEPrqHAWLOZhVT7vwK19GUYbw948D0SwRvVC9wM0a6gu94rNOvi3
         ERq3e/9zK+MFPFfQcOJzypptQtK5ai6KAoQmpvUnsSdlTMBEYp0Q50U1IiAkjPZ4NKts
         zbDA0uGwGwfPltkH/oU78TtbPYE5/CN7EXcdiAB64W3X6j1VRZ0MmUD5WPpehA8INWol
         pgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628933; x=1776233733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qBbsUuQfJADTXtwaYtDrI/eiB3XSYduasp97QwWvDxk=;
        b=rrg7kqSu+b+tGS+HW/A/b0/L+V87Dp1KQej2igWBo3/VraV35D2H82P+A/5ZcUC6vg
         mq/lQCLzNoGXU8CW+iTy/FWBuccyAnmTVY04fUR6FJg+h/b1BCv0lNTz1YpknsvctVzk
         1Uy1p7T9PHqhsu+rdE4wR6Bo9pU8elaejt+DPpyE1sWAtqak+GnTyhix2Sy6bvfvL/l7
         iDfDIKHI1G5Ecsq/VeXl0Lz2AbjvfBWL8w1pUovMVEmgAT/nzoi94c2Om89xmCrOycId
         yDHYvpLxcntlo8VuPyfEk/Yh5Ydv6kukLfdVDGMLp2Vd9urMFRjABge+eJquj7LEPc02
         M0rg==
X-Forwarded-Encrypted: i=1; AJvYcCXKJMF0wTg8xOeLpQD5n8rnJ2T4Uwg5p+1Atgk717aW5npgQ7YfBUCAMYwZXjRsCc4JmW1EQvlpcYJw@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSqi/OSXp9Ashrrc8GVYUnTaJZdTHaRPG3CO7oO3UVufblBPy
	f9jCde7qxtI91ADPShgcDbRiKm69kRtbJY4sII/zgFzTgsDSeG6TdNYVLVqZsrwf+U5quFO4Xah
	QWUEakci6ceudXCXABSIiQSYAaq514XuTOa7DVZI19g==
X-Gm-Gg: AeBDiesc9i94k6UAgS5wj51s63QANMmT60ZxXGaM8BTun780qsFb9ojpjFnX5u93T+9
	IA5Vk0ITBemQgEIQ0V362VFaJaC4q6DqlsmBFfL+5p2TvRIme3SxeIjUObsCMTT2+Raee/iy9gq
	N2J85mB9HQRLwvpOhZO4UvzrgmVOTOwmaqE8anBcmQKwb2Zx6FGjmhBOjlfuA36bHExSGxdCnWz
	Le7u8ADFhasM8IVCTtWiUAPK1KevTatnTerHWVxcVExThbAP2nSCV43tEeUL+GG1vkcFhMCmPBb
	d+VYn+HUPw==
X-Received: by 2002:a05:690c:101:b0:7a2:1f26:3d6a with SMTP id
 00721157ae682-7a4d5d5458emr204440797b3.45.1775628933009; Tue, 07 Apr 2026
 23:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321083507.25298-1-nick.hu@sifive.com> <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
In-Reply-To: <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 8 Apr 2026 14:15:19 +0800
X-Gm-Features: AQROBzA3BpQWWAwec4LzRXJ-4DjjfOnzhbxgY2fyjfkEITq9O1rAj7G_-h6M_Hw
Message-ID: <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
To: Charles Perry <charles.perry@microchip.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 4:56=E2=80=AFAM Charles Perry
<charles.perry@microchip.com> wrote:
>
> On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> > Add compatible string and property for the SiFive CLINT v2. The SiFive
> > CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> > in their control methods.
>
> Hello Nick,
>
> Can you help me understand what is this different control method? I've
> found that both OpenSBI [1] and U-Boot [2] use the same match data in the=
ir
> clint driver which would indicate that they are compatible.
>
Sorry for the late reply.
Unlike v0, v2 requires a write to the mtime register to kick the timer.

> Also, do you know if there's an easy way to tell if a sifive clint is a v=
0
> or v2?
>
sifive,clint2 introduces additional MMIO registers

> Thanks,
> Charles
>
> [1]: https://elixir.bootlin.com/opensbi/v1.8.1/source/lib/utils/timer/fdt=
_timer_mtimer.c#L163
> [2]: https://elixir.bootlin.com/u-boot/v2026.01/source/drivers/timer/risc=
v_aclint_timer.c#L86
>
> >
> > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> > - v3 changes:
> >   - Add the reason for the incompatibility between sifive,clint2 and
> >     sifive,clint0.
> > - v2 changes:
> >   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
> >   - Mark the sifive,fine-ctr-bits as the required property when
> >     the compatible includes the sifive,clint2
> >
> >  .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml =
b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > index 76d83aea4e2b..34684cda8b15 100644
> > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -36,6 +36,12 @@ properties:
> >                - starfive,jh7110-clint   # StarFive JH7110
> >                - starfive,jh8100-clint   # StarFive JH8100
> >            - const: sifive,clint0        # SiFive CLINT v0 IP block
> > +      - items:
> > +          - {}
> > +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> > +        description:
> > +          SiFive CLINT v2 is the HRT that supports the Zicntr. The con=
trol of sifive,clint2
> > +          differs from that of sifive,clint0, making them incompatible=
.
> >        - items:
> >            - enum:
> >                - allwinner,sun20i-d1-clint
> > @@ -62,6 +68,22 @@ properties:
> >      minItems: 1
> >      maxItems: 4095
> >
> > +  sifive,fine-ctr-bits:
> > +    maximum: 15
> > +    description: The width in bits of the fine counter.
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: sifive,clint2
> > +then:
> > +  required:
> > +    - sifive,fine-ctr-bits
> > +else:
> > +  properties:
> > +    sifive,fine-ctr-bits: false
> > +
> >  additionalProperties: false
> >
> >  required:
> > --
> > 2.17.1
> >
> >
