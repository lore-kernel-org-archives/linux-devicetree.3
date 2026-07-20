Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56FB42A166
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557457; cv=none; b=HBPPzUEBfdStmb8ndSsZyjyADYUvGoD+eM4nx2vlC3TpjzwbPhNHDMFZRlHw3s97cKzy3fuNv2FfIDt8of+dMKxPlqDvSJD12FMJUfCfzghc5dBkJWNWBE1caz86aFq8ScaIyYEM/URIp29wZpENEncGJRxYKxKO3hYvqHtlHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557457; c=relaxed/simple;
	bh=CP+gtt+HOG+Rgpr0fnB+mb+3WTuTlJC8GQyWgEkqERk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ituhZIdt3Z3H1anDSZ6Ex8d3o1UHBRwZkq+7k9di2hxBOS/MbqRPBYOGFFwD0De0Sm8DKOGvzUbjnIcZ5KL3kt5WvCrK1CLOpH7VxSQKH3FPrBaIMwHWf7AQkcpbQtH4GmX3sUs5S832djV08Ac7+DcmvJSA1VejghHptqAn+Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXuQBj0W; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXuQBj0W"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso6275067a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784557454; x=1785162254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpL1CNsT3je57Fwq8JftS8mNRsIjVSAHBGRcgmodJUA=;
        b=aXuQBj0Wf5nTl3ShwIgd0/L57ZVwHAPf96vKtV1fUoceeXuj1h+D+t8/DwIxvAenm0
         mvP/MS67e83MjocP59GHLgLyVtJHvc4urdn83q6wbaCj0M2O6TwX0nG7pAJ//3Gy9YXq
         IyPDP2VMy+8yBcMh4apcg1+OjAbYU2FxnFs7ZupMnLV0UPyQ28JVLkVB1nS6BUnfEONe
         VtQL6d1ccCwl567xFgzJPeqXby1dF5AXTbBMyOdLTKFByjfarK5gP0Hxy5chWMf926Gu
         lVIO7XvEBHGeHMkm3j31fT7iy1VvGsV5sQCWrofZheZdYScfHONZXRSFfEsXhFufNIcg
         ABKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557454; x=1785162254;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EpL1CNsT3je57Fwq8JftS8mNRsIjVSAHBGRcgmodJUA=;
        b=QUZNU1luQzSbdzMHD7qJn+NuCjaPSBIzmqxlt3ES+1vhjOhL8Rvf31z80MtXodOJA7
         1Cx6+fQ7qXZgLLrTRIG9FXc2HANq5OcJBNLH1FknBI4SxsgGL0yBr3R2eX2vSE6lAX7J
         LVwD5qMf0Y7swMBB1aU9ukbnlfcB2mr9xWy+v2c24ThmV0SaB7+vmJ6daMJm+oKiv3yT
         BUKGXwuRun2/qWBjiN/SL7Kqy92Qm5vcUfFmZMjQGfMdFAu1mVpw04WNG0SiVRhgHULW
         5GY/b+lY1zd5hezh/qn1onOCPK/zCM31qwNhW2ZA3wL25ajddZ5UxZxN1XnbDf+3/76o
         IVjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcPbZpN2r9+mdiRDRuTa1+jr1JN1sl3upsxuicZrJuYOjaIRWdkNcOBnOq0PjhsMdLk5MGEtSX5e9x@vger.kernel.org
X-Gm-Message-State: AOJu0YzmeJmWm4ZzH/IzxJC1K8AKiIJGEL/o7iQ7YfWaatxZhy0Rqgyy
	xd0B97+wxhk6NFkav6Tt12KO/yMtw/lU7r7RL4MPygdO+QRquRioqQDAsYI/Xg==
X-Gm-Gg: AfdE7cl8eUttjCtj8gXID3NKhrBPGgm5dbbdua3Il5moagBE4UH3difx84gjOzc/Wia
	1iVMoA+LetGKiJ+iFYQAbLJanxluisg14v+ZLIWtqWAR5eU56LQK1FWyGfN6FFmuvwiPX9rJNrC
	A4pxL2GdSVc16PmtuvDO1BvMdlEh4hfb44jw2JxZCaWH4ch833UV73g/9IJcsY2JQ02X67zWAPG
	gr4DP7g11i711zEhh9a0e8KXJyGlTMkDo49gvW5op97XMsNwjq0Imjic+T6Ha2b6QEqc3vkD2R2
	4d+JuKaewP+g91/4Oy3+Gq0P6aWGqmRRgbgWg3wKkWwWabDqhpXqqAj2tmgxaCCbA8Zcx8dUkrX
	sFa0wGmYIVx5YVGabYzQAqhFKLKqxBKJGLCZ55HdV9d1PlMPEyB8ZB5hljpQ/9p7Ci2EH7kqAfI
	1cFx17p3L+4c8cpJYAi/q4W+kTyhU+lrVhZgFHW/aGenP38YtqDD8=
X-Received: by 2002:a05:6a21:d8c:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c3ad94bb70mr15785688637.46.1784557453546;
        Mon, 20 Jul 2026 07:24:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcaefsm36660793eec.10.2026.07.20.07.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:24:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a8fba49c-bb72-4b3b-b598-4972304e0b4c@roeck-us.net>
Date: Mon, 20 Jul 2026 07:24:11 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com>
 <20260720-placid-fanatic-shrimp-d2bcd2@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260720-placid-fanatic-shrimp-d2bcd2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/26 23:47, Krzysztof Kozlowski wrote:
> On Fri, Jul 17, 2026 at 05:59:14PM -0300, Luiz Angelo Daros de Luca wrote:
>> The Analog Devices ADT7470 is a temperature monitor and PWM fan
>> controller. It supports up to 10 external temperature sensors and
>> up to 4 PWM fan outputs.
> 
> A nit, subject: drop second/last, redundant "binding for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
>>
>> Add the YAML device tree binding documentation for it. This includes
> 
> s/YAML//
> There is no YAML in Devicetree.
> 
>> support for the thermal framework by defining the "#thermal-sensor-cells"
>> property, and support for the PWM subsystem by defining the "#pwm-cells"
>> property.
>>
>> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>> ---
>>   .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 62 ++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
>> new file mode 100644
>> index 000000000000..14bb6359c91f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices ADT7470 hwmon sensor
>> +
>> +maintainers:
>> +  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  The ADT7470 is a temperature monitor and multiple PWM outputs.
>> +  It supports monitoring up to 10 external temperature sensors and controlling
>> +  up to four fans.
> 
> "controling fans" is confusing and suggests this is a fan controller, so
> you would need to reference proper schema for that. It is just PWM
> output, no? PWM output could also go to LEDs or motors (well, fan is a
> motor).
> 
 From the datasheet: "The ADT74701 controller is a multichannel
temperature sensor and PWM fan controller and fan speed monitor".

It is a fan controller which happens to use pwm signals to control
fan speeds. It is not a PWM controller, and its pwm outputs are not
intended to be used for anything but controlling fan speeds.

Technically it is _possible_ to use the pwm outputs to control
something else. But that does not mean that chip is a pwm controller.
It is still a fan controller. I don't mind modeling outputs as
non-fan-control pwm channels if that is what they are used for,
but that must be clearly distinguished in both the driver code
and the bindings.

Guenter

