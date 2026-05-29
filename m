Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06553BED46
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048273; cv=none; b=s8r5nmDKU5fTnZgFRYPQAQZOjHO4npgAC0yZlaUPGnyLFJIpFO/T+InIqH522G3fCWEnCeO+qbU4PvOMRVisKbnfhxoVAsOwfMlt83hwqErNzC2mzFyFvLhcN8LO2ewSo3j5s6rvlqL4RhdbCkuLDxUVOjsJFtWQKiTOtzZ8jD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048273; c=relaxed/simple;
	bh=ZfaOPPNYNFKKgWBQ0CjGxfImqDjPcW4gKYAlO7OIXQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciox5WCx7nbDjYWOFOZjshO9R9bQWJO4V7xG51Dj64UyADvUtuPfg1h2km7T1k/eq6YWXVRh+9waZo3hIk1WwSEIyYpgG8SKlb/sbU2NDxMtwzpJvcXdmV5ZROvwHF9z/m8Q7kaXZIk1b76Kg+quxb9gOm/UYxhgI/SA7z3kqJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=l2x5qOnh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="l2x5qOnh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso65301445e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780048270; x=1780653070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qf1xsznGow3Mq8kqI6r2C6YXYEYFaDdBn6M5Ic+GMxw=;
        b=l2x5qOnhQAeQWbCt0fRrLXN5kKMUm2CiyrjUh/s2Fj8zHvf2xij7eSMCUhxE3lQDEd
         qIGJUaAzDLsNapuDn0LXCbJJYcNv64DsJ7db394VhYzB2B0eqV/GgDg74iineSIgwDEp
         Y/iKr4C0+HYEblMJxqm9qVgJMo2V5u3J/UVVrzdvF6sqeImXcrrcSgbhDvGQhvKL2wXJ
         z/cBT/TMUy37AKq9QwM5ucGgZmguqgt0Gs26bRyEGBovXnXu1VyuVhOWxzfCAry4ejMf
         0Jw/ymcCd9bViXEbuRshUd2rQeM5aDi7+Ej96/n8vWfoIHisfgedD2Yejcr/RggzWX4i
         lu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048270; x=1780653070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qf1xsznGow3Mq8kqI6r2C6YXYEYFaDdBn6M5Ic+GMxw=;
        b=rK19ABRGTkTuIn9uwJWOHiXG14SSnwY4iT4nXbdDzUudWsE7YtjRIrhYa3Ek09I6uU
         7plmIBAIsO0YOf1I/aSEVg5wI4Ct40KfmaS6JQ59P9ZDtbodJrbqjEq6sm//Lv5Wl0A6
         FsYUtHmSViSEOs+t93xLT+x5p5YgH5z0XqB6GSGA0qHov7Yc/r2OnfQmEPXpPtsghrss
         Riw4g4eB34yPUAafsJnGRBtIz5i1b/EDNWaCQ6vIieol91NgPw5rJCE6qvAklyf6V867
         gTq/UKz8CfS621+Pjn8Y8Q7yQN8g/Ayq1pnihmb1AO8l8wJ+ZOHufoMoUCEI3+VCas8Q
         TU/g==
X-Forwarded-Encrypted: i=1; AFNElJ8PcKEz6cHOco1GzyzSnmU8BJQiWxlN46xTNQtoP2ueUVdLDiezdws58XER1G6fN8abAP0xRjkrqijd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TdbIfM1uqU87HZ6QWkPfgWq2oHquCOvJcto4JQ7vAz6k5xbZ
	D3lJCloV5zeN+UrjrWvE44WiKQuVwxkuwBmqQIs+Vy5xFaOVKEDSHOIb/BkD9pLriF0=
X-Gm-Gg: Acq92OFCgr7GMCrRk2wBsZF6bPy+Di3x5Dcfss3Lx7V5eyS7CDnZip/wVs8WQhU01LS
	2RfGuBcnDmiFO6dOPJsCNzxor13/96QBLH+6BoBJ+fhKHUdFI1YBh61hlV2EOgmuvLRQPV3O5XB
	N0tI/d8dCQbzPyZvhNc+2bINiCyKX4tniuoSMAiHIBA39neUQB9DWhf67TJMYM8V87i2/1hnjNH
	ysksTpLZ4SPBe+HrEZL2fXHXWVBNUbmF6eS1gS1UxcD0wFP8VGarsb+7eJuQ73hHTIGm/YTqaOG
	6hUEFTw2T0MjnzbVRuOGDcx3U/UTWO5Is/il4BFZ31fZPPBMk+JxQ5RvoU3fKkTYpqRjIReK7eY
	nSETgDjj+BU2PV2sv8tmrjrNMgtgsTZIqRiyZDOe7R+s6XjbUTw/AEavMTBnNwavfX7522N/F7M
	X9zCwdNFKkxojpJrO+FETStD0JF/SjoEs4nMTyfBioyVUYi11hNBjFIe80s37oE3fx6biBpOVvP
	HSKaG9LTKd7hdjuTaEeq6gEa/pwNU8nVf887NpzWqyc1jzGWdj3bM2XHWJ7QHG8rjw5TLn7aHMn
	Ecmss1MWJQjgQAQDtXk=
X-Received: by 2002:a05:600c:12d1:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-4909c091fd2mr22900055e9.4.1780048269850;
        Fri, 29 May 2026 02:51:09 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm2337806f8f.29.2026.05.29.02.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:51:08 -0700 (PDT)
Date: Fri, 29 May 2026 10:51:06 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED
 controller
Message-ID: <ahlhinOh3NxB7FY_@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-2-clamor95@gmail.com>

On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> Document the LM3533 - a complete power source for backlight, keypad and
> indicator LEDs in smartphone handsets. The high-voltage inductive boost
> converter provides the power for two series LED strings display backlight
> and keypad functions.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
>  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
>  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> new file mode 100644
> index 000000000000..866b0fb8ed04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3533 high voltage series LED strings
> +
> +description:
> +  This is part of the TI LM3533 MFD device. It represents two high voltage series
> +  LED strings for display backlight controlled by the TI LM3533.
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/leds/backlight/common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,lm3533-backlight
> +
> +  reg:
> +    description: Control bank selection (0 = bank A, 1 = bank B).
> +    maximum: 1
>    <snip>
> +  ti,pwm-config-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Control Bank PWM Configuration Register mask that allows to configure
> +      PWM input in Zones 0-4
> +      BIT(0) - PWM Input is enabled
> +      BIT(1) - PWM Input is enabled in Zone 0
> +      BIT(2) - PWM Input is enabled in Zone 1
> +      BIT(3) - PWM Input is enabled in Zone 2
> +      BIT(4) - PWM Input is enabled in Zone 3
> +      BIT(5) - PWM Input is enabled in Zone 4

This is optional and the drive implements a default (zero) that is not
documented here.

Is zero a sane default from a DT binding point of view?


Daniel.
