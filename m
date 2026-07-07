Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321E640D560
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428244; cv=none; b=CJWhm8JPqUkyyXtiqNc/isDPzk0eT39zat3OVCwrbAb1W97NSJmZQCgAKGPZaDL2sst8EYYZa9E6f2pPIPIlh8D25aRbjMgQ51wFFwlJnTBTZvkrch1SbZIwhBrmwfmptf5MGEl3hVZo0DDDbtN4Bew16tfOiz7qV4yebO4pqKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428244; c=relaxed/simple;
	bh=CDnqZHdocFig8h3Tanxr3bQlY6m1Sfvqwn7GqTyyedY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fWdPtUnjwNVe2switHEhGwROQTjqpBt1EFeojBruKa7dGLBun6cQNnbc0I3xrPOb+lwMOgKh0Wfd9HJlP5Upqgz4fnVqxbmip+SEimUQnQKOYMo9kAGu7U1jKaKERu58QLUpwObz6YdroX+N8uTl1Xh2erGGVJd4tGBhMcrKMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JRSkNDU/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JRSkNDU/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso5428193a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783428242; x=1784033042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vVwOc/plNKfiMmUT69quLhKzOtBT2oBK3V8CnUtJXVU=;
        b=JRSkNDU/znoUHhBnA37hdXSD4ER9kM/anVTE9QbYTCtYlm8m/gAhJgl+qJ6yltKdje
         H2c0y+Gr7noFqFIRlYqYrcCBIOLR7Z9rLjcidfgPK2mw/EWWIknF+7P2Jzyn82q21pqA
         3yDop0ZR6fmlkCbmO4CMndSF+V7HjflFH/m2bv+ZgfVwBKN/C7n4ojsGSo4Hp/y4loY1
         0F7Y7RLTFE/eQZr6kGrYAkGh2boPwyXRi1ytf70e7Q0JFplBhojRNm4nhtZdvLmjzKXv
         12uQ6tU4/1sNQgCADAMbaeLIg1/HOoQ6bZtY0nc3LrlM+PMSVM9rWpZ3SEP/+xN8xURu
         KSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428242; x=1784033042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVwOc/plNKfiMmUT69quLhKzOtBT2oBK3V8CnUtJXVU=;
        b=QV3NENonUKaC4KnKCUaEoqtKPlp53/jp1m8s2YdNL5AblnLL3glKo4dYmbAYSTlzCc
         srml58T8nqndPgQ/vKOx9eZgwfWfDvWuM6QyW6y8OASVM5pG6yxiscFiLo7CYgk1I8pO
         +jA2XautvWqCcsGZiFe3H8I1ijg146owCuPejiim7pdWAN9teHKfyDqQiwKJZY4sZygI
         Q3pg9kFQqIgu1URoJcTZGr4k9zpk94GWRG3jW3yYYZOsXkttZsMi8EAg9BNUr9WSInde
         y26JYT2PkH+HBESzebKBBUDVOUSqO43KkxkTplHA6cYIuNm06Sd1PirMAwFMVhbthLwa
         kTNg==
X-Forwarded-Encrypted: i=1; AHgh+RpwpLmI0AiOUZTf3fvqD5W37TUDZSuuFTk1PNFMwZl5S6+7POo0BNMzX1AUrGl0F4HjwrbRrygpkUhb@vger.kernel.org
X-Gm-Message-State: AOJu0YykwdLcl56lPIk/D8TUtLH5BeRK+2xrJ2lZy7XlaDA3PN3OUT9X
	vzpSRdgyO1zwoOYBrILJNB9LvDaIkyZBlLIRRDLAVVKSGi+Jn+XL5gaZ0fA5He7Kqkg=
X-Gm-Gg: AfdE7cnChfQB/R4bPVUtPUG4xW90t1FBFdzpfUC9FAnY5zwL+qVcQTcL0h7iNZy+Y4q
	CsV3JX1cqseUP0l8pzfhRnKiIYWcDtZmtCPMctVWK7uDifNL7TJZmOrl42nQB8B0Z0eHJ5dKAwE
	7JkD+TImBuIa8xdtCZj0gZG/0giUdX3u4rgRCpGmpVCLYoQUZKbFbsfdpebKo2zMIHudb+M2yNx
	7Wu3gL9ZhKMjrkUOifAL5Ybjmsc1jDs/ygdjf0N9BOMsGXTJ1ajOmnq3+AUtFiGUkz6xyauu6ts
	rYXS9q+vKJ2XKGXC6OGupKPptdvHEe9uy0dhkrBJBAj0KN4KlVuxwNY07CthjDyvWOjY4r9xyQN
	B2tagK/kujkpmQmVT6daXyOx27/NJI+vyvNpZeTq0evRI7PPbFS5112TIogtS/6PUauS+AEb5UC
	ulwWuDJBdGJZ0eJDqV/yUD7UQ7aV5IFFU4aAQp4FjKS4XrgQGAJ3ESwFXPTfZY
X-Received: by 2002:a05:6402:40cf:b0:69a:a4bb:bfc0 with SMTP id 4fb4d7f45d1cf-69aa4bbc2e2mr209995a12.11.1783428241439;
        Tue, 07 Jul 2026 05:44:01 -0700 (PDT)
Received: from [192.168.2.177] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm5751522a12.12.2026.07.07.05.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:44:01 -0700 (PDT)
Message-ID: <53f3621f-3888-45f3-b319-95efa36fb0f2@suse.com>
Date: Tue, 7 Jul 2026 14:43:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, Sean Young <sean@mess.org>,
 Julian Braha <julianbraha@gmail.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <300b6fb4ba2c9399297b4bd85cbb3bc14f08f6b7.1783097764.git.andrea.porta@suse.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <300b6fb4ba2c9399297b4bd85cbb3bc14f08f6b7.1783097764.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/07/2026 19:05, Andrea della Porta wrote:
> From: Stanimir Varbanov <svarbanov@suse.de>
> 
> The RP1 chipset used on the Raspberry Pi 5 features an integrated
> PWM controller to drive the cooling fan.
> 
> Add the corresponding DT node for this PWM controller.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
>   arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..748be8f1ee9e2 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
>   };
>   
>   &rp1_gpio {
> +	fan_pwm_default_state: fan-pwm-default-state {
> +		function = "pwm1";
> +		pins = "gpio45";
> +		bias-pull-down;
> +	};
> +
>   	usb_vbus_default_state: usb-vbus-default-state {
>   		function = "vbus1";
>   		groups = "vbus1";
> @@ -94,6 +100,12 @@ &rp1_i2c6 {
>   	pinctrl-names = "default";
>   };
>   
> +&rp1_pwm1 {
> +	pinctrl-0 = <&fan_pwm_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>   &rp1_usb0 {
>   	pinctrl-0 = <&usb_vbus_default_state>;
>   	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> index 16f5359395835..df4c2d09c8d34 100644
> --- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> @@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
>   		clocks = <&rp1_clocks RP1_CLK_SYS>;
>   		i2c-scl-rising-time-ns = <65>;
>   		i2c-scl-falling-time-ns = <100>;
> +		status = "disabled";
> +	};
>   
> +	rp1_pwm1: pwm@4009c000 {
> +		compatible = "raspberrypi,rp1-pwm";
> +		reg = <0x00 0x4009c000  0x0 0x100>;
> +		clocks = <&rp1_clocks RP1_CLK_PWM1>;
> +		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
> +		assigned-clock-rates = <50000000>;
> +		#pwm-cells = <3>;
>   		status = "disabled";
>   	};
>   

