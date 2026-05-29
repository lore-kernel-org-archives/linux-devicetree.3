Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5825F2E738D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042438; cv=none; b=MFwOMob5/7mD1xol6PKxBBIrO3GNv+YqDhH+VT4+VCXjrJZMmQeTj8e4VW60OOpuOnMdSGVI5Ojy/LMhrWLHd8HG7524n3TKIuI0M8XRU8yXjSvF4nkenFox8xGasLB3oY0II4SWNLURM1vEeo7RM+MDvrdkmZ/5AXemOtdEnYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042438; c=relaxed/simple;
	bh=ksVv1Z3kxdSomKXTAzAruPJr22j42V9L+ZrAtYZ/f6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxc1ie0dm3Th7XEK1Y0S7R2uiA5pMQobZTiTI2beauioQitH75nKZ291hCU0NS/jPjNusnnGo4YbS0azHuYlkKGFVEhdLvz3tsCed+CU4CuhXLt1ZocAI6QknfAe13y5gVxmxCAqYQqka41qsphbqLTT+au88AI3P35vxF069qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5752b279662so4890579e0c.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042435; x=1780647235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4O1rGAxVnzbuU02bFkeBc3pYMVxSZfJuH3Ds5fZ03M=;
        b=tPeuHj2+EYwF0ydNJA2680pJeX68Do+eCAkMIZ2g4aV8+adBQvAEMMnWNvKhbAZ6/U
         ZpASMhwUJmDBFDfQSXX6LR9LsSLdfWDdZQFQc/x5BFO/r2+57XGDAHzklwdXwHP3Gimu
         OgJ0FM0wcPyqWizkMp7Yi547xAD5Lex4M7KTKENOadbqTs2E7PsK9RfHdyNaL2GZg0z3
         7qPxQ0A/j8xkqAkTfz0DP4XtjLiPu8TfcP+1dpG0fTuQQAznsw5pZSJddNQuHyO951Ci
         rzafEvgonmX0+mOTBiTy368pS4XVDDbO0jjS093DY/Qi19cV5+nvkZMWbS0vwyHDEBbV
         bnJg==
X-Forwarded-Encrypted: i=1; AFNElJ+cW5i4Df/6hHc8ULkio4YkK4EXEMFagR4p8OPmiz2WFNO9eP1lp4UH7qsX0m/v6RW5Wn5hFsinvxgW@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVSTgS74OgqSl20E24whXktzUEbX3CgP9NsMatpvcfWHOyhPW
	qUNk3PML3q0brRb0ZIw52IzjtweT1mp1BQfoEhogrmQgLxpEsb1Rpo0H9vV9ZaoRpJM=
X-Gm-Gg: Acq92OHuTQ6NmEaR1B3QWeTsTVrNwtZjajGBuKjbFzDTjv2R/8FPk3DEZXDJO1cbN28
	3MpMZN/W4SGPzT86ZHmAZ3BSosk+SsY0kCrNQjGkooMcGzzpmHCf4qzMa5n09b+++6NxjQONpzO
	GDQVHUUB+pRwWLEiLfECS/9UomRxTgeW+R2FpBUGgElVvv6BGtxhwrddsGWPd3iff15ar58iCPN
	bfKzsL2/MEl2zDRjj3h7MaSyIrmMcecMHskkb/eLYvuM6F0hct9kMRwQR1zRfOoX6Z/GWmxIoQF
	lXUjZgzDAXDlEGHDx/ZjfJ9sQDSMeUQMvFnM2idv8GwirK98s3p6bzw1ikZ7foHPLKqqFU+JrAB
	EMo4ycU0D/Hk19FX+cKn0XLUByD15yOOhyO/myrIb+GwBL+4PUh3l7IhVlJ4qIG8OY9kiPejNoP
	hUTO3WP2ofzveOGjprrXsWifPrQp+BICYFU2bjWi5+rpsQOVKPzUq2H96DR4AAO/xJdtsxFhU=
X-Received: by 2002:a05:6122:829f:b0:575:3433:bb34 with SMTP id 71dfb90a1353d-599f1da910amr496056e0c.7.1780042435182;
        Fri, 29 May 2026 01:13:55 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d3c9649asm736706e0c.1.2026.05.29.01.13.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:13:54 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so2035791241.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VVTHFgdjW22CSTsS80iLePimur5CSaUJ9DqMeiSiQy9en/BX34NyRTNtLcjruzDoFpnKPDch5GOCL@vger.kernel.org
X-Received: by 2002:a05:6102:61cb:20b0:6c3:1d6c:2800 with SMTP id
 ada2fe7eead31-6c31d6c2c3emr22326137.5.1780042434281; Fri, 29 May 2026
 01:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com> <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:13:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn2i9K64NC47VV7GRQZbPrFq5aom2wMjFNsyFzLxUC9Q@mail.gmail.com>
X-Gm-Features: AVHnY4I8_LolE-354sAuXX9KsfKM2PHDXb13x_jgzOFpxUa6Rman_8lcR8iFUUg
Message-ID: <CAMuHMdXn2i9K64NC47VV7GRQZbPrFq5aom2wMjFNsyFzLxUC9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: renesas: mfis: add R-Car V4H/V4M support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 09:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The above SoCs have only 12 mailboxes and do not have an extra register
> space for mailboxes. Everything is contained in the common register set.
> In addition to adding these SoCs, the other entries get updated to
> enforce 2 register spaces and their specific number of interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
