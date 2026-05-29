Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885523BF66B
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047446; cv=none; b=lR4PDDcVW0ELDKOnET7chSIi8H2NBT2xNHON5t2ocvrV+KoquFwZxD0s52ot0cdl3v70ZOIyywHZTglhb0Y1LkL8oW3ySoMl1HKQUWuWvZwq1r2SfADvS4zGfx8Ergt5j0GVUBBxaH5krEb3iQoF1yh5kEAzBhixSFF1jMuIs0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047446; c=relaxed/simple;
	bh=NjzYKxCVB3Ww0ir8y3x71SbSculisswHBsyqeOeMk7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae/pyj/e4n+Q0FwlCyUIdORl+6PXCgtlES22TAy04Of07bLtPV03ztW8Chlg9jzZ0W+9ImP20nLBjs8PTBqH/xRS6iABAZEJ/haQ3Zd3wzj4Y9NYl1IZqmA57HF6clJ2yEC4veSsD2HVyJzHgSg5PJL4VFoU3jqYCEFRSvNoEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57602a2d80aso4397210e0c.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047442; x=1780652242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+d8LWmU67MgBeJBnGb9TH5zr/45ZW+LhVoWp74Yl0Q=;
        b=sOF/V95TMp0sqbH/qRUi1Px+zcSLsS6Xt8l6+MNvX1vgoF9D9WD6DAxerhwaDANPrb
         ZGtvbkM+KCeFR2ReR0zwpeKvN2RG07RzTuGS8NJFEs+678iBZ399kbdFZrzToMVRJaIm
         eFmsOXaqk5E3ml3Cgueeq/ky53iCDMuPb6D+FDFHYW0YpsV//EbRprYntYRILSRKzksz
         8+w2rq5le9PeNZY/FcnKH7TgVHwef/Ryu7HsisqoxFoKtOD1O5Fg/KHRbldCrGJauBhb
         pt1o8Q72hcBKQRg9qTJ594eucf8brSFO1kIb2vDaHtcPDIxzr7LcWLRiatc+NWEyfjNo
         sBVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/j1/xZo8aD8XUbxLEB6KCu9lDnPw05IgqYxdcTunl+Qos96o0nTOl+KV360GkEXYGkjYvSxj0WflK@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMzQCc7Xkc6uhw+8BrUJ1/6iUAbEdnFvOYe0sh+YXT1JfIOah
	mA+pagpeQ50XmpdNjbcqBta21JaYtnbf+Jpf9HPEIMd8KoAGmN40SD8H4yMXiBSMOD0=
X-Gm-Gg: Acq92OF5W6uDGrB3nYj1Jjiu4qwvtee7bmbpRdtJMZJXsKGC7HMn6M6qbWji3fiFhI7
	fYSPUooVZ/Ua5XkyHO3uGAJ16P/2spSvdduoX2Gt11CRMPLl/8Kh0RYx6e+R9VUh+8ZXVMGu47V
	yy6mHBZuK4uPqSxUFOUseaCoG0ESkHoSzPVtRsqYT1jSOcFSPxWeu7/SW1PMVcD25vBST7P9fTH
	VoUJvVHQxJ9vy7Ik4bxuQeD9prYmjsdrDJcJZt/BiavOlQsQMv/zo8KPshL8hC6lHjcFRXDEt4T
	K5UaB7fuKjV7v3e9mua6sBG3QXCrvXoQnUgFsbP3+BJBFedNt5xCA7sR2cBZ1tqALS6Kk1BC3eE
	DbYNcGskoW431BH5kMB1Y5/qfBJKLh/mww8jGqKeHFWQrrghC/4fFcEDwdl4BKFcGDFoq6z3j8Q
	/n76kdYG+eJxFanF27nwmRUJRGx52sg3hN/h4Uypovf0tPu4CQ+edZVpjCExJN2hznf99tHs4=
X-Received: by 2002:a05:6123:2e7:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-599fab5a7damr576919e0c.14.1780047442207;
        Fri, 29 May 2026 02:37:22 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d4754039sm975771e0c.6.2026.05.29.02.37.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:37:21 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9639b1ef167so486421241.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:37:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//FM6CSqvXI/cMGbIPMmA5Xq1j6Kycko6oEnX5LbROghcgvsULMAMBAi2yO/QAM5uDrkPtKpPwTljh@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:631:e729:4575 with SMTP id
 ada2fe7eead31-6bf2d11021dmr630800137.5.1780047440701; Fri, 29 May 2026
 02:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
 <20260519111958.233194-2-biju.das.jz@bp.renesas.com> <TY3PR01MB11346184DFE4986B5728406FD860D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346184DFE4986B5728406FD860D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVn4RHz7yf+kVXuLcz5ZNrhmJhoJ74BvY8mhDN8rik02w@mail.gmail.com>
X-Gm-Features: AVHnY4L0pu59j5vGR-f9mTsACKK13343vKlhDjyJoO21Kuxw6AQmS493XBXp4Eo
Message-ID: <CAMuHMdVn4RHz7yf+kVXuLcz5ZNrhmJhoJ74BvY8mhDN8rik02w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 24 May 2026 at 16:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add device tree nodes for the three RSPI channels on the RZ/G3L
> > (R9A08G046) SoC.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -442,6 +442,78 @@ rsci3: serial@100f3000 {
> >                       status = "disabled";
> >               };
> >
> > +             rspi0: spi@100b0000 {
> > +                     compatible = "renesas,r9a08g046-rspi";
> > +                     reg = <0 0x100b0000 0 0x400>;
>
> The size is 4K, so it should be 0x1000, same for othe nodes.

4K is rather cold ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
