Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDEC3AE71E
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 18:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782498469; cv=none; b=Ut3bwn/dr06cEFqwSYnxegHWsDPSrHigRA5x6ttzJXclO4bGo8El6z+KyMU2bmCT0Gqz7Jy2GMTFTjs1ZIDviqtSG/gpUFk3KXHGzTKAGZLnkgJ0+4Junl5iKPt08I75OQev0fgSwMCe/hH/5M4mvjtoEN4eGU6NT6kNL6aRl6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782498469; c=relaxed/simple;
	bh=lyT3EldEfOwmkWtrBBWexrVqziEG/Bbdig+0Ag3t3Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4cejNGyFq12dhhu4ZtzbEByWoSRg1fhVIWuXpzsxXVYeAEa3Mc2N2zIVKjFAKE1dzl76q0C3yRwSwnxGmOU6CNi5D1unwD5lqjv96rqTvTPOvztWR+q/1M1HXVpT8DAO30PcxFcu8XRkvqp1+iHPbwPueECzy/1mRfN1gNxAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=n/lZCXVh; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="n/lZCXVh"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a14a4d42e3so330688eaf.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782498466; x=1783103266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=krATlrD1N0cNM2rn+k1nT4wMryr7v1KxfLrh9V1RBO8=;
        b=n/lZCXVhgXWC2pwzMIxcD8af48WwPPkT+dAdcnRvuLI+EkO+bEiSQAhl+CtpTK7w+u
         M37zdEUADfpzv/dTgMKuqBNNY08vDBvxP3mwyzY5rOkonFv1n8RChRzHi9G1GbUoHVIM
         OkdfjtBsdt9inR+Ke3d4FZb6vsXFV78slIyJGyGArUBDecBd67Ldua7dSKu2JbZHv6y3
         Wsi3ma2WpwIyWQmsjmGkLIcWkTIRf9W0DsF3NvxrJrWApcuRXgERfCgIOe9+AcRpkCJS
         syu/kVWoAoujMvOVVDQIY+2yQKcAGiHHAZiF7EmSOBpTP7O+NoSEOvgOsJCfdyayg00w
         RPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782498466; x=1783103266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krATlrD1N0cNM2rn+k1nT4wMryr7v1KxfLrh9V1RBO8=;
        b=mm7ThrSJgiVouEFU5HIlX3V5pgUtyjHPAwfkAg0jby/7SXRMEiateNG56DXY9RWH00
         5mDbTsBFWT9ipkVMLFcyF2nCOrj83/qQv/mkj194ArJTbAurEjd0uZXTbPYQnSd84hiw
         qtxyXJWh8OnCusd040z+WpBaIVjaiMdMi76TTF2c5sC8JiDmWmIIbxs8/JdeJZZiK6P8
         fBleUV8A5zzVyHoVweAnhpgXdosgnU3VlUCGy4r+3NAQkScw81In9YkPW5ACykfBP2gP
         JWNtW7/F0cbSDP3VhohPT1U96Ianxt/Ht1CHzVtApY3BSlwchTaIIMrlk0Ox/GNgFyjW
         S+dg==
X-Forwarded-Encrypted: i=1; AFNElJ9lit+udlf7Z28F2qL393+u9Kq+vivk2ByDlxThyw93SujuZ/m9g9wMV4T4S403nNiFHhz6q3Opt4O3@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxVo90NCW9dZwP4NDu7oTpV6bdDhXefMAbvR992i7egp1ZzVd
	w5fwNzV7BQ18ZTv9985nuW5uva0LiOsizhGFN4YXIy7XpOi/fPHg4K2tWT2Y1u2TnEY=
X-Gm-Gg: AfdE7cm5lDwy9PkShxYEiUi6bl6GVztAjAdBYM9f1rket3U5Ii6MZsk2zRLew0JWE1f
	fFubReu21/5ah8q8CMfbSs4vGTm+f6i61EOlsn1Ln3tpTt94v3GIr7kMB1ui3i58lEV1qGz9Wkd
	8DaH6qsnhIR5b8moIRn5FbctddVY/ChJtxGYhEoAVtWRcTH7CU5rgpyOtpvRl/zl9dvUJ1YyQa7
	idvg2LD44+M2T7vuWjnWRxfCyFvKb8PYQFqx1YVeHedjXCEFumfS0yBrTWUucKbbDbd2mQNLAq1
	bBSu13hhnIo9McDY9mwme+OljZzkGYCO4FI0MtuDrgrOKh6NtnVbPYqMTx4l9Tu67FwIUqXp/5c
	B0Fabvm/gC0zhcsOYPuL4l7bBHZEo9Q4hsPWmLqDwGnTJRMbL5uurbmsSrXvJpMAYlDbZoGVyxt
	AGnow/GD7caLzzNmcvejrAPkSwHgZE8ZG3bTlfRVU5jCVcOaDF9OWsi4kDqrfToWQ=
X-Received: by 2002:a05:6820:1629:b0:67e:251a:bd3e with SMTP id 006d021491bc7-6a135185364mr5830289eaf.18.1782498465840;
        Fri, 26 Jun 2026 11:27:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f1f0:2d9f:2f31:3426? ([2600:8803:e7e4:500:f1f0:2d9f:2f31:3426])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a1414ec350sm1856375eaf.12.2026.06.26.11.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 11:27:45 -0700 (PDT)
Message-ID: <4a2c4c42-69fb-4491-ba77-b858623275ec@baylibre.com>
Date: Fri, 26 Jun 2026 13:27:44 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: iio: adc: add input-channel-rotation
 property
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-4-ceb9b0b561cb@baylibre.com>
 <20260626-retinal-thrash-1095940e36ab@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260626-retinal-thrash-1095940e36ab@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/26 11:14 AM, Conor Dooley wrote:
> On Thu, Jun 25, 2026 at 04:55:06PM -0500, David Lechner (TI) wrote:
>> Add a generic input-channel-rotation property to adc.yaml. This is a
>> feature seen frequently in ADCs that are designed to measure resistive
>> loads, such as RTDs and strain gauges. Enabling this can reduce offset
>> errors by swapping the positive and negative input channels on every
>> other conversion. This can have side-effects in timing and filter
>> response, so it is not always desirable to enable this feature in some
>> applications. Therefore, it is best to make this a property that can be
>> enabled or disabled in the device tree.
>>
>> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
>> ---
>> v2 changes:
>> * New patch.
>> ---
>>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> index 9ec1f447b565..3d52c00922c9 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> @@ -81,6 +81,13 @@ properties:
>>        ADCs usually allow choosing between internal reference sources or a pair
>>        of external pins.
>>  
>> +  input-channel-rotation:

I got some internal feedback after I sent this patch that "chopping" is the
more common terminology for this feature industry-wide, so in the next revision
I plan to change it into `input-chopping`.

>> +    type: boolean
>> +    description:
>> +      If set, the positive and negative input channels are allowed to be swapped
>> +      on every other conversion to reduce offset errors. This is also referred
>> +      to as "chop" in some datasheets.
> 
> "allowed to be swapped" means that this property says the feature can be
> used, but userspace may have to be the thing that ultimately turns it
> on?

No, I don't expect a userspace control for it. More like the driver should
enable it when possible, but a driver doesn't necessarily have to implement
it and everything will still work, just with less accuracy.

> 
>> +
>>    excitation-channels:
>>      $ref: /schemas/types.yaml#/definitions/uint32-array
>>      description:
>>
>> -- 
>> 2.43.0
>>

