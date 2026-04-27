Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436013B8BD5
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293597; cv=none; b=SjigewIZJmzM4WyJIsA9nxf+fm0G0f0Zk4GrF8OMusza3oRnRLV6GnUzJFMOAN0n8Lp1yooXqR8nhOa3n4crz2Iwn3DJeSX6zlCy0hxNDu/oN57okSVWmD0ApL464PuwzI22KK8XwcGE6NqG8vGQzMiCYvhcB9mLfA4hUG+KIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293597; c=relaxed/simple;
	bh=JDIWJkl/LgBTnPaChq7M+tWmJ9t9TgrLrxcBQAaM568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVrZAKx6g9e+c007qJ/3FmnHvH4B8+tEAq69nY3tTui7x9Rh7WfoU+V0p2MiL5kwWhuLjxcH9BDHBfNAx+9v/hBhjXjMC939UlJmFS/M/ZhpyFsVGY/+YRP59kCyaRSF8IDV7ddqxnF4eSQR64yMmNakEbpFDei84h2UAIZ+bac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56eee0ba462so6161324e0c.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293595; x=1777898395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I4ulITfm7RcRo2LSwevKoJMqLeV3TvjRz6ydPI4T5c=;
        b=VFHJbC0tMfHo3U6aNh6iIf/XmMFWztkdQbIRe30NTply43N1ybXZ4LgUcjIryuNq8m
         b8dG+vrNUPZEwTpKDIKkUDFFIziEOh12ue6IIk2Mv/dtHNKaqT/KhzUYCONiGrRsgIVK
         WhqQzbI1xE3V5POcFcPNtfmeO3UKd1tXHcc1nKoCk8po6OpZlAqcc/mXm4uAVn3h6/Lk
         SlPxlH06KO7HJdiFQI62h291WttmJ/2vfAzBRbfuRChle4gaVPD7OiEJ3wn+EG2lvFN/
         x7bDR03DsiSKXyt4RVc1RfqkwusAzVE+Ixi10/T7E3yRMBERTR7GUYsBHxU3eWRtkFaE
         unjA==
X-Forwarded-Encrypted: i=1; AFNElJ9c8mZyryGiEaNYAyb/fZR2QXvnulvD83jar7s24HoZJMCwabXQb4RMml42IABH7XBa8ovdprjGADy1@vger.kernel.org
X-Gm-Message-State: AOJu0YxoGK+/NrW+feH3Bg1QR66Z9lGqiQSmNf7PIcfPDkVyyOfWEvPT
	ZLOcVIRAGzLhS9CaRxOhrHgXmD1FaUy1Rm9EundvuXT0bMJWHyTofwX0viHOpXOk1Wo=
X-Gm-Gg: AeBDieu26E1lovcsTEWJea+y0l4Hb7PWnG/4GVsGSrFbHj1XdnBvIR1+mz+h1g0YWuQ
	4AO62WEieo/aIRG6vG3S8K6yackH9i1I6/Nc/FlVk3xTjz+HL+LQLWTVvbPqFJfJLJeX4O3xLdy
	9VEPopqFPV6JBen6clARL4wUMFn0gv/mItYdbxBYVlTxo8sJGiodGWpKXh/IYWGEB3S/ecb9eDc
	ba75xE5PV6nn2zxd7HrdO4y/br7yizQFb3bIuUf1ycl+2NT1L8AE3XITQWiCgXXnG31vfKhGizX
	uPY0KV0R3rDb8vJ0G1mwBNdKNUnE2Njibp+XGDlxdwH/dW+53X7sc1gXoQR64o5X4EBv1dPJtyT
	/tBcJO/6odOPIsEsCdObMtiEX4oNvdNRFKW7nrbe4nlDl47CuFd3IUibQs9GpXM7TA6XLzWf18L
	1Rd7MtOmsyV54e49MoxjVodgDip0l4vDnmK/QaeQ/+z/2blxOuNnghibTbjj5ksTrjbiEXHj5fJ
	e62Cp6PpA==
X-Received: by 2002:a05:6122:168f:b0:559:6788:7b55 with SMTP id 71dfb90a1353d-56fa6673f07mr14586265e0c.3.1777293595166;
        Mon, 27 Apr 2026 05:39:55 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa933a54dsm17853694e0c.16.2026.04.27.05.39.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:39:54 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-610f4cf6ddcso7839980137.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:39:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TwM8tqUqKd01Qyn4pOaMuFun99jHvuXCIu2/xvQ91GXGV0TW8Q8uJ2SY1DHG44DDt91cwltT3Z6lW@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:60f:f686:3de2 with SMTP id
 ada2fe7eead31-616fd91c77bmr15161873137.10.1777293593886; Mon, 27 Apr 2026
 05:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 14:39:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8TOLtTXiEDmze745n1PUDuXB=ngrZpmQ82u1wzM9-jw@mail.gmail.com>
X-Gm-Features: AVHnY4KkIQs5InenbyGUiwPx39HZwsYBx-UWGIr1zOzvwEycJZUsx_PjwWzdJxs
Message-ID: <CAMuHMdU8TOLtTXiEDmze745n1PUDuXB=ngrZpmQ82u1wzM9-jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: pinctrl: renesas: Document reset-names
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> All SoCs has multiple resets. Document reset-names property.

have ... the reset-names property

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
