Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE9938D41C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588301; cv=none; b=YdrwL0MsU5nsz2r7r2SsDMMAghJdKg1KQETm5ephHlToH5OY4MvmzALdHuczpmGUrx0mJglHy2HTCKJHZ5Pl91ObzVZyaiMjWu5iLepfNdBhFSmCCGj6HolQPdaWWay9JR5yCP4caJ/f1AHnrmt2wfpxiW0FSlPfk8/QVw4FXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588301; c=relaxed/simple;
	bh=ZnPCtHUMI4pJAkFESK7iqLi0XSZcQX947eKedny7HSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiUvkb4a6Aacj9ScKaQLVt0FC4E+14SNBND7braVDjHfcuVu5VlvVSs0wHehljDRhe9wvsikgra95ZZeDfMFLenMeAKQrlA3OzbI+WhgEmyRdmoZxtxfMw6z4c4UvdQTTIjm7VxplFEccQZ7i0gGtdfNI3GxW9J9KFMpZipgMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgqaX6iy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgqaX6iy"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44c350a5b87so3370842f8f.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588298; x=1779193098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLtu5I2VPxS4rnf9+Ng1zxRyZw5rRL7GPGSnHNWUIvY=;
        b=SgqaX6iymkMTvYm3FUVlWTsWlavpTAlGHVrtz22VNqbumGcTYUqN5WdtCaPvJWK9w5
         FFcS2/u7iMPtl8C7OyqjTMIQcw7Q9YBNZiB13OrLzDgjcAmw239oRdqstmKXD51X1ywG
         BhpqHH0/bPxxlfdN4+zTjDU89hhllRu+Wi2W6tkwWuIs4Dr+vzXvuAN08oBTLV5FI6Qh
         AAPgdhR9MBr/0RPayFEMD6PCSIa0IzpbGv9RpkLhzsohQEP7rs1m1dNzUvMZUwJUeyz/
         ZHfAjy9CLkXCqtQvEfHmlX/IAwkUnKVVsulRjCrgXLHiT5YsyF5xM3+4pDXDazqpyA0Z
         TfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588298; x=1779193098;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLtu5I2VPxS4rnf9+Ng1zxRyZw5rRL7GPGSnHNWUIvY=;
        b=VZCBceVdJcejtKAh8LCr7J9dgAEEtDdOhegq8H77XWidx4yOQp0KCfopT9QHoTo83J
         F+zu2pHtaFqyj7/dISQctHoD86E6UDNAnM/NqAgmMvJn7cAY9tUJeLLOdkty4T2W5mPi
         DlZm2iV7/LJeVdE2+PxYutH8L5oDoPeCqE0EtMmkxND8puSNji66y9A3D+/JyfXii1ni
         aWc3p9sFm5bue+znln6PISg1kKiRsPv0lsoQgZ0uwQ4fi8MIHweIWbFi9gFMIcls+8N0
         8/dUrAih6PkaeJjwYsU2o85pL7bGXyyaz+LTxbFCxQyrkPLyRvzwR4knSp9dTylm/3b3
         jVIg==
X-Forwarded-Encrypted: i=1; AFNElJ+9jKGTLvksWfZykJu4WvHM/E3VhOePz/tZYrmqkygey/efE2cCPa7KPirFfybDbTHzo/ASQYY1j2wk@vger.kernel.org
X-Gm-Message-State: AOJu0YxCY95OTHrhdPj6q69vm/Z+ATohPqfvRU3QlPDtBrdn5FNdCktR
	CHAologr+A7NtRdY+j/MRiGRVMli5ZXI47rGN8MgOkVHcWlFAXs9cXI7
X-Gm-Gg: Acq92OFjXIIMZEOybUodaunCk1kGdfZ3mRTflcP7UajzC8XCEhMk7kE1GXJtJNi0T6J
	w4G0qhP6j8qYx+epe/1rcqzH0CevZwu7/Rz8INK45b+gVKuW224hly5NLRKwHkGp0U5lAtmNOIc
	Ly73b+nLJ6mtOFBvUxh4lj2pRcAmuDiHPYzd+AE/DLI0Gnr6f8NwVGelgrcTcRMUaZdiARV0sMz
	mHLBF6G380a0D64NF5A0mt2dfQ/xQqi00VAXYTfEaxtRvIDNiaxJQ789sllqGgsEcX7ZE1tTL/W
	SvVh8U1D9OBDk7CE1nP1xpcaG+3UyByvyoHTVJvWS3X6jbYCZM/b5/Gv0eHsZ7V/n4woijdxYhk
	tvlQr+xfu1CvfIGrJaU7mVNZo3nzyz7jLIkiEdfzGEym75m/3SMXcQPZP4aW/+jLxgmx2uITt/S
	zq5dy3qrIwq/qovYjb1hq5Tv8WDetbxlEc2sse0RUSL64Ib2J68Dz8KpNlY4vwgrM=
X-Received: by 2002:a05:6000:2406:b0:452:65d:e108 with SMTP id ffacd0b85a97d-45b12a0d3femr4266473f8f.3.1778588298121;
        Tue, 12 May 2026 05:18:18 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491e94c0fsm33427369f8f.32.2026.05.12.05.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:18:17 -0700 (PDT)
Message-ID: <2fb2b317-5d73-4529-817b-86890d9fb3ee@gmail.com>
Date: Tue, 12 May 2026 14:18:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI
 and add SPI NOR
To: Rob Herring <robh@kernel.org>
Cc: sashiko@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260511111116.1109643-4-a.heider@gmail.com>
 <20260512022817.879A3C2BCB0@smtp.kernel.org>
 <4ac5bd1a-ac7a-420b-b0ce-acdcee4b20e2@gmail.com>
 <CAL_JsqLx6uwsjTHgcmqRKu32Mh4vJPu=u=N7DjVeGAaK04mOWg@mail.gmail.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqLx6uwsjTHgcmqRKu32Mh4vJPu=u=N7DjVeGAaK04mOWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.05.26 1:55 PM, Rob Herring wrote:
> On Tue, May 12, 2026 at 1:51 AM Andre Heider <a.heider@gmail.com> wrote:
>>
>> On 12.05.26 4:28 AM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [High] Potential overvoltage risk for the W25Q64FW SPI NOR flash via the 'buck4_3v3' supply.
>>> - [Low] The unit-address in the 'uboot' partition node name does not match the base address in its 'reg' property.
>>> --
>>>
>>> commit 470f9c74bd3cfec41ed69dd8c4e22535a7e8164f
>>> Author: Andre Heider <a.heider@gmail.com>
>>>
>>> riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
>>>
>>> This commit adds the QSPI controller node and describes the attached
>>> SPI NOR flash. It also provides a corresponding vendor flash partition
>>> layout.
>>>
>>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>>>> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>>>> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>>>
>>> [ ... ]
>>>
>>>> @@ -166,7 +166,7 @@ buck3_1v8: buck3 {
>>>>                               regulator-always-on;
>>>>                       };
>>>>
>>>> -                    buck4 {
>>>> +                    buck4_3v3: buck4 {
>>>>                               regulator-min-microvolt = <500000>;
>>>>                               regulator-max-microvolt = <3300000>;
>>>>                               regulator-ramp-delay = <5000>;
>>>
>>> [ ... ]
>>>
>>>> @@ -249,6 +249,47 @@ dldo7 {
>>>>       };
>>>>    };
>>>>
>>>> +&qspi {
>>>> +    pinctrl-names = "default";
>>>> +    pinctrl-0 = <&qspi_cfg>;
>>>> +    status = "okay";
>>>> +
>>>> +    flash@0 {
>>>> +            compatible = "jedec,spi-nor";
>>>> +            reg = <0>;
>>>> +            spi-max-frequency = <26500000>;
>>>> +            spi-rx-bus-width = <4>;
>>>> +            spi-tx-bus-width = <4>;
>>>> +            vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
>>>
>>> The commit message notes this flash is a Winbond W25Q64FWSSAQ, which is a
>>> strict 1.8V part. Could this vcc-supply assignment cause hardware damage?
>>>
>>> The buck4 regulator has a maximum voltage of 3.3V. If the regulator defaults
>>> to 3.3V or is configured to 3.3V dynamically, it exceeds the absolute maximum
>>> ratings for the 1.8V W25Q series flash.
>>
>> As per the comment, there's a the non controllable regulator QSPI_VCC1833 in between.
>> k1-milkv-jupiter.dts matches in this regard.
>> I'll keep it unchanged unless someone has an idea how to express that in a better way.
> 
> That's what we have fixed-regulator binding for. It can take an input supply.

Yeah, I was just trying to avoid the "non controllable" comment with a request to get rid of it ;)
But I guess if I have a consumer that's fine.

Note that dtbs_check passes, AFAICT sashiko is the only instance noticing it.

Thanks,
Andre
