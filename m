Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667E53B616
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870707; cv=none; b=bDcNSkUqZQSnk/pWf+wJusC1aL/V5kqttut1rbVv6cxW/D0JIQ8yJ8jafrzEkTOF2bwof/prCtIKRDg6Z/KaIJiaNtDHMuHYR2x8O52iDo25MkewPA+Gg75Ej8733PITg3kiKsgmXMZzp438BxkqXcno3TapeI4VQIjKqw6tv/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870707; c=relaxed/simple;
	bh=xjqICCjmH0ghryW8dOBfRncjaOxBbTFkSNvlzCO9/PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3khWym9JQAou8++Gx1CMLNdRM0OthLQrOs66jB0FlXRxtTWmCbJvf2zEWFBr7BU87oW02KiPKB3ommfkp/aL7yVU95esbCLZ0N/eDus/p7UOgcLu3xJPk2sc/vBNSFWb8sU4r7UqTt6+XAYqsVA6fWCcLd7O0T/XaHiCHczWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso3983498e0c.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870705; x=1789475505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvhvPfE1o8U9V0xY+ZBtjmprcW5MUShi55REbbGvMBg=;
        b=Rq/ss9F7zR0QAIodcdBxRrHYLJhpISV+mxPzx0s4/9mEciHWaUlyssaPO3O7qcf8i0
         j+AJetYGJAddb16wpbdoqHjqT1GZKFPSm8S2c00f79OCNR84r00iWO37haG0vZ2dOpbQ
         SUv3o5ZjFqXlDo7jgxqPAh5ebJkSnWALSRPsCuZc5wbyeHAyEDcCwEkvxc5ITeuh6Kbc
         btrUP7JXr6PBdenSCJbMxoZdrzjCgaEleDamO+OW6Xfota2pPIkjp6zCcjQc+t3sA1tH
         pDrYu4uwRtbFtMxlYN6CYjwXgJH0NUHyZGzjRzET8TVJ6JH9+GrI0Mvj4KgREpUyI66I
         F6Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzxI3uoRmR+lKD9CWJGi6aIh+B6u+i6BO7ErU85DelOmZ4gazYXWNkZZs7aOCWyg+rF2uj3ibpGRxuC@vger.kernel.org
X-Gm-Message-State: AFuF++ke9ROxZnNO6xvuURvfyuIdglMgGDBcA7s/8GWNYtXLJnCD+h0B
	0oBntVkjTXdvyKY/HMrgp0E8fZudypMKbfM5namuHzCXQF1yoewzTL91Aw9V9oDJ
X-Gm-Gg: AYBFou09f34zAqThCCj+sbIfwfwXiZpBCDzDv0hwmBg4sQHulckfrJFBbkkesUHmcCV
	ze3qo+DL4XRGFaoAZwPg2TZ+JAi3gEpDSNajRc9y+j6ull6A6VB8W7cLr/GgWkM56CWUDvpgEpB
	TfV4mDRuv6fXhkGxpYhsa84+x2NgMC5J/syKZD1EyM/3AviYtKz/rB5v8AXSHmYsCQHO7cUmQt6
	FMGPSWY3Yy5du+Rug3AI5qnvpXMECzguVNePRbhpLzL426LDFbb9TpKX/wnC5g6rRpca4UekvNH
	FKLmkE3qBk15MT7zM1HaV8Nn4NwgiscpM9V1ixXVZ3ka/NJpy4NB07vnBnLXYa8nwL2upO1F1hc
	hvM1c/ojfoYV0uezBv7KeG/W847+n8eD919m0da5REadhEMjOtlGmXYznzi2ygliGhP3iVYrNlC
	JqmRxYdFfIYLeoh3GnUYWggDyRo3hqxp2How59/4it6LXRZZ1Em2F0Cojuch/Es+apuIsfppUCa
	BNe8A780odN85n+g1mjzCspCk9K2b7SLWnF
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr12798892137.7.1788870705102;
        Tue, 08 Sep 2026 05:31:45 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980d774ad5dsm2419203241.9.2026.09.08.05.31.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:31:41 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7542a2ee156so2490756137.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:31:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycK7Ljx9VzmnuVNjkzukC7E909t0Cj3LdT2NRwVOIF/WbLEX780H/c7+exERGsZGk+C3f080Y/eCH8@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:784:b9ec:913d with SMTP id
 ada2fe7eead31-78a4a91b281mr10556868137.8.1788870699731; Tue, 08 Sep 2026
 05:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:31:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
X-Gm-Features: AcwNN1VHwQtBXkE1g5B-tKWZHl1EPxPwrUnATnMeQZH1DQxtt1IMi9pdue90c-g
Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> multi-function block that integrates several system-level features beyond
> clock and reset control, including clock monitoring, write protection,
> and peripheral configuration registers.
>
> For the other IP blocks to be configured a syscon support is provided in
> the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> registers via a regmap interface.

> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Register SYSC regmap

Thanks, will queue in renesas-clk for v7.4.

>   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
>   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes

Thanks, will queue both in renesas-devel for v7.4.

>   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
>     support

This is now in watchdog-next.

>   watchdog: rzv2h: Add syscon support for WDTDCR
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

These two have a hard dependency on the first five patches, so they
are postponed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
