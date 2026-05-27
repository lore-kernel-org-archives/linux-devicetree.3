Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370540C5C5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889267; cv=none; b=mgd0lQD4L8ZFjYa6jHULrLj6dvpW5et6dltNj87tE6Rmcj23W8OVCY4vID4qJxsP1JXJzBZV7mlwv3zX/Ba/ipz1mh7VsSfPmctZzR9wgNpDDzEohoQCuenIRnf4262Ql7F3Xa3bAm3RW7FskQ82JlUTKdNnUQkxe6t8+BTB5sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889267; c=relaxed/simple;
	bh=mEcrfUMvusxTikKtH8K1dnfTNnQJfa+aFYGiWe/y/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFDd+4Cz7iWY/11JYlOoFy7ekLD093SzKIlGHjyLI/rSvje88hvqslcSxZ2BHNZkD04tq1aanAVl5s9EMiax4yDfBnzn/1OguBNVfw2VIrkVO8prqknhv/oixMTfbw+XAhkZSSwCfzk8ooqteJYoJywLJlXGQZgzs1p7s+GNPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-57746408b3eso7170891e0c.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889260; x=1780494060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNs9y+loQ3B7k+4+DTGFYd+r0HnydJFAxPOIKSPX9Cg=;
        b=KhUW/10NNkDLUi4GxPDlOJsCuIEmduu/g4w1t5AocCtS73T6lVMh9HB3dHB6MuR4rt
         TnXBzLBrKff8tQ1glo7OFyRn10pefyBXadfUmRGo79uAsrrE+uvUOoH+zmSpt0e/ibbh
         FAcREVDQ+jG479TIUWEHA1JH514X/IHYAeBbLCNndtcXS4A2TlBOVyQY4lyA7rCNTxWs
         bbL1FnKGYVdy3ot/Jukpo4c3pFNefa0lJ1pqW6oI3LZN7bnh7jbWSPeyG1F32DrrfM+1
         ZDRRJSwy3Ojm7Hv8mNm1w7vbtfuaeqCxfI8Q3yjIiQK+MpJZNX3bYq64Fc37OFla+oCF
         7dJw==
X-Forwarded-Encrypted: i=1; AFNElJ/I0uBoftQwKTy3IqbDCrn5mgzhQziO+M23qMyqCjF61fXtqwkwdEWIBU3yXt4XONuY4NzaFswQHqLT@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUK2ZY7eiPLE+CYU6hAr7XFrw6szQewxj/23mw2wI1nF36WGP
	JvKnbtVfUGw6Hih6gdRXZxKLr3bVw7BZN7+oafDoklORQIP22VbNPl8QpgEeCSIUM4w=
X-Gm-Gg: Acq92OENs+SQCrzNrhEZ/NajAStk/W5dfvEJhVoH7piLwXriG6XDngSumCuJFlGaWfW
	JX0TCU3guuYmreP+Cw+utMDWAELTqaQG715wc4NmgO+D+nH34hQodrvwcd3qhkVy0RVjdgL8Xeu
	QmXPajmuoXqzLw2k7EVDMaE4ZgFKmXLGv4DhUPF6qx1WAQ39WHS9fDJYo5a0gRjyiLPjbo1fBW/
	BcDiNe+T7SvfaaQBS8KaY3vJ+YfhbGu2m0LFqO4SxF7dwFghTpTYb9hUblExeeB5+XtU4qzsZA2
	3MCZ8xlNim6Xa1C/xmdUnFJBw1M3lPe0mwpbz8g94m2CZeLky10GyWQSqoIE5/gj5x9hEL1sxWL
	hHl813EaSUtWwX1Xi7IH79e5iXnuq/+UfvXB/XKakVU4HimNAAXFD04SybuXPPXPeCAzSnIJkHo
	thfx84xUFkBVELZfbF3HMaOdPdyUGE7WO97sbPEZm0foeWI0/OzxtT0bvSPmiW
X-Received: by 2002:a05:6122:32c5:b0:575:2ac3:4166 with SMTP id 71dfb90a1353d-5865fdf6488mr12004584e0c.6.1779889259778;
        Wed, 27 May 2026 06:40:59 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23ee48esm20065695e0c.3.2026.05.27.06.40.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:40:59 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-63145ce291bso9078446137.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HBm8rtJUt6cMqzKF18ToSMpW4R5rWHPhW0zOBhuBeeFQqszzBqodAW83ALN3pdOaVFGkoWPYru3ge@vger.kernel.org
X-Received: by 2002:a05:6122:32c5:b0:575:2ac3:4166 with SMTP id
 71dfb90a1353d-5865fdf6488mr11991906e0c.6.1779888899429; Wed, 27 May 2026
 06:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com> <20260515-rcar-du-dsc-v3-1-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-1-164157820498@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:34:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ5TDEx1Qj+3_LAGLrgNkiYxADkDox70pApZUtbam9Jw@mail.gmail.com>
X-Gm-Features: AVHnY4JU-pRdfRlPcY6GhkzF7rJsa1sewBAKfT1mHVG-dL_G2g5Q1LYyK6-SKY8
Message-ID: <CAMuHMdXQ5TDEx1Qj+3_LAGLrgNkiYxADkDox70pApZUtbam9Jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] clk: renesas: r8a779g0: Add DSC clock
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 11:10, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Add the DSC module clock for Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
