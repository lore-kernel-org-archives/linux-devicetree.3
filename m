Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62398221F26
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789210952; cv=none; b=B/X6So4MWwvfIyMyiCS0AeHI1evF2EqL113/6PE5jLHwm8w4/a03cbelult1AQGbV9KNzACts1N5Zs7XIQRPgDZv1Un99OtSFZ7Ljr+EmlEoiREqiSWrvzjVsTeb1flnO/ITLIOukkwYP1p3r+s3fXt2klbEadO36lYq2owJbaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789210952; c=relaxed/simple;
	bh=6D8tm6JVnV49Wc4HiQ2KJYB99HHllQBm9FljOEs9rNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxBF9+ck/sd8wZBjrSvPnAR1Xfp6LRWDzEGYoSyrvd1aA1pp1ZzQZFZlooMJ1aEuqYBxFGEjKKPonMkKRbMSb6wqsNo9crpvltBBuq6EFy75y1yYDxfDgnsQUZDmbFFzu0I35moc24mX64MQjyDFi3TydxIiA65vK3+Md1LNGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdSYRqW6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdSYRqW6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso658372a91.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789210951; x=1789815751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5LuP0pAQuf2bi/QiOEHOd5Tvm82nmh6zdwhe3gPFHE=;
        b=VdSYRqW6NfArLTxAroOgpODO3+pZGVEqk96SChSTFa8Pf+PhiR6s30Scp5cKXwcchz
         7zXWROA5THMn8WZBwjTyLrRL4QRUB50Ag1maujXGZySCnCj69qhG0QOyUP4lMW/S5yJD
         yljSLN65l7uluJXgcOeLhLY3f2pYpDlEnQ88lRNGNS/AfgjNM1+018VaBftLv8nofGBN
         VNk4wicW9VXJcqdCscexodgak0AVNDYZabXw1gRESQfulVw/APj16oTK1GKWm8Q5AYJb
         hgCuOenFr7YYnh4DzQC16V62UWu0u3BW7A/+MWVJ7N846TyXYyqyP3OemH6qdibBmU7G
         3aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789210951; x=1789815751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5LuP0pAQuf2bi/QiOEHOd5Tvm82nmh6zdwhe3gPFHE=;
        b=bR3b1wqPC/N2lm50xfB2TSAUjz8/EXNVocl+/id4HoXNQ89MVj5O6/y+hFb6QqiD0T
         wGQBOqvc9zbkG1nc9eKFEqq6L8VI1xUOhOaVKFw8itIlMietpeQriX7mZ8HiSuiRi0EY
         Z+FvgUNl4icZbbsUZDmlbU3jQx5544pctzpJzg8UbRVlXt+iTMJNIshvozdNn+e9Xiuj
         9HB/bD3GApmxA+saS1f+oTDDYy3s3YQt9teGzpRzk7pRI/hdOoooI162kvsMxlKzvM/2
         fFTySZYoKWg3BPqV/ruQhFZ2l8O/zsMEjAWav6qfCRW8Bq2aIY1AmkNWzeXV5wSI9jCW
         mGRw==
X-Forwarded-Encrypted: i=1; AKwUvBy92AjPQkwDaUtzryNLNCeYxZ9eORZrrsX12GfURPa0f0mcoEww0t2vw03o11O8rzAXrNWQ7tI/oPCb@vger.kernel.org
X-Gm-Message-State: AFuF++mf8ozKQpCHffnZzOD0ya6m8xBTCvLxh9yXq1xiBXLsE1wuf5s8
	P44HzM7eUi+DxH482G4vbFo1hV61NIg84zelCYtjR+bmIT62qRm1QQCB
X-Gm-Gg: AYBFou3FZ8VTLKcJORSZD38qUToTrtO2/PFnZ/LR4VGynA4vznav/RN2DZwHhaA1FQD
	LL2pW8xh+/UYOfGMwFLXN9GCPwnl4RkI/7uJ35/p7xZYJo6A7FrbvohgFaBhBGIsIWjiUtuY3JH
	007EfZDy76w0m1aapFw8bTG8A4zxW+1OBMZWpxSmDYCDkFSN9NfWTj8t47JS2Pa7IOV6TPBS739
	KRRrG/L4ykHXrsZZy5f7LnCePBFP2ZR5T8r4fLFtp4m4fHANp3VUm/n38eo9WO63DyhBIm0sC+3
	Xj3+3Pb+T/PJcR7fZxu2dF0QI2zzvA0Dw0yCZKtfCGPzjNHG3QZOvTuMgUr8i6eaa9PjHG75KNK
	oewmOaODAxtRH4V/g7RZIymP+fB5SHQllidKbWFNtvZeNf8YOOraJQY7acuJOWocCKXz6YVXwue
	gudEA2aZun0g4umhjwR7nwqehzm6fweDl0SXgd+eoE4InZvL40khTIBgTiZqPKmCLnwtF/bEXQk
	pPXzXA+nYWFIBkXfbc62Q6aeefkAFbb+dIm19YxvgC63+3QOrTg9gpl
X-Received: by 2002:a17:90b:3850:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39d9c36187amr13612799a91.22.1789210950751;
        Sat, 12 Sep 2026 04:02:30 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm9521600a91.4.2026.09.12.04.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 04:02:30 -0700 (PDT)
Message-ID: <bfc92b12-5067-46c6-b1f9-0dbd42fc9470@gmail.com>
Date: Sat, 12 Sep 2026 19:02:25 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Zi-Yu Chen <zychennvt@gmail.com>,
 conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260908014526.413399-1-zychennvt@gmail.com>
 <20260908015435.7DE071F00A3A@smtp.kernel.org>
 <853110ab-1bd8-41cc-9b82-cc28002c0bed@gmail.com>
 <20260911-frisky-imperial-elephant-3336e4-mkl@pengutronix.de>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260911-frisky-imperial-elephant-3336e4-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Marc Kleine-Budde 於 2026/9/11 下午 01:56 寫道:
> On 11.09.2026 10:15:21, Jacky Huang wrote:
>>> [ ... ]
>>>> @@ -244,6 +244,58 @@ gpion: gpio@340 {
>>>>                         };
>>>>                 };
>>>>
>>>> +             can0: can@403c0000 {
>>>> +                     compatible = "bosch,m_can";
>>>> +                     reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
>>>> +                     reg-names = "m_can", "message_ram";
>>>> +                     interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                     interrupt-names = "int0", "int1";
>>>> +                     clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
>>>> +                     clock-names = "hclk", "cclk";
>>>> +                     bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
>>>> +                     status = "disabled";
>>>> +             };
>>> [Severity: Medium]
>>> Should this node include the hardware resets property (e.g.,
>>> resets = <&sys MA35D1_RESET_CANFD0>;)?
>>>
>>> Without the hardware reset line, the bosch,m_can driver cannot perform a
>>> hardware reset of the CAN controllers during probe or interface toggles.
>>> It must rely solely on software initialization, which can fail to fully
>>> recover the controller if the bootloader or a prior crashed state left
>>> the hardware in an unpredictable state.
>>>
>>> This omission pattern is identically repeated across the newly added can1,
>>> can2, and can3 nodes below.
>> The reset property is optional for the MA35D1 CAN nodes.
> yes, but....
>
>> The bosch,m_can binding does not require a reset property, and the
>> m_can driver obtains the reset control through
>> devm_reset_control_get_optional_shared().
>>
>> The MA35D1 CAN controllers also operate correctly without explicit
>> CAN reset properties in the existing platform DTS. Therefore, no
>> change is required for this patch.
> ...we've observed that the SW reset doesn't clear the CAN state and
> error counters, see commit 9271d0ea07c2 ("can: m_can: add support for
> optional reset") for details. As your SoC has a reset line connected to
> the M_CAN IP core, please add it to the dtsi.
>
> regards,
> Marc
>

Hi Marc,

Thanks for pointing this out. I agree that the hardware reset properties 
should
be described for the MA35D1 CAN controllers.

Zi-Yu, please add the corresponding CANFD reset properties to can0 
through can3 in v4.

I will re-review the updated version.

Best regards,
Jacky Huang

