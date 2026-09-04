Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07823443AB8
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536690; cv=none; b=efFi4uAJIM121Rbmr9iwaj6+tABIWzvybK29XlT5W7GgeCXXHzFXfjQXWa4u5jdsaZWz2lQy4IibUlNOgE/66mjWfewEEgUTRA4K3nRclM1w0oKNAxpkX6HEHsKFjqUP3GQ753Jqsg6oYYOryTlW/mWj92NmS8oJff6QxESLV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536690; c=relaxed/simple;
	bh=4bEAll6bJapZukrKkjXZtk1Cgl7yrbg5PsFtTRWvy8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaIaIF68VVOcJmQ8/jI3wyI3E+zjX9P2uXCbSeLvMBlkOjRwWcZUXTFRYfAHwbFmsSJYR8VnogfmfqdxGPdefERTnsYZKGSkNxQiiBbREZJTka5ZU7JhIR1lV1wTOIQTBVSoRl/t5rBJCBOE5JR8G1fpkk+VaHFnTj1+V6hOTA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-46556b9e02cso896937fac.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536688; x=1789141488;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hzE9a7y7ZZDe66bPxoXer0uMhuOeucoXHc9TRbP+CZA=;
        b=RH5xLB0QzC/Om8zFgwsuSOTCizDSCaOTiXN1Ni4CKNqSsdOc48aqKc1pQJE+WJmzls
         1cczOsF6XESuRHMbR6id3uxLglp2lIUOajS3Dx5gp7M+Rnl6L42QjafJB/HyGECrxt6S
         2JKg/R3pma8vn3KLd3faSVcS0ZvVDImh6zVejpS7xErQR5UJw2KUiYMI//aYQu6YCeZz
         QH4WWAdNBKfaPxS0kUtaMeOFwwKADK7AzO/EsQD1/XjbQn+O8vxRNpxm1ZLEGSvnpKBx
         tGOG9TOzY4CEQhLldOG9ITPw1EZRtuKbIJMczqtKyVEHI1KfckyBiZ1PhmNIWBCAhyPh
         RJyg==
X-Forwarded-Encrypted: i=1; AKwUvBzBMqrwACNWFSVFEo3ZJd85OM1bir5Hsqh6pqM2jHGktNgfRpmLGTHI6drFshtARCKyiChB0cFK1eT9@vger.kernel.org
X-Gm-Message-State: AFuF++nCB7zb/vreN48DIwC3RsXPuymPWP9CLotROcw7WouOynJd1HLQ
	4kgB1PtSXGSszDWXEKUYVpJQTfkdDn9IIhgA8GkqpqstLBt8bbnugAnU7+PO467j
X-Gm-Gg: AYBFou2sdOH1W/GRutJbOBtAeCXgAxU2X0yzQDN+JxF5gD9yXlfvEEQIBuN+Ujl+VXf
	gzdwS0iSDjdQrwhSAg8s1esBMCDOeKspO5LjCk+IJMLnBavRFBp6FFI/prbS4H6wnlFStrVRWI3
	43O6VHjyCQ92PdcC18CcLk9kaKqFL+On7W38RN4m72FN0SDKxSqKhm+TcCPSMP9/Z/RPu1LweuB
	Xirdl/X8eucDWaZxPic1q0Reke+N3NYUjIYivrMnlLHkuRfD0UrZYEvGoM/7+vsCZbD5W5x6XVr
	AiLcn7eliicQb6bKveFwyZh5on3vQZixSlZNcgVmHhzckd7r6JIUA2+eBMmRnoPLM5Yxlw3E1fP
	JiH/ZMxRjmbMYesQEk+8PBjjIvB7sHo6qMGaAys4U2eZMhavoeEA6o3RtTcUtWc+4xrFpUsQqMJ
	iNPdPEM55m8hjyCdJ/8S+SD2P/s0OPKMw5WS8R8WdNhEiLUT1B3o28BiWn/PefPMKkTwfWeZBNk
	I9PrpvC4AGkWHjZKpdx213yLg==
X-Received: by 2002:a05:6871:68c6:b0:456:4c6b:773a with SMTP id 586e51a60fabf-4757b5318afmr2252292fac.9.1788536687690;
        Fri, 04 Sep 2026 08:44:47 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475523da013sm2478440fac.1.2026.09.04.08.44.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:44:47 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-46ad7304688so2135876fac.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:44:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrLaQQP2+UkTPgajmnoeUWdu1XpXO/idV551TLFzxjUYYXVzCEzIi6nrJ2Lo5nWiifApuCHhY6gFeg@vger.kernel.org
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id
 ada2fe7eead31-78a2ef7b044mr2760248137.11.1788536188830; Fri, 04 Sep 2026
 08:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:36:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
X-Gm-Features: AcwNN1Um6XH5hlFEECJFpWec4doGqp3W45Z0eEeDzho30JjiEWI3GGf_1U5A2yE
Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub
 board support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC main board.
>
> The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. CAN, PCIe
> and ethernet) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only OR BSD-2-Clause?

> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC sub board
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774a3-hihope-rzg2m.dts"
> +
> +/ {
> +       model = "HopeRun HiHope RZ/G2M v3.0 with sub board";
> +       compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2m",
> +                    "renesas,r8a774a3";

Please replace each group of 8 spaces by a TAB.

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
