Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A4471D17
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058238; cv=none; b=IfLxzG1A+qLMsWna5Y6Nmc5zGL6cjGVYcCpQy7ARyP3rwYV1LFDLiLUXsNLiy5ASs0wrm0kL/gQvnKMCkoRUbwmq3L0/pPrMMLbl6Icig4Ytkg/elFkYmRjC7PUhq+lRhC2Hr/puJB7Nji+vux2++S4WDyTS/3OeYKGhTfwwL/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058238; c=relaxed/simple;
	bh=6CtZYMYT4XpUFtb1WYTDbjv8lDt8QsA8X9rTqudbuL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiNWX6v5KYEcLr2ULAYDLlraANwvHKCklj3iOKJkNu4+hcwhE0meX1dTkF/i9kN0yklA+Xoo/3NAAMIwCWJ+KjrqYyRzwWaWjUA6fL31XB8vHagS37OW7VTxb54MSJdNzvIgVHNilpzue42Wu78YVzJZ60t/OJ22OAs9FxrDvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A35YIR+2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ohv1np9n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A35YIR+2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ohv1np9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787058233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+uKpz7vxdNODpZByPKeGLjosat28K4nUQ0xLNtgYDM=;
	b=A35YIR+28BblCYjx3x3XqJVz2bAjRVVkd5b/DegI2yzE6uLc4SzSyXTK72a0PwRr7Vxs/h
	nEx6snKOGOuEJ8VLYDzyu2EfCH25lFG9s6z4XUkTwURvL1Bq9FTCzQgMbduNf0Cc8YKyOe
	QF4UEIamVKRF5nCvqJqxD41OHO5+2Z4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-ARK_e1JGMvWcD0y57UEkSg-1; Tue, 18 Aug 2026 09:03:46 -0400
X-MC-Unique: ARK_e1JGMvWcD0y57UEkSg-1
X-Mimecast-MFC-AGG-ID: ARK_e1JGMvWcD0y57UEkSg_1787058225
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a14f2e8c47so4798675a12.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787058225; x=1787663025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+uKpz7vxdNODpZByPKeGLjosat28K4nUQ0xLNtgYDM=;
        b=Ohv1np9nDTeiGArPJ/V1CQbOkmziALY26iWRG/3qctOJV3pwMyFHmvoAoAGQ1tfp8a
         MSHIhM7Jii0Fh27t2NH9jV99y40pPNrOAjuKNuGWHBFJXmZK2wmMEMLoXOIvPGaxVKNm
         IFTwlte5M9xOlWAN5k/XVu8cZTvAkGW4Z7LtpBIyivEbyvHkN1UdKsMy/YKItQwVyqWt
         Ff8xBtM9xiMq6j2MedGa8Bd+ppVqbPnuXeb1XzbZ3ub3/OOqBQYxV4OHUlKroZYBmkj4
         9d+g+745h532XPjXKOYowGuN9qo5UTO7WiCqYMZhIuhno1XX+zkYuNB57JBwK1bTZGBN
         CHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058225; x=1787663025;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+uKpz7vxdNODpZByPKeGLjosat28K4nUQ0xLNtgYDM=;
        b=F64qyaWCFeOpfpoutUzcaDRMbICfbv0u2jfb143h1wiMF3bZmdn+A1dPmxhbzEJLyi
         epujnYQodp+kkol/xOqsWMGNEi60KA60Vers1joAziSm48hIJM+xgE5TTckQ80+jbdR0
         M1kGWIYCzgEoV8UsNp0WFKo092Qyr9E49Ecwqw//XApROqrS7fGSyjcaHh9nqDORCKun
         YLJsdxeB+9cdigf+BI8Vx52II2X1hmGBiigLyzAnd/A4Mzx8waFaX7sZ9v/Jn76/uJiU
         6LwIheFMNX/Km8/5ajDSn4onqLmjwF5LqGtfR1FQ3U6ESTHfL64kgsIWqDbv5iMsjptn
         eqRg==
X-Forwarded-Encrypted: i=1; AHgh+RqVx/iYseW+YqjpPIqbWAdZ/WNmhEFccB6O6NPLvqOvuNbMA4us5DIH/Gv/5J3xXvzFEcFiB5OyQUqV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/3spOBXIGcCoQJNd+XECgK6c49QsREDiZC4PGQ+GJJqHYxk2R
	GDo6GaKE/OMeqmCUQTBUuRoJmOkvkj25sShQg85rxqlZoZEo8x4PIRo7qy3ESHAEFB0MaUOTBtH
	aR0LadMzNdOSb2BdCsu7LP/m/r/8244GR5It/kJ2exvaap6ooDpVw0axNDx4asJk=
X-Gm-Gg: AR+sD10Wtt54SF7FKL9At0BDkQttc4e7sZHx0/Eged90/gjit+2hQP2oLeXETPeCynP
	2TrBpGiQ/C54031/KuZVdrWTgfAR2dYJWExFuIvlyknzdqQfnXJqD+gP1gKc16XIc/WEGEXT+Nm
	czgzcP587rjKlwRUlLGLxKx62yXbrTAEOBg6eq87ikzEw0G/+GzSd9pPAxIXPLbRLxDeSv/Y/0Z
	SHsrJSC1rPMixvjTd4OpkkLGVduCgpTCNhjiKcOKIpHYZHReAZA1ca2gHAldqj0oIb+0o3NKzmK
	TPMuihr9QsL04zNF9XCpOzQ+2Gv1EF8HWPZWhwdb9ooRe0mkSNUMZIftlGmXBatqwwNgEwKOBe6
	j0mSylBrr6UmEeJiSD4/hsbaEj9gg6Rqpee2tNnuXFR70r2DOaTPmcwtqu/RISa3Jw3djCNCXmw
	Y=
X-Received: by 2002:a05:6402:913:b0:6a1:44c8:edc4 with SMTP id 4fb4d7f45d1cf-6a38a95be16mr16679744a12.12.1787058224917;
        Tue, 18 Aug 2026 06:03:44 -0700 (PDT)
X-Received: by 2002:a05:6402:913:b0:6a1:44c8:edc4 with SMTP id 4fb4d7f45d1cf-6a38a95be16mr16679659a12.12.1787058224457;
        Tue, 18 Aug 2026 06:03:44 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596ce4sm1724287a12.21.2026.08.18.06.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:03:43 -0700 (PDT)
Message-ID: <b33be768-5337-4f6d-8c58-2f7ee5e521a8@redhat.com>
Date: Tue, 18 Aug 2026 15:03:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 0/4] net: pse-pd: add Realtek PSE MCU support
To: Jonas Jelonek <jelonek.jonas@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Sander Vanheule <sander@svanheule.net>
References: <20260813222036.873930-1-jelonek.jonas@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260813222036.873930-1-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/14/26 12:20 AM, Jonas Jelonek wrote:
> This series adds a PSE-PD driver for the microcontroller (MCU) that
> fronts the PSE silicon on a range of managed switches, together with its
> DT binding.
> 
> Hardware model
> ==============
> 
> These boards do not expose the PSE chips to the host directly. A small
> microcontroller sits on an I2C/SMBus or UART bus and manages one or more
> PSE chips behind it; the host CPU only ever talks to that MCU, using a
> fixed 12-byte request/response protocol with a trailing checksum. The
> PSE silicon never appears on the bus.
> 
> Two generations of the protocol exist, both Realtek's: an older one on
> boards with Broadcom PSE silicon (BCM59111, BCM59121) and a newer one
> used with Realtek's own PSE silicon (RTL8238B, RTL8239, RTL8239C). They
> diverge in opcode numbering and a few response layouts; the driver
> abstracts that behind a per-dialect opcode table and parser hooks,
> selected by the compatible. The specific PSE chip behind the MCU is
> detected at runtime and only influences per-chip constants (power scaling
> and the per-port cap).
> 
> The compatibles
> ===============
> 
> The protocol compatibles name two generations of the Realtek protocol,
> with the I2C framing folded in:
> 
>   realtek,pse-mcu-gen1        gen1, UART
>   realtek,pse-mcu-gen1-smbus  gen1, I2C/SMBus
>   realtek,pse-mcu-gen2        gen2, UART
>   realtek,pse-mcu-gen2-smbus  gen2, I2C/SMBus
>   realtek,pse-mcu-gen2-i2c    gen2, raw I2C
> 
> and each board carries a device-specific compatible that falls back to one
> of these, e.g.
> 
>   compatible = "zyxel,xs1930-12hp-pse", "realtek,pse-mcu-gen2-smbus";
> 
> The naming is the part most likely to raise questions, so the reasoning up
> front (the binding documents it too):
> 
>   - The node describes the MCU together with its Realtek firmware, not a
>     PSE chip and not the microcontroller silicon. The PSE chips sit behind
>     the MCU, never appear on the bus, and are reported by the MCU and
>     detected at runtime; the microcontroller itself is a general-purpose
>     part (GigaDevice, Nuvoton, ...) that varies across boards. What is
>     fixed and Realtek's is the firmware and its host protocol - hence the
>     'realtek' prefix.
> 
>   - gen1 and gen2 are two generations of that protocol, both Realtek's:
>     gen1 on older boards fronting Broadcom PSE silicon, gen2 the altered
>     protocol used once Realtek shipped their own PSE silicon. The
>     generation is fixed per board and is all the driver needs at DT-parse
>     time, so the compatible encodes it.
> 
>   - On I2C the MCU firmware expects one of two framings - SMBus or raw
>     I2C - which is a genuine programming-model difference, so it is part
>     of the compatible ('-smbus' / '-i2c'). A UART attachment carries no
>     framing suffix; the transport is given structurally by the parent
>     'serial' node.
> 
>   - Each board additionally carries a device-specific compatible that
>     falls back to the protocol one. The driver only ever binds on the
>     protocol compatible; the device-specific string keeps the binding
>     specific and reserves a place for a future per-board quirk without
>     having to retrofit device trees already deployed in the field.
> 
> Testing
> =======
> 
>  - Linksys LGS328MPCv2     (RTL8238B, I2C)
>  - Zyxel GS1900-10HP A1    (BCM59121, UART)
>  - Zyxel GS1900-10HP B1    (RTL8238B, UART)
>  - Zyxel GS1920-24HPv2     (BCM59121, SMBus)
>  - Zyxel XMG1915-10EP      (RTL8239C, UART)
>  - Zyxel XS1930-12HP       (RTL8239, SMBus)
> 
Please note the the nipa sashiko instance as a few more low prio comments:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260813222036.873930-1-jelonek.jonas%40gmail.com

I think it's better to apply the series as-is and follow-up on such points.

Thanks,

Paolo

