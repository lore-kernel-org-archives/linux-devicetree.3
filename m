Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329E3672B9
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588455; cv=none; b=BsnsgBXuTcevjTOuyRsbVr7ro+VmWHNDtaePUdxvCIDNitbE++zDYNzbVn8ow+ZuP++oDw9Ixl9BFAgycG4K+obVRlbYN+XTuSMmQb1YZJiEfapqm85aIjIKkCBHuH/RpUuGvYDqe07hZreQ+hbNGiJQD3rUcFUDqICAsREGMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588455; c=relaxed/simple;
	bh=7SP+tpQC7/RleL3IvjZFwBLSatpQVTWn6uCxFw5dSFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NS/bE8w17QQtB6RsB3z6u3JPLlMpr1yZ9Tb4MrAVv4yCtQrdbjXFZzSVgyIojiMPFzQVtOWou8MNRwkl1Zb9e0ZaFZX4AI1doa9kpEjTGjY00k/Lf477bQAT68p3vn/sZhrjz2a8pB3WPniED+WwRN7dCJFdEDPPckqDRwi0qZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZ4FOuS6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZ4FOuS6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44509921fbcso2772032f8f.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588452; x=1779193252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAedPaQpPe7CcNir+E8j0QYU1SXE2Pa0U/4eeZrHwts=;
        b=TZ4FOuS6gWn5ku7dlJ/cfx7EUAoafUZmsQsQikx0O0oNbYL9JkOu9d5KWLnGpxmYCm
         SObCqQD8tiQdHBfnpVUxdDfquEUxSU2B0x3rcJcGq4HooqtyC+V4vXX5ZEzcz0FFY9Oa
         2Eg0PFHT33B4pfh/BXFSnAVuhLJ6/CskfGfsOhkQQcuc0755FOLUBokwMh53bY+R8vBp
         DdxJYkldY75yc6JLNArndc4OOQTFMQj3rLaxZ4OrHIkvSG+GnYSb8o2NTy3xhqYeZ9C1
         av/H6prInNQLH8jXs1QZ4oR68eeR3XZ90AmqH+3HGUh82CE8EHl9vaLotdiyLAKWc3ar
         RIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588452; x=1779193252;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAedPaQpPe7CcNir+E8j0QYU1SXE2Pa0U/4eeZrHwts=;
        b=SaejZmmpMreTWn/eLE+lErhCktWvKo+Ws7fh3Efwzx7HLqL7QxE3m63iAKFFrmy1JX
         803uYbndj0H4rRkLGVTllZC6fLVRzcHGWocrrEqTBB83qn/wslqPEIufx9HH/3nMz7j2
         Yyga3Tv3+WUkt4du+dQBKqYzlgsN2gzkkldCk/0AOLIaROgGPBgmUePk6TzMLoUvtq62
         dw0TIkhOdODfv0Trb7xnTyR4Au40oSLx9JaPnzTkvrFGMyPRMXk2FLQ3V2ahIDzq0WXJ
         NuxW8fJUJiddbogoQQ6uQRkax8ceg4moUEbfKaxf5CatIenox+L5CoTRakDT2JCqTI7H
         XAug==
X-Forwarded-Encrypted: i=1; AFNElJ/d1He1OwR2LEw6L2Kc0jjguXXMv7IEV5bQ+8znkGaBTNrgTlw/UK5PWUgU/8QS6LjjoqkiEaUw6dii@vger.kernel.org
X-Gm-Message-State: AOJu0YzejeYeaQ0jjYr1syaPOH/xxSJF48cIxq8DOyiCkXax9UAR0l/U
	gdop4L0DKIZrnxpMeKDeOylg7V431JW61HB8PN6FEb5o35kFWFDFp0Yx
X-Gm-Gg: Acq92OG6xYaaqw+ppZwhAxNirpQYRUnBu1V4RBCHRq7H1OjD7NOg4Ymw/brLPjbu8DU
	I4RSM7XEkjwGewOt7tGGahtQeSUMTPA+eh+inj/aQRZJkdhIctyU/PJ6Pyv8QEWny9w8jsi2vqv
	5nXDR7NIwav9pC/m9xWEqCzHDJJmnVRWLhRbtf6p9VEBnC4eFEq2ijmgfbQgZc5dXia/MSCkFGK
	zjo9DfPzawR/Ol1wmrEIt2HAUVNNDhAmm1Z+bgao4Oah524/oacZOwx4pLpNkXD7Mqy4+979VRd
	/rXR3tnqW+9FiZUu7U8T2EvvyW3AhH63ZRWioeTb7mC/Qajn+fbKFTsnqLhpcJe2fk3xHLlf3rQ
	QfzTbgkDeYXcyzwUqFamJGoYfTBagevFjT8IGRPBeZwjc7SauSB0ccu3655mgUK8wOLVSUvCAHQ
	osdjWJyJb3eY+tZHx6E6ntPqH3S2mFK5ZCTIcKpE+YA3xILg4DHWjtCcKZJMMsQrU=
X-Received: by 2002:a5d:64e3:0:b0:441:1cf8:be9b with SMTP id ffacd0b85a97d-4515d9a06cemr43636765f8f.37.1778588450808;
        Tue, 12 May 2026 05:20:50 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm32022927f8f.34.2026.05.12.05.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:20:50 -0700 (PDT)
Message-ID: <a41f87cc-55e4-4a48-bbee-d863e5a4b00a@gmail.com>
Date: Tue, 12 May 2026 14:20:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-2-a.heider@gmail.com>
 <20260512113913-GKH3624147@kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260512113913-GKH3624147@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.05.26 1:39 PM, Yixun Lan wrote:
> Hi Andre,
> 
> On 13:11 Mon 11 May     , Andre Heider wrote:
>> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
>> for the board's power infrastructure and voltage regulation support.
>>
>> Signed-off-by: Andre Heider <a.heider@gmail.com>
>> ---
>>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
>>   1 file changed, 144 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> index 29e333b670cf0..88c35ad1ef2ae 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> @@ -17,6 +17,7 @@ / {
>>   	aliases {
>>   		ethernet0 = &eth0;
>>   		serial0 = &uart0;
>> +		i2c8 = &i2c8;
>>   	};
>>   
>>   	chosen {
>> @@ -33,6 +34,25 @@ led1 {
>>   			default-state = "on";
>>   		};
>>   	};
>> +
> ..
>> +	reg_usb_vbus: regulator-usb-vbus {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USBVBUS";
>> +		regulator-min-microvolt = <12000000>;
>> +		regulator-max-microvolt = <12000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
> I think you can further drop above regulator, which merely serve as vin-supply
> and not used by devices, plus it's a non-controllable fixed regulator

It is, but as mentioned on the cover letter I left this one as it's consistent with the other k1 boards.
I don't care either way, so I'll just drop it.

Thanks,
Andre

> 
>> +
>> +	reg_vcc_4v0: regulator-vcc-40v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC4V0";
>> +		regulator-min-microvolt = <4000000>;
>> +		regulator-max-microvolt = <4000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		vin-supply = <&reg_usb_vbus>;
>> +	};
>>   };
>>   
>>   &emmc {
>> @@ -72,6 +92,130 @@ &pdma {
>>   	status = "okay";
>>   };
>>   
>> +&i2c8 {
>> +	pinctrl-0 = <&i2c8_cfg>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +
>> +	pmic@41 {
>> +		compatible = "spacemit,p1";
>> +		reg = <0x41>;
>> +		interrupts = <64>;
>> +		vin1-supply = <&reg_vcc_4v0>;
>> +		vin2-supply = <&reg_vcc_4v0>;
>> +		vin3-supply = <&reg_vcc_4v0>;
>> +		vin4-supply = <&reg_vcc_4v0>;
>> +		vin5-supply = <&reg_vcc_4v0>;
>> +		vin6-supply = <&reg_vcc_4v0>;
>> +		aldoin-supply = <&reg_vcc_4v0>;
>> +		dldoin1-supply = <&buck5>;
>> +		dldoin2-supply = <&buck5>;
>> +
>> +		regulators {
>> +			buck1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3300000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck5: buck5 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck6 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			aldo1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-boot-on;
>> +			};
>> +
>> +			aldo2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			aldo3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			aldo4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-boot-on;
>> +			};
>> +
>> +			dldo2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			dldo5 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo6 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			dldo7 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-0 = <&uart0_2_cfg>;
>>   	pinctrl-names = "default";
>> -- 
>> 2.53.0
>>
>>
> 

