Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8262175A81
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463413; cv=none; b=RFx7C0C/GcmR5eAhETN9+ie2DTe8SXczMsJHZT4tZzHKOyvVgQg8oTabDZ90SdXdrLrN7NM4qvFdMlLyK3geMunPsImYjzDzQK4ls/UC/gchibWVzfIHW40sC/QZOP5dEff/HUxiMxve0xC4wg6sRCd7Z3zqpIawueKJijQ7GIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463413; c=relaxed/simple;
	bh=k3006wJqxnTat9Xj8MW2QjrO2YW2+jD6t20DobBX4xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgU8++KdvmyJCDOTIfMRMvq++T0OzsZw2XGQ+GTDkP8qOa2OyNga1HjUo118EXaikOfKC6TCv+J1N/bH35xkEWWjJowknULwOfV2BhEdyhS6e9v5EJIBm9UHk7+mWlueheN8VAgVkMrQhhq+PlZDzSTOHbwBdiEOkHArM0mdBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so106651395ad.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463412; x=1778068212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07iUR/sIOeK9OY28Ao/jBJ40ezKJgRa8Xi1S5qNmXhs=;
        b=FMqty1Zq6IxZ+uNYLkJXjevT3AgIvNTkV3Y+TOD3uKWeq3H2PZuXNFC9at/tYVaTso
         m10OpxhoeCTBxPOlvAs005F2Tw7EE8qqa3iH/IDftaKZ5PiN+dWeuWYF9lCoUKrcScL6
         zwpAYDSlylHbutOPzOEQ1cOnjIicwU/jm8UzgKHhVrqe4T5QrdT/Y2PJtP6AUuQOVM9D
         CucUg+u6RmERrgDnagKnAej3e0y6sEzuY+CRqATfZhJvzoN/dpUpsr1pP26PVdiDzVxi
         cCHsfn2ZDeE6KFsHB2Yjkz2SxcbOodKBPJKbs/lJ/N96NEp8fba7FBRMflejmpgNhSiR
         MEeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zk/bLf2jL75V847yzWta3RAaSYcSt2Lax1TXtyjorEjRmnqp5IfVESbPzDmhzAmB4p7TENd0meqUp@vger.kernel.org
X-Gm-Message-State: AOJu0YzGnDOPEcUJfq1CsUj5HCijluy/H1WxaVE5hBc3urGiOF43KeN4
	ku+FcaW2mdPNr5umlsPgg2mwuo5g/jVfwA5ko1aIg6JIb/FnKA0aSMgY4NfwoHr+IdU=
X-Gm-Gg: AeBDiesBVQgjZC0usugD/SOxH99ql/6QOiHFxROWo6lk756Zq6eM41S0S2uviJtRPoJ
	Qs8LQcPpV1NDnCnKT/cyu8Y1gxsu/fzTARxlL1lDBl0IloXskSZOHgxhg38zDsgq71XeHfn00+I
	r4NrcwPsaWw5mvKVcUs7De/fo1GD8DYf5W7LSKdU/SWHro/hA8gaCg9qBeYHlYY2VV49XBU5FMU
	opeeSDunsSrseEMz3OYwAdDO31IDXL0OixYlDGlfECd2wMvkvckLk1XLF+pi+g/o/PM2GLEYI6I
	Re4QWbBTQrjYaPaaxU88XV1j0aaEYJI6eUBOevNWrFQ0o6gzx3E2TgQn4Kz8alRYMMXcLGbMFgJ
	KFd6rv0Vbz8BiMwiAX4RUvdRzKlYow36SNJtonMAz12g+ndXoptyJGo8oJD4oR/3zQRQ8Iu9v5e
	WHGBztbYEse2w3ROXKmwBZsMx/qajSiNJV5AI2V2WUJnO01hV3s8KHQX6cQRbMVOBPVgosjmv5G
	JU=
X-Received: by 2002:a17:903:3bcc:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2b987e02b8emr33303895ad.24.1777463411965;
        Wed, 29 Apr 2026 04:50:11 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f317sm21188865ad.53.2026.04.29.04.50.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:50:11 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c70c112cb61so8194338a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+GH0YpTnm+hnKZdf92rH230hKtqkvaWcYXOyg8DviZb4/B/xzXV1f+4ECU80ybcqIv+JGUnaye9t8@vger.kernel.org
X-Received: by 2002:a05:6122:8b0c:b0:56f:7300:37c9 with SMTP id
 71dfb90a1353d-573b368cf79mr1448638e0c.10.1777463106983; Wed, 29 Apr 2026
 04:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:44:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
X-Gm-Features: AVHnY4LhTK0YHEkXOgViPxtDX3drSx5eXMIsHWPwRkcxiJzGfAV6beExDjAOpFs
Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -473,6 +473,12 @@ properties:
>            - const: renesas,r8a779mb
>            - const: renesas,r8a7795
>
> +      - description: R-Car M3Le (R8A779MD)
> +        items:
> +          - const: renesas,geist    # M3Le Geist

"Geist (RTP8A779MDASKB0F10S)"

> +          - const: renesas,r8a779md
> +          - const: renesas,r8a77965
> +
>        - description: R-Car X5H (R8A78000)
>          items:
>            - enum:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
