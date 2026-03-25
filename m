Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C43D9024
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454490; cv=none; b=g23RBAlk9+qVNGw7d34buTvlyDiHk6fVrDn3/08KHiCZIomy8NeowGIZG2W8gq0ezkKUGErVJK+MVwoJtBUG5KTkwQCiLht7Wna8+O3mrN4NmT3dZVdvhubExYAMc2r3l1fkFbz/A74uDBwiq4MNP1g48rNnlunidahlc00mFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454490; c=relaxed/simple;
	bh=AIVPf3es6gRbVZD1OjJY+7NHbNGFfUFHbP5UCcb+Ibo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwS+yre82062AE8o2ynS1TgZxLqhDs5/vbEoTFQOEI8Hrcn3biTaCnXFJB+18hjARL4LbrxnSvVL7TolytRXS6Va78gSIrINJQ/QWnUvq7E/d4V3inVdHeMFBnqYw4hk80BFsmpZx5dCeyYuhgaOdwH0mgVbVU+77p0ts3FRSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94ddffda372so787177241.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454488; x=1775059288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsaKl4jnMb/iLg/tAunTjLfMtEyxekduMqGv5XbCBMw=;
        b=fHpmNS2cYfnwVE1OWLwqWSK7soQQz1oEu91eke6ott+rhDXXBv8RFaojaRLrE+xNJH
         86VxYvEj8wC2gxIklAgsy24j2bCIpP40NgF1NHZGB8+6IgOyB0IGYVLpDyccIDdQ02hc
         e8WDwtm+boyPtL1nSBjDf91lZeKU/f3CvWHTmMrn/i20Fygj6h6j8OYKHnGB0HlLLAIm
         QxL3CmUEIeHetbyGhMk4x707AkVZWI2wyVTZBBb6I06yct5HrqvHDTHqPK/+hprInDRP
         ezSEs8Df5rxeECtFbRpL6kGNmJ32aV/Zg52awOyZV4KaDMlzW7nX7yJ0r1jLBOZT6EpY
         rDYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoXqkkFzZRzWZi0rbctd+PgkqNPD0OIidVadOu0oZaRRmbRv0Pyp56oF1S8mqMszlftHnKFueZDc10@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ZISQyQ+np5wKnTLC10pwfiWFuajkQSa/LJ1DU30ssdSrsiQz
	TCaCm1qb5HI4vYvLYW1b3RXCOjTzc26QC26WmBCyKVajk4dFFGqzePbKtu1IT2vInNI=
X-Gm-Gg: ATEYQzyUMvlSDqp8B1gjAngdgdQeW3DKKaNC0icXOAHkgAd9hr9zMiIZe77blPjLjeg
	zhD0oq57ipXsJ8YdAGqjZYcP2LBXaUL4ez39jUc1+rNPkoKsJk6Wj2ZkaUSvc1RaqKGNJpnKVDQ
	6Aukhq30TGLH1ZvOm1/q7FjZciESugPvilLU/3+ZWUM0mTxZh+wyBPfdCgFz/xVNgYK5VCpirsw
	394w4Pui5vCfhYpj7eei0+zsldCsnoVw4wtomsOvwka6Ym9O6EaM0dB+O5VhPHnfN6eLD/jHEFZ
	U2gIfeqpSScCo+q7163fQqA1in4CJ0ZMWIhyKu+3LWG8+BgAuHtOhPOyuW8QPQmM+1W2RQ1MRvs
	fvSTep4shggkc6MapfwtXBqxxqEb5OdIdtJi96wX0i1PwHZUUPQx8S2Co+bc0ltWiH3jdbXHh/q
	QpGUAoWCYDZmnjulsv7xVL9OtjPfbNlgAH5UUzuQqJOdZcV6GSZ9/Y2bUEL3iSUEHY
X-Received: by 2002:a05:6102:5e86:b0:5ff:e10e:b9fb with SMTP id ada2fe7eead31-60378fce56dmr1832340137.4.1774454487860;
        Wed, 25 Mar 2026 09:01:27 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5313adbsm57517137.8.2026.03.25.09.01.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:01:24 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so1072918e0c.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0mWHewNUkyPfWor51DMeEk8rP0D3Qa70ks/c/3wwjc1IoyOAdhRBuwWT+1/T9yoP3LLiMoWai7YY7@vger.kernel.org
X-Received: by 2002:a05:6122:488b:b0:567:4f98:fb82 with SMTP id
 71dfb90a1353d-56d221484dfmr1919276e0c.7.1774454483312; Wed, 25 Mar 2026
 09:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:01:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKCxfWPTyoV6nMGHkK32eeZFSEXnL3L2C5kGtOTUtJqA@mail.gmail.com>
X-Gm-Features: AQROBzDNP67-ZuO5q3SWFmFGIjuJmCxHdim9QMA2vOC8b_1VjWoGuY0s8rTuFQA
Message-ID: <CAMuHMdUKCxfWPTyoV6nMGHkK32eeZFSEXnL3L2C5kGtOTUtJqA@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: renesas: r9a09g047e57-smarc-som: Add
 PCIe reference clock
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E SMARC SoM has a fixed 100 MHz reference clock generator
> for PCIe. Model it as a fixed-clock and assign it to the PCIe port.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -43,6 +43,12 @@ memory@48000000 {
>                 reg = <0x0 0x48000000 0x0 0xf8000000>;
>         };
>
> +       pcie_refclk: clock-pcie-ref {

I will change the node name to "pcie-ref-clock" while applying,
for consistency.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <100000000>;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
