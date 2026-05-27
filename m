Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678E28D8DB
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866299; cv=none; b=jvIRoxsUBPavriBVp/HQUfz61RYyWEgxvgdjF1f15c8yRW+zhKGAch/xJmZBgsttRHSe0HFkMs1GyWV/V6Lk7oUyeoQpDSXBxyZtGWn3lJbx6PnhozLQ8oJT7E2PGmUyuyl1PSQoU20u2Uyvsg2qfwb6ox/Qnss+EumwzkhxfZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866299; c=relaxed/simple;
	bh=Dao9kdOrtlJ45gmh2RbDmGbQQTZZO+n/rTm5/im873w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GL2Tw/cjM2P0+VdaytAAl8mMKF0VgQSkOnhOyjynps1n+V1gr2YxHN+y5CAwqgJal/7ZD3gQ3D4eXHhXyhVv6/1yvLis/hscV/QlFFN1A+d2PIDeYudbJBt1iOguMgPSyW08uIhWEwU1TxT2J5XfWQJdvlrK9QU2Mjsn9vRrdC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-575602688deso4061025e0c.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866297; x=1780471097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy2hrrBG21BdHck1YdIk1SaSJwWCDlg+jpuiQs79vfM=;
        b=g+lJymsN1DW6kBYEizbZawy4k6gzfO1OpAeiMPSJztDSAI6P5ss1BehfR/LTVZTp6c
         37mfYMwe/dU3XFpTzYaoXWrn77RFljBbxx2Lyyplv5j3pLQyhxwt9q3zBsqRkwiCa+Lo
         HU4wKT1TA5KXmQQJysB77dYSili9D/H2qmX8xIQk0SZQHpBN01VRXcqVQCC9T58xjsW2
         NBkhArn3LuRvFUQDJol4rCb8pJVJPYQWQfK49tcD5BqhpEmaREcmyxDAJmvEAThPzd9y
         LhJIMm4n/Qh1rkivQ98A/peiumyn759YsIbh2XVb5Y1pFjEnqtLDPyJcNUKUVTwT3q4W
         gHUw==
X-Forwarded-Encrypted: i=1; AFNElJ99spW/AVBcSkBKhFPhfGseyRZkLU9NzIQt5EQWQs+zspm319FNDjURbXZk9Exl6snJ+QviIbuL1/FO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7cQcNoTG5rxYFqJuRDblqZje8ZUjUXDbIm4Y6O5q1G+tE7Bk7
	GTtWf0Wt2cfHc8ur+rvGTqA9poyS7QvbMJegQHmwaG4UZ1XXtOMYbBmVLMGIn9tkgds=
X-Gm-Gg: Acq92OGkZYWTqYRnb9hKy9dkB1lu5N3UJTVClJ2KdhVnIkP3BaosbsmgHl8VE4jnZiV
	JeNJdE5Y1V6u4cXXNAtabdb+zafnX0CQX1PobA2BQcO8/XOse3m0/mJE08Cycwm1sr0kHQP1Wab
	5lJXLCy7lugkbJ3czjcwyuAXIjoKHr8aDWLknizSdn5fi06IbD2dbOb104exdMBWu1avBFk+ie3
	Olu4vh13LuIAqiEVrbcLzeOKzCF7Qh+VVNd6MrbHO9xvxHKsvHxKE4BKRpJiWjQEwyQSegQD4I/
	GOMujC8S8oCskroYEwo0G1N4u/Ggs391jhhLwL9M1t3M4QMIsSD8UyCZ8nL8KqCLEr/2E8/3jfp
	jJpTjpPuCvl3gUNqdZvXzbkcxYVsxQj80Kj7POHA59lUUkiIBNtfIY+CFuMhErnVufxEDXOd7Gz
	FdvNwW0uwRat1aMlAIgC8Pp1zZZdOpHk3c78yIEdOT4zy3dkZ3UVgg6relyRJzx8acvg7v67lpO
	Dg=
X-Received: by 2002:a05:6122:32c5:b0:575:3433:bb34 with SMTP id 71dfb90a1353d-586607b6fdemr9326377e0c.7.1779866297288;
        Wed, 27 May 2026 00:18:17 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173baf56bsm16126933241.13.2026.05.27.00.18.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:18:16 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5752b279662so4077067e0c.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:18:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+x5Wd5zUV1v+k3rUKLndTfkfM95zL57XFws4XU7cfesIZGpfZ9pOzwWsKYxdhXIvHB7a5Gqp7RDSM+@vger.kernel.org
X-Received: by 2002:a05:6122:4581:b0:575:a5b5:3233 with SMTP id
 71dfb90a1353d-5865f154435mr10929054e0c.4.1779866296537; Wed, 27 May 2026
 00:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:18:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhk2rf9+1mvdoUbd2T=vNC0L5UXeiEzwDPvfMOT==+mA@mail.gmail.com>
X-Gm-Features: AVHnY4IRt8fLyNfU8YOCQpYkCYZ9ntliUcjglmYbKUGrrnuUFeY-Av16LJkvBmg
Message-ID: <CAMuHMdXhk2rf9+1mvdoUbd2T=vNC0L5UXeiEzwDPvfMOT==+mA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1
 Redistributor description
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 14 May 2026 at 14:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The Renesas R-Car X5H (R8A78000) SoC contains Arm CoreLink GIC-720AE
> Generic Interrupt Controller with Multi View capability. Firmware has
> access to configuration View 0, Linux kernel has access to View 1.
>
> The Arm CoreLink GIC-720AE Generic Interrupt Controller Technical
> Reference Manual, currently latest r2p1 [1], chapter "5. Programmers
> model for GIC-720AE", subchapter "5.4 Redistributor registers
> for control and physical LPIs summary", part "5.4.3 GICR_TYPER,
> Redistributor Type Register", "Table 5-50: GICR_TYPER bit descriptions"
> on page 200, clarifies register "GICR_TYPER" bit 4 "Last" behavior
> in Multi View setup as follows:
>
> "
> Last
> Last Redistributor:
>
> 0 ... This Redistributor is not the last Redistributor on the chip.
> 1 ... This Redistributor is the last Redistributor on the chip.
>       When GICD_CFGID.VIEW =3D=3D 1, for views 1, 2, or 3 this bit
>       always returns 1.
> "
>
> On this SoC, GICD_CFGID.VIEW is 1 and the Linux kernel has access to
> View 1, therefore Linux kernel GICv3 driver will interpret register
> "GICR_TYPER" bit 4 "Last" =3D 1 in the first Redistributor in continuous
> Redistributor page as that first Redistributor being the one and only
> Redistributor and will stop processing the continuous Redistributor
> page further. This will prevent the other Redistributors from being
> recognized by the system and used for other PEs.
>
> Because the hardware indicates that the continuous Redistributor page
> is not continuous for View 1, 2, or 3, describe every Redistributor
> separately in the DT. This makes all Redistributors for all cores
> accessible in Linux.
>
> [1] https://documentation-service.arm.com/static/69ef3c1cd35efd294e335c43
>     Arm=C2=AE CoreLink=E2=84=A2 GIC-720AE Generic Interrupt Controller
>     Revision: r2p1 / Issue 12 / 102666_0201_12_en
>
> Fixes: 63500d12cf76 ("arm64: dts: renesas: Add R8A78000 SoC support")
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Update GIC-700AE documentation link to generated PDF
>     - Update commit message to match the PDF
>     - Add AB from Marc

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
