Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D43AA50A
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022169; cv=none; b=JMRbyeFx86dEJ9CYG+28q7zqC3QeGyp67mVxtkPhaOeDXpbcPaJ+GRga5bt68WA5Ve2BvGLGX+/u3buANVOQXLhuCbj7aLkc8SeciZeKiO9rtpkCY7evM9Jl3AhekLv46snwlVsToE0YeuiaMQPVXKwOP4SAX4fGYDM9MpHlN6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022169; c=relaxed/simple;
	bh=BBJfUI2zXdYPvtD7vnqTs3Bc2wvnZAzUqtvUNsC0480=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TrgBohoAji3BjxE2WJS8afJ6bNSNHej8CpTOY9Zg6mInvGes5uwF8C77LPkfN4nh98xDOnTovbZf4s1rQgySaoWNxRaaA3ov5fdACiE7aKLpraqXzKeP9y1N+xSPxbob/gta3oYDXMh5e/HCIxZnYnWcKZxIj14nFYDHcxquD0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ia0CHvf1; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ia0CHvf1"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4863eae4526so2541514b6e.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781022165; x=1781626965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cZzfc9MyNs9MhTESYDputWthSBFsNrc01XRKBY0nJA=;
        b=Ia0CHvf1mn0vquMxLkzvBhRAC3kS6orLHeZGQ+9zSKiwLNBP6R4g6ltAbYwiVJ5m/u
         /vJ+Sze/879z0+BJjwbyXyH/giGski8QFfXIDWjs75YmpLw45W0vniRGqprsKyDXUOjP
         AY1gd35nW/ZbFD2nN66ajEPiapyBiHxQeHn2xtLEuhGlnFpR0l6bSfkH0Kh4zz+jWr40
         TGCv29w+X486hH/C34h+3q/nkPDpQzhOfwI3UF6W+OuS83Ixh3nSJr+6tQhDTM8YTjX7
         yOTLGFfog2X7fMak0nuH1ILIyCWag/zV2lYI19dzBXJ53HrwXKyDQd7B9kf8p3OgGXo6
         ofLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022165; x=1781626965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cZzfc9MyNs9MhTESYDputWthSBFsNrc01XRKBY0nJA=;
        b=pOwEwWgEYumoQ5xXm3B4Kkurc0MC84lHk4ojprNgcIiUOoABVSdwllQStgC8e1s68h
         W3t215qXrTZXt/LQQBYZSZOEmNxebdZj4k5+XUNhERhushj6OFcrLm1Z5OTR3zR4pYU6
         TYTIXJRzNJAWyIZiuwRRMe7kUZ4TvjhT0uhl+7PRFvBDsncttyr/JXViReKQxQwA2EhR
         +UqZsA/NXVOLb/sZi04tB3n0BiDI4I+ZWVs15296DcVAU2PqUJSh7/BBsMhbzlWJbZ+F
         oS9LAWEQbqy0owisu+oGlQWAh8msM2W75twN8eWA3vSoPeiczTYHvmJJIvI7FnkhuUJz
         nSHA==
X-Forwarded-Encrypted: i=1; AFNElJ+avbTqbVKQbIWQo3SJHyNMspZnQ+xfmjmWHNIXpYXTy4k7jDhBnxWCMQ0QDTYt3h4HR+1pJUocC9z4@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlIvx0BP/+Zz+vbBuiwKDTbbGvv8EZLS6z1zS19t4zp7rx2CA
	OAN135150NbLLVl3Ioekw6uJi2ynUCD0uCXgxC6U4hyjLIQxoBAkGxfMCpsSA7cHyFE=
X-Gm-Gg: Acq92OH9lyPXgiWR8LGGbIrjdNH09CD+2ycBD40GTBuYLexK/cF8aFE+Wl0/PBSvAko
	IXZRyXdDrvR/GZ3qd0uEH/y1yelKFjQVEDhLWF7Q37OFJFMlFiK9wDuU7RJNrCEFAVDujSLr6fE
	sPJmQmFU+LFvgQT7+cIl7945qAWfXddJY6xuudCewAwKxQUWrcVIF5X7ck2w1327DqRBt6tkMZY
	D3+UBp7Wayiajy7nrXITjKZn/MHq1TQtQyeZIJa0PK/l7SlBfVEqJ6vlnRipEXm0gSNQ9/hri6O
	CLyR/18EYKJKcdAgXiJzyX6jm7rd/TEWSlj6eeA4IJO/DpSpR7qU3sSLOOZUpOZIHqq8gWmZFno
	Q63yZCrlGYrnNz/HgMUvU76cfLCVwrEF6BNqEo09+QrblgjmlPLNH//CECDvvFRPexWIkA336Y2
	7gADtIg0cmDqbtxuyuFUneuVIGB3doBiCVxMcUzUwEEJzzhyVp/wOWVgV51HVZZ0QX4/eh7X/CC
	7UAHTfcqJ2m
X-Received: by 2002:a05:6808:4feb:b0:485:3dd3:7727 with SMTP id 5614622812f47-4868dddb451mr12699969b6e.28.1781022165556;
        Tue, 09 Jun 2026 09:22:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:2516:8f73:2dbb:a61e? ([2600:8803:e7e4:500:2516:8f73:2dbb:a61e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a39fbsm16294587b6e.1.2026.06.09.09.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:22:45 -0700 (PDT)
Message-ID: <c9418ca9-5563-45a8-b995-d2bf7514d819@baylibre.com>
Date: Tue, 9 Jun 2026 11:22:44 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Replace Tomasz Duszynski as maintainer for SPS30
To: Maxwell Doose <m32285159@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260609161701.52513-2-m32285159@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260609161701.52513-2-m32285159@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/26 11:16 AM, Maxwell Doose wrote:
> Hi all.
> 
> This is basically the 2nd half of replacing Tomasz's entries, once
> again, in the SPS30 dt-bindings and his entry in MAINTAINERS. All of his
> entries across IIO appear to be dead, which is why this is being sent.
> Jonathan Cameron's approved of this [1] so his entries in iio are being
> replaced and an RFC regarding this topic with Tomasz Cced has been
> sitting on lore.kernel.org for about a month now.
> 
> Maxwell Doose (2):
>   dt-bindings: iio: sensirion,sps30: Add myself as maintainer
>   MAINTAINERS: Add myself as maintainer for SPS30
> 
>  .../devicetree/bindings/iio/chemical/sensirion,sps30.yaml       | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> [1] https://lore.kernel.org/linux-iio/20260609140712.2e5d1640@jic23-huawei/

Do you have this hardware?
