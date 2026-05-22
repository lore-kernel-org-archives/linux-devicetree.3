Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8D3A4F50
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456111; cv=none; b=b7Shrjckfofr2X/d9t8hS8nc6UCZqI0IGm+ib9Wdqef6EUuajjcP8FIdQykgT50wMpwi1ERe2udSVyqaFKtnuAgNsioTUr7ZzrnggUPV7DE87rqZ/4AHBj18qI1qf8Fa9wxC+i48mPueiDDs23ScsuW2T1ZHOnUWbcn/vqU0dek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456111; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWXPyiN9CDZwSEvZl2rzvSlFx05mz8xrE8ZZhICRb8scg0SL8CAAoOsgiWYqiAC6UG3RCKM2sAwVgfs40QG+6tZn+/8EAdVYVdvfoGssIOXfSkwIfS1N4uQjCdotzzsaB4wP30qolJV/hOYbLNggLbI9ofDg0ydxHVMImaNJgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bdce61897ebso137953966b.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456103; x=1780060903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=Gmq3H5t+ELDHgBI6Vm0WPpJ00lvOUGj9nP+9OBBwM7ZVMR3UGtmkqP2bAm/WlAcimq
         /u08GgUEYldfFLLvbfGvcmpIfWEDcDAYYhSyfTkTATJu31HRbdiWixn8VdsdmJV17gls
         urPmKz+h6YiCJ/NQGiOwYFkOjGBj7uLBmNellMF2YZZ9IfagbDCw25Soobv3s2dLedXG
         4KNc8Rfw3Ey/wEsVlAkD280J2j3XYCs4TnUkqODRWTz00ibWeUgHYRx3T0o93oykn4nP
         1vAmsMFrAiLBgCT33f6eedxgf+ACC8O8smzWaQuA8eQl4CZQrpb0HFw7MYaoeHBRmJxN
         dvRA==
X-Forwarded-Encrypted: i=1; AFNElJ94urstcBxi/rll++KEuSkCjJ6HbuVGZe264o0X1ZMEFGZ021kwB+NBf1jOpfJ/eI1fsvwvqrCKbqoz@vger.kernel.org
X-Gm-Message-State: AOJu0YxUa5DGdRqWeBVxy2zjyDc96OaJeWRwOx/sSsXiym0S+uwuM56S
	+A9o80pzAPA/h1FiRjY/An/rRW22p95rUdy/gaWOnqBFewKhKCXe+tl7NWcfyTCk2bk=
X-Gm-Gg: Acq92OFuBCHbAOF4JU+Nt3WWOLTmYA6gMcCcxz4SQtMflDX/Vv3K22f1yWOjovI28E6
	fRNS4mkLQu1mHvhjiTqgzWk0DBXwsug/rhp9lWJMDD9CIzbS2t4+214dXgQVjZKA5QTxsTBO86q
	oL/AYdcOfYoMHu6qktfLTzIAMQEETjK0sq3zWoR7hTERmW2rpjJ0BqXvEx0i+NGm/XM3e/nkq74
	eHwxAJQ1g03NcZpJGVSv4NfOvVpu+wlcdUemYl/XmgBImOj5Ga45JRkwbNd7Fav8jLYPQkS+BjT
	WaCBV98atweeRSIxbaYzQruHlbzQkafRxM/upQqw+M+bWS+0GEoA4MBZ9O6WftzuhyjSDpczELW
	JlzqNqtnulgH5D1YIuRBjcopN8Ip7NWfnjqPIpL1uSsULLUKQBpJP5Ps1RROaLVdV9bmKi2pSiK
	ARK8d7Kf623Za5OzxEewgoAjoMGt6reoPWUV3VPAFN9b9I21WGuGYrVagNMeOSU9c2o9hCU3g=
X-Received: by 2002:a17:907:72d2:b0:bdb:4cf3:7035 with SMTP id a640c23a62f3a-bdd253390b1mr222485266b.4.1779456103369;
        Fri, 22 May 2026 06:21:43 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc2c45ec9sm55750066b.14.2026.05.22.06.21.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:21:42 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so4189010a12.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:21:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4YGDs+IiXSBBIXnU96PaE9fqtxmzdvszKyZ65hUKRPTAky588a2cSLlQmQVpAVzXqvXIevXa/LcyW@vger.kernel.org
X-Received: by 2002:a05:6402:40c3:b0:67f:7e9b:afe8 with SMTP id
 4fb4d7f45d1cf-6889c4167e7mr2035745a12.6.1779456102329; Fri, 22 May 2026
 06:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXULb8d60kxa6aOSy=uXhByyHWQbZaEY-EOrFWdcYPaRA@mail.gmail.com>
X-Gm-Features: AVHnY4L5XJ7YwASenMlXUKivWU992B_gEILaXDcRMH1AAUKnrMIEZvkG7w1HbsQ
Message-ID: <CAMuHMdXULb8d60kxa6aOSy=uXhByyHWQbZaEY-EOrFWdcYPaRA@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: renesas: v3msk: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
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
