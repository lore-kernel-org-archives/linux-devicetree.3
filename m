Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633683;
	b=j9Otqt+4XZCO4smOrZfZcIN8NpKYP60RZIoaFOuhJ3qGaaEW6Ezt9XT3HZO6tGGRxomY
	 hXpm+qbUFOEHVyGp6/bz7ZySxGVGiKMx1J8+pv2kwIJG0dDcJ6wqRHbI/S0pjTIwA5bol
	 QmnEkIN68PbTSQ0akHG/D9BgAXyX0DGX8KRVohhc12DHuYg8Ug9Ne7PLlPWIgVZHzUD0Y
	 qXkW4ZZ2pneXBnMaN9ex4YjMwJ2xXm7GBCI9yEwO6beJdo7ze7iZ63S8izDP/JasJ4oni
	 zGXVzzDWtLvNIn5DdMLmjEsajaE3dL6eKse6M8a8swpJvNRk6AYaxtF80GsDW+nUA/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633683;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
	b=PvxmtdRvCBlpZn21Fj7Kdx4vCyl9L2xGkhvbpqya7X1QAxwBFD5866KgEOnveASf5+zN
	 OhVo2aNmXLEfPbPFMGUnqAtfp1ppWZPSDoNpTihVILZHlx6u5Y9ckH9t6AjBvH9NSVcXy
	 d2ZEsoBFn/P97puJo37J8PmePNH/MGUCdFFAfyuMkk4456uTRlbtU2TXsgE77TP0oYMuO
	 YHmDQY2wFY0dVrhT2okcWsLpWyjGYeqBiUzlCOscwAz1BRMI8mmeNsPJ7KXt3Zi2oaTHQ
	 wh5/zwSYlwSg8k09UIG2EsJiwZhpozW0Z4dB8uhr3xsmcHOh0tePpr7qHEYuVhWaJaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9060A0CA4
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB9060A0CA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4301e334ceso230445966b.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633681; x=1794238481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
        b=oQTPoxxXgvJ1uzQoRLnKbHqpAgNz1GHaha83g5/4/l9T1iuuKswFAPAG3nIifA0nfx
         ctgXOK6nAfjJqlBLjLoT5sVk2DARMGhIJr7Yr/GLDjIhqCsqQScHwqOpc/tMv52IY5kD
         qjd99AHY58Z/Lfw1MtbpzPz+4wxy5GS/q7H5yUGvlkdxUavUIs5XbdCoh+nG/rtSjlm4
         DYYodhYg/jBxl8p5B+J6MUzN0C4N4vY8agmmJDXWUsHQnJnRBTfmqOywhMTIwXNrb28O
         9Afm+20wAzvl20tnJu4f9NrNDH0YsQWNb7ipA2MWEOpxkJtYphCH/Wg7L9SuE4JigZTu
         iaDg==
X-Forwarded-Encrypted: i=1; AKwUvBxTIWaKuahgR7tA5Ezh3YutYzkKIte6XfBt1cS3+5zEkqFwZXHac+6mAeDnmeSSB6d7Y6s1uRFnZNNV@vger.kernel.org
X-Gm-Message-State: APuU4Z9WliHqaV7JzhxtZKQYjFwTO77wupdgX1P9M4JBeAvRw3ApnQ1V
	RTSj1XDxzqriotewnvyWqaQd6XVS2l5nQNIpJ14EwfVjKew4MHEE7c2dqYhiNSB1m2k=
X-Gm-Gg: AYBFou2JfjuSW74t9MpIZJq4bE1OW7Ub4uoE+XfnK3lv4rKzUCndlhDeUCLnyPcwfYd
	m/He/Dpdl8Kzm9gpvF6NnWM15EGOKmpDulYSADhH7JolOsKtHvX29h86o9BmzTD3rWZQo9+emTf
	Pnzzr1+dTs9iOwbRyj47aIc1VJd/ucyx6/P1qNJNbELtnaxtnYlEk8fGP3BbX5GwCZI21RDDB6N
	dxo3CVnlAZHW6wsdgvtOWucvrslAMmqiSvyvswJx/jHzpAUWiA0pifuJmMscYYIbUlZzbT2ARpE
	2kfp22cHYDaB1mIRdhyxgePenqUFu+bi5MV+EILh/orqnfnMn6MXebrQzwWoTYnlk7D0uZSuNFd
	hBfyWenyzplV5y9HUsLLqH4flrh5UneyLL/orld/lTDgWCbsMLTiB7COifBHIxDHjohve/EO872
	y60s0zpZeKTEbc1vr6C2tySwL5VFRgJXlsN/dZQXeD1fxFi0ZwaTPhWCa0xG6Sxxc9IWS8DYKvU
	QjoHu3/n0K4Hi3tKRxhKzhjJUJB3rzKFcBhv2whQyZlDdFp3o83QVLXQhm8hAwemeSMsL3wxZuh
	EZ3mGO31mL/MFHKMNxdgIk+vzt/aVrQM8d5+ey4syzp5Yjo0PwnAHpaBx4njI6h3SA==
X-Received: by 2002:a17:907:7fa5:b0:c40:eb1a:4c8b with SMTP id a640c23a62f3a-c4ca7a6d245mr802806566b.29.1793633681022;
        Mon, 02 Nov 2026 07:34:41 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebec0735sm2146566b.27.2026.11.02.07.34.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:34:38 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso4193097a12.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzlwMQ2LdqbdXAwMAg1V+SKVrEFV2gQ4JniofuPZ2hs1p6VT832MI6CKlPGmJCBhxhOVYTuJq5n0isM@vger.kernel.org
X-Received: by 2002:a05:6402:c4e2:20b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b4d468b065mr5425290a12.21.1793633677911; Mon, 02 Nov 2026
 07:34:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com> <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 16:34:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
X-Gm-Features: AclHuK-3oq7-ogrLm01J4yJ4YAWbiD82Sz0qQlli6C8IYRXs43BlMTULNtsTBro
Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: renesas: r9a08g046: Add I3C clocks and resets
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
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 12:36, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> Add the P5 fixed clock, the module clocks for the I3C Bus Interface
> (pclk, tclk), along with the corresponding module resets (presetn,
> tresetn) on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
