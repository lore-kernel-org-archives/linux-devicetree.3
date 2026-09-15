Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39143F929C
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440582; cv=none; b=VYdmvfpvrTapynKhB9wsb715KZ33F8uuH+1euMio7DLBbGusM69Xm8ih8IF9GngyVYhholftjZQ1X2GA7CkD8nHisjrpaHS9ofGDPUkgcbTSGDIqw+K1P9l5bjv7t1zu2mjARhrQK7FcI3+LbZGdYKfDURioybu3mySz49l/cuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440582; c=relaxed/simple;
	bh=dZtJypvCQ3nH/VIpTSnun9IN+DGvbnyN1VglMN3CCUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsJgN/TJImtkmEdSTMlOMnK5p2Nvgcx80SnSWJvaS28x0aqIxr/IG8PSlAMLxIiBkcJVJ8fyE8lxBaOFNfb/Pk6BUuM3LSK8rzzVR6yHMkeHVhTwCD/z6XS5ENd2Y0uo7ijjBYkl7SEAiCQjhOgLfg3XlmREgPX3VsoiHOZ5XWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXuWFaPr; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXuWFaPr"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20a33so2768206d50.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789440580; x=1790045380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98dR90gK+JQcg6XkR8TXqOD8Hf/WJSfb2StQiLmkr9w=;
        b=HXuWFaPrDFOT61uL3BUEyVPWnZpfYxHhTSSLsjSpuM/avihwogZNbVmFdjqa2pv+W8
         Bbet+fhjllD3p2jDlDCYZXv5CWo67kqwk1QSVa1MCXaS437lYRAlAifpysFXTtlWY3U/
         WWzjSlpkzuQ1NXccv3QwZKt0PvufcTc8MqtKYqlumqHjjEC7KbDuyTuUDRKqCe+g/i/u
         +lguDCciTAYHCikaO2CaczbgsHH/6Idhb9yaVf2ZwhPKyUG80FSf4Q/rfbxFjN+/caLb
         hx97B59VpTpgjNvD2+BI0e/Wbe3J45bgprXX/Ww18yD7OaOL/LvdCV7hI/vReCBg+nY0
         1/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440580; x=1790045380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98dR90gK+JQcg6XkR8TXqOD8Hf/WJSfb2StQiLmkr9w=;
        b=XVpwYccAIAespNtfKokjcBTGjcza/xH0NZIrC1rXqpXcS+1v+z63/1gAA8q7aalXNW
         Lg7AnQadFnIgd+KvpZlgjoJnXBhswxqzG2BYKSbKkcLU9U3/TCxQeoi044NIXWtxzG9D
         xYLntJpMKjPmcvMrascttXkupWKK7pevHIrozeuVV4u5EutFQCHE8RymcQXCq5cMMkt4
         OkVsuCzQWoWAiACecYGtqGoIiW9im/mfZwRd9BYY4l1+HCU40EXjx/H/LDpC1/EwT6h0
         QKjZyWmICr5tkvZ+27pyzTlWZc4bvBDiR3OxO+DcnvQisVELjtRWmQuYtprie0qP/Hxr
         6J8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJcAl8ftJznBzlsIbvUg1UhmNUtIhnU/SF6TElmFo3G6QcCl7yNNSzD1C0A6jZf7NJQkvJykgcuqPH@vger.kernel.org
X-Gm-Message-State: AFuF++lsHSkz6bB8YnWKabm85zC0osOimmzF7GR78oyQ2yJTsZWnFox1
	Oh7Tzn6/vHraSMw8rRo8f7zRt7ArfSSNow7h8gvK9+WOSD054/bOtiw8
X-Gm-Gg: AYBFou19QACiFu6h4PHBCaNmWG/+3sZSb/UPQmjR/ag5W7r+z5D4RHrgTqEEp7wQayP
	X7syaRFmMm905HbBv2+Y8U64taOrTswafCpgh27efx3pjaIGHy2OzjLxrtK5mkaDPcdBU6IlFIc
	Pv+grIzyd/vqvXqetFOYQF2ZaYLU3vILho6QNy5tFEoMdw2kK3+T97yHNY4pE9Wpj/DKeKF71Av
	ugEX3WEBSUtaBLgnZAQWz5HtgxhiaQQqkf1A0OnygF/qXr/x3td+5ykyxlWw17bAs5xO40SQZNo
	0u52TLLF+OYZT8/+1qLeR9ZWvbHj/acwKr/1m5uoAfHAR6up7Z3VcMUEFhDZRzAEBgvnFL73fDq
	qUeZiAE2FiNuobkDxnGrdUCnGzQ5Aj2Mw79U+oIhebtKGAEziI5rpK7l1q//DSxv1k05r7a8/s2
	Vid3q92yM43zk9UCXhwHdoMaaqTIa4K3vYSn2/op+rSkaLwV7VUJijXQ==
X-Received: by 2002:a05:690e:4882:10b0:66f:c1bc:4086 with SMTP id 956f58d0204a3-6714e07b20bmr1035977d50.73.1789440580062;
        Mon, 14 Sep 2026 19:49:40 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125db3a05sm5345430d50.5.2026.09.14.19.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:49:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:49:36 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <aqiyQOMGGIzu-91z@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-3-marcus.yu.56@gmail.com>
 <aqepkmQS_p6K1Bd6@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqepkmQS_p6K1Bd6@ashevche-desk.local>

On Mon, Sep 14, 2026 at 11:00:18AM +0300, Andy Shevchenko wrote:
> On Fri, Sep 11, 2026 at 06:39:12PM -0700, Chang Yu wrote:
> 
> ...
> 
> > +static int as7343_setup_device(struct device *dev, struct as7343_data *data)
> > +{
> > +	struct regmap *map = data->regmap;
> > +	unsigned int val;
> > +	__le16 step;
> > +	int ret;
> > +
> > +	/* Power on */
> > +	ret = regmap_set_bits(map, AS7343_ENABLE, AS7343_ENABLE_PON);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Need to set REG_BANK to 1 before we can access ID */
> > +	ret = regmap_set_bits(map, AS7343_CFG0, AS7343_CFG0_REG_BANK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_read(map, AS7343_ID, &val);
> > +	if (ret)
> > +		return ret;
> 
> > +	if (val != 0x81)
> > +		dev_info(dev, "Unknown device ID: %x\n", val);
> 
> Wouldn't be better to define 0x81 with meaningful name?
> 

If I remeber correctly Jonathan prefers just putting 0x81 inline. I'm
OK with either style so I'll defer to the judgement to Jonathan here.

> > +	ret = regmap_clear_bits(map, AS7343_CFG0, AS7343_CFG0_REG_BANK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Configure the SMUX to readout all channels */
> > +	ret = regmap_update_bits(map, AS7343_CFG20, AS7343_CFG20_AUTO_SMUX,
> > +				 FIELD_PREP(AS7343_CFG20_AUTO_SMUX,
> > +					    AS7343_CFG20_AUTO_SMUX_READOUT_ALL));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set 50.1ms integration time and x256 gain for now */
> > +	step = cpu_to_le16(AS7343_ASTEP_VAL);
> > +	ret = regmap_bulk_write(map, AS7343_ASTEP, &step, sizeof(step));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(map, AS7343_ATIME, AS7343_ATIME_VAL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regmap_update_bits(map, AS7343_CFG1, AS7343_CFG1_AGAIN,
> > +				  FIELD_PREP(AS7343_CFG1_AGAIN,
> > +					     AS7343_CFG1_AGAIN_X256));
> > +}
> 
> ...
> 
> > +static int as7343_suspend(struct device *dev)
> > +{
> > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> > +	struct as7343_data *data = iio_priv(indio_dev);
> > +	struct regmap *map = data->regmap;
> 
> > +	return regmap_clear_bits(map, AS7343_ENABLE, AS7343_ENABLE_SP_EN);
> 
> Can this mess up the raw read? If so, also needs a mutex to be held.
> 

People familiar with runtime PM correct me if I'm wrong, but I believe
PM_RUNTIME_ACQUIRE waits for any ongoing suspend callback to finish
before returning? If so I think there is no risk of a race here. In
the case of system suspend, worst case scenario SP_EN gets cleared
before we read ASTATUS or the data register, which for my use case
at least is OK since the entire system is suspending anyway.

