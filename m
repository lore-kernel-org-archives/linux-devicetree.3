Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F3363095
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138210; cv=none; b=kchXhuvYCTM0xEa38UZMLIbBDyqxqn8uvWRrdANpiNWQ+fwpnkAZ4w1ZtGJDI7CgVKkQyv9lrdLn30rUj0jnlQltQTnnQpkFNQ54QGenQZiJhd3VpnG3kL9oaMpBdIHsbfj6yh6Gh24qz0pYvj+jZgWNCqNZv78xRbQBFNjPkjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138210; c=relaxed/simple;
	bh=F5GDFMTmKzRznIyQUX/zD80spn6OJc/D0Xk1TLD53Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3S8HaBMT3eMZyAVxPj1c0vgQlIXCEgoUyo/u1wo0KuyUVs9w1MNJSMKuRsyRmwkmuevI5RfLWZMx0TgTJsnziYvoiJcYmn4M6bqZHXkwO2V8z8g/tJtg8YZvmXw/ZLPyoLtRKRGTyFX7Q9MVC+K+kK0FZE50//L+9/iAXouroE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-72686746814so2561387137.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138208; x=1782743008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjO0vpP3bcciv6+r1jFH4CXawVtxzP6zfYl8Vthe3iY=;
        b=Kdf2A1Oi4DoJ14Hbg13iEsyOvnXoezqwkfmbX4UkDXWFOmTWzgSTIdeRlBgqQ1f9Kf
         O3yLzUtqTXlSGR7DmMxmLZkhO2G/0vzTcRHzao1zEhhyHfWXBSBDK9hBPs4HczuvgOoi
         ijcEgIgo8hkdn5hV9Rt9BqYhKKEBAilLvOVisr9zlKNATZOf/f/wgC0/6dLhKFPhtfg9
         kj5QSGVi4riGc1m8hKt0OS4jkwV4FVdwuMHZSVLUynj2NPH6O10zIBawnrJpgGFr0YFc
         Bz7Hfc0nJ6QerMQhPi5VA2I0VA5irvnx0vqzdVtxJsIF6iy9b4pPM1Hr3zKBcqAaJPlG
         UkSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Qur1AcbdATJ+uTquVOB3VxT77hQV7AVrfqrg4+T9S7yjrGCFGJbWu/eDyYDU2uGgYEo7ye37+12jt@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9yu8m5VnzkEAfn81ucBooJJl5QocWlmUXy3s+Rb40ueEcJ1B
	8lueQ7FtQ0CL57uhPAb4NOtdOYvqGIQRFGJcpPZWXR8F84gmUzXcqru68CsvRuIURMc=
X-Gm-Gg: AfdE7cl2vpD4ZICrIsBXCaA68iZ8JDrbWdF/svrFVObwlKsxcgkOwEsTTfeD6hAnp4j
	4O3bkyZhCEZtHxY+x/8ommUR97MZTFTyvokdySBsbjwBC68mT7fVSXBADIIULe2ZXhKagNnt0+c
	6RQyl6jqOX9wzXAcL0zLB0O/1LIyJsX3/MXrAq0xEAcuHlxTLQowuvVakLw2JLnDrvhQDQv/BNX
	9t8XMvNgHBVP4s+3IGiDx0xICmdNViC2Jh7ktGDYDZnk8eimDD4MnvSrXVm3IV0l+y3/RbpqdLb
	Xel1xF2Srnjg2UXfcyQHv6KmejXafb0hiRm/tEtRsbV2AyXpytdj/Q0FfWqcL0N3pglextgecHF
	X4zAD/dFYfHwlyjIxJhPJ1h13/18gfciujvno/wga1pENn/7cZuOZ8rSfri0XQq8I+Hfm6QTxHu
	d6Zo1U/dHwqvZqYldnzyT2ysOb26VzyPpn/q1lWjiNagIZR01bqnD4PfvHSr1qpNeT
X-Received: by 2002:a05:6102:cd0:b0:631:7781:fe91 with SMTP id ada2fe7eead31-72a1d82fb9amr9896827137.9.1782138207934;
        Mon, 22 Jun 2026 07:23:27 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba4f2905csm6297631137.8.2026.06.22.07.23.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:23:26 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59ebb89109aso3367556e0c.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/FVOP5WW27p+nhDPG8mhUCS7W+uUXMLnpAFxZXkYV0SNkMfSQ8UtVocVXJiidexsfibHvxWZOu69ik@vger.kernel.org
X-Received: by 2002:a05:6102:cd0:b0:631:7781:fe91 with SMTP id
 ada2fe7eead31-72a1d82fb9amr9896596137.9.1782138205971; Mon, 22 Jun 2026
 07:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-4-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-4-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:23:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzLB6tjgLFoxHgROUNZzyJxTc7n+w5mwuOofFjJmjgqA@mail.gmail.com>
X-Gm-Features: AVVi8CeRRavvQLT356DCXy2-7RBj9jzC5WtAT-mLur0kf5Z40ESkA2m96DB7MyM
Message-ID: <CAMuHMdXzLB6tjgLFoxHgROUNZzyJxTc7n+w5mwuOofFjJmjgqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: r9a06g032: Add support for timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the Renesas RZ/N1 SoCs family, two timers block are available.
>
> Each block contains 8 timers composed of 6 16-bits timers and 2 32-bits
> timers.
>
> Each timer has its own interrupt line.
>
> Describe those timers blocks.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
