Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB843E9C6
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624288; cv=none; b=oQro7MfcFDaGXfIlNxYu7sT9yBwTX2iNjOtYOHUl7SaC9Bf55LYGFY/xn9ON2GDkYDr2IYuSI9McmnHRi4Jqbm41vhiQt70q6mIOp0YMgYhNrbJnSEOp86H5/JOKoXLhKJgXFbXTK11pwuR1R949BOMswYMnH3JJ6njqae9WAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624288; c=relaxed/simple;
	bh=ZOzn+odfXtFFxDtwV9vEd3/BbYpMJLOkeAries1nWdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mbko41evLzzlV4/FWLk/BKme4AWMHUy8X1def5PVfhZ1f9ijcfeb5ieBBrY0BaTOU9KY5GjGRvmyZ6Mf6mP2aey+rzUnVldFmAPtGyBzStlQXSdhY781B3e6jGEWE2rR7NHioBDE+wqt/Fx3VdU8DuzMf8+cGMqZypO0YxBh+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hidi0kXr; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hidi0kXr"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-440e2b605ddso1024715fac.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781624286; x=1782229086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWBVUzoZFxqMG63T0Dz57hnXBNXtwIr43k2T9IWtKTs=;
        b=hidi0kXr565KLhnZVr/AmYFvHFHZ57Hu34YyWTRKi7uMuUWcgYAo96nsB5Up9/50wt
         cwYCrp74bzn3KnwLEXmjD4fCo48lAeYmGy0T4cP9I9kJ1JlPVfOZlZXq4oOSfFdXRI7q
         21aeu+cEczDZYerTeetoo8OPqxUPOiINN/uK15cwrxpJASTgVuBUwg9PKo2OQiq2T99A
         rj+6QvYv43paFJTvnwbuXbXaL4sTUU5z0HhkippKSDXTNJrXur+F2xDNxay4V4s62+Jm
         wx3Z+JDfGRDMLyK62FT686ovRZGDG/uK/D3lmr2phaUJmaLm+X3uh3YWabvkuEHY71ub
         kZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624286; x=1782229086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWBVUzoZFxqMG63T0Dz57hnXBNXtwIr43k2T9IWtKTs=;
        b=MuQe2O2CQPPWHw/69LP721rvTWVaup3oPcw3v6QR6qbrKYykBnVemwYA+8nS95cKOY
         RSVfZpzxixWZkgb6P1VA6k7lhb0I7oOA2k/0jwkxWcvGUfl02mDNjrvsem4MD0SWeio2
         SkMYLHU3S4FCC0Rd/JrAdZ7LAakkfYHggznykTC7Notmza3iZ9n3XKz84iHCVbEuZ3X5
         hLUbRPa+ATN5lcKSB5Qilx2DhmGO7X9qQyqcL7Ex4DYyVSz7P1d92aevxcxiJfsE0K2i
         zuHh4LDPsanm5ZdWxp5Zm+HqKjNrSgNkrFXfbK+MB9XkA9fyzbrv0doC+d8EEjjnU1KM
         lXNA==
X-Forwarded-Encrypted: i=1; AFNElJ/WYewTPH1dqW5ZLVVJhvBCzAosGjgOZLFNuvQv9kn3YFkzpByZ1jgGCdKpwa810E3T25twLHO9ZFEq@vger.kernel.org
X-Gm-Message-State: AOJu0YzjlNqaiZg2DHmXopyNYeSLMiCUHUkdA3ah3I7peF6naFGxoSWR
	wrxUP99/Cp0VALejOBahLwFO7m21/u1zIm+GHVQmInizeCavrkxqa2nvVsleey1cTEw=
X-Gm-Gg: Acq92OFpxAm847Re46X3XcC7cyhIVj6eMxDim3i/IOtx7qtZZMnEJSIlFGJgI9VKW2S
	dNr7okJxHMUZ+zAKfSXUtzAEzj4QHBSzuhsAIR5n2oY3s3QUoOWDcqhAma02g+DxBgy1jCi794Z
	Ctgu2eJ505vhSD9ZMlB9Sd+FQ2TWaB6zmAHc+bVMphY24330hf2vTMnszAiOTQzKyLbDKHzVIR1
	bQV9xcpXoJYjuHhuRM57cRtbEdJepHHu2hO2JcnrCV6TM3B9ovXelHBSgaiOEZrGnLhtW4mx5Z5
	U2d0NUhEl3R2cZxkGGSyT7MfyonzbrFSXEkWXtKy6rCc1khAgYXQP5Fm8esYL+UMwJmnIPjoitD
	VEjroNJAP08S3Id7pnmf23vHPq8wjWvGl7LTa4vkWoR9JITKmBR5JjOSA2C49PGi9rv1i7JNIJE
	an3D5mfLQRRfGU2KBS1V0ys66MObUaqMAI0UxojE+RKSjV0Ag5vr+XyPGxOdDQUWLS/19VSLiK7
	w==
X-Received: by 2002:a05:6871:3427:b0:43d:3251:7070 with SMTP id 586e51a60fabf-4428c7a4087mr10250880fac.25.1781624286084;
        Tue, 16 Jun 2026 08:38:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:16b0:5133:47b1:a939? ([2600:8803:e7e4:500:16b0:5133:47b1:a939])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308a66827sm2398625fac.2.2026.06.16.08.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 08:38:05 -0700 (PDT)
Message-ID: <12831fd9-8a6f-442e-b1ca-f39248a5baf0@baylibre.com>
Date: Tue, 16 Jun 2026 10:38:05 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] iio: adc: add ti-ads112c14 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-iio-adc-ti-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com>
 <20260615-iio-adc-ti-ads122c14-v1-2-e6bdadf7cb2b@baylibre.com>
 <ajD8Gxkp66kkDflE@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <ajD8Gxkp66kkDflE@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 2:32 AM, Andy Shevchenko wrote:
> On Mon, Jun 15, 2026 at 05:00:00PM -0500, David Lechner (TI) wrote:
>> Add a new driver for the TI ADS112C14/ADS122C14 ADC chips.
>>
>> This first step is adding a very basic driver that only supports power
>> on/reset and reading the system monitor channels.
>>
>> ADS112C14_SYS_MON_CHANNEL_SHORT is the last channel rather than being in
>> logical order by address to keep the voltage channels together and in
>> case we find we need to add variants of this channel with different
>> voltage reference later.
> 
> ...


>> +static int ads112c14_read_label(struct iio_dev *indio_dev,
>> +				struct iio_chan_spec const *chan, char *label)
>> +{
>> +	const char *label_source;
> 
> I don't see the need of having this. Can't be returned directly?

Then this would have to be split into two functions. One to return
it directly and one to do the sysfs_emit(). I don't think it is
worth it.

> 
>> +	/* System monitor channels. */
>> +	switch (chan->channel) {
>> +	case ADS112C14_SYS_MON_CHANNEL_TEMP:
>> +		label_source = "Internal temperature sensor";
>> +		break;
>> +	case ADS112C14_SYS_MON_CHANNEL_EXT_REF:
>> +		label_source = "External reference";
>> +		break;
>> +	case ADS112C14_SYS_MON_CHANNEL_AVDD:
>> +		label_source = "AVDD";
>> +		break;
>> +	case ADS112C14_SYS_MON_CHANNEL_DVDD:
>> +		label_source = "DVDD";
>> +		break;
>> +	case ADS112C14_SYS_MON_CHANNEL_SHORT:
>> +		label_source = "Internal short";
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return sysfs_emit(label, "%s\n", label_source);
>> +}
> 


>> +	/*
>> +	 * The reset may cause an -EREMOTEIO error because of failing to get the
>> +	 * I2C ACK at the end of the message. The device still gets reset.
>> +	 */
>> +	if (ret != -EREMOTEIO)
>> +		return ret;
> 
> I would do it separately as
> 
> 	if (ret == -EREMOTEIO)
> 		/* ...big comment here... */
> 		return 0;

We should not return early here. We just continue with the rest
of the function as normal. So I think the way I had it was
simplest. Otherwise we would need a goto or something like that.


> 	if (ret) // which is regular pattern and doesn't need any comment.
> 		return ret;
> 
>> +	fsleep(ADS112C14_DELAY_RESET_us);
>> +
>> +	ret = regmap_read(data->regmap, ADS112C14_REG_STATUS_MSB, &reg_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (FIELD_GET(ADS112C14_STATUS_MSB_RESETN, reg_val))
>> +		return dev_err_probe(dev, -EIO, "reset failed\n");
>> +
