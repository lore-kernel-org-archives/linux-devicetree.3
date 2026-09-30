Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BCD4D98EB
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776308; cv=none; b=q46R6WTIQP6d8Gd4zPITSgHtf++tyagOb9a5lz6LY+N969ewxm60ndhJ2CW92gbIn+uRo4lQ4JMO7QiaKhwyULu1i0bn3+4iN4nS029la9PXCpYufIOARFcIjsgSFSwJNR+zyD06GjprjpkBK+/CO3q/ei3SAGFwTWudH0Hq59g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776308; c=relaxed/simple;
	bh=+IoKX1KNbarkITcQFvbLMQ1gUQCVJ7Te+5R39GBUc8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8iNu/XEuQF4R0ncWpXJq0nb0YAQEZxPha0EpZ+l77PKOH4aAJGxil2bOVHxkbdyrRxk7NhmP2O1FIPQqfX9blBkCg2xt9seIEi42eDfZR3WKQ9Db5MBNG1VkoK6Nozi3P2OB1HVBiacKEqEOuLT2QkNg5RXLfGImoK6TzoAj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEpnlQWU; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEpnlQWU"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e201b7189so112430566b.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790776289; x=1791381089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IoKX1KNbarkITcQFvbLMQ1gUQCVJ7Te+5R39GBUc8M=;
        b=UEpnlQWU19HF2YQ6+h1Givg34TXiGLbOzW1X5TAsNO+qgXzB6nlp2+YxTAQxC6ARu4
         mb6qF1MNsm+V+GYxSluqFvxyUHo8eu0yNKt73JIXRIOMkZ+EB2uYThMEFDlFO61lcsAo
         pJ44SFDQjoW6QEJIXDVzQcoTuEcupC6oRSSxbpLjvt/a9+yZbBeIL0UzzdI+TxB2FxnN
         Jem0kiPwC1pjSEjmXkgPlwKJjR8ZpCy6rVAgP+fz6TzeIOimk4wqkPq4ouXLeoVLvxa/
         SujQkiAwU+FFBJICduj0DBRHMCZ+7PP6kKnVISR4/4cTNeFgQ6bSmCeXDfS+wZZxBYXr
         BuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776289; x=1791381089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IoKX1KNbarkITcQFvbLMQ1gUQCVJ7Te+5R39GBUc8M=;
        b=Dr0V43PPWV4fXJqSytGFd6+dP0t9/Jb6bRfjDvOkp8n4TjWeXCZ6K/53os1oBUc8G/
         IBWzfU5PPa3DHqytLKVCC2idm4DyZqPkpZ/y57G5dju1LHxcZZXcAOpY2wDQWjYVNOL9
         S9sLbYs11FFLPNIoq2R8W6oLKlFM/kdaXmzlKnCcFAkLlVSe9aoZQ6zBfK5V9lA2OyAU
         79G4fbv6dQ90xbkjk1KvkI2BmHbRkz1fOUoUjCXjUEZv6evDhVIjP1e4/VvNsry+Vq/U
         NDtPPijnhBibJDOFOPPaF1IscdI020UX+Q0V58RFlFiGrAzfvuFMs01VAZcl3Il76oFR
         gSUw==
X-Forwarded-Encrypted: i=1; AKwUvBwiOR4GxN7ij2oKhQfIjrRNK81w46p5JOzQuNiNIqeqsyiUyx+9nvA+AvqxOuQdDrVyIJGo7SPxu7ka@vger.kernel.org
X-Gm-Message-State: AFuF++np9xLcSSBOl+x8pHVbZXkoz13Igo0NDi2WAylQSPjT9xRYyE/p
	HYGcEQXz7p6GFzPp2oWtN14I04XyAFw2mmUH26CTN7jFJOFGKy9nfGUe
X-Gm-Gg: AYBFou0kVKzg6xVSZpNnpenmX9oGetsFKL6vRL4UQlfPiOyV+6vuNHJ47EtsBSqiJX7
	2tdcqyuu4LHwg99LEVdvN1esE9I4rLU2gYgWxWZx+h0z0/y/ZnRFOM5co2KcwSOSpga0Dk2LELr
	3L5QJ6hKfh7Bb9Nji5MoHVnp7Mcyn939504VH12bid2mXRaEEPTQW4XoKPg2cBBDM9lo2TeFdJQ
	FrV+a+AkfImfbBY7bXXv16r4QpDUag8sCELcbLCIjuuAs28G2t2ckMkqe9Pyy8oJAjR+OxFSN3W
	3rk/Z5+8x+gFP9iCzkf2WVT31nfe6ruFEcDiGqR1EzVVWjoJN5NbgF/kF9fEfH+EDEytCcT0R0e
	Ikv+NvCCU72AgwqoqtYJgcEFyKdl1RThhKp2RMIqtXWrRLJhrp9k2Dndk4ssLVuqcgW9T63OE9h
	PSyho3Dp/ubI4GzVkZEEBlF1V1mZBaoE5DAk8erfqwACmN3kLhayb0+R5/nI6z9KBvzMYSIFI8z
	qPFeREzZL8oywgw5sptdbkdMwq2ryFIHz4=
X-Received: by 2002:a17:907:3f95:b0:c26:1648:a06c with SMTP id a640c23a62f3a-c2e23de0396mr133226666b.39.1790776289360;
        Wed, 30 Sep 2026 06:51:29 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d867ffsm5456466b.59.2026.09.30.06.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:51:28 -0700 (PDT)
Message-ID: <a57399f0-4c47-4b32-bf6a-7761d9b57320@gmail.com>
Date: Wed, 30 Sep 2026 15:51:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] iio: dac: Add AD5529R DAC driver support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marius Cristea <marius.cristea@microchip.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-spi@vger.kernel.org,
 Kent Gustavsson <nedo80@gmail.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-5-cfdf8b9f5ee3@analog.com>
 <arzTnOTaL97GudZM@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <arzTnOTaL97GudZM@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/30/26 11:17, Andy Shevchenko wrote:
> On Wed, Jul 15, 2026 at 01:41:08PM +0200, Janani Sunil wrote:
>> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
>> from Analog Devices.
>>
>> The device communicates over SPI and supports per-channel output range
>> configuration. An optional external 4.096V reference can be used in
>> place of the internal reference.
> You haven't added a given tag, why?
>
> In any case I have noticed that there are a number of (not so critical) issues
> are still exists, so I have to withdraw my tag. But please, answer the above Q.

I intentionally did not carry the Reviewed-by tag from V5, because V6 included substantial driver updates. I should have mentioned this in the cover letter, but I missed doing so.
Some of the points mentioned here have already been addressed in later revisions and are now present in Jonathan's testing branch. I will send a follow up patch for the reset of the items.

Best Regards,
Jan

