Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC32C14A
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489576; cv=none; b=uqhgV134p14B5GBFQB2twBk2uL0L0glGIhuFbBQmD8nC+mZHmoH90ko5it0gl8B92FVDneV5g/NM8u8WIN6FPy9/4ofCn8lfyyD0SeqqetZJnPndO7yQYSomknwx1iFxSRrRRiYB+2Czuu0XV5AYeMZx6jGqQY3xjNVoAXmgM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489576; c=relaxed/simple;
	bh=v6/9V/mp+0VaUqiO4OggX9M3nsJ9rsEkbG6fS3iZ24o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNk5TvJTILe6K6kuE01c0rxLUbQT34bPVV5iuCfIxdTrA1WeOfQvvqO3qUWPJv4hqWUbbd+YL7UhOPMkMoftRExZt+YFLM/A7c9Ep3gEcI522eL7/CTfFvMb9k56eYg2ON7XThZKo1yDAoGnXxDZvQ+4TigHdaNqDTE9ZAAvd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=fdSguQNj; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="fdSguQNj"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dcdd23fcdfso81361a34.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 12:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777489573; x=1778094373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLp77h37TVQdWoQsotndHzDBo5bpvvkPFhWBJBsBzYc=;
        b=fdSguQNjqLtGBdBpn8vqsF50gEHLhFAzDZI11aRQ+hRC7SnFaxrmtvazmMiVwQr6Qk
         9VIx4qH7N6COIPqkP/bKOnM6ykzb6ABaivLxN50LadNB4ld45pwV5I/QTKhVGXX4UwlK
         bd2zvgMbvED6DMRS//um3wq58CFSG1yqjAaH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489573; x=1778094373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLp77h37TVQdWoQsotndHzDBo5bpvvkPFhWBJBsBzYc=;
        b=a1FAtooj2Gq2waXWVaKtXfmixUCs2jxEkfCMvxKonYO9gg7ytbLafCryh4Jy/EEC2E
         J1yg86suXaMvTQjb8bu4F6uJ8BhNA6uQdxZkfr1FdVbuF4upxBvX9Gdkz85ebsgn6Anm
         dZt07tqcPP78qd7UKQXfAXC7cfYa0Yjgn4RRq3S7UqVyLrxpRG2IZ+NdkUaMWx0F/FSm
         CUsstwHBY+hc4olPUWY7S69EFjZpBfLgJNaNO3Z9USrC0eK6Ka/q4USQDWIIkzQH0eAZ
         tqVTnITI/mJwqGKgObHMxUVREu5szrE+xqXbY/N9yj82vhv9tt8OCjaeO40Rn1i0H1Nq
         ZRjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wMW4yWyN4SCnb8mg+wq9TvBvATinxADMnQ0k8uPk9E1Dti1JxmR6fj09JBv8b8KN2t1hH3LhtLIRO@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwGUveauZ6Gl93DX1TTLEn7M96ls10K3Q61oL3ImCHa7/pjwa
	AmzqEPGEsjua23uVq77PSxYrGRumZH5X+DF35Lsz7qNrSSWQOLs4Ka2qku3gaU6pAg==
X-Gm-Gg: AeBDieu5j+QvtbdWv8o5hN9VyODKPAqAY4SaWFu/+jNZCQfh/NZRJ7ffiVR7lQzbI1F
	9LA6QXYXWbPFIEIE+Ut4rxFXr+DximKxOlCm/dOBWYLN6DQSiiQKMYgqXt+pw3pOq6qww+XMV5N
	Z7r5HnwxXXiQNjB8X+ZtOGsSplQPxxXYMn8qxQpOaj9c9r5jg269Hd1qAlGxtT5l0CAKWh3E4X+
	m4kt2jZx2ByZthBZ4SGu0/212XoMyD4jR/Aq1T8NwGIJpvlY5TT39TRwPA7sHQX/Mo6NXsqzJlR
	euFfKRwKulz5+g7L9rsQVBq1wkOBWZei7D72+VLJr82ynEjRP+qp2nWxoyx6S3uBt+RDXNfqFKK
	BlRk6Kp9N8VNRQEXqH8jXwkS8g+IY5c9VVM7PMehy2TexBBdGAu9ijiaw3ZSuGydfzXGgdFVu7u
	munY8yk+zC2D1pUeU3qt1CCl2Uv6HBTPzeGh8F2B4sm2vxdCgNzYfby8ylmBS0G56r78StaUj4F
	c7fp5o=
X-Received: by 2002:a05:6830:6008:b0:7de:44a5:51ea with SMTP id 46e09a7af769-7deba07072emr31818a34.6.1777489573064;
        Wed, 29 Apr 2026 12:06:13 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7deab9d5b9asm1822657a34.21.2026.04.29.12.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 12:06:12 -0700 (PDT)
Message-ID: <856f4e8d-ff7c-4744-9624-e838c758f009@ieee.org>
Date: Wed, 29 Apr 2026 14:06:11 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Mark Brown <broonie@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
 <20260427-spi-spacemit-k1-v9-2-ff753b551302@riscstar.com>
 <ae_8n0I_ORDLib1y@sirena.co.uk>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ae_8n0I_ORDLib1y@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/26 7:17 PM, Mark Brown wrote:
> On Mon, Apr 27, 2026 at 10:01:28PM -0400, Guodong Xu wrote:
> 
>> +static int k1_spi_transfer_one(struct spi_controller *host,
>> +			       struct spi_device *spi,
>> +			       struct spi_transfer *transfer)
>> +{
> 
>> +	/* Record how many words the len bytes represent */
>> +	count = transfer->len / drv_data->bytes;
>> +	drv_data->rx_resid = count;
>> +	drv_data->tx_resid = count;
> 
> This is setting up _resid with a number of words.

Guodong, see below, but I think the above should be:

	drv_data->rx_resid = transfer->len;
	drv_data->tx_resid = transfer->len;

>> +static void k1_spi_write_word(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct spi_transfer *transfer = drv_data->transfer;
>> +	u32 bytes = drv_data->bytes;
>> +	u32 val;
>> +
>> +	if (transfer->tx_buf) {
>> +		const void *buf;
>> +
>> +		buf = transfer->tx_buf + (transfer->len - drv_data->tx_resid);
> 
> This is using _resid as a byte count.  It'll be fine for 8 bits per word
> (which is by far the most common thing).

You're right, this is a really great observation.

The best thing is probably to just have the *_resid symbols
represent bytes.  (Their definitions in the structure say
that as well.)

k1_spi_write_word() decrements tx_resid by the number of
bytes transferred, so that's OK.

But the FIFO handles words, and k1_spi_write() limits the number
of *words* transferred, so the "count" calculation there needs to
take the word size into account.  Something like:

/**/	unsigned int resid_words;
	unsigned int count;

	/* Get the number of open slots in the FIFO; zero means all */
	count = FIELD_GET(SSP_STATUS_TFL, val) ? : K1_SPI_FIFO_SIZE;

	/*	
	 * Limit how much we try to send at a time, to reduce the
	 * chance the other side can overrun our RX FIFO.
	 */
/**/	resid_words = drv_data->tx_resid / drv_data->bytes;
/**/	count = min3(count, K1_SPI_THRESH, resid_words);
	do
		k1_spi_write_word(drv_data);
	while (--count);

	return !drv_data->tx_resid;

And we have the same problem in k1_spi_read().  There you can
probably change this:
     count = min(count, drv_data->rx_resid);
to this
     count = min(count, drv_data->rx_resid / drv_data->bytes);

You'll want to review and test yourself, but scanning through the
code this is what I see.

					-Alex
