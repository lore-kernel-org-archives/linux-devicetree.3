Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723949;
	b=uarxfJuoidNlwdkX7zPJ1XeZoSQu8WnwxhaVn+//mgI8BbTT8/8r3iyaQgPA/dFXWdPL
	 r+kr3eM/rN6/rWMrzkYIZzdaf4KP/f7SS2g6BK3ODW8NHMX4lSBYoxlANWo7wz/33EUzp
	 M7yXhXN8piIkwy3OxkkY9mUecw48BQYuLnby+ewkBuguYMmRJNjtgh4CJHkl1rqFxmXiW
	 zptEM2skze/TGSWA4YNooCFALwXLUhDkPgSnUOAV1OS8Nuhbv9GawexsszHTk2nNKq6y/
	 MAWNzd27ddOJgPveiu/cVKCk/UUWU3Y7ugaNACczPMm91+/aOlKty3lBgwXj26zuYdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723949;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=;
	b=eyMh3O4PPKgPq8pEMNfR1g+G2ou/J/RaLdZwHRF/awhAooZbkE4yqWABvLb7FIfrBbcz
	 G1aLCZwNmZ89l+lB6o5benmCMdyAYVdZLkLf33yBeTW4MLCkwb50aGn9IzRoHG65oRZfP
	 bnp8SLobJUJwWI/48tiSAGY6/DyNGHiRQyu6rZ9RH8XYT3PiUzjZFGkimUp7roffap8et
	 LSDNCouUbBK6HV6Ho4I5/fXoCsepGMhvB2MKZNldt6qU9l+lXqBmZ4ZBdu+GviWC/2A2Z
	 zos1HfcNsAFLkuSBH1Utf7R6EQafDcoE9cP3H20bCkwbcMpDxueUfUkh1i5Dnn6D6lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BE606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455BE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b07db03f41so644635a91.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723949; x=1794328749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=;
        b=ljOk41P945kYuATYrwQaZph7//NoVvWM5oZguxizpKWZqVj5gMbLwJ69tMBvuvKX7c
         LRKQ7ISULGPx5jBdVdJdU9oZ6S/A6neSLT4PHfu7NRMmVEhIp/0L9hS3knZc/PHwXNSW
         2Vz2yqT5GAOa0pd28GLZrZ7fInV7exaZ4MYtvq0ExlenlfTyyYO1HOIfTxwxNjGxKpOt
         aoqqgc9RTIEES2mXvwzj9zdMxjeH0rVLq+wbpYXNS74auWm7c59J+YfftIlmzLhqmWSI
         Ax0LTKvM4oSX7AOudBPm1nNx7uYFVUJMaJ3CDQq8tCHrtof1D2JI2N3bz1FdTpJVaMOt
         rTEg==
X-Forwarded-Encrypted: i=1; AKwUvBwlLBPpS2QQs74gbptcLs9NhlVcCaLYZADYDbCMv1Kr1vioR65fvld/KgrwMlMraVC0SZN2ey4MS28f@vger.kernel.org
X-Gm-Message-State: APuU4Z8L/pXPFN9DovqLsSn93UpdbDJETLfhVKOwqUwxhSXJTJhWnu7Q
	r22FaH2xA044H9yZbQ/BZso2wIBUN0cygpkzOZm4kTrD5JPf4TIRUjEufjbmLHRXimZVQg==
X-Gm-Gg: AYBFou0ASbB2lco1J+TXBgQVZTiQBxV/A4jdgUgeVMCaBAGkvaqG0ntIyCv0vjqcIY5
	M+cvFPqjU/04RZHdzDxu20ENjDoIwmlmAou1PCpvApAPk2omAVtN1ttOpXHCASfUL3F049vdhAp
	ceK0CBzSk4C2Gv9R4geHwgJ/Tn+I883rZdzMGw/O5EP7+b0NoxpX1tc/u5Yc1t6TFOv66lL9nOk
	IVcyn4eSKRP7xIwkximFsiCNWqD+rMavMAuGAwXtl7Y532kJstQvCjIuIBi7cRqy97WJWUzUuql
	UDBnn2EVJyYAe3rHdToHn+CQFglqUdVNH7bL0eltH+ZzIo0wwVN/1Ke/lnx27rjKF2m35qE2lqk
	asl4ZslkamZ6/i7loJLQ/sf0nPAl7NbjWpZfvHTU5G4rXkHW+UyejUu/LnEtW7cgI+98g7BhZsZ
	1BF3yzFE/wyqQLhuqiIrT3OZI3BNHce6plF1ankkSWByJQTABUjhTBKvXjNzonTMDncHc733ZAO
	VKlD++UPlvYS9OtxfriL3cLUHWIEHrZ6B5wD4AaV7xNW+LWiMIcYw7NIa7O+uF2cui8rHYXiUxJ
	NxT7iV3L89CLXCtfes+V2b5osSrUHE6u4gySC775gHnOY/KRNAIIVxJlkfrZa8pc5InatcVltYm
	S7B+K+ZlnvL5xNXk7D53ZTnKgfbQK6wa4TudGWvztYoto4oAgjevFeF4=
X-Received: by 2002:a17:90a:f307:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3ae99443c7bmr7161636a91.34.1793723948652;
        Tue, 03 Nov 2026 08:39:08 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46440cc7sm12279a12.3.2026.11.03.08.39.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:39:08 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a1947498bso4715445eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:39:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy4+JWGieagdWhjdnefIsLMG0/UbbSGknyhWd7WNFAxWUHIKtVRnHTaLhknz8lN+od3lk9bD4VY1abd@vger.kernel.org
X-Received: by 2002:a05:690c:6b12:b0:8b1:2b64:6fbd with SMTP id
 00721157ae682-8b2b68290bbmr97956117b3.65.1793723494365; Tue, 03 Nov 2026
 08:31:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
 <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
In-Reply-To: <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:23 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
X-Gm-Features: AclHuK8EDS_pThzfN9kbbX2pgEiup5lgKQS3IQZ5CGTtBeqTGSuccPA6dHYQQPQ
Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/*
> > + * Delay handling of the SoCs up to the G12A. It reads phy-mode as the
> > + * list of delays this glue has to add, falls back to a 2ns TX delay a=
nd
> > + * takes the vendor delay properties, all of which ethernet-controller=
.yaml
> > + * rules out. The boards in the tree depend on it, so it stays, but a =
new
> > + * SoC must not use it.
> > + */
> >  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
> >  {
> >       u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> > +     struct device_node *np =3D dwmac->dev->of_node;
> > +     u32 tx_delay_ns, rx_delay_ps =3D 0;
> >       int ret;
>
> Does this code need to change?
>
> It would be better if you did not need to change the old code, so you
> don't need to worry about breaking other SoCs. Just don't call it for
> the T7, use you new function in its place.

OK. In v5 the old code is untouched: the parsing stays in probe and
meson8b_init_rgmii_delays() is as it was. The T7 gets a callback of
its own, and the only change to probe is calling the callback instead
of the function directly. The T7 keeps has_prg_eth1_rgmii_rx_delay,
so the existing probe code already validates its RX value.

>
>         Andrew
