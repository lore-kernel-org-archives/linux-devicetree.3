Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093A43DA26
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786625022; cv=none; b=XEaatMUcuo0PbwaIHiYR1ZXudAdt2lDLi+/eUE/v8CII7kr47dDWTYtN9qULOmaR46y+3w9udZusbbIJWE4DQ+2F/FyHYl0oxSP1LK/LFqUV4MMfaZPE/wHuB4oF5RXj04KI/vjhSXRf5hzkyo16PxfGZssGiWkvi+4uQChYkzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786625022; c=relaxed/simple;
	bh=XCRyYa9Cj2cBnzNJz+uLg9K78+0Q04t78FS8jSLyM8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mklszeLEcJc6/3FK19HWfZzqlflMg4pJYfDHPvQLiYeBOcAwxxrq+PuVHQ4Zbqe6fKZjaTZFjZA8lUnrP6taEoGsq0QQ6oEjMtGrsygwotanIdPT4yD8OKhgMdvLG0cvNgmz3cN05V9FEtzIsyMT659+AsR7y//f5Fibx1xuGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9+Uzqur; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9+Uzqur"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de008b020so548781f8f.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786625010; x=1787229810; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wrg2VIt6trGfNzd/hwCmmeNh9EVzBuveLNTMhpJY8Qc=;
        b=Q9+Uzqur1Gz03gxp1I1gre5k12YPLSRHlWLBKEUk76UnkrMbPTv7tQM6HxziLCYfpb
         9Uor95fHj1ZHVs4yeOe0mC02MxyXSWdJ8pcRZdyCphMRYmhSNoEvfU/2Qzh4Rus+69O5
         vtilB0zUZJS1eArtrDXezoZ7vG51dYjXeniUG8sjUsrhMDCCW5WxOLXKDhIohHFp85ir
         iQKWQVHYgc38/omb0NEfyrp29noBtVHrWKeybbCJb9tIskN7sr2yvj9OEVHtD09Qc+Lk
         O+NiYbPNghVOxu401jV6CkKCObGpj6q4+TyaNR/iX8WQ2nM8AI8UtpAMClw3S8pKf1PP
         oGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625010; x=1787229810;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wrg2VIt6trGfNzd/hwCmmeNh9EVzBuveLNTMhpJY8Qc=;
        b=YFWM7reEcBCNVeGYNa+TunzJ0R9JUA6hlV0xaFIspziUQdteT+Twp5prznvwCy6AiL
         ujX5VKtz9PfZ6cOayFrAqkJnSJYzTurxvs9G4Z4I877eNm2z/PlGAeMATVputLZQB240
         Z6dN3nGQj9GLTIug5dVqacX/TAOUlJ3gJ9zzskHRJayi1MgvVSwa+MUKe2HNPXrMjL5r
         0EILULy0PAe4iswvWUQ3diVVBLN/ijMZxN8TRsqY8K6gLxFV8izskpj1dtkoYJavZHJC
         jv+Ul7vGpIEPKCsIIntdFpwlJSdbyiE7Exgg3gnz+jcmDpH+jTbMFrvQO/RLAg+Ec4Fp
         PIug==
X-Forwarded-Encrypted: i=1; AHgh+Rp8DOBRfZZMjC1MzIQ+A4pcDqYDa/WSzTdhIk3DFm9mJ1Mf3IQv4McK+C4WZj+HH5tKCsfNQuTFhtQ+@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTJcNV39t7LjZqH5JywmbLnPkPvMYzWl4pfnjovuCEB8XjVVf
	17Yu90ayW1ePAiakP4si8zjXKAtiBvvpMKPhfqsOyXeqcuwJUxV0PlCu
X-Gm-Gg: AR+sD13QV7jeuiMAr2t3cP99vY1L4fQlo9xzHlobAdM/qAzWp2oJjra9Vz4nrwd905t
	GkxFSw4Htjuc0iJtx4rJ1AuBXsypwNMN16iY7yMkQ+Cfhg8v7iYJ939LT1RlYdtUT4Wx726mWi9
	FvBiyOkWh4JLxIgHgmccVt1urCIeMavpsDYqqp7/K38MHgIrZUM7RKuNvKSiINn8eKZPnOQHrBS
	UW9AabWXrZgJZZXt6+ljzZUdw4+85Q5esIuklXE6FrLeKRosXULXxEYFJD+hRzzQ21S8SiPA9jH
	jM8F9WLsK5PLvh8dC2yNzWhnd1qppyT2wER8yyJWSumZqPxRmUgI89VuVjF7nm+QO15y2N0dfAi
	7MoCVno3f12UTpsGSJPpD7HmYv8srlOYr4PvgaVtkbW7dbT1ExP8cgHY9B3MT8RWHPgVU4oJded
	I9ygt69XDXJY/Uunb6ZsDS0oOIMBCRXQY0DRjleQmCAqQwaz709xwCgzBS4GXOpj8jSMelL0TEu
	BfHSJNON6yiexL6TvQ=
X-Received: by 2002:adf:e189:0:b0:47f:ec53:1d2d with SMTP id ffacd0b85a97d-4815a4f981fmr7957694f8f.7.1786625009500;
        Thu, 13 Aug 2026 05:43:29 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:15e0:beeb:f51b:da5e:3a64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2842sm6423824f8f.35.2026.08.13.05.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 05:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 14:43:26 +0200
Message-Id: <DKNTPHF7K5G7.AJEIRCWO8FAM@gmail.com>
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Jonathan Cameron" <jic23@kernel.org>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v6 4/4] iio: light: veml6031x00: add support for events
 and trigger
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
 <20260812-veml6031x00-v6-4-7eef6e4ce290@gmail.com>
 <20260813022436.41a28d64@jic23-huawei>
In-Reply-To: <20260813022436.41a28d64@jic23-huawei>

Hi Jonathan, thank you for your review to the series.

On Thu Aug 13, 2026 at 3:24 AM CEST, Jonathan Cameron wrote:
> On Wed, 12 Aug 2026 22:27:43 +0200
> Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:
>
>> The device provides a shared interrupt line for to notify events and
>> data ready, which can be used as a trigger. The interrupt line is not a
>> requirement for the device to work. Implement variants for the cases
>> whether the interrupt line is provided or not.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> @@ -549,11 +948,78 @@ static int veml6031x00_buffer_postdisable(struct i=
io_dev *iio)
>>  	return 0;
>>  }
>>
>> +static int veml6031x00_set_trigger_state(struct iio_trigger *trig, bool=
 state)
>> +{
>> +	struct iio_dev *iio =3D iio_trigger_get_drvdata(trig);
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	int ret;
>> +
>> +	guard(mutex)(&data->irq_lock);
>> +
>> +	if (state =3D=3D data->trig_en)
>> +		return 0;
>> +
>> +	ret =3D veml6031x00_set_interrupt(data, state);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* The AF bit must be updated before updating AF_TRIG */
>> +	ret =3D regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF,
>> +				 FIELD_PREP(VEML6031X00_CONF0_AF, state));
>> +	if (ret) {
>> +		veml6031x00_set_interrupt(data, !state);
>> +
>> +		return ret;
>> +	}
>> +
>> +	ret =3D regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF_TRIG,
>> +				 FIELD_PREP(VEML6031X00_CONF0_AF_TRIG, state));
>> +	if (ret) {
>> +		regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				   VEML6031X00_CONF0_AF,
>> +				   FIELD_PREP(VEML6031X00_CONF0_AF, !state));
>> +		veml6031x00_set_interrupt(data, !state);
>
> This dance vs a goto is I guess due to the mutex.  I'd clean it up
> by using a helper function for the stuff done under the guard(). The
> helper can do goto based cleanup and avoid repetition plus reduce chance
> of missing cleaning something up on error.  The outer function can
> still use guard().
>

Yes, that was the reason why some code was duplicated. I will add a
helper function with the __must_hold() annotation and
lockdep_assert_held().

>> +
>> +		return ret;
>> +	}
>> +
>> +	data->trig_en =3D state;
>> +
>> +	return 0;
>> +}
>
>>
>> +static int veml6031x00_setup_irq(struct i2c_client *i2c, struct iio_dev=
 *iio)
>> +{
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	struct device *dev =3D regmap_get_device(data->regmap);
>> +	int ret;
>> +
>> +	data->trig =3D devm_iio_trigger_alloc(dev, "%s-drdy%d",
>> +					    iio->name, iio_device_id(iio));
>> +	if (!data->trig)
>> +		return -ENOMEM;
>> +
>> +	data->trig->ops =3D &veml6031x00_trigger_ops;
>> +	iio_trigger_set_drvdata(data->trig, iio);
>> +
>> +	ret =3D devm_iio_trigger_register(dev, data->trig);
>> +	if (ret)
>> +		return ret;
>> +
>> +	iio->trig =3D iio_trigger_get(data->trig);
>
> Sashiko is correct that we loose a reference here on error and right now
> there is no IIO core infrastructure to solve this
>
> Why are we setting a default trigger?   Userspace tools should be
> fine looking for a data ready trigger, or choosing a different one if the=
y
> would prefer. Added advantage of not setting it here is the reference cou=
nt
> issue goes away :)
>

I will drop iio->trig =3D iio_trigger_get(data->trig) for v7.

I added it because it is (or at least, it was) a common practice in many II=
O
drivers to assign their own trigger, and in the end it is by far the most
common use case. Of course, we're not going to touch existing drivers to
remove that, but is it then something to be advised against in the future
unless there is a good reason for it?

Thanks and best regards,
Javier
