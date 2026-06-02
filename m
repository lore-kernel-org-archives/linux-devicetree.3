Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346137D130
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398070; cv=none; b=QRIKRsAyCSumwMuFfNwj/9jFORBP9A8R0b97BmZw82fTHYtjv7GJ8ivBbd2T8Y8rfyZ7J8jIIx7uA16tjt2ZlB3Srnhd8mejCrjhnD4VqMobJ5bPXQulrsF4jgiLRDC8J1WghiRfi+i47op+DjKSBYFXg1SjrGbdjA3kx0a6DUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398070; c=relaxed/simple;
	bh=NqH1FNMQ9zyJu1faayTHUSgA7NJKPbme9XX6KBLu/0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpTva5yLsRsOlzx0/kVPhjXLmsQb60oGg1quLXehBgZUl3olLjQjwAgt97jVOMUa0W/HYkHijSnVSUq+1pYlxbOVJhsekDzeVuktfwIot3xZ3UbtCHuLQbaWjwNyR26MpTkOgjEp893EqwlFcfI7FoXYGlqKrjQaVe9dWWc1Pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9638d15f871so1843237241.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398066; x=1781002866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quFd3bFmDxUCLWFjABTEW7yL2A0qhMBAyX1hbqGA//A=;
        b=FDEjqqErelBIZ9iJ0MVPSGKc/PZlQPpIs3O4tLm2kdAG/Q9ZW6BG3pZets23ojLYkv
         DKxlix868r0Sp1W13Pt2nr+b6NRkr6Q2pCjMK2ehR3OCOgZnPbNxnCB8DPITNVCGnULZ
         UsxvIaVK2sglcO27TJ1K9DvsPdK4FPekF3VtwwbOEkFbXwE9cDOZBD47066oXPQ1oPX7
         Sfy8dBEenFRUezC0+5AiN0Oll0RceAJVVJxtkCknJT1vs3ORi+LBvhs2UVnzDDOU/PAp
         jQ/P1EN9b61i28GpZPbciaXG44tC+g3u1BROHqSo5O8MWe0yN3RcMI2H0HHOOY6lySny
         utMA==
X-Forwarded-Encrypted: i=1; AFNElJ8pIOJeVJTY7CnbInwQkvaevNUkRCK3Dr2yQSCnopfCBt70+xvUWBu79/AXYz6tJ3IEUs96S3nJ/9qW@vger.kernel.org
X-Gm-Message-State: AOJu0YwZvACIFfLDHL+Jkc6ckR41r34YTEDNdRTMZoYJpbXbKE5Wp6aW
	Lf++JFwjtfGo1BLbg4GyUdUOeX/EZ/6bY1SLEIO9fB+PSJe+Hb+Iu8ykj5LSbM/o
X-Gm-Gg: Acq92OGl1wq6Vf3C2wGl9YW8NLrau+x2jlSjukNz9Vy4T2s+W0Lah6y5Xtwj0hpa8np
	KdBGGb9aBZ9tHZh+BOowEKG6eybU/KFJw5FRJFHxHsUi2Y6C8XQgbSaX83+6bXmprALyiyp/ZtM
	HEu/6GsE+AhpLQfFQ4xQnqZtk7R5pbKdeMBMn2OHaAQIygcbsWhHWs3iozq3b5aqxmKh7IRf/xA
	doVgT8qNAwxlDv6mA8Gke3+XifRAGs1F2wFiUP+GhnsEixdeKOap02giSPq9G7TVHam0NT/S6cx
	6liT+mqLai2NRKf5hW5V+40frfasabTno3PO4lJAAH5FNaZKH2rSd8V4bVBwD0vjCwxN5QLo5Of
	GsZ0BtbGyAv9JFKKhd5Giz4RLONfXy3TrwQ9GL7Cuyz3b0aImHL7tzNWMx9LHg3CxT7Q4OdXjvR
	3eE7vbOQsV+L7NJZH0k24xI0WHsF82oDEPlkJ8s9GfN91dPD84f85TAspn7RKM3TuKfLZDLB4wp
	IY=
X-Received: by 2002:a05:6102:a4c:b0:6a2:b441:e0e5 with SMTP id ada2fe7eead31-6c68faa9f73mr6090216137.8.1780398066020;
        Tue, 02 Jun 2026 04:01:06 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6c78792bc3bsm7245861137.1.2026.06.02.04.01.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:01:04 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so830955e0c.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:01:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ81VUs27+LTrw3ltngsig1SxfrXmKQfXzmrsCIe33d6h0s3+oXg2Jloa1xzQz7pWyshplL/Zm4vQTk+@vger.kernel.org
X-Received: by 2002:a05:6123:2e6:b0:59b:1012:3f42 with SMTP id
 71dfb90a1353d-59bf37a2880mr7199139e0c.10.1780398064583; Tue, 02 Jun 2026
 04:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529130704.327505-1-biju.das.jz@bp.renesas.com> <20260529130704.327505-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260529130704.327505-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:00:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhdDc1dgQqDUeiOmMnM05+1U2zitV0W_9rwNaHdfVaYA@mail.gmail.com>
X-Gm-Features: AVHnY4L-jYfQDDQl3nCvQFzjNbNG3mAAr1K9WWmRppD5oHyedAVujAGuEiu4-DQ
Message-ID: <CAMuHMdWhdDc1dgQqDUeiOmMnM05+1U2zitV0W_9rwNaHdfVaYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 29 May 2026 at 15:07, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree nodes for the three RSPI channels on the RZ/G3L
> (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated reg size from 0x400->0x1000.
>  * Dropped num-cs as the hardware has 4 CS lines and the driver is
>    hard-coded to 4.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -442,6 +442,75 @@ rsci3: serial@100f3000 {
>                         status = "disabled";
>                 };
>
> +               rspi0: spi@100b0000 {

Moving up before rsci0 while applying, to preserve sort order
(by unit address, but grouped per type).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
