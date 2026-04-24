Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6D83D4131
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036276; cv=none; b=H9kbCGY4AuGMQdDuYj9TINLxp3OCG7qyLYoQr7gJTnrQYqYoiL3YJV6BkVYr4OLhLHwvjGYtqg+GBdm/1zNo/GSAcWr/oLhaY8hQPag8knkSAhooSOSl8o2dMChJPUn1diNCbXstY0OMwUr9N7igvNL+vPZapAg2/Agi6hLpTFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036276; c=relaxed/simple;
	bh=jK60j71r/PMCLKQKB8efHIPJARlwkjCBCLpWCUUQ5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCAs+dVQovCzkFtp+6ikWE9K8A6o+bZg4Wesqp83zUe3mO6i99yQFvP6a08K9xRiVHYDWidFn4h6tLbpbrFLoi34EtEqdZDD5ENf0rqnx8uCGlo4Zko6VgWYn8edFawsDDmy8002UZTwTexlu49+264le4bXJlVmt00fxpaRRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1145890466b.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777036274; x=1777641074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUxa5Yac5JZ/JIOen5ChIgl6Jr4G3NyrY10W57+tI7U=;
        b=PnFcMyUE6tuKJlFW8foLQTFs3VizH4e1q5QfNtCps6Vwi6sed/eXud39EIG1fXoQ/l
         Fz5NsmHxmpQLMq8pKOlDAd+IBW956pKa9zeHIHJaxHmRjTHkNO4t8R5X8k43JpWiCfwL
         /AH5H0GVsuBaSBXvi0IX2O8yvUX4qGK9jC4OPHB/CVAFhbUJLDXitYCl30GemvHUGTC2
         y6ZGxC5c6wFJMp/0lJCwsYIaadMaqm0aG8S+RgjhLAEDMg8fHLGyRB16RWkCYEdUL6Cp
         m2OSznssImaVKRLVpkeEG7sh8r3AlVXN7y5/wu0Iyd3OJ7hq95VuvrOGJMquWuHc8Avo
         TjcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+I0xCjP/3E7LCxoNPNmivIZ/E0m5Ot83mz2//tozLlwWL7bJb8TcWOn4xLxgaQANqfycsIl9vzdj7m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4IQsmaiUEqtLoFQbU8zDIbugY78M4sOOdfBhvw0N8g/AN4moF
	YU5rvK8Jb+5ta0qB1vnYK8fAq5iJO4hQzPulzinbNC4iWn+/x74HkFndjKA0jJv1J0k=
X-Gm-Gg: AeBDievNGsxwQ/nAzSgnEPDcVofvPLO3553yCyByffUgGuugLJE1yH5bP9cRvlnhPGw
	Ru8UkhBZL7CUnl8HJrHcZqErSSPjGMZ5/WbgEWTPYeIN3FcTKt9PY8ATPsuV4idt0WEZ/tIFK+O
	VXydqt/ab+qlfIpePq0I0B6a00+gbclXIQoNa3KS0OeEC5q8ig1jdedgjQb/60L7iOYYzphyYC9
	gpqn4uoACiOvK65nwC156cLmrM4q7HYj0RbnosLZNBv9PYctH79gj5W3Z/N5ulbPDLhNDf0sMhm
	7Vmn4Mn2XDJ9ZAFzbnAooSC1LjfZnT8HukC5CBdfBl8sXChJx0vnDwMZwY1XFefvsu0YjMXu/pc
	IrddSzJUtNhhsn9PFpcF7uvQn8ne9biYhcQl9km6EkjiEUXxonw7/Hrm1huoWTCVxAttqnv3Fwm
	RL6d62jFIIDP4Zqs8TQRwyEfnkN4CQpzA31omP8tH0mIUA5b0+7Y045kDYA/ELug6oqxU8oNM=
X-Received: by 2002:a17:907:1c98:b0:ba5:7cce:9794 with SMTP id a640c23a62f3a-ba57cce9990mr1295751766b.30.1777036273458;
        Fri, 24 Apr 2026 06:11:13 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm759722466b.63.2026.04.24.06.11.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:11:13 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so9497559a12.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:11:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+lzyCCobeDM0SmQE98pxo3IBWBCAPgBY2U2K7az8/IoWB6haS8OTfsODkOYpmwomDIU5jWcrBN7l1E@vger.kernel.org
X-Received: by 2002:a17:907:d07:b0:ba3:76b9:c3cd with SMTP id
 a640c23a62f3a-ba41b3de820mr1726472066b.42.1777035885959; Fri, 24 Apr 2026
 06:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:04:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwdxVW9_xo-ivXWQHGe=6X=ZXyVGbxPf08Db2ryY0N+A@mail.gmail.com>
X-Gm-Features: AQROBzCYN8yQbUxpaU1BB5qpPqsbb7NS2Sh7I8H4Hxzs1kZXyoKXl2JLcJdS0KM
Message-ID: <CAMuHMdUwdxVW9_xo-ivXWQHGe=6X=ZXyVGbxPf08Db2ryY0N+A@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] clk: renesas: r9a09g077: add MTU3 module clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:36, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a MTU3
> block connected to the PCLKH and with a module clock controlled by
> register 0x308, bit 0.
>
> Add support for the module clock.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
