Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ECA4229BA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660877; cv=none; b=SEgFCucHpyZGAX71aeCMQDRxm8URAJFPFI+254XPNquyXa7XaHfUzqUruPx+HrZAyftVHCRCPlsXEh7OLwMM/437j+/R8C0oXAxK5ZBk1Js013cuMKGK/KX+MIdmAYLFGt8O6h85/GZmk1cUaSI2aJau8INPmKnaIk3wKJ2yBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660877; c=relaxed/simple;
	bh=vTlIBThix6p5ACZNkCu4XDSKPza1TCok1RZWv9Vcpu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSlX0H0jC0vVyniipxTOKJxHnrJGrvZTC++/ZJxzf/92xPwHyYzBdRog+wHf5fSx8tGAEumuoC34/uBUiEnYJRnQBhE0f6m8NAAMG8JJKUmnKSOh5TPlUDg3lqEQBCdUd609DSKg0CN0U3GSBN+EdU/TphtXyrSJpcbrJqdMb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-77e354fa83aso638075137.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660872; x=1788265672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oIDFWZS6RDEUFbtSxS2ibtPun+j6l9sII3nkgLpimSA=;
        b=az+LevT70F6mCCRebOYhnIzw8BfZyEvY9+pOyJVj8w5jMWhYVHu6qEz2yISG9rPE04
         td6dquJX4r8E5oAQCVpqZoCC92SSeKH+GoY5mnLpMkSO1C63U3QT5tQwIBIzxNychJX+
         tIwhVILXnAaMZkeptBHjvkglV2JmXQ51r447NN9day2SX1/uq/sDhfuxRWVUhBQxfWED
         gjQtpLpJcZeVH+a1lo4L2R8Ea4q9YqcapiKsSW2aGc3i0lQtjWB58mNpk63ZfhJWFOUn
         s/nn0S8moEaLrDCRERCG95oRU/+M2nXfcG4og53BcIRAn+CYdAnVv+6dNYF1lep77vZD
         w3dg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2LNl13hOJDuj6NM2U1qaTMEVv4k3hY5IwGlfyN4/dMGH58nWzVufpdta3EWw0wRZCjzSLIMAB0bTa@vger.kernel.org
X-Gm-Message-State: AFuF++nwTGToall8eHtvJG8HUGTKJVH2rVeuVhMX842RvmvcQfVaiv8S
	InmucjQs67rKIYIBhW8GXCAUmbhTlZYRhaHpgEapFlAqlCGQCMNeBpoGrv7O80Bm2iE=
X-Gm-Gg: AR+sD10Id5/NwA3uAq6TWk6ms9XPt5XUQNbleVHQAe1GadTf00geXE2MS0DnDPwU7I/
	gKesnJhHDRUi8IblTpDW/KK4/vXE4cihBxTKFD63ZzOfVsLnA3HIbeDOf1J8twibMnV5z9XDdb1
	YL8EFnjVzgwW2/E5bNPEmghDd8cgCpw6Lf9JK1yOAwHpqDX2YBDWTveR6eISyekzXuGnFV+ju2g
	hYDLePMbC18OcrSOOkX1b9oxzFYNAfoNO84s7uVEVWDpgiChmPqpdEs2jCs4iRADbWbGgdvroQk
	bw8zta4wqNYxi/pBhaKDZFT5FgP+zofCW9I3/8qHixYq023bMXCc15xmxVFGUFXbQ8Q5oSmHv4J
	YxEcZhHzmRfypMEK+9tAPjb3jeMsiZBrl1btfC1o4Opz3bn/Rmhd8Uw9ml0c+0ovaxavkMlBE/D
	EaD9ciS9Nl/KSIZZiz4vf0rMsXmjhXAMsSkCnIzaXIutuiE1a2xHdUW3iAmcw8N2izNxgLHDIpP
	P9ifBi1pc0zz3Lto/eteKj+tA==
X-Received: by 2002:a05:6102:161f:b0:780:8536:f53 with SMTP id ada2fe7eead31-780854567aamr704353137.5.1787660871876;
        Tue, 25 Aug 2026 05:27:51 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7804c715dfesm1022522137.3.2026.08.25.05.27.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:27:50 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96723c7151eso2122037241.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrY/6yFIyRLL/fRCqGjiBWEI5lZRSvaJvKaOU19hOcwk0AeCy14hhthDkHsoiSlfh6QXtSd6MqIs24g@vger.kernel.org
X-Received: by 2002:a05:6102:956:b0:778:9e3c:5760 with SMTP id
 ada2fe7eead31-77bd288c901mr8408694137.11.1787660869267; Tue, 25 Aug 2026
 05:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:27:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyq0pO-ZDMiSx6k5HoT4Y1W+Ov2KRWRr_OCE_ng8BEVA@mail.gmail.com>
X-Gm-Features: AcwNN1VVA1JsDEFfJkQvCcAZH1nZvL8L6xNDA-rPHWfx8tfe-s3NaRctdvNNt_w
Message-ID: <CAMuHMdXyq0pO-ZDMiSx6k5HoT4Y1W+Ov2KRWRr_OCE_ng8BEVA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: renesas: r9a09g087: Adjust CPG
 register region sizes
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

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Increase the size of both CPG register regions from 64 KiB to 128 KiB.
>
> On the RZ/N2H SoC, the CPG/MSSR block is a multi-function block where,
> apart from clock and reset handling, it supports other features including
> clock monitoring, write protection, and peripheral configuration registers.
> Expand the mapped register regions to cover the entire register space of
> this block so these additional features can be utilized.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
