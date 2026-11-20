Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181014;
	b=5fXpPjIKnU71+cmJN3KXGnzl/cReapJJO4KE+6Kl4sTOcHx5RBm+kfDnJYgntJLN/oFX
	 vMuVHuB08ofeP9FLJQvZLywCPBiTyBydcMR9NtLOoPSHvxOa3mK2Xq2ppl+LSMNjcRvqN
	 upbVU+q4n+vnTbUSFp09Pcx70gsApzdmnD7t2MDluVQeWQR8OKIvP+6KXJ/j0cbjGClPV
	 PWWfNl8cJM/bcbPn3ZsVaBih6Lp8jZ6ARH6/MQvwNREKqQ90UKVkuq7FcNDe0oT6jA4v2
	 dXL2oLydb94S0UW4NsNa9yUy0bJKZ6iZzxKg+Fnx1jKAUm/XgujjXlOLBT/FTBAeJ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181014;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=THZx2uVqsnNjN7chBboOD7x6p/ktvYcyg9pppHAmV9s=;
	b=Dg39qYZzi7gTJZ+MVWE/AtQ1eFXLNzGuAYdi58hzOkjlTWJ2hEJIzefPN35zQV8nNDVu
	 Sy/ocQ/9KhN40iiIdv2tTb7Y22DaPn0Y3uETnv+6OkK9KBEgv/SliJPlu1DipBSRGwZfR
	 xjM1g6oIAEmPY8IkstU0eYteyLc5wcLoWLQXbzNPtWwVUt+f1Vq7bgfYG2ZrBKqtn3ZiJ
	 dKfLzElWcna+3ybvV1RPonJk5x67D5WIbsa4T0ghXsTsvQ00OCHziAdia6rNKI5MIDTi3
	 yH8u4ZgKIAI1NMHmZaNz3Yd5uFaT/R4zRVeonGDfjUE8JJXOJiyIzcaBJTf/I6mF9FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B4606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0B4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso494547137.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181013; x=1795785813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=THZx2uVqsnNjN7chBboOD7x6p/ktvYcyg9pppHAmV9s=;
        b=r3AI2/XcVeYWjwHp9wpn91Th9hs/F3y369Lg05i9U/AV/TEVwfDFZ+7jq12gv7S0F0
         dklWFcnP+V33XYMxKIugH2CEUTzDigNan1QNeGoMexYgZSWTVneg9Z1rwf3bUDIjn3MD
         DINJOqxrjLJ3/wqmjT/AlVS/3Oofb/kktVYqOA1tdNQXS1iMTb7n24lMDUn31QVFZ5Ek
         H/NRBvNfkwkZVTJ5GH9Tsl5C6JvNpTdBUoE62LOacX9qCwVJtJks+5lYq+GnRs2QzEe9
         AK5EMcozZfDKhHH3K9JuCpEXifD13muUH3jrndPYEhYPwAfXskElkwZT6ELQOl2QJmw0
         MunA==
X-Forwarded-Encrypted: i=1; AL+hErEen6xEWXFLWGRe05vWHugjurOhoPogCt1EMUA/uY1oqsNoVmRitAG6SGFTDQtKDEWSgb5VCOSt9lJS@vger.kernel.org
X-Gm-Message-State: APuU4Z+HYFaB2TdmvyWX8udfz/1Q9F6WLXMXPyD8nUUPH9FD2hxgegs7
	0xqVKYIRcT/mKFUTqg+iIY1SW1lFyH6ocQLqEWLmG3GfEluGWvZu5QKgr/vh00FL
X-Gm-Gg: AZFdTZcUnXOHfdkO22FO/eIvAMKaR4JNYhRlaVKBDNZHWXxESWqHh7dHkV89wkwcJUf
	NReO8jRnnmfhm2EJggSfLI3+Kfrief7l+exf8Os7HYVqyFzwX2jX+G8q3YGq4uIaeK8MpWsQe/N
	dt57feAMx9EWhp5FOS9qP6UtzE6cw/wR7t7nkDfMqP7il6UeU0tU+3wNegazoLa9IFakNkhD2Fj
	PXID7UltQ252KHUD5LEOst5zwiuLd4PNQ5feL2H+mc4oqki7RFUZMVPS0CLqxFcydjBhuUocUp+
	ON2h8EpvzvfIYTKsX260Rdx2Paq79+Z53gFrSzeGkffOyUZ9rLZAjbDTwjBH9l4R5stUGPsOPXr
	N20LpM3fUAY/S1Vfyh+Kcd3LsUXzODwlgrivf/Vb2KaIRy8BLJfmy9PPV7Ho0F91yAbLmoWAVRM
	rw2S5ToYOIp/eltxDUz+dZVwcbvdF1CGK2wHdEGLFFT+X9T29UI6vR00bavQ0/07BRS1KB0f9Z3
	SxF7bVaAkS21lDH867yk+9DEhyUtOij4d5vAxrJLqhlRggXkN07guI3+526U67W0/RWTvWYaYD/
	UQiviwKX7s2JHcyVZe1g/1782wvIc18LMUBfPYl+Rf9QY7HCTHAV9JC1ls1duzrheWA=
X-Received: by 2002:a05:6102:1621:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d73962898cmr1158746137.30.1795181013135;
        Fri, 20 Nov 2026 05:23:33 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e822a085sm2823797137.10.2026.11.20.05.23.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:23:32 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so536743241.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHI9RUbkATNTYoyZ4QWxmwVQpDavR+Nx+njev37E6CCDVl/VPPD3h4kmfgdys1VnfSOLLDf1fVpNyOs@vger.kernel.org
X-Received: by 2002:a05:6102:6489:20b0:7cc:9a7:7b83 with SMTP id
 ada2fe7eead31-7d7393ff595mr1025562137.15.1795181012215; Fri, 20 Nov 2026
 05:23:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com> <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
 <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
X-Gm-Features: Aa3M54qdna0I3eJOyWfJ3w7gw8KDkW8vBh5kvgBGjyn7BKPR4dhZV7bkK-pEADw
Message-ID: <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 20 Nov 2026 at 14:22, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
> > > voltage regulator for voltage switching. SDHI2 signals are muxed with
> > > I2S0; the selection is controlled by the SW_SD2_EN macro in the board
> > > DTS, which must match the position of switch SYS.4 on the SoM. By
> > > default, I2S0 is enabled.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > > @@ -42,6 +42,7 @@ aliases {
> > >                 ethernet1 = &eth1;
> > >                 i2c0 = &i2c0;
> > >                 mmc0 = &sdhi0;
> > > +               mmc2 = &sdhi2;
> > >         };
> > >
> > >         memory@48000000 {
> > > @@ -355,6 +356,74 @@ sd0-data {
> > >                         power-source = <1800>;
> > >                 };
> > >         };
> > > +
> > > +       sdhi2_pins: sd2 {
> >
> > > +               sd2-pwen {
> > > +                       pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> > > +               };
> > > +       };
> >
> > Just wondering: why do you use the internal voltage regulator for SD2  and GPIO hogs for SD0 and SD1?
>
> Just to give an example for the customer usage. Either use GPIO or internal regulator
> both are supported in driver.

OK. Please clarify in a comment.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
