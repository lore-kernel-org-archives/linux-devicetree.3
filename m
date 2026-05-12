Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7C1384CEF
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568696; cv=none; b=BaE3LXVz1ItxmUDsDVVsUWikaRFGQwoK2vrbjSWm1X8IEIbYCVKw05vwXV6NsdSxMt/w6c9eynYZJk50vzNpJ4TGpzJWMac/mqG3weUVewV9KM3owgDukcWsvfsS/gKYqf/vSTyWlEBi4iSe2GdrTgkXCq45ciQ4ZrvX8N5QWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568696; c=relaxed/simple;
	bh=lxi8xLajakE0Tg6T6kpLZptB0G8Ab6aOA9iB5uI4H74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXIMdGJEF53r25Zn2uq4DBj1fkvyMvFDTLkWUTQmu7MB+WyRikpC5Z9YyKdd85OSyr/3gtZMKimz8mwHOd9a/8ebC2Mo2oYtu+ShsnTTWp6Zkh22fpYzGnQpjUiIfQ6toh9hLlY1UsqeC1up0wZyE3tJWFpvm+PUZPrK0GOMg7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHRELdrI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHRELdrI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso58369295e9.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568685; x=1779173485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJOHNlOoAOdzligbsnHZC6gf4IGYAZ6NxFSliiwy9bU=;
        b=RHRELdrIJHNgS5a6y3h9lPy2PL5mcNWklKmwaiJnR7F9wHO/plw4HqRzOfWSVDZ4we
         GxIbBMFMb7bCWELd5Re0M9Yc8Eppubl5hZfjYRkeBusgEu0ojY2jJoe/L5ezeTSp48gG
         mGGUxfKQdLrYIyokyix2XR1ZT6tSLQ+96PjLaQLnz4ZWnBMY9XmzN/ZbYKSaLczvy9PB
         OlrPDaFMcfk4MBpMHbeRcIIuAk8M/qFmE3nG8/46rk8IjIKTA8KTacDSAjMYmvBJ5j1Z
         IesmzaN3ENfwk9h1wLOj+pCmQ1zQO6V9rzIKjxIpDOrvLXIN/+FS7cW4RreRBjjSP5sW
         Nx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568685; x=1779173485;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJOHNlOoAOdzligbsnHZC6gf4IGYAZ6NxFSliiwy9bU=;
        b=Udy/0fX59k2c6yzHaHNwoGyh3Bbm4ygVWRx4bkK3Ln6FlkugVR8pMcToRMTK+BIKjZ
         NP77zOKtkP6N5DTIPEJk91sHffKx6XmSr3oh7MCdw4JEgdighQdk3oks+GM9AgjeMHU5
         BFJYpx9NNp1TqE9ko2/L1WIFxUlEFq4KPsFf0by9zSpF3GZ7nW+FAV74/OOGPMkUb7Pp
         CSQuDn1WYLc91UczT5B2qeGxtDSifmn3/R7k+kiJe2zb3tpalYzQdTAgSZ28u/wUhAtu
         O8FCer0Bb9fQLPssyXc+cij86ax0aoGuIMay9u6eGN4mjIRc4/CL2dpxxNb9Vl5BSkFx
         sxRw==
X-Forwarded-Encrypted: i=1; AFNElJ+XphfKHlTapxdZwRM6qr6yAHe5FYCsdMtan2bVcSUi+eLVpwacC0ExCxd7L2GyfECPYkaL0Mb0JQ9f@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3XbezekeaLQiy/noXh9T0TxGOSJl7om4AUM5DOSTtcRbziD0
	5qCDp3lpQ9Hm4CJuCSIYXBKXJDoefILF9PCuEXYpfJmVAnssW6jaytJ+
X-Gm-Gg: Acq92OF6SF6BW8Oh333jRpw6JwLw6PYKqHJSr+EGlwlBclRDW3tkqJdCuiW8qYRZ86O
	vVsmpkx0Bb1Yc9s3/j3vtQHnZb1TnOI/mbZoO5GzaKYE6CGq4ReM89oWQD/dbXn1RBb41iNKly4
	yfbu2YmMHciIpGmhelv4JiXV7/ejBXDvjSxKS3p+Paw1chI3rPuuPfgN3HGQk7MyY+5H5qFI00s
	RzAEoOKwpEn8DYI2TFY0zMDgw3MDyXFdPSSdxD+B2JHg/atGPwnEFW2wRO6L4I6fpzJMjijPNVs
	xc7EJzk0D22YNC485W2IGig5VDylG/XBHRDAASaNexrJZMDKuWxFh1aRV4UH3eTwoQQiE+f2tQu
	a8rZ5imA99k0zoR2jM9ZvZR8UtwEguVtS7XLxIIQSQNbk9e6T0Dgm3GA8DHoRGaYvOtNbdur3ir
	VsdFB5783RyhWIREvhTl4kV3OZ33f06jZtbb1Jr/mpk4ObSEc4Cb26z1ysVGtyNZ8=
X-Received: by 2002:a05:600c:8888:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-48e8e200421mr24540905e9.6.1778568685238;
        Mon, 11 May 2026 23:51:25 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e634362sm12208715e9.10.2026.05.11.23.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:51:24 -0700 (PDT)
Message-ID: <4ac5bd1a-ac7a-420b-b0ce-acdcee4b20e2@gmail.com>
Date: Tue, 12 May 2026 08:51:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI
 and add SPI NOR
To: sashiko@lists.linux.dev
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20260511111116.1109643-4-a.heider@gmail.com>
 <20260512022817.879A3C2BCB0@smtp.kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260512022817.879A3C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.05.26 4:28 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Potential overvoltage risk for the W25Q64FW SPI NOR flash via the 'buck4_3v3' supply.
> - [Low] The unit-address in the 'uboot' partition node name does not match the base address in its 'reg' property.
> --
> 
> commit 470f9c74bd3cfec41ed69dd8c4e22535a7e8164f
> Author: Andre Heider <a.heider@gmail.com>
> 
> riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
> 
> This commit adds the QSPI controller node and describes the attached
> SPI NOR flash. It also provides a corresponding vendor flash partition
> layout.
> 
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> 
> [ ... ]
> 
>> @@ -166,7 +166,7 @@ buck3_1v8: buck3 {
>>   				regulator-always-on;
>>   			};
>>   
>> -			buck4 {
>> +			buck4_3v3: buck4 {
>>   				regulator-min-microvolt = <500000>;
>>   				regulator-max-microvolt = <3300000>;
>>   				regulator-ramp-delay = <5000>;
> 
> [ ... ]
> 
>> @@ -249,6 +249,47 @@ dldo7 {
>>   	};
>>   };
>>   
>> +&qspi {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&qspi_cfg>;
>> +	status = "okay";
>> +
>> +	flash@0 {
>> +		compatible = "jedec,spi-nor";
>> +		reg = <0>;
>> +		spi-max-frequency = <26500000>;
>> +		spi-rx-bus-width = <4>;
>> +		spi-tx-bus-width = <4>;
>> +		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
> 
> The commit message notes this flash is a Winbond W25Q64FWSSAQ, which is a
> strict 1.8V part. Could this vcc-supply assignment cause hardware damage?
> 
> The buck4 regulator has a maximum voltage of 3.3V. If the regulator defaults
> to 3.3V or is configured to 3.3V dynamically, it exceeds the absolute maximum
> ratings for the 1.8V W25Q series flash.

As per the comment, there's a the non controllable regulator QSPI_VCC1833 in between.
k1-milkv-jupiter.dts matches in this regard.
I'll keep it unchanged unless someone has an idea how to express that in a better way.

> 
> Is the board actually using the 3V equivalent (W25Q64JV), or does the
> regulator need stricter constraints if it exclusively powers this flash?
> 
>> +		m25p,fast-read;
>> +
>> +		partitions {
>> +			compatible = "fixed-partitions";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
> 
> [ ... ]
> 
>> +			opensbi@70000 {
>> +				reg = <0x70000 0x30000>;
>> +			};
>> +			uboot@a00000 {
>> +				reg = <0xa0000 0x760000>;
> 
> This isn't a regression, but there is a mismatch between the unit-address in
> the node name and the base address in the reg property.
> 
> Should the node be named uboot@a0000 to match the 0xa0000 address and prevent
> a compiler warning?
> 
>> +			};
>> +		};
>> +	};
>> +};
> 

