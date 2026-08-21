Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99765370D71
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290288; cv=none; b=VAeunue7RbpZp7hJnxuVLkdZW3AIhgmRnIp4N+NUnM6LKgI0rqk44vQUtMXEk0f9U5cSjKFRPoe/mWwx3QOJ4pcea8BhiTIjtXT0pMOQh10LReJ5yjNnrbD+mJI3e4Y1juqIjHu4YVbrmDfwDJHIC4YxBcpyUqwyzrmb+62U7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290288; c=relaxed/simple;
	bh=inNrn8G8WFZnnfrNZ9E3BMtQ1vPeRWfBhWs8dXkjO1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMhpX0RrWCqBfQoRxD61ZrUw59mXeRY2FAKQRSNy8/+MbPKjeCsTFxN5RWe+LhxK/cOcmkEgvnrfEbx8fQDvSBS35LbiKBmRVz9aje3Q0ai4PdcLlXFpGW0dWeejlVXNLa/Opw8kglVr+ybqOWpEYlrdU34VL03/jrogJpjuHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=VrLMlt3s; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="VrLMlt3s"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84f77cc7302so188752b3a.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787290287; x=1787895087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8SxG8MAv8S17KEvq/pF9OP7cYmFId3mpEeGKt4QpjY=;
        b=VrLMlt3sLhd0V8t78MIHvLsBzc1+t3pDuJTlemBOc+7E7K8NWj10Gf+oE/BlEV+GWx
         R9NDq2vAXbRLmrqctvdqcbS0ncmlYFjMIZHeIkf1P7LmB1oitsGXWDudbJD5u7aEYf3O
         IVKhWqSbXWf7w42RG53ALrE4yse7kxEF55ekmd+3nSTDnU97qHfHnq7AgQ5Mzu0ZM+nz
         7xABt1JxwkcDx51SfMWFY+vQhkkJ5CYvXoLDLpX2EgMHDTDUqT4NnlwPkOnLLRH4gHaj
         E/4Qp39H0p3DDW45FaxqkT/4Bdi3z6EUfP6nJ6OVDO1FB1ae1C/I+vdwd9QAxZ0VJ3P4
         Y/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787290287; x=1787895087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8SxG8MAv8S17KEvq/pF9OP7cYmFId3mpEeGKt4QpjY=;
        b=Ycek6eq8Unj89ApYqUvkCkWeLM1DCHUNsaxWGOwDRluVTyMzIlc+G1QLhUIrghtIk/
         hQGdZaV26Q5X3Rl/d0IJOYYMBCyNwIQn+jC36JOGtIsababhv1clMqcahgA/ZPoeP52+
         QHMwNan37eg3bcFo/9b9d8s2NKT5Gh6z/ti2kmSXRQA39TQdCi+y9FVP8QDJs+BpfUuz
         LsqqSbo2y1YcSGxw/ghvHJV/TSgP3Iu+lXntnXQRUr+lgC04UcZ1qwc8f82B0lmmehMC
         7kK4glOSILf9JmrbRCF3r7LX901DIM/KYDUrN0HfbdNK56UPi7Sy5GW8as6oc24pWpE0
         7M/A==
X-Forwarded-Encrypted: i=1; AHgh+RrhtvucBk9+4aTmvlPdFr/S/emCULHxUagAeiNmUKek06sCqEznVHgAk0bMHmFrs7ptJ3Bah4coZgRk@vger.kernel.org
X-Gm-Message-State: AFuF++mVFvi8ULqCS5Ni7UdR89dHAILbiAEVI91F+oLTKVOEyOo7x+ab
	rsLGYdLm3OnsHB/4GKGRep1Y9tSEsKexqhtyKTuukDLnv7opGXD2yRj7PaRqMSF3Ug==
X-Gm-Gg: AR+sD12HMBjGc2XDuhkVplakuLYOuNptiJIYdMf2yRK3qhaLDPd/LDx+M4js8m9I0+N
	7XKfcegEthiGYDH1nbQD1gKriiYGYOtsRa2xtBprRh5YSc6W6FXBowBqI7fFwQINCTXJOCnZRiB
	q5OHCeR6tYuLBNgkPtGAsAnhxxZkULF3UCYfa5oDh6y/O9RyFHT7k9UUXC4A+8u/+k5CCcxuBH2
	RHPLTGzR8gA9j19B91El3g5Qi/oflzSVjhbE1QuhjORppQh9zsqA4FHR7W9D3DxamzwCg/dbD3o
	JJpfbztJT50CxAdcPEF+VpEVkiVnVSVOd0F9iCKscBVtKWmVSSq0D0rW75uAGo9Ag1ItakZ8Arx
	4DHV5bSNc9GbPZV4/UB1OPcKEQQjH9WRCBP4ol9lLTtbcC3WYJxvB5yXs0X2V9h5nCD8oJcuFIh
	+N7z6BSWT6AnUXuN/Y06+ILx4wjGVJk9W01GvKeHFv9AA0iXiqpPucDAqe8NIF3ckN/N4xG7URr
	hVS2RXBr+Mmrli4+UeIwG20t9JXlRYZQKnA+N4=
X-Received: by 2002:a05:6a00:9519:b0:847:9267:2104 with SMTP id d2e1a72fcca58-851f9f48a04mr4829658b3a.12.1787290286849;
        Thu, 20 Aug 2026 22:31:26 -0700 (PDT)
Received: from ?IPV6:2405:201:4019:32fc:3c55:6b24:5147:322b? ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d31b01cfsm2388453b3a.0.2026.08.20.22.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 22:31:26 -0700 (PDT)
Message-ID: <f93c5f18-580c-46ce-971f-8e2073485b4b@beagleboard.org>
Date: Fri, 21 Aug 2026 11:01:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] dt-bindings: beagle: Add BeagleConnect Freedom
To: Conor Dooley <conor@kernel.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-7-282da14ab7b7@beagleboard.org>
 <20260820-anytime-barrel-9a0547910a2c@spud>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260820-anytime-barrel-9a0547910a2c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/26 12:03 AM, Conor Dooley wrote:

> On Thu, Aug 20, 2026 at 02:55:49PM +0530, Ayush Singh wrote:
>> Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
>> a wireless-enabled board based on the TI CC1352P7. The board exposes an
>> MCU that can be attached to a host over USB, UART, SPI or I2C, and is
>> described as a child node of the corresponding bus.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   .../beagle/beagle,beagleconnect-freedom.yaml       | 30 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  1 +
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
>> new file mode 100644
>> index 000000000000..5a246f81261e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
>> @@ -0,0 +1,30 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: BeagleBoard.org BeagleConnect Freedom
>> +
>> +description:
>> +  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UART, SPI or I2C.
>> +
>> +maintainers:
>> +  - Ayush Singh <ayush@beagleboard.org>
>> +
>> +properties:
>> +  compatible:
>> +    const: beagle,beagleconnect-freedom
> These compatible only devices always look suspect to me, I feel like
> these things probably at least have an optional regulator if the power
> source for the freedom is provided by the device running linux.

Well, the power source can be provided, yes, so will add that. In my 
testing, I was powering the BeagleConnect Freedom [0] via USB to view logs.


> You're also short the required properties for dealing with anything
> other than uart, so spi or i2c. (I assume USB doesn't need devicetree to
> function).

I have only tested with UART at the moment. Is just having 
`additional_properties: true` sufficient? I think the reg property is 
the only thing SPI and I2C will require setting here.


> pw-bot: changes-requested
>
> Thanks,
> Conor.


Best Regards,

Ayush Singh


[0]: https://www.beagleboard.org/boards/beagleconnect-freedom

