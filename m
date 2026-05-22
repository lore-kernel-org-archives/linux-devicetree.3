Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6E43AFD1B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464095; cv=none; b=XgXqBuqkdrcT4yhCvvLDuD8Oq9lZUbF1MKZYRcuPACSFOQjWlrY8uCnN2D7sBI++KNcC5hGi1aQ5rI9TiDANJop9EDLVODiEBSEKuKyYl3aNEHlVXbuFKSIWOmnhhokGdCBnrIqUeLArNiDzp90mQ26cpyIIHRi1tiog+6KNLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464095; c=relaxed/simple;
	bh=RcKm+MJQR01WbzgcsBzYoy8Uo599kOW4Z1qyK0a9O74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoAdAqDquXaj6i+Qkp42o0H66RsMTUhpooMMRJ+t6lJA1DW8FZCHEO7qU4EMmbsS9Cp+La0eWP7vmoHLwjUDsW8fX8UJ9FHScZy9vZN5atjAgFP1GdqNOWiewawYAtGIMAq2ZzG8+2ZkJS5MUqQ4uRN91QaPQApus6Px24mta/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9617940274bso223668241.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464093; x=1780068893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FixydBMStjIkh+xhknFyVmJmnf/BoQ9WGZ0+yOe1GDc=;
        b=khQR2dyZ2jpsfZI9JqaJwBnoayBmF/RKM0264TEvdbDeJGAwEeNqyt2cTxywCZUDGn
         4eQVqNdwDvUdR33lDNgz9/N/4N7QhaHr670buFzLY8Y2oR0mfLaK/qTy7Vc+jW0zENhh
         dlp/BE+53aa2DScB54mxG0sk6UIOUSNWsItceDL5thB9XQ2wFHCGjtC8G6QkjM0w/5nx
         O7r8Ziemb+nnp6yDxkIRZAy7+aNUcHXBuswH1KtsFL2lSHbx4BmXIiI+/wpYfsdT5nTb
         +FX+DIya98lYHxtGFejFuCB2/bDS6gzVGjn/f4LUEbKh+6FxhtxzdL0GrpBJeXRWjQ3R
         As9A==
X-Forwarded-Encrypted: i=1; AFNElJ83sCHeqEbG7quLOHXOgMk4prrkCQbKwv+u5HMz54fBFwAEBOAsyy1bRnbdE9AZqT7mzk833u/g42lj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aFqviqOY3y6cflwgB/AS9E76EQ+bXQ/olIUtP2Bnq06k/DDD
	TrUV82ROqxpGlyq7iZMVPeX46xoVnKRTKp+lfm5wYcmje1cMmGvYpG50L3nnL9wYh3Q=
X-Gm-Gg: Acq92OHrbvSbtdrlXVS3dECIZD2p+obo9yhHTopE+J3JvjsHSNvMfziObq72CfFu6mI
	R6rYaPFak6UKR97v45Ws1N6XUMsAwj+VvKtv2y9pPSJogFDyYhLfrPhC49WIucJz7k370b2G5y9
	3E/VGsd+EQKAh+myxFVvapQdJMoLQnv4fYrajfJhpHWvAszJaEbX7RLDRJGJHS3WD23M3FZ/cmC
	nP9uZKB/Z3lOv2NiEn46R4AzYZNtLOjXfsk2z2Emg+B+pk4dDshqFM4K8IyVHQ8/48H887fOV2M
	/SqsLzYmhhQcv4uJVn1DUVXO+aMITLeK43h/lFk9tE2kZOlUyqj+NS/ybGtSXs2H8o1E/ZSEd7k
	qweUW26avIyUeSl66Q2VxoSWrTg1mTJpe8/qDE/gUgcsUan62qB3vJOwTRuBIGv+hxD3pRfZ5nZ
	nQbxUm1llklNYCwvUbbf1dFeyNOzUkpnLExKAIwUBb7Bq9xxUddtTO2LBBUURLMgYVJ8U2oxaDY
	Ag=
X-Received: by 2002:a05:6102:1621:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-67c7300bc13mr2213331137.10.1779464092776;
        Fri, 22 May 2026 08:34:52 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fc9a0fd00sm1848244137.0.2026.05.22.08.34.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:34:52 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-577500ac0e4so2482386e0c.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/x+qsI/7dcL1cnuuUI8p5FEgN/0a9uflFIzV+k3IftZ+Xso6lf9tSJiOX6odL4xn+4B4gtIDQZPunD@vger.kernel.org
X-Received: by 2002:a05:6122:4d0d:b0:575:3b9e:db3e with SMTP id
 71dfb90a1353d-5865d70cb8amr2549460e0c.1.1779464091785; Fri, 22 May 2026
 08:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:34:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
X-Gm-Features: AVHnY4Jf1Pww2GHfOAXrLj07kMcY44kD7u6kHAIZKMSWedE81wNkTdVC9LQ0_SE
Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
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
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop DU until it can be tested
>     - Reinstate sdhi3, switch SDHI to dedicated M3Le compatible strings
>     - Add no-mmc DT property to SDHI3/MMC1, because MMC1 is not supported
>     - Disable ohci1, ehci1, usb2_phy1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
