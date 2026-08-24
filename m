Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8B37F75E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593037; cv=none; b=VD6zHuCMoCvsJ+htefsZLLSBHTVzwV/qmCk8DmV94V83XR/hnajNnLV4UhnMAFYePtp3S6pnRz4NE3eA4f9jKrCu0a1+szB9GTpl1pPkVnBLS+ivyZW4ZgBKPyEeQ7Ve6ys3abvGH5Ytg+S8zZMCK/D7zH3LxaBSETePUQ/ld0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593037; c=relaxed/simple;
	bh=KUV3o9fZiJ5xKEqpZ+kjO/NII6ThGPtyEDDI+bEnWVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qv+h9V6VpOXyahoVEa44QnFrVAXgoN0FvPRRpn98/Vb4Y+aZ1uhQRQtab3uzSsuYNVWN0Zf3eYB88uZhV0DFU7jzPgowddU9fB+0kWxMuY1ebB1HoqUHrZj2rbu1XReW8sr803fPQQpmjSYDGPT/w0Rd6dW8A0R6lUzqt/a/yIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf8mo8Qm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf8mo8Qm"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so2919589b3a.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787593022; x=1788197822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjDo9P2tFqZNUYGEPkWk85lte9L1KywyCHEdwxIHjzU=;
        b=Mf8mo8QmXCrCIRK5BalsFrMrU8+Mh3qUylOrLg5zcP7/CV/yJcB7AAMIL3cpwIpVmG
         3m4R0+A8I9/soGYbbiljjpar9jfSfHnpIiuWHQgdCqc8j8ot9xeuXW1Ea7SCMSnXXodU
         H9Frkp4p7LYs3JC+3X5MkAxQHKQNWUjzPKBCUehcIGQrrbw06r9IuLvTLnqobKQOJG3M
         Tb2T9aoF32q72+YgU5D93W/1uABUosrrZPJHhsEjCeyYRkEknKG+6yDCn9lg12KzQ+Rv
         t07sdwh390xHHDO1LMWWQ0YxZdPJ+Y5oHqf9TChUEMKeDH+0MfEHZdbii3WDGUMajqxW
         CoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593022; x=1788197822;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GjDo9P2tFqZNUYGEPkWk85lte9L1KywyCHEdwxIHjzU=;
        b=p9H2J0GbVbVYxnFpjjw0mYWQXle4sCaXPjjHESzkTDl7wWj0WNtKWKgQQSE26FqwmA
         LRtwQSmoMfplTDXo8PaschSfG/0dphmdl03SNDnUDoaEZKmve1qnxE26DMrL0OtVBp3A
         ChGwX2E9r0440h26YuJPHNh8o7Qp16aEMnrt8oTGBhqUD1/jAKZ4Fq0m9CI1wVpGWlbj
         yeUrDJpQuSrwIByhhK3hlSdmkF36XmXKMK5/LPBFWHBjWMu3MdCtMpHviMD7xbbP/SIQ
         UcYteJC/7tdOsbUtd13zgRIc660q3DF7IIdwh/tCBx+DhOuIt/LHzZ4o1E0u8tmtIi32
         B+1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro87F2YlcvUchQ0HXCQ4nCj4eOkJ+dOW7HoUqh0AgOqpN6g6rDQK8oE4j7HKcvhWXGv9Pho9Jj9f1bw@vger.kernel.org
X-Gm-Message-State: AFuF++nzuyFu9fgwe7up/iJ9dZcsdXQEfCL5xOX0+ZAjExeixEmfseDw
	dfvC2XF1vD2YSlmMhmEQJUeNFblBcftNbN3RSasjmLFOds/iaCqbOcHnagyc8A==
X-Gm-Gg: AR+sD13ozw8PkLNGTog3P8zAHBBe4rSTlkXIiu+h6av/ymX3Yorc2vezplFUATeyc7Z
	VeFBoYVQRC9HvNbPN2x9OQZeKZlcIzJ6TCP0oi+WCpakp6dP5KD68yrW5lr+331nOOxuUsuxALT
	IDuN19J7fmovKM3nW1Po5djUz6FlcWc7XNS4bhcTsTSRYVa8g2uZECj4ntx01eKPKd+4BWFH6U+
	L+NSg2RmHzpGeQf51OdZNuUWNLYOnyzaUBDv2kJrolOwWGdYeu7JPvX9wR8mt75mKjaKIPCAkSN
	WC25kqxF4zk9kEIUzoZ9OoYg1TsaGxETAZ4w1gO+OgVtdss3B/71BsAVgPRfDqFAS2ps+Zk6fwC
	exPf87UGjmL/MpbIwp6b4thFZ7eu/WUWRvP3Zw9J2pMCcrpOWOUtIXqT4+32wwsgwwhVVnq4gt9
	Gfx3JnGRJPeq2oOmTl3VRMEUHMbjnNDgJ6x+rKJ7Yn3W4/hWtRLuLr40nwuQ63Wlz6PGhjEdYaC
	ZdA3JolFv0NCkLlc+MmBWOxFgTDfAOmqm7QKRkSDOOu5eJk3w==
X-Received: by 2002:a05:6a20:918b:b0:3c2:dcdd:a85a with SMTP id adf61e73a8af0-3cd91224a3amr564635637.13.1787593022032;
        Mon, 24 Aug 2026 10:37:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ef75esm26484894c88.7.2026.08.24.10.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 10:37:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1685dcc8-848a-42f7-902d-b20c7c3914b4@roeck-us.net>
Date: Mon, 24 Aug 2026 10:36:59 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: microchip,emc2305: add vcc-supply and
 #cooling-cells
To: Conor Dooley <conor@kernel.org>, vjardin@free.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>
 <20260824-flashcard-renewably-badc0e011949@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260824-flashcard-renewably-badc0e011949@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/26 10:00, Conor Dooley wrote:
> On Mon, Aug 24, 2026 at 05:42:59PM +0200, Vincent Jardin via B4 Relay wrote:
>> From: Vincent Jardin <vjardin@free.fr>
>>
>> Both properties are missing, so a board that supplies either fails with
>> dtbs_check:
>>
>>    fan-controller@2c (microchip,emc2305): '#cooling-cells', 'vcc-supply'
>>    do not match any of the regexes: '^fan@[0-4]$', '^pinctrl-[0-9]+$'
>>
>> The #cooling-cells property belongs to the controller node, which is
>> where the driver actually registers.
>>
>> Two cells is what that registration needs: a cooling-maps entry
>> references the fan as <&emc2305 min max>.
>>
>> Two cells also documents what the driver supports today. The
>> pwm-separate path registers one cooling device per PWM against the same
>> node, and they all get cdev_id 0, so no cell count can tell them apart.
>> That is a driver issue, noted here but not addressed.
>>
>> The examples in this binding put that property on the fan@N subnodes
>> instead, which does not match what the driver does: they are left alone
>> here rather than changed blind.
> 
> That seems correct though and putting it in the device node when there's 4
> fans that could interact with different zones seems wrong. Shouldn't the
> driver be fixed instead?
> 

I am a bit (or, rather, more than a bit) concerned about Sashiko's feedback:

New issues:
- [Medium] The commit message makes materially false claims about the driver's
   device tree parsing logic to justify leaving the binding examples unchanged.

Guenter

>> vcc-supply describes the chip's own rail, which matters on boards where
>> the sensor sits behind a switched supply.
>>
>> Signed-off-by: Vincent Jardin <vjardin@free.fr>
>> ---
>>   Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> index 8c2548539d7fd..47640214de100 100644
>> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> @@ -44,6 +44,11 @@ properties:
>>              - 0 (Open-Drain)
>>              - 1 (Push-Pull)
>>   
>> +  vcc-supply: true
>> +
>> +  "#cooling-cells":
>> +    const: 2
>> +
>>   patternProperties:
>>     '^fan@[0-4]$':
>>       $ref: fan-common.yaml#
>>
>> ---
>> base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
>> change-id: 20260824-for-upstream-dt-emc2305-vcc-cooling-251655c99ef8
>>
>> Best regards,
>> -- 
>> Vincent Jardin <vjardin@free.fr>
>>
>>

