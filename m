Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F404BCABA
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614825; cv=none; b=HQn5b+ocMplNpcM/hbH6LL7f4Wg9w8LpxKbcV2TXG4J4sElMDh7IvRuxXi/WJG+i7I69Ocx2Q8XQUl0ZWnP3O2QNdR/xubsqwHtSfw5lUH9Jn71heNOxoOC9/R74SBv3OQfp5YURv58qSipg+eexCKm5x5XxeQY2ynUoBEK2BVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614825; c=relaxed/simple;
	bh=+hIOk59b2H3pTCZgJaBTE5mJHtyR19kXkDBOZEQc6yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRdnZs2z8eDw6eidervLbUSUbB+ukkDBx3kxxrDXk4Ecmyy/n0UmErovFs0lhft0rs4IvRl6qG61801rjtMyhcdNfqlmT0KS5vwOva0s7jSXLHuDJm1/H5raDW4urQ7JQ8HWw2nvJLoDrbp+wuLF3EJGpCa9ex+l0nH8R7dV5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b2c2be2633so439992137.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614823; x=1791219623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwLC5W4u+V0GTSh2RZtGBKpKQq0r57Jm6ZwK/nvUP6s=;
        b=IdkwlLBav1Po0ePoOvDZDgyuE9VEGu3aDr8A/YV5Adhz2I/0p/aHe/WNY/EJu9w8r+
         G8uOupKUfiiIP+Xqsm74Es4U+jbVQGwrQeET6SHKiVSM39jFF8oxPEqvGdPMRAeKf/Y3
         d8qiu6ziNIB+i/NxBAdKwkedQK41osohnEfZFqK1Yxam707PRasIyWRviuq9BqP3Jysl
         mfjlQCoGJ+nM40Cnu1ql4V8LMJ2AazxbOuIlkdIErl3Qkv6uJJe1MbcjypStFxpoVIWc
         C33TYE7kY+6VbXopLHISUfH9nUqCOTT4/Z8eOZFSChls2eNwAsLTGaICOKLKEcLW70wJ
         xc3g==
X-Forwarded-Encrypted: i=1; AKwUvByEPaXQr7eOsjbdzOqPJa+lyKNUvwm1/ta53Gr1yn1nidpLdV4rwjfnU62S0uR/+AhyS45sbJ2QH39T@vger.kernel.org
X-Gm-Message-State: AFq9FYJft6MpTZg8HPnzsmd8KgwUHPriME/o/guQ7g4fMaZVRIsaSyp+
	qT3ZLfhQOLJMtSw0cai63S4xDuNtP8qjEyEd0Ll27kRPkeHdPS/+EdxGmPjV/WJvsKM=
X-Gm-Gg: AYBFou05XIsQNO8ambGvUH4M29wbi+Bs7XlPgcD0qrz9V32SYQUha0Imd6OJYsCx0lR
	GvgX0+zkS8J8aL7d9jxIV13ZOX3m7XyIlQnJ0rebiaHPC0vlyCJ7J4VBaTCU0xtIo0+az6+amIw
	KMnydnOp5dk1zG6Xr0LX6+gBo07r3YV6A61hLCSt6LmSR74BHISzhDQ9+d/LhG7JezM0pJGH2Ok
	kn5+tCionf6AvCfF00C1jKATarGhlbyYtEha4yObNb/DRuEVF09QkB5v9HpVwA1smue7y2nP6N9
	7V6ko+QofSHwVkLSgJA6TMmH9Kl/2Dl16DKuf74Y/H9sO8DDAOV7JxgBs1BcCo5YQ3t8dM+ZCao
	XYlFIFDMAVAOLxtWQ2dkW+TKue0KVbFvCI0DItRCrECprxWcxHYxDL6wvsffOMIccu9rZIQAL0P
	3jRNAs4PDXriNiCwErXrdFV4fnDs85a0mR+YkjIsBnkdqYmQMcJZezdussw7wjQRHy1LkS1BXTm
	GznbektTJo5v6nOwvBOQispppBZTu8GdC5tzrwdqGrnB24=
X-Received: by 2002:a05:6102:fa6:b0:7b7:3acf:bd48 with SMTP id ada2fe7eead31-7b73acfe09amr891191137.2.1790614821292;
        Mon, 28 Sep 2026 10:00:21 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b08af8asm7332199241.3.2026.09.28.10.00.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:00:19 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b2c87a0311so740814137.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:00:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzP2ZCSJ8IdFalEEsfuDF/BUasSSeETP8xQXzZ7iEJN7ZDptX0jreUxzCjddc9P39oUGK8a9MdcDyKQ@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id
 ada2fe7eead31-7b367d65363mr1527719137.17.1790614816969; Mon, 28 Sep 2026
 10:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com> <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
 <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
In-Reply-To: <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 19:00:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
X-Gm-Features: AclHuK_mHVsKKXBL6m4Sk57vt_PCy6cF4ftlcvUQYkzUcI9-oEgY3mVcHJJ2ndQ
Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 18:21, Josua Mayer <josua@solid-run.com> wrote:
> Am 28.09.26 um 18:10 schrieb Geert Uytterhoeven:
> > On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> >> SoM [1].
> >>
> >> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> >> featuring:
> >> - 2x USB-2.0 Type-A connector
> >> - 1x 1Gbps RJ45 Ethernet
> >> - micro-HDMI connector
> >> - microSD connector
> >> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> >> - MIPI-CSI Camera Connector (not described without specific camera)
> >> - RTC with backup battery
> >>
> >> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> >> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
> >>
> >> While the variant being supported here is named "Ripple", shared include
> >> files are still named according to the full board for consistency with
> >> schematics, silk screen labels and other SoMs on same board.
> >>
> >> Description for microSD is shared with HummingBoard IIoT.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for the update!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> >> @@ -0,0 +1,17 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "r9a07g044l2.dtsi"
> >> +#include "rzg2l-sr-som.dtsi"
> >> +#include "rzg2l-hummingboard-ripple.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
> > already includes it:
> >
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> >> @@ -0,0 +1,125 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > Same for patch [09/11].
> >
> > Patch [10/11] is fine, as that one does not share
> > rzg2l-hummingboard-ripple.dtsi.
> >
> > As the rest LGTM, I can fix that while applying, so no need to send
> > a v10.
>
> Thanks!
>
> Since Sashiko also found a small issue in patch 11/11 ... v10 can still
> be considered.

OK.

> To the includes, I would actually suggest a different solution for the
> duplicate include,
> considering that I got confused about it:
>
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> index 493a2b9b51d25..95a36f8804b55 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g044l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzg2l-hummingboard-ripple",
> "solidrun,rzg2l-sr-som",
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> index 3df7c67d75a25..0c73871524541 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g054l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzv2l-hummingboard-ripple",
> "solidrun,rzv2l-sr-som",
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> index d5bd9b7de4282..aeb92630f4c6b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -3,9 +3,6 @@
>    * Copyright 2025 Josua Mayer <josua@solid-run.com>
>    */
>
> -#include "rzg2l-hummingboard-pulse-common.dtsi"
> -#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> -
>   / {
>       aliases {
>           /* this board does not use second phy / ethernet on SoM */

That sounds good to me, too.

BTW, there seem to be more commonalities that can be factored out of
rzg2l-hummingboard-ripple.dtsi and r9a07g044c2-hummingboard-ripple.dts.
Of course that can be done later, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
