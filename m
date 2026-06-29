Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE2B3F9F21
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725555; cv=none; b=lH0i7Cs5UaPdWIayU1lXSRr1HsRYz432c3ZFdzXFSpbraESj1SoFtntEwlUU1F3k7kyE3ou4mEziDmp3Mvqz+sSiRuSC7fB8uWp83CosUKH3+C8DnWtz6y8JwvCkHQMYwFTpCjWQMn4s0tWkRZF9SvmUStORJRNUJRVaALMKdDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725555; c=relaxed/simple;
	bh=av/M3ZtUQavT/hkBofKRoJGx6fD4OmsKWIzK5NQPTGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuZhkCRkHKPA3ZDZSWBmuUZJZaYd3Lr9T0siLTmmzlE0mCNBekKNqNL6mMSqnn37bCTmrO42ZNGkQd+PO57huY/aOhb+2w4rLybU9akRaSAVYDCysGp/nzqU4NLY+C0TxblyDNbo35gnEYjul2cpz6+YxDIkKqr67gisB7ZHsCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-736eea06c3eso725840137.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725552; x=1783330352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPgpCbYo3dOS6VSWtqh+ogyk9l9INK3PsDaC/Z8QySY=;
        b=R+SoW4zgHN3tYSaFfi5UXuZgw11WEAzZz5ROC6JhplN32vgAVEr451ArdF8o61CAQC
         KUcif6tOlF9WY6pYFxm0OHgaeUyr35oas68+jxWAMmJNR3N40olfnlJ6lB6RYInXgIeX
         oRccHpoQ/7LX0OGdWOvx2WArSHVGRGxBa4HPP6VkiUmGJhgcFnfVuZP8DpdsVLbGEfKp
         xvx8I9OXFrHEqkYW7azZAG3ch2HKE5KhutsaSYrAgXYQkXHbORVMV1LyzA+dLx0p6K+a
         z14z3q6j96ppnGfahqavibo/ZkwEA7RJx9X7Dx526JydpQD6bPCT2Hpf6CLbSzUgn+As
         BK5A==
X-Forwarded-Encrypted: i=1; AHgh+RqMhJ5h7d6RyaXatZOLSk1qkiQFcVrduvQjbsEQW9i/Pj6zJwOACjDsjHJsZq27BrThHU32fYwOR38h@vger.kernel.org
X-Gm-Message-State: AOJu0YziRE8bEVDHt8feiPCxAAQChkAD5/GGbJFDtjA5oHi0aIQIQch5
	6Lzu0Nr6yqUUrgStPvRz2fHID8ZiW2V5oYGvLbTeQhqC15YZN11A9lZl+GjXe486
X-Gm-Gg: AfdE7cmQ5AtFdLwGhiTh2T+uYbW+PI1BGRwqhB7LTPxlsqE31nC+UlRVg5eX26W1jqz
	uiT+CcDQxKzI/gl7pioQHMw1dZs7XLc4brmQM9v1RIL3b5JHOzY99UaeQXNtkRnycRKBit5W5tf
	vCiGB9wX3WIYkWDpo/+/cBVyZ6PMm8Xsowbrk1AMFuyzpUqdfLF9UNBhHqTOLXc0TZfKNG46GAv
	/pdzvEzJHy2Yeyb+7uirUYtU8Qog4x+12tAK5c1MaZGG1h8commUnNfr63lEhDpHlPHitTKq6lu
	FnsW4Vse54K6LgIKlAG3jaDy0ongBg9XiHGK521RuOVvrzYVUxUCgPxZYc81vOTAsDlaMS4sGGg
	syBh1lmn9yPbeBWULkcgx8w8Wi1Iedh5bPR6mV6Z09woBfVWuj0a472OluhrzXlFfjOefxmrbJJ
	yjIZKKcbgaCCkMAOaQOtG5nixEH9RnxmkH4z0x30xR90I+XVeMYw==
X-Received: by 2002:a05:6102:5695:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-7343495a4acmr6329941137.10.1782725552553;
        Mon, 29 Jun 2026 02:32:32 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916eb7b9fsm4857989241.7.2026.06.29.02.32.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:32:32 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9673385b1efso690565241.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:32:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpMvlsGR7p95yn74Bul8WcTUQmyn5gnlA/j5ErrzLpQEDBvgW54+tp7cNFoqAQHh8Qix8t4aj0uVMv3@vger.kernel.org
X-Received: by 2002:a67:cd95:0:b0:737:b586:6386 with SMTP id
 ada2fe7eead31-737b58665f3mr1404074137.16.1782725551832; Mon, 29 Jun 2026
 02:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 11:32:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu15fJ=bGcGCNBY+jYFrfqP6VOj4Lh1Xp0Vu39Zzj3kg@mail.gmail.com>
X-Gm-Features: AVVi8Cd5PLW0VbQV3bpvy1FRMcV0RmFmKlx0lEhwlZ3tFnN8kqtg2CHL7DRXdtE
Message-ID: <CAMuHMdVu15fJ=bGcGCNBY+jYFrfqP6VOj4Lh1Xp0Vu39Zzj3kg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] spi: dt-bindings: snps,dw-apb-ssi: drop
 superfluous RZ/N1 entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 26 Jun 2026 at 20:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Commit 164c05f03ffa ("spi: Convert DW SPI binding to DT schema") added
> an RZ/N1 entry which was not in the original txt-file. It doesn't follow
> the usual "<soc entry>, <soc family entry>" style for Renesas SoCs which
> was properly added later with commit 029d32a892a8 ("spi: dw-apb-ssi:
> Integrate Renesas RZ/N1 SPI controller"). In that commit, removing the
> bogus entry was overlooked and is finally done now.

Nice catch! I must have looked for renesas,r9a06g032-spi omly...

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
