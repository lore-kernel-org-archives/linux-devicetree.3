Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0DD46D555
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796829; cv=none; b=bWNf/op0VW74wCY9EuWFchNS1czmry+GfDJf5+FAf/jHcwkjH576E22GhQbkvDwZQA5WTEftPW2DRVL7kzf3ciXgqqPyRHzzKzuBQ5WaG1kS4D5VdKcXzVBc+VVhkWiR+nVUG40v3uMdWZWBG7H23ONevvjaFLAK65E7R9A7+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796829; c=relaxed/simple;
	bh=gxi33VLZ2gMppChwwo0+nFM5QmAtnoZp4a1bQT4ATik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjlN6EgeRnNNNJCAmmDH5Fl6SzOYieHNhwfMzjrR+wA/OCfizYKYxiO3HsDn/D4JhDi3JBLpnoFJrcA6YS6OZe/JWuFEwTskVEoL0i5Wb0zu6fRupXxjR3ttcY3wwRWb7/LLVSRZAICByxuO/Bbk7UA8k/tKuAoxjR9vrkU4ibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e94120192dso510080e0c.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796826; x=1792401626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R9Z4v42/hEW06uLFS0AmempJdev8RXIeASGOWREk38=;
        b=Fg35nFLu+BOkDTOw+DhOE081OMqF2NlD2hQzpNkZD1SMgcgHtqzcA2yFPwtNFrk332
         zbkN3j958vmxu8or/S+5hFk/nPTwkkG2DBG1UXUXegL5dcuzntegZWIOzGzTeMHvrPtL
         +ge5z9nJaT9H2JBp5C42muICMcbkGeNa3sLUiIi4t11kNRdrt4YEx4i/fUCAfWGLPe+s
         iWL/1QCnrgN3YM8l1SHCX8yOq2ZWMdanQ59QcRdC3++swp2YQdSkcOHEJduaIo2pvPoh
         qVPDg/E/6wiELVyimmTlwZVJMu6co7G7dd+W3t2xqX3D+EWStlICN4Ux24PhnsSf9Mjd
         +u4A==
X-Forwarded-Encrypted: i=1; AKwUvBxRdMoa5FieKRK1TdenNITnNKZ/ZOLtc20kMSVWyFtZm7goB3wJnaC+HNGFknb8Ciauq+YW5lYwsOAW@vger.kernel.org
X-Gm-Message-State: AFq9FYIJabrVCIzCFIO6BuWjeyd4R91sOTNuYvPHkJg1RA9i/m5gDc3Q
	7Tffi6hlKciaAhP+uuPbRAqIo1pFGtPeTFoi5e9ElgXNdLSeFFAp0ZrqUaiPIMn2
X-Gm-Gg: AYBFou2hwIqsOEJs4tM2U9OUx4ydSlMsu82mEKxWhfOkY3t7fLmQ5cxTwBbdwEfqcGn
	0/NvTIJWEu7mGI390twlxWexsih0yZ8Je5rfOxkThLEbtV4EEFqqumbNxNw6jQ/W71zkTFrIEM3
	r53lX0FYUA8/SClFZA5iGAJwsP1iYmRQkMR4i9b8NoiBasNY2BpW5KnWUjuoqKu3OguZrlx9MkD
	I1XbIOaVSrwK2TQ9qKHpJv7HtwpjJ5y9K2OxXg0s7xA82lG1PKKkDaXlRanjsvdt4RHCBqssDHW
	Y6B6Y1CdXhzVmeuFE81pUvK0F+E+U6R1/UneT5P68gdAMXaUt2qHrOKOYrvu2JOztNImPCtuLsp
	bfcDCf4/UGMtcownWjysxPrg66cUUE9/J8WT+HpEZr5dH5tMV98EYBb1iFt56aIwaV7iCeIw0bm
	s1oPpuu5H0HvtjMu+bnuM0El0hcgche5ciKsILgQwQ7Uo15WIcfScIVObtOYQ+iS6XmIuKDCaNK
	isVvfthYOWt0IVnShGcpjlGgbZNdPenj0rj
X-Received: by 2002:a05:6102:80a3:b0:7c3:9173:b5f0 with SMTP id ada2fe7eead31-7cb372bae43mr2072829137.20.1791796826064;
        Mon, 12 Oct 2026 02:20:26 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb39d6396asm6179683137.1.2026.10.12.02.20.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-988c90ee9e8so358426241.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBhAyAtAZa3BnYfOjPa/4EYfJLXIs7e1D1449QI2KfebScP5Rm/d2nX8nGe1FquTM9qHkoO+pGX+oK@vger.kernel.org
X-Received: by 2002:a05:6102:5088:b0:7cb:1df0:813a with SMTP id
 ada2fe7eead31-7cb369879damr2230386137.5.1791796823865; Mon, 12 Oct 2026
 02:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
In-Reply-To: <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 11:20:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
X-Gm-Features: AclHuK9gy8WPXA70y2ILBUxdR_nY10la1SOqMg9bhKMA4oPFypGa7yRQ2ztCmtY
Message-ID: <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 6 Oct 2026 at 00:14, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:
> > Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> > interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect t=
heir
> > video endpoints, and enable both blocks on the RZ/V2H EVK.
> >
> > After these patches, and enabling the right Linux drivers, we get
> > this in the console:
> > mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
> >
> > This was done in order to enable booting mainline with mainline
> > device trees.
> >
> > Assisted-by: LLM
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> Rob ACKed the final DT bindings on this v3 patch series so maybe you
> can apply it?

Media DT bindings should go through the media tree.
Thanks for your understanding!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
