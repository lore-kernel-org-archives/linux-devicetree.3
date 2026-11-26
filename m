Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692204;
	b=HEnC+ZMRhLOJTzgBoSwPzJ7gi0GkKiQr033Tqv23ZgJ5qVDU2InHxz7t8jOskY3zN71n
	 uOOhL1bD1Qm5MeYletNKqEfTLwlSd9+5XI9GTGXBqEXNvcsqTV/RIsvS6A6tl6HqwyQb/
	 srFNPLRgqTQTOyCgqsQLgrGlTt2t7cEq3kuUkQ01OEhEGNjrYH04qwGcXgJIFkQv8pRS3
	 tRWYs3TivluoA+6XC8erlscttoK7qxFHUK2EY9e6n22rXKIlmeOsl2DeZAKCW4AOWMugk
	 HrBumXZif8yg1AnbV72S95jMRQNm6Wc/E1twnVKMmHBlxlhkkf8/nswnSeoWFQMQHMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nkVHTBWGRkEmPj0y0p+bGJ739Ifet0BlvM+VCtljhP0=;
	b=EsAUhXy1qVKLFw/BlZxTEHlhihu/9DwTMYCPuIeur4ygmxeam1QwHCTPHd/u/KYtxSzT
	 FQABusSagx6SteDCQMxhwoHtIZ+9C0L4t8fczqyovNFlOcLyNij/0FPyYZcINkuo20CaB
	 TSqou8EnWFRAE2CMRYq6ZwYQ3aDWs1bt09XJsKTtYqqoBwaJrqif1A4f6HthIxcGBsvv8
	 ok9cLbKqXULDFsnfc6OvwmtvTl0RdZ84g64YoUNHR1eZbzv0dtNnWgK+/I2Yokoc+GAW+
	 ouDgHQ6+OyvnNt5skazFGmYqINueNyraIsk6Pl6P85Pl/+0WUtMS/gEaR0+GQ57kWVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lrYSgtMC;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F52606A692
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F52606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lrYSgtMC
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4716d76fso714059e87.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795692202; x=1796297002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkVHTBWGRkEmPj0y0p+bGJ739Ifet0BlvM+VCtljhP0=;
        b=lrYSgtMCrESJBFokuoEjstgT0mV42/g7ywFU2W8mYFTCtK2+ri2Nw5YeyTEfXxzUFz
         uxh78hcP/h6G4FxUzs1L+xG13Y9Eh+8HlWzvc3xanKDMUDfHCsDomSD2R6kBBvormnkv
         pqeUyY0AL39Cw22AksXMAPwAes7vNWB7hxEE+AhrCG+XGTCeMIelkoBRi5bQAQvVoHrZ
         m3T9I3UtIN3KbkNwKlU6p5cMNZ4lqAACgJMl1jeAxQX9yJrYZdktam9OXCguCvZzyQaH
         NBjRs06aWGpKVKlSlGRTAhqk3AvKukeUxZ9JvsJzNrYJEKL9LlS/FW8I2HiiUP4KO2bh
         tCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692202; x=1796297002;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkVHTBWGRkEmPj0y0p+bGJ739Ifet0BlvM+VCtljhP0=;
        b=JSTJ/vrHLVLiG3vk7sE8zJTwiQcSHNT5Z5XbDuCVLCtjUd61VDUIMdzY/wfjFTbMfv
         0bfCHOG/LyX7OJsCE/H1lLZYdW279S+ID2QLD6JORfV/XVVns8VojubLeK1GzyNt6nk4
         hkRlCkuQ0A4/CMn+6+0VbhdPbYc9GU/6g+pfANEZCqZow2ZJ0smwnlXNaMJjXixurHTy
         7/BxWKQRGu15UbkPm/QAFMnLBjLO10bjLdp5flRS9p3fy+GORX+sb7BPexHzOm2rAqO9
         Nl007HZsqkkpAChYX0YQ8OR5nD1Dzu42EBhLfurcBIdcZeNIDtULLH5P4d0elu68dPhz
         uaDQ==
X-Forwarded-Encrypted: i=1; AL+hErEvgZHZHkeFNv/xicD4Tlgs1UXPQiAliVvCiOu7XNCq+s2ts6awhnItCmbOy+m9IxeNpmCzVZ+sMCXx@vger.kernel.org
X-Gm-Message-State: APuU4Z976V2Zb/pGmtKqhvaSLHgRiLt+sqdTinbyK+7jG+fJbyiu+72+
	uy+Hff6WcMhExsvRgKitYNKmO0GFg4ZN+uu+AdQPvshbeZ3Qqkpq1bI98yuaYeWEMYI=
X-Gm-Gg: AZFdTZcnEVWDpqSSLtHucNFIgHebwnlTLjydr4uQTUPXh/YAAOfVb/ssjz72rvPmDZc
	sI0YJ+OUYTibljYa2URZ3eG1NZvz0mlPwFh9zx/l1iswek9k/KSj4hxa4lDwhE8w1ayYrwbQQsY
	BQxEKRKe2iEKi6L3JYaQZJEcF/UhvF7TUQb5Tta0iXaZ2Ro4h7JQigd88IgViMKCYpfo2BG8KUF
	QaFucKUyY4dVDdElLmwG3p0hIddslb6MenUx+EwXr5IE4OkMry5nBy1EDKk8ZSJBAvCUZV9HgLM
	k5HQSfOfkeVRQ+b3bisOEnVZxuPCQaU1B1K1TGdvI9yvNpNXfkt80ipI4YuhmXx2d2BXADfoPXM
	r577wMQLNGrIpwUHaWFOAFIJLdnFTAYUtKk35cYCBitbhESN8Shd4ebcuYWXiqry0+VfQUteE+q
	N097oOrHgVk9OVBj+DbH+xxLYVE9j3WGhEJLI56C7PKP9e9bA4cRbOwL8X1VNdwGrXntzgjzbk1
	q0ifjTveso5RHfRWmcsOFK3xnfgrw+ZUzvHf4Nbe++lzwRdTr0u1JLoKNrvLtdZQnS01aQ0FGgM
	SYFde0L1ysWepomPZqwhAjABnZfmu6xroBdBwfgTpPqC3ekEZpDTxKiVTf5npmgOR9wMCP1emLG
	dnrwn1Uo=
X-Received: by 2002:a05:6512:6313:b0:5c1:ac32:9904 with SMTP id 2adb3069b0e04-5c1bc80e619mr6458406e87.3.1795692201670;
        Thu, 26 Nov 2026 03:23:21 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd077b37sm5089736e87.74.2026.11.26.03.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:23:21 -0800 (PST)
Message-ID: <8a34e083-f364-4eee-9a46-9533647f323a@linaro.org>
Date: Thu, 26 Nov 2026 13:23:20 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
 <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Loic.

On 11/26/26 12:52, Loic Poulain wrote:
> On Sat, Oct 31, 2026 at 12:22 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
>> Describe their register spaces and the non-real time CAMNOC AXI clock,
>> which is required to get TPG output frames passed to VFE.
> 
> Do you know why TPG support requires the non-RT CAMNOC AXI clock? Does
> the TPG perform any memory accesses?

No, I don't know the details, here it is a simple experimental evidence,
basically TPG works with this clock enabled and does not work without it.

I believe the NRT clock is "cheaper" and good enough for TPG usecase, and
to some extent it is a buffer data copying from some (static?) memory page
sitting inside a TPG IP block, while dealing with PHYs requires more
expensive RT clock.

>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>> index 9c8de722601e..50ae30cdcb82 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>> @@ -17,7 +17,7 @@ properties:
>>       const: qcom,sm8650-camss
>>
>>     reg:
>> -    maxItems: 17
>> +    maxItems: 20
>>
>>     reg-names:
>>       items:
>> @@ -38,9 +38,12 @@ properties:
>>         - const: vfe2
>>         - const: vfe_lite0
>>         - const: vfe_lite1
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>>
>>     clocks:
>> -    maxItems: 33
>> +    maxItems: 34
>>
>>     clock-names:
>>       items:
>> @@ -77,6 +80,7 @@ properties:
>>         - const: vfe_lite_ahb
>>         - const: vfe_lite_cphy_rx
>>         - const: vfe_lite_csid
>> +      - const: camnoc_nrt_axi
>>
>>     interrupts:
>>       maxItems: 16
>> @@ -226,7 +230,10 @@ examples:
>>                     <0 0x0ac71000 0 0xf000>,
>>                     <0 0x0ac80000 0 0xf000>,
>>                     <0 0x0accc000 0 0x2000>,
>> -                  <0 0x0acd1000 0 0x2000>;
>> +                  <0 0x0acd1000 0 0x2000>,
>> +                  <0 0x0acf6000 0 0x400>,
>> +                  <0 0x0acf7000 0 0x400>,
>> +                  <0 0x0acf8000 0 0x400>;
>>               reg-names = "csid_wrapper",
>>                           "csid0",
>>                           "csid1",
>> @@ -243,7 +250,10 @@ examples:
>>                           "vfe1",
>>                           "vfe2",
>>                           "vfe_lite0",
>> -                        "vfe_lite1";
>> +                        "vfe_lite1",
>> +                        "tpg0",
>> +                        "tpg1",
>> +                        "tpg2";
>>               clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>>                        <&camcc CAM_CC_CPAS_AHB_CLK>,
>>                        <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
>> @@ -276,7 +286,8 @@ examples:
>>                        <&camcc CAM_CC_IFE_LITE_CLK>,
>>                        <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>>                        <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> -                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
>>               clock-names = "camnoc_axi",
>>                             "cpas_ahb",
>>                             "cpas_fast_ahb",
>> @@ -309,7 +320,8 @@ examples:
>>                             "vfe_lite",
>>                             "vfe_lite_ahb",
>>                             "vfe_lite_cphy_rx",
>> -                          "vfe_lite_csid";
>> +                          "vfe_lite_csid",
>> +                          "camnoc_nrt_axi";
>>               interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>>                            <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>>                            <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,

-- 
Best wishes,
Vladimir
