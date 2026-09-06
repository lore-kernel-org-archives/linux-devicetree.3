Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6C73630AD
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 20:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725829; cv=none; b=mJPC0ARhcqdQi3BMTJFI0/sYOUfysJdby6dFGaAQrPjZEw827OyP4U6g3y5EtgpjaLLbsa/0pOTpye501EYi5MYta+y+hexFiYuViatqeCB0zO346GFZailRkspoOGCkKfg2LLcJ3vKJb7n+HE6mhGJ4BBelq+Rr41A91ahAEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725829; c=relaxed/simple;
	bh=ykDPNgeE6ALCDtG9dIbJeisPavXCkocBpXkJWK5BPFc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=YWVRYH/VjzygGykSJEIstPhGvRkV7c1MJvgJw+JrEWbk4cutHFnQAwKBI45dM9DVH2lFrE7SOY5wJIYUwAgrx8Qxq1/2nFLuyIu1fd44THbFF8O/Ce9l3JKjMsnVftYgmIJuao9KAZlCluJ3LhwG7RNIqXvSPNdoN1EiBHJKo8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0lW3qV8; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0lW3qV8"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-977258a75d9so2179912241.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725827; x=1789330627; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G71y+UDrFIT1z0z2AwWCoqvpruo2h+SQeZ7yG6rfDDQ=;
        b=d0lW3qV8vMIQtpRJeOctIwZxiPL2OxRw1xN07JnLut9Vo2HpQXUX55E8Fjjg9QZo2g
         tyWZ1ELwuiSNuFlQiF2Zv7MjYBkTrQMEcXv3UdHrfz2z7MfkcvMcfZG7LVAsafZFrIGx
         icKTK9qz31pjtB4M09VVN1le5eGejZ/umhDVAtQiEKSdYjDzHgPLmv4yOuDTjF7oqD9u
         m2UwNuGhKwSA+8oS7YtLnKY0Nh7L8J/v0SRihhZ2wdTkRX1meKX3LowDkjGlF07udSaw
         K9eDe6yFpFuuI8x3yJlwy2mb1VO1D8HJO4koVHnSicGP4RX1xr7tRBHsZ/R4aQWbF7GE
         qlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725827; x=1789330627;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G71y+UDrFIT1z0z2AwWCoqvpruo2h+SQeZ7yG6rfDDQ=;
        b=XAix4AWNgefaXVYAJJcwNfHOf/w86+wIIMGs+2GmQ3Hy5f3AINyFgX1WAQX4cXFchJ
         lBQ1beCBk0bYjrPv5udGSiIA+bb/W77wlQLB5k9NnVCu3GWKqSiDlNLvwt+o4e8VfOt0
         HiILodvE3g7lwLkyDI1aNLb2vod74NwVCf0M8mob+z8s6thc4vkSfREgv1EPynP4rNmS
         /o40fLLydLQeLZhKWh4TbbepA3ZhwKekM8iaw0J0Jr8H1NLqlj4n9c6rCPMytYzdZu9V
         py7S667LdrRTytQyPmujXakdUc2dx8bmvbkn8Dgf3kJKq4Oce6/tfi+4/8gFPpMfd7iL
         SGAg==
X-Forwarded-Encrypted: i=1; AKwUvBzFDuQVezrOSBfkn4xi6h2UpMIv198e5mD0JQvHfWap8WQNgMB7GJL6QNF9kNqbk/sXxTrmsZnZkQ19@vger.kernel.org
X-Gm-Message-State: AFuF++nQSYoNkTnnG7mUFjWuU+pAOPflLMHLgXb+Vb16AUVHY5KYJ2Lk
	dGkoBsMDioaEvCVMFN1AGLuwm1fC/tWUXmN+Npf0pkBqRmvitF6iX/iq
X-Gm-Gg: AYBFou2vBfUdu6eCvEUjXkflNvcg4SoRnssfPpLZMx4isCV4b/QtFV4p01TRQKx6vzt
	moW7Me4FVKFQO40vmvfS8rjCEJv/BEKJ/gZ0uao+eG/mtq/tvkL5tjKbCSbHMIMxQSGS023z+JM
	g96VG7LO3QCwanpWSY3rdQoR/zDNFHfZQ/NB9B+IsapkT6Qlvc/NOdEi0PkyDAOddAKHD++3dwy
	Fefj5B6kjJY2IBUNj0k5U9xaMyFbIGJgOI/VNTh4vz6o2tq/sw0lhfgxKnb8Ttz1ksokqIaPc8/
	JfYKmmrLVfPK5xPron6L5PlmCmkKT4E94ov2Vj/dxSbbeIvMkhtlOnrMy1Y94dOCBx7+1PwSfVQ
	YLU1IUo9wSzUYaawxQqt3J4oSrzGMRNuuAqDJMcaEpAzaWJ7OgGvwDnOut3rZBO88oDicevWEcg
	AKhAOKgcYBlR8Ev+s+PP7myxM8ZTSgKvw74GOoXS9IGvTeK7pGrQ==
X-Received: by 2002:a05:6102:5e91:b0:784:b882:9567 with SMTP id ada2fe7eead31-78a4a9d9306mr7941864137.6.1788725826886;
        Sun, 06 Sep 2026 13:17:06 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478bb21esm5787085137.1.2026.09.06.13.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:17:06 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:17:02 -0300
Message-Id: <DL8IDULL3UOW.1ASCQ859X5KV9@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/10] iio: adc: ti-ads1262: support per-channel
 sampling frequency
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
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
 <20260830032237.6c143d59@jic23-huawei>
In-Reply-To: <20260830032237.6c143d59@jic23-huawei>

On Sat Aug 29, 2026 at 11:22 PM -03, Jonathan Cameron wrote:
> On Fri, 28 Aug 2026 01:38:19 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add per-channel sampling frequency support. The "available" attribute is
>> assigned per-channel too, in order to eventually support per-filter
>> availability.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
>>  struct ads1262 {
>>  	struct spi_device *spi;
>>  	struct regmap *regmap;
>>  	struct gpio_desc *start_gpiod;
>> +	size_t num_channels;
>> +	struct ads1262_channel *channels;
>
> __counted_by_ptr() usable here?

I didn't know about that tag :o I'll use it.

>
>>  	/* protects concurrent SPI transfers */
>>  	struct mutex xfer_lock;
>>  	/* protects channel state */
>> @@ -185,6 +195,8 @@ struct ads1262 {

--=20
Thanks,
 ~ Kurt

