Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347792FB965
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679049; cv=none; b=LIu4RQAc5x7awAIa7f2wBEHDRRYPeeqN/iAqhSa1TiRypimeB8IBEQBvcroXvUoT6fJU7QaH58yjDjtRAdYsYYe92zinq9RvWdbfNOdKDvg1w9x8pcE8KZUV/eFmN/sJQVkOu9l7Y0tvFun5mg78INJFEDRXMIeD9HBKZZzd9VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679049; c=relaxed/simple;
	bh=C7YFZCCu1dOeCsLg6DoF+9ZVtNHvPRq+h+Zo6dLBmB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuNjliq3HxMeytqYFNSxprO49CLFXscHSgPwTSFG1OC9WbXuTKQUFJGbYbuzMqxgtKPf+e29kVkyh/Qizq7bE7NwS4tjvn0Y9J60iyj7yUJ5jdEsFRbZ1cgOSFiNjSkH1Awl3AMqWDzarJKb/8SRDRGgchkM/9qL8AaLrSjWTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCqJCXi9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCqJCXi9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso40238215e9.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 23:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781679047; x=1782283847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Trq1GUdrJefwFDKO73LEpHAox6MBJ2GUwy+Cih5DopY=;
        b=WCqJCXi9yibRSJ5D2QIBg96wVMVBsltG7hqEhWSiMMjpnepNe7JZcNqou8TvpStsC5
         0O2VRVRDsZr8u6wYnVE9CMPpGHdot2XRhpzV5dySGs2ikkqUNBVPnz3FHJ7bZ1+V+TEP
         aihcJCNbrHAZozcBZVodaoqGw+qhMxEUK8KO5H5WWYnmMpFxSCOLQKtK/fGUyB/z8sxB
         ijoPo6PGn3OTd36WIVXzLOKNiutmb6rQoKwKI6s7cRcJ/20qJnOCoCpTeuT7D0VkSDkp
         2SON5gb7viS29bcJumAjOzlr6/idKj4TDUPRF4JNb8d4dR/xoIkC+K73wDSZqiZ4ZhXu
         aoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781679047; x=1782283847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Trq1GUdrJefwFDKO73LEpHAox6MBJ2GUwy+Cih5DopY=;
        b=pBG27QckBPkYYdFma2YRfXPTU4IymW5ipglVnWa3un/ffCOnX7OHYlSf7YKtyO4erJ
         3MVh/JV7GXSAQCPNDSlOy3ep17GPPR0akox85Ch9Tt+ita/Sj8ZmSAgUwZKjgQ9AWXIS
         84bj0AJmISuZUqt2FzS87Qlr/wHp9OGWpJHLWo1nGAgiC1+/mAB4SFHN0vh7i1iVmqz1
         EyVqH4Crb/yOodKQQepnuX6Bv0UJXosSCx/goLouzGJsiAKGftiJM22f9itKz8/0cerc
         JOFrN6QJn/kbgjmtre5zJ/C7ziWbkWsLq4z55lmJjyxS6nmoMdNP5JnfurMhkeVRZBzA
         Augw==
X-Forwarded-Encrypted: i=1; AFNElJ9BLqkCbrgxrR6yz35GlcTTS+ZmtcFCW2/9DaOoEnNvBIjTabAm4DUZnxVpaknS6/C5LPvHUbfBLMvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCXEesqX0LwFP/CadxfO5PEABSwDIkMXKt1de1aK80lbxRUomN
	R/d9oQCf37BjwlQ5rZxTbaTpFKz6vQsb54GIX1VdLabv+RKdk/kCBzBY
X-Gm-Gg: Acq92OHIGxiFo4Y6iDroHLBEfVFixtgOxQDP0Hx+lXD2RVNg5fZWiNe6gDQWPJ/CbiX
	LBo1+pihzPtMnLM4XYs3Bk9Mg/IBZtRT1Ki3uK5gzB742YJ6lsnrwBfG3xVKXEfZSk1W64unZb8
	N8WwX59MOUWrU9GcGPiOas+Zohz84BV/q/eWsTq3hsX6NUvGvElaTgg+jejvrk/F0kxdc62mjd7
	B94NSLQScsrC8vH1MSEToDnH26OtjrjfSHC5QWi1C9TzsZew/oYPXXIBV9C7J3G1qmbmGwmeRRh
	4dyDjec7uhCfUeYjQOt1IQ7EHP2OQCmfVCpzY5VNg/jUlVH/is9bmAoKqBUcGrarRyhRrHqL6qu
	I9Befe8Z9LIV9uaUcwZaZXcweN1YoEVHJJyIMwltg11Se0SfrtTcZtWM/xAhSnzQLtU7Cli61jf
	jiHza2Fl40p4dv2cdlVgHrIpgRLartE4XHlC/eJiK3mK9GTo3t8BMBQhRig+f627MvADQkvdj0i
	u0f67rImZ+jrkM=
X-Received: by 2002:a05:600c:a111:b0:490:e5c1:b89d with SMTP id 5b1f17b1804b1-492333ffd28mr36380385e9.0.1781679046294;
        Tue, 16 Jun 2026 23:50:46 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f13a:1701:b918:4041:7c7d:eb1d? ([2001:9e8:f13a:1701:b918:4041:7c7d:eb1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49233bf0881sm41430175e9.2.2026.06.16.23.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 23:50:45 -0700 (PDT)
Message-ID: <36668b89-77ef-406f-9edc-ed57a025754b@gmail.com>
Date: Wed, 17 Jun 2026 08:50:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: pse-pd: add bindings
 for Realtek/Broadcom PSE MCU
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <20260612132944.460646-1-jelonek.jonas@gmail.com>
 <20260612132944.460646-2-jelonek.jonas@gmail.com>
 <20260615212959.GA1679454-robh@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260615212959.GA1679454-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rob,

On 15.06.26 23:29, Rob Herring wrote:
> On Fri, Jun 12, 2026 at 01:29:41PM +0000, Jonas Jelonek wrote:
>> [...]
>>
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - realtek,pse-mcu-rtk
> The "rtk" feels redundant.

In the full Realtek case yes. Do you have a suggestion to improve
that?

>> +      - realtek,pse-mcu-bcm
> "brcm" is the standard vendor prefix, so use that instead of "bcm". 
> Though who defined the protocol in this case? Realtek or Broadcom? In 
> the latter case, I'd argue that "brcm" should be the vendor prefix.

I'll switch to brcm.
As Daniel already mentioned, Realtek defines the firmware and thus
the protocol, in both cases.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-supply:
>> +    description: Regulator supplying the PoE power rail.
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +
>> +  realtek,i2c-protocol:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [ i2c, smbus ]
>> +    description: |
>> +      Wire framing the MCU firmware expects on the I2C bus. "smbus" means
>> +      reads carry a leading command byte (0x00) and a repeated start; "i2c"
>> +      means bare 12-byte writes and reads with no command prefix. Only
>> +      applies to the Realtek I2C attachment.
> I tend to think this should be distinguished by the compatible string. 
> That would simplify the schema given it only applies to one of the 
> compatible strings.

In theory this could also apply to the Broadcom dialect, however I didn't
have a device with that variant on my desk.

If you would go with separate compatibles, do you thought about
something like "realtek,pse-mcu-rtk-i2c" and
"realtek,pse-mcu-rtk-smbus" (given we stick with rtk) ?

> Rob

Best regards,
Jonas
