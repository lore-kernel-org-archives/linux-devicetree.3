Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FB3451C8
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696602; cv=none; b=qRUifoCpu2qJrZc0tS0fTlilaTE6e6EJuE78mTxMIe81ptnKkZKqbJpAxIZozVgpXPlcoL6iIJegvsBAFB+V182EOGqto3Qt4JjZ5PwivvE1RnjBcJ+NI88elOJr9X/4/ECpInvDKRvMlu/hEQn64bgCmnvrcr4kyB2wGfmKXvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696602; c=relaxed/simple;
	bh=dOfXhl/3ROZBdvGUuq5lc6pP2skpMQ+Impsv7uUwQSg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=hQ5KeQ33d8wdkmSDz6mIVpuDDhbtp2tEZP0d20lZ57QiQ6lYSRfOAmBxjiLlUtsz3eNa8UXtkZev3OpPbgH4pX2Juzx5FrT0/aMbHqNZuDzRYwKkT8TUHY3jqiyXqdCjX/EO5MCV1/Vr1zeUjl+uvR4TNdzujYx1VUtpExfN1AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGtoa+Vb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGtoa+Vb"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82748257f5fso5218263b3a.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696601; x=1779301401; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8tquXezPQtGk+rIcg/OfsmqPD3duQcZyQFMnO23FMw=;
        b=lGtoa+Vbbauh4mqRm2G1+N9R2bNFDX24LP1V56Pw4mCNdBJXgxlTM/JatzqrY+YQ7B
         p5B1oSiohmBvipxS7HPc1I2w0LzBpRiKh/MTcynFAkIG/ja6jNm2vZN6wAZf5Ie/mTic
         SiWeH7CxtDt11l9GiogwuC/gDSeKMU0fuQYP11ciXgG0kqWDR/t/w6F4Ck7oKBgSBod+
         2WqTUd+wkXjTtdcG4IoDj+NA/eytQf1iJKEi2OgzOzU18CI7QYQHBMc30W5BAM8Vu1IW
         o9d5UdQd6Uz/0UN98XrsaDyXFERjW75xXCk7EQRhobRpYjFMOsT7bKuYbIuxmiTmus5k
         9n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696601; x=1779301401;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8tquXezPQtGk+rIcg/OfsmqPD3duQcZyQFMnO23FMw=;
        b=qXzcTQIsGdDfq4w3F338eHexM5JlRMWujP/sGsC82sC7KHaB+goRwBmj7Yx0U9OF96
         jp5ToWAoSfc+GEmszvzrWdsiT16SQDrB3Er0+DOcJbTwWD2ZT1r3mf83jJf32/hoK5Hp
         lMPiJyGC9Tn3iNR9JEl5i3v6qH9KwoAuZGFp8phQmRBzM9J+Ix2SndUwbadvXNPb93Ma
         hVjj6ZfL1Ye7mG04Hs/hf3Jyfdj9IpOx2AlA5C7Bu6ND6AZoDVO9/70mTg6WeoMy66CV
         JjpIgbph1kUu/fyy60OTnLq54+Do81jMKiAqh/8jcLmihm+ZS77o7OMTyK+9M0oZ0ZU/
         YfoA==
X-Forwarded-Encrypted: i=1; AFNElJ+iK0XjtG4wRXrChERInFJV51nfhN89kbxqTAvLmhgSrba/wZkHCWyZHGvpklgbCI4g3IfDExvObwUe@vger.kernel.org
X-Gm-Message-State: AOJu0YxTduU3SVwlam5r1TJBK2dvhqQ/Qnol2CMuM3r1cpXLbQonrzhE
	kCR6AoJB+RQvBSF7wyXyd+nF4Jdt5YxsHdUM4AmfLPedhUt53MR5Jtb2yybtm7mE
X-Gm-Gg: Acq92OEPRtJSEuP+uutMvHIXQPz+5k/84PIm5Hnr+mCTb4x8MJtyz86wQW7hgH6G8R+
	JDI1BhdNmnLdZiEFjofk0qfgYAwUU5rOIkrmzDh/ZEdputH+BqW+YLl6e5o57zqjanm7hzMly/V
	ocyjuP3LR333aK5RdzvTaPkudUMxfCo6QM33/kXFt1LRFfV1HQk7moyHfq0AxUeoltoPuvtwzu/
	QSjqbwSZ29K7wt68gGosJiUzfhkpdsoV7d6ObK1wg8Wynuw2w5Kf5+ksOxBoupPJ54DvDyHzt/l
	dSBvEcBUOdvfYLaxTkHZRSkFgbwaYlatvcmTdL/HJu9rdAeh+kUxXhEt61iI+Ml804EmEtgFc4C
	ku4+ckiuKl58wExuPhjW9C5jof/PUVWUZH9fEHzNG7YfpHdhaG7fOL7giD/monyDLXQCKqYr2Di
	N3Qn5AFS9Q9U4bI0Tzp276xAQDst2UeIClSw==
X-Received: by 2002:a05:6a00:1406:b0:837:42a6:58a2 with SMTP id d2e1a72fcca58-83f18ef9d1fmr495822b3a.35.1778696600619;
        Wed, 13 May 2026 11:23:20 -0700 (PDT)
Received: from localhost ([203.99.159.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19663ff8sm209924b3a.8.2026.05.13.11.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 07:23:10 +1300
Message-Id: <DIHRBHBFUWEO.CMT0EUZJ5JR2@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 4/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rishi Gupta"
 <gupt21@gmail.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Matti Vaittinen" <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-4-g02324e9d9cab
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
 <20260513-veml6031x00-v2-4-4703ca661a1d@gmail.com>
 <agStVi6NXRnQOOOO@ashevche-desk.local>
In-Reply-To: <agStVi6NXRnQOOOO@ashevche-desk.local>

On Thu May 14, 2026 at 5:56 AM +13, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 05:49:44PM +1300, Javier Carrasco wrote:
>> These sensors provide two light channels (ALS and IR), I2C communication
>> and a multiplexed interrupt line to signal data ready and configurable
>> threshold alarms.
>
> Can you split this to two or more patches:
> - basic functionality
> - feature 1 (exempli gratia, IR)
> - feature 2 (exempli gratia, multiplexed interrupt)
> - ...
>
> ?

Yes, I can. I will wait for more feedback before proceeding.

>
> But let's wait for Sashiko if it swallows this big slice of the pie
> and not choke on it.
>
> ...
>
>> +	{
>> +		.compatible =3D "vishay,veml6031x01",
>> +		.data =3D &veml6031x01_chip,
>> +	},
>> +	{
>> +		.compatible =3D "vishay,veml60311x00",
>> +		.data =3D &veml60311x00_chip,
>> +	},
>> +	{
>> +		.compatible =3D "vishay,veml60311x01",
>> +		.data =3D &veml60311x01_chip,
>> +	},
>
> Oh, is 'x' is a real letter in the part number or a wildcard? If the latt=
er,
> please avoid. Choose the base part number instead.
>

I mentioned that in the cover letter: the x belongs to the names in the
datasheets and every part number.

> ...
>
>> +static const struct i2c_device_id veml6031x00_id[] =3D {
>> +	{ "veml6031x00", (kernel_ulong_t)&veml6031x00_chip },
>> +	{ "veml6031x01", (kernel_ulong_t)&veml6031x01_chip },
>> +	{ "veml60311x00", (kernel_ulong_t)&veml60311x00_chip },
>> +	{ "veml60311x01", (kernel_ulong_t)&veml60311x01_chip },
>> +	{ }
>> +};
>
> Perhaps use C99 initialisers, as there is an activity to change all drive=
rs to
> follow that. Jonathan, btw, what do you think we should do in the light o=
f Uwe's
> approach? Require C99 initialisers in new code, or something else?

I will account for that in v3 alongside any other suggestions that might
still arise, thank you.

Best regards,
Javier
