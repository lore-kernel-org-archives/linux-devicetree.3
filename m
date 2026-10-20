Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487596;
	b=l2rbIL144Qyy8NQ9AS5z5sS3+iWE7pJLHMc5WqJLLRoa0f2dag3Se9L8MDRsIYDGZjMg
	 3nof21UF5jClzUd83qmbkMSTYglsvEY+LNOXgF4bhMeEOrddPve+qhEHRuGsVP3+byhTI
	 Oqg4HqvPAkS3v9WlmgBV3Hr8ncjM2AZPf8oKt9AJ05wq7xr0qkH5xoofRpglCQEVgPou6
	 3VOnCBRjJ7gZxYPBNZNsdbm+DuWFIcar5t9ay8xmDaW/4e6ua5LHu0culrCw/DhnrQwgs
	 BwqxHz1t1ONuEhW9OSVuRJgbMAJwBv8cUVgr2ingEa2aB9jeZQzW0JRN9L/EjwkXSTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UpTb3tb5vUpx1h4uzHZtWBKoFQfw93PEG9+vK9k2idU=;
	b=AzjZVGXO1sritsN9ebHx5291Z6eepkMsMpb3dcA+Aza/MP6OzCy3fyyc/Ncc+/Z/RKAE
	 MdT7UPsFvuwHpkW0ZWznpJUAVEYMC3hVVGjdEHGqGevWL/g5WGrKXxqmPc3mixh+6asUB
	 WL8NFKDd8bbQ4v06Hj+ksvf9/JOEAJIlJv757W23LPF10ztIqxUo94rKgANOMC42J2kbC
	 iho+RYadZXDYdX8H9OW2RT1JOP539882XwJmGvohYBbGoPgSKJ5jUY/ds0y0yPVVyE7p+
	 Zmh2wicZL0YlBYNJKoXFhiCY/1VWJO173axUtrrU+RNu1ycD4NTpjS77age4MLsjySw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O11GHG1I;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F5606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 225F5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O11GHG1I
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso23829135e9.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792487594; x=1793092394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpTb3tb5vUpx1h4uzHZtWBKoFQfw93PEG9+vK9k2idU=;
        b=O11GHG1IEoNCa4pX4ex4MmUK4rZxjHtzo5TMI/mfwjb7KXyfk6cqJjp+LlCJ2e1csR
         MC+IV4GYkmKZgxilyE01Zt38KELmkrBQFRHTehMT5ZmOS94ectqDTpIbNyMkFeED/jL4
         seRvNb8aTp//W4Hv1nfIElhL9+N3T9qDjNJRuR4qiB8B9w8eY0QOABMXjFnlQG8X4jRj
         71aa0g05Zca5KGXIElfJDR41EdHHNdfJIL01DZg9zdcwpHXXWcrNMKFF/H7mlAC4fC0h
         +P10xpQM9Jxj+wLPrw3soytXJt7zk8uRmUM5MjOHBWiP51YLfNKsUDrHZakEhHtKVnmi
         e9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487594; x=1793092394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpTb3tb5vUpx1h4uzHZtWBKoFQfw93PEG9+vK9k2idU=;
        b=LstgZY+8SNCoFHAt45mbmRYswfnJ1LonGqj69+BOpcEWLsrfvQc+wpb7IPtSPMAaa/
         5T+jNVR8wB8XkJAHmbmI+0Sx446gnoDRDQJwMCaKYLYcSn45Zi/HzKweYf9XXnHo1hUX
         21rS4va4wef53PnmnCXjvBB3HH7vxbx5jKXgRKvmLjtVx/Sx9ISaIcaYPJV56D0iwMkC
         ZqyEx4t3DB0r8dc/dwLKns4nw0db4eKf+rfSQ2T8TkoGttZ+JXQSDuX91xzdnjmK7SYN
         oSeOCBJISrz8Vn/pn73ba9tazfnQG8XaIcbfcgb9vDVcAvdss/wLb5quO/Gw6PGBvvFX
         O3WA==
X-Forwarded-Encrypted: i=1; AKwUvBzL56Vhg+IJUCdPXIM6ob5bcfJlYBA6g47+Fe35CdVZWdhML+LYXcLYOpsChUInkOK+u21IKkp4GHcV@vger.kernel.org
X-Gm-Message-State: AFq9FYITGHWHLXFUyKbgWZ2eWHbXhvb5Ax6zGkGvUWiISkL36F5QqBke
	kY95mzJYRksGadb5N6NBxGSDcdb02nWU+vLnH9GzNIPND8/Aq7DUftqH
X-Gm-Gg: AYBFou0vqEzb7MLH/YZH7qcA+ZWUMta9PbG0LtRYHiwKWtEqDxpzcbqZ1pPLjv6ujLl
	L5zF5npJvpqQUEJIRyskCx0cimLqHAkZV2I4kjdVz5SMRUVdlj8AWJxuKGH4kiN0EE4aN9bZoVt
	esAi9LOtJb7sYkPmXzckemTQn6VlpePrA6TXCT0l+QUVWGcAxJz8wnqqTJjbVUFuJJl4G0baASZ
	zDm2OPG8DSQiH3Vm2NQnwa6Qiqy34UadgOTX/qxETpUmRoCJbur9Zjfflfq7HEnwrAvg5NL2Lt8
	ymZPqh+vcwZ3iB+pSbLQ9rLQsDNxnQo2Qzbui7xX56tZjxoMCp0XZ5fBVwER+vMzRENwDUVBd6X
	RGtKAwE1kbHxlHs2nfhHuWscq2aH5pYthaltRvxsvZMY1Wbah/4quFH4eEcyDnErZMVNTrwieoX
	8FezRqAns1mwIsEw7ZjveCyU2NuBW4hz1BvaW3santI1/OkinKGPull9obumE/iSTaKqjQQaU+w
	RPF1m46kPKmJiRt8eUZ7POp06h3PIhfLPI=
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr237394785e9.2.1792487594144;
        Tue, 20 Oct 2026 02:13:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm61649665e9.12.2026.10.20.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:13:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:13:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Message-ID: <20261020101312.47d2eaf0@pumpkin>
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
	<20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 16:07:13 +0200
Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The MAX34417 is a specialized current and voltage monitor used to
> determine power consumption of portable systems. The driver support
> getting the channels voltage, average power and accumulated average
> power and energy over an I2C/SMBUS serial interface.
> 
> The MAX34417 datasheet only specified on how to calculate the
> accumulated average power, but with the Sample Per Second rate
> we can easily get accumulated Energy in mJ.
> 
> By default the IIO driver only supports single-shot Voltage
> and Power sensing, but the accumulation can be enabled by
> enabling the Energy IIO channel which then enables the
> Continuous Accumulation Mode.
> 
> The counter is common to all channels, so when reading a single
> channel we will copy all accumulators to registers, so in order
> to permit reading individual channels we must accumulate the
> other channels in the driver when Continuous Accumulation Mode
> is enabled.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
...
> +#define MAX34417_POWER_READ_LENGTH	8
> +#define MAX34417_POWER_READ_OFFSET	1
...
> +static int max34417_read_acc_power(struct max34417_data *max34417, unsigned int address,
> +				   u64 *acc_power)
> +{
> +	u8 buf[MAX34417_POWER_READ_LENGTH];
> +	int rc;
> +
> +	rc = regmap_noinc_read(max34417->regmap, address, &buf, sizeof(buf));
> +	if (rc)
> +		return rc;
> +
> +	/* Ignore byte0 */
> +	*acc_power = get_unaligned_be56(&buf[MAX34417_POWER_READ_OFFSET]);
> +
> +	return 0;
> +}

I was thinking:
	struct { u64 pad:8; val:56 } buf;
then using bswap64(buf.val) >> 8 on LE.
But why not just:
	u64 buf;
and be64toh(buf) & (BITULL(56) - 1)

David
