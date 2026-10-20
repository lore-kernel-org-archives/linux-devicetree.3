Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488447;
	b=N3PAZXwXOm1N75FWp6ZkGxuOkegFuSQgXIU1ZCSWSmaAkp69IIWyNDEqboRWpovOMEKN
	 zMW+m7J4dkWtL+rEFrTcb9GPx9vH//6fSR3xu9T+Yg4tKes8xWBkyqrkBEDr2YU3ku66p
	 UVCY3C7H6zJGkSonIExN0NGIjxdRsxObHFUteqDg4lxntE5jmRLj7ZnU2RWkEjUv1axDb
	 yaHVoOysTv96cLI5e3qcbUWQNTMslz/IRKF+AxzuAQhEV8kehDNZCnCtyV9yeoDq32BtG
	 +xgYJOwbThRioX0dlVWTnUXjwG0oqqIzf20fzDKUQbR+e5kZQ3vD4BX0Iz87PjEYsww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488447;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
	b=wqE9xwmQYHhTXP4WqXEhiLJjzLnI9R0euawJ2sGDMpzzORPZ5Y61gWjEtk5klIkV1w2o
	 +NpijXZj+RNww/cJvw2teY2jctav1ZGgp4V+s4l31K8Hj4SHCgY41Q1/bFv1xlzVxcc9Z
	 kpnx6WbRLNEffPxsotRHVBbePKN+TrfXAWwVt+CJgEe3o2KjOuutlaAyvFUcK9d1kOI8D
	 G+ARXLXJFQP1m9f+rAQw91a3W6DWlR3gv/5bhCB7epmluFPdEfxmmFnHfMKgGF+etHXUX
	 iXHds0e473IbuBwsyUha2vDADuYIIiIuudTK7hFzgE6i39QUvou6Zgtf3jkWu5RMrMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C32606A32E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C32606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1046656e0c.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488446; x=1793093246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
        b=Y7aPZl2TNByl8RXu9A5yKNl1X1Q9iJ2ZxdLZM0P9dUIHxHU/JUSGne2hn71SVBmxdx
         xaU0uSdN1TsVFIkTVS66IDBrno2JeRvkbojOQIle9yF2QyHjLF2hPUTWyBL5UlDNkXmE
         6F8IEBtdL5rH7GRNbqcpKQfY/Cx+O+7UG1PGDHnLYxDXcRHx38qUkONgvLye4EohfRGC
         88CS4DEuS9994ungj/39Ps5IuT7MMvzxps1w4sQYI5V7tuXLgQh7GGjW2QowM5+9XkFw
         gZzsjrH1kbd1s0X4qmmRgeQa6nXPyLeW/QAQ7+psCQGaH+ejfITVmd83JdkILkAtijEP
         DLrw==
X-Forwarded-Encrypted: i=1; AKwUvBxUkDFVj2cfFvEAtB+f5EUJA6FuNOAN/O7g3onqUSamid37wOTMRyC+fvlmAj6UpsX/mcaf7d9Gsm85@vger.kernel.org
X-Gm-Message-State: AFq9FYIM6quTvJG2lkc8iPQp4oaYS9KB8mdLTCRBRMzNETPZGYKpCcKQ
	JFlrzuNpKjoHGLquTx4kxWWvXM1L84ZfO0MQRrZqLkIg8HbpqWLqFk1LHu/2c/0BAzM=
X-Gm-Gg: AYBFou3+zNSUxyatAbqhVqc1F2wf7cZ2IfV2xTRrxATCmmjpcQEVGOsByFiEZqDxxk7
	L5Xu/zSiThGVsU3NfZ85A7t7jNjJtIagRiQ+TL0mXHK/TKBpInbEyupa4sDreWQSVY4Eb/frgr9
	ZEQMJ1IK7+oosAdsdfosKsaH7/ECsQBbbPQ21DWwpm0tQMEooxNToCd2r6RfFb7HpWA4rSNqxOx
	YEfkrv7aPeNGW/JYUkjs7+TzUtO2ac9yM6u6mDeIScORapyzpGOT01xcxoj1idoq+oTTAKAXcVJ
	8zw50CA8vsQnU4gsnO+TkW1ZVFimMju+lRKGZdE04rSvUxeZU31KM6vyCOT00BWUpiOS+AOCKND
	G1H5pohjc3OQBoj0EJpA7jHs4+pIIIby5tmrImwNsPxNyb4039yYurIfofmqvIwp2kaZ7IL1VP+
	QnFjR9z37Mmt+1Xey5uzkp+inrBtlCLzLHj4ekxvr1PO3NsWyR1oVpPC6PPFkuf57R0xZ7w5Xzw
	a2Vqi29w4LIwE6BJZt8NZIS+Sy03KnWhbS6gf7R
X-Received: by 2002:a05:6122:6d10:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5eaaa941aebmr2992753e0c.20.1792488445840;
        Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b518bc8sm11996053e0c.11.2026.10.20.02.27.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1046638e0c.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXryWiDGxXiy6cMaQ6+7ob90UFk3dnLTx0gSLgEwbGpcWLfueVgko1kdI4fEDsBBVZaJQaWbeXgvmP@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7cc3691cf50mr3455060137.8.1792488445010; Tue, 20 Oct 2026
 02:27:25 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com> <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 11:27:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
X-Gm-Features: AclHuK-aAi-Edh8uIEyKFfeZ8ZpBiAefIme6DU1Cm8luHP5VW0oo3t3lyPOBTwA
Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
Subject: Re: [PATCH 1/8] i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Tue, 20 Oct 2026 at 11:15, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
>
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Thanks for your patch!

> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,18 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>         if (!i3c->rate)
>                 return -EINVAL;
>
> -       i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +       /*
> +        * A pure I3C bus has no I2C devices, so the I3C core leaves
> +        * scl_rate.i2c at zero if not explicitly defined in DT. The
> +        * open-drain SCL fields of STDBR, which are used for the DAA
> +        * pending read, are derived from it though, so fall back to
> +        * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +        */
> +       if (!bus->scl_rate.i2c)
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);
> +       else
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +
>         i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);

This looks like a good opportunity to use the shortened tertiary ?:-operator:

    bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE

>
>         i2c_parse_fw_timings(&m->dev, &t, true);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
