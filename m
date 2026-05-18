Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB573F7A81
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104926; cv=none; b=DQtApr5PR9zX8XUaR5AM+Cx5Jmifm8lOtmC3yv554rlT1XaXVRm+07NUOMblBcVf+xggbhgVQ3ERC2TruNSL7J6a9Ty6tdFwm0gzLewq7b72UP8HCwtnj9+nllLZ+Xj+Sw1X9IQCtgyL8435z6Q8UTCvX9JqCE89grpDecjNa1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104926; c=relaxed/simple;
	bh=Ax2y7pmSuZrEkSP0ce0Fej26Z6ct7xdJQdPYertuzbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsbLrqtRtAZB9LaOdLZvuOHP68z0Fh9BhJpnbWEjLtFcH4lwK3h9Cih0Kw/wI9EGYsFGUqG++WzdKufRkubtj0khLuJQGOaZ3vNSJocHoSF3JAyQIMVAJmkAShUKiQb8IQvlri5wgcWpDM6MxplBYEpgHSPyg5Dy1DQK6BuU/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9144163319fso104588385a.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104923; x=1779709723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3bmWUZgjAYZamnd3Aw3Zf+CdNP9jYAgiNz9GJP8Rro=;
        b=pYPZqxpoWHu34J2QqKagtH80q1LUTKf4Dt89CUCHVO59KQGgdPAKHepF4Sh0eB1jcc
         +ndcftLUyUOCfDe6B2ZjbPLUtRcFpvCAEHiNhxkwZjZ7/Tn/8fekSJIZFhlEglTkZHk3
         CNeGmal6BWyktosWPwJqJE4ng+OhXy0Csf8oCNMX5ZlKtBeisK9xsdnhcMIppJrcYsb4
         IHLZCQCdD8FuLueryAPaZZ/WTwO7odCFGV8bByOddTDLljmUAdU0nv2wzC2J4Y4Xi96e
         W6gA8uwchkXbjImf+JfAyo150tpExNgviPHZwi0p0QhXjZ+TAVBnffGOpIrBCXgVgqWy
         gvQw==
X-Forwarded-Encrypted: i=1; AFNElJ+njwmco/BLHKOgy8nv4RXu/+vBkGhJOvRCbz1jskcqyHo8fCGCQascr9jniWYcMHPtMdQryl9IEM78@vger.kernel.org
X-Gm-Message-State: AOJu0YwKmVPCxnwjmYu+o+w51eYQADF0HvNF8F/hdlGgixzSdkEVxMkK
	x3RpPPYMfKq1dPRAvZbGbpd/ot+YVTrJ1MQva8G5rX3hdFe0TRQgZ9MKcIiBc/f+
X-Gm-Gg: Acq92OEo2TyFfZRDklOCxYHJOkp5Kap2IBvOKhT9oy4hIYv0tXSpB1Si6vBsyq82Nkd
	s8q+zkpb8nSKEQqcIAYy3Uq6hrwet9uUVDR6I1tXGnoX5cTS4wmT2nM7r4C1wnECyzq9e7iCZdm
	9u0EvRblNfItKqGKdrCHqN0QqhVcf3HUW2D1KBYdQ1MWJC/MCyfk4KbV+Kgx9qoPFPGNXy0sHJH
	xR2w82DOmq939vmTQz+gNqrfGuBeJ2nd1ty4QluYN2suZTdHuIT6b+vKrAm2NrNpiPIBrtOyI9F
	w7gKE1BtVDWiX+vparr3t+xYqTcNwX3ZCELkvJJ1UHC1eOZGtOs5TNicQ7PzdUDPyM7VXsp3Wya
	J0u4MWZTa9yhh0/Zsfo/UZznv46edtv7gGzowemWse5+VsxBGTk9jteCrqsIPVskFdpWqxmdV+b
	ary4/Ee6jaoQBT4UgSx0BpCVFRDMkAOe2bN8hKUwHOLDdSzK+9LAP/Ul9XNaWevWY3
X-Received: by 2002:a05:620a:c41:b0:90f:c88d:ebce with SMTP id af79cd13be357-911cd175148mr2159836085a.1.1779104923363;
        Mon, 18 May 2026 04:48:43 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3584esm1443591885a.34.2026.05.18.04.48.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:48:42 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9144163319fso104585985a.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:48:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9L+Lnh4pRhZ4Hi5GtCOMA+zDlHjUbE5JmvGSqcGsEAZ1ulSUQ4undP4tFR2GiKVXHN33BrHxhpVJTf@vger.kernel.org
X-Received: by 2002:a05:6122:4690:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5760beaed3bmr5626640e0c.7.1779104463611; Mon, 18 May 2026
 04:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com> <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 13:40:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf4dGnK4ooTyw_31Ueanr-Ym3nhML4a12exU+5nFYh2g@mail.gmail.com>
X-Gm-Features: AVHnY4Lo5h0gdtI7uD_PcBRMzgonT5rakDO4TjP7cpU7h0ngOw5-dH_yEpIVciE
Message-ID: <CAMuHMdUf4dGnK4ooTyw_31Ueanr-Ym3nhML4a12exU+5nFYh2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

Hi Tomi,

On Fri, 15 May 2026 at 11:10, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +                                  struct drm_atomic_state *state)

drm_atomic_state is no more since commit 5164f7e7ff8ec7d4
("drm: Rename struct drm_atomic_state to drm_atomic_commit") in
drm-misc/for-linux-next (next-20260506 and later).

> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       WARN_ON(pm_runtime_resume_and_get(dsc->dev));
> +}
> +
> +static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
> +                                   struct drm_atomic_state *state)

s/drm_atomic_state/drm_atomic_commit/g

> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       pm_runtime_put(dsc->dev);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
