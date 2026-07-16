Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1A41F7D7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207115; cv=none; b=Ob2FpBO/Jhaeg8xlnLwTyzrQ1axuV8R1SDJUqchkIsncryY+xn7U0Y9dzJcbnsgEILVjtAgTLXEHMuT5i1RbqHCpt2L5vKudi5z/k2/rijJdOdAyEBw9wxO8bkntA7rqHyOJEOU18ZOzYeYHQm3AmPga9Ak73oA5JyMylJ+QyLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207115; c=relaxed/simple;
	bh=Ph5O7sdd3xwfE3bGAXgs+upkajj44wtizah1gh+lDoM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRdhiO9nI1/jZsqMdG4sLTvgjpOFGrpfMuTsxZNZbJ+BUH5pyii3/YwCBB4hrEvkEO/v3RBin1wDKQyZ8O4holMXW0AboJ60QlXR3KhXnamjJ8YgTG1/CUum2MN9GvCIKb7erkIdkd61A7NYT6Kf3ROYyLcXIIABTkKjjvDPXxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCidRpY5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCidRpY5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so24891245e9.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784207113; x=1784811913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkXEhjWw8RR39Frioop/yuVyZX8tqDl1VlP5PStyz6E=;
        b=QCidRpY5AiaVnAGt/yYU+uDtue9x62zA+cXUGm40lcq9F61JrpLXcF9VtcxXSjo1vv
         qhzNqXq3KxPXAW190NuvTegi2UNDwCCtJhNxaXR+MIPGhgQ2Dm6jnQf8/XGsddWZywtu
         tK0YPLZ7FZ4rSxKp29JCbBRD9afsHb0bt87y01CS27vUiSOUx06fTcDR2IfjGJ/f4yuG
         ljfyls41AveZEoFpkyfrKWFyjxZ8F7vtFj5t9u7WhhJNHJySsiCRelAr6kQBexJhY+dg
         hPA3V4nrXC21Hem5fA8vX1aLOMdNjALlaZAI1QHKCGpxcHKQIvyfKvDj+1OMRUjWvHLL
         wQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784207113; x=1784811913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkXEhjWw8RR39Frioop/yuVyZX8tqDl1VlP5PStyz6E=;
        b=MYynuOzjr4/Ut1CsSaROTtDwHQ3Q8JbvKWGUm4vFwhI9WnTTNo//2X5dJTPdO7kzcm
         EFoBRCxzTURA/tfVsGULj6JUuuNVbtf6RttdoOnYuqdwPqIvLw/zZ2ZyS3GTgoG1DLhi
         9rO/k1FG5iwc+/sK35iKLXlgqjcA/8UcthwzaDDybZn1FpbKk6WIaTGzqj4B4qPvo9a9
         Mxc0MAGlzywNJOMjl8tuLceRBcyw8vLoa7OwJ9vWHpb/t27ImiZopdDOiJCF5CC6aI7W
         mTq/JSQvJB9jJXlKX9jRVjHneLXqDVTLHkO7zFQzVtxYYyEvNP50U0KkrAE8w7dI1Qc9
         ca7A==
X-Forwarded-Encrypted: i=1; AHgh+RpNteJF6zpY5ouG7W1ZRY1EOcM7QrY0X+52VXV2F2QBacSMuG2CnVhlbdcPG1eyHckavkFfXxBtQ3DT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zWpsm5hd3Qnn6jkVVNzU02OeZA+xYAw9IbbKjCcjCRe54tFc
	3OZIpLPO245EuWMWkrYQ7/Im/LFxhOkaUJFUsftpVG7NKOxQ1Xk5KSTG
X-Gm-Gg: AfdE7clQVRSmJjGdJcIJBfwnJ0EnzI0Kem5D8SN4nNXs+DrCN+KfTRk8W9jr5K9pMLQ
	BYMXA3L36bGXAURwFi5o6Bz6vpLZ60AfpecxUyoAP+CV+c39mOrGdu8Xrj6wd7iPhuZ9UVN86wR
	+R/xbvQu6S7kje4nnbilY/YRVADMzFtqJB3IJWbQ8W82xCxEd6uShtYMeRV6STszEm2K5FnxrKq
	LPG9LYpUBxhutG3kZkZz+4WbiqQZLZiCy2DMrIQCf4BQ2NTTkEcNwKHfNpImutk8xGfaU2Fnw1y
	RUvUNSW4HIpbAz1N+UVX5ayTb7jhFIX+yZJZ1sMB9gyZ7f0DWJaVR8S6maB1X05A68ytov7venY
	NPBzUsT+IuqkRdqYEP4tSRdhV+KsNfenvJlD6kQWj1geybMvddWbM0JOxsifJ7d8us6aB9L5950
	m9zYx5NHOZ0CYRbosdJkRzGy3nXD5DU3sxjSySrrizuo777peXYXd7i8OrrOBOVmK0knofX6PNn
	vTwWb5/xDR6TLrK225ZMIw14BLme/6dvlRrwWgZs5/WblFLH+XisgVfiqgPD55nRGyGfkIaqKFw
	cJtd9krfDZtwFgO6Fk788TDsouW8Wr99HXG5+zbT2SkGGyHH4S58X/dmQOw0G6axRjDr9iPY5Nn
	LeNiMsSMM/Wes
X-Received: by 2002:a05:600c:354e:b0:493:e38b:182d with SMTP id 5b1f17b1804b1-493f881800dmr243163685e9.22.1784207112542;
        Thu, 16 Jul 2026 06:05:12 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d22asm57635025e9.1.2026.07.16.06.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:05:12 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:05:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Michael
 Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/8] iio: dac: ad5686: missing NULL check on match
 data
Message-ID: <20260716150509.00002557@gmail.com>
In-Reply-To: <20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
	<20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Jul 2026 13:14:18 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Verify that chip_info pointer is not NULL. If a user binds the driver
> using driver_override via sysfs with a device name not present in the
> id_table or of_match_table, match data will be NULL.
> 
> Fixes: 0eb1728461a1 ("iio: dac: ad5686: drop enum id")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260710113149.53EC51F000E9@smtp.kernel.org/
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/dac/ad5686.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index 713fe71ad1e7..d34250647aa4 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
> @@ -479,6 +479,9 @@ int ad5686_probe(struct device *dev,
>  	struct iio_dev *indio_dev;
>  	int ret, i;
>  
> +	if (!chip_info)
> +		return -ENODEV;
> +
>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
>  	if (indio_dev == NULL)
>  		return  -ENOMEM;
> 

LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
