Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6813DA7EB
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445034; cv=none; b=Eg7LVxW7VE4w0UDc/6WJ6zoRcNq5acoILZnNEbux7HcLZDXw9PTNf1z9iYy+5itldCnc1GEaJGQJ5TaszXwawvmu9OOAX703LJRRLzahb2cW+pjBRbih1GtvUrVewwpAylehEdfMC3rPkBUzcF3GYe2EtBBEmg/odmyHrU83+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445034; c=relaxed/simple;
	bh=+q20ONbrOyxDkAN5+EHcA3ci9E6n9dWeyiwm4j9RLFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JiLZRRZHqbdlPeE0DcO7T3GNW9HC6xPXdVbzdLnzhBwEusf4BrSAl1/p9ITRaRippT71guk3+EI9COVwBBrMRC38+ugcTVNEyKVhKAKyP1TnIUmRwxP+2gagOoz/ezuabG346ngOtVvzQo+tQ0sUgW5duY8xkYvOTy3aj82ysC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9358bc9c50so367802866b.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445031; x=1775049831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stp9ZXzQjSgCaz4WCE1iOcAb662w0+RcOPCoDeQo2tE=;
        b=W45Ht2a0c76goLXy0KYzDDptm3rLl3qEc/OcxM6FO2XxLXiB62JkM98qtqO/PljCFL
         pPI0W3gH+de8guIEJSwOOfKTibJkasOkkc1d0ULBrG/XygkEDtJKC3G9TmVl/vOjZj+M
         OMkMkk8b+Wl2Zaud48e00vvQWEb34tcYjonWqTqiGclv82op8OFCbvx3Iw2k0UllqLiw
         /4eoMFwLnt5wMqA+rb5NMYm1FGsZ5HaDFECo/JFg0Gb6X79rhMe7irAay3yvXfIgl5Tp
         xRppf6T6p4K9dTg9VmS9dLZhxR2YX2uI2e/JujAsf+eX2stbBiL4jyZ9C4TdkPIxSQ/t
         /4cg==
X-Forwarded-Encrypted: i=1; AJvYcCVlk4T54cuokrx3obpq4EEIo9pkgJiQgWqBcTI2cwyUrqIIHBS1Ow+BvrxGcTRSvYWncUDwdFAP5SwT@vger.kernel.org
X-Gm-Message-State: AOJu0YwvrbIQEIxEAt0Lhym46h683LSDlaQum6P8ag9Z/+KcuqtGnteE
	DWLYqbpn+3xlbRVr4NNNBmY9MKeqDDeMw+CBww2Rme6AlM2T1PDe5HsfskkfRcV6CVU=
X-Gm-Gg: ATEYQzwy+OOFe3ld7Ec6uCKV4ymBZ9jjwZ3oyOfqIIQOXo086mXeiNPprpMajbbylrR
	rlAsGfZ7bGlMZa+vVedNpeoxE4oU6H4NRXHkvKe8HqZ6QzsVwNk/56o1anUs8appazNbqOaTgUX
	yDvMpL1D3U+7EMTeN7u/uc747pZHoLeAwHkRHZdvrOu2pTM/doUNiCZHg6sDaHLjGI61IPycOwo
	fPEGL2duNsT2SEq7hQI7AhI0VoWHyTR3BN9RMpQMVZuZWQl7qYYYr3pZxHYUnOeHDniGBie4npF
	XdoDem1pxf6D4P6DCKZgKRPclrnjvXkcfpiC08FHmanDcmD9CaS3o/outkFG8oEUiTXdyLEnHDR
	N2vKgeEVKn7HzhCC1gqqolSOOv+jFNb7M/AkC3Sw6M2nN/lzzfkWNmP5FecwLr940tNbMTdrE2A
	viaesA8paaWn/LasRfaHNoTewbDkr1w6I+cRyb9hC7P6hC6kKpyxJKLMYYlVeV
X-Received: by 2002:a17:907:3e1c:b0:b97:554:f12e with SMTP id a640c23a62f3a-b9b0f0f417amr175963166b.14.1774445031249;
        Wed, 25 Mar 2026 06:23:51 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fd7147sm791202166b.27.2026.03.25.06.23.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:23:49 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b97bca3797dso311727666b.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXI/B4t5beMzgf8PPjPhIU25kEFsngPOYoHrTDKg8q5pAP9KJU1kdEzl3mrT7m59XA+QIH3IS+QwKSH@vger.kernel.org
X-Received: by 2002:a17:907:8690:b0:b98:2b55:f7c6 with SMTP id
 a640c23a62f3a-b9a677f3293mr242621366b.57.1774445026817; Wed, 25 Mar 2026
 06:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org> <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:23:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM5W7PLEaX_7SEwxXuc2aUvRUX7L0cT5Fg7YEZ1n3AwQ@mail.gmail.com>
X-Gm-Features: AQROBzCABV8bWPZtK2TcL9-PzQxkhTblJ0GblRNzGWfFAoDGkar56sRfrxg7ob8
Message-ID: <CAMuHMdUM5W7PLEaX_7SEwxXuc2aUvRUX7L0cT5Fg7YEZ1n3AwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare Display 13.3"
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 17 Jan 2026 at 01:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 13.3inch 1920x1080 DSI Capacitive
> Touch Display on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Overlay for the Waveshare 13.3 MIPI DSI panel connected
> + * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
> + *
> + * Copyright (C) 2025-2026 Marek Vasut <marek.vasut+renesas@mailbox.org>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>

This include is not needed, so I will drop it while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
