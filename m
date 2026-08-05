Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4AE3E3C50
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914818; cv=none; b=E8Ryohk/Sc+HKHdyx6stfk1LRLUSC2vJvrgQ/ORygtzdoJMumEf0r5oSghbr5QW5GmY9BdEV44RgOk97oto9ypUtgIgfLa5yZN56COLzJdolA7A+rTayh0d2yPQHchLBDb7OiUQ5bKQ0kHeibYWTEW5LFzb+p74xSSjt1sn6Nkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914818; c=relaxed/simple;
	bh=asK73d7GfDyhVd78GqzGQPrvU1ODMVZuA2la3QyxruQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJZm4yfGbLvbnqqTKNG+bihycgZ+afNa+o6LuqSiwxWUy7dJs4C22Cuvs+CaMd0jSeuHCUG53HCRtfveex3b1Slk0UwSV+izJshNJc5QXvjmSpKnMUAnODKBDOPZmt2YvOe+0jekPZasbqTYQXWNvMIEzXtarRaDCLWW47TJTDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=cn1gS2z/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="cn1gS2z/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so6127365e9.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1785914813; x=1786519613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twTeQfheFVdLzfrMuJjB8uMdt+x4381kwqcX7wxLE60=;
        b=cn1gS2z/B/fkZ1qvKRtRONb0jARDWo3nLzWUB2LWROPHl/aj9ljyVZeXpkiR8YEsf0
         SpiM4/VgfWyO4arBG1XfSvwcKKFIa2RvbnQKDpuk2NLAZq8PmEUMyrqWp4UQD3fSOGm8
         MZV5P6kI8ILnT1bAqyynupng+BhvO/Q4b255wNm+WswwRZJGnPT3wCbP3T6KrIg8n2mh
         u4vu1ci/+SKmXWQdeZygULvdtVemPSDE3FTB2etyzhiu8jTDyidPr6F+gPh4ga1BNn/x
         SSYt3KjkUu/LUiQl0JYs40ue9xpGiaQblPcGB3DYPihJpq6xF3QJu22nfgXpc6nYpaoA
         uqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914813; x=1786519613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twTeQfheFVdLzfrMuJjB8uMdt+x4381kwqcX7wxLE60=;
        b=nVLiwRm9pd0Azr72yfY+RslJH+HLlV/7zgmTaYWmchN1yrqhze9MQcMVaJny6bKN0v
         wOmQVM9Vob6wrcZNdDis3K6TJ5szHvES5rZIvWUTDePoTQEQsHZ5Ytxl8DtUwvJLe6kV
         KTxEYQFhOMe8YNK2GYcY1gDM6CKkjklyEUXY474iDHCgs62mcbpXIq2gSfThnFlEABcX
         U5n3CTaya+iopt1Pv7AImCfb4sYwmJ7Cog3tgIDhr7bfLXNKFVlPI/K8G0MPRIWcOCQW
         o6bKK9QGh5k207bPe2o10i5mr2yAhhgMgHR6fPHueKKypfK+PIKTkepgJoIFmE+aGbXJ
         SRxA==
X-Forwarded-Encrypted: i=1; AHgh+RrmLUrpE+pyb7POLo5bEK43M3eFJCsoSsMHvqB3YTGaQCucSOx0+QR83bA9r2u1Qt7MntbsNmjJQYwb@vger.kernel.org
X-Gm-Message-State: AOJu0YwtJXVVKrmjpq/e3CmCbOTCPd3AQ2APw8WvhxIA8obZCoRVXLrL
	fpcRD6CSYUrZmou+sLa/wngevD3Qw4Sa1IAKTvplLU//YxEF/JMJ7i4w19hYRpmelNg=
X-Gm-Gg: AR+sD13QKhaxFseUDhJq0Pv3rPuOQk5HE2AG1TQxjchxcn67t3VxU8T5rEPn8XE49el
	p+qIf2FP3H59i2mgmpb7cDZZnsqEsnGIt9C028kfFFoDscmE6VKc7brmxN0Lqrd6svP0FbsldtJ
	AdL9GUtKIZxcrO92dNmoBJoxTTFbLqu1EhBXOD3HUpPSb26D3bm+vWZjg6ErgV7Rfr2NOF4pr2M
	HzcLRy1ZI03uSrJFnWmeyHOMQ1v/Y9UwMYVn+6RhhlkcvdhYmfDji1+I7Mpb/F8tMyoHi3z/VBC
	CNdyBGOMYbN7IfCb8mn+YpqVoTnpLM7gNs2UXf7NLvNQ8BiwI4jWb3zZOoGOyO+Kwn1/KYJOoCN
	ZlrYWM8J0oaXIRJxVj/RsOmj2xGdA//wt4t7YoshuPI5r4EeSs8Vdqvw7W3A6QD1SEuDxXluptx
	8u2bYRo1OUG2AOl9vvqUsyxIl8HDP64L1e2Kc9LZNFatUlXcWdFeZigvY6sZG5alQ46Or/V40OB
	3Q2w9v2Of4=
X-Received: by 2002:a05:600c:3589:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4994e79ab0emr51987475e9.4.1785914813464;
        Wed, 05 Aug 2026 00:26:53 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb345sm153939695e9.6.2026.08.05.00.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:26:53 -0700 (PDT)
Message-ID: <a88bbbb3-2a6b-4b2b-85ec-479d3ba5299a@sigma-star.at>
Date: Wed, 5 Aug 2026 09:26:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX
 mode
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
 <20260804111849.92046-2-david.oberhollenzer@sigma-star.at>
 <20260804112702.497CF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260804112702.497CF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/4/26 1:27 PM, sashiko-bot@kernel.org wrote:
>> +
>> +	regmap = syscon_regmap_lookup_by_phandle_args(np,
>> +						      "syscon-acspcie-tx-rx",
>> +						      2, args);
>> +	if (IS_ERR(regmap)) {
>> +		dev_warn(phy->dev, "can't get syscon-acspcie-tx-rx\n");
>> +		return -EINVAL;
> 
> [Severity: High]
> Does this code inadvertently break probe deferral?
> 
> If the syscon provider is not yet ready, syscon_regmap_lookup_by_phandle_args()
> will return -EPROBE_DEFER.

It will not. syscon_regmap_lookup_by_phandle_args() internally wraps
of_parse_phandle_with_fixed_args(), the implementation of which can
either return -EINVAL or -ENODEV.

The only additional error path in syscon_regmap_lookup_by_phandle_args()
also returns -ENODEV. At worst, this will mask -ENODEV as -EINVAL.

> 
>> +	if (phy->mode == PIPE3_MODE_PCIE) {
>> +		ret = ti_pipe3_acspcie_tx_rx_mode(phy);
>> +		if (ret)
>> +			dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");
>> +	}
>> +
>>   	ret = ti_pipe3_get_pll_base(phy);
> > Is it intentional that the error returned from ti_pipe3_acspcie_tx_rx_mode()
> is ignored?

Yes, I tried to following established convention by modeling the implementation
after other drivers that need to set syscon register bits during probe.

For instance, the dra7 pcie driver. See: dra7xx_pcie_unaligned_memaccess() or
dra7xx_pcie_configure_two_lane(). Those follow the same structure,
returning -EINVAL on lookup failure or the result from regmap_update_bits().

Where the setting is optional, a warning is issued on failure, but the probe
then simply continues.

Thanks,

David

