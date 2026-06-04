Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB4245BD6B
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576493; cv=none; b=Dj+EBieRMjr4SDqJlPYGp92snatN/8TrZk9vKaemRmXblIGQtFgnl9CpHRh3cW88g5fa2tW3WWmZHYdPOfVmD2cEK23/2/9m/ak8P6Y8jB/x6PxqIj74iUXkmo8srzo+MntKPFGhLp4kapZQWIIJlHm5zcdGdKpZ7LUSDU2vik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576493; c=relaxed/simple;
	bh=yW03jyIaXvDzqIO05bz6BGBjkIGqHU8ZE+ZN1NOsK4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZkDZkcIPZAFsC5SE707PFe9aRM9OOwoDhBMOXfZ/ij0AocOOTIbJnrwSUGeY8Epo8Jzc3/yfI+w4mGl9ihYzOghOldJw3o3heFubrVaUcACH/EXeexmApbR6GVHz1DrYVWk8djl/pHTpKA/nTtV/MqY9ynRrspBkvDMEenfy8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6c6507549c3so1241029137.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576490; x=1781181290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocjXr/qWGa2IO/F+fdPQn1MjiaT2nZR31qV/kAYxrTI=;
        b=aUNW1w90VxJepo7MGshMYR5QnmlS+9QMf/wPTEg59a03YTsDTxLfd9lKAgTGMmawDV
         ls1h4RenSQWv/PLUM5TgV7W2WsLZKtaGInUAaN+AsNtoLHYXPkrobGhAtK500h/VzAfb
         zFqCxJZ2A+yVMK0yJwuGqDvRymoCmNP+ORcoLCQmY+Kh+nP6dWX19VsQKChQgah/Z8ML
         jsKoEG4m2QjtaNjgXKpu8pSDrn5PPWDv8G/TeQaAwe1/UKXwzQxlEzw2D4JDSKxgq19C
         HMckKkU7CjqeMK9HKZmb6/jRDLGUt+lwE0aBQDX7+/ZjlIohDR7Wg0Gaox0B0SdgnvHn
         yQlA==
X-Forwarded-Encrypted: i=1; AFNElJ/iMJx1500D/IrmF33/8L1A7erM+NhsDEHgP6PoWAYAemEnwb5267IQZFZAK/eUaN9rW1+K5TGkMoCC@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGAKk7bYDCOH7yqJ5TO1Z+3q+6qiBUNEQzTHbw4UjRnlYQUj9
	Bj12ZiucJHOHdVdCyX5fIqhvy1wL1mwZvf4eIZnkkxwet9f+6LKZdycqPlAX6P5InM8=
X-Gm-Gg: Acq92OFBvEWZEAlAmljLqaz0Xf6qPzx7bGtNiPyhPMOJjoL6XF8CR5xdUb8SGUOnzMM
	TbvEQ8BgJCKm9ibyH/TxAaglpjjOdxk28WizgkjtQoy8/Ihj9hKbTUghGsGe1UsjXUC+4U1IV3b
	V2O1u2Ztm2YUyURGGNwgKXpPmjzQPQ80sepe5xY+QR5cnOIoCqwpuxmeVk+GGnk/bETdEn4xSsZ
	XoTgNeITkFq4T6pr4d6drafUvBUzIxOvlCOQ3n0VpU8RLW25QPNGH69aLoeVjhjGcDtXdueZZbc
	J5ZZgm+pu17p2hONFL3HeB6BvX+ynfhRalNkhTLcM7OGVt/8+89usVHQvDDYTZjqK4/1aZGKLW0
	bvUNIOFw+B8hxduKZnAil42stwnTB/QqiP9sExK/tYFwKvBSiIaBz8bEi6DZTvA5MwEzHbvM5YH
	QJo8aCuElKxiWS5d0mKoPGRDv0YVCZuKIejMxjOhHs2IY6HuTA7KX0dAyQ3Uzr+4OvIEhwZW0=
X-Received: by 2002:a05:6102:3e12:b0:65a:fec7:137b with SMTP id ada2fe7eead31-6f52f48203fmr1566600137.0.1780576490333;
        Thu, 04 Jun 2026 05:34:50 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb649b710csm4744054137.7.2026.06.04.05.34.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:34:48 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so1184782241.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bMj5KZUivLlYtys3lTQczITmqCA28WScLdYz+nDKH2JrIyL7Z6kOXiirmf/HL6pPMKm5c/DDf7Wk+@vger.kernel.org
X-Received: by 2002:a67:fdcf:0:b0:6c5:94a0:37cf with SMTP id
 ada2fe7eead31-6f544240339mr1047511137.8.1780576487197; Thu, 04 Jun 2026
 05:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-6-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-6-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:34:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSgVe4ufTEvrD0ATwApF1xwiVa8t=P9O3rxh=sBegV_A@mail.gmail.com>
X-Gm-Features: AVVi8CcBcbjPZ-LGjktNLR06D20t6UAro7xtsfCHuzIIFQf2Ba_2cx9aOlEskTc
Message-ID: <CAMuHMdVSgVe4ufTEvrD0ATwApF1xwiVa8t=P9O3rxh=sBegV_A@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add the Renesas 5P35023 (Versa3) programmable clock generator on the
> I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
> audio subsystem.
>
> The Versa3 provides the following audio-related clock outputs:
> - Output 0: 24MHz (reference)
> - Output 1: 12.288MHz (audio, 48kHz family)
> - Output 2: 11.2896MHz (audio, 44.1kHz family)
> - Output 3: 12.288MHz (audio)
>
> These clocks are required for the audio codec found on the RZ/G3E SMARC
> EVK.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

> @@ -130,6 +136,20 @@ raa215300: pmic@12 {
>
>                 interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
>         };
> +
> +       versa3: clock-generator@68 {
> +               compatible = "renesas,5p35023";
> +               reg = <0x68>;
> +               #clock-cells = <1>;
> +               clocks = <&x2>;
> +
> +               assigned-clocks = <&versa3 0>, <&versa3 1>,
> +                                 <&versa3 2>, <&versa3 3>,
> +                                 <&versa3 4>, <&versa3 5>;
> +               assigned-clock-rates = <24000000>, <12288000>,
> +                                      <11289600>, <12288000>,
> +                                      <25000000>, <25000000>;

Please add output 4 (DIFF1) in the patch description; it is needed
for Ethernet.

Please drop output 5 (DIFF2), as it is not connected.

> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
