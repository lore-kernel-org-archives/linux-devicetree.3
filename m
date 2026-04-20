Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105938F250
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692401; cv=none; b=NB4CggYKQQ6qFTrIPlcsx1NR+vvQKNRDGaGkRGbGCn3JjYjKk7DkTCWjIBxWVBSnbLkres9eqKWzfE73fxjk5A9pidPojmceBsTwmddUx0WvfC9b17BYhFW1DCsNck3AoAElYirpOdp84wdXAHM/yOQMpVgOTYBI9EpSvSlVV5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692401; c=relaxed/simple;
	bh=cOlwDods3+RDyfVRhAhLNPWGpK0Yh6EZU0juYekUiho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEnzjlDEsF6lpjqomwefPiGtVJztdPdBrBZ5N4mYJEhYo1PSW9K7ynsrLMhNGGa8wFKWw781z2jh0T1f1SdKSOjfalJ4wKSku8J9ylKgoWGusp3EkmafNLh7fAqtmg3kDsimRiJleQZ/a0FeQ/VJizeaMmzUynon8kSAv30LQHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f97c626aaso479047466b.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692398; x=1777297198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKax9YzIu6M6HTrqHFluRZuqCMKY5kOF7MhO6S3HLpA=;
        b=iG2HsLWNw6zhePCPxn7xDTL23Q2aJeWz8n/3Th5xlNYuYtUyT4lBEkT1BwtI6MqECo
         mgjIK21oZA8vGBw9nt+e5sUGRJ6w43gDf5YfyTMyCFx8Y93tfb/s28g05pG1T9SZqA37
         BWWRwnG96seyXe6poJ3BoYcPKBwRzXdprS4rp04gLRI5WM4c0xQ+fJ5mqucpz5kPYQZl
         eQZfNvr/EYqeJb5dMbYJasqg2aBV1Hzgs24wRrq9CRhBQIBe1mpzUqyLc5P0QQ1juW0F
         5xzEQylbVdHItL4bfDF4lXWKFQpNpMGlRaaV8XHahCUiiSqS16jVy/ZxzdptaHIIWKYx
         lVPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mxArDWwfciBMAQ+K/8oxxIPBSR9mEhekh/OHYl/f8th3PzMxXTKxdMmXVlIk97hxGBHZ8Hhu7jZP+@vger.kernel.org
X-Gm-Message-State: AOJu0YyIomtz4TrlQHAK08RtwLIjyvHH74VE9WFvm/tV0A0uibAktCuM
	HYsv0UnylsdxEH58Jp6156+R3nKkLb7tGAvgUySLhHIQPXj2qdLNe3JkRDOfBVSd9Gw=
X-Gm-Gg: AeBDietBEBC/PWlq+dFQ1lnr/6PrD11nAK3eOiqk5DFo3ZvjTY5VBtJ4HFXwj2BhuIi
	9oTiEqTDKOClvufFU0YbTAl5pLLOsLv8tuPNqN8k+pFt839bpYPQRli1W/Edy8DiysgGkMgIEuR
	qdypE32HsZl8uCDBoLn1PKmI4843DOLlALHkoMUCg4hhyXzc8GwaHwjKupW3TAOSTLLBFdEZxwt
	te+sUH6lrfNUkbrgfCoyq+3WU3z9UoHNFQrValv78PrnvaPohD6cMJMGrqdYyAb2hh/oU7+Xqjo
	n+S4xQWY3f6WwC0dojAvzA0JuR92yuQZCy012hcpOGTyrAu8f41ml1n/ziQuOj6EhODaIPMBHs/
	gWU/4XAAhTg58viSJDb0BpIxYIYqL1Yd3KKNi5xzm+DIkVn+Of9OpQehc97gMYg/WvgnMB8aW13
	8clAalXw9rgM0ClsKFJu0O1CqkQy56WmwXH8eeZ+PO46EuHJPuuangkiLrDGIqo9CQTw/uW9w=
X-Received: by 2002:a17:906:ba84:b0:ba4:8288:b464 with SMTP id a640c23a62f3a-ba48288b8demr611461766b.6.1776692397744;
        Mon, 20 Apr 2026 06:39:57 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4520ca202sm349388566b.28.2026.04.20.06.39.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 06:39:55 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b886fc047d5so563635566b.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/JRgVqDcNa9vSoIUbgrdbXkSB92YVixlgS7K+dNLWCjPlSHa3fDU0yz3CF1bqDJO5uNWf5YBHUbUf+@vger.kernel.org
X-Received: by 2002:a17:907:9342:b0:b9d:e301:20db with SMTP id
 a640c23a62f3a-ba41de2e49amr637943266b.25.1776692395631; Mon, 20 Apr 2026
 06:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2026 15:39:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
X-Gm-Features: AQROBzAmjYSSdb5ADg_fg8teFvEbOwlE1BEHm3O6myg3QbwtkKt0POGfv4EoMeI
Message-ID: <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU
 port configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhkar,

On Mon, 20 Apr 2026 at 15:22, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SoC dtsi already defines the du node with its ports hierarchy,
> including the du_out_rgb endpoint node under port@0. There is no need
> to redefine the entire ports/port@0 structure in the board-level dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> @@ -24,19 +24,10 @@ &du {
>         pinctrl-names = "default";
>
>         status = "okay";
> +};
>
> -       ports {
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -
> -               port@0 {
> -                       reg = <0>;
> -
> -                       du_out_rgb: endpoint {
> -                               remote-endpoint = <&adv7513_in>;
> -                       };
> -               };
> -       };
> +&du_out_rgb {
> +       remote-endpoint = <&adv7513_in>;
>  };
>
>  &ADV7513_PARENT_I2C {

Doesn't this introduce new DTC W=1 warnings?
Cfr. "[PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg"
https://lore.kernel.org/20260326042411.215241-1-marek.vasut+renesas@mailbox.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
