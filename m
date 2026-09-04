Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAFB4E80A9
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534061; cv=none; b=PvaORcgSTf0Nu3kJs5uJE+cxEf+LTFb04MstUjDt9Wj5N1kxb5Q8RULUOUBeztTc/QCTmkatVTatIe6Nx2kxwgPL07f72iLzV9YemufE8R7JuF9wKzOkhiNxSR2FPa4x3fopOhLq55nk4klHRdqfnoJDuNh0nskMYBDHjxWMnT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534061; c=relaxed/simple;
	bh=dxuiJN3F+W/TTKG8/DBhxTqg4U9X29/XkWqF1QF1YkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQN7D167sS6UP3q0exO4oJgiODo+du7Tk0qvOKrNwWgcxUifq8z+L6lapXxsJ2wCmf4WSQzy5bk5yv4J4HsjTf3M1mGw5y0JH6W4GRILaNPoJE4fBaTF1uRUowzf1sSaBZ3FyxgWaSoddVwRmfGhYgwsN48ewlgmUvGwnA388kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-777ae5e5caeso377619137.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534058; x=1789138858;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIoiHSllQkJNgmmben61gMxsX8BWtDH0S9evEzpoUUA=;
        b=I2pzqSfyLZoDKdVEafy7Zt07+qL4Hy7gP4F65NcS0OuPWJg89HkXp0oKEY4D0uuAHk
         mqBbQip75jGSE3lrm4MXgvUp6JOhLTMe8hk/OOWsjPhgarsIH3PeaIrBM7Hx4/G4z0T8
         vE33P/Tam/4SDCd3zRvgEe5/uHomrxCa6xtf3PIYJDOCqBPpTFtz3AmUtG8nd43/JH5w
         mcHCxTf92xbycS9XhcpMvgFIvgACVtlLDeAyMeNGWgGuOnlSnJNvlTI8u/4INooup/BY
         pd16F1BVwxMNjFonlAVSUdQMe5maYMOAXCiipsERweP42s9vfhfNOxdVbhnSEW0oTOng
         PGVQ==
X-Forwarded-Encrypted: i=1; AKwUvBycCbbWkar0V6kVxAHX6E5RMEmlb+q3v5QhHb7qFRlg682034X8aTCs8K26Pwx/pYhw1acG+48TIX7s@vger.kernel.org
X-Gm-Message-State: AFuF++mpwRSyLUZHzmpms1Bouk6Ox+MPGcWg6+pm50G8WTmIGeXQTDco
	o6B0TbNMFIIozJIG3EDXNmiFitRcX3bOHmitCNZEm02nEkrWa5pd7fa0egGeeCcx
X-Gm-Gg: AYBFou1sr9cBQUooH4PNW345MjD+P+XbnMUqubey8AV9mrSFDgG5HxZ0aM2OVe1dh9h
	Xsz4mWHfKIVCL+3xJA88tMy6COpsjQsUB4n/MqRFTbtoKgZallAH0FQIl2em1EKQnKowyOIBpnZ
	8P3yqYyHykLHp1MR3rgfJptAwxuuFV6WSAylfJcLgJgVBsCcsDHiApVbupcTobs001LpO3MElD8
	jwXn2KODH8mCztqmfWmjsWIgXbj26LrUU3icOe/WEKKyymDwkn/tNqDUpqpFm+dOGxS5KXkEW75
	z5qt5CdXop6jy8PL9IjNMotB03+Gwbf4zaKA007E0pgAJ8PX9MgqlnvOnw8qWfsO6XHVrtalNGs
	nRVzxoUxbvaUNgg1cMDMEOLrtb0eet2t1ZtIZA353oh/i+1O53aaAscklJmx3ZmuIxC8UMOkdsD
	lV6hrkhiQfeWjM796XgLeOeADDDdztX/s0S9piDDJPMafCMqWuR095YdjjmC4xgk/IwaIVoZIEq
	T122uZ0payE7eg/pKrbVaNwyrowXg==
X-Received: by 2002:a05:6102:5091:b0:786:7a59:a313 with SMTP id ada2fe7eead31-78a4aa368femr1625568137.13.1788534057441;
        Fri, 04 Sep 2026 08:00:57 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b56bd3sm1870592137.12.2026.09.04.08.00.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:00:56 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c65d654c23so470847e0c.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0Outemp4cIzTUL8thrD5lzhruY9m/7Q+neuk60+Hwx6og0rN6wQ22Yxi/1UJ0SpSRF4xFmblJkZ1y@vger.kernel.org
X-Received: by 2002:a05:6122:8f8d:b0:5c3:61c2:9ec6 with SMTP id
 71dfb90a1353d-5c7ed456d8bmr2814332e0c.7.1788534054755; Fri, 04 Sep 2026
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
X-Gm-Features: AcwNN1XGMcfTKgzVCocL_OQ77Hbdu56w54bgvUPYdeBOHMixmFG2F9qVHqoWoGg
Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> This patch adds power domain indices for the Renesas RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/power/r8a774a3-sysc.h

renesas,r8a774a3-sysc.h

> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A774A3_SYSC_H__

[...]

> +#endif /* __DT_BINDINGS_POWER_R8A774A3_SYSC_H__ */

__DT_BINDINGS_POWER_RENESAS_R8A774A3_SYSC_H__

With the vendor prefixes added:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
