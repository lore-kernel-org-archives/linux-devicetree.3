Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490F46C4AF
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189612; cv=none; b=fm+Wfj3oyvFa8RtO5AvINx2VK4Oz9vtBXKCMScS70elycBUH866oGJSfdvRPiNv+wLmWpJi5/nOCW3cjWucxl1e4XOvdy520AVP6DtlxHwgbg1WC1wthTMmlQGPRNTOCuT/5gZO0BO0QwvNtAzKHIVew9A+/VBoDR8EhHd3bCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189612; c=relaxed/simple;
	bh=aKL2AnuUWy6NivLQVu0g6qzxjQP5ZgZ8oxvyWfYnvWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBPiUJZUXFW/qZ8KQtRulnDpxEm+l34J/rdMoWmZ/eI7tp6vDDwpVY3QkDvKGe5VRSCARX8RWzds6PZr0jUD3QrlnpNUtBU0nuVg4n1MMcVoFkFnQzSfYKNRFmLK2Uxc9cyf049JvjGf9+6ltpoi2fDjnI94+bM5tFzu2BIQTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrtTvPIv; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrtTvPIv"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5301a453186so6647511cf.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189610; x=1788794410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvlu4I6x6DgkdrqSjLTVRzmVnrzpHDN9Z4Ca053R9hk=;
        b=HrtTvPIv6fUHWJA7yVYTxl+Hn9wtp4i1LdgHm9nfvs6C3wY2z8LKNk988nbxyBqh4e
         8mGisPivi22JOC82ZlnxL0Yfn76RoipDrAz1EbyISiVHppRQvUS39oGRag7HgjkvVRvL
         q5OWmT4iSajCaGKGNmqqDO9ROfmVdInvT4gS4PiAAbOtQziSGK0E7M4ZstKl9slc570+
         vjzNRfWKwgKKx3Ki8LJws78GGROdrbBcjEXTldEix8cWPgfa942+JCTk8OfAexC41eUh
         tB2L2fNSK8x9ClrsPEl4GpS/Qm+NdZgJQBc4xJfZxTJ5U43WOig4haqcToR3jOsOb20y
         bQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189610; x=1788794410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvlu4I6x6DgkdrqSjLTVRzmVnrzpHDN9Z4Ca053R9hk=;
        b=JsTdKeczbeVd9M2oEWuX8BdskKs5oMpew/dgJv7mz1zgmIDdWsu49QVcYR3rR2eidK
         JpwwpSMC5x9g8QOU72Ye5hr5V3eeyuxyxMvlWCYJNMCycQg6Sku3PXeQB8jTb2Pn6eWu
         szUWlkKLuL8LxQYCnspVDSCldXxLnmlM+1Wz0O40yuKT/J38B42jJZg/A1Bm6Lvf5OCT
         u3F2RmMOKAzDSLjFLDT+H6zuvl71dEEl4rPtl4F32nXmNkejYK0CjatpOfzTE60MDNm5
         zuIJQsapId1K5eiIP76gKjegWEBZuO7qrATQovW0l0KVxGUscx6ry/fmBxoAJYJ298D9
         r2gA==
X-Forwarded-Encrypted: i=1; AHgh+RoO/1urnhbBZwra9toG2qjuBPWKO8De/M2bDbK/i5Hn3sQAYaYFCdg3BwfBhRetBmhFEJbiAeikk8GG@vger.kernel.org
X-Gm-Message-State: AFuF++lWBeRkLrLUtMzoNL1kMazD/AfHW4iyvawEfuR04wWm3HsJ4Q2+
	7Q97MaqHFR1UFAf98pgMJ8eZuffpHi8GSxw01JSrl3m+MLHJ4HO360yrZdm9n0A5
X-Gm-Gg: AR+sD100p8feN3YuzXEM1nRZ66xINdy8WWncOc10YS+D/Q9whzP79rQ18rPS0Qn71nW
	vW/9tZQI7/wNoIfHZc+lNB8n2K8jIoQsSJsAXIGIJVS6wLxEtuwO8lxgMkGJlYndRUHqgu7nR93
	3D7dZxapmPa6E3fXdtuUm29VcP5hnf/D69lXeACs6OsFxiZKwM3JXLv5iED9/qZWQ4UY7uOILEc
	/hNGZdOVxHGrNMRLwVO3VVO39KO9HXKTCognqmUxE7CwUWtXcVO4WcH3i+saW+1bBhP8Eke/XGt
	SZJeWW7ohSW+a4kPMlKcv+dLt7aP0KGKAowsUdAcRCExRJ8ockLpyADA5KCmWrrF7L6XBXFfjxs
	xGifSLY+KZNbTC7+PmYRElIThAnA+RTgudFCvDMPut36Q/dYVhdydNoxuru9Rv0q7IrEUbA/Ukw
	+GBSoz5SJt9P83QgxhCaLnbhhmbnfQgEYIcyXewnTTWhxjAr5kes9IaD8ytUGEPP0Pk/cx3uL77
	KYrLeGHJglAaeuX1AincmT5U3i3z7ARdUNxBdDGGQg+XCD1hKPBrcOer/XEj9dyFJU21n/nzZgY
X-Received: by 2002:a05:622a:4818:b0:52f:9f8d:915 with SMTP id d75a77b69052e-53021c760d5mr22862211cf.26.1788189609876;
        Mon, 31 Aug 2026 08:20:09 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe850864sm73241871cf.26.2026.08.31.08.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:20:09 -0700 (PDT)
Message-ID: <b2f430a4-a43c-409f-9bdf-ffb0f70b1538@gmail.com>
Date: Mon, 31 Aug 2026 17:20:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/20] iio: adc: Add AD7768 and AD7768-4 core support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260828-ad7768-driver-v5-0-e33ca6f841a2@analog.com>
 <20260828-ad7768-driver-v5-5-e33ca6f841a2@analog.com>
 <apVDm1O_NtD07-rw@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <apVDm1O_NtD07-rw@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/31/26 11:04, Andy Shevchenko wrote:
> On Fri, Aug 28, 2026 at 05:30:28PM +0200, Janani Sunil wrote:
>> Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
>> Configure supplies, clock and reset, use a custom regmap bus for the SPI
>> protocol, and parse the enabled channels and input buffer settings from
>> devicetree.
>>
>> Connect the converter to an IIO backend for buffered capture with CRC,
>> provide a fixed safe wideband sampling configuration and add runtime
>> power management.
> ...
>
> +	ret = regmap_update_bits(st->regmap, AD7768_REG_CH_MODE(0),
> +				 AD7768_CH_MODE_FILTER_TYPE_MSK |
> +				 AD7768_CH_MODE_DEC_RATE_MSK,
> +				 mode_config);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(st->regmap, AD7768_REG_CH_MODE_SEL, 0);
> +	if (ret)
> +		return ret;
> +
> +	dclk_div = 8 * st->datalines / st->chip_info->num_channels;
> Does 8 represent BITS_PER_BYTE? Can BITS_TO_BYTES() be used?

8 is not BITS_PER_BYTE.
With fast mode (fMOD = MCLK / 4) and ×64 decimation, this gives: MCLK / DCLK = (4 × 64 / 32) × data lines / channels
Therefore, the factor is 8. I will add a comment explaining this.

Best Regards,
Jan

