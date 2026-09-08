Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF851356A
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868989; cv=none; b=ebW2rGqh7GSlAT9ka4TFGW7IDThnb9Lo2/aFLjqaf4hKg2m+6li2asfJUQ3buV4rYkrcy1SENDMAKHO1A1rtnyYIcpKbPFdvjPzDG/NtqbYo1JcuKGTZ/lNkVkBQP3LNSdZ5JsFDMA55DWTX8ImAiEpEDhZ+kjMe9WIOmxNjI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868989; c=relaxed/simple;
	bh=1KjGT4jEmlgZm57thkTt2U42w8uocIKFVbOmxzSyT6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/0gIfAT1Sjuk9rbzYHCGydQyLItssuICfeFQtMlunUC4WjX9uKDig1vcS00+243KnpRQ7oNzVZqx7euorG+BW6LrVLp6Vpv8fIe2XN3kSkGBjR+0BiLirD+vLqsFOQlViyHvL2KdJW2uF95fRUM7B6UcFJH8kgX6LnGCSeK9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c6559620e3so1915270e0c.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868985; x=1789473785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ewf6TAC6datJbrIguz8TlCYfKFGg/5aYhxsRPBSYo4=;
        b=VB3UnevT0s4HoCXjMzy7q00/qqCgSsAvQ4svHO6Olaabopc9XaVNOvkELnINTXpvCu
         /Ljt5j6QhtSLMiHHldCWAv05FXKb0uYCjCeIKTiFmLkt49lCo9SuE74nJRRofl8EwxZP
         xfqZUZSZbVBKg2ht2rFDSonEY/1/+2Pk3bCmrsvh+zIi6l6gPw6dXjETgfeksqAKlpMc
         j5o3g5lWJwnVv5HfQ5mxdadBBPt2eZoG29QfCZeK83B7RZ0HvOVJeT18ccgcRz5qTcFN
         PLOtYuMRAIlqcubMG1NuXbfuNE6+I+qMXRe9FIRncljUZURalMREIlowTgil7s1MtfaY
         eB8w==
X-Forwarded-Encrypted: i=1; AKwUvBwvUWWeJMOqf+lZCNiOD8BIwdGqyeg3JXhRaWRjcxnHoSVXe5xnWVOt9a1DYQ8RoZpO4FKSE686OIqP@vger.kernel.org
X-Gm-Message-State: AFuF++nq43G9VHIm61N8tnH9pb0n5wQ/oseeuzPBhAI60Cke8ZYDPOTe
	24D6FL3+hy10bfdH1QcH3QzEbEs1r+8293T7rercF87JJOzZh3NKPSOFfZ+O+iZH
X-Gm-Gg: AYBFou0Vx4SI1w6QiFpiRT9uQ+mutzuH2wMwBnz9r9H9gtLL4x+VhnTy1qEKwjVCfso
	ETcpr+9m9SZr5L2sCm7bhNVrrhOoM7wUJ+G7QVJDoy8UzMZhF+SP+HIiRY6FH615GGBFZ6eiGgU
	WWC5eh4rZQ7KYrxssz3b3Dep/SDAb6tJFl6Z69CcvH8WlNI2mRFJZf5AkRuvrU8ZXLTLO0wsxBv
	qIAs6Tjb5wlFbXQguFPbUIvNiCgKAmcaqf91OLaKKmdnK/jgI+T+F0lV1k2/1fVee/PQJH7y/Gs
	0KkdTyApTkOQ5pVilGPp2eYGW6LhRzI8T4zU5MBWXrRdU/c3CtOrSadYigoNLK0xbK4XNAk0On+
	3ioWbK1hdqDcb8ISC2TqQ0WDMKUZM9sBjUiAZRSfX0EF8JukFvlHs/PavYmJRSEodV+ZcM9/HDN
	cykKD9GXzS6DW3bx98Oeldux7jJShpyYy4lgD07iaNC620a6x0b73lfjMZ4CnxT3Bsk53c7Cs0G
	YcuaWLmO+iTwZ+VFfMBIQNHKJYq8w==
X-Received: by 2002:a05:6122:3d0e:b0:5c2:c0ae:a2e8 with SMTP id 71dfb90a1353d-5c7ed493f50mr13300968e0c.7.1788868984649;
        Tue, 08 Sep 2026 05:03:04 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec21302bsm9436594e0c.7.2026.09.08.05.03.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf9466867cso1902761e0c.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfz/W+MaVY+PSOS06nZ1A3VRdm0bDc+Rzv+1d9q/bKPJ4EE1bm/V9grJq5R0g0kugC2zoj7aANb9lw@vger.kernel.org
X-Received: by 2002:a05:6122:2187:b0:5c1:25d4:e29c with SMTP id
 71dfb90a1353d-5c7ed0b2b83mr13290597e0c.0.1788868982949; Tue, 08 Sep 2026
 05:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:02:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
X-Gm-Features: AcwNN1Ut5SdzvrXN_MrghHd3UEoZOGWpEZlnNMWeOIWmWWDEytJDRzefIJak2-I
Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 8 Aug 2026 at 04:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi-ws-2ch-canfd {      /* SPI_1 */
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "spi-gpio";

Please list the "compatible" property first (everywhere).

> +               sck-gpios = <&gpio0 10 0>;              /* CN7 pin 40 */
> +               miso-gpios = <&gpio0 9 0>;              /* CN7 pin 35 */
> +               mosi-gpios = <&gpio0 12 0>;             /* CN7 pin 38 */
> +               cs-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>; /* CN7 pin 12 */
> +               num-chipselects = <1>;
> +
> +               can@0 {
> +                       compatible = "microchip,mcp2518fd";
> +                       clocks = <&clk_can1>;
> +                       /* CN7 pin 18 */
> +                       interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;

Datasheet says active low, so IRQ_TYPE_LEVEL_LOW.

> +                       reg = <0>;

Please list the "reg" property second (everywhere).

> +                       spi-max-frequency = <20000000>;
> +               };
> +       };
> +};
> +
> +&msiof0 {      /* SPI_0 */
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       pinctrl-0 = <&msiof0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       /*
> +        * Native MSIOF chipselect does not work with MCP2518FD
> +        * because MCP251xFD driver needs to keep the chipselect
> +        * line asserted between transfers. This requirement is
> +        * fulfilled only by using GPIO chipselect.
> +        */
> +       cs-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +
> +       can@0 {
> +               compatible = "microchip,mcp2518fd";
> +               clocks = <&clk_can0>;

Please insert a comment "/* CN7 pin 22 */".

> +               interrupts-extended = <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;

IRQ_TYPE_LEVEL_LOW.

> +               reg = <0>;
> +               spi-max-frequency = <20000000>;
> +       };
> +};
> +
> +&pfc {
> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */

Node name should be "msiof0".

> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> +               function = "msiof0";
> +       };
> +};
> +
> +/*
> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> + * in case this hat is in use.
> + */
> +&pwm1 {
> +       status = "disabled";
> +};

Please move this node disabling pwm1 to the top, for compatibility
with dynamic DT overlays.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
