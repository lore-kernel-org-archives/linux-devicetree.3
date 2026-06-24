Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AE43BCD3D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310685; cv=none; b=VhPS5etEagY+2IFk96PPYztg8zTrA2nc2jmCLcYLuaaWd+x1yo9zvcIfi+WP1lFtowASBCDzSDQMxI0aMOEOcvqHlSdMp6r7z4hohzHeZRMKAuKZxaNe3yfzCaUcNlODtwj0kCjRo8wHElD26rtfd8MwlyhZ5k0npnti+NyjbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310685; c=relaxed/simple;
	bh=XwINuM2d9r43k4pENtoklLvyYqq1bsSLEQaX73tWHzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppsQSujczsqOe12ZymLbqKQq0oA2drUlslo5uVaIxM9Ej5mizfmB4I3lSyLGqbRth8HrN9qTTPpxrCO4W/vwNnEfRX2bPrN00vpuINcQ8eTCoIzcMSmFA4axUHCmMPRbAWvKDoOczUacb5bKsCRbjz7vkqPofDbm8/v9UwI3zlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Fb/UZ/8X; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Fb/UZ/8X"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e6d2f297f4so623878a34.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782310683; x=1782915483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+rebP8UcTIOnkK9eOy9m0DatNhwkLGwqp1CZQ/L0Yg=;
        b=Fb/UZ/8X77WVJhHFR886hE3lfLHXT62B32x8VQ5+341CCcr18HxQ+2HmQDBHlw1GCN
         2r+2lnri0fEmJJR42BspVn7F2aYJtd010DLGObMUoTPKvIFbdWCU9cRRkzzegsBx7EIR
         1pedfH2Q465wm7WtOFMkmC3rOklQMXabu8765rl6IjMGI3tRCnR3WyxgvHJVgJeVrZmN
         RDF2WlvWyHJrh9uOK/YfhPIplxVgzitCo7V5sIiPzkxho8Y8VcgRymV4LOcwqXwBkJmM
         ZfAO7Av+ficeBoW4Ncll18M2p83yrlvxMeff2/yY8yJiTkSJpMlw3Hr3kq/FffLKjNYx
         7MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310683; x=1782915483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+rebP8UcTIOnkK9eOy9m0DatNhwkLGwqp1CZQ/L0Yg=;
        b=XaNqBl9S1vB5yhemXPNz8aqXNRnoz0IEBoFS9C5XtLZAKUv5GPppMV6vGuq/RZb/BP
         lsH6gZUS13vuleEUHLamdD2kud5MgP40/0VejzjmPHN2CWegvHwRDFovsxnzODqdhb8e
         U8LPjXiNNmeL5aSna5BfkE1DLqPrkrLmSLRi+7vZmwD6jhT3YII9xBLu5QLrQ3Iw2z87
         PZbzy+s7q0yRzuZ0o7rOJ81N69VZumM1yLv0ikSldgcUWm4yYkFPLmpA8fVpA06M16pI
         nyPVeDrNLmX+9y3t+O0kcVclAHmwSk/r8t3SIWrE/2/Udf21CjTf5Vzv+ZcEzpz14h31
         FzbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/92RBpuChh3BqGcx2GDleKwNJHdjYrOEj1qGXfuifIgbWxn+F4ie4+wWlJwjTNppzwPG67Pt/9OUjz@vger.kernel.org
X-Gm-Message-State: AOJu0YyqBczaTl3teBltXVNbq11c4gDGpfVKn+ynR74UrLfiDgEe4RpW
	ZVTxxLAJNw8NGPcQh0W4bYA9UpzEy4BfQglRyokbIGyWsy/UOaL9LEbW3dHBnKelYLE=
X-Gm-Gg: AfdE7ckD3Sm7vdJRR0MPIRt97f6pFAUbRkLNdfCCGfm2fYrd0p9M3/W5+LPU06BEkaU
	TiWQrpSKXloGFO2/1feQZtlP3CT5ug3cb6ts3lt+FU35cYOo2GeToYy9YRk5h+xf3lObO1dE8nD
	X6GWT41k9goKpivgP4dTTpElNHoesUe5TWsMB840zV+7OBp3W1S38qrQzX6trbsibDJphxDqgXt
	w9CjJkjxzNo853dtwT18wa8b/S6EH5qW+h4UsrcucnXVjb0wMwLr858Ee/zPg1Cp8fH5njWWG/2
	YjWB4HdiCNvFfgmhx26PSVUdluUCwQVKrw0yl8HxYdoXM2/meN2sff+hsL7ZHuFfhcRao403Cuv
	oObb7+FT4EfuYvgr0L5SEPmkg1efHUFZus2sEZ6uLdionHzfjvLfldS+ZOf1MhawrJJaR/c9AJc
	jCwq5+/RaFRrPosS+CD44sxKzhxBSFTzhPdXh3KmMvvqq3KsxvaxKICR/ZCNiZXF2W5nGk0Q16n
	A==
X-Received: by 2002:a05:6830:210a:b0:7e6:deb1:484d with SMTP id 46e09a7af769-7e986a90b58mr2661944a34.13.1782310683152;
        Wed, 24 Jun 2026 07:18:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:68dc:b788:b3ac:e34e? ([2600:8803:e7e4:500:68dc:b788:b3ac:e34e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e944068feesm10965181a34.11.2026.06.24.07.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:18:02 -0700 (PDT)
Message-ID: <c64ed5e8-90b2-4898-b218-b1e41382765d@baylibre.com>
Date: Wed, 24 Jun 2026 09:18:00 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: dac: dac8163: Add driver for DAC8163
To: Lukas <lukas.metz@gmx.net>, Siratul Islam <siratul.islam@linux.dev>
Cc: andy@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 jic23@kernel.org, krzk+dt@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, nuno.sa@analog.com, robh@kernel.org
References: <20260623-dac8163-work-v1-0-5b508158faa0@gmx.net>
 <20260623-dac8163-work-v1-1-5b508158faa0@gmx.net>
 <36ffe80feb5a521c28b1a6d10bf1338dc39ddef1.camel@linux.dev>
 <ajuVjk-lw-DqUVnl@berta-MS-7693>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <ajuVjk-lw-DqUVnl@berta-MS-7693>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/26 3:30 AM, Lukas wrote:
> Thanks for the review. As i said this is my first time submitting a
> patch. I have looked at already existing spi dac drivers for reference
> but i seemed to have missed quite a lot. But the comments are greatly
> appreciated.
> 
> On Wed, Jun 24, 2026 at 12:56:15AM +0600, Siratul Islam wrote:
>> A link to the datasheet here would be nice.
> 
> I will try to add all the small suggestions i dont mention explicitly,
> like style issues or using guard instead of manual lock/unlock to v2.
> 
>>> +
>>> +	if (st->internal_ref) {
>>> +		st->vref_uv = 2500000; /* 2.5V internal reference */
>> A note on where this value came from or why this was chosen, or a reference to datasheet would be better.
> 
> I think i would add the suggestion from David Lechner to remove the
> internal_ref property completly and add "the way of doing optional
> voltage references". This includes using the macro
> DAC8163_INTERNAL_REF_mV. Would this be acceptable?
> 
>> You have a CMD_SOFT_RST defined but not used. Should this be used to reset before doing any configuration?
> 
> Yes this is a command which isnt used at this point. But maybe it makes
> sense to reset the DAC first when probing.

In general we tend to reset IIO devices during probe. DACs can be an exception
though since they are output devices and resetting it could change the output.
This device is quite simple anyway, so reset probably isn't needed.

> 
> Best regards
> Lukas

