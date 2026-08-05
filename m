Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325C3DF01A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916018; cv=none; b=lUtJeUFiLfb7Xu/s5uyts0zqj9ovA5+ULsbXt/UTnvzAT1nWtTFt6LdiP4DV25yzHD0M5jcc4eqiRUQldANuUFTYcMFoYGZpB6i5PZWUvyDy7YzlLn6zFc17pbd/B1fRgtguzjiM7TYJxnPU4URFdWrpS4zJUQZNi1u6mPUrTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916018; c=relaxed/simple;
	bh=G59qDOx2jTd9qjsp0+h9RG2oLDW00rHwlre2kDIhz+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkemzDqV0iH0J8KjFrFNpVcOXC61HPNGt3YfNEBxQlvzBK8guvWbfzLpnI6Fzxsvg3txot3/LTcMQg6F1IeumRpGRRUPcY4YnbCFEylVQSuDb4J08oqECtX/Lk6yotEMhwIBT8rHrZg7LWwjb8ZiimuE4hrUVKByIAn+Un7nnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74ae4c75b20so417805137.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916015; x=1786520815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9f2bbRgE8MWMbDEyixm1GtPCGsIBoMbuqXI3KLjQ8I=;
        b=esUd2m7n4xDP4Dcy+9yTN0nkVXpDvb0roRMhGByh2wYWfpj2EEJChMvSbXDZ+ZoEsc
         FbN46tWs2OHyRC+uZVCo0LSCAvwCIbr8Touu9d2ps0IjHbNuOWEexbe2DF3xG4JXiyhl
         UZxq67zokTeFQdcPeyDsGNgTW3fMPmRT3SuezmNXDFj/LH55UeL0F9VEuG81Bg8kN1GY
         vAuJP6bsxvCJaG2EgMgTCB+O0FFZM6w0/KGPi6iuksvnoj2mPMYB3Uru3H5Z15CVjwvE
         mgg4m3zpVPhj2ewL9QIQksJNUbj+EEUo8XoxjE3e18ABEnjUGf09NjFAiS3ntqmQ1Gwk
         dUWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9h7N1KbhzGkCiXTonlPrEP0w+YZvrbQP6mQQt/6hGMZqNvULG4VNFqXRlt0fhr29ZcjXvS39nA0QZ@vger.kernel.org
X-Gm-Message-State: AOJu0YycEu0Mua9wzWSRWrhwc+9EdMxFO15d8NBrcisSUTNwcIp/OiLT
	uTn0IizeFR2c4KEfoY8ns7AUuc5mDbl5ooDcAQVmfBYDJSOuZu3jEJfzmEiYHli9
X-Gm-Gg: AR+sD13ztjzgiTXlqQhIrsgT1zsEmeYH6jtgnTdXGjKdINwdb/3EhYn+ZmDVPko4ZVQ
	FW+7JaHS8RJQYBDB1OHUUnE/EDKmhy23h2NhBpvjiqnQgHZoI8+oL2/bI+mgPcS9/dnXwDgjRCf
	APDhDa8oswSz8hSw7uOcDbIrHzIGhRV00I1SjtCAr1wb25BeLrciiqaGvpzK0TLygvv73hbFNf6
	jdqnjmxCY3oWLVtfg4GGzA5thmVX7v/qkN0GAInIlplahVVfMv7Vg+Qan3gN2CfJ9hOZjuf8+IE
	NYJuQ+Ucl1qO9OnKE1OD2ZFOwKU2aFPQq695e5Po95joGhl3lWFyG9drJM0Z/0J0obRfX/Gr1EY
	9gzTp22uyGfcGoBbKFU1Ft4VU5H5PsGBZg2RGmWuwUKt9MHuVepOwAeHX/2avcAw1zvBQZqPOpM
	lDqVfo8LJot+yLH92sDyxpACI71RRw8MGlL9tIXxR9DVvYweYCWNkK6aXy/jYzdWXd5Xs64VpAy
	Yn1svIVuOj6bgfPKzfh0h0jSw==
X-Received: by 2002:a67:ce0d:0:b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-75f718c813fmr1327657137.0.1785916015074;
        Wed, 05 Aug 2026 00:46:55 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c798337sm1347534241.3.2026.08.05.00.46.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:46:53 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7564b7a9490so1292352137.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKTDqdrJ6TG4TuijKsPLNQ4dKS6weXtVgbt5uNoFUvh3DBEGmAjGFxBSnE6TelW89cSw1GLTFnA7vX@vger.kernel.org
X-Received: by 2002:a67:e8d0:0:b0:738:f27:43fc with SMTP id
 ada2fe7eead31-75f741509f1mr1478257137.2.1785916012832; Wed, 05 Aug 2026
 00:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-2-herve.codina@bootlin.com> <anJGNyNxcSAwylK8@ninjato>
In-Reply-To: <anJGNyNxcSAwylK8@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 09:46:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUn+di4YWAGS+CeBiCD_9EhqUz0O4FkuHZwmPo531+7Tg@mail.gmail.com>
X-Gm-Features: AUfX_mznd8_0iTIOHpj7a9PH_3O9MrcjKogeVMZS0BvwuG3MgvXrPfPog8GoIxA
Message-ID: <CAMuHMdUn+di4YWAGS+CeBiCD_9EhqUz0O4FkuHZwmPo531+7Tg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 4 Aug 2026 at 22:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Tue, Jul 21, 2026 at 10:29:47AM +0200, Herve Codina (Schneider Electric) wrote:
> > The Renesas RZ/N1 timer block controller is the controller in charge of
> > timers available in the Renesas RZ/N1 SoCs family.
> >
> > This controller handles 8 timers:
> >  - 6 16-bit timers
> >  - 2 32-bit timers
> >
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> In general:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> One nit:
>
> > +        reg = <0x51001000 0x400>;
>
> Isn't 0x400 a bit excessive? The last documented register in my docs is
> 0x114, so maybe 0x200 will do above?

FTR, 0x200 or 0x400 does not make much of a difference, as this is
mapped in PAGE_SIZE units anyway.

According to Table 2.1 ("Register Map") in the RZ/N1 Introduction
document it could even be 0x1000...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
