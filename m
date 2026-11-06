Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957166;
	b=c8n4CrYEW4LmB5bLo7rxFgDmLX9EjrYUW2g1pKFqXhVinyRozyE1uwADFKS6X44Cvg/+
	 XuC/MZxmvBK3wc55bSA0f840qAoV0AGXRC5Hebc4KugsTcgP5An+wmlZnYIOoGEYb86Yi
	 Jrqx01shCxb1EO32QxdscZIpKBnkvqFRvgNMMifmqa7CvI9uompBya21T2wKSjtRkMtjr
	 UfXI3EhHSZC0r+Zs4pyAKG+YVIKY3LyuXWqd6ymYczQmaPPDB/xi4evclAOi3H8EeX4rs
	 Mxq2ucclZIsuIZpjDGYjfPDvqRj6VJ9m9AUcuWNyn0DBFZnO7zTM1aWt+Bd+GjUhGUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jrpVgRUslTPiehxcuRRm/s3XpNQuKu+K33dlXN26lMI=;
	b=P/ymQx+EXsw8sWxWc9nEXsPmvmLRhkeDJVzTUfPKI8JUMKNWmfG3lYOfNYzLvNzh905u
	 6BZzqm2YDD1zq74PR+5z+s2jSReNlbUBhI6MLJjMBDmuXwmJFbNJhSCOjN+nZ1DOlHILB
	 xdI83bB82GM9QLpXMzXFD5/T4dBcBSZQsRBxJi7Mms6yxc4Pg/tmQg5DgXxw56XycH9f8
	 q6esarCdlPeoWMbwZugo//MqPIJn2Oql4OnUbTlgWJqIowh7tLwL8RTRgMCw8EQ70r8AY
	 HvIeQyVOuqAK04AOAnayYUTBPyqnzDNXX2B01/fe4EIuP1WfHf1zA7UZjQy8xcen9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gZsJLVIS;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF15606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF15606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gZsJLVIS
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so215148f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793957164; x=1794561964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrpVgRUslTPiehxcuRRm/s3XpNQuKu+K33dlXN26lMI=;
        b=gZsJLVIS+lm3r3p4h0s8rtNzNTnHnNBx8wghCSglvg6kzeIU18Mf87/k/aS3vndLLZ
         lc7H5K2mr6jFbKUxKWYIQU12yyt6rZdDm511eCaN+lRCX3I7235elX3pB1ZBdulMDoGW
         YUithY85HhKOkN1w3BF7ivpHg8cx0zWUWjwO8+ktXC3i1Hk5zsnTqT3tGNE/tWpZhTA/
         +VwNrTzUkrvFx73HzqTdZcG+5O3JXeqhdqLR2hlDStqzOYnproZbQReDkW6TslWs+wr1
         dOivHR/m/ssbZ/IfuFK0JNGAURquOrQrgWvRHKF6ESTg+3ep5z59A0RFWNFVLG5f9abC
         lnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957164; x=1794561964;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrpVgRUslTPiehxcuRRm/s3XpNQuKu+K33dlXN26lMI=;
        b=hbvj1vBd1MMwFLSt2eZfikp0BUHzEqqy7Cs+RxnaKFaS6Z3TSzPO8cidNQ0sdG4XiG
         oH1Bm/9iPk/r3s9V8pwtxRZHDL++gLWkXNzWn81Z3csMPaOIHDmW579CwWsyFDj68bmP
         Kl0SPEwlfXT1nKNrzkeoN9DYRmKmlcUD55ngexcTjgE0FrsUDYR2VG2KUsIohGpp6f8Z
         ABuvpk3x6lxQeLzg5315OsQqB4ZMyLHj2brqUjx/mzmy9D5HFw5KI5y4lqHhvtRgFTlt
         7GaKkod5nuSpjinoG4/3Y4WpbO7hkjMwC+I5ZGZ6iFuDgYBuLrGBsScmz+If24Sg/tfs
         3NqA==
X-Forwarded-Encrypted: i=1; AL+hErHDVty3+GvloF4awrvTFwD8cM3I0KTY9p6HNMPk4BcPwM/b8KDEcLJe3S7mtQw6wriCSfi35/PsB24Q@vger.kernel.org
X-Gm-Message-State: APuU4Z9RBnuepEso/Kug5/hwgbt/+FkJ+SwN5zcn1GkzSgK6Y9yDAbvL
	3gu6GprM3JHcg04MyDM6g9oVMxKNfbOci7rcmJQQaUMof/90Qjw/iHCBN7Xfx30VGAU=
X-Gm-Gg: AYBFou3clkZx/7S3LUkGaatCdVkNgQE1rJm2diEhrRWbpqwhSWxe/pH8gr+DbrtzAcJ
	IRUh/jcolycoWakqwTzEMpdX8viHFBKpVaiR5p+cSTqTI/AthDLEXn3OWHO+jHpwpuM5C7eAiXU
	rVKEkmJfmb5ZQo8krwWsyajN1e9qp3emGNRpMxf5sIgy2v7n3AakzYy76xJSnLFOMkFv5aVPZQF
	3qPIytY6cDsOFYqyZ3pMNPN9uCeb7WNPwKw6I8r+niLFC479e/Q8321XmMaN0qk+3FVx8FGRE4/
	ENyfwq2Jbbk8y/ZhVIJsdk0pC0Cwzs1zcpNANjNEI5blJPK1EfAjy5TsJiTortOantLw9GKpjN2
	06SfU8Qf7MfvaVsfcZTUHaK7WFLghxntdeVzxaUwtbJTDv0p+Dy0L4QoDeHVh8UbzBF6qq3hiRI
	dKgyL1FBBZO0A+5jKDz9bQeJbPQWHn14ZugnDHB+8f8y9ZzpugEdA0CvHfXNDC4OowIUy9bj9WB
	evIMxa+0Nd5cHb8t7XoqxSxF8BTPXyDPddOdvUUubHSOIeq9u3US3Yn58/IK8bWPhrBdHusq7LS
	yhl0bEgwGy1uGVojt8m7LdrufeJ0V7Uk2sZvdOSTCuNgdfbsALGn5Og6C+1dE+xjD4urLORKG6U
	jg3vwxn4=
X-Received: by 2002:a05:6000:4693:b0:493:5d67:499 with SMTP id ffacd0b85a97d-4935d670512mr480307f8f.14.1793957163659;
        Fri, 06 Nov 2026 01:26:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm2752679f8f.45.2026.11.06.01.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:26:03 -0800 (PST)
Message-ID: <3be0c748-b840-4a22-b0eb-f6ac28380eb1@linaro.org>
Date: Fri, 6 Nov 2026 10:26:02 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux@analog.com
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
 <20261105-topic-sm8x50-iio-max34417-adc-v6-3-63b4e8279633@linaro.org>
 <auy9qPZopjJjZ3ZB@ashevche-desk.local>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <auy9qPZopjJjZ3ZB@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/5/26 18:32, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 01:42:48PM +0100, Neil Armstrong wrote:
>> The MAX34417 is a specialized current and voltage monitor used to
>> determine power consumption of portable systems. The driver support
>> getting the channels voltage, average power, accumulated average
>> power and energy over an I2C/SMBUS serial interface.
>>
>> The MAX34417 datasheet only specified on how to calculate the
>> accumulated average power, but with the Sample Per Second rate
>> we can easily get accumulated Energy in Joules.
>>
>> By default the IIO driver only supports single-shot Voltage
>> and Power sensing, but the accumulation can be enabled by
>> enabling the Energy IIO channel which then enables the
>> Continuous Accumulation Mode.
>>
>> The counter is common to all channels, so when reading a single
>> channel we will copy all accumulators to registers, so in order
>> to permit reading individual channels we must accumulate the
>> other channels in the driver when Continuous Accumulation Mode
>> is enabled.
> 
> I have a few nit-picks, mostly about the style. The only two seems more
> important, actually the very first two (_uOhm suffix and use of a bitmap).
> 
> ...
> 
>> +#define MAX34417_MIN_RSENSE		(1 * MILLI) /* 1000 microOhm */
>> +#define MAX34417_MAX_RSENSE		(100 * MILLI) /* 100000 microOhm */
>> +#define MAX34417_DEFAULT_RSENSE		(1 * MILLI) /* 1000 microOhm */
> 
> Why not adding a unit suffix _uOhm and drop the comments?
> 
> Moreover the burden of a typo is now in the comments and in such a case may
> confuse the reader.

Right, indeed it's better

> 
> ...
> 
>> +struct max34417_data {
>> +	struct iio_dev *indio_dev;
>> +	struct regmap *regmap;
>> +	struct mutex lock;
>> +	u32 input_correction[MAX34417_CHANNEL_COUNT];
>> +	const char *input_label[MAX34417_CHANNEL_COUNT];
>> +	s64 acc_power[MAX34417_CHANNEL_COUNT];
>> +	s64 acc_count[MAX34417_CHANNEL_COUNT];
> 
>> +	bool overflow[MAX34417_CHANNEL_COUNT];
> 
> Why not a bitmap?
> 
> 	DECLARE_BITMAP(overflow, MAX34417_CHANNEL_COUNT);

Yes, I'll switch to that

> 
>> +	ktime_t last_update;
>> +	bool cam_mode;
>> +};
> 
> ...
> 
>> +static int max34417_check_ovf(struct max34417_data *max34417)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	u32 control;
>> +	int rc;
>> +
>> +	rc = regmap_read(map, MAX34417_CONTROL_REG, &control);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (!(control & MAX34417_CONTROL_OVF))
>> +		return 0;
> 
>> +	rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +			       MAX34417_CONTROL_OVF);
> 
> It's precisely a single line
> 
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +{
>> +	s64 delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
> 
> It's better to split the assignment of the variable (that's going to be
> validated) from maintenance p.o.v.
> 
>> +	struct regmap *map = max34417->regmap;
>> +	u8 buf[MAX34417_VOLTAGE_READ_LENGTH];
>> +	int rc;
>> +
>> +	/* Sleep up to 1msec to make sure we have a measurement cycle done */
>> +	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
>> +		fsleep((1 * USEC_PER_MSEC) - delta_us);
> 
> 	struct regmap *map = max34417->regmap;
> 	u8 buf[MAX34417_VOLTAGE_READ_LENGTH];
> 	s64 delta_us;
> 	int rc;
> 
> 	/* Sleep up to 1msec to make sure we have a measurement cycle done */
> 	delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
> 	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
  		fsleep((1 * USEC_PER_MSEC) - delta_us);

Yeah looks better

> 
>> +	/*
>> +	 * When not in CAM mode, we use the default mode where each
>> +	 * UPDATE command will move the current accumulated data to the
>> +	 * SMbus registers, reset those accumulators and run a new
>> +	 * measurement cycle.
>> +	 */
>> +	if (!max34417->cam_mode) {
>> +		/* Reset the accumulators and perform a measurement cycle */
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +		/*
>> +		 * UPDATE commands should be no less than 1msec apart for reliable
>> +		 * measurements, since in Manual mode the SPS is 1kHz, we need wait
>> +		 * for the measurement to finish before moving the data in the SMbus
>> +		 * registers.
>> +		 */
> 
> This comment goes up to 85 characters...
> 
>> +		fsleep(1 * USEC_PER_MSEC);
>> +	}
>> +
>> +	/*
>> +	 * Move the new UPDATE data into the SMBus read registers.
>> +	 * This will also reset the accumulators, returning the
>> +	 * power accumulated since the last UPDATE.
>> +	 */
> 
> ...and this one only up to 67. Can you bring some consistency to that?
> Same comment to other similar cases all over the code.

Will fix

> 
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	if (max34417->cam_mode) {
> 
>> +
> 
> Redundant blank line.
> 
>> +		/* Retrieve all channels to avoid missing data for other channels */
>> +		rc = max34417_save_accumulators(max34417);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	rc = regmap_noinc_read(map, chan->address, &buf, sizeof(buf));
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Ignore first byte which contains the Byte Count & data starts at Bit 2 */
>> +	*val = get_unaligned_be16(&buf[MAX34417_VOLTAGE_READ_OFFSET]) >> 2;
>> +
>> +	return IIO_VAL_INT;
>> +}
> 
> ...
> 
>> +static int max34417_read_energy(struct max34417_data *max34417,
>> +			       const struct iio_chan_spec *chan,
>> +			       int *val, int *val2)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	s64 delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
> 
> Split the assignment.
> 
>> +	s64 acc_power;
>> +	int rc;
>> +
>> +	/* Sleep up to 1msec to make sure we have a measurement cycle done */
>> +	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
>> +		fsleep((1 * USEC_PER_MSEC) - delta_us);
>> +
>> +	/* Move the data to the SMBus registers */
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	/* Retrieve all channels to avoid missing data for other channels */
>> +	rc = max34417_save_accumulators(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (max34417->overflow[chan->channel]) {
>> +		max34417->overflow[chan->channel] = false;
>> +		max34417->acc_power[chan->channel] = 0;
>> +		max34417->acc_count[chan->channel] = 0;
>> +		return -EOVERFLOW;
>> +	}
>> +
>> +	/* Get current channel power and reset them */
>> +	acc_power = max34417->acc_power[chan->channel];
>> +	max34417->acc_power[chan->channel] = 0;
>> +	max34417->acc_count[chan->channel] = 0;
>> +
>> +	iio_val_s64_decompose(acc_power, val, val2);
>> +
>> +	return IIO_VAL_INT_64;
>> +}
> 
> ...
> 
>> +static int max34417_probe_channel_node(struct device *dev,
>> +				       struct max34417_data *max34417,
>> +				       struct fwnode_handle *node)
>> +{
>> +	u32 rsense_uOhm, index;
>> +	int rc;
>> +
>> +	rc = fwnode_property_read_u32(node, "reg", &index);
>> +	if (rc)
>> +		return dev_err_probe(dev, rc, "failure reading reg property of %pfwP\n",
>> +				     node);
>> +
>> +	if (index >= MAX34417_CHANNEL_COUNT)
>> +		return dev_err_probe(dev, -ECHRNG, "invalid reg %d of %pfwP\n",
>> +				     index, node);
> 
>> +	if (fwnode_property_present(node, "label")) {
>> +		rc = fwnode_property_read_string(node, "label",
>> +						 &max34417->input_label[index]);
>> +		if (rc)
>> +			return dev_err_probe(dev, rc,
>> +					     "failure reading label property of %pfwP\n",
>> +					     node);
>> +	}
> 
> Can be
> 
> 	const char *propname;
> 	...
> 	propname = "label";
> 	...
> 	propname = "shunt-resistor-micro-ohms";
> 
>> +	if (fwnode_property_present(node, "shunt-resistor-micro-ohms")) {
>> +		rc = fwnode_property_read_u32(node, "shunt-resistor-micro-ohms",
>> +					      &rsense_uOhm);
>> +		if (rc)
>> +			return dev_err_probe(dev, rc,
>> +					     "failure reading shunt property of %pfwP\n",
> 
> ...and here you can refer to it in full using %s.
> 
>> +					     node);
>> +
>> +		if (rsense_uOhm < MAX34417_MIN_RSENSE ||
>> +		    rsense_uOhm > MAX34417_MAX_RSENSE)
>> +			return dev_err_probe(dev, -EINVAL,
> 
> -ERANGE?
> 
>> +					     "invalid shunt value %d of %pfwP\n",
> 
> Same here — use %s and propname.

Good suggestion, will try

Thanks!
Neil

> 
>> +					     rsense_uOhm, node);
>> +
>> +		max34417->input_correction[index] =
>> +			max34417_calc_input_correction(rsense_uOhm);
>> +	}
>> +
>> +	return 0;
>> +}
> 

