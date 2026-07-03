Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA3348445
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110596; cv=none; b=t1NTNZPTr77ew6OrRrLCjGHyj7heCqS5Mes2R86kdUnGl71Un2GdWb/lChhrgeZ2lI5d9yxrGlaUf8pGevyKgmhj54NFr2Avfs/16VPXMGdKvneXIGnhQ7CGMl2e1nANmt5U17jvYBMzFv9+cN2FYLV8oJaqucwg2Wv7UH7XEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110596; c=relaxed/simple;
	bh=TJ1Yp+Qwil//MuisP32HdTlaRDeb8Set3TLhKZIhdN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwIrKWzqF24aMQ1kzWL1JGIzg5Z+gxwVNFWHeDbo50Wm70q5812MLzyY1jcza3IqL2DqvDQhq5NuLUYWpQwLvHL3LFTwdTXHEfh1p7yA5pr4qGdzcLZ/XXAEw7F/ISlyIb3T1UdVEELOgePcbvRt4rl5ZVXYJSldUEOt/SyAhmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oV3DrLZ+; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oV3DrLZ+"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9f6b94a49so476082a34.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783110593; x=1783715393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gw65i8xoQ4Rdi81NgA4DFcrACy+bTuTMIx3V9X+aMLw=;
        b=oV3DrLZ+enF+1OpejGNA+zZ9DyoawFqu0KnsySh3cZzAdNPuJsZr4r7cq3Vh/oXevc
         J+jcF0V9yV/Ej+klr3zbkcbqPzYyboz9W9/aEH0Kd/QJlZY0uZ2U0TlcVUUo80MWrl5J
         i6aZAUNTtXFvWzMe5sLl6UM8KrNxrRkIkaeAMV7TQabGNihvml5on4GPA19vpBl2JIPc
         qpy/OilSxfFJuuzuLVk+ai0It1pXTCzWQxytZqfCfxOxlI2Eo3ZNY368khcMhiYFXq2s
         XqlcGzVeIZYwP60XLgEv3MZObb5b4LuqS2KHUBbb4U2ahydRmmmdr/r2cVseB1KykT4s
         cS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110593; x=1783715393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gw65i8xoQ4Rdi81NgA4DFcrACy+bTuTMIx3V9X+aMLw=;
        b=FcT9MccpMqG0xtm0QqCK3l0IWCEAmLifJmaH+tuyhkM8y2bAkw5M896AIwpk4ZzR6o
         kvqk83jmygXZBiUgvAaniSBSWai2utt3ILbeVpt2+oAONqVJiDoEsfxoKXVUgGD3l7G5
         CS96bGJScYpRDuhb+58HfjE+bsEDmaDqV772Zzp3+uPuoHivBE3D8ueeMl7CfYxSVJ33
         1DtUqqBbqnOC7jDvnBpZywOeAN6QsUzTbuKvsxaMDU01IJv3glcBYEXaSVd3heavQfch
         yvjspmnmMK+NL4xHpOUL2+OCL9BflJzdcPLfr4qS6F8NC8bDhtixMWneUUh4IqwEa3nN
         jK9w==
X-Forwarded-Encrypted: i=1; AFNElJ8n5WrTEiNui8WNVw3azxmSuzBEu8DCfZLGFhA60EX3ZFoXvD5uljtFk2v/k4FavNDnmJtuXTqLu0EF@vger.kernel.org
X-Gm-Message-State: AOJu0YzWra/7/wbYW8hdcDFbYQgNCNoT48IYi2sJ2uf9aoIRLJy82hD/
	UdnOPM1xgYpitrAyx8zGPsSqxiCru8EXt71PtCRVvbJn0c0Z7t5RomqpF7kFjfR7tk0=
X-Gm-Gg: AfdE7cmZYM4PHQbqsa7kaz2Vq2c8eE71raqYiUxchRw6apA+tWTxASJySg4m/YNt86S
	l23tAv0HsnU6OauyDUc9ICg6hXSMSLi1WA3rRvLAj4fLlB5engQ0ysQiQmoyixoNkys3JgVtSqC
	0qU3FamGHK+IyaBmQJ85WkK5mMk93L1Jj+04VxH+3bGU/BeNrCPb9WHzUqs8oHq4Piy8CK7d3zF
	vjwtXr0D4hk/nMbcxW9lTimnsxKWP1/Q2MJgy1VR2CGQvLZKdi89W6IApGUCaD3Azvs/Vi54tBy
	l5JvJGBNC47gIFRJC6Ubxmls9FqJm9jhHKXjfj1PsDafAsGJQAbPXdx7bvXGwCbmKlb10n2KcmP
	ms65IgVssh7qChvpuI0REYq2Cyd+KjSgOrX2vO/OwplEfIX04FH9NijQnl32e0trWQecSnplvZN
	HxHdAo7rWW0C2LJRC9bMq1/KhUqiJbxqZ0GZzIIyLhNQBj1YOBcSQFqN1960Q6AJo=
X-Received: by 2002:a05:6830:2e07:b0:7e9:b4cf:683d with SMTP id 46e09a7af769-7eb7ff7c01cmr704096a34.29.1783110593167;
        Fri, 03 Jul 2026 13:29:53 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6af9:a9d7:17b5:2644? ([2600:8803:e7e4:500:6af9:a9d7:17b5:2644])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb54292d5fsm5785830a34.6.2026.07.03.13.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 13:29:52 -0700 (PDT)
Message-ID: <b88ae0de-fb87-4812-98b7-59459ed7cf39@baylibre.com>
Date: Fri, 3 Jul 2026 15:29:51 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
To: Siratul Islam <siratul.islam@linux.dev>,
 Stefan Popa <stefan.popa@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ciprian Hegbeli <ciprian.hegbeli@analog.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260703102941.1141341-1-stefan.popa@analog.com>
 <20260703102941.1141341-3-stefan.popa@analog.com>
 <9878f042f424bfbd7fab24175298224b58e87779.camel@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <9878f042f424bfbd7fab24175298224b58e87779.camel@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/26 2:42 PM, Siratul Islam wrote:
> On Fri, 2026-07-03 at 13:29 +0300, Stefan Popa wrote:
>> The MAX40080 is a bidirectional current-sense amplifier with an
>> integrated 12-bit ADC and an I2C/SMBus interface. It measures the
>> voltage across an external shunt resistor and the input bus voltage,
>> storing the results in an internal FIFO.
>>
>>
> Hi! I already looked at Andy's review and decided to add a few more stuff.
> ...

>> +#define MAX40080_REG_CFG		0x00
>> +#define  MAX40080_MODE_MSK		GENMASK(2, 0)
>> +#define  MAX40080_PEC_EN_MSK		BIT(5)
>> +#define  MAX40080_RANGE_MSK		BIT(6)
>> +#define  MAX40080_FILTER_MSK		GENMASK(14, 12)
> Should be one space after #define, like the first one.
>> +
Actually, Jonathan likes to have the extra space to group the
fields of the register under the register address like this.

And even better is to include the register name in the field
macros too, e.g. MAX40080_CFG_MODE_MSK.

