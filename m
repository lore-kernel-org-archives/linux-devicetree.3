Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE63164B4
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668331; cv=none; b=RG5jjJkQy97vhUtA6qcDLJsCHBj25nRjdtisRpJBOZ6p4kCbY5EX+Zclh4vFG16yKpI719dcAt5bbyIu8p1fhNseWHXpWHjW6Zez1xidVsUSrZ4OebP84qVzLwr3QIU+T2rhQG6eO31iyp481KP5RwFjPNlesg3Ny7NmjvTsobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668331; c=relaxed/simple;
	bh=4jXkQwGliVjo5HQ8xpKkQLE97BY4mpvsOew8INsIQk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jL9aEVJgYFN3GiQEOB0hIibM8YLHdTsaLa4K30JcW46h5/4cZ7Zx5Ex2rn0d9Z6XqeWVtKPMhCXCkTPydw01MvuVTUEXKjRZMqvx51R43GBWTvcKicpB6i6PzRchZaAVy95u2DCXL0eqvCGW2Dw1VIXZsdJ1uWUX8Hu1Ei7cJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYxp7XX9; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYxp7XX9"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12713e56abdso1508305c88.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776668329; x=1777273129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3r02hhZx3Vxqyj1q31IQgqGPj+UcnZ1kBemjU+jdaU=;
        b=XYxp7XX9CUfsbbSfbeDSXVNWeWn///m+EdCkx8eVmJt4ddO2FYnbsxLXlxK/b0vfv8
         Y/Pq17fvUM3XhrTIbRNJAS53b9Gpa9F0h4IRqPC5LXcHFIehi0F1nPUj1WWZUSBtkAqY
         w7nphHcv0sAbXTRtT2owBbnMbX0OQTNMKK6yn+W6JD3CWXtGDL8Pq67Pcl6+a4o7vONq
         0nrtuLQahOxaDOf9ZNFdDiO+a/UJ3XWk2gYgqGIL7aMQ/4YGA1T3Et/8O/ILizRaEhAO
         enUtDYcfhQVbz5ftRSTEu7KsN7+v6A+M7cV0XKKJV3S0JzqShMyWH6MKhD+XtaSgtkMu
         nHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776668329; x=1777273129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3r02hhZx3Vxqyj1q31IQgqGPj+UcnZ1kBemjU+jdaU=;
        b=GuAh46Uoz4kueXmTAW5XQ+BH5p0tljtoQwJbEmmFbh7QpoDKsNOvicDwaBxASmW8Xu
         bmcQZrr0iXmhVxMP+9+aVM0WBDk2H9c/hEJ2D4E3uR6fz24o5ml1yqD4+SY+v73nAvZF
         1ourJA1M2YWY6tlqLysqrICXQ981sBrWJ6ZXWNJCrUXmEH/y3vqPrUOhCX3fUqjNgU6n
         R2/Gc4UW2m4RD7pCZu1apyCHNdyFgQS3tiqaZptzFJQohVBpWdCcEDyTEBpIDlpPTDr+
         hczt/QT5jLMXP8cBMo49ayQwi/g3vRkXw/2aIbDyQ4yq8VrUxQPpsWk7nujPrBI7ZAY2
         hGgw==
X-Forwarded-Encrypted: i=1; AFNElJ/oh/Kiw+2taCXsIq4IQnDhiy/BcHiPHc0gHUFUifG7lqpSzguvcmlqe/ku1T0q0LBaqj4Py4ORi95W@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkt7bhd7myFQpSfu6L/c2x8h2P5SGvPO0kSOeCqSa+asyKXfjm
	M7/aOZP/YRz+qywn8obSWq+ka2sXXEzBd2JlaOkCd+NtUiVjCz9pk4ow
X-Gm-Gg: AeBDies9WSDt9OdbDgW/QfSDq3NBwlZpeG/6Uj0BejezmKEGNWlkrN9Lgrk4HzQHW+8
	RYg8/OdF8VF2U8Q4tjTHGR3BOI0PBDnV6vBoq1KvUc1IS29KXNyoLKzJb7hRGYmLfS/iIsbVLj+
	HoGUreP0lvyaolnQoKZIcJ/S8yc8NSgwMUyIXh4p/li0I+uB78PXrkFhmUbUjJ8ds6nKYZOOqtP
	3uiTGgKemmU+D3UY7XsMXP2rY0E/03ESj4D5S3dx+f7VBmZ3DxO2K5zcEV8YCXspeIG6I1R1cUo
	f6Lr59l95IoXSxt/zMfmkslT+kOC9hMkFGflT+60QK5/pTawlO8pcs7lwrOi3T6KpwO1FgzSCYW
	vO070PVfUu63T9Wnt2JNLlG/ZMfvbam9WU6KKT9Rrsy+FlrvrIZW/HNhyi4nhSrnAiGIkpXI4pv
	YB6D4b2kcc
X-Received: by 2002:a05:7022:4191:b0:12c:427:dacf with SMTP id a92af1059eb24-12c73b05ceamr5070810c88.10.1776668329484;
        Sun, 19 Apr 2026 23:58:49 -0700 (PDT)
Received: from CNSZTL-PC.lan ([2607:f130:0:13b::3a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20b9csm13380651c88.12.2026.04.19.23.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 23:58:49 -0700 (PDT)
Message-ID: <2d2b1e17-388f-431a-be86-a0f26b5be6cf@gmail.com>
Date: Mon, 20 Apr 2026 14:58:44 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Replace deprecated snps,* props
 for NanoPi R5S
To: Diederik de Haas <diederik@cknow-tech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Jonas Karlman <jonas@kwiboo.se>
References: <20260401131551.734456-1-diederik@cknow-tech.com>
 <20260401131551.734456-3-diederik@cknow-tech.com>
 <DHTSOV43O2EX.38TGASN7SQEZL@cknow-tech.com>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <DHTSOV43O2EX.38TGASN7SQEZL@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/4/15 22:23, Diederik de Haas wrote:
> On Wed Apr 1, 2026 at 3:11 PM CEST, Diederik de Haas wrote:
>> The various snps,reset-* properties are deprecated, so convert them into
>> their replacements.
>>
>> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>> index 90ce6f0e1dcf..92d044ec696b 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>> @@ -85,10 +85,6 @@ &gmac0_tx_bus2
>>   		     &gmac0_rx_bus2
>>   		     &gmac0_rgmii_clk
>>   		     &gmac0_rgmii_bus>;
>> -	snps,reset-gpio = <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
>> -	snps,reset-active-low;
>> -	/* Reset time is 15ms, 50ms for rtl8211f */
>> -	snps,reset-delays-us = <0 15000 50000>;
>>   	tx_delay = <0x3c>;
>>   	rx_delay = <0x2f>;
>>   	status = "okay";
>> @@ -100,6 +96,9 @@ rgmii_phy0: ethernet-phy@1 {
>>   		reg = <1>;
>>   		pinctrl-0 = <&gmac0_rstn_gpio0_c5_pin>;
>>   		pinctrl-names = "default";
>> +		reset-assert-us = <15000>;
>> +		reset-deassert-us = <50000>;
>> +		reset-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
>>   	};
>>   };
>>   
> 
> Please disregard/drop this patch.
> 
> I was recently made aware of 'sashiko.dev' and checked whether it had
> also checked my patch, which it did:
> https://sashiko.dev/#/patchset/20260401131551.734456-1-diederik%40cknow-tech.com
> 
> And it turns out that the concern raised is valid (thanks Quentin!), so
> this patch could introduce a regression.
> So it looks like staying with the deprecated properties is actually
> better (in this case?).

Well actually we more or less rely on U-Boot to reset the PHY first now. 
Many rockchip boards in tree require a reset before the PHY can be 
recognized, but we just use the generic "ethernet-phy-ieee802.3-c22" 
compatible.

Another option is to move the reset props to mdio node instead of PHY 
node, though.

Thanks,
Tianling.

> 
> Cheers,
>    Diederik

