Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F837C912
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463731; cv=none; b=iFITgwKtxTItJX86fDuMedLdkpg52PWeeW9xTruVmpTcsdhrzAeiUqEBfsgd9mC3HAybbG0Xdig6MkvqD0lHihCrTSvn82sIUgWOjZHWxgtlMJGLWhKj8b0A0snk3dxyx8Fg58jOg7R1kfPS/fRJjslVDzz3gkgBnvXNUQbf3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463731; c=relaxed/simple;
	bh=kN/9y9XwGUDJ1nAC1IWWtL6XoKcE5qMK3/fWnrEnzQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjxI1DUEfr8Msr9wSP5WAPKS9u94kSvPBXySyAXIi9c2SIzrrPUrgSuFRilqkcA5cEfMNcbTEVu9Sivq88CgFQgNNeX2+8tPgy7Oy7lO1SjsfF1i3/6MZ1N6urMfKWZWVHoihomg20ViR6bzj0WmTkHqtMtghxwyQkEg8Xo4aBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57524e52a3dso6126642e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463729; x=1780068529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szBb9VN5OI/LxN852+H6x+3LXcGPvGU0m4BLzBAkL+k=;
        b=CYgulX/n8ceYocdV5x+mADVirii6Inmr1wI2N2J0po/gM0isSgZPbHYLWz/H7nxyez
         epLM8oMXlH5PiUjoYnt0RhlTfWk867aYyVGhFuXy6xLxNEBxJaHFz42h0RmB08UR45+F
         haNqkwKspLJWwWDm6VM57OhlEc3ZVfzxR3UK36Edlc2K6p6ApoNf2GEFfAe/h5sUppLX
         pJfbNhwapqMv1VPKS9IYn6j49XOinj1lhtXoNidqDm6qvRh9129iXOXjZ0YJs07svoFD
         cvFBylVRupah13fJtHk3F4pXaXy/eRKy3b69gSuceFNZ0m1np5NRDdFlXoKWaZMhqHn6
         JLUw==
X-Forwarded-Encrypted: i=1; AFNElJ/kDPRUHIOmSwuTPfrNc0Q+jPfJ3S+TZzaFzCQWbaHLKKMHCSVHzjUO8l0PLgbrSx4TtRs8Gt3q6pUF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjm1Q0PNmXz5tpM6FTqQkSrS1PpNSHJoabKYET9oO879OUjuvt
	WkHrvF4x5bsC+rIACgU+0/uRe3jr2sj4Aq+dC153IfOvCi1Ol1bQdjBq202IDeFPTa0=
X-Gm-Gg: Acq92OGhv9M/Vbn5j268pLyYoFkD9jfvMO7STmJ39VV6qOij8b55GjT9hGs3lX/EkYa
	JztC6Sq1Cbn5XtyjzaiipD8J/6l/DtfKvUENJV8TjpLzT+Vq3zJR3jCRn/bDjepJPm+tyi0BzNF
	3WyYZvBFA057/sV6HBRhLuzoB9q81vXfWYeFNRQUSqNnulVd0mDeyNQrmEzNctT6LSMnuhvSUiI
	YXHmppCGZxVTmhvV2w88j6gClphpQrL6BwAYiFaZCI/dsK4lu+heZc18mmtXFPwD2q0utG5mVyy
	wVDPYpMchvV72bAoNj12vliy9AvkAE08cwSDYYdYIBplu2ae4k2c+6C1FH76DAw2GkVlOVUHF0Z
	MRnmNPvAnhyL2RhH0WwacMweZneycN3DrzzuSZRitm/IGL38Pq+bi05WAzpWwwRnd+e2rL2L9qS
	BRMYtRJb10Vx95wWiz+0vTKUvz9aVSmPObnYOYdLH3avy6WzPovu0cMN+LWSdL+ts7sZsD2Gg=
X-Received: by 2002:a05:6122:1310:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-58664ddc313mr2496732e0c.14.1779463728715;
        Fri, 22 May 2026 08:28:48 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afb1ecsm1952218241.9.2026.05.22.08.28.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:28:47 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-631466587e9so5517284137.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wltkfSYz7O+LjhFxHdOJcGxyXPHHUXYxhmQEdgEA2dIsotnXpQg/6bwxsbyUVfwub/BvhHS6wWZ1i@vger.kernel.org
X-Received: by 2002:a05:6102:f8e:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-67c70e5f66cmr2706370137.3.1779463726809; Fri, 22 May 2026
 08:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:28:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
X-Gm-Features: AVHnY4K2cO6mOrwYyMVCwX6fOKSnvdh0vCSY19G3lWwxUQ8j7rXhdTpY2ZF4U8M
Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add AB from Conor
>     - Fill in Geist (RTP8A779MDASKB0F10S)
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
