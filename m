Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE4C3A1CEC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456081; cv=none; b=QlHC56J9jYntRz+a72xU0fijzTb2rAj5tk8Cm+DCNI8WLiYpL8GC4Bx63vvk/XC9RtoeoLEZSsEGAHErjHQPuWuyZ+yuqwOlNXWQdLDLobNnRF2GOsddeDDsOUMZAqyrr2l9YaWOahGR87/9L7D+Y3qx579bsJ/y1PJGhEwkFwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456081; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzwFcswufe9Mzsd5pwkLGWSlpg3hB3DtTGudVBEuwAX/ZE4MSTkpZ8MZtqKW9RYbOy7/YOUUkPW4OtcK+zE2xMgG1KXIhh0WyZIpGR18EoMp533zx2WwQfc3x5uy6bO57WWQT/kR3TZaxe83aVGPBrnRbSSwldUaRY1Picl46X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd8f9889a8cso828473666b.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456078; x=1780060878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=tFJs3dDRPXABXQ7A5npMOa2qnybAcNAA+5j74EmoeIXYROWaoNNaELAxqQgz0eaBmj
         b6CL/y5WW856NtZLe5dqRhRzd88Zf71e5A60XG6Pu7lGDslEW2rnePzEovPNJsWwb7aH
         7oZ+SZ9T4c7vrk/cnZTfkUTdlstVgFG2NkH7SZ5p+qJf+oN1QoQhDLtmNVDUEbFZdEsB
         l8XnE5MbniqcohGzVBA1fXSX2nv4Ps8qtsH4pYn7S5a0WLSx3Z4Wb2qLvw5LC+eiKZPM
         nMTiYR4zGasXP80T/tfP9u2SwF11T3UXWKpQxRdNsgy+6vZh6CQaISSyyHxc9TMF2uXK
         EMWw==
X-Forwarded-Encrypted: i=1; AFNElJ+PvFtlMIAmmmTnBpfc+WxKtYxNWUF+fYTFucwfXpWffAWLQ5V2SLqARDNrMZndioDktI2uAlWz3JP1@vger.kernel.org
X-Gm-Message-State: AOJu0YzTDEWchQpEOPW1R0bzFwBKOIGCXrItVsGkZovRbmtVgvjMlsZY
	DBtpUF9WDK1nZPFKifiEtillpj5IV4XgqD+lSk/b02jzq4w+/SE/56lGHsT6n9sDbY0=
X-Gm-Gg: Acq92OE6VdKK7fRdJGGNv3T3foB5vhTnaMdMEvnepA8upR1/cQ1ElNQuHuzRNcuRrsS
	B5m4Zqf0YH84v/9ZHBzvMmw2h01nZB03f6dMtTj7laydlg5VSf44ztAeLBEBCnsFUnqaMW1KTox
	VAKudWZ+gI1Ysyx+adXLurGJGB9FppGZbgxG29ViH6Zj/yZkPxDWFW7TZF7PhNbCF+D4+rT+ojN
	KeUdUR+WjJ6hDuONXViNrFyhn52JTdYHrqwHAkD5fGnyWnufUzT68wDyBTCSXRiOVPJH6anm9c/
	9EfAwWCdqaxkb03Bo2nErzx3m8ub2JZ7ZQ0UGKFdtNQsb1jMPNelfcoKuSbbyPZP+Agew74BcFO
	lZvUGnwgqu4KUtyg6w6lcoldGo11N/p/fyO+4m/YMipTK6vK9JZtRO8vTd7xtY06vPMZNf6j/ED
	rdtrBuiMGso7ujOiWi1+pyYWiSZmpttrKGjr/xZoxO7DD75vsN1yd69H/CTn8k+0sg1J5pa2Q=
X-Received: by 2002:a17:907:928a:b0:bd2:fcd8:4cf9 with SMTP id a640c23a62f3a-bdd263c932fmr231652366b.41.1779456078327;
        Fri, 22 May 2026 06:21:18 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d770csm53471966b.49.2026.05.22.06.21.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:21:16 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67e43a8996fso9239676a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88azKj7yj1BrBVRR6vt67mZTs7B0ZyyeHk2DZxRDVSG3m/3nW+4jXzGiyzXDUCburiaJGjXqy1Hmus@vger.kernel.org
X-Received: by 2002:a05:6402:11d3:b0:66e:56a2:b67b with SMTP id
 4fb4d7f45d1cf-6889cc44111mr1956174a12.20.1779456076494; Fri, 22 May 2026
 06:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu22aJCHqrnAv=jk4=71Uz4YsJoAYWMOogANSKvSv=eA@mail.gmail.com>
X-Gm-Features: AVHnY4Lff0GBvrpmknTfKgnni8ny_chPw6wlBCXf2gW_qkc9A8w4cPoubzyZE64
Message-ID: <CAMuHMdVu22aJCHqrnAv=jk4=71Uz4YsJoAYWMOogANSKvSv=eA@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: eagle: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
