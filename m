Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11621255A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966322; cv=none; b=D5IJxFO5GtUT192n9oalZHjnN/PUjilDxWUyqEVRy6MHeeSaNMOQYlNWKjZRN7fnYQDTtdISf8IkEtNDzyQBl1s6oFsE7NaQzcYt6SboXOW8U0GWEOU0RXdtTNoRFgI/qDajH3s8dsKnILzh7Nse7MxqRVIRlRcyPV6t4HVIZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966322; c=relaxed/simple;
	bh=ukZ9FK4VGWfiaXO2VPuEc3ogAHyIjVxYKoMVyr+5s8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI41vBt3iXhHabuXGOY1sRjVvicI14GflguKKHEPArKd4ppt1ThkpWEMwmbKXi2o6MSjPexlmK45t7O86u4m7moRzxWrovP0ZNcPGc0AtFM/GSsFjy5mT1q99l4+7GzyZo1oAMNjFCzeObnqjRJacoU8e9askgZekWdJonFELhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-62f534f7036so566662137.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966319; x=1778571119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0fZD/PSymOwfq/roAe5oPCoIu7rlEolsxxYooXw1Fcs=;
        b=c+A3v4WdinKLTUiv/pJcrVnXQmtIkZPzbq4yMQd8xC6ubW1IBScUUYCN13J1QXcrF8
         /f0PDB0nyPrQpy1OTjgx5Ihq0lW5fYVAXc25xKB7s2y6Ecu5L9MYfS9qBtNRgdNJXQ8J
         G4zvRVjpHo9O44NDjoqbkTaviDDv6fNVfDhUn05ZL1hXyAYFVNu/QvRa49ibpc8DKeOF
         ETY3Moe1soeaxaVJ/9QtVF+d79Ot6Hkr5s/C836tRiafbThP3dsa+OrT9e8RWaGh1FJW
         a+GaEyNRM6L1ZLqBfO4XOV6zBwW9C3DTTgD8+dMg8Iqwhnyccfzc+3+HvSK7LWftGepk
         /XwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mH3SN3RAmbmzNQEOcbqABpkK1qYUunqSv/RyjPs0Uof1lEiA8JLHW2qhX9fIvj3NKfYD2X1R0445k@vger.kernel.org
X-Gm-Message-State: AOJu0YyiDvRzPbbJrsBfjAbvztSxJK0RtRiNI+TrUSTEtZm03OOy4qxZ
	37d2x9e8v2DbPGVlZ39Ctu2HK5wc+L0s7kKYU85DCyDrXgYxi+zZ0clF/IS8nmcv
X-Gm-Gg: AeBDieu9vcxsSM6ylZ5KihARDfHFB5kc1SEkQdjm3JD9BJ6mXsjVwtNYDaXy69EMQfF
	0agUaNQwb5ISaDbVUEWq/EfHxQnrlaf62oRprXByCawAu8INkeWsHQ4y/HddEtAn/X5cG9lb3qb
	ioYXohwHO6WM2rQrsWI1BTg55pI7N86lTQUKzOxvEmljpWRhoQ+AXd/DiT8qAhj9beg5Ku+EcHt
	+9gwQYTNun8Pk5s29y5G5XP1jMXSVUpW3NCppkXD5RGftBZ9xG9aS7bWYe3ZqzRCwpbZTxwwP37
	NaP5yHhiABM6YsWjcYDBAedZEhNRNgjmC6ADbjsutVdK0Nfd3/kNmak48sEmTQ1J51m3MBptEzg
	aVNlIZ+s7A94mcmKkVhTuJPCqcRVs/muELedLTjPdcaC9cBcVEIjCjXE9GNVZbGHg3FY1Eib3CZ
	5q6NVken/UR5obytg+CEQr4a8LrWajYoDtqqhjlddNDtXlhDUTZZibC+QQeoGwL+dZ6jKMaTjff
	GI=
X-Received: by 2002:a05:6102:4489:b0:60f:f543:232a with SMTP id ada2fe7eead31-62d84a67b82mr6257676137.2.1777966319422;
        Tue, 05 May 2026 00:31:59 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0902d6dsm6403255241.6.2026.05.05.00.31.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 00:31:58 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-575320e6f2aso1018065e0c.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/6isBe1ur3XAFHzWj6T8fnmMLjQX5PfTcUHU3ax6+IVyQ6OXpsey8FW4HrUmRnnHNqi1Nnwca13T3F@vger.kernel.org
X-Received: by 2002:a05:6102:809e:b0:605:6089:674a with SMTP id
 ada2fe7eead31-62d8754d144mr5578911137.23.1777966318428; Tue, 05 May 2026
 00:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 09:31:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfGA6yie7FJ1p5Vo8pzYfT7JaapVKKs89zDajyjoYdyw@mail.gmail.com>
X-Gm-Features: AVHnY4KGVyBJgcrD6fwdul7hiswvhvhZiaYkMacUewIFbE46z83RiXF3MOHRmi0
Message-ID: <CAMuHMdVfGA6yie7FJ1p5Vo8pzYfT7JaapVKKs89zDajyjoYdyw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L support
To: Biju <biju.das.au@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, 6 Feb 2026 at 12:22, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the support for the watchdog IP available on RZ/G3L SoC. The
> watchdog IP available on RZ/G3L SoC is identical to the one found on
> RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -18,6 +18,7 @@ properties:
>                - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
>                - renesas,r9a07g054-wdt    # RZ/V2L
>                - renesas,r9a08g045-wdt    # RZ/G3S
> +              - renesas,r9a08g046-wdt    # RZ/G3L
>            - const: renesas,rzg2l-wdt
>
>        - items:

However, there seems to be a small difference in the formulas for the
timeout register value on the various SoCs:

RZ/G2L, RZ/G2UL, and RZ/V2L:

    WDTTIME setting value =3D \frac{WDT cycle}{(WDTn_CLK (n =3D 0,1,2)
cycle =C3=97 1024 =C3=97 1024) =E2=88=92 1}

RZ/G3S and RZ/G3E:

    WDTTIME setting value =3D \frac{WDT cycle}{(WDTn_CLK (n =3D 0,1,2)
cycle =C3=97 1024 =C3=97 1024} =E2=88=92 1

I.e. on the former, the "- 1" offset is inside the denominator, while
on the former, it is outside the fraction.  I assume this is just a typo
in the documentation, and both formulas are supposed to be identical, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
