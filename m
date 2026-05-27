Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB5F3ECBE4
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874600; cv=none; b=mmWETrviORCCE2TpsbEBZXwp1PLsaGcnUTMjoTWD99QeMoq9qqICT1KuEA3cNO5pPp/y9BUD6P1VQ7SRuyD3jb2FPNYm5CtCdx1Tl2ExtlHVIjHA03fbaYLLsTfn0tqvMIN3Ch7a37jvaCj8mM/FCagQQ56UhjADWINu8iPSWjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874600; c=relaxed/simple;
	bh=LfCe4LNPMVUu5fOQZ/DhPw5AXt+DrtW/uZ2vlE+ITCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPJmdgEJeD9CbnzB18RcB0lUgoXVRJ3I1HMOe83T+rLNxE9T7/CAkr6dHvCaZzlwTIqZ+/6eDaTaWbh8fHnjU8kguIMcml0TuOU/rzdHl50INCrM3oC9qdt61/XczbM40s/CEqoEH9cYq1ynfosOpO/kw9ZgRRq1UD6vFXfEliE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5751770a178so3753789e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874597; x=1780479397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLue29P8rf5xvQmGeNSTeRRA/wr2HEJIYgSnfhWuBRc=;
        b=J5BrKjwzesfJS39fEWCZlnzDfhYepFSMfVKPVYmNXcdJSOcuxIq5avpR87DVaLNtnE
         J1hgOw0I765QENGICdqGDgZ1B3nULA9VTSxRjVJmbuZo9hTyQhpN4q8LxelNHjOXAM0e
         OvdPwJMNTdOY5X9W8N1oy2l2tI8ZXLLB/uOBBNOc4sja6SnC1BsuRa/qyhVJCN9nn1LI
         2Cti+C7jk7lfyLrhtuOQ78grzLrqunotxse5+N8fDEzx39e4UrjU5oWsWxSARM1KJi9R
         UykI2TBLgrkb5fUEJmvopPBcbHrkiZY/Z/Qqvih0yaCa3GbMW6Kvb4fIOhKu9QGTJvg9
         se1w==
X-Forwarded-Encrypted: i=1; AFNElJ9LhFxi2E1usF3XUTSgaHyJ0YKRlnq6qrzTPZwPi4v3tUGoLINj97TjUIweGqd0xYF4jP/yIxlUs2Br@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+FvLY9mwdv01oY6OvrwsHYsxcPn6qoAJixXhMi70UNWn31vPF
	W6zgYDNoGvs1e/GI4KOmHsiitvGm/TTckVQDYz7jg5G0MFVHAcuQoXgunR+8rsjIT2Y=
X-Gm-Gg: Acq92OGm9/6pqpL40kkPJhHGNQebhXQybwBlkbBDX044OHAizg6SwuO00iBP3S/MZE5
	1HEVCqJqu1BDmJ+BRyN5zpucJn6HDNUNZbX4QsfKnsJNcf4Fs+B+t5V7kc68BfQSjzcRvhkkjjq
	RIVBryEsdPMiaoqLHAmLSrdXGI7A0PiG/qeFFjfaG1pQt2TR3ykC8I184u+N6150XZF0WF+V4Fy
	5DLehE0tDGV/S9x/6ih5o00JuCu3wjRdrVq1B0hPUmt46lMEycQAY7qMZHc36HCgwuNQvmsZhYp
	3PQHT8xpRs8vLja/kbRU0CzLspkuKVsHvb0DPoktuG1oQk3l53wBw9yX2i58Iqfktxts7pEFnJY
	p8oIkIo+NMh2xkTrBP/36pAZ0D4JwcwvXknJxloKtKU0MJjRi9aqmGoboHdtfUFM8LhU1ftxZn/
	CGhEi6YHQSMK9KwloIFuJMV7xH7R156zxbsR6CAAYErD26XCh+NFNRf/KcUWp0LsKx
X-Received: by 2002:a05:6122:2407:b0:575:e9eb:d879 with SMTP id 71dfb90a1353d-58659010a93mr10843084e0c.0.1779874596593;
        Wed, 27 May 2026 02:36:36 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f85bde2fsm19478757e0c.13.2026.05.27.02.36.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 02:36:35 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5751b7d147aso4201148e0c.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/6aZSSn1VGa9Je5/N7ViuVLvoSStjGBgZIJwUSJFXRc4fZLbahIA+PX0gpTZHeHpZtQH8a05OEEzMI@vger.kernel.org
X-Received: by 2002:a05:6122:ca1:b0:575:3b34:28b6 with SMTP id
 71dfb90a1353d-586624cee61mr10718336e0c.11.1779874595383; Wed, 27 May 2026
 02:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org> <20260522102251.1723392-5-claudiu.beznea@kernel.org>
In-Reply-To: <20260522102251.1723392-5-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 11:36:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqe4JK9TibiaXO9m1k2YHqS0fYtN4O-GkYszSfMt1OOQ@mail.gmail.com>
X-Gm-Features: AVHnY4KKBDZVJSxF14oLw6h140lrQziFwBUZAfBfWP_NxcAjjTCmNb4Q9eatVi0
Message-ID: <CAMuHMdWqe4JK9TibiaXO9m1k2YHqS0fYtN4O-GkYszSfMt1OOQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] pinctrl: renesas: rzg2l: Use tab instead of spaces
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, wsa+renesas@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 12:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use tab instead of spaces to follow the same coding style.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
