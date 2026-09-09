Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F4643DA5E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940680; cv=none; b=jFveXyERe0AMWgVbhWOCaD5E++VvLwbvSGIswilSsb3M2eilFOwKDxACwLR55s9Ir/oB0PEu/zYXE4dQ5zr2XyAu7xTcIXKWr2hCi7ZVe6rRd9VXLFmf6itGPFH/wXWl6waJfRZDOBLF97+JGxJe6LxazQZkTElp4ww8nkf1qo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940680; c=relaxed/simple;
	bh=Dp0zVYlRV/ykV6DkWI/HZNZ2E595JooxGaLy6ystZi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ch04cnJyMMn7X53TX1Nl7/ggSaFGO0fF/aFoGGoVOBI2KJfXTwX7AhIQ//c3axu9Ca41JQFGk/3DOx0MWMxHO5A4jnh4yWL5u5hj2+dfWALb09hjSKHoeUFGU3UhSB0X7smfCupLA62wo7vli6yt913AjeENP0fHM3wVEZ6Anv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1600d040e4so832775866b.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940677; x=1789545477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4dyKB/emFRDPrDqz9X2vH5TTb96Md3MW8gLHSI8vTI=;
        b=pNBKFdE4GRB631ousRR9WaA2L9Cp/aF/OaCw4mJABFjHDN38fo8e3USD7qMrmhQY2s
         n6hCLmVUNAcrqe1jOCaGkUqwU3QxudPUKSSwG9whSGJ+yeySniOj5AtsFYXab7sSZLp2
         fAXhNEs4W6pfi/5g066+kDBqI2OlFVREfSrGzrGpmGNF+vcRZ4sHxhSFnmow677DrpsV
         K/mPqxR/7m5jrqC9RXwySyS5AqAySFxsfKHQdHDnYHOv5vJvUXQEx9tC9wGmuoL7XPNI
         UxWR5d3RqigfKOPGwTv/alMoDriQOquKc732u2xHgeNuU/VuDC/lv169FEDnMV6Uvpl4
         RdPw==
X-Forwarded-Encrypted: i=1; AKwUvByDG3t4JoKmMuZd/jongfOY5Dfb8gK7aD/GVDOUwpXP2FQXTIqPRK++s6p6EWffeeFzhuPiUa/vXRcy@vger.kernel.org
X-Gm-Message-State: AFuF++mKsw5jZjKoeFu0c53iXv5mvGlVwqtoZjul7lqasqJcXWEP3XCj
	bzclZVsbx0NTuZFgEZ/FftmGVhx8oHG9cb2v7ciGFShrcftwKFLuWRvwBsB5JVgiobA=
X-Gm-Gg: AYBFou280fIYRpH2myKfuA6sb7atd7XU0cuddBWFn7I1dOU5sFnDq7LaWmw44IxQlvB
	kg4wMFBwG8kBNB+Ncm/oCw1Q/9/fElRluhReeeOnZ8nXopn+awqYvnn9vVcZuPbo9oIvtNzI4f+
	6Ebl6aXPjdCdbvKaeiOGtWl6eSx0xMSgD7e3QME8fw54Oie5HytEX1UoDckZA1wf89+eZ5PjTr5
	1PukrTuhaXpH4wP7PJY+01G/OUlLiTzRrPCcaZ/Ia3xBqOh9BeK6FVi6ldgEoHhwbGgWE/vGc7H
	utn2zadKjw6VdiQ6JGn1bt7Q+uHSMk0h7OWYMqv3a3IwEduwBa5lZ16yhEMoJKB1YPg7NdxWK5M
	gP40YzTZdoV4/Cr/sFoYMg8J7cBcY/YoPMiJxH+gmAWTR1ZLVP0kj7GgDzvaWb40rh36xSkSlQR
	afXNdgQFBPG1Kto070b11MzwcDjDauwAbOZcwHGxUiqjAhacin8PtHnme/zAjX277KSHRW6d3gu
	F8F+/A0NgXS9E3vKj4wL4OVoWTG8EW80c8u
X-Received: by 2002:a17:906:4792:b0:c26:3341:b8f6 with SMTP id a640c23a62f3a-c263341bcddmr835423866b.31.1788940677111;
        Wed, 09 Sep 2026 00:57:57 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm735176466b.14.2026.09.09.00.57.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:57:55 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so9342055a12.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDAnZo3vugY+a2JKiuvfHTPx3YDR0z/9IWoFVuOltki7x4a4GEeg3IEPctBJY/0JMvZClUx2xgDwT3@vger.kernel.org
X-Received: by 2002:a05:6402:3247:10b0:6a6:b2b9:7662 with SMTP id
 4fb4d7f45d1cf-6a6b2b976demr10117247a12.15.1788940675713; Wed, 09 Sep 2026
 00:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com> <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
In-Reply-To: <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:57:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
X-Gm-Features: AcwNN1Ua9Vke213V9Nb0AugUOA6EaQLwJxCjzIaW2N2cORqAOZX-qMn7euhb-OU
Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 8 Sept 2026 at 18:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 10:46 AM, Geert Uytterhoeven wrote:
> > As I am not PCIe DT expert, I am comparing this to the corresponding
> > patch for R-Car V4H, which I have already queued as commit
> > 7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
> > update PCIe nodes") in renesas-devel, but which probably needs some
> > updates.
>
> I sent a fix for that one:
>
> [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

Thanks!

> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
> >>                          resets = <&cpg 624>, <&cpg 1121>;
> >>                          reset-names = "pwr", "core";
> >>                          max-link-speed = <4>;
> >> +                       msi-parent = <&its 0>;
> >
> > This has an extra cell "0", which is probably correct, given
> > "#msi-cells = <1>" below.
> >
> >> +                       msi-map = <0x0 &its 0x0 0x10000>;
> >
> > This is not present on R-Car V4H (which is probably wrong).
> >
> > Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
> > documents msi-map for endpoint node, so should it be added to the
> > pcie-ep node, too?
>
> I do not think we should be adding it until we can test ITS with EP ?
> This patch adds the ITS only to the RC side, where I can test it.

OK
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
