Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26E3D9DB2
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896551; cv=none; b=j4jatQyPyq47Nzb0PdGRrz4dbCk3RKq6FhJmusz34ikSkSAENnIzqKfV2O1rnFTagDILJEmfbmtQPa62jSC01evjcMrXYZzOBT/NcheBkRTNoR+/8IsQlp9HhMtsrrjL8tTFNphrXFUtfm40lQBnwWT/bxvHdtB6uzSNOTIw/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896551; c=relaxed/simple;
	bh=QxEzYqywlw03gV5MPfwql/Vh7CF7FMFvawQxXbUcQXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrojJtgqwbog2ffVDl6R1lxgjjMYdEifZIbecNQLUh+5FzxLa3pzzWeDrCyyA+dkYV5TULsmBRc6yn3fM3e8GHrzlKzBvdpyVrojI533uX+fLnoJGJLozwwAw6Zbo3Mz1itxGaQJdoG4Yh8RfB2o7PiNZG5WYYcoS79/77kIhQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-96387efc30aso223789241.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896549; x=1780501349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUVMYERSCtXTEyD30ce/R5zh2i/ldE4ZPLr0V8MwRIw=;
        b=gLRvWQ6D9YaQF0CUtZo48ENemn1w+RDKcoad9MrUmwrYLRyGk92qny5l/4MPPadktU
         dJNJEMTCjRphFcxCK/zZA6nQXkP0dGU6gBvIDCZz6SabTGtOHFSCUe7z9pJkBSar8dQ5
         tEHOs1BLKjNeFoftZ2RvX55xFtQm0R+3OGmmwrcafudJhbWl4OzBQ5XozPbP/JPWSJ0d
         DoxmsYMuVtbm0a1rpfjRYx8p+SPMEGvC6MsYtxXmu9Br3kVphQuLNhSA1bBBqRvi4I/w
         boCwDqlhq/QMYW9L5VMf9IvFWfkJJ5EuDgtafLehkUznpDOl6F+knSmpxDAk0PKhzJ20
         ICrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qQCeCMifm3P/kx1Y2Joqos0rq3fQUr590tJscpSI9sKPJJ/y43NOiK4YB64MkQaKGpsP4KHcvzjLx@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR0KJtX3Q9WQxhC3AWZGp+qiEQ4ZI0db7J675EEP15SRhGO4Y
	hVE/GaedqkB1o/8/8oWnL7ZZJ0mEgTTrxHRJ2I0CUtbO1bo1yI45dAUIexFrdaHBa10=
X-Gm-Gg: Acq92OHjbaJPuxaOgURB1gyDTnah3w2MXadvCzclPo3iC8/gWntqTWpnxSZRIRBRIX2
	fa2ippEjR9M52QgHTyMYadx6b28DWreXG2ooGjrgfTg0ktS53DQin7nJJHwMFXjfklbqZAVcEaE
	sO+0YRtzTkR1/4i+hvpsrYgT1Eld/wsIiS/C1rZ9+UVPCLVPHyFjzs9cbaUX21tTCqWUI/oSIFa
	TB7a3OEtcKIDhC2kpbURkjZ0CXue3YZICTD2O1D302W61GCayArmk3grbnUT3TwL3H7YWgiSyQW
	fWQR5Jt5sqKJYWiKyy2T+e+bV945aY27BFGN67kVUDYlSTJKZ0shLdGX2ehJ4b0ztf4yPCPNFXY
	umFT8omV3nSVuaukm6wXN8vdtLUyez4SDWwmwNBzk8rX5wjh8J2JniZXT3lLEhef2gVGc/6MkBU
	U1U+R9bOUqdrL3HMMCdzAZBV30sP21FmIKzO8BE/PBTGbkHRpi+VZij9Qpl/sU
X-Received: by 2002:a05:6102:504f:b0:632:d8d5:2908 with SMTP id ada2fe7eead31-67c8b3aa864mr11423912137.26.1779896549473;
        Wed, 27 May 2026 08:42:29 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afb1ecsm17506485241.9.2026.05.27.08.42.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:42:29 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6314c3818baso9177425137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8g3Vqh/x8SxOuBa+dokxHyVXeiSAw/9fQqdYMWJWPuNXVQJCOYHAljziHNcvFQ3BOdPvQ6Q7S2ktlf@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:631:2973:5c2c with SMTP id
 ada2fe7eead31-67c890222e7mr11190059137.21.1779896548782; Wed, 27 May 2026
 08:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURzXkiXdaPZp1mie8zFDSQMP=_8EOe0dEAKEW3nWo6RA@mail.gmail.com>
X-Gm-Features: AVHnY4Jt_LVptrM_xgMBw8SP-oke7VXnd5tR0FGiwVcc6M8XHiNnKr4PGqFaaSM
Message-ID: <CAMuHMdURzXkiXdaPZp1mie8zFDSQMP=_8EOe0dEAKEW3nWo6RA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 I2C{2,3} devices
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
> setting SW SYS.2 to OFF position.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -11,6 +11,7 @@
>  #define RZ_BOOT_MODE3          0
>  #define SW_DPI_EN              0
>  #define SW_GPIO4               0
> +#define SW_I3C_EN              0

FTR, this macro is active-high, like SW_DPI_EN, good.

>  #define PMOD_GPIO4             0
>  #define PMOD_GPIO6             0

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -9,6 +9,10 @@
>   * Please set the below switch position on the SoM and the corresponding macro
>   * on the board DTS:
>   *
> + * Switch position SYS.2, Macro SW_I3C_EN:
> + *      0 - SMARC_I2C_GP is enabled
> + *      1 - I3C is enabled

while the SW_I3C_EN# is active-low, so setting the switch ON pulls
the signal low, and enables I3C, good.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
