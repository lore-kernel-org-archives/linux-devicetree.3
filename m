Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508631F9BE
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226451; cv=none; b=sA//lAtt1JzjHBAiYUZAwLywaLFaBDc74a+zvqIh46Y2H07D8idVpMy60YOdThmAEu+utpIueJesw4ok909oCfbXVxJku9sOogV7vH64sMPyPP5ahhB6eSr7odlsrsoMbXvdpWH2i1QZrCiT0jRijNeoaL1iDj6mK+dJgIlMllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226451; c=relaxed/simple;
	bh=pk3moMq1FKy0fl1HwB0CJkZy44+CQqnu0oNoBum5fLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnCkinhw8R/ytsDgZRoQIfpKk4pby5tmyNbjjfW1iAjRZ7CBZmhNdyyNJzjYNhzrrBLAESc0jE0HAgFADZtCXFxJA84phYhzaT7D5964htiG2e8YQXLaSHIf5yh6NrdI6O8E5glKQg8vQ7UuHtN4LsUy+mJYqgROV/m+V76Zzu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-57513ac61f0so542687e0c.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226446; x=1778831246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FZfZV6lWdmpc+MfoLFhi38NvgPEcuF56xNXrAqxNBA=;
        b=Z3g+ZXcwmbM7oqiElYXud+K0zGINhnKlCOw8An1kEG5A/9DS4qNZWdT6qYO/HTpu3G
         0ZSyR+21nnhngh4TGWW0tfn8NHQtEfMRTZzFZVA5Ykz1At04VDYtkybnT4rUgtsACHT+
         fGKrDzio5CFIJ1hzdfe4UzGtwuSXe9q1VsNA8lLZtAvjvKg30Y0PmNFCH8ql6uXaLIj7
         yo4BHbHgGfgT4I8AQZnTgnoWa9/zTH4BaOoc+YuKSY7+rItH29VJulwTfhstWWndWVQg
         dwVP/Q9m015ONEv3Cm/fSXyNAGAQRQkvfHdJorSshE3d7BUqMHdmPlyFHTCU8gm8lYhf
         o4SA==
X-Forwarded-Encrypted: i=1; AFNElJ/DwGYGNOEu26Jx/c/0O37+P1NV9fHAWs/pOz+lRn1NV1Sdon4vHmikp4UEff55Xn8PQQhu34iUy15k@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNEZbxiUDccpLK3TbTs0r8BodCR17Q+TOEsZtdmvRyyYWlyaq
	ZmWbpMfL1GKSzREVS4Jt85pY/gQcQRJ2OZtk57OPbOIO2yOJCn+TZM0xAM4fpI6hWlqXog==
X-Gm-Gg: Acq92OFsrlVMJzSxTSdT2Yhlf2ocSnjXp9fxodiZ97s60wz2fw7yDs3OgQu5Ywsr+qf
	CenN/9hBaMkqPoNkR6I3u58IK9eIb4nVFzeqyr2zGlHetAjn84zs/Y4Qa6QQM+C+b7wwNZMt9gb
	NlyJmjHV/RIppe02fvqxO0iCfyYUfYSOWtURQVardhmxX5FUcjvol/KpVdBZ3y1Termsy36uqdV
	FN2wOgon90i8LBf1ixfIvTt590ZUk0d3OvnBcvItBlB1E2rQBUW30w/QaZzFV0lJws5Sptva1nR
	Q/vxyVkcfvMVdIrprhUxf1GsdpkjrhhF+HUDV+VsR1Yofew6x0zpqurpmNYdaa8WXiqe/075Nga
	AkYdGqI/29RJP5iBvJEZ53WmnOIxpS69wYjM6aEyfyCNf0iUi9OgqxN9GDWR8059NhmRwj4+XeE
	gC3pr/xAys/FgM25CVWEWNzo+9CF7jeziggF7cadwz13yc+rFmSn4MMUqgsyWN
X-Received: by 2002:a05:6122:3d01:b0:56c:d34e:bb1a with SMTP id 71dfb90a1353d-5755952ae30mr6173924e0c.4.1778226446540;
        Fri, 08 May 2026 00:47:26 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575585f72c1sm5596497e0c.12.2026.05.08.00.47.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:47:26 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-956995b5bb6so545268241.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qfw1YL+JNyHhd0OxxKEBCPKbnTRfhyIrhYTlHfs731BXybkjFiJ5drGtd4qXFmIDiJX38yAfmkASo@vger.kernel.org
X-Received: by 2002:a05:6102:8499:10b0:631:28c1:155c with SMTP id
 ada2fe7eead31-63128c11e98mr2184841137.7.1778226445710; Fri, 08 May 2026
 00:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
In-Reply-To: <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 09:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
X-Gm-Features: AVHnY4Jrjqq6M3ZL6uO54VIlKGFRT3YU3BSC7jZzhSUGnVnDGxRcagGSeBzeNKo
Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 7 May 2026 at 23:53, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet, or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
> Just one more question -- the power-domain-cells second cell and
> reset-cells are always going to be identical values, correct ? If so, it

Yes they are.

> would be nice to keep the description: aligned, and maybe even indicate
> in the description that those two values have to be the same.

I thought that was obvious (but apparently it is not)? The descriptions
are identical, except for the latter not explaining again what a module
number is composed of...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
