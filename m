Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553133;
	b=4laIC+EvIO99tIFcjI7cIx+RZaE9MKYVpqBpPM9FRnk+ZhZGbiDjNlplr/64Y3Tpz0cJ
	 USc1U/2FllawaIy6PTlX4h0VHOhb9+W7T9/y29wUpNjb4KnYjSJebU627XtVzt99EzGqe
	 HJM3dgIgDtYoPe+6zSjKIkm9O5nzU74KNtFvKhcOvbQQR+q0V/1oGaV1eJNTQKGxroNk2
	 LLZEiMJDJQIqyEHB/iNMcdL6iLHsoIRupaKRyn7jC80tyfhDPRXJL2R9vUQdZsCnQZ+3r
	 9bGTXMnila7iq5eQfJzbLUQ/Fv2hbsNpPP2iaX0rTGbN+xnxQAPpMo7wpgiDuelRaQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
	b=z5vsny50cU2kXuq9xcDYqH8jfPUVZe4yXKY91zkxasjejxXQ9Q2Q//T/cUjOgJaaEmgn
	 kUmmp8GFEN2n/9TNimxiMXbkqVrWDko21j15rABVUPUaVxWnbJXgrkczEM8kN5bmr0n86
	 07QWb2qp8eoTHCstvM0r62cRaqktu4c1VxCBoSMPltbSCjQR3a1c6DoYEZSOjw5iVuydS
	 LVQJbuFLtczJ9NoH0JfkuESZhKYxkaFP64KDw7VrZe1KSrOsDJJvw8KzktI1lXKwo4DP5
	 y5RxxLFpBuVpTjTQJa9UmVyzM+efKdlJho5rriKbb//Jtbgsdna4Xa5hZzFCN4z6Oow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fWkfI7g7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA1606A336
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BA1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fWkfI7g7
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b315dd057bso31755577b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553132; cv=none;
        d=google.com; s=arc-20260327;
        b=DHyoMOjXKh5vldLTalYvvt31K/DJxyyfFusgOjKkdBY9ums2OWrweLY7a3CyCyko5X
         mYU5q466j2Oz3VRkV5zUtbb0jcAFcl+Ox2cPI0HL0pSKwQTfo3eK7Vs1vVMgrYjS4h9a
         CENfFy66nNu3iAOZc8BXCL8KP1yaZf7GQZHAYQKKPTrfBy5pjwT8K7KbpO+D7aGUwlm0
         aOW0bhKVL+K/k0xW/3bTYeVjqxDhqXdp7h1NHpPT+Hrri0np0ydX8XMhMJhnklaPOEAb
         vq+sSFRqQTilSny0yQ3l7IjdDbYKXbaxM/ZaTImxN7HPwhjEXJAUQjo+kBgzKg351XOJ
         CU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        fh=8PCFQnTnO3qF6FrGl+WncVFfNGX0eTQpt9hW4uG3du8=;
        b=kLePWzIfNZRMtKoXC0BD/SkkPY/nsdXHhveV98z2wLqqEr/1d4u9ldHAFC0m9sPQyr
         B8MtFNaiw03COcIGTvczPNzJWudffq6ibFyvj6o/64T83TbZr/jNxcS9olQhLxyZr+w4
         IG3o14a7nTSIH+OSsRJfTbo1YkHQKRvSduZqDCrT7byfUtRVZPZHuy5kAaHjkr9PmH8O
         iSJIJZUO92t2ffcuJcEf6Lk6DKU8GDkpHnRaWdQABWUMswEAnkpkRZnpuZ+KD9j+/7yQ
         lLHfNFXO29CuTHBfxupp/LXZTIh7pmOdDyfKMfWkmPOwPl5NIn3wnsf78r1pLiLZT4f7
         1kIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553132; x=1796157932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=fWkfI7g7PrLQ7bt+0UAil+Zy7J/2gPJX50pDHayXK+EpqLlR20gEcua4dazCanX3T5
         E53HaM4usZB+CE/EUBt9WWedRTs2GcLHHZMNdI9HL+DQWjWIvORceM10ZdjtTOKgBdL6
         aJMzVftA/pPwii3PvCGJApDKR1SH7WIDniYyN/fnUEkj9dyewvH9yCmNioPAwUhpdzIh
         hPaq2LbyV86n5UydtCwC0x2FWZIn2eZHLO4E1bGxrFsWWM8scZG0+Hh28SugR8pD9uh4
         98xRtzbCiLQjlnMY7czZmvRaYZUmtvYPyalncM69vRhfNSfPjPAVyEUYLYPyxyOx3xpZ
         PRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553132; x=1796157932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=e8j7jHCnWFThWHKXgcN+V0rV+fX6OKJ952tYwNXEkwGsuua1gU/RS8ALCO18r6IyGZ
         qfPdB0tb7mQun7NPnLAa4dPk+zAUsjR9WcfrhuxQ6lwLE6VHWZwOjzxqkQ8khrEv1EbA
         W1OQQCdE4rk9iS+zas2T4OCOhYZUcWH90l3c0Mmo+OfCEDA2tnwzl3SN6WeuMaSAgfSf
         OnMBmFg/otgmlnoOK15OjI3qDjDIu7J3FnU7JaB+kQyDdXWsk72qHzyzYDz7UCa1kBnE
         Ms83Xjbxlua0v9XRvvp1cwlA09tXNUVXA26pn5Axzbxc/pWn9UF5mpBeWIVx8QWuLgdr
         AL5g==
X-Forwarded-Encrypted: i=1; AL+hErH0I94tA9ATIlCtAtJmwwVD+E+XtUKH8NHkz1Sw2YKhw74G05NujrBoavaNoYG2Zu859Tyws1SwwBnN@vger.kernel.org
X-Gm-Message-State: APuU4Z9gWu1U/9f11OpLTrrMxkXqx+vrX18lsPulXY2I7B7AcZD/5jEk
	iaGIvPlBNR+J0EJ8XndkguaEwx7RFNK0/V03yviGZ5ovrLT901WjjwMB4kFAWXrwlS8SUeAgT4H
	oB3hbtR1Nqx21z3ltF/xU0VgMasCmECE=
X-Gm-Gg: AZFdTZf7VKgyE6t4sLREx7jKrSU3P5k7EY/HbPUVWW564SFSzh3zULupr3K+4AcowXk
	6epA2ZoUU0jb+zMrPLt1KlIu8M74qMK3M9Lq0PEKAGFd4+27xIi1G/GHRUDeLADj3iUAFlTrXZ2
	/cVpaq0k3rtyfCtFp9yIXMXvXMpkzYkH/35OLuctAfWkuUBLw63NDlfOV+TymXuqDlehJpCFYYw
	STA5iZQ7wVFT0fd/syGm8Dr17US62kVHvckZ9Rmc8q9r2xh3ahhr5Bl00z0rSh/OqS2GUi+bGZI
	13hbTe3DKNR6F7aLpYJ5HTDr+o+GGiEsljV3xNIRCkuxhlbZmiKlEYUFykzDP8oQv2uf1TFeJLm
	yi4wavoHcGKQQEjPJMBKILfAar8pLbT5Ye5BLCVeVwuePBK06voY4Jbuq+NT3C4BM6iebyjzKkf
	XveqGTYTOapsRYw9aK
X-Received: by 2002:a05:690c:799:b0:8b4:d584:6165 with SMTP id
 00721157ae682-8b52043ff55mr69264227b3.21.1795553131511; Tue, 24 Nov 2026
 12:45:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-2-tanure@linux.com>
In-Reply-To: <20261121213102.143130-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:45:20 +0100
X-Gm-Features: Aa3M54pybnp1CQPsafQYDf0P2DptibC917JzUwMw-x18aat2wfvVMhiMsv1rR3s
Message-ID: <CAFBinCDPGYpR6rmtJvN5pT1OdSN-ne=YJVeT0kk4Ff2SB2vraA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the
 T7 compatible
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The T7 has the same management bus multiplexer as the G12A, in front
> of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
> But a device tree that names only the G12A string leaves no way to
> tell the two apart later: if a difference between the two blocks
> turns up, every T7 board would have to change its compatible to get
> the fix.
>
> Give the T7 a compatible of its own with the G12A one as fallback, so
> the existing driver keeps binding and a T7-specific match can be added
> without touching the boards.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
