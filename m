Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B4F3DD87D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328039; cv=none; b=jsiqDxbyqZ5jmOt5auKaegw5qIQUV6+Xh29GvEa9hm1ZVUtZ2mHw9QcCtPDCr3FRzDCxaQx7tqarc6fENjDfQ0nFefEByjhHZ6JBTptdgwiGAhCdsjeEaTI8oH6cCgnnZoVIjbh1KNe0faRBTf5s5ZotaV0U3LTADtm7hjBU498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328039; c=relaxed/simple;
	bh=rGoAurEoLA1pXl7F+SSgjSYQ9FrcIc5baVLYJPGEd/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArwdcfmtgTUtr/TD3iY8s4DA2R44AqGDQkh5TgCDTj8bgruGl6SUrrVzscNGCEooP0jAbvZDeV3h9AYiIoMzFqTa1z1cUSuS/PRQTXnqkQ+VcN8YTMsbcF7LeD9+YpgUSyrbxt5iUHgObTR7QBsQ1Ie9WLspTRhz1j+V71KWtzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+eH5+8D; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+eH5+8D"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec429c2bb1so203721266b.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328033; x=1780932833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8VgCm9XB5VMkj9oTgzpT73+TANb1YKCvjZzDgyzRqo=;
        b=D+eH5+8D5Vzl51WnNYw1gTxplbFtDQpfjERXHSs3a26NCYVo3Qj35dWVVStC3MWq0c
         neZiAXS54jjIwMZ39rLUw286fncUn0UenpusP1RplP6qyhiMqE+sfQt1iftY2pK91GlQ
         MevQxfxAjoiPsjdjAQB5HCNT8mDia5Jgj0Sbc4gRrUHXYuQqThhY0rpBbayLZamztrY5
         n07vbQ+3Sah9kvOpzPp22kiyGowgVBMa615Rt/WoPfATrVuzE9Sw2MH9hk+XI+7whN15
         j2mgwURUvwIssfmdWn5yk1ikCOIxOsb7AhA9FUJwIwoHUfuE3iCGg+C0ZlPw/Pn8Xuix
         /GGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328033; x=1780932833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8VgCm9XB5VMkj9oTgzpT73+TANb1YKCvjZzDgyzRqo=;
        b=B0/v7Na8y+9yYsKpcyr1rRgU/55Ha20zoDMrVqXwzEWPnIP8bw4x4u7qmlpqosXM0q
         gPLiZzPGsUlsk2JmO0jGTxJKJWdrdOaIRkTsPMe6UIw3bit1LRHDDwT6/VDQoq1wxdDu
         sSdEif1u8JOUMZZb6AsU6rj2ldZ+hDHxPbFkqgRpusDvUw1YAHJ/7so/rOV2ZJZ6h1DJ
         Txbk989duh6DpuI+E6dfnGHJP4vW7ei8WuOfQZigKZEu9xyOi9wtB86UFtxMlWujHr1j
         rJjJxUij1TLA0A/CJFNtooMBgdrrH341vV0Y06oi3DfL/fB9fslLHK4Fy432LVTXUKOF
         9dMA==
X-Forwarded-Encrypted: i=1; AFNElJ+8iwi7DvIF0Ht0MduotZ+qQzYso03NmJIPJ18r1iDdvFMPg7w57L/tbQflMHOIoxGB3FyupdZWEw7w@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxO0oyS5GV5mHFYNGLPUE98H8OofG5TjmSx8qeRIwH2kksSr+
	e8rmLfFW3ar8WoC3m+o0annzQicVAsobfnLxKwEjGsVEn9++u7+MER7l
X-Gm-Gg: Acq92OFLfTx16spNrJ8bxWn0szmIRPAs686JkBWeoX7gBeUDaDhq/GR2uIYijdSHeN7
	XTN/AsslbvfHWV6pkUqfIl1BhwsSohP8nz/wtO+elCnkTXDgSvGk3RwA7v9nEtGhOB4tlc/dkhJ
	feX9GvIvgqreBjOGt4kuDsxEM8LdlKNXPCfuUHTenTDTFW6tqQVp+RtxWOt3/BJxhNqHFlFxnDt
	NK7JPSghWYVdq5Z5QmjJ0z34jtvmQLoCcKG9TXly6YtOxdS9P0v/Jtb4l7jABc+5/5ipMtpbIR2
	PTGlCYCEwocShkbN8NCZ/mstHe8UcpfJsGxrChvOFcf/fmDANSvf9hQ8Fr/1fCYC2l14i4I77mn
	TMnSGbimB5uOzyQBap6kjzYbzmmsA6yIa2mJ0v7VLFBy/4Pgxr03T4vbHOSmcJNMusH6Zd3JCSA
	AI8h2Z63MOKH5kVc8qKzglqyHsBY6VNwBeccvI8Yj+tmuIPWNOfTUcbY/KNwZhX2hQAZNO
X-Received: by 2002:a17:906:9fc8:b0:ba1:1181:b773 with SMTP id a640c23a62f3a-beaafceff43mr619978166b.10.1780328032881;
        Mon, 01 Jun 2026 08:33:52 -0700 (PDT)
Received: from [192.168.1.30] (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee94d11126sm43162366b.27.2026.06.01.08.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 08:33:52 -0700 (PDT)
Message-ID: <4198bedb-807e-4330-9172-f12928d446a8@gmail.com>
Date: Mon, 1 Jun 2026 17:33:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260601150752.666393-3-zstaseg@gmail.com>
 <20260601151907.AD44F1F00A1B@smtp.kernel.org>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <20260601151907.AD44F1F00A1B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/26 5:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The SBU port in the USB-C connector node has a mismatched unit-address and reg property (`port@2` with `reg = <1>`).
> - [Low] Invalid 'mem-type' property in the ramoops node.
> --
> 
> commit 444192d5f33eb93dfce53fe410ae77991af6102e
> Author: Stanislav Zaikin <zstaseg@gmail.com>
> 
> arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
> 
> This commit adds devicetree support for the Xiaomi 12 Lite 5G handset,
> including display, touchscreen, UFS, buttons, regulators, remote
> processors, and USB device mode.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
>> new file mode 100644
>> index 0000000000000..ec795f8adc467
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> [ ... ]
> 
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg = <1>;
> 
> [Severity: Medium]
> Is this port index correct for the SBU endpoint? The devicetree specification
> requires the unit-address (@2) to match the first address in the reg property.
> 
> Additionally, the usb-connector binding assigns fixed indices to ports:
> reg = <0> for High Speed, reg = <1> for SuperSpeed, and reg = <2> for SBU.
> Using reg = <1> here for the SBU port violates the schema and might logically
> miswire the SBU mux to the SuperSpeed data graph port index, breaking
> alternate mode routing. It will also generate a dtc unit_address_vs_reg
> mismatch warning.

Right, sorry, forgot to run CHECK_DTBS=1 before sending this time. Will 
fix in v9.

> 
>> +		cdsp_mem: cdsp@9c700000 {
>> +			reg = <0x0 0x9c700000 0x0 0x1e00000>;
>> +			no-map;
>> +		};
>> +
>> +		ramoops@a9000000 {
>> +			compatible = "ramoops";
>> +			reg = <0x0 0xa9000000 0x0 0x200000>;
>> +			mem-type = <2>;
> 
> [Severity: Low]
> Does this mem-type property pass upstream validation? This appears to be a
> downstream addition historically used to force memory caching attributes,
> which is not supported by the upstream ramoops bindings.
> 
> Leaving this in will trigger a dtbs_check validation failure. Upstream
> typically handles memory attributes via standard reserved-memory properties
> like no-map.

This one passes dtbs check.

Another thing that it complains about - memory-region for ipa node but 
this relies on Dmitry's patch [0]

[0] - 
https://lore.kernel.org/all/20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com/

-- 
Best regards,
Stanislav
