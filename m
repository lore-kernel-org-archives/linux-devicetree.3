Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FD23F58CA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677329; cv=none; b=S0/ZPid3Z1yNFdrOXUS4rQPNXGRWM5QW5cXYyqyLXD4aCeB7eBse8WSf0V6RZdLUAhqQKgMM8GkTYYDkNMORaXLSHCFFLHwSVY52l211UKp9YQnq+Hjw5FL52sMWlT580+hC+eOH4wOlxn/NbsuODnOS66/DTsC0hN7vyc4WDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677329; c=relaxed/simple;
	bh=IQCTtQNW/hKXRkFnI4RcyXAnrgrs8DL/pT0BVeExKWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAfMcDc7EddModBoeV2QBALKrhUzlykmlIxaXIDWxb8hdkqnFEF8nbVfnKkF0841UNDwKYxUfZwllF+DIMgEABDHVMJ9XTe4yT1894srMlqMWiodL+CZ1g9Yu/vhXFmm+/Nl7nFwBXkposzJkpf4S2IzuYoxVHKYKec/DOjPIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-736eec08c43so647777137.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677327; x=1784282127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xjx1ETi0pE66yaW23Sda3TmvYDKWG3Oq92tmDl3ve2Q=;
        b=WbhgrXtOGhVtpRD8b1ev0QNxkpbgoxGNkKqyvZnpZG2kVZ+E8YY8ylef1D3YUSyFQh
         J33+j7UyeqSL0TIeRuXyhsBKwGQmUkxbY91gSflwFGSskOTdsWH7amqNw0n2Jo8tCXP2
         wLiQ2vLXMBgB3FkbKcMIZuJiMMJESKoIVkjcReFAKS/dXoL1ORu7SsS6x4RrLoGFwPMB
         LgmjNM5eZ71816ajPC38YdvExSXzUQWRD/R4vZcpVnuck5qbrmRkiGgjp7FkWw/sdsdD
         tjfQP7SmCpMlcKG/dW4My37rmFnZsIPAHoPbhFDOkBFVKBasuxY16jNeaFv3QkXLT2gq
         EQJw==
X-Forwarded-Encrypted: i=1; AHgh+RpYYp3mmsSBLwxx6m1zkvdfDX2Z8p2DC9juTAif0N3N9J0fkFWNbMoqt6YczA2wBDdDJP9IrWWqjdDW@vger.kernel.org
X-Gm-Message-State: AOJu0YxvoFD1iTC03JegCAQX1ldlEg+FkfDJqeavjA+gCebZKLKQsG8g
	XRo7IYt/rdv2BtQTXmYM82tFro2xjba+rCGl4ub4WhHB5ib3QgmkYChMrQVZGd35tO4=
X-Gm-Gg: AfdE7ckp6RcuDY4DXEpmj+B6faHJwTF+Ix1QO6zNWFvn8Nu8p01rdfX8z20pqfkCQ1b
	ChnqYzHdqMKYA8/urGtvIW6x+Sa/mpvJsG/kcSJOslO0bBC1/Zc7HAkZvUM6TFGMYLoW0WJPBy4
	gyuD93b5kL/02QaJ3cxrQtAeyn8xyEqT8SPbfwepeKWN5JvyykD3W5OHg7rK+5fBeUfC+i+smFh
	LNjvBPoVTsREhNPhNCQKd9s2ravY5wVEWmNMldSoQ1QX8EjuGyNxTLmOt2aESOVi/iuvI8qCNSJ
	xImFbCIw3tlb0dTzWBls1q+fLtsooWv7JcYbKLwClfugO5dE0Hb2q5i8poLEx0l8Y45eSXcniPZ
	sPgBOBMVxBm5ALUNxoKFVbv5mOK9+u3ooChC1KtHnjFicLo+HPIDV3lPuQNnMC8BhrHbSZjMf6Z
	9OQYP4ITocLtNWEBHq1yDQQditbi8UQ6w+tJurxt1448MALJ5z0A==
X-Received: by 2002:a05:6102:5793:b0:650:94b2:b214 with SMTP id ada2fe7eead31-7450d19418bmr1600599137.12.1783677326840;
        Fri, 10 Jul 2026 02:55:26 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38e25sm4869455137.11.2026.07.10.02.55.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:55:26 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-736eec08c43so647757137.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:55:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpyw0aM318wC8eMi3fRJOv2lKrpxqU1IkMIlpoR8S1TI7rgrpHp1pCfsx6MHdeJpVrjUXk2Q9+tE1Sw@vger.kernel.org
X-Received: by 2002:a05:6102:40cb:20b0:744:f2bf:44d2 with SMTP id
 ada2fe7eead31-7450c6bee09mr1250670137.3.1783677325709; Fri, 10 Jul 2026
 02:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 11:55:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBJuN6ZJzTMU_Ww7ZUm2Apmp_AaubAE-My6DK334pLPQ@mail.gmail.com>
X-Gm-Features: AUfX_mwl89Zp9wNyF-c_GbFzjrveXMEBWiOpAsRGPClNvXP8eS2mrd7PvQf895c
Message-ID: <CAMuHMdVBJuN6ZJzTMU_Ww7ZUm2Apmp_AaubAE-My6DK334pLPQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 10 Jul 2026 at 00:12, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC.
> The inline ECC utilizes areas of DRAM for its operation, which are
> in the DRAM address range, but must not be accessed or modified.
> Describe the inline ECC carveout areas used by the DBSC5 controller
> on this hardware as reserved-memory, which must not be accessed.
>
> In case of high DRAM utilization, unless the inline ECC carveouts
> are properly reserved, Linux may use and corrupt the memory used
> by the DBSC5 DRAM controller for inline ECC, which would lead to
> the system becoming unstable.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -107,6 +107,47 @@ tee@8c400000 {
>                         reg = <0x0 0x8c400000 0x0 0x02000000>;
>                         no-map;
>                 };
> +
> +               /* DRAM controller inline ECC areas */
> +               ecc@10cccd0000 {
> +                       reg = <0x10 0xcccd0000 0x0 0x33330000>;

I think you do want to include the 64 KiB block of unprotected RAM in
each region, e.g.

    reg = <0x10 0xcccc0000 0x0 0x33340000>;

While that block is usable, it is not protected by ECC, and thus can
be subject to unnoticed corruption.

Alternatively, you could put these in separate reserved regions, to
make it easier for users to re-enable them if they don't care. But
those users might want to disable ECC completely (is that possible?),
again suggesting to keep them together.

> +                       no-map;
> +               };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
