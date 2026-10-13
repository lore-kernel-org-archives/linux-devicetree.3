Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB073E639D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891720; cv=none; b=kXTPwZRRiNuo1fDN4L5nwcpaoBwRXcxEpTlzuZ0v6YehK/cr9kwY/8+fZptjhqO7k0kWeVuXmXAAfYCWIRilQ1G2FbedLUPJmvLttmJG0tcx3rLleSTKaetEShsJ0Y3FqDv0x9e6ahQAbuAak7eQhdYaRcaPbzJnf29IjfzrNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891720; c=relaxed/simple;
	bh=k5veFeTTHtqbcVUOmk8kP3kRfVRBO7Pptciq5IbVpOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzJ5qGhMSwzps3b2AUbBovR8TfDN/uhZzrJjlQZLaQENGpod/Nf5xqM/ZR/E1Tb/98FjPJ1Xb5iz9EYFUvItzLrTMCNW6gYRbUjQkVPpPG46zBOZM02xVAyaibEbdxb7DYFs3876J8cm/pRULfAsRdY4p1o66X1AOto4YzjKNCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so4106612a12.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891717; x=1792496517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WEZ3XROOQ5wml3OCk98kzhYlw6diUWNF5eLEQIKJbBE=;
        b=Jp5ZSmAz2zBG9hvNF1q+3MTBI82xlfHgufI0NYm8ZKFe3Mk/DquscCnx8fRsfNvn3Z
         rZqEq2+1ENNE68qtDJmnSo3yMX2A0+aFaZbgsHpCuhqi+L1z7yyhbxBxSM5PFzIUEF71
         dOof+HECrQmpS5mKKoKPaP1xvL7D4KxgpdPHOXxKy7o5XnjyZ5UGMaX56t5V6JKXZ0Ci
         tKIcrQp2PIvFO+dHJXx9Qhrjr4U7X/bBhuqThLpignjtG78jV21RBSFXLHz8raunm7a0
         mwmE2pPYGT17qE4aZt6R1y6CInvgG5g0bKAb6oUN8t+H0KVIfq+xsJk9/vkkqXVT1zES
         NDWg==
X-Forwarded-Encrypted: i=1; AKwUvBySDc2++Dm761JLRX1Tg3BFCSkKWHfc5/sOOiqc3mlxC8hyZ4kVyOtgaRnXWy1k6+1jojP6kyYGoO68@vger.kernel.org
X-Gm-Message-State: AFq9FYIhj1+leuF1Syfu7jQYhOlMHyrmjcrktDlXrER3OOksXn4PgSCV
	Mjq29LBMwSu4aW2iU3iCmrunipLDzXS5Ws+3M9AYxAyGAzmAlPUA0XssCKWpyPKqmZo=
X-Gm-Gg: AYBFou0nqP1fIru9apJYiB7sqGhuXDXTeA0SagJGdv3yJK/hgUaRdp6xanYAOJwHD9s
	2f2euqYG7rc4A5jOPXM3SMJSfkUhxiejFzdun22ZLAOyWKRfLDtNxLiz+H2MAT+LrWZ0GA0FI1a
	RPDRsIrJ4b0i6aoY3Hj4seb9QJrJJwrURYlyAz2zWdYH+m3cJHXjb2Jqte4Sh0mGOd1d4tJfJUQ
	uXh19Hr2MmPhCFdsPxOQY25QQm58kct5d11BR3wQEONxXxxNKRGYoT4ssQEcgOAl9pToG8GDDLl
	/bP9BegjnLkfV/0PA3ZcDmkSHAATpoLgWBJY7WN0BFsFqRReP+sdR8/ezokW0C/UAWUya822QZD
	7Ry9CLaWcjzj6+oDKUfFfgOVVRh6+YvzL+sOmZC2qguAuboq5tlFXphI3+yoKDaF93iRCw15EHn
	savUsPsKF448m6jEO/9c2orOR/jVsbHU/u6lJot80nKX8oKStgs04sMG1Tcbkx5EOdrbs36L5BK
	tSu0E2LuASUL0d9uQydrNh/puw5EsNY5RRwFw==
X-Received: by 2002:a05:6402:11d3:b0:6af:dd04:bb21 with SMTP id 4fb4d7f45d1cf-6b17c23e8a9mr10322810a12.15.1791891716728;
        Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b178d166b9sm6341007a12.1.2026.10.13.04.41.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2acc1e170cso461010366b.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2jws++fz8O3sPEabbSF2uffAMaW2mgaBIvaI2bnIBlKRPoddH/7llfPlNw4Mj1/aiVPKh7niEfLhd@vger.kernel.org
X-Received: by 2002:a17:907:e158:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c34e9fe8db4mr355591866b.28.1791891716374; Tue, 13 Oct 2026
 04:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 13:41:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
X-Gm-Features: AclHuK9GyhuxP1j4sSDne1XJEsD6-l0raq_tLn-7rYWcCt7pn2fMfEYbVEbwDsM
Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add EDAC node to the SoC base device tree file.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -164,6 +164,15 @@ dmamux: dma-router@a0 {
>                         };
>                 };
>
> +               edac: memory-controller@4000d000 {
> +                       compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
> +                       reg = <0x4000d000 0x1000>;
> +                       interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
> +                       clock-names = "ddrc", "pclk";
> +                       status = "disabled";

Should this node be enabled by default, or am I too naive?

> +               };
> +
>                 udc: usb@4001e000 {
>                         compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
>                         reg = <0x4001e000 0x2000>;
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
