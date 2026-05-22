Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B940244F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457410; cv=none; b=PONDLVKb6EiBSViLMLjwvugOfx2aSh3+r/QG/5DjbUt3dHgbvhUVwWcwHQAFtlhM9sp25MiRXInp5WPmkGcYJ6u9vb1FntLOEoFwFETqL13nrMNY1OPap3uG8tRDaH+Eq6KCduB1ZiyhF8Dxu9UuVIxxfPpxCldyp7EVkIBFG6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457410; c=relaxed/simple;
	bh=HEs2rq79YCoAiEGVJOXZDcuuCnNnzEJW3mYI9DGQ2fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lx3bv/IzEtZwODyYx4xHVb/zDA5mfXrYfAc2fzzkI02IuzGumGUAT9GOxmICP2pZnecfXbPRRdzfNO0iwXbbjTxq//Q1xCZ8EF7BjpmLtFljsz6paAn4vIzSk5QytJKkMZyN4XKh+XOnGkdHhummEc3CZXncKupNblSC0hvQwNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-956849ae1efso1948826241.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457405; x=1780062205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWzbSNX3RGbee5XiT1xV4dZKM9nwjUk9YQDs6iPG2rk=;
        b=DDEdm9L6h2QIRYs1N/Q8F+vZTr3iK7ep5zi/vgVZ9lj4+xLVc/2e/CPyQoJUD4qowz
         40hIw9yR9XP+lFUU/t4oKCSGhWxT7lDfN2UgabCz6IUV0DGefmvZ168fGJFtX7EW1K4C
         V4i6+saPj2qv8sMpklPti0VJnnI2+lHSfQtV+Ag+y7GYwU60lajssqP1i69GlDTf6kJJ
         Tblb+haS9m1+N+FAud/zSpqwAcoOtXgxf8h49leM9j1CxIm7lkuKoCdEhV0w6pmAtabu
         kXn6vOSn7HCWPBs9jsaXdkw/ak3jSm6sN+v8qd+YQ4e44RoU1Pig3i5Su4ui5HaoW4io
         Ootw==
X-Forwarded-Encrypted: i=1; AFNElJ/Az9KoOHKAe9BIjXzXdS40twJGkiw7dDvunvQB5BTTICkC4CLmEnvpsERKC/gkOMeOr2dn00bGPvMt@vger.kernel.org
X-Gm-Message-State: AOJu0YzqS57QqPDBbV+cyx4J0V5Av7bEEzYDivsyaiFTQ2H8Rbr2wLoP
	O8CWEgomT9brUe7VOB23+k6OwmsPjBRZBCramdM3NFBt6yt1Y6SZpoyObhT1hI/FbkA=
X-Gm-Gg: Acq92OH9C+7Qo3RrgU3cXUibaltaqoLbrGhY70M7Mba/M5G8TekSy12mudLFgbmxZdJ
	goCz/YW+aMFEFSFPD6UVi6tRJ/GGLTN7pnet70JlP0zEJ6ebIMSmVqIVmVAbdhym6y9euFXH0Sm
	RGJvW2/wls1j1GvSeVZNU+lEwnueKR4F+9NLAKs5+2X62nX5LgegoFzRFcvHMM8TEi5wLvt6Waz
	yCUnnAH8I5g5k8FEpFSE/hFz/4nVC4ImbWh2wFQz1LRQxtVH57D0m53VPOGBXnHmt6o3b5f9iYL
	NBq/ZJZR6lNlSrU/RSG/CvDx56iRpsDuoekoZWznk579nODOAWMoFvln47nIDL2Qb+MvZM9duqV
	VYmHupEPwTqwSRM5o38gob73KIiE9U8WrJkvXsSBbUT2qHXjp5TPPBZkx8q8xrmjJkac+Fb5rsl
	uKpvoddwLQfBF9qQZC7PpedU7c7kcp3b0Vtx0JbGQomskFOHate/IvOYhOa0zpGUFB
X-Received: by 2002:a05:6102:3fa4:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-67c7d976b13mr1692922137.15.1779457404660;
        Fri, 22 May 2026 06:43:24 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9617383b1a2sm1597404241.4.2026.05.22.06.43.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:43:22 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5751b7d147aso2760752e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pWDYZ7hEMu1UG4YuP4gyrEcbnPEBlLaXHljLC2zVk3wxc8PR7YVlxYvuV0o2XKtuvkQ2lnQx5/5Jr@vger.kernel.org
X-Received: by 2002:a05:6122:ca1:b0:575:3b34:28b6 with SMTP id
 71dfb90a1353d-586624cee61mr1849670e0c.11.1779457402270; Fri, 22 May 2026
 06:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:43:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEbmX0QqVQE7YhnCO325=2djd5S=ynr8DZnspKKK7WoQ@mail.gmail.com>
X-Gm-Features: AVHnY4KCEtGxHGei_0qihwJrEjH83nV_Z2btTPs2i2CQslPWM7eGYi7MBkb4Nkc
Message-ID: <CAMuHMdVEbmX0QqVQE7YhnCO325=2djd5S=ynr8DZnspKKK7WoQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove
 TCIU8 interrupt from MTU3
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The TCIU8 interrupt used to be documented in earlier revisions of the
> user manuals, but has since been removed. The corresponding entry is now
> marked as reserved in the interrupt mapping tables of all supported
> SoCs.
>
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual
>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
>
> Remove the TCIU8 interrupt. This does not cause any breakage as the
> driver does not make use of the interrupts.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V2:
>  * reword to mention that TCIU8 used to exist

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
