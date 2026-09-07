Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E546C84D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779883; cv=none; b=LDVM7mBHJgoP6JR+RA0/xzxLIApL7swfjCjdvyOc2i4AwAnz95Dl3T4zH1I2qC7XJo+0Ow2SfIyLCLVgEiBpIJatkzPOHNR8W8rbZ3veLP+816MOt7oDAONI0Mx8El38m11teidHaZewc1R6aP93dqZNqt084NIEta0PdCBW+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779883; c=relaxed/simple;
	bh=vc/u2+6K3u9duPkyjAm1VSzu2f/ZyL4eiCIH6p0kCCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buWD3Y8AQmieodQVOJ7nKdkKZHpET8HnBUp/VBPcWQOBd93DZX1UuNep4HsohToctHGdNff3RLMpaWjUShgS4ZnvWPpOBaG79Ki7t2xlQjzD+qV8U+kdf1/EFi3pDKJIADHSbAsVd8fJTXtWwMCVdPgfri2YXa6cufS8PMzMMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=de2MEp7Q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="de2MEp7Q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so26874525e9.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788779879; x=1789384679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZeKG88pQvz+t3Gm/KrMtRBK71hTluhBWfm1A4t1QXw=;
        b=de2MEp7QCbYxhT5Uaog3gIdpkYeUO0mVMVQtiCMgH5BJo4MLMu0GREGhdFYPLS2Fua
         cxA/Pdft+yc3I+Zr3i3LCX/V9CDxAURVLJKTpP0pEGp7/pUJ2Zia5amibAXFRo7GNTIn
         bbgNa6YiKBYgCOOx7JHcYR3sFNer6TirsXmCrtfmL1iPQx5qelkve5peqcyZ4HITw6Dw
         QROMDiYlC8mkzpX8RO59w4qY5GWHM91SKo4XPP258xs0JXB5J+AwGxhKErj/qTtsqHKP
         ihyTQ2cqlwiXs3QUOsRHJVWEqTRsbBPFs+VpgL9lu2dTBq+akrYPKlUZpnkEnKkvEeBT
         4nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779879; x=1789384679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZeKG88pQvz+t3Gm/KrMtRBK71hTluhBWfm1A4t1QXw=;
        b=aFVFxRXWug8nptE/V4Yr12HgafIehEV7UT+QvspACVhRtj1bzT4Hkm8by+Lbb0u7Vv
         zTRGRmSAcjAiQQq/MT2QQqfRIg8tYpqby9iw8/LfpDbTB6iLzbIQGkNGhfOr52Cp9d7G
         3m8NEEP3siOW7yNoFMvjBE/FxCznVr/kM94gktXDAVXPRwN1eFqq2EbCLoxeKTtZLwR+
         8PR+YNjfAWgNPiqJdGK5P1LClJVY8/A74246r/5tN6e2gfAOGMjMVRS+hok2gGuqysy8
         gveWZxYVmcfTa3qetMd6Gnq5RVWT/VhyvvyiXjZUpmW4DORaUCeLC1EpLoCD/5rhArvz
         2Sgg==
X-Forwarded-Encrypted: i=1; AKwUvBy7TlMuK9GUahdC32cSez+8TbxSmrSSkLt2L5cRp4xAhyZxryC+HvPkJTTNRj/nh+ctCpLNHuPJNWcy@vger.kernel.org
X-Gm-Message-State: AFuF++m6nZwEx4VbvWlbiQrALLiq1Bj6qMbuTm3v+NcrO0KpADmdk/MP
	QLyyAoxGvlIyg2ZtXsAOi/nEgyg34xJhNfh2/50rEtlCerMe2Wnny42s
X-Gm-Gg: AYBFou2VWDDHAvUXuoxdPwhNSoRKwmiacpd3kBHIZD8Lv7o7rpucxidPfQMxxzM7nBp
	m+HnXfRa8a1DcpsA/kVYlY4Q/ZUd4NVsn2Q1/8YNaDOf9b9ozkN7UWIJM2Yfa8v90dKUoaepR4J
	YxVh9qFaOfP4c1I4DZllAIWS6LCo1nwHFVEhRkVoH/9rejn7ITseq70U8G7046XGTxvVR1b+45F
	MYl+uqhiqYmLUWMnQ8Ot65MOq9hSx1YcQLaxI4eH6uzUrAOZwDhrOEQlgfAZAd6d3gy05kWf+zF
	pvN0HlXSDEVPmLM5caAyqtz+Y6FEP77QdlrYV6O41IV12RUp4puIgVGiterDEHrcGnNIBCIuLnC
	B1knWFt4hYbLrvTaTRfJDymQe41TQrCBvh+lIY2GRIEqbpolBh0c4HE4gs53y2PuGxX55NaDPeu
	rjsvig/WZ6Hlv1hetEjua3SQsDVqqTiSQik9dff6lHwtrqrUjLPmJVAkQI1yyfmtgXnbRwRir4
X-Received: by 2002:a05:600c:3e06:b0:49c:fc6c:be1b with SMTP id 5b1f17b1804b1-49cfc6cc0e9mr176101505e9.33.1788779878713;
        Mon, 07 Sep 2026 04:17:58 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm296957105e9.12.2026.09.07.04.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:17:58 -0700 (PDT)
Message-ID: <4056ce28-cbf6-46cc-8bcf-a3db35410275@gmail.com>
Date: Mon, 7 Sep 2026 13:17:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/17] iio: adc: Add AD7768 and AD7768-4 core support
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
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-5-e4378f946bfb@analog.com>
 <ap0lp5THO64olugK@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <ap0lp5THO64olugK@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/6/26 10:34, Andy Shevchenko wrote:
> On Fri, Sep 04, 2026 at 04:14:57PM +0200, Janani Sunil wrote:
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
>> +	/*
>> +	 * DCLK(min) is ODR * channels per DOUTx * 32. With fast mode
>> +	 * (fMOD = MCLK / 4) and x64 decimation, this gives:
>> +	 * MCLK / DCLK = 8 * data lines / channels.
>> +	 */
>> +	dclk_div = 8 * st->datalines / st->chip_info->num_channels;
>> +	dclk_div_reg = AD7768_INTERFACE_CFG_DCLK_DIV(dclk_div);
> So, this one is (4 - ffs(dclk_div)). If num_channels == 1, this will always give 0.
> If num_channels == 2, this might give 0, 8, ... Since ffs(0) implementation is defined
> to return 0, this will return... 0! So, tell me how this code may return
> anything than 0?

The st->chip_info->num_channels is fixed at either 8 (AD7768) or 4 (AD7768-4) and not the number of channels described in the firmware. The supported dataline configurations produce dclk_div of 1, 2 or 8 and register values of 3, 2 or 0.
However, I agree that using the ffs() obscures this mapping, so I will replace it with an explicit switch over the supported divider values.

Regards,
Jan

