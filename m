Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16B3E4C69
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870135; cv=none; b=IAlBBWBoKDWk0Vw54tJ2du37Ae7mZlsiMhhElwaDZ14FH0pdOMy3T0HsI1eRmbtR3OLPVCPS+Yxwp+rZVNJKIKpQTXXJfZRAlWMVfOIDL41zWtAInJOhJBy+AE9kom96/eyoAp+FGA2QMYzAsazcVKEcARdGlt3lTH5tcLGcpsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870135; c=relaxed/simple;
	bh=4qfVZ/5nw4amR7KDjxEudFePppzurkPQMXOHgtElbeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J005+uYvqv4RSWNmRWCn3RDYBWmhlWthEMaZXFm3dIXAEDmeFV09EMuZYq83QcBGXdOMDmiolzSLu1TgYlvkT9dFH0a3+N7HYvcvv3inVQeClpqflnfuuSorajPMgIwaqJ2e4X5adC8SU2GsH3yV9pfHgCG1BKKoLOuRD9qENRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b39befc6a8so2276100b6e.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870131; x=1789474931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ITJx792r+ituep1jxzGor7V94Ftkp9w2SLxSuD0zdE=;
        b=n+DBMOZJgcJTPPr+TAXZFpfYftmoDxShk4Bj+zoFlF/7varw5cjaY3qTfOI1SVfeao
         om8I7W6BPMz3iyKWhflToGcQ/C08EjkEMHVcvi9Te5XiKTiTgICaHPOKbgBpqdo4X7+3
         qsPvcdhUAZjOK8MMrnPVvjm8mxcpWZeU04kU3EVFRTxdIY7vkBvqG/dLJqLCgcHyaYq/
         vH71qJN6gTfqPP2wQMTgkeF3HYcijkUbsCchB+4Mi9yh9jbJKk55D6cM0MBnkCni8K+7
         CntSZfvelHr870MROqCml+EPNjIY4+jLk6U0a5tOkolwZO2DbsZ4030NcFUCwAvKX4nW
         bx1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwEK18jhOUcwPZdVw2baGUeff/oi0rXuJXcNVn329srsTYePJ1SIlQ9YVg8Sgx2zxb5MRIyqZlu3kU8@vger.kernel.org
X-Gm-Message-State: AFuF++liqHx+eRVFSRcUlVeaAr0MGPuRxcMqHYDZkkF9k9CVXfa62kgG
	V2RERftISNWnyakAVxGdk1G3ho5ulYUSa+TuzjYOVEs/hy1GoAMNgYbxRhin2EUG
X-Gm-Gg: AYBFou03PeB777LLENG5J39pPpGZOP6ZVWlSsVyA3TIg5tO3Js6CfQRl1alYEUSXI+I
	+2dYn4xj8zNT966Hyvj8kifnaAdOCBkhvsipB8P+HODbuqeky/xPr6se8mUNCu83xAd6W5oxjlT
	I8xdGKRZ2g8c2CG0p+7nyDmM5AERNlGJGS5XzLUtZDW5Vj0XUO1YZCGgHZ2AAACdFM3evsXley4
	aviXzeYtuteaMIGQofpZeoCEjNWhykTSvKCaPUxQOgQoTRxEPkoPFasDBO+wPkzxouO7L7PYcFV
	W9Fk6wjQvhHoe3aOguZevPXQkOywoKyfpv1xMMbJgmklM+RlXeClspoIfrjDLRgWou81Sx0Fpv9
	kXzRNZL7fOvMolkOlUzo8A2sKyoEphMpy/r59b9vv9qzQgzbUXKcculLE4Mpzsd17t9vdaaNCcP
	dOiji4+oSInRbA2CDsBlkCI8QON4Th9FqXXrEHeOrn+fyQ3hK274RXnWuwEHflHbr+i95ABSc8x
	bkBcJVlz8N1aH3C/m0ZtzB4ug==
X-Received: by 2002:a05:6808:f8c:b0:4b9:a829:f018 with SMTP id 5614622812f47-4b9a829f8f4mr13782640b6e.36.1788870130758;
        Tue, 08 Sep 2026 05:22:10 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4bced93b205sm5598675b6e.14.2026.09.08.05.22.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:22:10 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-455ca262ccbso3698529fac.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:22:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZ46d38Ty9J+LwlpfxynaGx/j1eP0RALrRRpLa7Vzsq69x4dV2EBEVo7FDvojfvuii8OQdEBudBYxg@vger.kernel.org
X-Received: by 2002:a05:6122:4698:b0:5bf:4522:fca7 with SMTP id
 71dfb90a1353d-5c7ed3b2275mr10642726e0c.4.1788869822558; Tue, 08 Sep 2026
 05:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
X-Gm-Features: AcwNN1XnePIl5mdE7u2itKH3ZKW58ZQZ46L6E5RD6lZgFL-MnDqW0nO0uTjSR8c
Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: renesas: sparrow-hawk: Enable
 DisplayPort by adding DSC
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
> DisplayPort on the Sparrow Hawk board uses sn65dsi86 bridge, which in
> turn gets the video stream from the SoC's DSI1 port. DSI1 pipeline has a
> DSC block in between the DU and the DSI1. However, there was no DSC
> driver in Linux and also the DSC was not defined in the dts files, and
> thus the DisplayPort output did not work.
>
> Now that we have DSC defined in the SoC dts file (r8a779g0.dtsi), we can
> enable DSC for sparrowhawk.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrow hawk changes from the soc changes]
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DSC DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
