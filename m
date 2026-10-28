Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198637;
	b=ygumXBACWSyNgJripSXi923XRq1+p6v94gRpH3P3g8EQDd/MT+3XRkE77boS2mqsYcF6
	 MDImmun0O3oQc4hoUnGQS7XI4DbjHSgq5Et4SFdgeYFmNyWkinZZzOOcaQPDuHSrxiHUj
	 VapXuUfJt6pHr0KupSCz10pCo5di5CJ63Xjet9p/BNIUgAsCHRvEjOpQPng8FGbOkpvKS
	 UHss84M+1UWWyluxhFTG8AaA4cgpVQLub7CxPC3051dKtcB4plG4CgSWQj1AiEtmAn6Si
	 CKV9N+8Wjcni0sFphtoDqUXUeZtwgGKKM3phYfjpa4Zq//NY9XndUmpGV1Br7a9S0Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=;
	b=fgKjn0mXPk/dky4UxodmR6dtxkJr8M1p19MzRZqoLPoTDV4iMFoc272CdTHEGMXvNI/h
	 /uTZIDFQ/ek3Wy3T8CQkKYZQxei84WaReFFcLr4gQTuxJ2MWIYzQrH1y59jaGuS72zhqY
	 2tWKKT7bg53hZER4MlgnIzVExirM2hm1L+yDPo7H2S8xC4zzositEF/AiWdfEtkZTB2uz
	 ufqQMwPx322yLUg3EtpAULABWZSOxoPkuJlBQt8SRdK70a4S0WgRs+RkVavXw35HcK2Ow
	 HZfi1N5dPOom1NYp+4DcSiigGNDWNdL73y54G0UfhzXMXxPPDyrhf/9t5RQMXKAQzLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99486606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99486606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso322374241.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198635; x=1793803435;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=;
        b=lAvOIwLPtZ1d0cbY+09k/WhH2GQVci3wTu5xgsqKlCJPiZHNmeERDmry6NjJd1FlOm
         rgomk7rSOAo79WScGwLm8Pe4PPjTYvZ0n2WqHMvezSNLCC5fjAI7NDlbz/VaCcKJIE/W
         lStSWhNjsR9m2nIIAqta/b3nN7MZnaKFiRm87Qrm0UtXzgIl7Dtg+ilLKpCHl94WjeCb
         lvYMlgQwAbtEWtbY0P60vyb3ClxQfu6sbHDKQ64RpvPCD2V3Tl5iBrSZ1kqoYUDL3qSh
         P3zsrG/NvKLMygzSILgVrlC7OokfNG4jET4PpSjNO92Z9j18Aysdk2wShep6jd9Xjxr5
         aheA==
X-Forwarded-Encrypted: i=1; AKwUvBx7Y74kBDToid+zGFXqdDtfloqopVY2TxjvrZm3WXnIN+VBp+U41CmPjgFTwuZqW+PdE+nJtmJAMacC@vger.kernel.org
X-Gm-Message-State: AFq9FYIWyrQTik/epX9H/8Q/vRpLfMhCr3XeyAfH8B7vHdcHd7SkQhQQ
	cBMJyyUPx0EA2nsrRCIfSs9TQJctpeG56vA0tQnZbJ1gLJtH7qD8tEN9sdSvQxVj
X-Gm-Gg: AYBFou0HIiAqRjLPluhGahPjga5tnzT3rf+aMjcOSQHaqj2L+wLspC4atPx6smHiyf8
	eQogoWnuT4R1TMwlOQ4iicURDTwc57NOlsEAvIMvVOZcLuGmxUdvotQM/bWzpdRrc6Mfhgi0Fls
	MmHpKs88fjAILFFO6nHjT5RBFRmBnTsEZ7GEsT17Oq/owGnpL2kT/hT1x3+rvqICA9WEcNe7nTg
	oAzaqgzAysnv8tRSQtkhw2mfyOonYRcPD6zAoLeeA+BvYyWLK21eh7hDToY4C0+SgxJMarq7+k2
	tDdn+BnpaSCfkoCVMJmccH4ovq55jdi3V3a3sr1xtaFln7fRIJIK/v1CLAW8ubkVmPBTkgJJezY
	xo1xnN9z9tsiddbcwWFCpjzZzrRtc/s1webr3hrtbVP05q/UjRbAwFhTBPE+mEQU+58S7D37Axf
	lZJJCDN9Jo8WQ8hqsYAGaVGu/TxpNwsNrTKl49pW6cxzH6GvbgP0CYBDuUGMlBbM2oF4wQJ2LW1
	u6atH5OwIeqeV0/+D/rISC3qXasjO0sDyryJEqqZ+X8Y1K/PfW6/fV0ap77QZw+zWOneKkMmh5o
	59FN1+MRwIccaB+iTViXMW7lJBT3sPtFe/7N2ADL81aII9N3R4KAOM0EYWjKV/IFaQiBTwe1uTu
	pbvIs2/UF/cWz
X-Received: by 2002:a05:6102:4422:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d03a64ef2bmr897660137.32.1793198635452;
        Wed, 28 Oct 2026 07:43:55 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125932041sm6067137241.1.2026.10.28.07.43.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:43:54 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c03744ef27so315581137.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+4eXjMm6zFBQUG/LzHAyBnSDWdhVSSofDu2UHAxaenko3u0v65pmmj41E16caowVfCbPFM6H1F992@vger.kernel.org
X-Received: by 2002:a05:6102:6f07:b0:7c3:1d7:f234 with SMTP id
 ada2fe7eead31-7d03a294a6dmr903761137.2.1793198633657; Wed, 28 Oct 2026
 07:43:53 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com>
In-Reply-To: <20261028132937.GL15441@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 15:43:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
X-Gm-Features: AclHuK8gWV6NxtQKAEUrEm-e_rgKbr7fNh5k6QXPge3G8NVSao5SAOErcvAPoSI
Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > @@ -28,5 +28,8 @@
> >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
>
> Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> R8A78000_CPG_SGD16_PERW_BUS, as well as
> R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.

I could add them, but do you have any need to refer to them from DT?
So far I only added clocks that are listed as clock supplies of on-SoC
modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
Timer Unit (TMU)).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
