Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529007;
	b=zAoAvCsFwt7cab6XY5+1HAsy7AJA7kVqUot+oVlvs//+usV1jqU+cmUjL+4PklgwCfta
	 u+zKOfgZ7JEYgWq/K1Zi42KQqCVb+8KGa74oDEzXEyLVFaGTnWd69G/H+GhdvrYNWWg/7
	 ucOkGV1leJrvapdfnYB9YAOeCQ3G0acAfYOMNKc9VDyOIKCK6MM1KuvLXj8TzQvpeCj8U
	 eMZcew4LtVQrVWSgd87smeda2lheMbQwbrdEDxzMoG4lOxyzdkUTC6Z9HnI+N1pI5TyKM
	 Zf+DT59mof0ltMAIjCCS/pp0AD9Qd2C1sCvVPPVxi3soFKXukREOkwRf073IIKh6TbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
	b=jlQGK5teDgw6TrG9y05OqmfjCchPbns0Km/U9rU7mHzumup81kPJaeF1sa90gtJkgoLo
	 SNhiQmMcB1tN/PINtinKZVFgQmK554BRaQeVg/YVrskAz9uL7hFD+wC8yJndDFnmCKXqj
	 c1s1vJFkIe9oiz1M6HpT+Uc7vgSVAVZuZ3klsC2GaQnGAGdSN2Xj36G5jdfO3IlNpN6+l
	 lMt9hsV5T+ooadaTFZNyLMN/OuKB8GkqGzrGpJDVG9C5DhoCz1JVINzGBSCtNuMFZ8a1A
	 z8r8Ywqrq+h34LujDdHKdbw7WUgA+S2hKlGBHDSP2RRKh1MF6SJH+2+G+ybSFpbhjLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ukiSOZUO;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8345606A338
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8345606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ukiSOZUO
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so739821766b.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795529005; x=1796133805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
        b=ukiSOZUO2GyI9WW2Hp77iKkVNMkOHuY7o4g5f3aW3EXCGVsK0nQ/L6RfBKWO2T9Jlc
         jnU3tq3aEGNDAJHgNAstZoLxDMtkTDW+/mJbxPNcZ+6UMNO8QIwgLnxHyhTBLNOsWTrV
         B7nOg4FqmMgEz/Upfyv6SZD9S10nfOYcY/CaRaRAILpA/TXkxR6nGap86rwGpGIXiStQ
         a6dBGiUc5Y6BxzxJpaMHbVc+mnvNflPbla3j7wCHsl5k217FZqoMSJKRlyAbzUQw6+QK
         /kEu0pUQ1/BN8LWvrd4lBFy5xizt6Ae1S2eNGe9sPUfBOTqjtGl5apop3VpRgDP4y+1b
         HdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529005; x=1796133805;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
        b=Y1Pub9PYe2XKTdwmRGLEr5WwWy6yrAA5PlL+IeiK03W3K7sWIoJYiSQkI8fX+BnRkf
         wJv+Z0rtMpY8IxttJ57KxVMeuDBqkTFRTMu4xd3LHbb4qxcbRHMUV2GdJYN9/NL7iYNZ
         TikFPQQZGOHlVtjTuUL2Qlo7GkSycsFqJQ2MNB1lr84h+c79LFCH+gFZ13OeZMvQyS2T
         h5Xd89AjpdBECcIVJ309NIPJcWphpCKEu13KiHqZzvXZTo5DVzLkOp7pvRTfR1JK9Dm/
         UpYzHi5+ZoEwOLiMl4G/Ydb4FInbAp/2FiwY1Xpb9uUUfs3QhYNM01DQTs28k/d3PZG6
         rvIg==
X-Gm-Message-State: APuU4Z/0vBYc2gKY7MfqJcdjYqM9Z9SKbDLa5c9/L+2UnvUocDkozXZw
	CphmTfzsI495ObVJxy0KKUxb49IxMfQRpgdOyFu2pjrnil5LL3JymTTeK3f5mlhDS2Q=
X-Gm-Gg: AZFdTZera2kPc3WiB0xDhgpjuWOZZw699DOhUVsLjE+TcotDe+xG1uv0vGRRIKC2DRg
	M82gNxp4x1YPdMmqmOgEi2sfFSFeGEAEY40k5M1FmuZB8Bq2s8tEAQuahDQIrqEip5q4pRCJTrH
	NXYVYjQNQWxo6TZzevjwR1Ze9/4Rj3aCxTqGOqZxlTvJH1TjPldiV8AFdw6lEqfYcXtBsr9bc90
	aMhSKY7MYNDYiv9TyUDgOsUqwzMSBrTpVNBrYYDqK1MSqifuj8ddBUm51iOuP4IBLB0aMtboOhF
	0e9V7mMKKAZio5tFHEoN279gqWuBohsKjgxYMtjh6/VZqHnEkQqLrvY40hsuB8AWu7WlmCpjZHf
	V0yqkUc/Dt69ePAOV1IupdpV7xwPi7Lm5jqcc5khUM9VxCZbLEghGr25zF4NO3+mTANlQXHx5fL
	dLGvok5VLoCsoJntDOuDJQajfqKTeDRQ5p+2ArM/9EE6ceaJctpVu723dTZC0aayrRWN6QEsCtL
	umehJ8gLG98TVAqQApqVvpUlTJWIDIl9ZApvmercOoX7M0qKj7i3JgUc//RTqudRzyzfUI7t2W5
	E61hBINnQ8zj33e/90JaKr/7c1lleADaZoG1nvWh7OSCqCixFgCKyBnyAx4OCkytJaYMCFNbDV3
	RxxXmur24z4PqDAh20Z5VWySFV2X9YA==
X-Received: by 2002:a17:906:2db1:b0:c51:691:c76e with SMTP id a640c23a62f3a-c513a9abeffmr853349866b.36.1795529003374;
        Tue, 24 Nov 2026 06:03:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010a6sm528420066b.7.2026.11.24.06.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:03:23 -0800 (PST)
Message-ID: <729e2ab7-ebf2-4dd5-8c73-3e9ac1764663@linaro.org>
Date: Tue, 24 Nov 2026 15:03:21 +0100
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
Subject: Re: [PATCH v7 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
 <20261123-topic-sm8x50-iio-max34417-adc-v7-3-d8f87edc5086@linaro.org>
 <sashiko-outbox-229791@kernel.org>
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
In-Reply-To: <sashiko-outbox-229791@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 19:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] iio: adc: max34417: voltage read fails on power overflow in
>    CAM mode
> - [Medium] iio: adc: max34417: stale OVF and state desync in
>    max34417_setup_cam_mode()
> --
> 
> commit bc8a43ebc9b20a80f36676c2f0db12f5485b7c1d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> This commit adds an IIO ADC driver for the MAX34417 four-channel voltage and
> power accumulator over I2C/SMBus, supporting single-shot voltage and power
> measurements as well as continuous energy and average power accumulation.
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 0000000000000..241cc9c3c2546
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
> [ ... ]
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
>> +
>> +	rc = regmap_clear_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_OVF);
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
> [ ... ]
>> +static int max34417_save_accumulators(struct max34417_data *max34417)
>> +{
>> +	s64 acc_power;
>> +	s32 acc_count;
>> +	int rc;
>> +
>> +	rc = max34417_read_acc_count(max34417, &acc_count);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (check_add_overflow(max34417->acc_count, acc_count, &max34417->acc_count)) {
>> +		max34417->overflow = true;
>> +		goto check_ovf;
>> +	}
>> +
>> +	for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++) {
>> +		rc = max34417_read_acc_power(max34417, MAX34417_PWR_ACC_1_REG + i,
>> +					     &acc_power);
>> +		if (rc)
>> +			return rc;
>> +
>> +		/* Check for overflow on local accumulators */
>> +		if (check_add_overflow(max34417->acc_power[i], acc_power,
>> +				       &max34417->acc_power[i])) {
>> +			max34417->overflow = true;
>> +			goto check_ovf;
>> +		}
>> +	}
>> +
>> +check_ovf:
>> +	rc = max34417_check_ovf(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	return max34417->overflow ? -EOVERFLOW : 0;
>> +}
>> +
>> +static int max34417_read_voltage(struct max34417_data *max34417,
>> +				 const struct iio_chan_spec *chan, int *val)
>> +{
> [ ... ]
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	if (max34417->cam_mode) {
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
> [Severity: Medium]
> Should max34417_read_voltage() fail with -EOVERFLOW when a software power
> accumulator overflows in CAM mode?
> 
> Voltage readings from MAX34417_V_CHx_REG are instantaneous 14-bit samples
> that do not depend on max34417->acc_power[] or max34417->acc_count, yet once
> max34417->overflow is set, max34417_save_accumulators() returns -EOVERFLOW
> and aborts every voltage read.
> 
> In addition, because neither max34417_read_voltage() nor
> max34417_save_accumulators() checks max34417->overflow before running
> check_add_overflow(), subsequent voltage reads continue adding into the
> wrapped max34417->acc_count and max34417->acc_power[] values.  And if
> MAX34417_CONTROL_OVF is set in hardware, max34417_check_ovf() clears it and
> writes MAX34417_UPDATE_REG before max34417_read_voltage() has read
> chan->address.

Will address that, and not fail on accumulation overflow.

> 
> [ ... ]
>> +static int max34417_setup_cam_mode(struct max34417_data *max34417, int val)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	int rc;
>> +
>> +	if (max34417->cam_mode && !val) {
>> +		/* Reset counters and accumulators */
>> +		for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++)
>> +			max34417->acc_power[i] = 0;
>> +		max34417->acc_count = 0;
>> +		max34417->overflow = false;
>> +
>> +		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +				       MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +	} else if (!max34417->cam_mode && val) {
>> +		/*
>> +		 * If CAM mode must be set, the Control byte must be set to desired
>> +		 * values with CAM = 0, then followed by an UPDATE.
>> +		 */
>> +		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +				       MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	max34417->cam_mode = val;
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Does max34417_setup_cam_mode() leave MAX34417_CONTROL_OVF set in
> MAX34417_CONTROL_REG when toggling CAM mode after an accumulator saturation?
> 
> When a hardware accumulator saturates, the chip sets MAX34417_CONTROL_OVF
> and stops measuring until MAX34417_CONTROL_OVF is cleared followed by an
> UPDATE command.  And once max34417->overflow is set, max34417_read_power()
> and max34417_read_energy() return -EOVERFLOW before reaching
> max34417_check_ovf(), so disabling and re-enabling CAM mode is the way to
> reset accumulation.  Because both branches here only modify
> MAX34417_CONTROL_CAM via regmap_clear_bits() and regmap_set_bits(),
> MAX34417_CONTROL_OVF stays set in hardware across the reset and keeps
> accumulation halted when CAM mode is re-enabled.
> 
> Also, in the disable branch, max34417->acc_power[], max34417->acc_count and
> max34417->overflow are cleared before the I2C writes, so a failed write
> discards the accumulated data while leaving max34417->cam_mode true; in the
> enable branch, if the final regmap_write(map, MAX34417_UPDATE_REG, 1) fails,
> MAX34417_CONTROL_CAM remains set in hardware while max34417->cam_mode stays
> false.
> 

Will clear OVF on disabling and clear the accumulator after the i2c writes.
