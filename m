Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023971;
	b=ukAo15G0KkDkO0Emcum9P3/lYVYLT6iQURNknyddgB4EGkRfaq6B4Rne5bMPLagTu+2g
	 6Fht49epE6FqUjelSJuCaJaYoxHUQCac4feq97GvIElHMdkBoJCtv+ChAZD0jp/mxH9jm
	 Pa9lVfIdA8ESW7IkUHfhSMTAW7u5EQEG85JYsTjZFc7dJJ3qUjdplQk0RZC9ekutBxVKR
	 mhOI6SPz4v2xYHmKSqTWv7pbirByIcvSvRej1POpUGbE+jxEFBs0jVtzTvYlCQRezPPIl
	 7wek2DXxbRoIlmSAhyXOd4aEjXpZS9KY1K6TAU5DRH7jhTW/wyMhFcBbgWBSMbbZIEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L2XfYf4aRDhCK0D/8nP9CcpLQj+vmYB3RvSR5Daz0kU=;
	b=PCUI5ZKw1dTvtaWtA5U0s9YZhjBvSyaKYa1sfJcYdbwli+idb0Jfr3tseav7vbVpL+75
	 lVF5dkjUVRXrc28gilKHH4D5P3FtLVLlmsxOfyP1i0dv0w/J+F3dehK0Jf3JYj6XinXxf
	 SnvM/BuN+5IuXnvKDljaGJE+zEEM5jAPMFtuOdQc0MtEajjGuuMzcpYaDotvya1XtBKhU
	 vXSD6TR6JpA4Xo4ORTz2t7YiGJZXg7L24Rso0GGyV/ViL6W8FAusk5jwJjc+t+W+cLrEl
	 phNpoiXCCSM7R/qIKAGBoKfs0Wxs+TI5Mi2lte54R6TatAcvgg2Beb1QvgFVkZ87bMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR5r8KXh;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C229606A337
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C229606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR5r8KXh
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1501923e87.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023968; x=1795628768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2XfYf4aRDhCK0D/8nP9CcpLQj+vmYB3RvSR5Daz0kU=;
        b=RR5r8KXhSE2XnaTGcZnPEWVBdHkc57GSBO5iTEsChMbbGlpfjF/WLPYBeVqQvaqqJw
         O1WdmlS3E96rF0JNVegFLsHZGhdGfsOb+Mlbq7rlnLyfpvcHfxOIkwDYKbhW6dvPraMw
         8c/epJ7vKKAZMKs+1BjJLl7VXb2SRFpDov72E1MpGxICeQbwvqMEMZH7JA3BHWgpep5E
         RGbQYO3BG8TtbCT1BuVK0BHweGGiEATVJXzOz+4VsGgKQDV3RvMg+WqNTT6StMtmsDKL
         9hH0mv9yTVKQBD+uxWcsHdsSt8g189vyX97EmgYX8r9EM80faeIkk0ZwpP+YBQJ+djOW
         AZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023968; x=1795628768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2XfYf4aRDhCK0D/8nP9CcpLQj+vmYB3RvSR5Daz0kU=;
        b=cjWmz5iYLGorCERqYv8KS8qVx8wu9Df6HZcL4vHRvMVdoS69J+hSgi8DXufy3QhhHe
         66Ek5I/oeG6eiHVliayI3hZi2bXAuUIQniTv94aIwcz0lzvbDq+ZcSou7A3cHkPS2Zla
         QvoiYLmSaAaUmE22WSoWU91J9KFWH/CSkj3HdfaZCWihFjmx3fRB8xsd5YUkvisYNnjh
         T54GROP4i9NYLf9eEOmyN194HYpivyIrrbgczTx/rOvDHuTpdcV2cg6x8ljeyGKKUeTk
         cwfOzbwh3tP83WrUND+5poMIMKQo7QgnYsihr1F4cTgjBl9O4zJRTYLRsVaRDtGybpvy
         scbw==
X-Forwarded-Encrypted: i=1; AL+hErFJeptRytQdOIJOCOSiUSO38mYakThBjgAD74C7jGb/M7x6+HGFpMadAF8w5OTkLlYI2ScV38uOl/yx@vger.kernel.org
X-Gm-Message-State: APuU4Z8FPFFZT0GfZnF1I0wyVALjctcd63cQEbu2z2SK/r4gdaYpeDSO
	92oFeCSBZ00PYvvyOZfMyPAcjlFgt3wHDzD5kWEWsERfAFqtpZn9Nz/8
X-Gm-Gg: AYBFou1sNNcgdt1LHGf+LOfK6wwu434/6oGtZ+qnpyHLmj4qE7BH0oCzmXrbJZ4XGKU
	wmpHVomkxB+PoyKX1zA1J6iwW9aYQvZUGkrhBPR40CG4bw7RKAEU8Ixp905y2pV3zuSlZAuQnGi
	Pa6td8XCvrTn5krszlyLPZV5M2ubA2EBS6e6VTZrDPPzYzeLbdfE7tiMxY4wPzVTFXPqM0QBo9P
	BbR04/QzL83xLDOZEr99S3pjMy1tv8IVhSd3SLzfyYbELIrAzt3RCttJ4IaYlMSz+DuZ+E8Eqek
	HOhzH3jLwgYPMJdL28woQbyKGItUEQKJ65tFO2XI84GLPiDgD8D72CmbOpX3xLWY7IRi4spzTqB
	hFC/hMY8qVBGeqYCPbeUGMh3ztEIuaWkIhz2Olu0guIMvP4eBsFG5fpBd2MxG401gNPK1oNWr6/
	hjRhH7bTIe7wzXzw1EeqcOveEcXLESCIZWrrSCEa6f/mzvuwei15++P0ZY9i+yQKovZErfOmqHR
	FPPry9/bmb7wRMiXGV5kRhAHxcsp32yfi+sWgs/zgRyCQ0aVaX8IJqRdl7lmeijmwF0zWWfYaMW
	ZCU/qxuk2THArtgvNfzIH69PR1/oL4uq2GmCPBd1d3004Teuz2ohHFQWLQyCDfUlPc6ymtBk32v
	9VW2R6ABYrA==
X-Received: by 2002:a05:6512:132a:b0:5c1:57d3:90f6 with SMTP id 2adb3069b0e04-5c1aa080adamr1181252e87.24.1795023968247;
        Wed, 18 Nov 2026 09:46:08 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa78257csm707878e87.51.2026.11.18.09.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:46:07 -0800 (PST)
Message-ID: <c6a7e6a8-42d5-4470-9206-1f8d4f1a3013@gmail.com>
Date: Wed, 18 Nov 2026 19:46:06 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: iio: Support ROHM BD79111
To: Conor Dooley <conor@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Joshua Crofts <joshua.crofts1@gmail.com>, Radu Sabau
 <radu.sabau@analog.com>, Janani Sunil <janani.sunil@analog.com>,
 Salih Erim <salih.erim@amd.com>,
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1795009599.git.mazziesaccount@gmail.com>
 <f69b996cc07fad1712871fb8b0436c71abd435b9.1795009599.git.mazziesaccount@gmail.com>
 <20261118-ancient-ominous-4f2a4a37369b@spud>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261118-ancient-ominous-4f2a4a37369b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 19:37, Conor Dooley wrote:
> On Wed, Nov 18, 2026 at 04:19:11PM +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ROHM BD79111 is very similar to the BD79112. Both are ADC/GPIO devices,
>> where pins can be configured to be either used as GPIO or ADC inputs.
>> ADCs are 12-bit SAR ADCs and GPIOs support input/output but not being IRQ
>> sources.
>>
>> The main difference is amount of channels/GPIOs. The BD79112 has 32 pins
>> for this use, the BD79111 has 16. Furthermore, the BD79111 data-sheet
>> promises 0.5 MSPS sample rate with maximum of 10 MHz SPI clock,  whereas
>> the BD79112 data-sheet mentioned 1MSPS rate with maximum of 20 MHz SPI
>> clock.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>>
>> Note, I had to change the 'root-level' additionalProperties: false to
>> unevaluatedProperties: false in order to allow the properties in the new
>> allOf:
>>    - if:
>>       ...
>>
>> section. It seems to me this is what a few other bindings in IIO do, but
>> I suppose it makes this "less strict". Well, since I am terrible with
>> writing bindings, I'd better point this out and ask if it's ok, or if
>> there are better way(s) to handle this?
> 
> I don't think you should have to do that though, since the children are
> described in the same file.
> If you instead retained the pattern properties section, and lowered the
> restriction to channel@<any number> with reg with the max of 31 and in
> the conditional section constrained reg to a max of 16 does it work

Ah. I think it will, thanks for the help! I'll do that in v2. I'll just 
wait for a while to see what other comments I may collect :)

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
