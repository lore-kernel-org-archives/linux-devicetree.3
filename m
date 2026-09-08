Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7597953A8A6
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869537; cv=none; b=kYT+mMP8V3IvJW6Amb5UqOlbjmJWrqakc0Fa7WbnbExo7rbag3GJ8XICUBC0VJJqWtyI13BSVbh0O7tb/R4fN9VSgTnqpOLFsPEdktYlJHqPzzwRpaN9OBis0iR1Y2wT9ljjZZyLivkileY8m6/TKAGFKOzpopOzuA1niFZJGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869537; c=relaxed/simple;
	bh=0TMTisvxJ+92sKupOfinZVmI2wJF91ccrQT+YBZKyKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRaCNDnkyN/o1aObFGhc2lHz75uZHmVs3I73Lrkq6VahUHieFlZ59FFly34jGocWZvWUepJO/+bzHAsXxDnuirxO1MC5i2X5ZSnr6l62ApenTyrULw+Eqq7IGxEYOEWf+bzEJGOVLQ8Rsb+NHdkmpWs8hT6YgbYYjBUuOlvFGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7868ca1f0d2so866102137.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869518; x=1789474318;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ofUUPAlzK0RlPGiJuLSG6vss9ksk5CLPkzJ8jLWh4TE=;
        b=RB7mnkVnm/woePVVQGQr1rrn4I9ZTwdMGVcqMhU538TRORAGeD1FWOdDhhydTJETYd
         ct5u6NQPRsOS7RfHvr9CXgcHbl0Lke31QE1zRxp1KjZKqt9US/I6uXwZzzMsOTH+gOOG
         M5tX6Mpz8foI2JqfzHxvhXtNc8JEGx9ZXloMoGOpr98nK1APIIPz+yW1aNQxsWieXtn7
         sn//VLGmSYPrBfwcSov8V4tW5xW0uhgoYMq6KILPfmMOvMItyoYeJme6ZOYS+jIutL6M
         uCP4He65+ruRBZL0Ts8Oxb3DaV3p+M8FjrhJ0nrcjQjsBZNwzIpmDoboyZ9rJbgUbf1f
         e7Qg==
X-Forwarded-Encrypted: i=1; AKwUvBy8yGKVHt3Cfk32mexUrR4V7yCse0XPJNNcQbjU6j8BOhgDHq8/naonlCsGDtdWZ4YrC8hlGv+Ran88@vger.kernel.org
X-Gm-Message-State: AFuF++m2gWcd/v7ogFCCDFzhWUSk45OhQeP5tVuHnMkmzFiaukZOKyYA
	Oti0CIVX5XpBXZFDl6oUMzaubLMWj2mH08Yo07fX9bNFhhImlMDeA/RbaO03Jwel
X-Gm-Gg: AYBFou3c6hO8CtW7xcYkG0qe8lQD8oMrtvgTmoTp596wzj2Ji4aTdWki1Py1jZW7vGA
	TyeTG5PeFK49z0tHhrpj5B9DIvE6bvYf/ECxkdVoIPlDD9RpIx0lkdaOr3MkwH+OvAVxIwftyWR
	Hfl3Xf0+hOjS0ScfO9SPRwYTHDC9bLW9+9dyamHg4W/8yNiYR8jPYCuoJPkins7y1i4QQjkyghU
	nCXFE55mw3dDCgcBdfCgW30ZRLqSbBwEPDD3F3buGh7jaeM2OaC0EqMHvoPGq4f4suuPdJRltFV
	utK9syYN04hQH2zWxY0iQnG+WlMwQ/G6n/PQMmSqd6iQMmth1vMEK+GZhYZfBIKQDl0PrVVgw6N
	Bix47Xo2VySxyquktDje4q//8G5Pg+fA6+55WgTdL/2I2Ai++ZIj+xSd8KEWFd71r/tvQbt5tkp
	dhjSuX0iBQ6zDL0hgxaAVAv608RiS3DRgVdGEj/Sz5aeleDKxo3zAY7X13LkQYRmkuj5tglpn7E
	97vrFQoo4xsQq+DmpURMLBB0w==
X-Received: by 2002:a05:6102:26cd:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-78a4a58e509mr7791022137.1.1788869517996;
        Tue, 08 Sep 2026 05:11:57 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b32678sm8540874137.10.2026.09.08.05.11.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:11:57 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso1398643241.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpNVSdTqa0Mj6nK0DAYfV/6HQzsoVpsN0KBFzuUtLtTQgZaENWzXmDfN0p9R5FNTFcVZhcfKwIsm9U@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr9426846137.10.1788869517073; Tue, 08 Sep 2026
 05:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
X-Gm-Features: AcwNN1WQMv0pxPEjkRceB80LKKGbxYp0qnUsTTCp1Uv8lpJfhrW-zDPu8BR9rQQ
Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: renesas: r8a779g0: Add DSC
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

On Mon, 7 Sept 2026 at 11:30, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.
>
> The current dtsi file does not represent the DSC at all, and thus the
> pipeline for DSI1 has not been functional.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrowhawk changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
