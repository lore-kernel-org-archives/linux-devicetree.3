Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC4381B15
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899163; cv=none; b=nuuSRPxgIDZkT3jC3TjrQbR17rhdC78wFGhrd0RHULbidcSQbkzWglQq0FDyQh0PlGJAu2sRV5Bcr4JSgUYgMVWNOIvQB886VOvISYp/BOdxjv5p3z0B2i8AXI2CSLEGNhDYhKizLEvKEx4uHTD25KcS/k0VkA79AmRKqJ7VeyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899163; c=relaxed/simple;
	bh=SnjR+18E/woBqLFJeFD+ah4X3sbuE63zcqqLF6ObtTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOxzioAZF0zVTN6gIRkebYR3a2fA8tS8VGQpFbptkTnk5EkejMBGvdR9fCP0w893LeqQi8Ic39xP074VL+6L5E9aJFukOxQtKPDoOPoxQILx/YjmBGTKVR+wsrKtY6uRCCRYcZX2M67zYRthLVMFXTNnimRYqRVDK0xrvstpgcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5945b781ddfso732915e0c.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779899160; x=1780503960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnuiomlN+3bt21g7lET2lZDG8m6jvnNl0Hl3T4tvwkM=;
        b=sijRWwpKA2qqikxqkHpwPefrbYmLDu6HY8t2X1j99pWAWRpE1GAg0VX1bgQyOVbMW7
         hNfb4IzvYVNUiNBowA1wuWQKQiqBKG5D2NUcbtuCoYm/yb+gVjxnJk+kM3xU2lCxRqcs
         akaiIvVHmcu6U91SoJh2BlQoB81UB7/6vJXyXJWsK9YIo0HvRYThMxnx17R01WwJgQyC
         fsA8I+T4B1QKuDX3KPHlncqTjSKA2vpGzjmF4lk9JZdEFRvK/mLwzx7yD2NIDsRJ2ODA
         y4/mZNN4YwT/MCFw4Xw+E+5d2n+F6RmgdcitLryOHWyx/w1rdLCVJQaYFTO6YDL4zK52
         LDow==
X-Forwarded-Encrypted: i=1; AFNElJ8g3BiEev46ffpFCcqv2+whWgQvQzSvkfcps6vIWJr4/jDwxgZ3oAKKo3s1EpC+Hp4bmmSd4R6he45j@vger.kernel.org
X-Gm-Message-State: AOJu0YyK2JPBuAV+nX+6Sn3ntc6uvgPyAjOWCROi/ykRZim/HbTu0Dje
	rjc0FbdOivFhk5jaalvpgBZsm9rtw3d2GuxYi3AK8l0iZ3H7LE/VF4corF2rakaGReI=
X-Gm-Gg: Acq92OGKQop6z6imV2AWeQlxKpsgr5xMkL4l3dWEhvuyuBT+lJYwdzPVClbnSBjnyR3
	GcJNZdq4ZjKGUfNU3d+oNGgB2bTjIuXODQbuLgv5p4zmkualF7qsz6J9CfO8mpBOYJcJN/XDIZH
	JuXRWeQeF9T6p+8Yzz5KZRiGzurafWV1mFYgJNn1GDIYW6hlw0pn3v5YWN2llGBzQP7IlP9suEW
	CSHOu3nndydRe1ab1JHqihL3acXHC0P2flRnxpH3raN6qfIJBb7zh5PwSdljAsG/yUh2lxX9f8Y
	na/j8bUh0z202ZLp4BZEECTG9JCp+XM8ZJivlvnBCyQeGGgbezx+vc9fPWAOuFRAUh4BfpQF1y2
	sboFdSmBjUSBg7o2CqnAPU0AeBWCsQM4froorOqR1uJWeNkbpI9dm80lxXv4sXukW9iPdOEAQ0l
	iqmcexPtGfqfhQ0/7vDCUcdL39ak0wc7vQVFEFGnRA26m8jfboLs5J5t7KalIz4vzM7ydaB1k=
X-Received: by 2002:a05:6122:e26d:b0:56f:7e8a:a395 with SMTP id 71dfb90a1353d-586890d0b09mr6755356e0c.1.1779899160499;
        Wed, 27 May 2026 09:26:00 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f8f6cd40sm21977932e0c.16.2026.05.27.09.25.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:26:00 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-63201e0d6b8so9791817137.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:25:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vLut0ZdjOz2hjYxDqbtJHWO6AfbBAsv4i5gu6dz83kxL48MaQ981nHrU5p+vUFwpjLcAUycYNDnj2@vger.kernel.org
X-Received: by 2002:a05:6102:6208:10b0:64e:3424:cd45 with SMTP id
 ada2fe7eead31-673c3721467mr4815172137.9.1779899159467; Wed, 27 May 2026
 09:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:25:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtSJ3U=MrjzxHtpgO-Ft=kTboVWxAJH6kz0hK-KU1rSg@mail.gmail.com>
X-Gm-Features: AVHnY4ICQLP0jO2jEFhcBh5XmFSnxbx19hs7FwLBMbR98i6jT5eSMp8jWc6rv10
Message-ID: <CAMuHMdXtSJ3U=MrjzxHtpgO-Ft=kTboVWxAJH6kz0hK-KU1rSg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable audio on RZ/G3L SMARC EVK by linking SSI0 with DA7212 audio CODEC.
> The SSI0 signals are multiplexed with SD2 and are selected by a switch
> SW_SD2_EN#. Add regulator nodes regulator-{1p8v,3p3v} to SoM DTSI for
> reuse with eMMC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -9,6 +9,7 @@
>
>  /* Switch selection settings */
>  #define RZ_BOOT_MODE3          0
> +#define SW_SD2_EN              0
>  #define SW_DPI_EN              0
>  #define SW_GPIO4               0
>  #define SW_I3C_EN              0
> @@ -38,6 +39,32 @@ aliases {
>                 i2c3 = &i2c3;
>                 serial3 = &scif0;
>         };
> +
> +#if !SW_SD2_EN

"&& !SW_I3C_EN"...

> +       snd_rzg3l: sound {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,name = "snd_rzg3l";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ssi_link_play: simple-audio-card,dai-link@0 {
> +                       reg = <0>;
> +                       format = "i2s";
> +                       bitclock-master = <&cpu_dai>;
> +                       frame-master = <&cpu_dai>;
> +                       mclk-fs = <256>;
> +
> +                       cpu_dai: cpu {
> +                               sound-dai = <&ssi0>;
> +                       };
> +
> +                       codec_dai: codec {
> +                               sound-dai = <&da7212>;

... as i2c3 where da7212 resides is protected by !SW_I3C_EN.

> +                               clocks = <&versa3 1>;
> +                       };
> +               };
> +       };
> +#endif
>  };
>
>  &i2c2 {
> @@ -53,6 +80,27 @@ &i2c3 {
>         pinctrl-names = "default";
>
>         status = "okay";
> +
> +       da7212: codec@1a {
> +               compatible = "dlg,da7212";
> +               reg = <0x1a>;
> +
> +               clocks = <&versa3 1>;
> +               clock-names = "mclk";
> +
> +               #sound-dai-cells = <0>;
> +
> +               dlg,micbias1-lvl = <2500>;
> +               dlg,micbias2-lvl = <2500>;
> +               dlg,dmic-data-sel = "lrise_rfall";
> +               dlg,dmic-samplephase = "between_clkedge";
> +               dlg,dmic-clkrate = <3000000>;
> +
> +               VDDA-supply = <&reg_1p8v>;
> +               VDDSP-supply = <&reg_3p3v>;
> +               VDDMIC-supply = <&reg_3p3v>;
> +               VDDIO-supply = <&reg_1p8v>;
> +       };
>  };
>  #endif

> @@ -85,9 +138,28 @@ scif0_pins: scif0 {
>                 pins = "SCIF0_TXD", "SCIF0_RXD";
>                 power-source = <1800>;
>         };
> +
> +       ssi0_pins: ssi0 {
> +               pinmux = <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
> +                        <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
> +                        <RZG3L_PORT_PINMUX(H, 3, 9)>, /* SSIF0_TXD */
> +                        <RZG3L_PORT_PINMUX(H, 0, 9)>; /* SSIF0_RXD */

Please sort by pin.

> +       };
>  };
>
>  &scif0 {
>         pinctrl-0 = <&scif0_pins>;
>         pinctrl-names = "default";
>  };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
