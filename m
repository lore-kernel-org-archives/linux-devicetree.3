Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74D2FD1DA
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372719; cv=none; b=lTpKucXKOcb5hewQ1KBCz5SFkA0V9Z+y05nZq6l1rnmH0fhtt6fiNk/rgPzVuIX9dujX+dyL3qIh7pLTVPtzIf32EfkUzpE63AB4m3sXPTueQddLKAiejvvn/XA9QTQX1MGnr9saaGpMBgx8a8bnuksesi1CtQ/Ltv3UW4OGwLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372719; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTVWUcneoTkDoY9p+V8Mwi2LkrDrXB/kuKOMhqyuLZ6xuv1fEjL+3GD9P/T1O8iSKmgFQi+U3mq8913+06JNPcwaaS8zOyLO3Ym81d6EWriABQ2ucr3kZWUpwZPT/N/BTsg4FYmpVGn91Me/HK3YT/yctR7oF+B0i9TnPy32di4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so469184137.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372717; x=1786977517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=SrMpWzxezwvXn0tCoJnvr8s4/qbZPJ1Zma0l6JDITYkfEsPx+koMetfTS7UzwUEN6r
         Mp5knPzdG+XHwguCslpN6kKn9EkXaku0spCYShhDfNRAVkl/Zulv82RZf3SAPAozi134
         hNXXxlWAfumNDRtZGGAmXvnI2dbOXPmq5WtoVOIIyEp+VMZE5S8jIR5Q3MDE1gD2Iln8
         TpWWT9lzG2VptXoAzFWGegriI9IQZhh1j4MztF13O3qWb8aSziZ3cWsn+zy29kRtODsa
         xn4CmA7ZvP/GipaQnx5KX5EtgYeweh1KYW3GBxETStGkWuIoJUm/gheE6whzJb0EWnIz
         DgAw==
X-Forwarded-Encrypted: i=1; AHgh+Rpm+9fvadyvSm03qaFRvxcXUK7wOxo65RArHQkaLQ61Ic1slrU4T9YXPWVzevS7p2WgC81atuYOg7W5@vger.kernel.org
X-Gm-Message-State: AOJu0YzoSbTV3tts5jKQ6jYPzw7/SZksC/VJ3zjNIO3eragqE+TlajOm
	L7Ki+WQCUm9E3F+YjmDT01gVXLR4Zbiof8H0Sb6UqnkHITI3k28uWPByXqb/fR5Y
X-Gm-Gg: AR+sD11XLBL9etf4BxJLgEbvn62oOVviE5BdVwitUB3z8qsfFuDllUhDY+4ds6spRvc
	T4l8rjYHcUE5Tkoxo7dPCG0YDjQDGDtlySFKNk25/VToQ7B8BR+duGqAGZyKYzb1AfX/ruwx4Cj
	8hZ1CtdgStzG90eTZkZvpZ6a/3nhnz10zf0e69RRn2mOVIRL+dREWN825LkxByvgcF91yAJnfer
	m69fqhy8n/CTcdZ2xkb73Oeq4hbfx0lLgKyxs2eSNPI16qYkiqxZL/lT1l5YErzWUz4e1p6qyZO
	Ly5gShsFx3V7XrxOOG8E2+vIXx9nFghBjir7bpvNF6nc2xjEJRv020z4vFtcF5slrbRgRUpx0Gr
	lDmBy79MXc8rOude7LztzPyJbgRbdvvdut1uf148MxZ/k+YekcLmtKcwAAUBc7ExZTwS26LYsO1
	X5lKLRMXZRNO1nPPisvgEPDlpqC/OAOv4CYKXAL7Q1Na9KsemijhSoYJ0JHTvI9d9GJvhgUkbTw
	q7wianESitQFTMkPzw7eftlCA==
X-Received: by 2002:a05:6102:5128:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-7642d985788mr5300880137.4.1786372717001;
        Mon, 10 Aug 2026 07:38:37 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b212fa6sm4209154e0c.16.2026.08.10.07.38.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:38:36 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-963f63fe025so238049241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:38:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqpuvV6Eewc2evwFQF6opajNlsVTvfyVYOZlByEzZC0sr4yudFDiVKlOid6NjtkLdz9R7uwuClddTaU@vger.kernel.org
X-Received: by 2002:a05:6102:f82:b0:745:7f23:a876 with SMTP id
 ada2fe7eead31-7642d16f34emr5609033137.1.1786372716525; Mon, 10 Aug 2026
 07:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:38:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4V4tUe42jjNe_PZN=3cPuNfY-f48SfaM30DCHG6T3cg@mail.gmail.com>
X-Gm-Features: AUfX_mzMBIGgMQPjwxj1aRVEbLrB1qEDZGXr2C-cIphISdXHCveNYmgvbEJ2aX8
Message-ID: <CAMuHMdX4V4tUe42jjNe_PZN=3cPuNfY-f48SfaM30DCHG6T3cg@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm: dts: renesas: silk: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
