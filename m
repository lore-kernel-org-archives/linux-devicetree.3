Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723992;
	b=b6v7NQDjntcp5hQFwLRgA9DCQ/s+0IC1doOkkuVHLSDOvMOfPOL5EQ/lhT1jTJ22u+HT
	 bbiqi/yiTtJO/jCP7DIkDib+GHG/bObw7DMW2Nr8cvLlw70zb/ztNYAvFzjhUEn+4Iiwy
	 R3zA1eSRVwTMyZ7KoxQyBpcunxqb2VHdwyVsUkWWlLRHmmm7/lXQzQx/qNNKiQgUtGFAG
	 ifl3jIdgtHvgKU8y73Hyg1TRuAp9ybfRCRoGhI+c5d89g0aMUqH7QhFuszZM9gYJx+yu1
	 /a2RcJnt1oPMTyyHhY3CjGdMuOmRzhR+b5dmUrswxk2rKc7kjPql8pZsCL7/y37/4ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723992;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/NZvArZdYg853Maan0dEAeuUTGOiHnQbpO25gEe5B+E=;
	b=LyAj4p2nLqKhojqdWBg0znaUepIq84xb5qxJ7foShyThMlkwjaPEO0xB9RA3CQbp5MOT
	 W8HQji1WHu63uVugpD4nebNlWAtUsu/XnD0nWjAZwlSRBpl7L+cgmk5IqkgawGF0GTEoT
	 sSxs82KEbeQsawj6fIDihCe3bBfJDaFCaUScDHTrA27tr38HKpI1k8OmhfiBSWB+2Aut2
	 j62OUmjjTk3he69J0ywaCUgVKJEVBcJEGD/woaypk87YeRhBJ1r6qjQi2/ofFYoVr7nWf
	 ZOkd12g/NnVbFZC8UuzZVGgBdrH/O2YGF+LJ+QaAL6C05EXb/Gk6zt95KudFbB8AKKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185A606A331
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7185A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843b6f8e2c7so5589584a34.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723991; x=1794328791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NZvArZdYg853Maan0dEAeuUTGOiHnQbpO25gEe5B+E=;
        b=E0VSggl9N+BCVbdOc8mT7DtQ+0Vr1gNIfZdhJ1IILGN/VocSU9+qYi8sbD9P9WizCQ
         WoNUWHZf05oHCjyvFGEpEFZ/NaLAjTuJQWbQSSEPvbS70+2CwR7qBuG1ZPDHnNp+cTCI
         neTLhjafRA9LHJR5WXvZdE349QQZZpqyXWU9HCLAfOfjmWlLt5WPmbWqY/BOLQ3QD8UX
         iPfhA0gospJ8Zn0desWCyJuTJvy1AQDIg9fJfgRKbhrV8mYpwOgkQOMdqPQoiYXZjcKM
         gLCY1qU3G51wANLRe8upbKqRDCX8lqUmU9A8jBuUr53ParqSzMX8KvgmuewahRw/rzP0
         nFMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG27Sg5lExoMGIgOWkUi71VcWI4TNrYTz7GSYr+L9o++KygDMusPegPl1vaMJnrABzW+efkT1jHAeg@vger.kernel.org
X-Gm-Message-State: APuU4Z9z1LWG/md5nUr0XAkK8dQkpCfe+XYTIOoILS1KwZpSvjHF3LCe
	pVdOD7x4cM5erEjScSq5RObnm4eVwUOl/J6kALwMiCeDkjfZEfSxWJycq8rE2emh/iM=
X-Gm-Gg: AYBFou38BbxMPaW32ELfWlNQeD1KsxHjrnI0PdlMNMXPjNTCPWRJPWKli07coBMYk2x
	oBsTVlBp1/lFHNwZkItYLCwItAbOu3MyWywkjhWdeHcYeHKkidtddGnyKCFipLieY6rKqA1fmxX
	WcWOwoVydX4yudM08+LJjoD/XAzF/87fOElRncIB2srVPl+KCcUnM9r1+AYdpzMZHI40kK7fEX+
	LqxJtE5kreRSJLYw522mIxjjaoo3EhRbPtpcSPr/UnFFTRgWywn1WXfBWTmDggSARoc3ro/osuF
	q7E4VLTkIHuRupG81C8c0MmIHFeDfEDmokq9cyfXYuukDWiHPPa/dBt/zAviE7Hp9mUXHq9R0zJ
	FUrCOefg4UThxs23iAcUGOKpgky5JqgyIndJHBhF8FXs1+E1Mgiar0dbnjCFYgu4Cu6+u3YU1xC
	jDJ2xdY2Xy/YYXhaEqLw7SjBy6LOcDV/PlPGr+PfPYcQm5/vRoMHC5/le3ojuUSIa+gXEzQctlA
	4X0dnOBtB7tbomIa2YnVoo92wlbcosZA0Sgw3uhd2TB3UCQWashIIaWMh031ztI6VI6GS7Fbq52
	7neTzK5cP85d88JqRc5CCnPNDLuYNjYHQRaZE9eJbtgs5tx8iLzgjjhgiu1/l4bPziokvVig1xv
	kfHzpV4dF1TNGZblAfJHPaDVk20x0l+Rp0KFXvTrJRWyY0CiLsfKS
X-Received: by 2002:a05:6830:82f4:b0:805:bf8b:9523 with SMTP id 46e09a7af769-85d3648d877mr9176143a34.10.1793723991380;
        Tue, 03 Nov 2026 08:39:51 -0800 (PST)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm11702562a34.14.2026.11.03.08.39.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:39:51 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-843b6f8e2c7so5589577a34.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:39:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzcd586rvNXqqav2xbL8SKP/FKDezyE/fIqe0M6w5E9Qd7+y4Cn5PZ/Y6/Eg6gXmbYenNaYxVHAKp13@vger.kernel.org
X-Received: by 2002:a05:690c:e3e1:b0:8b1:3606:65f6 with SMTP id
 00721157ae682-8b2b674a182mr76399327b3.64.1793723531633; Tue, 03 Nov 2026
 08:32:11 -0800 (PST)
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
 <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
In-Reply-To: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:58 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
X-Gm-Features: AclHuK_uB_FU_COonRuR52ADQLZgO7wR8X01b0NCoWbrjac2-TTSlybmTTN1Brw
Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

On Sun, Nov 1, 2026 at 10:58=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Thu, Oct 22, 2026 at 10:06=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +       if (!dwmac->data->init_delays)
> > +               return dev_err_probe(dwmac->dev, -EINVAL,
> > +                                    "missing init_delays callback\n");
> I'd rather let this crash hard to make it obvious to someone adding a
> new SoC that they forgot something.

OK, the NULL check is gone in v5.

> Other than that this looks good.
> It would be great if the netdev maintainers could comment on whether
> this now matches the approach they had in mind.
