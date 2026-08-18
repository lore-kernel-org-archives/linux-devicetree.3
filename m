Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D947CC71
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069460; cv=none; b=l1w8YJQF0c4jFS7iXT/whBdr9lqgW7ZNGWKP6VezmJsRRucsnG9BfrKktCZG38uyqfG84xnpsoJNsFU+h7sZfeO1Jbm2Vou6cafCcXy2z5dd0YGzrTQ8+hKdKKB01GGeHehaQni1S/w2EHDeLqXBHZSbjXkhO0VbZ8hysaO+VrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069460; c=relaxed/simple;
	bh=c7PwQWkFv8QtOYPTSaqekUb0jNSO2JmAouy9pX/I/QA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=JsSBrZrkzz24LZZ9otxOg2HVwDt1bw4y2vyz0zWITpErxt5yXCaPmz0CcClQs/IbfjXB+ahy/xkIYx3kys1d5yA3uLjfSj/PF8n3HeoNzFKeS1WrBEymJkP/uRYKaiH88pm6Vsv+ctgcTUlf+b6FobdTaysq1vHpnEz1Kx6HMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRFIGYPV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRFIGYPV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1712a04ddaso812152066b.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787069454; x=1787674254; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nvxB0TwdTME8MC6Z1iZNTwpBhONAfbWSssxaqP+j/pw=;
        b=NRFIGYPVka858bu0JECWLXkbS08vJ+HDFGMwIqngB22IAIOhtsDnv4CFPGml8JWIvU
         ErlDfiMn8dqiLj2+qYC1f1z/RQjX1aCtmOwUMP0DPVqjBqv6OGaOIGNcc4EzauYOKKgj
         rtOtkvXTcuYp7KQHoPM1FDZm0ECUGjEK9XLGTKK9TEZyI16ykUGA1biF5o1QIzNE151W
         lC/nTSd+VXlpRkdIIQnEOk7FfrdE3jOpYhyHiYrQ4voeD3AZPPZGCBgu+lHFZoQud/c6
         HZuuuV7695LwEyBy3bbFdrIvZqUhgYvsw2ZBw62xWdnGu6FSTG65XTw6xzSz10mBkXX+
         NQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069454; x=1787674254;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvxB0TwdTME8MC6Z1iZNTwpBhONAfbWSssxaqP+j/pw=;
        b=spR4K2UrowyiCbprcE9a0OWB+oDUekb96Bviz+ZC3B3S0vp9YZroi//h47WJDIR0jh
         GZF38Fs4sp/5IJ1eUpUhn+g4PCX3rpaX0OEj1T5Q64v42XnCA6sYDovlTCMh7SOapEuK
         DiD7iUUQT+4JVwK/946AfP2YuEUvZJbuY3PLwdHJzozBB2jS6CgRlyZHZmNZUdQ/UE9x
         OW8g/oXDpeOR7J2dzA2TgVcLavtAd5NCwcY7JeydDTGiwYUlhHSyu6TCPJ/aAEJfKdAC
         ee+DLHXCL4571BjfCWao++b05JB1j3zcfn0ZLns87sJxryMDHmnl1S3rOShoMAhi+E5Q
         HIAw==
X-Forwarded-Encrypted: i=1; AHgh+RrsKvnljTAIF7o49f7EXe+Sv3thl5off9CG9vPC0kjuyEq+V/ZPyeRHC5BoCMByNvev/+4gtRsRXi1f@vger.kernel.org
X-Gm-Message-State: AOJu0YyGP1mfoYs/plRuzbSj82RqKH7vtWAdXP00Hjgruos5ZkWXHhMb
	BAE7NUnW5RhO9UeQNWA5UWQojYEJhwQW4s5aTOD45GVN7an0iyDcRO96
X-Gm-Gg: AR+sD11K7isyH6Y9gMU8Bf5ZN2m8y+uAXsNDZywlC7rGmwpgRmB93kuX63xBTCU9Etx
	raDgk4LTgzxG5JNcSPcDjWEw1rVu5MDah9VbKNobC2MiUPltwoDR2GXHyanfxL+s3wmswi0cEOZ
	aNG+QvL0aXRGSU7j5LLacbWWh8fZo0ky7cHiZVRuI2nH1etskxy+QIN6rw12Ic+kGA4BXNGRDmN
	nxuChDufMM2lvsFtSGlX8/D+zs8VX6Rna6lUdEfJLwtjUIf383SRu9FyzSQIVb1wMc5nZYXpLsq
	CzsIPP7t3ARleb9XnWgcbhEfkffBA24P3NYpBn9Otfdm5EP/ZIMJb72rqvv4fnKxWEsZ/bLUZme
	6mpHVyql/yQcFhM1qCM+IijDd6t2pmv0kb6Skxvt6YczyWYUVdDeofiZN8B+P0sCWrgNHywBHhq
	KJfvq3EMW7Kklex5Hsrfi7YtoXjFP2rBqKaiya7KfOZ1L9dQ9jeuFcTaozRwamNzSgup/0o4Qbc
	ZU=
X-Received: by 2002:a17:907:928c:b0:bf0:b39:dcc8 with SMTP id a640c23a62f3a-c212a1da2bamr1897122066b.26.1787069454161;
        Tue, 18 Aug 2026 09:10:54 -0700 (PDT)
Received: from localhost ([2001:4bb8:17a:e1ae:aa1d:6b4e:97a6:f7ad])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm189896466b.50.2026.08.18.09.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 09:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 18:10:51 +0200
Message-Id: <DKS790BEXVON.1FP9LQUPNTYDE@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v7 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260818-veml6031x00-v7-0-2b0de0f20edf@gmail.com>
 <20260818-veml6031x00-v7-4-2b0de0f20edf@gmail.com>
 <aoRltgy0AYZ_Vcum@ashevche-desk.local>
In-Reply-To: <aoRltgy0AYZ_Vcum@ashevche-desk.local>

Hi Andy, thank you for your review. Even if no more stuff comes, I would
like to update the code in v8 with your suggestions before applying it
if nothing speaks against it.

A couple of comments to the feedback I'd like to discuss.

On Tue Aug 18, 2026 at 4:01 PM CEST, Andy Shevchenko wrote:

...

>> +static irqreturn_t veml6031x00_irq(int irq, void *private)
>> +{
>> +	struct iio_dev *iio =3D private;
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	struct device *dev =3D regmap_get_device(data->regmap);
>> +	s64 timestamp;
>> +	unsigned int regval;
>> +	int ret;
>> +	bool trigger_poll;
>> +
>> +	ret =3D pm_runtime_get_if_active(dev);
>> +	if (ret <=3D 0)
>
> < 0 seems too much to me. If there is disabled runtime PM (and supposedly
> device is always on) this prevents from getting events.
>

I am not sure if I get this. A reference is unconditionally acquired
when events are enabled as well as in buffer_preenable, and also in the
probe before interrupts are enabled. Runtime PM should be active at this
point. If not, the interrupt should not come from the device, even if it
was on (e.g. before autosuspend kicks in). But maybe I am missing
something?

>
...

>> +static int veml6031x00_hw_init(struct veml6031x00_data *data)
>> +{
>> +	struct regmap *map =3D data->regmap;
>> +	struct device *dev =3D regmap_get_device(map);
>
>> +	__le16 regval =3D 0;
>
> Redundant assignment.
>

regval is assigned here to write that value in the first instruction
(regmap_bulk_write()) after the variable declaration.

>> +	int ret, val;
>
> Why is 'val' signed?
>
>> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WL_L, &regval, sizeof(r=
egval));

Here.

>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to set low threshold\n");
>> +
>> +	regval =3D cpu_to_le16(U16_MAX);
>> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WH_L, &regval, sizeof(r=
egval));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to set high threshold\n");
>> +
>> +	ret =3D regmap_field_write(data->rf.int_en, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D regmap_read(map, VEML6031X00_REG_INT, &val);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to clear interrupts\n");
>> +
>> +	return 0;
>> +}

Best regards,
Javier
