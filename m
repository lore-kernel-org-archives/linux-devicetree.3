Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E137C1AC44D
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133240; cv=none; b=ofzcmj9GgiCCWT6JCPfUS4tcdogyzYJcyLzTLh9fHUiZwUYjTTyxzP6QkzTR+ppS4kYAH+gPQRKAEon4k60t6rYmlmFvDOhD7IrKoPKKnY2AhNNRnsWo1jwCGyZap85kQqiQTXeVGdTAZtI/ZstAWbItSYxOdrLgrCdR0pmXe/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133240; c=relaxed/simple;
	bh=Ja7rWk0kCQqkDheHxLEOplvsTyShM6xX5CdHdSjeR8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvM9aIpC5y7z9N2CkkpPmkigbMXCi0tB6xkvRn4eHRvGh6tP4I4cO8m0N7QQ/fwJTJj6VJsGW3hW3aHHYTv6vkPIBnVUnY2/F1kf3xozZd2txdUEelexhw/VGTvKSLeKHppDOKJxKBanzSPo+qBsfme9Ct6PYRR6W47DS+3qNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6c3099b11a9so1535344137.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133235; x=1782738035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XHozepz9cMj0FQe/9LKFDJUBs+Bmee9aT9l7VnUUd0=;
        b=ZUClZdzvsexDVvRGyjlrolyuBod4cP0k/eTJk14MOeNhs0n1oWeSzpcuMO9v44rvSs
         H6Vs25CLTfIkKnJzlKMM5/O+wrhCB8BnfH37rJCMNgsw7hHybL65wqNyOp+oLeCbUCa2
         wcxYGe2tetE+ZG+iJPJLrxBNiaHNh/2y1riuLUc1gzkQpv86qNi0AMF8q9NP6WHCdqgk
         HaJddHlWd8JIvhnuG9jFbkluImWIKLmilCP16ri6czRwiDLvj33+BBLQIGzXAk3eij97
         c73kmz5gF2DvX84CSGsyj37sfeVRsuX9Zzj8zfzor5rjcwnU/xIo+gPpSCve57nQQjrz
         UBXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UXfPnJqiloDXdtaIlCqVCs4xG6NmfDZ7DcaHZ8eMtLrSbJpHuVcuGJVgCG+f4wgN4/KmEmjQHbJ0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqain2SsIqRkOSmelKDRWdaU0vdYbVSHl8VVfkqkX3YG9UQCkQ
	ANYqL0qW/BQMJEfSEEujnZ7dyZOuP2a2hSFfnXgeWUaeiK2JJRhrmnyGaVnj4DOb
X-Gm-Gg: AfdE7cmYWior05nwISDnkzH+eDe1vMrFjpBEB3Po7Y5c6VbiNsGfJHfaUY0ghRElxUB
	WRL3H5i513JgEfvqrWHGR1ZfT+0FlBhL52nQMyUTtq1qavGtDn7000MjVyUxGhI3/mTMMVvbBEZ
	vYdQB4tmP2HY7Di57CPRuAWyfuXGhAZ29B9CkYmTc7+CJTKAwOwH1GsY/Vq9un/tlffsjTom1fC
	/CIj+RQv9YRukpNRdqAYZzkF5kugxzOAy3Ry5pT4857SxYvd4F2DIOsqtJF+x3rZHWmAN75KznE
	7zf+K3wD/r4eccx+jrhHG/EVP7sWqni6zHm0xEAzw5bKnMljg0UdP7Yripv2snoDg2OG4B4D8gb
	V/5AOmWZ9R9vqHVL4CGA29RatTO8VMtE0sOtCKEnOaUS0m0lhmDxtcOilOkx0s8oE8yujpOk14j
	GF63IScVRLlmRUAwuQjrzgBL+oPuRW3wses/jFj+093jkhVrxXaAoiMsrsIsQs
X-Received: by 2002:a05:6102:c8c:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-72a1f9fab7cmr7085338137.24.1782133233921;
        Mon, 22 Jun 2026 06:00:33 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba543e440sm5859419137.10.2026.06.22.06.00.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:00:33 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6c3099b11a9so1535300137.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8XqAEdtFs3VyjXkugbX/2DLrFk8oa+djRA2c28n+nv2VM465SCqC8tW0g0lArhfUs6h5cCgc1CwnP@vger.kernel.org
X-Received: by 2002:a05:6102:2906:b0:612:21f8:5afd with SMTP id
 ada2fe7eead31-72a1d8332cemr6436185137.12.1782133232462; Mon, 22 Jun 2026
 06:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:00:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcxQDzLDcmHwG_1VEnqCWs6xpusgebVoE96xNH4Jrtig@mail.gmail.com>
X-Gm-Features: AVVi8CcEKrlE5nTeAmO0YRJa0CgUPIQw3Lilj3_INcW21kOCcmviS8lE9_08Wos
Message-ID: <CAMuHMdWcxQDzLDcmHwG_1VEnqCWs6xpusgebVoE96xNH4Jrtig@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP
 delay logic for RZ/T2H LCDC and RTC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
> satisfy the module-stop (MSTP) state release requirements specified in
> the RZ/T2H hardware manual.
>
> Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
> reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
> (142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
> being released from a module-stop state.
>
> Implement a conditional bitmask filter helper that switches wait
> intervals based on the packaged module clock index. In
> cpg_mstp_clock_endisable(), the clock index and individual target bits are
> known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
> where individual bits are not tracked, pass a fallback register index base
> (`reg * 32`) with bit verification masked out to match on the peripheral's
> register group block instead.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Added RB tag from Geert.

No need to resend queued patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
