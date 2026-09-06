Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FE5358D32
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 20:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725771; cv=none; b=Q4M/QL8miP0xSy6+iByk5Mj/UOP70QzI4nCCWNAoUtsK2vLDQra8ECpF4mx7hwfWygc3AZB9LlNHzrtt6yy8hMTlL+h+kYO7W2x709MTRpW6NJPavwygMHZ2g1pgGoeYlY1B240StjzfCgvBzVAiFjZ/dEh8HohfqSO1gxOy018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725771; c=relaxed/simple;
	bh=fO5Lwg7bVKd3xWFVdpuMa1iIDalrBwPzFNje6U0hlhY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=FZ8+484yeZv78Bevc+Unv+NA/b5GdExb2H+WDxyd+Ct6qu+gmGL3m73i3HqQnXg1um3/3ndJ6zsiqKuyZPcNVUOwjkZ0sH+E+fUFz1uydNAjeyYMcH3u1DmcMaheXl5TsNTyvlFfg4J60Ll7eL3EZFMqD7goYEf+YOEZGCZjkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=my1G1fBx; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="my1G1fBx"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c7afda4515so1679113e0c.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725769; x=1789330569; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2LTI3znDIwovyervFr5DAc883+eC41JzvRn5/loQas=;
        b=my1G1fBx9KNjMqwZZ0Zw7kTohIIN9ia5e1dKoUkzIk8UC6UcxKfQU0PSiJ5gGmNtG9
         cGfmBqgpjNSahdQvtbgU4IcIqjBwKsbKQlBao/ZrpRGtmxTfWK8Cz/ta1IHq0J7DyHdw
         QC2HAL6BuZdHcDX1wtMYen+KgAtXkx0iQTBAHS7vdek48jew2EY/dGPfy0ZCie5MKwUJ
         0+N4Adi561hjPjDET8NtUQIX4v+Bu5p4AFGRb/4tT7ROZ0LvjaJ1xFLZKIOf+UWgHYM8
         0lZgnwocjVBquXo2GR81Ca/37TbHCoMFS/tdlLsJYLDRbFvGanUwXwtTbLA4GzE0h/3/
         La7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725769; x=1789330569;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2LTI3znDIwovyervFr5DAc883+eC41JzvRn5/loQas=;
        b=ZRuKLTASv6COg8Zue8qHYp8n0NGPNUB192fSUMxd6fYm0Z7pdRcdMfWR0fKl79sWYJ
         pCxl8Pck99rxHFC4dYXEus++s3bKqfz8q8KdvA88zgnv+O0RBV/6wrHHYvHMO0lJTzLP
         EtZ3Uu7Xpl0MCUWgUQmj1nHJq8cGHplTbNmUI9w1DQw6VaNji1w31rYgmUzkchIOSY8N
         Skb0apEiReOXciDXv43ezi0PYCF36tnjyq/u15wdyJkP7lWx/wW+U3+7EE2g3NmO3NGa
         1NyoBmtj3XCnKwu05NUxGgDMn2oAftS4oO5qXvh7zQ2xVmV0MOUtyltYjh75/oP8yl78
         Ja2A==
X-Forwarded-Encrypted: i=1; AKwUvBzvg0LkBBD6BM4lzxZf3MbyTwl+mCvH+8dPtlRMETxixn1mSHXfckeht6Z3Yn1LGw/hSIKnuCWWqha+@vger.kernel.org
X-Gm-Message-State: AFuF++kS2sNLqAk+nkPwCIStGovF/oBBUkN6Brs/d4aZcRt8e0QLJqO1
	S8gm/u9HO/RTh+5QM7czPJO5sche8lU8Hq4s8kVZxMsAnmyMmlS6WOZb
X-Gm-Gg: AYBFou16kHuOCOYGsO5DsQS6mN1KHyY9UWHKpPQG5uGq9VrUMTzjxSeUImAqVwwwHfy
	f62/BqRbsWw22li115IJMlV/AoLtg8T9gjY8NT8nb7p0JwKUaL7l92Ys9QAzd1jbSeX9V/Y7BSq
	Xf7mbUuAlPx+/Z1BzTrUq2wtqE6+OIzVYo5tXOOzNGnJ4bO9Cs2dSKTQ6JlnwmSpcF7uaZ3ePeN
	HL4TTx8crBz8JaWYEYf9EsxZFCg1rMDlBcm4Yak0sIapWHshS5NnVmQfC4qbkLvl+EPyXZfb6KK
	kHtsHnDmXUQ4VnUmuMl97Lz0bUKiHi3anBaGQrHrGTbt5ho6YmYebGF+HUMJsnV8YkPt7JkZEIY
	tsITv3kUnf4Tpm28V7wu5t5NT84ZjqwHcFSc4VS+nwIsIh48SDhZxGa8nAsNstzm3VxclvJ6i4T
	JLXPcwze3yqObPTNd8R04eEXsF7YtrlA0ARlsiOugec9RAHVyQyA==
X-Received: by 2002:a05:6123:2c8:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5c7ed3e2247mr8141061e0c.6.1788725769334;
        Sun, 06 Sep 2026 13:16:09 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm6411242e0c.9.2026.09.06.13.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:16:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:16:04 -0300
Message-Id: <DL8ID3WRU6QA.2KWPJIFB134MH@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/10] iio: adc: ti-ads1262: support per-channel
 sampling frequency
From: "Kurt Borja" <kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-4-1dc27e9c0260@gmail.com>
 <20260830023619.654d1bbe@jic23-huawei>
In-Reply-To: <20260830023619.654d1bbe@jic23-huawei>

On Sat Aug 29, 2026 at 10:36 PM -03, Jonathan Cameron wrote:
> On Fri, 28 Aug 2026 01:38:19 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add per-channel sampling frequency support. The "available" attribute is
>> assigned per-channel too, in order to eventually support per-filter
>> availability.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> A build issue below.
>
>>  };
>> =20
>> +static const struct ads1262_channel ads1262_default_channel =3D {
>> +	.data_rate =3D ADS1262_DR_20_SPS,
>> +	.filter =3D ADS1262_FILTER_FIR,
>> +};
>
> See below - this probably wants to be a slightly more complex define.
>
>
>
>> @@ -763,8 +970,15 @@ static int ads1262_parse_channels(struct iio_dev *i=
ndio_dev)
>>  	if (!chan_specs)
>>  		return -ENOMEM;
>> =20
>> +	st->num_channels =3D num_fw_channels + ADS1262_MON_CHANNEL_COUNT;
>> +	st->channels =3D devm_kcalloc(dev, st->num_channels, sizeof(*st->chann=
els),
>> +				    GFP_KERNEL);
>> +	if (!st->channels)
>> +		return -ENOMEM;
>> +
>>  	device_for_each_named_child_node_scoped(dev, node, "channel") {
>>  		struct iio_chan_spec *spec =3D &chan_specs[i];
>> +		struct ads1262_channel *chan =3D &st->channels[i];
>> =20
>>  		ret =3D fwnode_property_read_u32(node, "reg", &reg);
>>  		if (ret)
>> @@ -772,6 +986,8 @@ static int ads1262_parse_channels(struct iio_dev *in=
dio_dev)
>>  		if (reg >=3D ADS1262_MONITOR_ADDR_OFFSET)
>>  			return dev_err_probe(dev, -EINVAL, "%pfwP: reg out of range\n", node=
);
>> =20
>> +		*chan =3D (struct ads1262_channel)ads1262_default_channel;
>
> This is giving me a build warning:
>
> drivers/iio/adc/ti-ads1262.c:1913:26: warning: cast to non-scalar
> drivers/iio/adc/ti-ads1262.c:1913:26: warning: cast from non-scalar
>
> So we can't do this... Hmm. It's pretty simply. Use a define for
> the default channel with the (struct adds1262_channel)
> and that should work for us.

Thanks, I'll go for that.

...

--=20
Thanks,
 ~ Kurt
