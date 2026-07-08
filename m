Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23848233948
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504184; cv=pass; b=D6r52bYArh617Hpnz9JegrPT85x2z5C4SBurL5wJ2J1xltFWdOAnQB/hqMmW1vc49PdNxSxvVxUDrlMCEAXHnGokfhgoJoCjZeqnCXoGqBm6TSL4JykpjEFB33tvFmn3IVRvLejnBL8vNshFy/VpxioAhp/YUSfQxKgcB8sx1ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504184; c=relaxed/simple;
	bh=2ocFIX82rm4dEa1oVxO5JXtXF7MTiyhhS+58T3RbcxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca5Yfvnmm5QyfSrmNk3w+mCruv9iBePsS72e5Z6ORvNpUiDo8odI/pqtBU+8HXEXkVllm3dejYmLQRm/AaogHU3jATtzChjV87vw98atxQhaQFG6x8B/5Ct12hVwKIU4bSa1tcArKIOVgsNxqL2YCFp7nmuGzUmf+CgLiLNHnVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5RWgA47; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5RWgA47"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47640541585so274406f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783504181; cv=none;
        d=google.com; s=arc-20260327;
        b=B4ygs4Y5XuCX4AIRrSXcYZ4Ce6uX/ljDgoeAHUztskZpeLMSWJG2e/hsLWn6s2nBfY
         eyh+Xgg/Q35p6Td++LxePHCxpzbF9xJ0NJkYZLxd3q2jyEtiGR4hhPGCO+Rx4vvBm5Wl
         IloVrJH8sME/AsRTV9nbs56h5CtZ13q4UqVaEi7EhZf7rXv3yaZj1slRyCKSK7zbbNWa
         dZf7sPSjxVl/Vyz3LlBNvh2A1m6rTwG82wnt0v8QCkPeiF4MtYEmAwLfYveknW3bazjW
         ppGEp8MySdop5aHoyfipOqfKwU5Mn051kOIA1Lh33GHOc0gz/uJW7NcSyByM0kBUYuJX
         wHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2PHZjtADNnCn0QLMDaRS0NseXX2MUWl75IergG6pEgI=;
        fh=jOWAxup94Og9Sm7wWd5B8521WASnaU0mcdoEkq8GjgA=;
        b=SxlafCWxHTGIkgaIOCnJdJDed78a+GkVtdD4BqwF/rywWC5dnIzI1TkWhVRpMeTZc/
         WbW/NoCAfpylRgrwrbnUDdxnShCbHcBBmnnpv/vxvAma5UEz/W9S4K9hezjas5P+MxcZ
         IRYachBzK/C1f2Y8oeDqnxxPqHqulXrLATdv5D0yg49ph4Pi3ZabkzY1gaVrGLWw7XDZ
         sm+JqGopiZC+PJT0fXUjKNCzk9BFheJpdn0A0UZLUgaQfN14Cjd2ZiPwGt31x/NjVBSJ
         EcIvbb2QdoaNCUSIHPsr7jeKilGdU3s8LWZpfJnHX0QF8fFTKCuZfr/TmTnl2cTIAgTS
         TPIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783504181; x=1784108981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2PHZjtADNnCn0QLMDaRS0NseXX2MUWl75IergG6pEgI=;
        b=c5RWgA476xuuVg+XBRvgPIRcpL9yTkeM4BodSkG3+Assjvupa2IPC+a3RO9Q9Ab8FR
         UPbFW01p/PPguYxnXJeX6F1HoTHQPDtNYDXC9hLamODZ0aOnI+/U7Pt8zNfYxB4A8/5q
         YN+vD/GcYTsD2rSr5chGvFRxPmX5dAQMF33HUDHx6PUa5m/67Q8xoHLxf8hpXFy0rC0K
         YWnaPYywGGZVxwEp18eza1S+uP/zX6SU2T7mBU1XBxdF/Qzjk4bPwXIovuNrOCGF7mhz
         SKmGaIbhTAPhnEzG2lc1QNeQs5iz3AVJDEP+Suy8SarRL0hiWzgMctufKPjjNr7qCqwW
         Lnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504181; x=1784108981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PHZjtADNnCn0QLMDaRS0NseXX2MUWl75IergG6pEgI=;
        b=iOFr9h+u4tMx8/Pn2P4Ks41mZFVoQCB5wITShI5U9UkjYGpNQR8+pNng+aKHftMk7n
         pTGubnHAF2s/8GaIKAUQzh7OWjquhTmaJUHPpagEu9H7sdHSIiVBkusEHfOEZJY4d6xf
         ds5HUgYuehwkSNm6dvnvLZs3jxMjdKRgxYPSdLZygHkJaGnivRNjfyze6PsmcSpFPQ/Z
         6dQLIpKXNDvUwCw2djSja82Z386HaP0NyxcvYj1Pyh3+2jy3leHFLjNqXSFqFN39KZ7n
         MhsHwTICRCgN72hJhVEah8fiyBjZExvoY65kpvNEh6FlrycTJIVpvhFsaafgNsJ/C2Xw
         Hzcg==
X-Forwarded-Encrypted: i=1; AHgh+RqZo6zQriLYr2JcwjhNirJkqKpblykSU24NyI0pXXUzQd+MQw+p+BLgQf694SO1Vm9Sm4LnD8QOrCmp@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+MUu87CS08QE6prHyG8ZyMa5XT11HzQLiUb+ACeRIzNfiKwa
	URgCnlsJwL35E7XcEYx8pMmqDNPxLRQEkwrAsWiA7XZs38Dso696WUOnyiEo1VcTnHE7xZN83ko
	8IgDrjROBM4odoHabb5hMyzirJ5q0CZQ=
X-Gm-Gg: AfdE7cn8MkYWlXx/VASUt8aut9xfhHpWXtvmcY8Uu+SMX53IMbiePUMV0CyD++0k2jH
	OfWO52hYNqo+8o8FyXle78y+KMeEnM4/GokaMYNBQMhOwNCpLqB7XtLEVWiAf2cCf3qIZlL5+/h
	jsqzs1gIT3Sd2tsB8AC1MPw0M53psDQH0rdlmlZDrFMs4EbkqGGcL+2mXIvx2FUE4HkOVNu39dh
	dnnp2GgV2zkHeL7e92LBZdZx5jq5JB1Ht8HzPF+ZWAPquteBbxqsAv8thP5IWECOnQsYVaHwr5B
	vNV/I2eymDZLx+3E9vEndcsbupkrNcL0ohAtcIEoIEYj4HeQ0zwc+OuQoJU=
X-Received: by 2002:a5d:59c9:0:b0:475:f0f0:9efb with SMTP id
 ffacd0b85a97d-47df0787b87mr1790194f8f.50.1783504181280; Wed, 08 Jul 2026
 02:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX9S18T8fou_pGGYFGPbMSLohfJp=QS-LTHA0rFbL6zpQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX9S18T8fou_pGGYFGPbMSLohfJp=QS-LTHA0rFbL6zpQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 8 Jul 2026 10:49:15 +0100
X-Gm-Features: AVVi8CfeOYtJ-2yrVV7ulXxmGMg3Rv7iYee7gVieHGVSx8IvXGQEQluq3FFYs2w
Message-ID: <CA+V-a8shGvL3Antq=x_NFuK5r+2ewYEgfqpPYKE-JEk7hWdu=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jul 1, 2026 at 3:08=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 2 Jun 2026 at 22:47, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -1025,6 +1025,146 @@ rsci9: serial@12803000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               pcie0: pcie@13400000 {
> > +                       compatible =3D "renesas,r9a09g057-pcie";
> > +                       reg =3D <0 0x13400000 0 0x10000>;
> > +                       ranges =3D <0x02000000 0 0x30000000 0 0x3000000=
0 0 0x8000000>,
>
> (kast cell) 0x08000000, for better alignment with the next line?
>
Agreed (and below)

> > +                                <0x43000000 4 0x40000000 4 0x40000000 =
6 0x00000000>;
> > +                       dma-ranges =3D <0x42000000 0 0x40000000 0 0x400=
00000 4 0x00000000>;
>
> Sashiko wonders if the first cell should be 0x43000000, as the window
> is 16 GiB large, i.e. larger than 4 GiB.  I don't know...
Agreed; this needs to be 0x43000000 since we can access beyond 4GiB.
The driver currently has GFP_DMA flag for __get_free_pages() and we
need dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));  I'll
preprare driver changes for it. and send v2 for this fixing your
review comments.

> If Sashiko is right:
>   - RZ/G3E is also wrong.
I will fix it.

>   - Should there be a second line for the 32-bit window, covering all
>     low 4 GiB RAM?
>
It's not needed; the driver handles it internally, as seen in the logs belo=
w.

[    1.849811] rzg3s-pcie-host 13400000.pcie: host bridge
/soc/pcie@13400000 ranges:
[    1.857545] rzg3s-pcie-host 13400000.pcie:      MEM
0x0030000000..0x0037ffffff -> 0x0030000000
[    1.872114] rzg3s-pcie-host 13400000.pcie:      MEM
0x0440000000..0x0a3fffffff -> 0x0440000000
[    1.880920] rzg3s-pcie-host 13400000.pcie:   IB MEM
0x0040000000..0x043fffffff -> 0x0040000000
[    1.896393] Setting inbound window 0: CPU 0x40000000, PCI
0x40000000, size 0x40000000
[    1.904323] Setting inbound window 1: CPU 0x80000000, PCI
0x80000000, size 0x80000000
[    1.922267] Setting inbound window 2: CPU 0x100000000, PCI
0x100000000, size 0x100000000
[    1.930407] Setting inbound window 3: CPU 0x200000000, PCI
0x200000000, size 0x200000000
[    1.938533] Setting inbound window 4: CPU 0x400000000, PCI
0x400000000, size 0x40000000

Cheers,
Prabhakar

> > +               pcie1: pcie@13410000 {
> > +                       compatible =3D "renesas,r9a09g057-pcie";
> > +                       reg =3D <0 0x13410000 0 0x10000>;
> > +                       ranges =3D <0x02000000 0 0x38000000 0 0x3800000=
0 0 0x8000000>,
>
> 0x0 and 0x080000000, for better alignment with the next line?
>
> > +                                <0x43000000 0xa 0x40000000 0xa 0x40000=
000 5 0xc0000000>;
> > +                       dma-ranges =3D <0x42000000 0 0x40000000 0 0x400=
00000 4 0x00000000>;
>
> Same as above.
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
