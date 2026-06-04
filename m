Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC522374739
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583960; cv=pass; b=kmsPHbwyCmz9N78TajOpeqSNyO89lCL6ixC2Oto/xrKO6387Irtg4AixPfifS3Y16O+wbMk2uvVOzzMQShekgE7eq2LdEKGlxE/oFxSg7whXk6UQlMxqhKmZrCHpy+xrysNrzc8NCxa7aIVHMPm12+x2ykkS60jAOnl0+be0Dqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583960; c=relaxed/simple;
	bh=0MSVNyCuBqvCYf5n2NZNVK8vSeLxbRbm7dWsfVvvAhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZ5ULH60bIaOWLssmGmTCufLwQ5hk+7Wx7W0KenuAV0I3M6yp+oPU1/yHSl6Vf3vnQwLBudYoEZK2+EXdnNlWvSTijfJtiGP4dThk1NKBLRGV8rc60zXU1sKoww4NpvctbQxMAvwV1cGjDeGNKbptzMab/is8ZHnujR3Ccla5RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=iwMuui7t; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="iwMuui7t"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7e87602f26aso8643657b3.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780583958; cv=none;
        d=google.com; s=arc-20240605;
        b=jIGbN1+EpP3EidwnMlV3tfowOUWScPPfdM+3lmK9lcmicbu003pPI89aY4qh5HW4eh
         IEyKQ7huEjKqzU+4l663kgO35Qjycvxf641PvZsgxFucsvDrRoNkBnovZCeUQgTHK/Gl
         WhpoUGpwwi7MPzvnjMxTa5RMa+RE0kE7glltz3EoltMIDYDGV9r4/sl/RZl6EVYQtxUp
         isqwE8gADTGrE/ULdmDSZbRcF6NcewjE9XKvAnN5Zei+FiMiHlEbPPrjlSXFWgwhFzC3
         DP3+b+4wHgG+Bk3UbzBIoKh3A0/Oqc88q8cM0+s9Tpbr9SddjeKiEwSSrs4a6Gub+yrs
         hpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KyQNq22zTHoCpyrA6QRDxZ9CuxarMcDHHStBIe3Zk+8=;
        fh=ZN9oOUsyyeM4zGf3M4cHucpr6xK2Hc/vNj5B0dK5Is4=;
        b=aOzDMrzNX4ahrnBS40ZbtXZo5iITxiYLnRF4DW8GjlQEGiedn5RbUuv+t5NmxeeBtG
         DHEADiDDWMVNUNlIo2yJkAOA7G4DSjtoZ6Lfz43oZ1bQxBRV1iIn7kva8ElcTA2qRQWC
         K50cw52GN13Fagul/+NYv2bIes2a2R83kIUXvLDDWOCdqShU8a+0AkzCHYbGD464obhQ
         Q5fjwKblf8BRLJfHn8vbaXzNCyNFXRqEo7GjHXRDnYvqHKgb+a+sAgFm5EvRePWUnweW
         u4gnMmr0yrgbWT/CNxltQG882wIVUvUxsjP0dfNQSgAfiutxjKzf0SatsThyV+MvcR2i
         I0EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1780583958; x=1781188758; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KyQNq22zTHoCpyrA6QRDxZ9CuxarMcDHHStBIe3Zk+8=;
        b=iwMuui7tsRLocypv2j7If43w5h16Mt6jLpv2eOB5nn5AJ8cqpKHvmfPnLc5XWsrD0P
         zvAiELBjHzKcO1TZac12UgAR3pPbdaARgMY5aiORHvpy666o8YczZ17rLcT9nxoZcUQ8
         AJjwP1pbQzhw6zHFfqKQdjQ1M7j6rinPWCQt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583958; x=1781188758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyQNq22zTHoCpyrA6QRDxZ9CuxarMcDHHStBIe3Zk+8=;
        b=BW2NIw+AbtsKWORZBDPh9BQ5+UCoNOc/PNLZ/xeNS5w3E6npw0aMTotMqVgT1Apq0e
         3Tp+FjNmimuumzgzvLywtHUt4RG5x9ZFhyY6WRZX9KbmU6TqiDBQ9iR65/EbqDxs0gxb
         oVw5jA2vemZKfJX7O2VAfK0bhJbI1QKu0OthfcPwlV7vkoUPmunXsr3s0nRtgdGCrfZZ
         8gBvYQn4OISbFak0SSI6C3NglDW/BPBciW7nsf7BWHSn/pxo1/Uk+Sa6UuyVJNVgxqM0
         SNSgqS/RZGWbewSEhmT7bLjeWuyk2DNXXgUEgegymIk8+E8wHw+trT3OY7DaraPWOBjh
         G5Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9zBUj4JUoMRLSa9XKXvHb9gU71vQXwqWC8rzb3TAPFiE239Q104c+uCsFywxzfeHCKelnbvhfNItX4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4WlQ5eYObhrhK4vVlVcAyS+8p2QZZtJREO9yzfSln9dGHMAko
	JPosLm53fU5vj9hz0004UaUCyljJxa2fhVLNAmVli7VWT6FVm4pVeDrUiG/7F1KEes2sI4PzSew
	xzInbAFht0B33msdG3LkPxwqUIU45BeE=
X-Gm-Gg: Acq92OG4uH0tD/lFbYoCtT0FSxggQ1ShI4i7A4YMqIjr74YzT+5CckmfFonFmK21KFY
	n7HHDlgVTcY/0dv5WoriXEJVEuHflRLeFsn9dLoHiTk5OdNl5foHtZgyh1YP3s+2748+0w23WSd
	mOnhL6m2hWm2KlUyUrlRTtowb595HDK5zppYCkaLi6cB+6WJPKonHv1UwruXUn18BFV/PPnXY2s
	+u1NacJEmWEDOL5tzzlo+0plhnZFXnEVC/m9vvFNmsYoqa8njYkorsCWahH46z8/yXlcLVOiWQJ
	yf7fKpsrfxHORQmQ+QupsWAlnL2jgonQ68NrB8/Zo1SxqS72hrHgMguT1Y2DGo+NkEDIZLE+DZH
	/rQAdy6LXTHbvfhNGSdjpECb0n1N1bbsnYMQ=
X-Received: by 2002:a05:690c:6aca:b0:798:5213:d90e with SMTP id
 00721157ae682-7eb8d2aa5b6mr29552117b3.25.1780583957632; Thu, 04 Jun 2026
 07:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603074222.593243-1-joel@jms.id.au> <20260603074222.593243-5-joel@jms.id.au>
 <20260603-tadpole-slept-8b6eeae9cd47@spud>
In-Reply-To: <20260603-tadpole-slept-8b6eeae9cd47@spud>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Jun 2026 00:09:06 +0930
X-Gm-Features: AVHnY4IpYYxRTj3rx2pop7nqyDgzfgVuavgDjhbxh2LAlMZ1aHHhJtAB9F9dAbM
Message-ID: <CACPK8Xf=Ec16jR+J399Pqi=O=2GgFjkZOPFo0AKaAA+58R6-gQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 18:53, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jun 03, 2026 at 05:12:16PM +0930, Joel Stanley wrote:
> > Document the bindings for the RISC-V ACLINT.
> >
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  MAINTAINERS                                   |  1 +
> >  .../bindings/timer/riscv,aclint-mtimer.yaml   | 52 +++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb1c75afd16..43dd9873bbc5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23005,6 +23005,7 @@ M:    Joel Stanley <jms@oss.tenstorrent.com>
> >  L:   linux-riscv@lists.infradead.org
> >  S:   Maintained
> >  T:   git https://github.com/tenstorrent/linux.git
> > +F:   Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> >  F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
> >  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> >  F:   arch/riscv/boot/dts/tenstorrent/
> > diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > new file mode 100644
> > index 000000000000..192ff3fcf79f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Advanced Core Local Interruptor (ACLINT)
> > +
> > +maintainers:
> > +  - Joel Stanley <jms@oss.tenstorrent.com>
> > +
> > +description:
> > +  This RISC-V ACLINT specification defines a set of memory mapped devices which
> > +  provide inter-processor interrupts (IPI) and timer functionalities for each
> > +  HART on a multi-HART RISC-V platform. The specification can be found at
> > +  https://github.com/riscvarchive/riscv-aclint/
>
> This is a draft specification, so having a "riscv,aclint-mtimer"
> compatible is not appropriate. Ordinarily I would say that you should be
> able to do this once frozen, but this spec is archived and unlikely to
> have that happen.

I've reworked the binding to reference the privileged spec, which is
ratified and has a section on the timer registers:

 https://docs.riscv.org/reference/isa/priv/machine.html#3-1-2-1-machine-timer-mtime-and-mtimecmp-registers

I'll post a v2 now for review.

Cheers,

Joel
