Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC2338A728
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 02:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777774964; cv=none; b=hQIbU9XAefq21LnTipfryd88dkyHWXQWcWCeXPvEx7YQjxepPkUepPHD536ktVA3dYn1EWjTrS4vn78jltcsZ9FtOg81qAmil2WDkNtt0XnSb+rpKuh5QUq0aGy+TmpFFPMuVDLwk9iORk081zhkI+oUu9a/9S2sVHfsvU9EHBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777774964; c=relaxed/simple;
	bh=B1PmN4snN3TEmBXKhowypi6Ambrz1PGhChzjKm+5Hg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ld/fo1iJV7d5EnQGh0TAnKxIh/77jtdHc86T9ZYAYGpKMAhtNT03ZjwI+Kz2zFBKDHKT61tIZHnI6wj5FDbbNYXyNH0LSShnNlpbwHUjHmWB2T+qT2FaGuNvywJ6QHGTLICvMWafIy2nZPZDR8fHrnFnvyK1rbYpZjx5Plppb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=INE1R28I; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="INE1R28I"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a016799d2cso33884856d6.1
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 19:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777774962; x=1778379762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECqabU+TDy0NRCRIeEAH6lrHAxlzLyRi5L607lh5qbM=;
        b=INE1R28IvE/QtZL/oMkIADHU7jre5IHplm70EhXHHlKSzDoU40mvyk0x9rze2cimTE
         yxjKsKU9S5IootkugpNY1Mi3hLm0D2smd1ryOfUrOCOO6oxw4eKiBRN/RM+MsL5c4W8v
         3InO7A0IYLDHiBFawevoH9WTS3HoIaq4xH6WFu/pyOujNW/yvdxFpr6U7a7LL2qqWq8f
         C2E8+F2x3VuEo4r9dcfTbhyYkXyxTedyO41wcntywHHayGZVkYg9bxYDtPfDCFbGAeuT
         24uz0+5L5KMeE+lRYY9GHlQqNsDg1loMNQJWkuWcq6d38QiKA+HBGAyhODirxwVv8dyg
         rduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777774962; x=1778379762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECqabU+TDy0NRCRIeEAH6lrHAxlzLyRi5L607lh5qbM=;
        b=mnvmdogfiuAcJY69SFQKA259vahpucBM4VkfMEkTwq1yQR25VrZeTzfHeLocSk0z4R
         BZV9VEAOC/rzxDcOWjqqjGGCKSlbiLhfGJPG18+vd0UXHnh4ipNnRdW/FZCpG2B8QAEm
         SpSNpZAoy+WKVUFlvEWE8UV/4KGqeCzZSpuoN0DolMn6iJaLAS8wMqQqpSVMxylmDCgt
         uaa4Qp0hMHL2+CKVQwiaYI9sAM9ZQUg6Lv1eFwy4qLqJ9+qPdZl7dAamTYIpAYDz9p8J
         loeLysDDCT1gn6FQWyRnYxYL6lGTY11YicQKFtbkTUqAZzhnnQqZ3+gaBdW1pPo3Z8OQ
         T+9g==
X-Forwarded-Encrypted: i=1; AFNElJ+WZECI/jhXpJY78ddmnQmQhjXy4REh00amzaugxlh7/s/v4UiX1+RkwLpDHxbUpmJCTWhwLL0jbU+v@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/g/9JIWACaASbIE7blUnDcz9D8RASWwG+CVY7B+Lbf1c94U6
	JS5o8CIUGySaavZ01MvIjfCK6/m62cNL0I6vpYIv5v98tNtqcCuDbDFnonf4VRDtj+w=
X-Gm-Gg: AeBDieuy0B6Hez5eSkgiWvZWRc19ar5WM2QIsAUNuNETB/vHljjd24l50kSfyMEaJkr
	uqjK8fc2NsTcmBKHDK+Hx4UIh/hB/80EALQ3ru90e0LuUvLk8+QvOilgGbaj07I24yYtMAvcgqw
	Rhlf5jh9rsTPh7MOpZsLtrIMa8RR2xHYizB/paBwXbVysikEt1/pDZFDpbqFc2cbNdUBawWLk3n
	LWvcn9hAIQACgTpAyao7xmJYx0+07Sj/nimWS1bIT+fTavpATdCVMA3EiWNudUWYOlYVStAlvNU
	Tsa17EUzoKjvnOGPsOO2IsqnmDZO0HoAB2g7Ps/OpT15Fq9D5lyMmL3POelkU0ZXjQmZd4IIHhL
	fyRTfoeoNtuPMka9d7fAFW8wRwmjdRkfkPfGp2wqD3xsfKBxmu0Fh3zlgiMmU1/2pOS5NLpPl3p
	xB7HzrR52wAElFMRCeRDYkcZURazDQc50b23aPyIoCImDQ+sgIt++nN9MhvnSrho/3Xb+EYmrTC
	w==
X-Received: by 2002:a05:6214:5191:b0:89c:6a86:e632 with SMTP id 6a1803df08f44-8b6665f1c01mr90287116d6.18.1777774961977;
        Sat, 02 May 2026 19:22:41 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c0e7d3esm83413106d6.28.2026.05.02.19.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:22:41 -0700 (PDT)
Message-ID: <5d18fabb-aac8-4a3a-ae2d-85eaf18cd4ee@riscstar.com>
Date: Sat, 2 May 2026 21:22:37 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 12:38 PM, Andrew Lunn wrote:
> Your ASCII art of the chip might be useful here as documentation.
> 
>> +  # We can't allOf reference Ethernet-controller.yaml because we end up with
>> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
>> +  # small number of the properties are useful on TC956x so we can just reference
>> +  # what we need.
> 
> Why not add an subnodes for the ethernet interfaces?

I'm going to wait to respond to this until I've had a chance
to discuss it with Daniel.  (It might be Tuesday.)

> 
>> +examples:
>> +  - |
>> +    pcie {
>> +      #address-cells = <3>;
>> +      #size-cells = <2>;
>> +
>> +      tc956x_emac0: pci@0,0 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
>> +
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
> 
> I've not got to the GPIO driver patch yet...
> 
> Is the GPIO part of the ethernet device, or part of the chip? The
> hierarchy here should match the hierarchy of the hardware.

The GPIO is part of the TC9564 chip, and is a separate IP
within it.  Within this chip there is one GPIO controller
(as well as a UART and so on), independent of the eMACs.

>> +        phy-mode = "10gbase-r";
>> +        phy-handle = <&tc956x_emac0_phy>;
>> +
>> +        mdio {
>> +          compatible = "snps,dwmac-mdio";
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          tc956x_emac0_phy: ethernet-phy@1c {
>> +            compatible = "ethernet-phy-id311c.1c12";
>> +            reg = <0x1c>;
>> +          };
>> +        };
>> +      };
>> +      pci@0,1 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50100 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
>> +
> 
> You second ethernet does not have a gpio controller?

Basically, no.  We made the decision to create a "chip"
abstraction that is responsible for managing these other
shared IP blocks (of which only the GPIO controller has
a separate driver).

Both of the PCIe endpoints are able to manipulate the
registers for the GPIO, but we made it the responsibility
of function 0--not function 1--to handle that.

It's possible that some platforms won't use the built-in
GPIO controller to manage PHY resets.  So we used this
property to signal that it was required.

So *if* the gpio-controller (and #gpio-cells) property is
present, then function 0 creates an auxiliary device for
the GPIO controller.  Otherwise something else supplies the
GPIO lines managing PHY resets.

					-Alex

> 
> 	Andrew

