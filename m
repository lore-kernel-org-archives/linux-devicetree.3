Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4637131D381
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208125; cv=none; b=i+gRqEGASkdxpbBmhCBBBzBQTEgcNKaUfxmFfWRS7pWm8LJVJTaY4PW0jbehma2yuSEAYQt3utbB1R9Sk2uQ32B7pCGFCdicfl+nMA7sb9yxwtOBuwPH6keLgKdKpFBYbMkSFbKRTR7ZYxBUIK8UaEDZxurio1vJX0SvWaNWxY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208125; c=relaxed/simple;
	bh=/qrkEi9Dzzy8A0lleCtw+nwQnl1zxJvmQgStyC+wPtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyZut6T9vX21lx3hZ3MZacq/TUpXMimvgoRcpMk3PW4pQ1wG/GbPJstxxUogN1EM++VXlUnWvKzLrD3z7kwiMPysCf2NnMt30WmmWTCQ7/KNEhj9xGkLynZWrH/snctkuwL7QsnJAYjMp5Ra3iQxfEWff21N1lDoOBAyzDLv3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d8365c1efso1119118e0c.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208123; x=1775812923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5B2pyHP/JliOmf6Ji1g5Y1Ga/IgQoI6orIY2xFD1nM=;
        b=IFWisrMKV3twEw8W83cdB3mOCs+XnjPgPsdtOF9HORUstiejrJ5tWDZrCzpsLh4urX
         pmJdMFk4WZRzwNRVq9ThfyoBOBtif4HMC8HG+bLjIjM2roNkBt9C6lL3kueD0c95ZUXU
         U5+3qpNIf9EyMauDU1llZj9/d+96FJCP4l6fcFeh5sIJwue4JViMviiB/yv8tUG7lp1i
         lW4gxyM04HFwF6GWOn6N7u5Mhcnn3pOiYgdY+uNuX83yVaCu57p2B1HbDRaIrj/s7Cwg
         0Oo/0FOViqsNSQ/cwQFLiKkCYdXhndxIXQTPny41mNlwH1wARDBwJie2MlNwKlQAMU3b
         WRTg==
X-Forwarded-Encrypted: i=1; AJvYcCUZgBKdTIE9yBwpd9IaIoJ60eIc3m/SFnT13fttkmx/tKL9OyMBlZf3OeLiqW1awEyS4+23GUSMU1VZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyida9w2Zc3T1OA8hntIacAnDj+UzpAzuv/aJ1K88wtD0XTeUIx
	s8hwETe8p0y+i6psGvFQufniKs5SwGUUQXlHxkXnYpNLUKzNQ3rbBkF92ikJaXLo
X-Gm-Gg: AeBDieuBbUhGlIAA7gdHnPqVKzHngy3dSQDTTR8/Fg4VZgIH+3hxg3jo784vtgOpbKA
	pbJJsLi+SZw6LCPTCXpBfm/SZH4KyVIa9jRklbLSDu8TZ+pe/EhOuo00V2522eiQqG7AVNZhwxu
	3U1kEYiQdfJB/1gEiUoDiZ2lWFoHrEn7J+5/XuowwsMPpJO0gUoIC+mrBg13m1qLPzNiSQ2/3kt
	cA6wD+B35hujHPCftzhcMNuqTJizF3bJwJcM4fFnkIBsRcSQkiVudFvRL0C4fQitcdiCjHdkgmp
	BqxkqNeMkNuKm8AFAE7LKJS/uF/EyonIILP9XSgS3JvkGVoNObKSEjl3UpdIDXD2SWTkDQOilbo
	wI11ZEShnfgcVBZBiizL1/FS4ekCRWgyJUfkWCizPXRJ81b73wG10ndM0nZINnRRiGQ/tCDlx7J
	f7FNabLTkKalBb4/nVGIxRpQaLosW9UCYBkeiNGkzbdypT8X4LRMWP3RuPvqen
X-Received: by 2002:a05:6123:4210:10b0:56d:394b:63e1 with SMTP id 71dfb90a1353d-56d9f0d261bmr1443890e0c.4.1775208123102;
        Fri, 03 Apr 2026 02:22:03 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba80290sm6459689e0c.3.2026.04.03.02.22.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:02 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-605b3b6c4dcso107128137.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:22:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBYjabuQJfhYNWS44LQviLQz7g8PI17GBYSMDz+DS2qEN6gOPrfAl4rzlERY+/E4hbX5V6837zSgBf@vger.kernel.org
X-Received: by 2002:a67:e70d:0:b0:5ff:c40b:27eb with SMTP id
 ada2fe7eead31-6058a4b3fd6mr2323242137.3.1775208122603; Fri, 03 Apr 2026
 02:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:21:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTV71efsQ6SzdXdsnHHb93Gn6sbNNEjSzVLZ0_w==90g@mail.gmail.com>
X-Gm-Features: AQROBzBnDgdH3_Oj0-6Y6WYqcbqwAQ1EOcuaufJmPvw1l1BD18PtBKWpQ0DK2N8
Message-ID: <CAMuHMdWTV71efsQ6SzdXdsnHHb93Gn6sbNNEjSzVLZ0_w==90g@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: dts: renesas: r8a7778: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 28 Mar 2026 at 00:42, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7778.dtsi:43.12-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

> --- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
> @@ -40,7 +40,7 @@ aliases {
>                 spi2 = &hspi2;
>         };
>
> -       lbsc: bus {
> +       lbsc: bus@0 {

Note for the future: if we ever add proper LBSC support (including its
own compatible value and reg property), this should be changed to the
address in the reg property.  This applies to the first four patches.

>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
