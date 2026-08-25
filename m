Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C648382F
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668690; cv=none; b=RwMzXqc0icMcOQ1HJ7TW2ejYs0HysWxVyECcqJBXzlWwXkdGMrD8EOa8902ccxxde4gZRce/AO1jwNBVy3Is5A3zVuKC1DdhWE0r+Rbv0rtmwAKGSRsay5zkTNRW+4EJDfuACzjbWvEYhX5Vp/nsSIzVdlYO77xgIhi/JqVjuP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668690; c=relaxed/simple;
	bh=eQ34DPym1g3yHftFYjOe7131ncl6EEw6TRurmNjX1u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMwJjZltMG4eYiYkYP+WMwUg6JEi75jFh3ZES/vn5CSCWvlV5Hkx5Nv+I7gOv9y7RaI3NqUVayMZYxmUYwyHNpruudbmzyF5qkAGCriRm13xgTX/e+Fg4t3O5qWCZ2yiEW4QQvlSHEsmSKopyuhh+BGMfTGxHaQ3kzp7/oQLCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97c367c9f12so1006179241.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668686; x=1788273486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyAeQiEiW4UAm/NK4AK+DyXXQ3APXDKQszoA62dY7gk=;
        b=om8MTXSEvR1gix32GGOY3NGkxfn7U03tWX76WTXaGcyuJMDlQ+6AxI20Gt4UVUn93J
         oFsZkSp4JvY3Q9L4VM6RMZz+JtVAavyystwv8E2V1PhcC/d7qO4dLD6fCdPvBiI4qY/V
         oQfhRRRSPst6CSvkZLmBU7TjUZnB7K1NpfnM9dnCwYIvNQWyuQWv6Nc7cGYygTEGI5OO
         x3z21grI60a5ypsKzi/Tly96qREjKF1LtucmluoTWQ7Y6w7OF/NnK2YtlMvOfGX7+q/t
         GbASoOImi9C5IBMoBDkEwN4kPfpdqWuqNaEIilgWk0fBQkUpYIgDgUKwsaCaRHtMNJnO
         oJtg==
X-Forwarded-Encrypted: i=1; AHgh+RrCWNbgpi8m5ZlxV7SLgxLwW5lLIQgIM5h03ikkhUt21OHiVlc93W9Fj1uN81pPMiMsnZgpAn7TqSJ1@vger.kernel.org
X-Gm-Message-State: AFuF++kPL6ZEoFxqGSX+E/GFSai6emu7P3SkMFKUHW8Au2uI26+91H8Y
	pkhNIgjv9ilTVx/NknTEyMIlMFrpLUo+nsFf64Q354u7jUKnqqHzPZ5fpUNDrWkFs7Y=
X-Gm-Gg: AR+sD112iD1eAb3l+WUid3pI7kcND56ip3eyJPhs4QgDBLicO3Rka19S4VP8j0WVzKX
	yA3UOwlOBLpwNn1fzmEaDEziU4DEazKeW+Es9IcaVsZIT39r7DiKl6QjGhL/7kdbkCZv67+mKiI
	nChLY7w8mQeDm+MafKYzbvIrkqZyCc2rv3tztyLtOvqUCzvpRD7AW2AvOG4jZWhrZJXC8QhSeFb
	0A9ZHuUcWTXLrARwOZpBe6hC/F1yGcPoX+cTYDumiEZwfT79KmbGKt+SrizOgu2BjezpZpKSxe1
	3yYdzo0TOxJCVWf/xp3gGTnHMV5KlXlzIX5QE4hF6lNTMX4sSGziX5HI/hz6Gt5qxYVacPwBghJ
	EkJhW+qUGTuCrAJxckaVvLVoMS6qnfmWjUyQrvFQU6B2QckC2TEv70Hd4eVuQhTxNYf9sf/jGUN
	23usuJJQ5X50hDI6ExThj0cFf/01OGfQCXCkT+ti//Oq1r8wDM0Zsc+BEZdJoeRyTVSWvZQBBSF
	h68+mWsUVMn8y8pccF7do5/fw==
X-Received: by 2002:a05:6102:2912:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-77a6434e104mr10262378137.9.1787668685757;
        Tue, 25 Aug 2026 07:38:05 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d856d8fabsm5732504137.9.2026.08.25.07.38.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:38:04 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-777ae5e5caeso1527571137.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpwc5mAeEDndMDiFCyVfjLINUx+TS9fUNGUkPYhzJ1jq6erFEUI0um6i3acb9EyX1qHR8wVO9qklxiI@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr10559459137.6.1787668683910; Tue, 25 Aug 2026
 07:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZUZgtpnEEHEP+nHJHXLQOWJbk3Pf4fzyviMB0q3wuag@mail.gmail.com>
X-Gm-Features: AcwNN1VJh8QhgMVTLLPaW32CuNebN4Cwri3VhB7TN8P_9_MXNNGof6glaJNaOtY
Message-ID: <CAMuHMdUZUZgtpnEEHEP+nHJHXLQOWJbk3Pf4fzyviMB0q3wuag@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] can: rcar_canfd: Do not set registers selecting
 the CAN mode
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The bits 30 (classical CAN-only mode) and 28 (FD-only enable) of the
> Channel n CAN-FD Configuration Register of the Renesas RZ/G3S SoC are not
> available. The IP supports only CAN-FD mode. RZ/G3S HW manual (revision
> 1.30) specify the bits are read as zero and the write value should always
> be zero.
>
> Add the mode_select_na flag in struct rcar_canfd_hw_info to cover RZ/G3S
> and avoid writing to unavailable bits.
>
> The existing struct rcar_canfd_hw_info instances were updated to address
> the request in the Link discussion.
>
> Commit prepares for the addition of the Renesas RZ/G3S SoC.
>
> Link: https://lore.kernel.org/all/1d9719e3-10ff-4cd8-b729-55fea93c37ce@wanadoo.fr
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -445,6 +445,7 @@ struct rcar_canfd_hw_info {
>         unsigned shared_can_regs:1;     /* Has shared classical can registers */
>         unsigned external_clk:1;        /* Has external clock */
>         unsigned fcan_pclk:1;           /* Has fcan sourced from pclk. */
> +       unsigned mode_select_na:1;      /* Has no bits for selecting the mode. */

As negative flags are harder to read, perhaps "fixed_canfd"?

>  };
>
>  /* Channel priv data */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
