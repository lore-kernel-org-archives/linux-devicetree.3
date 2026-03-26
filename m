Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE13783C8
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517404; cv=none; b=XsE1sPhFyxkeTqXnLIYYcqoLLiXW5xRvVczrAGqCD8yYYjMl0yiCNY2ZcBDawT+uOa9UDo4SkNlKOfgoyDe69WC58JfB6aduX2f/59ZG782CdqNWB3ky6e6/u4mec3mZ1ubuf9GKz8v85b86Y0sFeEdzw/mwjDSXSDxC4lWz0v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517404; c=relaxed/simple;
	bh=k9HDcRqBnuJFvwQk6gqRTKhQzZwVzR+lN2z+BoG0Ts4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPh6+RyadUS6WGF3ZNRLTHl/m/95wQ1m71qQt/I6bQjby5VuXYYQznNUZE9NtlRSF4LIr1b4rS5VGgIlCim4nwkbHCsb3WwShcBnv5AB+dlnrHUpiW6OPDH9vZ85AYIC87onaTD9mFVk2WsAvFSvbNMpXvkJMIRupMh8Sm+6zEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so1191867241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517401; x=1775122201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PE3iyzx6jIK3ZsNdv8OtLecBaLX2UfrDS1pqoPXCU0=;
        b=f8JBbduQjqa9xUcSvi/j4GE6sJ60FBQ2f3Ewbrbme0MEvoTOnBPgHvozi6X8/EkKOt
         yWdzNnSJgdJlNnnyQ1ADv3tOQmiZAMK8/vcqM9de3mWC1DhNNT4fPZT6x1CwLYzldrLF
         O+KKIq5FkykfwyDPjs+a8FodO+TH9Z4bE1IHieYufPOpsQT53IYZY1+LTVQPNZtHj+fR
         U9J42UZH4YzpVr0bPc/q39AmcYrV6nHz4ygW4QtEdi0bew4j4sPaWM3zL1hB5Gx/LnPC
         rdAud8oKMYmwmnVN0koILz4wKblft3cf5K5VoXdQXfC/oGN/qYS4k8PMMdoXNuT+ajEJ
         SDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Hin+B0Dheo0qK3gFPXtRQlp6pGIDupx0P9+Mtwsi3oV9Q86h5cleQGuhu9Vp0evF6Ips+bu+QEZR@vger.kernel.org
X-Gm-Message-State: AOJu0YzOWPgG3ztQ6S7H2nwtl1Y9N3LKP0rH3cGRf3fTT55tFiU5k5tG
	DYbCNMU2tX4KEpY9q8ccB7FhSn58nM4ron5c9DMJB7qWotLyc2JcMoO7JrxUS7AqRaM=
X-Gm-Gg: ATEYQzx844bfHehSWSuEIpL/HGBKUysrOF2nZ84dn/CBJ3KMjl5ncQZhBfCk6IF1fth
	bl2Je9u30ZunKmoJ/6epFt1HYKg7uChqvnPbpJZzeR7fj6ItnYdF/LF6OiA/arn3I/mz2NZzmhh
	lTemXJEJ+Y4iguPjCnAZPxIfAkaSWJoWmH+CfiHUoBIr3ehW/jKUeTvg4XtNnrRnGnsOQCWOAxP
	WGnkhhRJqar2HthsL1Dn4IRWsuuHB4gFWRNHyXT/TOcRXiZogcbXay5PgpxYHKmV966xg8tL9wc
	EqvHs+yh/uVZeUfeDhvwAbAvlcKF0PYhOikIiHK44x39LB0WRwgl6apr9hKxpSXOVD/Jck+Nnv2
	KHFsE0RK4LjOZOP9P47MYd+2oL9JuNiWXk8GE3NrO9pGFW/aQBg2n/7Tj9XKmiuUbFzwN9J5a62
	C+8TEBLaaX9Ng8iDftCVgzIGyNpFgS9yj6fRFVNx9aUFy8PJKaT3XS5ibvSKtW
X-Received: by 2002:a05:6102:580d:b0:5ff:fac2:836e with SMTP id ada2fe7eead31-604e4961ec0mr277912137.4.1774517401563;
        Thu, 26 Mar 2026 02:30:01 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5313adbsm2460892137.8.2026.03.26.02.30.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:30:00 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffdd9a6155so1689747137.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOXYD//t2IxfjZPRga6FQfGs/XwUi1//cGWmquCa/syd2Q3U01ybL93cCbByD3XEXZfQRlOxk8Q5Uh@vger.kernel.org
X-Received: by 2002:a05:6102:f95:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-604e4d73ea0mr248413137.11.1774517400168; Thu, 26 Mar 2026
 02:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203123503.314755-1-biju.das.jz@bp.renesas.com> <20260203123503.314755-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203123503.314755-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS4QuPL31T8TGhs_iK3oG0wkRgtoMXF0n0YVBdBJk-ww@mail.gmail.com>
X-Gm-Features: AQROBzAm_WIhUFg5CDklg-yPQ4dppCZIKqU-HJ1ZQvbi70s_CgoDPHKhQhy0-xk
Message-ID: <CAMuHMdWS4QuPL31T8TGhs_iK3oG0wkRgtoMXF0n0YVBdBJk-ww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0
 (GBETH0) interface
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 3 Feb 2026 at 13:35, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Gigabit Ethernet Interfaces (GBETH0) populated on the RZ/G3L
> SMARC EVK. The eth1, pincontrol definitions and hotplug support will be
> added later.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

>  &extal_clk {
>         clock-frequency = <24000000>;
>  };
> +
> +&mdio0 {
> +       phy0: ethernet-phy@7 {
> +               compatible = "ethernet-phy-id0022.1640",
> +                            "ethernet-phy-ieee802.3-c22";

Drop the latter?

> +               reg = <7>;
> +               rxc-skew-psec = <1400>;
> +               txc-skew-psec = <1400>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;

txen-skew-psec?

> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
