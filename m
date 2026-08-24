Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6E3F326F
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582017; cv=none; b=Gyy1r5GdVT7NMOxGJ2gikffV0pTRmj9CdLreXJ9wjInL04Gw81Jb34cgX/E4E/iSgefJBLr4SrLzsp3+duhfXXj/nxu3WdJhO+oj4vJlcvNSd8xlCKhmu/15sS2n8+22LYMjMid++x6vfl+WvsSSynZEmiCmQCZcRyxV7/lGiFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582017; c=relaxed/simple;
	bh=9lOz/HheY/JgyQO68g2hJfw7pgjLIzpYJzoipc5Lkcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s57v+snhKvVr7q8nfzWa5sjbR+X4TGATzzowi/FkYi1XoSTNiwdfEgQgjKF6c4OOynQwMKFKiwTlJdlmhUzNmERrXdp69nxyPKBSE61UdxeVa223JzvZfPLfhN6PMrAQqwN50ELbP3csYV+QT62S/JhU8pxi9IMxmZhvY6UUj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e592da74so494737766b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582014; x=1788186814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3GPQezqjhBkpGCOBKEYotnOOM0fAmn0TURaAn/z0fIM=;
        b=HxDrCD2Lf1smEx4RgNMWbtDdrn4XLcMPJtKBwDk4y7v+WyxPDGyouuEm6FnbH2m5Wd
         uo/RpXjDQJSGqXFgPLgoz3HKFPGbHh2hnn0inqc8Qy+7gDAWFRmGm/+i5EuWQ/nctMRk
         9ALMblpLLzeV5OqE3KGKAN1/hN/mN1lKlVE2fIS5FM9QKurO+agZcrOoSJbe2tomxw11
         8q6mwumCTr22PKWff2pif7MuNPVAeL3XrUXgt2FxJyKA3W5ggpis1gt9SEmHcY8Nclps
         A4xZAcS7thEeLYHalo/mM8Jnpnl2mzuAhD+QqnnQc0b6qNXOD2U5cu/EoqU0cCz0ls+F
         Se2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Cu3jU8o/gckaZPy05y3k41+VaXaDlHT4M8ksF8N075unKMIUO28McSCm3lkVEgTyy+rzEIncWWph@vger.kernel.org
X-Gm-Message-State: AFuF++nUSXRc5TxmjXwKMiry8uMaQ4bLj+7dnYj0mGZklS66nL7xGUTi
	1zn8jrNu/W8J2MQxwAq8CfGsb66xm0zHPDH5QWFSBO7VhF1x5p+t29b7AN576CEcc+Q=
X-Gm-Gg: AR+sD10p+RmlgTHl7uqfCDNlxN8xYpGGZLR+GFKvKhtM1AU9enOKvz1lTfN0jBkiIhC
	pdQ96ucIE3MU3a4Z8Cr8K3EQrCpTMXGCx6QL4h6bnshwmrNYyOFUTOOJXxiZOHSC5pyvB6vxwp+
	ATgy8tgrrgzhBOvD6Rw6ATjhOYxpp+k/cfnYqHNBXpGKx4KiYYPHy40RTtCGx2a/DzYAtwk2h/v
	X7lmUO2hw8cJroVuAhLWVhpTYgl4dIs5yC+4KDC7zyI0KQilnm61STqyT+igECxMBJjeSvK3ztQ
	D6p/K02JrXtI+T8VEQ+P8gnVs3HUExtfcKOQOCeDk7QNTAV83RF3oamBPJ7SJWDFvSg61rO1E5L
	uTNZkBt0Rjuxn4Ngp1D72fGd6R1amSTKYF9ae5r0LB0KK1tN9mG6fjTK36t2U6BZ1pODCnSR8K1
	Re5yR/AHpDFP3qKkpOdxCrZrujMhOm82EGWbVeByF5zL30/jpT3EoH0rWwD3Wb/bqqAu31gsB8T
	6T1Ev6A8vqSx8zWDYNzuNSFKg==
X-Received: by 2002:a17:907:7254:b0:c20:af9d:4533 with SMTP id a640c23a62f3a-c2492625c49mr2024837166b.19.1787582014078;
        Mon, 24 Aug 2026 07:33:34 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24e1adf5c2sm4972666b.28.2026.08.24.07.33.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:33:31 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso6289385a12.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp+/SdMjJcQQGhKa/LwNYyx6XomvOjUURw9shVmYxLVwG5r6J+7wfEP5IxtMBc6KeKh+nslNzTi47g7@vger.kernel.org
X-Received: by 2002:a05:6402:50c8:b0:6a1:df2c:cfa3 with SMTP id
 4fb4d7f45d1cf-6a582b0b822mr20096659a12.4.1787582011648; Mon, 24 Aug 2026
 07:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260819183829.3953529-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260819183829.3953529-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 16:33:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBNtK_W5PajM2-4gvUWWU05K1hh4a=Y+cfY93Q-P+nYQ@mail.gmail.com>
X-Gm-Features: AcwNN1VXBPFtA4Vecf3pV2N4hIm6QeQ_OHDpTywSlixoNeYKbAmedCU3SlFkP2A
Message-ID: <CAMuHMdWBNtK_W5PajM2-4gvUWWU05K1hh4a=Y+cfY93Q-P+nYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 20:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DT overlay support for enabling the DU/LCDC pipeline on the RZ/T2H
> and RZ/N2H evaluation kits when fitted with an ADV7513 HDMI transmitter
> on CN15/CN20.
>
> Share the common ADV7513 and LCDC pin configuration between the two
> overlays. Disable board functions whose pins are reassigned to LCDC,
> including the affected LEDs, SDHI0 on the RZ/T2H EVK, and I2C0 on the
> RZ/N2H EVK.
>
> Move the LED8 and LED9 preprocessor conditionals inside the node
> definitions so that the nodes remain present in the base DTS. This
> allows the LCDC overlays to reference and disable the LEDs when their
> pins are reassigned to display functions.
>
> Configure the LCDC data and clock pins with slew-rate setting 1 as
> recommended by the hardware manual. Use slew-rate setting 0 for the
> HSYNC, VSYNC and DE pins, as testing with the ADV7513 showed unstable
> display output and visible flicker when these synchronization signals
> were configured for fast slew rate.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Renamed HEADER_IRQ8 to IRQ8
> - Added irq support for the ADV7513 in the overlays
> - Corrected the DIP switch settings for I2C_SDA1/I2C_SCL1
> - Added missing DIP switch settings for LCDC_DATG3
> - MOved the header include at the end
> - Added a comment for i2c0 as to why it is disabled in the overlay
> - Split up the du_pinctrl into a group of pins as only sync/de pins
>   needed to set slew-rate=0, the rest of the pins can use slew-rate=1
> - Updated commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
