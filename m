Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FF3AB490
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456233; cv=none; b=PZ+U8pupIk6HhLwyNZR0kwZZFqlrGyxntGW4c6BnglNYwuxncb8J/UmvSMU2zESe4dkgpOn8zpLPl/HfNIwn/l8Nyk2yG5WYEQlIC5uK/+pgym7UblGQgJ4h19TN82HdRZY5QIuXYK8fgLClvFbXMPjLvd7I2SHzpGGLTMDY1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456233; c=relaxed/simple;
	bh=68A+4NpoBqPQ4SaNDjVvJdhq8EIacxhjPpQR5/frgEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EU4LHUW7dIjQXjC6Kdzam9IpNQHCvbb0p1+t3OcM7Pl+2sJVXvnyJn98iDXiZAx99Sx1aSO51JKf6RYwUfi1npbOL4BtfpDEXkJOxmFHOU21PtSwGsUfiesBSnw6yJSu14Pwsj+gsCtSbRfFPByntNXgAscA41Vq+B1MX3u24qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bcc9fdc959cso1355554066b.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456229; x=1780061029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEDEgL2tLkOR4zWl+L+uuKuVbGErUH4r4hxSDSLZGiA=;
        b=dDHNFN/l3/XxDHlhjNR/Aul+s5ih4D2NjrhcCPJ7oIW5MGxfOxrjSAuMAPEReY0U+n
         Sc7zjC408YJYswbNKDanEr8SOOQ5kjty/lnC9GUalrOqFKzeRbzZWqMW8/GAbfr6A+wF
         7EUjaRs3p0CnAApbc0xYVHJIJ2dlCne+0dMXurj+tUEKkmUQAfJLihnxoS0gr94GVkj7
         2JMaOqH26GrsbvnQ7vJJYOY70Zdkoc+YCcOCjtqulofsWJBOV2Yt9mnWu2u+is9qGEPm
         s0MQ/2jzpxZqHtU3PKmDETvgV9rVfyB88d+ezAK8TagkNKDchLqb+y6VjqqYbDo6a6hB
         NsBw==
X-Forwarded-Encrypted: i=1; AFNElJ+h0cjhbPJ72bYEpjqy76qFJzQoI+4OqQlP08FKNxr3gunioIYxlL2N9KumrOCeqjxkq7+ee+K/JquW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7A0h0eB3WmWwVSyf36nyO6CguVPS8u/tOE3GBFLe99GwYpGs
	UvcvtdQv7nEA2zAb3edFOtnrBYvQ39UrcRiGw1D3ci7SKKyJcXl+1t8E7XhWc06oOGw=
X-Gm-Gg: Acq92OFEfzbOp7TRxf1r9fSO5fv17ZKOIoaV2hutZCHb6CyrqBVlZ5+/JhI4RFYQ+bd
	pk4gFssVkp9yiBOBOIujAAVjV/x3W69r36JrxXFokxrfKgc2Lxx39e8DHCPN72JSW3nkmKHQT9z
	UVE8v6Qnct82sHo0nFnQfvRiw3E9WRgsBNdiikJg/r5yS1H0gD/7bJyAc+SwQTOhHXsXyIiSUDh
	1uBf9qGunjNM/9F70VWR8uXjXNfF0nbNmSAAoeONksT06HWbx8ssZx34jPAjUG5wSNXV/aYUc51
	Z8G9r1NnJyF3LaqVpBV55kJKt/k2bx3kHWcIlnwrpFy8BfvjuMOiWKnc2sdZPiNX1JGVijdhn71
	dFX4IhNdH6tUKetT0a4b7lEQe20tTZCylSz/TbiKsjiVHIfqxsS5eXIhumKzYU2XGj2W9v/3RuI
	6TFxZgDQXJHi00h+rFvOhfdzjheqJ1eW0RkoF4QRVcChc3g89x/LiNJfWT5DXH
X-Received: by 2002:a17:907:3c82:b0:bd2:c919:22c9 with SMTP id a640c23a62f3a-bdd25fdcb17mr221810166b.35.1779456228673;
        Fri, 22 May 2026 06:23:48 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ed2d38sm53749366b.34.2026.05.22.06.23.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:23:47 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso15144075a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94mc7dMyf7i5GbiiBZ/6lX+PJcpqujFJ1sxDY+8lR1aNz4+OCg+k+0w6065UN8ZPldxCistSveR3Zq@vger.kernel.org
X-Received: by 2002:a05:6402:4491:b0:670:8b30:a8a7 with SMTP id
 4fb4d7f45d1cf-6889c2a41e0mr2094221a12.0.1779456227391; Fri, 22 May 2026
 06:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:23:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV13=yJwuCm2PYgqZ3uWzH4ePiA8W0KOBP-3DV9YGazGQ@mail.gmail.com>
X-Gm-Features: AVHnY4KmwTbG4JqyJfdjScRT_TVewlS59f158FM_wCnR3G3Yqp4fZC7KAhrzR-E
Message-ID: <CAMuHMdV13=yJwuCm2PYgqZ3uWzH4ePiA8W0KOBP-3DV9YGazGQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: renesas: falcon: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:44, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
