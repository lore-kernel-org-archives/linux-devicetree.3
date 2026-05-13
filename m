Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ECB36605A;
	Wed, 13 May 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668296; cv=none; b=iUHUCGpyJpasm6T0DjdgKvh6ovUT4+6xEMv7TEds241mHDREnCLhuFvwnMEDuW/xfOIqQ1gLPFd0Un2kSC4SR4P5ArHHcE2R8xxNrsEj7pTe/DK83RT4vWs9Zjr7TMk+fwXOivcdTrqE+Kb2w3VNIi9hBHqz4BYlTZ2ySStDy6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668296; c=relaxed/simple;
	bh=ddoblNZZsz5wNrt8mpoM1PIZNDv3RgKjfvpiPYWJsIE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tSjq4VYY6sgUe84H+MKuVXiDgr0vRFA7CTBpPELGhiv4UYSrTjU16GTiXBe3zCTPGXzU08FxLVnxBdXbkw7U271jKP89bb6nBkk0IwE0SdR8fbAQ2Z67hcQQqNd7wzwiVaEhCCWNDI5xI4aOjkP4aYDoYmIQN1iihv7RG4RAsv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=ZDlNcLmE; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="ZDlNcLmE"
Message-ID: <2615455d-4b4b-43cb-a0eb-ee8ea3cd68fb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1778667966;
	bh=ddoblNZZsz5wNrt8mpoM1PIZNDv3RgKjfvpiPYWJsIE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ZDlNcLmEyrJkfsm2aHLedDxwtuIP7EhBNioKD/ISmamJpI9nQKIEDEn8F8AeWr9F/
	 f6dy6/7uwEyQYJKbRolYQfamFmrh62d2PiO1M8/tJWfiY4A9e0f7mTMUX+H0X7gFRj
	 urzcLDclRrXioe82NiKuzrOO4hSSAdTqr4kA2kVo=
Date: Wed, 13 May 2026 12:26:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven
 status LED
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
 <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
 <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
Content-Language: en-US
In-Reply-To: <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/13/26 10:05 AM, Neil Armstrong wrote:
> On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
>> Enable the pwm_ao_cd controller with its pinmux, and declare a
>> pwm-leds node with a heartbeat trigger.
>>
>> Also, move the xtal-clk node to restore alphabetical ordering.
> 
> Please send a separate patch for that
> 

Thanks for your review, I will add a new patch.

>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 ++++++++++++
>> +++++-----
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-
>> vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index 69d6118ba57e7..c41525a34b721 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
>>           };
>>       };
>>   -    xtal: xtal-clk {
>> -        compatible = "fixed-clock";
>> -        clock-frequency = <24000000>;
>> -        clock-output-names = "xtal";
>> -        #clock-cells = <0>;
>> -    };
>> -
>>       dc_in: regulator-dc-in {
>>           compatible = "regulator-fixed";
>>           regulator-name = "DC_IN";
>> @@ -60,6 +53,16 @@ dc_in: regulator-dc-in {
>>           regulator-always-on;
>>       };
>>   +    pwm-leds {
>> +        compatible = "pwm-leds";
>> +
>> +        status {
>> +            linux,default-trigger="heartbeat";
>> +            max-brightness = <255>;
>> +            pwms = <&pwm_ao_cd 0 30040 0>;
>> +        };
>> +    };
>> +
>>       sd_3v3: regulator-sdcard-3v3 {
>>           compatible = "regulator-fixed";
>>           regulator-name = "SD_3V3";
>> @@ -155,6 +158,13 @@ wifi32k: wifi32k {
>>           clock-frequency = <32768>;
>>               pwms = <&pwm_ab 0 30518 0>;
>>       };
>> +
>> +    xtal: xtal-clk {
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <24000000>;
>> +        clock-output-names = "xtal";
>> +        #clock-cells = <0>;
>> +    };
>>   };
>>     &pwm_ab {
>> @@ -163,6 +173,12 @@ &pwm_ab {
>>       pinctrl-names = "default";
>>   };
>>   +&pwm_ao_cd {
>> +    status = "okay";
>> +    pinctrl-0 = <&pwm_ao_c_d_pins>;
>> +    pinctrl-names = "default";
>> +};
>> +
>>   /* SDIO */
>>   &sd_emmc_a {
>>       status = "okay";
>>
> 


-- 
Best regards,
Ronald
