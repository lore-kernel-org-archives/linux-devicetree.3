Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299B314D34
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208169; cv=none; b=lH4itevjSyiyHONuD7WhPN1Kir04BXmtZBXdcRv4e4xZKQt3yEDjseyvfOWTInPHMPsKJXNfzu+5F17hnQtQLjhMFPuJmgH9UHOKfjpoh5YcV73uGyK6in3z4xDv4agyJmD/o3mNPcSys8AT39jBqZseBnAgpHf4soJldNpNmoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208169; c=relaxed/simple;
	bh=TiPYaBlLWXLRJ91ZuqxXRCPeuUJGlYF7Hrg3spsSi0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qpe3DeICBi0fXiy0MVcIrdrX1RSgArZg+2YcbjFn03QvGQAGqNss/bVsDwIzFUGCcklUSVlsG2evo6igcvyW3x6CLRjdcuZf9OwCA8ksRFOsAujNZ4eEeNME+pU0NCoeFMM2zs0wEmbDrxJZ0z+Oe4lqHUMFji7ErLAYdNZ8Awc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d85e76d73so1450217e0c.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208168; x=1775812968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQiSqxl/EeQIWuDkdITPLu7Bz6OtmpPC7WYHMXTOSFc=;
        b=O5jylwFLSMt6/oRlefuN5/gGB+ZtEwez2/X36X8eAmd6A4LTrY8iHK8Ey5Tu1loDZc
         O129RF11Pc3XeuM9bqj5UdxlYavanyp22XY6d0Uz1yPQUEx/p6llhOfYpr/kkeAj3bx0
         9RyNG1zvgKMD7iYzWH3ff14EunRwuOq6RvnXllH00stIXM7i1s+BhBTRPQGpDpHqZW4M
         4pCOLDuXwYpQ5pgnyAzt36sZgRdKinxhs5dnA4eT3rXriXE8Yu5wmo4bW7bAtzNcV2Nz
         ollosCwxZG+E+2OgBCyEB5jMO7zL3rRvOhLmsa7uqNCZRo5lZvSUOfj7x/at31aN5FSu
         97jg==
X-Forwarded-Encrypted: i=1; AJvYcCW1CCBB3pojbNaP19bX83ecXtMCdxKUataRD9aKQKuLgqyWH7unTcJ/Ej0a7UkodmALtHiAMhjV/KTA@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzCN4xx+lmYvFOe10qPAAP4nW7jCeRweq7+0xMbzcaCR9Cd15
	4NbEvDCPhqFJLhCXNhN59Kl8mnYTWjibL0Agw4GsOD5k5YjCca7J2UofDcKYYMAs
X-Gm-Gg: AeBDietUKg8yEihzNbPmYjjxiKajS+QkIKpPoY2gmGjwTMXXfowzET4KJ4gO6Bi2PZi
	OFedcQ5w48J7UWrRiiVuxXdr0BXj4+qy2bJtFZSaTwwq33I+GnGMP2+RD7Z/mes7gblnfT7SgRY
	0VEewEEgUmV06QKnUMS+XgfoejOdX879Rb/gjXC76IYmsOegqjdXbFmR+KgSxtJSYuRQIk0yjUN
	CpXd1xlzVzrw8zqaSjKvKNyJnhk1zm6kYm0IwOJUQgsdAlgwu8ZAIMlJeNhv1ax6i5Zgmo1JSKh
	W9pOUk+NkRJA8IOfGYUEQU5JK04vNoch9vhWIh5Cc5t0QMLS3/7lSXQiyRUTUJvU6SF1Otcd3iF
	xH9E98avnmaObPwy0X2UaBtj6gPRJ97DfyXvJ+edR+I0hIiaV93nrCZhFC1U/PSd03tx6Bony0h
	PyvTuaH63/uboGU8KZy4EBemw8fm/Yq6ilVczpzIo6j06OR1SCO1q2VuynTuLe
X-Received: by 2002:a05:6122:4d84:b0:56d:451b:e4da with SMTP id 71dfb90a1353d-56dab814978mr863199e0c.1.1775208167643;
        Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bc41sm6192585e0c.11.2026.04.03.02.22.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so1095107241.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWodSyzkq6hbHCyMFq6qnLKuMRTJRtfdDD3XMEuVb1Ev4W4Axoa+RVPY3A1CfUgk8LCMnKSFOX1+dBj@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:605:85f9:453c with SMTP id
 ada2fe7eead31-605a50d3dcbmr853511137.26.1775208167106; Fri, 03 Apr 2026
 02:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZx2Sks_PqfUO5QRt30Sj4DgMc3k2zAB3o=UWgA6P1CA@mail.gmail.com>
X-Gm-Features: AQROBzDTpVIfWHVjgDI7Tc-gqwb92042C9npzZ6abPqPFd-FM0Csq_Yypvn33OY
Message-ID: <CAMuHMdXZx2Sks_PqfUO5QRt30Sj4DgMc3k2zAB3o=UWgA6P1CA@mail.gmail.com>
Subject: Re: [PATCH 3/6] ARM: dts: renesas: r8a7792: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7792.dtsi:89.12-94.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
