Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D41F3FBB44
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483799; cv=none; b=VApr5eWssZn42Eo9+MekbQXSus9tzhQXci+HGxAPDNW8SEZ7BjXaNH/jYyLuLqO34EPQRMZttH5mYoInvS7mTZEv/G+u2OZGydjSvBLGr1mpP1pRWfzuy+7rwfkLJg6U5QAEt9+AMyWD89oEFEvjovV32UXp9sQYWkiKUZ2UMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483799; c=relaxed/simple;
	bh=HtViY9Wu7iXmFgYNEtxZ70DL5CR7SJwt2n8TIpoymA4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ZKEMCf3vebJhr+GfPCxOZoXozo6tf79Ry8+WrVwINM2OQIkdagi7mRCVZtmp38YWSfts6fJw1z8EB6I0Z8Gqn9ONCfMM35alch3Wi0G07a09/9XdVsZlCGBdu91fIWP/iiBWhlgZ/UAxhMCCkTAJmepWHyZLUqckNSr/wUt1jAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWCxW0S0; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWCxW0S0"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c38565e774so95837e0c.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786483797; x=1787088597; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Z0LPzjSkEFAa4Rs2HSCwHSd8eZwKugfFLQ5+qI5zho=;
        b=KWCxW0S0B5phcBhE5ZazdNXpb3iMFGs1IVNA7IaXS4qN6DHn1i/ibCMiMiof+BB201
         AYccAXkFAFptbLbyH8XaxjU+pV/tEMv2G9LUf42caZO6lt1TtNeh6rCmiFH8cjwPyANj
         UPbkjxO781Kv/FzftDyFyPtDNQGghL47Ou89WubnLOheyQ4Rc3eO2K0QAEs01HCf+mEL
         rYCEWiOQbfQ9ez7itsihuRzBt65N6ssp3r52tig+RjGEVYYuxH1yB5r6cIaOPWj/JZG8
         4z0Jwxkkb2hu4z6E9fzfeRlcXYbubScBxHuACWJrmPUf/vgGyK7yqHibR9LftD04rD3K
         EkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483797; x=1787088597;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Z0LPzjSkEFAa4Rs2HSCwHSd8eZwKugfFLQ5+qI5zho=;
        b=Nck7vQVBFNVLQndcqiOQ15OUJ38Kma5NcHnxiO9D7TU4FwIKvogatcqz6E+3+TAWGw
         U7NA8OENIEjFLvI0fVaS2hgZzaKmwOtr7to02X0b1yBjOreVdyoXwvZUSot7/tv4a7rU
         KOnDaOx7qzkvmv4C2vul6q7GDOAhXmqPcVJhhy05825QBB7NXibE5quKudhi4zMvXveS
         GQXY1/FXwpk2tXm4HMh5vDeSLoN4HIeMIhEU5mz7Vvk49kApH9Bk69Cf9ILaYt1vDyrg
         2nGf9oLLJZr+0R9N+jG9GNEJJQNpGY4W3ODJKyT7Vmv3pywX53SP3UBRDcgiBJUJnk38
         46FQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Ahq4QVcMFIzEFVHNpONIBAJc4Xk9wJZ4q8ZKDwopzqiyVQVGNsX3uua6Ig41/InX6ztnDdYjl8Mh@vger.kernel.org
X-Gm-Message-State: AOJu0YyagBNEd/DQ+lXUt2VcaWLSnZ5+eXYbdEn+reY5Z+HtcYX83DDD
	I5qTbswAPG1KLsoUzSo4U72kIJMAy/esjTwPzi0Kbpi9FoAwmc+cgsh1
X-Gm-Gg: AR+sD12RHZ3jMuVgfOp6CkpU7yMafYMV7ZMHPraC2y1H8auK21Mahk7RRhVdU38YvUK
	96QkVBAftbhWBvgwFzWEO6QzXGcO/SwtGfsNVr4DhowDr40ymlKarZNYDW/8kOJZgsWl618znxI
	349TwYzYUPApcvrVRRKwleMSmzegm48/Zy5QNoS+KZFH92oy0BbMq/YOWgiwsgmHddI8Smpgtdy
	ou6WkcphXnsYIgmV1FqRZVcaguv85sNKusj4649sRCPN86mQFM/6rAzDhpR4H7CChL2zvF8Oj6M
	//gLWSFQ1jOlc9uz/a1IWzK+NWyXQff7i4j0mLhre7y9wtHmFTy3ZpDeoF7qlOIrBXSCgxbFiSQ
	uWnUkO9B+SiH6qvK/J51BbwhEXGfSyV/cxNGpN0XG6FIoioZQLKMTx/Fk+pRCI9prADkGg1zOCe
	dOBaW3IMpD8IklzyvrCYi3Ik80uF9WzDnfJrnKwQrtBXZIGVEghfRC
X-Received: by 2002:a05:6122:134a:b0:5ab:26f:49e3 with SMTP id 71dfb90a1353d-5c501f4f871mr4423e0c.3.1786483796965;
        Tue, 11 Aug 2026 14:29:56 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b74e7ebsm520373e0c.14.2026.08.11.14.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 14:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 16:29:53 -0500
Message-Id: <DKMFNGU0U0GN.2D5Q6K2XV8VJ5@gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Jonathan Cameron" <jic23@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-1-f89925d72792@gmail.com>
 <CAMRc=Mf9Z5UMyt9bZP5b86mK0cWnbO=oxoR4iu+0f_YwZ-2CyA@mail.gmail.com>
In-Reply-To: <CAMRc=Mf9Z5UMyt9bZP5b86mK0cWnbO=oxoR4iu+0f_YwZ-2CyA@mail.gmail.com>

On Mon Aug 10, 2026 at 3:46 AM -05, Bartosz Golaszewski wrote:
> On Sat, 8 Aug 2026 05:58:23 +0200, Kurt Borja <kuurtb@gmail.com> said:
>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>> integrated PGA, internal reference, excitation and burn-out current
>> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>
>> Each can configure its own voltage reference source, the two excitation
>> current sources (IDAC), plus input and excitation channels rotation for
>> offset and IDAC mismatch cancellation. This lets the device drive and
>> ratiometrically measure RTDs and other resistive sensors.
>>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>
> ...
>
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>
> Where is the gpio-controller functionality in this series? I don't see th=
e
> driver providing any GPIO chip.
>
> Bart

Hi Bart,

The chip does have GPIO controller capabilities that are not yet
implemented in the driver. I'll go for it after this series. I don't
know why b4's --auto-to-cc is picking up the GPIO list. I'll drop it
until I actually implement the feature.

This chip is compatible with gpio_regmap but it would need (*request)
and (*free) callbacks for it to work properly, as this chip doesn't have
pinctrl. My plan was to extend these callbacks to gpio_regmap_config.
What do you think of this?

--=20
Thanks,
 ~ Kurt
