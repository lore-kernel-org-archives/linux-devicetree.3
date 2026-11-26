Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710199;
	b=FSferCmWtaVVDcOtPhPc7oWHUqNkLdgOPVAYaHrdogmQpU8lhKJxGeBMZSIDMiyuMKmj
	 j/2+DCFBq3LJqfOPZAmDjGTMm38cLP+UXghhWYU1l2u3/Gm+pSOo98ZES5CWHiDtgRCch
	 sAm6b7aKoqgwRmKeyIzvvePz3Lv3zEv4+5/SJ+tNHgMdWqbFTdVpgSsD7lFBR0Esiqg2E
	 hNi8PCLG5aVzHUK9ibPvjoHkMYjcEyjbWVpdtf+PDYaQAw4tXAuJhELz8NIsem3Uky7cO
	 GWbc1nR8mHE5BI2M0x7Fbit6ZaO63aQT6CPjZefxEHgB5XSAr1JnhVqMpHPEZ7QiCpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
	b=P0Nj9qvKvJf5CSRZRpo7cgax9vEJa5Mw8S8nWEjDh0Wi0mBKadi5xixG2jmE1cTXR2lq
	 8wQLwzdphGAKrJcHLP0Yk7vyTRfZj5CU7upedKBGp5WPTl26e0urceAwpmoJrSt0/7lJO
	 VEwSIyHAmMGCQ2s9Kf9/0ZCzh8H9p6Q+ikWe6YmLSS2nwwNA4hoQRxsd7YFijejavsDHl
	 NoItCdLPWBdIuJiSd2WwJCuetSpxefGW/tvnvaXD2If6RXb9sqzR5vUNGeCu2j8UaOZrZ
	 PIqqJP6N3J/eIpnclf/JxucgA1Qnqu74loi6DFu7bqBilG9GZv/fwn7kKk+lbd+qNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=za0tUy5b;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B5606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=za0tUy5b
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so61807725e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795710197; x=1796314997; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
        b=za0tUy5bDG6DeUVR8UOXXFv4wekZtvi6jD1JMYNdlmu6vgxWoOIVdG40c4k0jCsCkK
         0xrpNS2Gr246iS5McYjs/kKq5cJoMhAKBpSuABY3v4SjI0/Bw2qPrI5ctzZU6zA5gz7A
         T1eJ/jaQVTaete8XKxHl8kQ5iVOUahGjaAHEOo9RlkBpDqg3bxGiwUsSn044wn1G2WOc
         YVYwc8ct7Y72VqPk/7/lDtZJ3TKMRQw6TrJWogVwJ1i1H1/3Gba2Nv7Hgp+GJLr+NlNe
         V9ulQozkpE7KCSuOnrg86Fea1O+9JN+xkj6y/9EMeALFZwDYDF+Rgu5Hs1XuN+k6C0Bw
         BTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710197; x=1796314997;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
        b=yEewzuWdDLohrSeZS4UjdUUxkNjRlooW8liooR8KLTme7o8evVrrY8RMNxYQffy7U/
         Yg26nIGUKIYbSRE9/c+/pdekUTHgILD2ACxdaptci9o8tAbWTJecIB0HkLEUPgAZB1b/
         XeXfHodKklADLHGyCUHFmeiWaZPPhr4pMJol1T1RMRCTXS4MGqWbIEVDV445ue/4DlgA
         PLei5JRLkIhAh6TUucyOH8+B9JUm4hHaMT0hpohvBgDPzc86TTT7Y4OcGRlreY/zRXQ/
         vVfi9EMEsHZf/TtwLIM2yd1rPPOcGQpCW+H6E9WPCewfXmtjHo5y75BumDpX3JCrFMkU
         9Lhg==
X-Forwarded-Encrypted: i=1; AL+hErE/dgCm1njjvaSAxfhKZ5cMEoNJgqRON3xzmtfeXS0A2oSowgeg+DYajyQb6n/gHXWk8wYTCMJfcx0o@vger.kernel.org
X-Gm-Message-State: APuU4Z+aF3Pn98jCsY0EeXbar7WmCGrXUzRq/jY+ZnV693BIWRQszil8
	JELGLEfbUYhNp384BWa8WRLprgEUZl+w3eVvbJJ4WehrR5OvCbU7a+t6vZyrLpsgG9c=
X-Gm-Gg: AZFdTZd5/x9isGBOwVqxvS4WUMTRk6B90AeQlllSbCwtTzV3ylam1uY9p5U3Mf9gFpL
	7y/WapG4LdbaQcRkvmB+oXxwPiPFYLlkI0YftGhnikCP/4BNhZ1xtlrXu7fokSIpQENIztkJsgo
	zgSV1fRvgW44xIkUsGUHPYyclZHSIRPKd1+fz/auKAWLzmuLmZyergqbS82Q7Wo+QuQ4F2gq0Mt
	Tbg0tcRhLcFJorHpCkFM1ymuMxaL4vvCdou9k7zB+bfy2FtXpzwZT/8EIERb3UP+tj0OhA6nvnJ
	r7ahqNEgKd5VZkeo1TbxJm+HJjsc3Yh/nF+mlMHSB8CUe54Duu/wr/IlkYbB+g4mLrfKHohBCk3
	GWyc2T95pGd3UITGiMzrPSg1vXyU6RoGQ3qo6me8+a8Jss7dbymdICjABgp06A2gv+Tmsl/cpbP
	62iMk1rzuDzvlem0oRxxIkb6S3B18++lsfqqLbdKbN8xdItCP/YgkVY0F8iI8WKZKW3p+meuYWu
	S3gS98KQYFUbVlZl2IHRZtoyHUd0GGqg7y7met5vWPSdl+EcAV+hiTAHzDMAJg0RVq6/wyD8quS
	YPI2IXpJjVjRVTzjaVU/Mhh3ivwwq0rQrZjadtGWxrzFYXru+L56s13Lp6u0HUKuomm4bdhBhT4
	G1qHAzHzlrcHkd4pI85c=
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr461737765e9.30.1795710197214;
        Thu, 26 Nov 2026 08:23:17 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:11a1:dfac:b1c2:1000])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm34026626f8f.35.2026.11.26.08.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:23:16 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 16:23:15 +0000
Message-Id: <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
X-Mailer: aerc 0.20.0
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
 <20261125193122.747908-2-tadilhusrev@gmail.com>
In-Reply-To: <20261125193122.747908-2-tadilhusrev@gmail.com>

Hi Adil,

On Wed Nov 25, 2026 at 7:31 PM GMT, Adil H=C3=BCsrev Tepe wrote:
> On Wed, Nov 25, 2026 at 02:23:32PM +0000, Alexey Klimov wrote:
>> This small series adds support for the ADC block found in the Samsung
>> Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-=
96
>> development board.
>
> I tested patches 1-3 on a Samsung Galaxy XCover5 (SM-G525F, Exynos850),
> with an ADC node equivalent to patch 4 (same reg, interrupt and clock)
> and the board's three NTC channels.
> Readings match what I get with the vendor-style sequence (re-init around
> every conversion, SOFT_NON_RESET after reset) to 1-2 LSB on the static
> channels, the NTC channels follow the temperature, and 200 back-to-back
> reads per channel show no stale values. So initialising once at probe
> works fine here.
>
> One small thing: channels 8 and 9 always read 0. The downstream driver
> uses 8 channels for this SoC, so MAX_ADC_V2_CHANNELS (10) may expose two
> channels that don't exist.
>
> For patches 1-3:
> Tested-by: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

Thank you for the testing!

Regarding number of channels. The Exynos850 spec says that ADC has 10
channels and, looking at the registers, the ADC_CON2 register (offset 0x4)
lists 10 channels as acceptable ones.
ACH_SEL bits [3:0] field in this register wants to see numbers from 0b0000
to 0b1001 (from 0 to 9) and lists numbers 1010 to 1111 as "Reserved".

So, I tend to say it is fine to have it set to 10 if it doesn't trigger
any hw issues.

Best regards,
Alexey
