Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C172517AC
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777220907; cv=none; b=IA9siUqILDq/Jq7i7qrMNfe17bCX/OtQNROue13ubwYK35j61kNzTXbpGXgGI2zQvlxWXa03rXka6B9Ag9rlNGF5IGREcdrhjelTkNMSIJ9csucvD0Vskh2phWu+1GgbCtzepZU80kcLs0mmxK5ilqCCIbEM0TQBlLjP5iOO19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777220907; c=relaxed/simple;
	bh=2KQ6yAkhhoo89EXa6FHNEhTJ1HeUSHJLWXWhUzB1cy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5b54kMDJ0AOZNgpiX0WQjqyVCyJhIXrH6pnLYIPpiUwhfqpXc3WtgKAoaokJR4YzlzD0WeEo5p60JziVdcknAXhXQzGx80wY+3ctetUQMdTJnuH2fr9zImnvhiPfc+wDNeakMcodKtxA2GqJzITJz/5BqXZNSAEKTxeVzwwQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=l+VdvHV5; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="l+VdvHV5"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-479d37e7d7fso2244091b6e.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777220904; x=1777825704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzopt2jCiz/zJ9WJxFMTXHhvJ2SCEeZiL7oHCE6Ie/Y=;
        b=l+VdvHV5qn/2K12d7kjXlCfoXkUqq9X/74YhBFbWbxzvDl/bk8zzKqRYCyKGna1j2U
         N3Z3lJD+J1ISsRJMQXxWmNUVJH1QdiRiyr8Eeu8vM/eTvLfAxbcB4Oi3fpUIDwOo1d16
         NfiUkg6o9cYf3cP6NFh/IuGT0rUwjzD2XjbgfbNedzZI4XvvBiOfhgEfBqRC4uj3s0Nk
         a8IwwCYMJiXGh7hHzZHwlYtWct4zw7U3XpuzMBn/18SG2H8ME7eMELJHM3dFXcFOAdmr
         Jbpl5ypaZUhvxwas2AdsgURyWjradMNC5kccFUpeMgc3crk8yf96Kzsjo5XMEoxXgWg5
         oyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777220904; x=1777825704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzopt2jCiz/zJ9WJxFMTXHhvJ2SCEeZiL7oHCE6Ie/Y=;
        b=kL+0/KHFm4CKf+ZPQ27kaiFfgy02bT5uteMyiV7LkNXUnMwIqF/8sPnVA9VI72c4GF
         S6FiErxGmUlQr8KeK+p6SXJOTjBDyVhUa994fFLCwIbOfy6Ce1EEZMU/4J4KS6JkJnJY
         HA5om6eaolhUN5v7NhtN1stTX7JYbz033s97dkSj6GWeYYC6aItfO+Tm3XTlbI7bV7Rm
         fKCp62aq9VwAqCI1WhyFwnPskxcbtDNxIF0AZZgT/2WVxB8ZPiCMIiKVFbKUWwgs1i5/
         SzkGN1WKiAjgXT7Z9ZsCsrNmUw3HLJsAyuCzCHi40Ng4Z0MymqyY8FTfEyjdkIj6+dc9
         0Xrw==
X-Forwarded-Encrypted: i=1; AFNElJ98GOHJlW70TWcH5aySGfeD1Z2US8X6JMQ2xqpMLvtturM8AZ8/vpQRwZTT7B+csEfAPBfzi3wlqGL9@vger.kernel.org
X-Gm-Message-State: AOJu0Yznl2jzNutx/FWkcIdjjZZ0X6kJpKnmbS4MSZ9tbDCiLyqWQgUy
	/7WYZVD5WpQGaONh9I7EhUa7akgsP7axiNiOBc1R+AGaVQhFR3OneygBaMDcbzNN6yg=
X-Gm-Gg: AeBDiesf5QLrJmwPSDXmI5x3YpReETydmnkyZD/z+ots4SglPOlbDwhgEiddxsA4mov
	RtqEtPyMVJ2mPXt0NjiI3/3yrG72xeNDbwyURY09EpC5Sa2HSHWsziZv3POJAjVcBdxBtcPe6PT
	52f7914v0scMsM+khcdzlYMox6pjYYGK6kARFxvr1e2NDKXlg6p1Gl3Vwu4WEFNkOlnW9lq0+AK
	5bqyX5T8Ojt4YMyYswIS1WLZzfmxXK8vgXJpaMaK91MDy+dSsv0hbqB05vPi0xy4ddrRCGnaB/N
	ekSBT7KciGu15C7JmHTHiQE7qsstXtzS2flZvjPVVcnFXLrri+wxvtvBkYcIdopuZl4w3bBugPr
	ZxLMQrP+3PHAVZkDAbir4Bc1SlUtICbf2KvmQGZiGPhXBPbmNUtYB0Jb9IgP1GAZBqJH41VA0vg
	hY/IMGIrxidMCNgWWDBAAK7ZNNDbaphlmzoB19GWQHvwtnnWsN+hJfrwgsuFO6Dcr5G1RPd70yP
	HRpuJeSgrK1
X-Received: by 2002:a05:6808:2013:20b0:479:ae1d:fff7 with SMTP id 5614622812f47-479ae1e08e2mr12603387b6e.4.1777220903677;
        Sun, 26 Apr 2026 09:28:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:81f8:ef7d:a711:d99a? ([2600:8803:e7e4:500:81f8:ef7d:a711:d99a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799feaabf2sm19106674b6e.4.2026.04.26.09.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 09:28:22 -0700 (PDT)
Message-ID: <78aa1551-2dc6-432d-9d44-ecef0198e1d3@baylibre.com>
Date: Sun, 26 Apr 2026 11:28:21 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: avia-hx711: add avia,hx710b
 compatible
To: Piyush Patle <piyushpatle228@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Andreas Klinger <ak@it-klinger.de>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422175910.1258579-1-piyushpatle228@gmail.com>
 <20260422175910.1258579-2-piyushpatle228@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260422175910.1258579-2-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/26 12:59 PM, Piyush Patle wrote:
> The HX710B shares the same two-wire interface as the HX711 but differs
> in its channel and gain model: gain is fixed at 128 and the number of
> trailing PD_SCK pulses selects the input channel rather than the gain.
> 
> Add avia,hx710b to the compatible enum. Document the chip differences
> in the description and add chip-specific supply properties (dvdd-supply,
> vsup-supply) for the HX711, a rate-gpios property for the HX711 RATE
> pin, and an allOf constraint that forbids HX711-only properties on
> HX710B nodes. Clarify the clock-frequency description to reflect its
> actual purpose: controlling the SCK bit-bang timing.
> 
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> ---
> Changes in v3:
> - Drop the vref-supply mention from avdd-supply; no such binding
>   property exists.

Why is there no vref-supply? 

HX710B has a VREF pin for a reference voltage input.

