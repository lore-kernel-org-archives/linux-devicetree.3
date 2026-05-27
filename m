Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563A42B74A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898479; cv=none; b=Lk3454BA7+26UuSXVJmi/T6EBl/pqpbZXcuPUy+L+miywPXmG+1d0v3YmyfX8nyAcBMFo4k6ze6CaPWC9kKGl0pNbly6tInIdz8KIcmk4LDTBAjpvW0txNu64eIROsIoAxkkEuUiDYV+3XNUcAc6SIqTJIEY/YSeI5V8UWCvL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898479; c=relaxed/simple;
	bh=XYayIj2bcoUQ45OGK87OeopF01WpTuC4QqfWdPm3k6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucRZ2Twb238ZdA36MXg9rVkuGsBZhX72sbecfHgx/5FXzhH9Odg/0E0cMtyGPPjfmFC/zrkvTR44dHgc8ZHiXDGQ1+qDlH+0ADqkhd806ZeM6zk1ju3Jyd5yTNyNovrFy3qaBq4nNAT1O9mjvVZYDPPOsJ2VIoljVOsZGmwLJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57533363201so4025690e0c.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898474; x=1780503274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxGsTvcdtI7PYt4KC637Hd2zpBAihaHwB8QPjSFnO0U=;
        b=KFY3OhdLA40N/YRxY9d+2yeZVfTj636yqDpIxX/YbS6wc84OIG2q5yt5vmvA96DY2z
         0TSFUqQcfcQw3fsVAEGpb6ggOwSSMUepeG3c2th68m8DZYeyPD2/KzAFPMy/L9E+/sIj
         WxczlfwWqkUGnSGGPZicYP3rrAV6Oatp6jlMfNk2lcXE7U+jp/YX7wKIEagi248hMoTe
         2MXhysk+OtzRxvOJ0CXi4qYSktPz+oHkFmJWnlYiUJ0U5hdet8BSOZIJDcvE9pTzuTjx
         m4SUaUGsfWn/Hv36v8P3qaOprh4Yv9rmF6Z0dZ2QcGnPlh5j15qWgk5SSnCz8fxzE304
         P0hA==
X-Forwarded-Encrypted: i=1; AFNElJ85OLeLt8+z4gTcor4Y3BkCk2D/ICW23sOOQqexFNwBoG6dArQ5AXfU0P6+iGPWPHVJUFRI+6ajN27O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4R2MJQT/t30gPJhGa3UOgQGx6Q5mbfA28CjOldR3OTf9v0jzO
	YKdNnv1KkBZx2Q9qyBu2HhudlV1AKWJKJjUPHaeT9JfkNZ1lZEKyO1LZbBrn9GdChT8=
X-Gm-Gg: Acq92OHBTo9QSEJvYFlvtU3RUalTDP8KleBkQrDva+174uSPboz5x5A4HVg8Wcz7ovU
	Zk6NAZe9kPjrhl7+DbOFDBRrRcKjjD9jAZJ9j89OrlabWU+PF5aB+f98i77/UT5LOYa2wveVppX
	2s4fVijNSQDpsmb13vnkUpILEP5789nHO7e0/gLkeRQs9qgS+53G5NaiEo9BLCv+eETebge9cP3
	Ez58r/IaPj4+NBj2IkeAShlclyYagtXRO3RxXZo1b6vkGhxUNxO+T+XD1dMZrEqVgFwXn+yKXG7
	9fV05gYI707vAM3liVrWh1itSCX1aA5qP0yLYb1H2xGKkdWWCYj1gUTfV+gR9Ge3ED/ZG3albjg
	GTz70aTpu7DeINPL4BGchyeqrWycIbMEb4gSKRkYO65BR4fcOQxDJ+MzebjwkQtFWTCRXy2ltKs
	6LV+PDZ6pbqXjfKil8NF4gqTjW1hvRW+JBiolU6K7NWNz/aNWlH53iS630qVwHbjth
X-Received: by 2002:a05:6122:a0b:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-5865e4a60f4mr12053253e0c.1.1779898473475;
        Wed, 27 May 2026 09:14:33 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f3c003ffsm20896571e0c.8.2026.05.27.09.14.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:14:33 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57533363201so4025684e0c.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:14:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BKTfY3fXvZGNiD3MDdIvrBpCwnReTYrNbBuRWp6JW6hMLejD4mSYl572LAl0mLUP5pbW/ixsxWpuc@vger.kernel.org
X-Received: by 2002:a05:6122:1d4c:b0:56a:9841:9f81 with SMTP id
 71dfb90a1353d-5865f81d411mr8287657e0c.6.1779898471992; Wed, 27 May 2026
 09:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:14:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmZuoMaF35wBAtMqB5R7wy6ei2fV=bcvdju3AFQ_DZjg@mail.gmail.com>
X-Gm-Features: AVHnY4JrXSmqNZqmujlKDflqJnu1Nl8gCkfriUHTc0klgy__a4lXTYZsbOBs3IU
Message-ID: <CAMuHMdUmZuoMaF35wBAtMqB5R7wy6ei2fV=bcvdju3AFQ_DZjg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: rzg3l-smarc-som: Enable versa
 clock generator
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SMARC SoM has versa 5P35023B clock generator to generate the
> below clocks:
>   se1: AUDIO_MCK (11.2896 or 12.2880 MHz)
>   se2: RZ_AUDIO_CLK_B (11.2896 MHz)
>   se3: RZ_AUDIO_CLK_C (12.2880 MHz)
>   diff{1,1B}: ET{0,1}_PHY_CLK (25 MHz)
>   diff2{2,2B}: Not connected

All of these are listed in clock output index order...

>   ref: Not connected

... except for "ref", which is the first output, so please move it
to the top.

> Enable versa 5P35023B clock generator on the RZ/G3L SoM DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -40,6 +40,12 @@ memory@48000000 {
>                 /* First 128MiB is reserved for secure area. */
>                 reg = <0x0 0x48000000 0x0 0x78000000>;
>         };
> +
> +       x2_clk: x2-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24000000>;
> +       };
>  };
>
>  &eth0 {
> @@ -75,6 +81,20 @@ &extal_clk {
>  &i2c0 {
>         pinctrl-0 = <&i2c0_pins>;
>         pinctrl-names = "default";
> +
> +       versa3: clock-generator@68 {
> +               compatible = "renesas,5p35023";
> +               reg = <0x68>;
> +               #clock-cells = <1>;
> +               clocks = <&x2_clk>;
> +
> +               assigned-clocks = <&versa3 0>, <&versa3 1>,
> +                                 <&versa3 2>, <&versa3 3>,
> +                                 <&versa3 4>, <&versa3 5>;
> +               assigned-clock-rates = <24000000>, <12288000>,
> +                                      <11289600>, <12288000>,
> +                                      <25000000>, <25000000>;

Why do you set the clock rate of the (unused) ref output?
Copy-paste from the DT bindings example?

> +       };
>  };
>
>  &mdio0 {
\
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
