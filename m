Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33143F9F56
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654635; cv=none; b=JQO1UJoAe7rOgSJ0fKLFYAGPkJZEpttXo9aYM1sMW2g86fq0e4A58qgpJ30rG5LW1o+Co5yr19Fb8gazH484luezI03Ckku7S6D1Y0GnXDCjqJiuVGAbbSpBfTAfapDwuWXqzZzmssrIFVq18OszcR8U4/Qw4927KLTl4vpkZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654635; c=relaxed/simple;
	bh=QFInQJXondlUA70nRR+VYLFa+WvVwFUjN0rN7mFQJiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2HyleOdMvxFQWlJvirqfa+xEkBsAUAgdoRFLO1celBbVH1fYOc5VVXz2hKuwtI1uU0BLPQDsZSwJcN7197ZrZ8omuccAidRT10WVcQVx3arPqD9uK5OMZBwjKkO6hdPpD3k4BG7bam2VlA50IFjpcTNR5i86ffaYkhaj0yf5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/Wc1RY5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/Wc1RY5"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2022323c37so717722566b.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787654631; x=1788259431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UviVHg4iRcsv0fdKQmMFuzXb6W/9vw8IV+1dqwY6Nl4=;
        b=a/Wc1RY5XNJNyi9xtalA395JKQG+d/KRFLbhD3MT26pBIykJU04GXtl4wMSgGelycJ
         zAS6WKB3joeIIDyOe4rCBaxAPG7DIrUOuh/85cYs6Ksp/0l16Slw7xqde576FqGeINxH
         w6cxm3yK090PL466jRpAbgXTzZuvmv5bXfKrJbDPhTKl8Xd3/i8KyoDSy8jQl8MdzRDr
         nw2SpeA6Iza/3I/5fojrkDdUffa95lLQoJRf/hrx1YdEqpGTczUm/suVmYMnVu+Z9H4v
         ecciR3KkNTFvhSLlkRgd1oi1se5GyGJvs2YkvWiRyC1lbw0FPrJ3YfffAx5968bVjzAv
         Zeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787654631; x=1788259431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UviVHg4iRcsv0fdKQmMFuzXb6W/9vw8IV+1dqwY6Nl4=;
        b=L4CL5GH9pLBaXVIzunuACCjH2KMz4Zmx49jYTQYAFJEjP2RJE6ZS3GF2gHlgAkZ5gD
         dP5AdIrOjRXjIg+mtYy6ZJ0SPiOyKPWQHg1JuWoogNdawdBtw0YZy90cFo4xzL1MKH3Y
         9WLgtxCghCPHWW5M0usGLpfb4GRuInVzZl987wvUygefq/W4CZ+NG7J3Frog1OPLPeB7
         cMRlQbKP+xQKuYNiasuJ+VZ8iprzWH1XMIwq3nXvlP1mVO3ljIvRopEBDaXe7FfmAhoI
         YJXX3WTVKXNyozUQ3eFtmMRXnE3qqF2xs479zNRG41eKddFdlrS241JNuZeORmbGsSNy
         Iyrw==
X-Forwarded-Encrypted: i=1; AHgh+RrDToGjJUEbd0hJcz75ooSwnUP6YvtD3rSbe+Rj78EsfGxyn2sNvasl21r7fO40LTVLWSGm0fwMXrv6@vger.kernel.org
X-Gm-Message-State: AFuF++lZNuKUPctKaJ6HVUz+clrFaGeLJKaWzQxCJaKNIai9ioEMvUUM
	huLoURALZ47LYl9kxiru1KFUkztsquuGiB8++DlYKeSTIDlCHicLNSIb
X-Gm-Gg: AR+sD12DnUDO4Bu1lp3lsf207Lcl6HTYa1NBWOlJyF1TtzCePjD9Dp/GVVoA8XIPGgY
	S5MJyZediwwscWlgmTwnqHhPcklAu8p+UqBefxcq3JdbxCSqn4e2si9G6z5fap29DnsJ/sIdLsS
	NrFfrTbhmgWauhWIAFjxwmQQJolAYUXvtc0y2tKTJHkd1oxCGbGhpYS4iF4NI4A6DB6JGQ73ibE
	t7vlJKSF5MraiJuouuk6RpskVmaAB4rJCtKFUVPk24ffE9KfaNfk0+WLLFrZkd36VD91wKFCsbV
	TOHBlE3Lhl8pXPP7TCP7IlfA0DLPPn1SeYGgbRVOeHwLfg1EpqNpEAOA+hGUHY3s/+xeMzsDawa
	wV9hsvBF7yuRDFZgaoHV5DpRcc2cLRd8dyvO+FcZ6GyPAZXuFSXTd7A0/V8KhwLjU751exoV8G0
	hoxK2zWhKyhvg6YsnId+Uid+mY/iznPD3FDFw09+KLU+TGbHBkax+2w1Kkohkcp3cov4rbw5VjY
	YlXEL1mSY8x91dJ7HW4uetkW3w2DSghakmEFtBeQSIp29dRXZJlIzw0
X-Received: by 2002:a17:907:8995:b0:c24:4128:c19d with SMTP id a640c23a62f3a-c24e584dc37mr540823866b.4.1787654630510;
        Tue, 25 Aug 2026 03:43:50 -0700 (PDT)
Received: from [172.24.138.145] (dynamic-176-007-058-112.176.7.pool.telefonica.de. [176.7.58.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d741asm13240282a12.27.2026.08.25.03.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:43:50 -0700 (PDT)
Message-ID: <79c44439-86a3-4eba-bd6f-44423c59c17d@gmail.com>
Date: Tue, 25 Aug 2026 12:43:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/14] iio: adc: Add AD7768 and AD7768-4 core support
To: David Lechner <dlechner@baylibre.com>,
 Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-5-bb8fbd06d4eb@analog.com>
 <10d575af-2a2c-484b-82b0-0a00de1c50be@baylibre.com>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <10d575af-2a2c-484b-82b0-0a00de1c50be@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/22/26 19:30, David Lechner wrote:
>
> On 8/21/26 9:06 AM, Janani Sunil wrote:
>> Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
>> Configure supplies, clock and reset, use a custom regmap bus for the SPI
>> protocol, and parse the enabled channels and input buffer settings from
>> devicetree.
>>
>> Connect the converter to an IIO backend for buffered capture with CRC,
>> provide a fixed safe wideband sampling configuration and add runtime
>> power management.
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
...
>> +static int ad7768_regmap_read(void *context, const void *reg_buf,
>> +			      size_t reg_size, void *val_buf, size_t val_size)
>> +{
>> +	struct ad7768_state *st = spi_get_drvdata(context);
>> +	struct spi_device *spi = context;
>> +	struct spi_transfer t[] = {
>> +		{
>> +			.tx_buf = &st->d16,
>> +			.len = sizeof(st->d16),
>> +			.cs_change = 1,
>> +		}, {
>> +			/*
>> +			 * Register responses are delayed by one CS frame. While
>> +			 * receiving the response to this read, the device also
>> +			 * decodes another command on SDI. Repeat the read
>> +			 * command to avoid sending an unspecified dummy
>> +			 * command.
> Could this have unintended concequences? E.g. register writes that have
> size-effects, like reset or clearing status registers.

Repeating the command cannot trigger reset or other write side effects. The device also does not have any read-to-clear registers.

Thanks,
Jan

