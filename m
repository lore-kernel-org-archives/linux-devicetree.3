Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262090;
	b=Gq7g9JZUja89eveAQuF4jZT1vDnoRWXKIS0Ni5X1LWfargN8GuEukQaLGVcJSI6moTaK
	 gfNBS4X/tkNOUhdvBoHHYDd86zvJraYNWMaXhv8rEqOdel3h9w8M8vnCPnyWN6REGxkGP
	 sJFGNQp/5NWuQe3dA6IKYlJhWkEcGR7X3VbaeGcat1MPWwrm05cP2fuQP6+kR2KwyZOBB
	 uq0JFNs2OQUxsiIGo14c/aMCHIWinUbVSmxVvllqmOjQ7vQPevHtyiSwb9CqV5gLtiXx7
	 zV4o6Sd9p3TiBQ+HJ+UvvyiBZQUOMH6WqiySIkL5dUOrcLt0uF8zc/HvI+/UxPPlOGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
	b=rDTvL7EGf9qNE0UASaktj5ig72yh9sffRuweaNVEwgqoKqShq7F2eU+ZakocxaZC7xnn
	 vzdPNx+Nvb6aRnjVue/Yym5TqBWQZtNPpvx0foQ5uDjnGeVpaF7TugtM5OkdTQM+EaJxv
	 +yV4LbUIBeiHU21M0dY5XRyKhk8+T3NHD/tgyCi7sNmm84o6zU/GOAADAA2aZ3fy//Ij2
	 uHKIHZKd3/EG94LplIkhUPRcGBmdVPZMHjc16JArqA9959k7jqRzMpQHVhUcgEwZ9IPsX
	 gW9RrB2+JCnQ8LoI4pjRblR5WSpDafjHstbWJf/HTRlUIxXzK914MwgJy1Ll0StkvIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6l+kx5d;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BAC606A325
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 11:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BAC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6l+kx5d
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15031695e9.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262089; x=1795866889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
        b=W6l+kx5dMX2mdJt7T6QMcJ0hI8ZEeVOKDih7eGXKn9qesUeVUO7ThUMVP1kKGuXcft
         VK7V+W6z5oRF9qG3c7Wjxb/2O6i0YdvIXxAaIz9bPP/J0V506KHJefwQgHgob+tHIwAF
         CiMiwsOGnYflWizEn8hD11X7/1dzTgSfKYa0shHOJaOclRQQOQDnsazObS2sNUv+Ab5v
         yg9vk2JQ8X19FlI0CraWD40SuQic4MS3t57KPYNuWhCfYbkJ+4W1zglAXSZQwx+xgxlm
         4fLPgZyDLm+UgTBpoKfSSkt9GZQ1sZHr11Bhyy6p328gfI9XPo1n8y6mn3y2zSLtdDkT
         03ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262089; x=1795866889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
        b=mvo+7UlWD4SsvpAwCtISor+nZyAl6dKlK2tG+YpCXiGyNvzY/zF+YFQTS5gGoUbsD7
         4XcwT9ttGQP9UFXf4DZd3OgcX8IWXogKLGrxXJU1RdI9zshpi0Ip7Wh3P57NSS5zBcg1
         rjptXpQKO02GAP9KcPHqqygaMsgLMfiEKlV5Ds4RHPvhgbW7dadkTPlzlGTqkuGivjFH
         WSDS8imrHkp/zmt+dlwUpQma+PsXNKytH5HUGjzGL+oQ+pmkzeUHaYtwr+IwF8LA2B27
         tAsR4v3KwaeEdK3dbfPgmccyIFnvXSlWvj4XuM5KAJmYnuUzRgX6RWG/02x76OOqQoRJ
         GzEQ==
X-Forwarded-Encrypted: i=1; AL+hErE7zCs8XKpvC3RVnIA/z06qUSoRP6GRsAPVIZXLNGhrC1IwUXwX8n+pCyAQBXVZcZk7sZGvTexZo79u@vger.kernel.org
X-Gm-Message-State: APuU4Z8e9gcu/fHtxASPzaaZBPMVrpP8pg6T9HTbdK6uib6lKLqVHud/
	KWLMCC+WD7cgIM9/mVPD4hElZzR+ksXyRH0KW0IJhME5bYZ/Prf8hn6x
X-Gm-Gg: AZFdTZcn/zX9hS/2l426HhuabIctRlc74QQtU6LW0NZXG+bPHx+V9AXfsw2jGnG2V3h
	Ov3hcL/FsCLAZwRURAAsaaW2VHoULU9te2Dh0/ev8A4UH0/YYIYHH34VFFhys43K5t+1SRVQrpG
	LJEaN8/Z4pqcZCPKUiYa53iujfa4Jh0WktguIUYVrRuua+Gwv+HJvQ3+hymgdr2fmyzRAJf9eXq
	uJB9tWIZQjfwqXzX8OCBw2WPde9pDc+mxE2ip47zNasqYnPxF1zFZK7dj9aqzEo6/h3f74mdK52
	xJWfc5K3/JIdyRgFrecrvvvmIqUFKJMXHZtlTDPNreTV85rStVEQgsh3rCqt8r/Doe4D+s/VH6D
	GOe09P0x5wZIWQicFxdBRzt4FPOpBFoFRZaMk0DC/txyDwB/diek1G0r9Plfu1Kw+bsB2wQMGvI
	p31mAFE6kV1RR1SZV398zdDnsIl05fHJVveWXm1SfxuNChqGKEg2/JImGzVzC8/Zjo/W84ewd/V
	0rY9i5Puz2Mfs9Wstf3n4c/hLXTLbL0GMtUFkrIIpw6Ii2BpBvaC1t/Vy0OhxhLImHwi+BZVmgO
	UO26jrBpXnsPB6Dy4YjsGRb+7UAOYd9AQ2QC892TgIaTPH8G+2wmTzRl6Wdk2I5tlPwC
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr136119295e9.13.1795262088516;
        Sat, 21 Nov 2026 03:54:48 -0800 (PST)
Received: from [10.50.139.243] ([23.90.153.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm42471545e9.1.2026.11.21.03.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:54:47 -0800 (PST)
Message-ID: <7b96eb55-d357-4289-85ff-c0eaab53e8c5@gmail.com>
Date: Sat, 21 Nov 2026 12:54:46 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] clk: Add gpio-enabled clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
 <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.2026 17:07, Jerome Brunet wrote:

> This comment has been carried since v5, where the reasoning was already
> answered: returning an error from .prepare()/.enable() when the clock isn't
> running is simply how a provider reports failure, not a workaround for the
> framework. The claim is also wrong: the framework does call .is_prepared()
> (clk_unprepare_unused_subtree(), clk_hw_is_prepared()). The rest describes return
> conventions. Something like this would be enough:
> 
> 	/* The clock cannot be turned on, only waited for. */
> 

Perhaps the claim is not clear enough then, the .is_prepared() is not 
called _before_ prepare. I didn't mean it's not called at all.

>> +static int clk_gpio_enabled_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
>> +	int value = 0;
>> +
>> +	readx_poll_timeout_atomic(gpiod_get_value, clk->gpiod, value,
>> +			value != 0, 10, clk->timeout_us);
> 
> Same error handling as in the prepare variant above.
> 
> Also looking at it more closely, the binding allow 1ms max. It is lot of
> time holding a spinlock without IRQ. If you don't stricly need this variant
> please drop it for now.
> 
> 
>> +
>> +	device_property_read_u32(dev, "poll-timeout-us", &timeout_us);
>> +	if (timeout_us < GPIO_ENABLED_TIMEOUT_MIN ||
>> +	    timeout_us > GPIO_ENABLED_TIMEOUT_MAX)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "poll-timeout-us is out of range [%u, %u]\n",
>> +				     GPIO_ENABLED_TIMEOUT_MIN,
>> +				     GPIO_ENABLED_TIMEOUT_MAX);
>> +	clk->timeout_us = timeout_us;
>> +
>> +	if (gpiod_cansleep(clk->gpiod))
>> +		ops = &clk_gpio_enabled_sleeping_ops;
>> +	else
>> +		ops = &clk_gpio_enabled_ops;
> 
> As I noted above, I prefer if you dropped the enabled variant that run with
> irq off, unless you scrictly need it. Return -ENOTSUPP if the gpio can't sleep.

I would rather keep only 1 variant in general, because my GPIO 
controller can't sleep, but gpiod_get_value_cansleep works for both type 
of controllers.

Slava
