Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E417A2F6
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 04:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782967515; cv=none; b=pOlNIDRncbSyEkUAfWhcZhacR4/h+u4YJTZPODXdf/DvAOKVs8AsZfy1GWJ00K60niS3+isYA6q+QPfhfF2I5BVxOqMo87TtPivNhu61NmZ8BD1Gpq7Q6eGnbgR0l18j34WH8/lw45JvZczI1pXVxL5/dMq2pFJ17uzYdm2Ew30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782967515; c=relaxed/simple;
	bh=zUFAH3NBQDpr7v3T1RkPoSIRDjtGOjb93jmULuNNKv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmnC6yC4LxNaZZ1gxkeOjjnjZlqTOpsimrcZHQlavkx2+Yc5SmztYZXY38g3m5KDDTdwOT7k01ZARcuoNM5Y4GrKhEtAex1rMcc3BFdebfPNBIZRAqMJc+uxJImWqKws7jrWH+dI5aITVmXlDmrR/WUknX2QZq9UZFSfQIiTOY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjKerupp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjKerupp"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so1562110e87.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 21:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782967511; x=1783572311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lRyE20bNy/13dqyToJ8rkPsR/Q6IsOETP2G+AoyHiI=;
        b=bjKeruppU6rKZUail3mmzZ7u/QU6eM1uFf/zjnc6LmhxkUA2gLDVR6pwEuxZKYx5Ml
         YK1sbvJWFMywc7/EYVVHnrjftbZG4vHlb9RZyl8sSdk6bhHyHOFe4YZdEegtk343qqso
         Vv4kbEAQMwMIljdMK9oYAHYHJkZgrCuJmS9UkTC8vUp0U5uQkWOoUP7o3jtH5qlNT/a7
         BakcFlnvi1mP75F8kiDeO9KNv5g7rIWTA2cYvJcddXsDFCGmUqC1YEqsfNJoIh8ytw2L
         5Ov1LmE3SGFFShk3ysOEZbBITKCedxrKaTSeRDHwAvY7ZQb3Uc1wFUh2wQ+SanqxnSDi
         t68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782967511; x=1783572311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lRyE20bNy/13dqyToJ8rkPsR/Q6IsOETP2G+AoyHiI=;
        b=UlVQqrPTYsXPtpfiX0fVcC9zOtQ2n9gGfPrhYEMxy4UbRU2K4gH4Fq2JFXxn+eayZd
         pQW/j8RLq1HXLuKd9miQFt2NrFrxEDPPtavr2/Q4ZZ4TZxZSefonIiavXv007zsxjQmi
         Kd3kC600TUrJXvkbSQl28X4aTdch+oXWiTfkmbpqAMYaIBq4p95x9cIo0QCI0REcJsp3
         5I18RC5JPQz5vk+B+ucGJZ8pUBFo9KBkpgfz0BZKYL05Utays5ipzmVgoQuxWC/KYvck
         OJBAkJMmBibV55mecnRdjasHF9h+bKwaYuv1ep4gyFVhN3dYUr9GGr8onGUZoECUu8Lf
         7nfw==
X-Forwarded-Encrypted: i=1; AHgh+RpSJT8Koa1D0L3UQuSi67GT/xVO2SauAbvuWUgH2aNgW0zbSAiii2d49IflChF5+RAxhSpolCjf9vmx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4s39Ca/7YFDuPKCN7mh7+gA/emLaKG5AVdLTMw9c5VpjGWDS9
	FmVHb4cKKWTBAszs9liC3ekAfIfUSx2e7ulsFtjQ91rhcrg5T1L+z5Bt
X-Gm-Gg: AfdE7cm9+pKZpFrc77zIfJf6POZOxOuFLYVli2/ik8ZgGDJCg7ddz46HksVyi5j3L8E
	VfQrWR4PzbxHRldr8gq1QRZHcNv1JJQjh2syqI/FwBwSZ6bxM4TH8TRv1y+s8xAaAh3uQ2QjbzA
	FRwrk5BzHZc/E4w6zpyAOeeKOv/lgvE8bIEsQ3ECtg1UxtjVI+Yu03STZHyqJUxpThL3ihM+Bam
	M2pnmHf8LGyNkGm/DjdLNgerNY88v6kQLLLHRpaZXlrksLWDX/GFe7IEBANA+M5gNe4259nahrQ
	mmD5v1L00F7//j8C6ChqqfAmyCLplOJ5V72jlL44o7EBV10sM+KklrPlA/Dch0IEvuwL2knMk4g
	1XEiBFgwbwssafW64cywoOeRrmo7113dbWG2iUNZd87sxo8Ibo7IXlr3Q+i7s/ywOvdRAUwDNPM
	dxxr546EluwHFizufziaZ4JfwrNAo7HkgT565TBIqdpOb2YfwRFnvZ//smsKfpJqwZ7I+4yg==
X-Received: by 2002:a05:6512:628e:b0:5ae:a4f9:fa8 with SMTP id 2adb3069b0e04-5aec6794c52mr815888e87.21.1782967510545;
        Wed, 01 Jul 2026 21:45:10 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89916c5sm442599e87.9.2026.07.01.21.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:45:08 -0700 (PDT)
Message-ID: <94f359ca-9a84-4d84-b3aa-990b15937339@gmail.com>
Date: Thu, 2 Jul 2026 07:45:07 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: regulator: ROHM BD73800 regulators
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <67b42b5363533f11c22a6421417c3345f9872aec.1782909323.git.mazziesaccount@gmail.com>
 <20260701192559.GA1313239-robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260701192559.GA1313239-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

Thanks (again) for the review!

On 01/07/2026 22:25, Rob Herring wrote:
> On Wed, Jul 01, 2026 at 03:41:11PM +0300, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> Add bindings for the BUCKs and LDOs on ROHM BD73800. The PMIC state
>> specific voltages can be set in same fashion as with a few other ROHM
>> PMICs (for example with BD718[15,28,37,47,50,79]). Same properties are
>> recycled :)
>>
>> The LDOs 1 and 4 can use different voltage ranges depending on the OTP
>> configuration.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> ---
>>   .../regulator/rohm,bd73800-regulator.yaml     | 119 ++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
>> new file mode 100644
>> index 000000000000..c427a04098ec
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
> 
> 
>> +      rohm,dvs-run-voltage:
>> +        description:
>> +          PMIC default "RUN" state voltage in uV. 0 means disabled. See the
>> +          explanation below for regulator specific details.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 3500000
> 
> [...]
> 
>> +      rohm,dvs-run-voltage:
>> +        description:
>> +          Set the default output state at PMIC's "RUN" state.
>> +          0 is disabled, 1 is enabled.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 1
> 
> Same property name with 2 different meanings. Not a good design pattern.

Hmm. They do actually have the same meaning. Setting the "RUN" -state 
voltage. Values '0' and '1' have special meaning "disable" and "enable" 
- also for BUCKs.

For LDOs on this PMIC, only the enable/disable configuration can be set 
for each hardware-state as the LDO voltage is same for all hardware 
states. Hence only subset of the property values (1/0) are supported for 
the LDOs.

> Also, if these properties are copied from other schemas, don't duplicate
> them. Put them in a common schema and reference it here.

Ah. I think this is a great idea, and I should've thought that already a 
few PMICs ago :) We have been reviewing and discussing these properties 
with you since ... maybe 2018, as I've added new PMICs re-using them... ;)

Thanks! I'll rework this but v2 is likely to be out only at August.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
