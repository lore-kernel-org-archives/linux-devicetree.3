Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8EA23372C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878658; cv=none; b=l5Wkjd0F69fpDpdBbBUtSoJifqgn8+pGdYtgJd3r37ml+0P0roOvwMsKa6mlI/X9BryyOSGqeSBRqIvxWqSW+J9QOWaDFBlntQQNa2Mn45d/4gSY72ri611hFiEh5tQTR+9yh740rQptY1bzuOWghkJAPt7jggJGLt/pooPotHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878658; c=relaxed/simple;
	bh=3I5w7PUD8xXxUELwWNDPP6mAWT64QdkiV9GNcO/XBLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ET9boWADVQI9h3VzB3xHW65kMXa68C1YCjYZygNi6O5ycImntZW2YKiaSJbC8VRThIX4cygZXuxT3SlwpbpbQY+IeMl9ficz7p5vciZuxDF0OZQPM6H/GQ8T2qw9tpOf+EID6Ud5u6OducwNqyHczd0BuFKzOesUxQU9IBc1xSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mkHsu1MX; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mkHsu1MX"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6e9408e30so1978640a34.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781878655; x=1782483455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Ri3Du5mr4CihtoWPG+kzBAY1WB2KTuSyTj6curlvV8=;
        b=mkHsu1MXUa4yNxUjCo6oK9wgcqHWiByZAjx0w0IQSyYQgx5FXTPzzKDcEt6zu1ZpXJ
         aa01y6jIsoPq2ml1G2l5PAC2m+unjzLhPU5VAdL+4Pg5A1ftT7uQYB8ydMmcvRQbV0/r
         xawpD/Shc3OnBoPN/3dINDzTvJp+1HaontBXpUixvb0kriDM+G+LGAKmPYnxdzo6rjdi
         1RhWXMK3Q8SQlXxr4cTBvIjMhMtfWPxNE5KaqQ9Mye4i2htU71V8RguBXhCF7Y+/RR7B
         nVpc2a6VN0/4+062XK9NaTEaklCANvXBzMMGTg+3vGNGHdGEVaL/GYOf0mh8Nw1+RFRK
         6b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878655; x=1782483455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ri3Du5mr4CihtoWPG+kzBAY1WB2KTuSyTj6curlvV8=;
        b=AFBwkLB8amTTi/ySdFa1TLSkZDXDxI7g9SRe6fQLivKVWJbH4CP/QshqbyxrKNmOvi
         oEDPIYBmqQs0CGEkWUHentvFh/tDhIk+8kohbAyDyHi3HvZdSY2A6FTZypnxTb1Os48T
         y4wgNkucoRz5WtCbZ6+mi2JLzFr6AZm2i1NiFa49HYLDew0sfpi1X7EAzQ638onvU/q/
         xoddGJFBizTQGOdvG621L0SdXjF7wF8kGRCP0YyPbRbYg4piDsTNEakzki3H9b3G96ro
         no2FEar/8Kmn3Z77SQvfRgSDkJU6XVDq2ADK83nH8LfApjR/SEsCk2tcG4Ee3q4ffJkh
         kHPg==
X-Forwarded-Encrypted: i=1; AFNElJ/21KbFFQd1DtUyi1JX5NtHDph1oeyWz9Jnco8+XKvYQX2lMzR1SKMhfN4eAPcpXC9FEnHKik2/ICcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPpJevDKJGY35uZWaG/G6zPFjBjVD2DF1JS7eltddWOh9S4BT
	ZSw8Y7noj5xNm8IUJWaNiELja3Mw/l9FXgYTvFbnNcIm1vT2gW5kJ9L3wAgHbmNPt1c=
X-Gm-Gg: AfdE7cnM9MfeQI7AYHBT8r8mhjq6lJvhHJ7xhLbd6fzK1UChtV73PlbDUUdauMpAtvt
	CLDraqI6mqj15c/RSVflxB8wLsNf/PYSxL84454dt1Al7+Bl0vlDBrQzcwIocp/nZSk82ODTE+Y
	oW6YowwNv7HkAtrkw931SH6FesS+E8c3OSKqNXpe99REKMbhNoUS0F3Uc6rfsLzk3SKJvZkcxeS
	b6CMjknC7CaIWK5jk7H82Z03qEedooD8UhyCZeLeObECYjK7UvetFwn2xuFkrLac59TkIJ/CFjd
	NkdojnFVDoXUAl0U7E0WbRUgo8ZrFDY1Q5DuX/gc/vHuXTCcYQrdn5//c3jkl7qnJrpHrAFRPcp
	AjZmlzw4YiyX2QTxPam8tiC4NpSRhNtTxi3DmxZKUHnj357Y7nVT65DycgemxGgXqVA0fMtOzG3
	BGc3ggMVh64wjYc6e3UWjM0EbnEWv+uOT95+9sHrcJF1QldcYw2Ov/a0ct3Q==
X-Received: by 2002:a05:6830:2789:b0:7dc:cd0b:58bc with SMTP id 46e09a7af769-7e92d839d2fmr2946067a34.7.1781878655500;
        Fri, 19 Jun 2026 07:17:35 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:dd8:d93b:3cde:c07? ([2600:8803:e7e4:500:dd8:d93b:3cde:c07])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e92ec7f08esm1847945a34.13.2026.06.19.07.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:17:35 -0700 (PDT)
Message-ID: <1dd07840-9a52-4f9c-8e4b-476232d2d4c2@baylibre.com>
Date: Fri, 19 Jun 2026 09:17:34 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/5] iio: buffer: Extend DMAengine buffer
 interfaces to take extra sysfs attributes
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 nuno.sa@analog.com, Michael.Hennerich@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 pop.ioan-daniel@analog.com
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <a09f2cac2d26fe385f1f7790b0db64b7d9953ac6.1781661028.git.marcelo.schmitt@analog.com>
 <3b96ec10-b022-4135-9ade-6fd9eb6e78a6@baylibre.com> <ajPJdoTgpw7Ndczh@nsa>
 <ajVKzNgGzoueI1lW@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <ajVKzNgGzoueI1lW@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/19/26 8:57 AM, Marcelo Schmitt wrote:
> On 06/18, Nuno Sá wrote:
>> On Wed, Jun 17, 2026 at 04:43:18PM -0500, David Lechner wrote:
>>> On 6/16/26 9:03 PM, Marcelo Schmitt wrote:
>>>> Some devices using DMAengine buffers are connected to extra hardware that
>>>> allows setting how fast data is transferred to/from the buffer. However,
>>>> those extra pieces of harwdware are external to the sensor chip such that
>>>> supporting the transfer speed as a sensor property is a bit of an
>>>> inaccuracy. Expand IIO DMAengine buffer interfaces to take arguments for
>>>> extra sysfs attributes, enabling the transfer speed to be configured
>>>> through the buffer interface.
>>>
>>> This message is a bit confusing. It sounds like it is attempting to
>>> control something about the DMA controller itself. But based on the
>>> later patches, it looks like this is just so we can add arbitrary
>>> sysfs attributes to the bufferX directory. And in this specific case,
>>> a sampling_frequency attribute.
>>
>> Agreed. Seems like rate control comes from the buffer.
> 
> For this series, that was the actual result. Since we already have extra
> sysfs attributes for kfifo and for triggered buffers, I thought of trying it
> wish DMAengine buffers as well. The intent is to decouple the sampling frequency
> sysfs attributes (which depend on SPI offload and PWM availability) from the ADC
> IIO device. And the reason for that is to avoid making the device driver
> directly select SPI_OFFLOAD and/or depend on PWM because these devices can be
> used without offloading.
> 
Selecting SPI_OFFLOAD when it isn't needed isn't a big deal IMHO, it just isn't
very much code at all. And PWM is quite common for fans and backlights, so it
seems like it would be rare to have a system that didn't have PWM enabled for
something else already. So it just seems like extra work to me to try to make
things optional when it may never be needed in practice.
