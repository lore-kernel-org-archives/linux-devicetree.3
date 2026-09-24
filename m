Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9931AF1F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232495; cv=none; b=hpptbi1J3+O4SpQlCbv84kTL3wUWQwKI11auDoqAXp6cW3gpHF4ny7oqEj5x5+ejLo1RugTOR1KRG62kVW/XKQ6RTDpT8wYCB8W7KV0HiGa/mZiw7VlMzQpHXIbbMORTGEHz6jzxM9V+yAbhqOnUutxBekpN/1IRqscIUlTEJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232495; c=relaxed/simple;
	bh=fDvxDhzbYt3DMeQyxit2JKIBkeTLvVcghnDJIHoTikM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOGfwsa05ZAbWRnKjRxrYukd/Di7FK/6Iu/bi0nOySKoxPkZvMLoO7V8Mmo6ds/tHeCSoWIL8yiPrPqxZ3IQrP1xGlp9wm+NLeG05/OI1nnpU1BIyfi56VZqDeVfwmJaQs4IWAROPwbl9jojeuWwZR+lzdX39sR2kMADaUYx4co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qB3UERn2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qB3UERn2"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so10879815ad.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232493; x=1790837293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=;
        b=qB3UERn2uwag+SFeINTHk1APnvHGvvX0dvPc+lWaeyFQo5hcMmMiJ+l09WamLyzFHf
         wAxpQ8+e8kpWWrXkYY5zf3n4gu74AqD+yuQ9wS3gSJjxu3cz5nRK9qMM3DjwnJJgH43a
         W5NNxpHlqonRPDV6RijBSpw8eg1xlWGP5k8WLLpzbT6ru2mv6+Ww7MFBMs4/yJnDZTqv
         WKM0Mf2fTbgKoB3cOpuqLKwLr8mX62a7m+jWsen3HSroB3S2NyLpSE8+i/ug2aVeYaUg
         /qD9/o08gHc8HqUaAOm03AZNlIiTCVsHnGXTneWbo4DyASNeQv9f1caIKrSKESedD5ro
         VshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232493; x=1790837293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=;
        b=jXWrysh08xA8dDOeOKFDF/pLmzSwfiVXWHjPow8FXMTYfK+jRcJaFBjeO/lj5K6q5g
         HBhczf01ZmVALsItCyyWq+fvtZyrU4PrGCYAP45+t4/wTOjoywQBTkaWv9U93sT+bP/m
         5T72X9w/jKPw6h+6I9NSihKahiOBVGhv3H9twS42nsSzxFv2GzbEqT2T201Gd5K1/OIA
         bVMwqcdWx3Qhgv/f86c8YeA3KOXGFDj5G46CJd9CqdI7gkUClwFOF97EWPNK7Gm/KGFV
         yj2IUq6g9ItgOZ2cz/xIowK/N5xhDJb9SpIQInJIq2A+AOH0BbzUSBOvcOmFrgPeAF/+
         +AqA==
X-Forwarded-Encrypted: i=1; AKwUvBw/aHJkke0a/NTd7vf7fq+RDqwnd2CUHSwRPS3M1sjXAQHjrRVg9Hcl3GmDUhq6mwsXxu0935rmOFce@vger.kernel.org
X-Gm-Message-State: AFuF++koKUAE3aAvR0l9ABWA7bOAkA6I3Jcsq1GhRRUWelg08usbtonb
	mnxidXvVasZ9fjyqMn6Qvb/O8mLB32bi9n5tx/oMKvZ1SBqIi0tz5dO1
X-Gm-Gg: AYBFou1Sh2vof5pTN9C+7vcMEx+Mp7ttqyLFWC07goBpNJQTiMZShqHRi5EkddhGSGL
	Ph+51QDDbX2PnB+6/jXoclaXgL8W1jU6wdC94FRokgC3qecm7tq31zrLTGwJsjEhbRZfOZriYPq
	WnKxwJDEJ3ZUU9ucDPIlhhtYcWHfSQkIdSBEYxNvidy+TGgoJfyAzk9fC+y0HgBdNilodEH6fDC
	GHzKrZornoGD0untASdBosICmZ5HBOwgXyqsa4uoV5hn4U10WTzSrAHoYHLVrWrwRvW2LCI33Aq
	CFzJUjqDNujIQ0MDjO5Fu3uMK/QcrTBV808K3FSFa7f9mOFcqCglSv67dsyqpjEShgc1rDC1nLJ
	Y50wVfMLWiZVoG5qbuP1qBwMy2ahqQATHeFUkfxF113svhhU26lRxN1/mvwzA1qxvhmvitp8+8B
	FLWkBWYk9fQPiUMjhb7kkf4iBD8CvOQwd91wyVYaQH6eH9ESEHRwROFR/v3ndK8IzYwEvesLdBF
	W6qSPVyHf9pCg01eGhB7PaxoS7GUzAWiBkVGZteX7Abbq8m4p2lQdNsnUeDcgqZEA==
X-Received: by 2002:a17:903:2f4b:b0:2df:448a:e016 with SMTP id d9443c01a7336-2df7dc1e167mr13424515ad.34.1790232493096;
        Wed, 23 Sep 2026 23:48:13 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c7d82sm21463085ad.46.2026.09.23.23.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:48:12 -0700 (PDT)
Message-ID: <0e6fb86c-e995-4ef1-b08b-44a5e8be93f9@gmail.com>
Date: Thu, 24 Sep 2026 14:48:08 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Jacky Huang <ychuang570808@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914031859.385224-1-a0987203069@gmail.com>
 <20260914031859.385224-3-a0987203069@gmail.com>
 <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Jacky Huang 於 2026/9/19 下午 01:49 寫道:
>> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>>
>>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 
>> 1).
>>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>>
>>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>>
>> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
>> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>>   3 files changed, 137 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts 
>> b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> index 78534d613486..0a068abda6e0 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> @@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
>>                          power-source = <1>;
>>                  };
>>          };
>> +
>> +       hsusb {
>> +               pinctrl_hsusb: hsusb-pins {
>> +                       nuvoton,pins = <5 15 1>, /* VBUSVLD */
>> +                                      <11 12 9>, /* PWREN */
>> +                                      <11 13 9>; /* OVC */
>> +                       bias-disable;
>> +                       power-source = <1>;
>> +               };
>> +       };
>>   };
>>
>
> The outer pinctrl group node name does not match the MA35D1 pinctrl 
> binding. dt-validate reports:
>
>   'hsusb' does not match any of the regexes: '-grp$',
>   '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'
>
> Please rename it to "hsusb-grp" in both ma35d1-iot-512m.dts and 
> ma35d1-som-256m.dts.
>
> I tested this change locally. Both affected DTBs build and validate 
> cleanly after the rename.
>
>
> Best regards,
> Jacky Huang
Agreed, hsusb doesn't match the pinctrl node-name regex. I'll rename it 
to hsusb-grp in both
ma35d1-iot-512m.dts and ma35d1-som-256m.dts in the next revision.

Thanks.
