Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4402388E46
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214277; cv=none; b=aTTjpvVHz6yMCk+uSjuLb/QE3cZIQy1YoIZNyz1hd4XxYx1maJMx9Bgk8c6ujher1ZB8yhWk25YjHWaSe8TSNDHHsvXjekv+7jaCQu8tfxAEeOOGGZu4Srt6JHCOsRP56ouro9VnUvKIzDN1EktXsbxfunWxOaO0x9585HSAH3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214277; c=relaxed/simple;
	bh=dzrdC/V9hfKSduqXaxnSIK04OaPh9Ms/hShv+g+bUtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+leIdVsUuJsX92mHcQg40Q3eKjX4Ez5CI8/o86Xkxri/ANlEwG2P1bJ5pbxoheo0NXiqQb77oNRrv103ttu/fmXN5v7fqV7llW5eyjWQYQZIGPB9fT8AHmuzSpNjcVITkkVeRlUItjrqh6d2hW2JzGMhUTsUtzvGWZql0hmOYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DxxesmrU; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DxxesmrU"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4af173320f9so341903b6e.2
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786214275; x=1786819075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oc0GfmclcP67zAT/ARwTrf4zGQv32puYST7E+4xbpn8=;
        b=DxxesmrUaut/NiFBEF1oWMWI1sbb9mj7QnWp8nXTx9fuQcSOMG6gnbbDFKxawSNO4S
         455+nPuVc89VEwnD5oBM0vlEF/wbmv+eqJFP9WAhpy7XTujVIdOo/9w8AgMssX2S6gYz
         1AAw5/v28Y+N5itp2GpYegE2k37YnIJWkiLL2uI5E7KwQhhvLRlnQTUFcOMXzFjAYot/
         hzgA1wD1wQZdmHMwX785r88C++TXnSdd/DEpdrw4dfjvmuq1klw0uPU1F67ZZj8c/vPP
         vpgSwXeGRzw/Nyi73eH3ipDiEU+yUH9XSxQuNssEF2OhbeHI/TrgIPuTcqHtnbEvwhK5
         gsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214275; x=1786819075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oc0GfmclcP67zAT/ARwTrf4zGQv32puYST7E+4xbpn8=;
        b=GiMGWG2fR5aIRtBhT+MrXeGVdXTwc4wJKVz3T0b7QW4OycTqRwp6OcFHhq+8cpSNA0
         Ntq2J8j9CL3tR4GZFI7YmEOe/WcqheViNZj5XsQFzEHjG47mw3xWx96G+fdp3breasOT
         NxwvtwcEj8JNOUW0axsHflRbCZ8M6Q7p8D90+AYZptd3KGA5Aj2IBYcnqUw+7Vz4sfse
         XkxlYJlg4kFK7JnOETcuZrMi1QfxxcJ26I/uKZ8MmbnCLRhfAySt2q94tD+I66JsAeGS
         PnJ6QoA70K4f3DIuTz49ey1PhZMEx/G4Psp281z0v44Ggan/H5ioAiAo9en3E7hQlW5O
         350w==
X-Forwarded-Encrypted: i=1; AHgh+RpKXbZmns34/D+OBiOWqPTuB+Sx9w5ZHz8Knxxe/e/LvehRi9Mh8lzylEHqRu/NQOkwfoaUH9OpIjcl@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtFelrnyhzhc96+lKLU6sAeFqMAICCYf6qpbDcNIHH7Gl2hB9
	Q+j1MJbn4M21raVtz874U5PIGK8eRfkjdI9d+ZnTQlbcceWFo9d8cv7pp+QuH+XFy3U=
X-Gm-Gg: AR+sD13MvePTRFoVw5Z62fXX7ISIEsLSmiD3j54qlSdEZM3eQ6EQqV49TeaMrrLoI3y
	DGro6OU6A3WGi71zEFwg4PyA/CLyLspy4HVn5CzSvBcEFeEpDnl3Z1Lobhbrq55QGfJl5SRFIP2
	bS6dZw2FyydwTwKwI0tgk5Gzy7QjxacwAR4hkmxmdvsGpPJ8RqHp5X5AiTSbjbNG85C6dOsqIft
	uFzFFNvDtSuY5FZoPKyyUOmy3BI+B9Adwxtdrw1KGUE2i++RY0uXB2850pqJCTtdLootjJAjNHf
	6wy/LYi6QfCB8W3AwJXxFDMfhkN0HxD62WINTpmbfoOz3W8drzYOhQghWJfLtyZ1qUL59KW7iDe
	HSAI2AWjRzg4j0G45fU5alL4yWGBkBDvpkD+P4uKfShQubV0aQnDPho0tap/4zELVhVRZgaZ6rB
	3gdN+4f16rSsvuflw4LI7hVxFCBxkSmeKB3Vu2sFIO4W4LgNxgtKqrfMbhKXjnuArjxdOjnKjHM
	Il0qCX5ePb+HNQtM22v7gD7zlle3VlZ1bZHmqVVM9yekGZ0z5E=
X-Received: by 2002:a05:6808:14d3:b0:4a3:3108:8653 with SMTP id 5614622812f47-4b13326e600mr9343974b6e.9.1786214274819;
        Sat, 08 Aug 2026 11:37:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:99c2:f16e:201c:3bb5? ([2600:8803:e7e4:500:99c2:f16e:201c:3bb5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1af5e7b77sm2718840b6e.10.2026.08.08.11.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:37:54 -0700 (PDT)
Message-ID: <9c2e2c46-32de-4e8a-88c3-bfc2cfe8157c@baylibre.com>
Date: Sat, 8 Aug 2026 13:37:52 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] iio: adc: Add TI ADS126X ADC family support
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/26 10:58 PM, Kurt Borja wrote:

...

>   - @David: I added support for the monitor channels, but I prefer to
>     parse them from DT instead of making them static (similar to the
>     ad4170-4 approach too :p).

Why? Unless there really is some property that depends on how the
system is wired up, it seems like this is just making unnecessary
work for users to be able to use the monitor channels. And if someone
decided later that they do in fact want to use the monitoring channel
and it wasn't in the devicetree, sometimes it can be very difficult
to actually change the devicetree.

The monitor inputs also have many restrictions compared to a
normal input that it would be really hard to describe correctly
in the bindings without allowing things that should not actually
be allowed. (can't have excitation current or burnout, temperature
channel requires internal reference, most should be single-channel,
etc.)

> 
>   - @David: About filters... As I mentioned in the previous version, the
>     data_rate configuration takes precedence over the filter selection.
>     If an incompatible filter (given a data rate) is selected, the chip
>     resorts to a sane compatible one when doing conversions (either
>     SINC1 or plain SINC5).
> 
>     Now, I don't know how to expose this in userspace. Should I limit
>     the sampling_frequency_available attribute (given a filter)? Or
>     should it be the other way around, limit the filter_type_available
>     attribute (given a data rate)?.
 I figured that the filter type selection would be more important than
the rate so when I implemented it for ADS112C14, I made it so that
one has to pick the filter first and everything else flows from that.
(I didn't expose sampling frequency until the same time as filter type.)

The thinking behind this is that if you do care about filtering, then
you are picking filter type and sampling rate to get certain notches
and/or frequency response of the filter rather than trying to get a
faster or slower sample rate.

And the driver also allows using an hrtimer trigger to do single-shot
samples for cases where one doesn't want to sample as fast as possible
in continuous mode. This would be more useful to someone who just cares
about sample rate and not about filtering.

Just posted the series yesterday:
https://lore.kernel.org/linux-iio/20260807-iio-adc-ti-ads112c14-filter-support-v1-0-4d3ba00caf18@baylibre.com/T/#t

ADS126X seems a little less complicated in this regard though
as the same sampling rates are available for all filters with
the exception of the FIR filter having a limited subset. So I
would go with the option to limit sampling rate based on filter
type, not the other way around. If a higher rate is selected
when changing to the FIR filter type, just have it go to the
max (20 SPS).

