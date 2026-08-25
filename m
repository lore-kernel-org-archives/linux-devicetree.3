Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B594485CDE
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670189; cv=none; b=qWR+rBjF1trxxn8rq39jfCETPsyE0OCU6+WC1NQAJliXKIAnmnR/ebUtHSK/1/ovbqr0nzLaxWZSs5829Nb/9ONmsvd1cCL2KcCqENsUQlxC0EG+Qq0I1/SO0g8EXz4WZxAclH23aQISl3aLFXI0Xfv3YyH5OPPOuOfsdZR9W+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670189; c=relaxed/simple;
	bh=Loh7CxMJyj/c0rgZ7iXlS8miTtj/q5VnJdY302NtqGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftW3IwlWb60eQAxH0bbHxfKN7DHDWO2MI4rvjYsMhzFgXrJL4Jiz6cOCwE/QCNYO+ZWB3dNoj3C8oH/HJbQ75tUfo9vM/1FQytDZHlftdxsy2WFy6fRN9nksOC3l4X3MATophc0TLseSXulEYXYJbf/oniMgjHj8cZAjCwYZZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso8490275a12.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670184; x=1788274984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8UDG6348hQ5hCNqa39+P1Xgwy7V8Kyi97ymwy69cGkw=;
        b=WmJVFtjMcfMLr6qNPVuTFjB70NEAJ9eb/YauB6SSPhNX7N+Wy+vaxxDVVOHnvwe9nR
         0qkCbz1CSmQCphfwdh+D+Cz52WGVHMQ14NM7y78Sey0U3e3oKBcQ8iajmwG7jnouPq92
         WgLBx0tb5vG/VsKTQGsFNR+G4QZMNaw15P1FnDyqEhFWAU3uBROc1J66dm33ijgKdLQW
         3ntP2IPsKIgIaj9ZjvO8a7ihSt8EUun4Ig4F9WkRa4cwGn+VTnXvouq3VIGTaThqDcFF
         KFOGcze3NPSS5Itns1DmCX8YLo/HcGvuXSziclYO03LP/fK7RMzbRdPfaOr9UDXJ/P0U
         PlEg==
X-Forwarded-Encrypted: i=1; AHgh+RoWtJnWmZ5rKYRtxHsTMx3iNJZNziClLeO+AchQu7u/D2NQjNMkcswwi27azC9NnS/rXB0vHNOZORJE@vger.kernel.org
X-Gm-Message-State: AFuF++lMMt2U9+B1hIyQyquNvANiAv2pkL60g3LH5iYHg6l7qDp7+Dvj
	VIX3mu1qgfK44bkOnQD1EmodRrGWBBDM/a9uf83rpyzNScD7F+6MsWP6Ahf3SBn3WIY=
X-Gm-Gg: AR+sD11KrWnIhdHU7iambE1ivePpJhbZev4KccJd9IGkACH3Z3Z9RiwPKdvWQcuMrm3
	IXMoKy1AhppMHyvM1TyxAqOKX6cyflplcdwJEYW78QMHSjKCgBk0nImrkJT7SWr2lZK/kbUgyAG
	5LmeQMzFrgVEXu/lpxRUDSVq5e2De7KA8GIitYoF4h0ah/Si6CvQwLyWFpEAulrMsnc0TvDBpDs
	OYQqOK8UnFhyxlvVg7MtXNA9ZkmxwtFkJWZnnArx0Zps94uscXeFMWo/vpHVDv7zIyWGTxgPPJr
	/FcBaOAkJBm6zXlwl3VNRO7hN8Tl1cvPsck14b078UbDgDyUnsfSciTtYijDFpaHh5FNNsp+zWw
	oUQGy5ojcgIToB5PFHlt+mgr+ZP5TFh3OyFJWts4OuWWONrNJVLDWcu9BA6XMTVfcKHKxzGNoZe
	dhRW4GGOh7q5K8mWyAA/TzEkBSear6K8khLLPg4HVynfGtn2IuO5a8GcVDselIpHnFzLvxmXa7r
	nQYyOGGNpKdguj3MTFItXicCQ==
X-Received: by 2002:a17:907:3d52:b0:c25:544:3aec with SMTP id a640c23a62f3a-c25054440b9mr273332166b.5.1787670184457;
        Tue, 25 Aug 2026 08:03:04 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297189sm1763218966b.22.2026.08.25.08.03.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:03:01 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so7459538a12.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:03:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3GjkUWYQK/KqixcdsL8CF8jYJ1BJVxLJuard1k3fNyznMCJOWWA54SvDQ4qGWjHb67EHghjtffNSL@vger.kernel.org
X-Received: by 2002:a05:6402:2490:b0:6a1:f93c:f0a6 with SMTP id
 4fb4d7f45d1cf-6a5c4157aa7mr9125375a12.12.1787670181340; Tue, 25 Aug 2026
 08:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-9-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-9-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 17:02:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYyGci_NNG8u+erL+vGeL+8vUXBsZ+1gcaBq-QYFWV2g@mail.gmail.com>
X-Gm-Features: AcwNN1XuzkfLnm_UPDcmDBLz-Zu37ChvVAcOyLsURutDp-p8VMVRi7QPa69l3QY
Message-ID: <CAMuHMdWYyGci_NNG8u+erL+vGeL+8vUXBsZ+1gcaBq-QYFWV2g@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD
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

On Tue, 14 Jul 2026 at 19:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The two CAN FD channels available on the Renesas RZ/G3S SoC are routed
> through the Renesas SMARC Carrier II board when used with the Renesas
> RZ/G3S SMARC Module.
>
> The CAN transceiver on the Carrier II board has its standby pins connected
> to GPIOs that are selected through the SW_GPIO_CAN_PMOD switches. By
> default, these switches route the GPIOs to the PMOD interfaces.
>
> Enable the CAN FD controller and its two available channels.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -68,6 +68,24 @@ codec_dai: simple-audio-card,codec {
>                 };
>         };
>
> +       can_transceiver0: can-phy0 {
> +               compatible = "ti,tcan1042";
> +               #phy-cells = <0>;
> +               max-bitrate = <8000000>;
> +#if SW_GPIO_CAN_PMOD1 == SW_OFF
> +               standby-gpios = <&pinctrl RZG2L_GPIO(13, 0) GPIO_ACTIVE_HIGH>;
> +#endif
> +       };
> +
> +       can_transceiver1: can-phy1 {
> +               compatible = "ti,tcan1042";
> +               #phy-cells = <0>;
> +               max-bitrate = <8000000>;
> +#if SW_GPIO_CAN_PMOD2 == SW_OFF
> +               standby-gpios = <&pinctrl RZG2L_GPIO(13, 1) GPIO_ACTIVE_HIGH>;
> +#endif
> +       };

Actually this is a single dual-channel TI TCAN1046V, which is modelled
here as two TCAN1042 instances.

Recently, we got real support for TCAN1046V, so this should probably be\
rewritten, cfr. "[PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc:
Update CAN transceivers"[1] (which I wrote a while ago, but never
submitted before)

> +
>         vcc_sdhi1: regulator-vcc-sdhi1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "SDHI1 Vcc";

[1] https://lore.kernel.org/2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
