Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176104;
	b=b3fjBeML9uOOc2lq9yUxoCHRsWJIl/JUWVp5JU0a3CD576PD8XdiNHXma7dyXgxtck+7
	 8X56pWh8VON3JiGP+srf1msPADcr4r0g+ZAoTnaaYgEdLRhMZQZQEqgDLaWf8Sd/LRb83
	 Zmf4EBTw0KuPYG73ZjbGRjpDY50XoTaIfFvj3Dlf3bD9BpqxTT5M36www0IYhOk3hcyd3
	 Bu9/VtimcIRjYR31ekhoFkyN/h+tURo72eNUiKjpnPvBZTyPJ0mHjx4FYzhePLsLE5Ti+
	 /TzKSnLzIKM0YQw1VW97cDwWjpD2CUHPrSw0ue7ePRd/N0rajj2LHYOBtes+Jx2exoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MAU1alsnTI2aWDlPsrvvBfpXKOIn933Znnm/A0R9ZLc=;
	b=PveGqlpozcx0sHBFJypwx8sChvZ40YhALig7eKuxOTVFFyFPlEXDQeIiuB35yFvshM48
	 h9/yCW8ZirQT3w5hSDnMIROA1+DUDJhfJGNWrVCvj9QYwgnMatJxSOYl6HZHIopK5VoNQ
	 r8UKH7mo6FY0fgwupu+qyL6LLfofOVtDzJzhg+rdRhwc8Wz+1Osd+nuT/3ENaNhQrA37o
	 8D5zUxUki91vtBTKOaaTLxgeRVYUptum4ZvnFKgrqHRVcJ0fDTWxEGXZogDqe26vJ1Wlh
	 Zk5TZXLj/Z18zbnZdAlrEUd34uI0GrdJ58tGwTXHVFk3slpNm4m6LJRzQBMsZfAVbvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsVfFHBz;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAFA606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CAFA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsVfFHBz
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acd239776cso5995391fa.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176101; x=1795780901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAU1alsnTI2aWDlPsrvvBfpXKOIn933Znnm/A0R9ZLc=;
        b=BsVfFHBzdir5k0WfQJg7M2TKjqOQlCznxkryG6RC+SXvakiGG3qoADnIipX3jLyW3k
         wYG+y/NBBdMX7kMd57swLmjdawwqSMGbYRqAe+IGN/evNX/aTFynUaG+PB34OtUMFiGG
         fI3PzFc8pGoQH+NgdxjfD1mkOKTPDCdddPvvdg9i3r6bTEs9TLK2BxJuEKY39pnYJn6C
         hSefyInd50J2VDe7NfW9nHWMRncvyeKq6xhMHdCbQEmoAib+YaU2jRy0suhdEUKel2dr
         h5GfuVwNBone6cywL7EKfYtsY62ftNf5C9ySC51aplwfsocKVSUaZKP3V7thbyINLeq9
         P8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176101; x=1795780901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAU1alsnTI2aWDlPsrvvBfpXKOIn933Znnm/A0R9ZLc=;
        b=ZQEdXi1AQXYro2MOqWaVTl0hEsmOaWC1bONGxslZnfs2lapfg0VCNe6JBtYcUpTKMA
         x9OAkKysLL0xj0XZIm1BG6LJmkxGTekje/Ya8nph/F+6XOpvXz6BlxKA1SaqXHflo1b8
         XvYWnj8SnZwZ77T1ECrubISmORIQMhGh2TXubfk2KxmZKLq3jFGJnZOEi/lX8qVMqhtV
         Zhji3+E12oKs+16aHneb3JyonaSvm5IUCJKrsq+JWOF/TQvrEZVVM/f26d6w4QxUkHi4
         28FX5zXf80sZUgZLHCgknSbs+WbE3X6m6KsW3i74l8lHfW+wM50AN/UMqP6QvKuEchlg
         dYlg==
X-Forwarded-Encrypted: i=1; AL+hErGWTahaeBwY+Bp6Uhp3J8wArXCjd4EOh8ADEGGTzSvZmzymv6zcvOza35uuqgNe5Cxx0uJIABM5XFYE@vger.kernel.org
X-Gm-Message-State: APuU4Z8QTpK3syrhQimJNTlmNrDWUNElJyvlRdsVjia6NADR3DSof75q
	eP21SwERwAi8FJ0DQ2/3KwrN5hnkfgImXN5CFMNlgRnn+29XVHi4SivNmaJK+O6I
X-Gm-Gg: AZFdTZe6KbF1xvj5q6Le3BRuncN6Xn2jIuesGcW/oDZLwH8NSiZjJwJjR8WW/R5+bVN
	wyEOOI/n4QlGFiUrUzjqRgK41gc4sILjqwSD5CPGFXb0GgfPpIQcTKV/sDb2weKdmYTQO4oe9aM
	ZeB6C05fZ2bUtWgYUX71YNxhIyDIaSLcpvEhxnxwUS8/XnECGqz3O3ihMBbg4Z611GBQIQKQaiv
	RMYE/g67517VZTimT9oEcwYvZjFP3k25IscOx2dKNwsRUF2pr8WUiWovxyZs8cQbvOOE5OskM8S
	t/qxC6dq6nk9yUkv9XOx1joUsALxlQhIx20BZyHxU9A+9gRqXQYblU70pqb8zlXJ3Gwvl+bK/Ok
	q49M2SZlAvPw8AJSJVIpA7YL89CGmzOuHmj+EbmCX5HLT9F8uZ3YbuOmUBMpgUyX3AJKdnY69WF
	IHHtTqB49DEVBbofQEoljQ4MvOd5wMlnya4AVQaxg9b4Yq/330BvSaJp2h/KCkwsBm7xzX51ClA
	J4EKY94mOvToCmh8l13JFM36OX1qp/CA03ZrxUuN98wOUY/sKheEEj/q2r5N5hvxiMDYHefjkJp
	oFuufkVXrTMJier0IBbvzsrHD6r3w188wq5dLONsECQdvDfUkgFn0WYrjneJB+WHjFZM8CgPkEv
	o+8TrIj/I2tQ80oKC9qigIJ/pRZdT19M=
X-Received: by 2002:a2e:be8d:0:b0:3a6:6f81:1027 with SMTP id 38308e7fff4ca-3ae7fa94f03mr8379171fa.24.1795176099614;
        Fri, 20 Nov 2026 04:01:39 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055cf80sm6924401fa.36.2026.11.20.04.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:01:37 -0800 (PST)
Message-ID: <bf0dd82b-e1a5-4ab9-9ab7-1641181d303f@gmail.com>
Date: Fri, 20 Nov 2026 14:01:36 +0200
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
> without the unevaluatedProperties change? We typically want properties
> defined at the top level and constrained in conditional sections anyway.

Gah. Either I don't know how to do this properly (which is likely), or 
there is a slight caveat. When I tried to do what you suggest, the 
binding allowed channel@X, where the <X> was is out of the range. Sure 
thing this was caught by 'reg' being out of the range, but it still 
allowed odd combination of

channel@X, reg = <Y>, if Y was in accepted range.

I suppose the 'X' and 'Y' in previous example are expected to always be 
the same, but I would still like to catch this type of an error.

I am about to spin v2 where I use the BD79112 limits (channels 0 to 31 
allowed) in the pattern properties, and then do:

"^channel@(1[6-9]|2[0-9]|3[01])$": false
to exclude 16 - 31 from the BD79111.

I am not super happy with it, but it seems to work and is still decently 
understandable even for someone yaml -illiterate like myself. :/ (At 
least for as long as we only have ICs which don't increase the amount of 
default channels. That might cause the exclusion regexp on other ICs to 
become ridiculously long or hard to read. Well, I don't have such ICs on 
sight for now.)

Well, let's see what people think of it :)

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
