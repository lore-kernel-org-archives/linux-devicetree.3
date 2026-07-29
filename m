Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE203FB7E0
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361205; cv=none; b=DGNtSDYaQDNYNUPej8VAUMfWVj2orHjFkp+rahi9ukYTQOq8swIGOORI6Wmz7svpM8fY99+B40aHVi2UTsZzgVGM5RE6or6zB+KMm9oXRD0IJuZOCq+8/0DEXyfwK4PA3kvGjJTtDWxo2rr4Dpf5dw+pzV0PiHYZvjlkSuu1+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361205; c=relaxed/simple;
	bh=9DCe5l+RMdzIky2GyIi+0Ksfo59MslthuX/VTCcR/ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAT2amjN/IOFxnDQPqsQ3g7ve16kB7BrwkiT2Nm72PbQujmjT7vJJ6/v9FrQoGocyh0vM5ZS85aNGn0mIwg3B+116z4h4UQhRPXGHJbrCKYhV6mmpjEENo0nN0tSplZVUzP0BaYtnEder7NofwWATzPreDyuQ7fGQYHjheFi9nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T2OrQg2c; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T2OrQg2c"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4518ad44e83so979913fac.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785361202; x=1785966002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1c9/5KPmcV+l1Jp7+hRXQDRlqBfhfCFzAoiMmQn8lR8=;
        b=T2OrQg2cE7xcQxnI0O4BydHj8yXfMQevniBTqiz965PkVMdnFKMb+3sBx5ZgFyllBH
         j/sMG0RimQrlBz9mrda+IWe7NTgyXKlWXT1EMLCbqIu+EvwdjDR4VLJRTzrCwoLwxpQN
         MaHbzeD1VdIjWnOgffDAgc64hYYBoQPqMOOa3mVtdicT8zHvNGRyzzTROP1XYlk0pFmc
         vmiKaTLmzgAK2tShCMxctpNUtQYqtWdq/vOCeB7lnEvdo4CPhhfUmK06sp0Y3J2Wyrke
         In51x6GHtD/J4N4FmVCgLHZfyix8CCUD3T47XMXivhCATBaFuWWwABjkfi4mJwLH9kB+
         bx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361202; x=1785966002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1c9/5KPmcV+l1Jp7+hRXQDRlqBfhfCFzAoiMmQn8lR8=;
        b=fEaBGLjhgxuwgluj9G51KkKCBBLoItwzC8YOsijvjG4Wm7l1gE9WyiGlBVZ3ZlDKSt
         PmHl3IDnK1pHRjYzEXtyKIEORQbUs+dJm+Ntq5cgVlJ3Ths2bsmu3Urr++OftuCBnBse
         iZp5cMsRfLqH7yukQOgmjfv8IZobPr188mMc8FLtbaNZsrMr+sLduWRCHil1b08KAS9Y
         D+6EQcofv1NNS8wPXEJWGGi3PZab5CZNKF3imPOJ2mSKkD3W7805m2s0ez8xLaGpBgVs
         TQN62xMRvWrojX9k7I+YjANGGlbK/jCVtvmEl69Pv0mwZdlijY+wa3twhTTiiaqktNwE
         ct3g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8t9k1kYZGv1DHxBe4oX9rFe91yZCr8q4IsSGucSbdHJpD7wTa6skO88a0iVyqjhDyVd84aOp6/f5T@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPUriwWNHI9f2dXL81BXdhTRynD5Qdix07XZT+kPYuHJyAZwx
	JD+wuwEsaB0SXKRL/WFAy261gNGsv0rmNZg3j8gNmzLiWemmiXngBY2jxd5CeI83K14=
X-Gm-Gg: AR+sD131cXxclYuoVjk5HU8FERfiFjpRRHQzamcJ2gBMGvsy9PHtJ48YtAQVsiderf4
	H3PAFnyq4sF3Htb4OgWPydjgGv73XjpPr0VY4Ov8F1N2idUiYNJaseBLE4egQTNfz5Y0slXnUV+
	edHOtCO20/idE0bu5MBkMIxFUdM+/NeEhrbI/KqU7XLLgQu99PHETx7z/hk9MW9JiGsOCxY0fEA
	Qx5VYciz6tA3PbE5tzq2ETgdOElF8zXkAJJuPU7vwpg+hupQ67OpcmRQSEyotaTMr7vAoW2XErx
	Eso71ywo9E1ntYTCRbIJTJKq0yHV0l8pWP4S/iNI9fGntN+aQmqkB4rSkbJ8+g3IxC0Cr8vg0tL
	9E4zutzarOxT7Z+Py+7p6CVf5wiPPyIfvx6PhNmQnWejqdBPW5Lrvgf30RiW8KlNLLs3w9O286W
	lcc2ROlK4Sr8mHMlgJwRO2XYrzwQEUqZrnjpGrde5S3U/vtveEL1gusClVR2nh3kuLsWlBK/xpL
	ehqjoibauLd4//b7s7E8XMpqookJFv2q1vS3AU=
X-Received: by 2002:a05:6870:8271:b0:448:9d5b:6393 with SMTP id 586e51a60fabf-458c0dc6a14mr63345fac.14.1785361202134;
        Wed, 29 Jul 2026 14:40:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:ea38:c35b:7ec6:8152? ([2600:8803:e7e4:500:ea38:c35b:7ec6:8152])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c0df60fasm79258fac.13.2026.07.29.14.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 14:40:01 -0700 (PDT)
Message-ID: <ea9c043f-27c9-4095-9488-e81e0bbb5273@baylibre.com>
Date: Wed, 29 Jul 2026 16:40:00 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
To: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
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
 linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>,
 linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
 <cb4098c1-4bad-4a11-9a6f-a833e554f197@baylibre.com>
 <20260725230739.63ff7000@jic23-huawei>
 <20260728-patronize-thwarting-56fab2e11077@spud>
 <20260728221719.7f668a73@jic23-huawei>
 <20260729-hundredth-suffice-f28afa67bc06@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260729-hundredth-suffice-f28afa67bc06@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/26 3:47 PM, Conor Dooley wrote:

...

> Only going to reply to this for now, I'll reply to the other thread of
> this conversation later so as not to end up duplicating discussion, but
> I am thinking of things like what if someone puts a mcp3654r and an
> ad5529r on the same chip select? I think that's actually perfectly
> functional on a hardware level, provided the fuses/pins are set up
I'm not sure this works in general since SPI devices aren't going to
have a standard way to specify the address.

For example, ad5529r has the address at bits [14:12] in a 16-bit
"instruction phase" while mcp3654r has the address at [7:6] in the
"command byte".

An ad5529r instruction could inadvertently be interpreted as a
command by mcp3654r. So I don't think they could exist on the
same CS.

> correctly (and if it is not, mixing the microchip devices is possible
> and probably mixing future ADI ones will be too).
> 

Yes, I suppose this could be possible, but I don't think they would
be considered a single logical device in that case. So would be
covered by the device@cs,spi-addr binding that we already discussed.

Example:

adc@0,0 {
    compatible = "adi,adc1";
    ...
};

adc@0,1 {
    compatible = "adi,adc2";
    ...
};
