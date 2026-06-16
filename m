Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72B44CF44
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625343; cv=none; b=IskAkuF3u6AjnMbZQq8V4pvjHbVr6sWXUyEkrVvazykoMY4UYKWySfTL7FWutqmEeUDi249Jn4Z0TWwNHp4qp64v2Ri/XkCCOLptutAzOj2yiTBZikQt2f2IqKbi/V3bmxwAd7c+lgOBuAKEffzfrQAEc8fY4lOp5gGAJn/eLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625343; c=relaxed/simple;
	bh=fx2MvxDOp+zgfbQanHVlBFA2C9ssVsnmseycDuhq1VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIKVNAmLZZxa9i0Zd+ldzIy8uQMAFp0Ug+E33Xn3hWtivZIZ4GwsacNY0N1lV9nOGnyyJsVBgTsRvPpRp4czX4Poy6/lJlHT1LnF3HlwjwKriWBsQ063MrBtkR9c8Z1VWi+Oro/Eva5jC8pKvXhRArgvHAyKMmGbPmH+2ioDD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Cue+EfXu; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Cue+EfXu"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69e8aa31e9fso2204343eaf.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781625340; x=1782230140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PswXrphDi92EK2opFWAkaWgKVXNG2RJTsAlsaI0Q2zQ=;
        b=Cue+EfXutNEZCPky4R9focYhM373DvAYbh1Gjn9pxyafUi14q5xRvQFdcKMhN/wQCE
         rQIU0IqDoiPZArmw4KhAZKGOIfDSq9y7Scn3Qg+FYtlEb/B6Gd160hacnDZ/FuLd6uRu
         prsl0PHcqH2HD3tCbnTCvDbca1GHlnSAkENl9mmfx3zDN0DYAkuU1J4sdyVyUNpo+UV7
         GIj20aFd/85yXI3eC6EoVrfCacQb/vOdf9wmBSazwhkUfotZbQxLAcOFdyfZECLjSXiZ
         Mc0/xwh92OGqZ5NaFinSXXsRE34P7W55AA/ARV3R+rHzN8na5/P7/TD6fXxzCGaNgaa6
         ygCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625340; x=1782230140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PswXrphDi92EK2opFWAkaWgKVXNG2RJTsAlsaI0Q2zQ=;
        b=aq6PSW8Ve5/fgraqdodQLNcN8P2InV8IVNPZ3G8kZQ7CHxwxOkOoy22hpDSrkOBZjG
         J7i5ofhQ9pNFQtxcekg1c4MeoAGJjyK1ouKZzlMOE/vGgq5GJQpi0iZfAwVOL9miqWg1
         RHX/raDhe46FU6ABe4tI+wonQw+ai2F5y7EqyUbrcFEPp06GQSH2PFMkumlwaVn2SL8O
         ILT3Uygi4M9H84inZxLTB8TyoMmEC44d/EwWq704fY8QppZw33Hw+KhHZMybTDXiCrvx
         hhu/+LX3FrafmYANGB6aBx2mGRg374hbzJY+kSrBXkgv37H1n11O0De/RvCtyUD4ynAE
         ItGA==
X-Forwarded-Encrypted: i=1; AFNElJ9o8RVhMmtBbT3pMG+FUXbQWjAfTM35fAcFvIvfb8ZLFUeeKeVXRe81C7CMAEw7hH0gVVo2WrzTfoJX@vger.kernel.org
X-Gm-Message-State: AOJu0YzWw9QMwxDM97NyAoZMe34161CscYLBdXoePN40UVryhgFbLVoe
	xh6/gmPuUIUWSYJqYzGrrhVqzcmcf6xI0d5dra2gkLpdqhuZPBOaHu/dQN9WJQ78g30=
X-Gm-Gg: Acq92OFZxedOVuFSbzoBUK+rj+4aYNaqahr9BrEaM45vFeT7n3s+psd2An/fDvRDvcJ
	5Ror2ysZXOxMBhvSDYsOPmsYYPCGCF/0RDQdUNZNvBAaxM1cTCv7/r/MTk5T2iXC9K65NuSdDj/
	bCtFjc9mfiHPKRDzaEdJDmZsQVJjKvufHYUmQP0bde89OZHTKd4509zZCHVaspytCsXJOl6it37
	BzbcscZIBobMEepJcjwJbkJSOfzVpoCW/nnWq9tlYL3q9+8V9nFYwyhafeoWDdPPnGfruzGBws1
	UnJ9bYWMDYqIH5VgWQBqqfQSNihd/nXgQIHx3A4HtrcP/HCcgN0myok28Lhc+322zpxS5VPBAJW
	KnTky8dqwBYHXDpX3vPP+pkVT66pbBAqHeruVLB+y8Aca8HjdxgFh6w2DW3ExA6F3H04jFDUckw
	bIQAeZ5mFgzmwOwAWC4dkLtrZPAqSUceAmE1GGv5NX2qf9mLPw7qZop+uV+MpIuA1ifmMgZ/wHJ
	Q==
X-Received: by 2002:a05:6820:2015:b0:69e:3960:b5b4 with SMTP id 006d021491bc7-69edc73ac67mr12760353eaf.40.1781625335733;
        Tue, 16 Jun 2026 08:55:35 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:16b0:5133:47b1:a939? ([2600:8803:e7e4:500:16b0:5133:47b1:a939])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00d609e9sm4851306eaf.7.2026.06.16.08.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 08:55:35 -0700 (PDT)
Message-ID: <e1e6a5f3-4cf3-4454-ab73-a45ae7b77116@baylibre.com>
Date: Tue, 16 Jun 2026 10:55:34 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] iio: adc: ti-ads112c14: add measurement channel
 support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-iio-adc-ti-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com>
 <20260615-iio-adc-ti-ads122c14-v1-4-e6bdadf7cb2b@baylibre.com>
 <ajELGxonxsQp-Ut2@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <ajELGxonxsQp-Ut2@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 3:36 AM, Andy Shevchenko wrote:
> On Mon, Jun 15, 2026 at 05:00:02PM -0500, David Lechner (TI) wrote:
>> Add support for parsing devicetree properties for measurement channels
>> and doing direct reads on these.
>>
>> There are quite a lot of conditions that have to be met for each
>> measurement to be made, so quite a bit of state and algorithms are
>> required to handle it.
>>
>> Channels are created dynamically since the number of possibilities is
>> unreasonably large.
> 


>> +	/* measurement channels */
>> +	if (chan->channel < 100) {
>> +		struct ads112c14_measurement *measurement =
>> +			&data->measurements[chan->scan_index];
> 
>> +		if (!measurement->label)
>> +			return -EINVAL;
> 
> Hmm... Can it be true?

Yes. For some channels, label comes from the devicetree, which
may not have provided a label.

> 
>> +		return sysfs_emit(label, "%s\n", measurement->label);
>> +	}
> 

...

>> +		if (fwnode_property_present(child, "single-channel")) {
>> +			ret = fwnode_property_read_u32(child, "single-channel", &spec->channel);
>> +			if (ret)
>> +				return dev_err_probe(dev, ret,
>> +						     "failed to read single-channel property\n");
>> +
>> +			if (spec->channel >= 8)
>> +				return dev_err_probe(dev, -EINVAL,
>> +						     "single-channel value must be between 0 and 7\n");
>> +		} else if (fwnode_property_present(child, "diff-channels")) {
>> +			ret = fwnode_property_read_u32_array(child, "diff-channels", pair, ARRAY_SIZE(pair));
>> +			if (ret)
>> +				return dev_err_probe(dev, ret,
>> +						     "failed to read diff-channels property\n");
>> +
>> +			if (pair[0] >= 8 || pair[1] >= 8)
>> +				return dev_err_probe(dev, -EINVAL,
>> +						     "diff-channels values must be between 0 and 7\n");
>> +
>> +			spec->channel = pair[0];
>> +			spec->channel2 = pair[1];
>> +			spec->differential = 1;
>> +		} else {
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "channel node missing channel type property\n");
>> +		}
> 
> Looking how it's going to spread (I mean the above pattern), perhaps it's a time to introduce bunch of
> 
> 	fwnode_property_read_*_optional()
> 
> and the respective device_property_read_*_optional()?
> 
> Let's start from u32 case only, as it will be most used anyway.

I don't think that would be really any different from device_property_read_*
and checking for -EINVAL or ignoring the error completely. TBH, I really like
it this way with fwnode_property_present().

> 
>> +		if (fwnode_property_present(child, "excitation-channels")) {
>> +			ret = fwnode_property_count_u32(child, "excitation-channels");
>> +			if (ret < 0)
>> +				return dev_err_probe(dev, ret,
>> +						     "failed to read excitation-channels property\n");
>> +
>> +			if (ret < 1 || ret > 2)
>> +				return dev_err_probe(dev, -EINVAL,
>> +						     "excitation-channels property must have 1 or 2 values\n");
>> +
>> +			measurement->iadc_count = ret;
>> +			pair[1] = 0;
>> +
>> +			ret = fwnode_property_read_u32_array(child, "excitation-channels", pair, measurement->iadc_count);
>> +			if (ret)
>> +				return dev_err_probe(dev, ret,
>> +						     "failed to read excitation-channels property\n");
>> +
>> +			if (pair[0] >= 8 || pair[1] >= 8)
>> +				return dev_err_probe(dev, -EINVAL,
>> +						     "excitation-channels values must be between 0 and 7\n");
>> +
>> +			measurement->idac1_mux = pair[0];
>> +			measurement->idac2_mux = measurement->iadc_count > 1 ? pair[1] : 0;
>> +
>> +			ret = fwnode_property_read_u32(child, "excitation-current-microamp",
>> +						       &measurement->idac_current_uA);
>> +			if (ret)
>> +				return dev_err_probe(dev, ret,
>> +						     "failed to read excitation-current-microamp property\n");
>> +
>> +			measurement->current_chop = fwnode_property_read_bool(child, "current-chopping");
>> +		}
>> +
>> +		measurement->bipolar = fwnode_property_read_bool(child, "bipolar");
>> +
>> +		fwnode_property_read_u32(child, "ti,vref-source", &measurement->vref_source);
>> +		if (measurement->vref_source > ADS112C14_VREF_SOURCE_AVDD)
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "invalid vref-source value\n");
>> +
>> +		if (measurement->vref_source == ADS112C14_VREF_SOURCE_AVDD)
>> +			*need_avdd_ref = true;
>> +		if (measurement->vref_source == ADS112C14_VREF_SOURCE_EXTERNAL)
>> +			*need_ext_ref = true;
>> +
>> +		spec->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE);
>> +		spec->info_mask_separate_available = BIT(IIO_CHAN_INFO_SCALE);
>> +
>> +		i++;
>> +	}
>> +
>> +	memcpy(channels + i, ads112c14_sys_mon_channels, sizeof(ads112c14_sys_mon_channels));
>> +
>> +	indio_dev->channels = channels;
>> +	indio_dev->num_channels = i + ARRAY_SIZE(ads112c14_sys_mon_channels);
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +static void ads112c14_populate_scale_available(int scale_avail[][2],
>> +					       u32 vref_uV, u32 fsr_bits)
>> +{
>> +	for (u32 i = 0; i < ARRAY_SIZE(ads112c14_pga_gains_x10); i++) {
>> +		int *entry = scale_avail[i];
>> +		u32 gain_x10 = ads112c14_pga_gains_x10[i];
>> +
>> +		entry[0] = div_u64_rem(div64_u64((u64)(NANO * 10 /
>> +						       (MICRO / MILLI)) * vref_uV,
>> +						 (u64)gain_x10 * BIT(fsr_bits)),
> 
> Hmm... This differs from the previous implementation. Why?

Probably fixed it during testing and missed that I needed to fix
the original patch too.

> 
>> +				       NANO, &entry[1]);
>> +	}
>> +}
> 
> ...
> 
>> +	if (device_property_present(dev, "refp-refn-resistor-ohms")) {
>> +		if (refp_uV != 0 || refn_uV != 0)
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "refp-refn-resistor-ohms property should not be present when refp-supply or refn-supply is present\n");
>> +
>> +		ret = device_property_read_u32(dev, "refp-refn-resistor-ohms",
>> +					       &data->ext_ref_ohms);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret,
>> +					     "failed to read refp-refn-resistor-ohms property\n");
> 
> Using
> 
> 	const char *propname;
> 	...
> 	propname = "refp-refn-resistor-ohms";
> 
> makes this
> 
> 	if (device_property_present(dev, propname)) {
> 		if (refp_uV != 0 || refn_uV != 0)
> 			return dev_err_probe(dev, -EINVAL,
> 					     "%s property should not be present when refp-supply or refn-supply is present\n",
> 					     propname);
> 
> 		ret = device_property_read_u32(dev, propname, &data->ext_ref_ohms);
> 		if (ret)
> 			return dev_err_probe(dev, ret, "failed to read %s property\n", propname);
> 
> Also the rest can be improved in the similar way.

Hmm... maybe less error prone, but makes the code harder to read IMHO.
Will think about it.

> 
>> +	} else {
>> +		if (need_ext_ref && data->ext_ref_uV == 0)
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "external reference measurements require either refp-supply or refp-refn-resistor-ohms property\n");
>> +	}
> 

