Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2F45560B
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322202; cv=none; b=M1yDjSft71ivY+tgdjNYs3DgEXBplhHUyJOyqwG7pTruEzgKOe80GJQtaAQA/gWYrdMpHHITwyaeOuuSCfQPBXzUnrmu7EPazhe9V9FURytHS3UsnkOo+L3bFB0oNUM3jQCIxYnuIL5fc6mRE3lEdqva4apFl5bvBSssQX4tZ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322202; c=relaxed/simple;
	bh=LdmthTFaZ6Cx7odqrAcqzO4dhbSuBO/RNeKUn9ozC/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unIv459agbkBUULJNEv7EstGKUwo1/6c9slMkhKMfbJbLfhGxWPT/Jgc2Ptofo/xaouSPRwfw7+OfYa6LF6nEwXT8puDd/s7/S1F68NbD0leYnOwDBWjkBCuoCszwq0H7/tTL4jT/5b5QEPephvxT15rsQhgbieMFLBGnY2/zQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1480174137.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 00:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322193; x=1790926993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHrY14evUZl7TkXTojoWr/b2Uu7Pe/dQ0XVSo++s0Jk=;
        b=AO7W68W1e6kJgZjZV0DFJYWI4sCDAhq7+3MaQLM/Kx8OmEsfHDL+lmS/MxyEK5c9Uc
         QihINemfNWXk+UvuMqYes5hWObwF7BIWknDN7p/nQOpz/G8mh8bgDXJo19bRJDEgsPpE
         cj0pxxzBoPoOnn+M2EAymOVwX4jz2UOcJd4NyWt17m+Ennj0KK1eQmvmWpLIiVTQrDrC
         XD/m5mJSYDGPYzxWToO54iuLfIgbX818NKRYMAqXKN5CGBopFwWY/C5XO4SV28+lit3N
         FT/kxN1wDFZz4Ztn9VdNZlCqY3MMFq2W7nInVNZNmkrkBPUbAfKTubDnnP7IMFth7E3Y
         ndtw==
X-Forwarded-Encrypted: i=1; AKwUvBzzze1j95zKwEReC/MyrTwrkwnD4+5CujRmIa/ISa7b3MrldFQJjinjB4KkEp1MPl+27NeGrPlboO0x@vger.kernel.org
X-Gm-Message-State: AFuF++mIGosut3cy3eNXiegs7tEFMLzkIStFmylnLxKrpt1HfhbG6DJz
	l8xH1fzgmzmsBps7ENxVDmZKM8lSq3vLhuNrbaaJhaFaCqQflpMEj5c/wzeugOLa
X-Gm-Gg: AYBFou1ZwJGLT02bdcKw1cRlGHw+2VqDvl9L9ORvEKX6ETo2l//hw3RZ63ztiTp7k0W
	C802fHkv5bPmJB8a87SnQVLL8fJ5rCycxbyeG0Ugb6MxDLnV3thosgnpXJCyqnUgQn1q4ilMKDl
	yTg+R7hbamH+zEhlvZWyiVkJgJKp4mSe38+v8iN4XoV9QeUBNS9i5PYfv+Syb2GV4CDM2p4M+FJ
	X74Fqt3VLi+Rg7Kj0FifuBxtiVMJq9fHRCaCNTvewDcSM5G35N45qH/Ccht2PajtEA7URsbQqFL
	ue6ND6Z3y4BdAnDlpfm3+rP0l9BqyxI4k1rVuhH+3a0tHGUAXoNAw3QaIudawadFbbeYxv7P17c
	4jVIf6fznnkxFiY5qo0U20gNJ4bgowmK0NeCDoqD06vsPoa7EQy8Z6wiRyJXVt4fWc7qyNBNIGx
	S7Wx1Oy4DfepGF2RAxtfd8rrui99MnwrvWOdAr11E0W+WIwRtKluLIM33USltf2HwTZoDbOpfIk
	r0HhyDeYgb1D4bn6qY16K89brYIRwdYJWgDfg==
X-Received: by 2002:a05:6102:3246:20b0:797:c1fd:9d87 with SMTP id ada2fe7eead31-7af1c68ce3emr1738172137.2.1790322193204;
        Fri, 25 Sep 2026 00:43:13 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9860de81511sm1709309241.2.2026.09.25.00.43.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:43:12 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so406173241.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 00:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPLlg/9ZwZNYgLNeJXidH7l97HRLord59EA0/S48ZuTlEW5NTeJvHT93eNC2IPsiXzXP8cJg04f6tT@vger.kernel.org
X-Received: by 2002:a05:6102:3246:20b0:797:c1fd:9d87 with SMTP id
 ada2fe7eead31-7af1c68ce3emr1738158137.2.1790322191996; Fri, 25 Sep 2026
 00:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111349.52250-1-wsa+renesas@sang-engineering.com> <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 09:43:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com>
X-Gm-Features: AclHuK85B8akfPcq7Wm9lfgYaHe65iE3-4i39ONPSyetOTvniQxGh_v7KkpSaOQ
Message-ID: <CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 17 Sept 2026 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The RTC on R-Car X5H is a bit special because interrupts are not wired.
> Future R-Car Gen5 SoCs will have them wired again. So, create a
> dedicated entry for X5H without interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -23,6 +23,8 @@ properties:
>            - const: renesas,r9a09g087-rtc  # RZ/N2H
>            - const: renesas,r9a09g077-rtc  # RZ/T2H
>
> +      - const: renesas,r8a78000-rtc   # R-Car X5H
> +
>    reg:
>      maxItems: 1
>
> @@ -52,8 +54,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - power-domains
> @@ -66,6 +66,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,r8a78000-rtc
>                - renesas,r9a09g077-rtc
>                - renesas,r9a09g087-rtc
>      then:
> @@ -75,6 +76,20 @@ allOf:
>          clock-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-rtc
> +    then:
> +      properties:
> +        interrupts: false
> +        interrupt-names: false
> +    else:
> +      required:
> +        - interrupts
> +        - interrupt-names
> +

Sorry for missing this before: the "resets" property is
completely missing.

>  unevaluatedProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
