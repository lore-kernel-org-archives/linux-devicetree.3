Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C6501F4A
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794101; cv=none; b=AcGovg+pTgXjmllzNA5/lci3WubfWRqzkkcDbPCb99p3xOrDyl6/J/BkSxYLmFcBErEIT0mej5WcSSe/smnAZRyMo6Ic87w9MIl3T9M9sMXwLuUpry0LTTZSAoV1GcoaU/kPjHraqFIBGjgfAWv9RD7FxKiDsf9wGhzazlGfvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794101; c=relaxed/simple;
	bh=Hj5U5tuhaGLPE9duWI7mE72tBgu7I2rb+4tWpfLknSE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUaDIRQYfYJEm71A5PYtfEE3w6IfKRUAiyfTdMX39VDvLrTTKCF4Qr+1uFAkcuupYxg3WZSXT7ulKDz5lN82+TR39Wy2pJCwXwGqhfL869yxtUldZQHFW+IuY0BAl91KpaYFbX2KtdzQk26mVUQKrEAzRH5RFSam0dsb6URVlaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLzModcE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLzModcE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso35306095e9.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794096; x=1789398896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IS/rYcwgewFHdcgCRoRR2IlNUPHyURUtKmUR1+9WG8=;
        b=FLzModcEYThgaeFWNo/5GicWtGtmSfC5OZw0zbi2rtUUdeG8tM+XolK7ngoXxyPLdq
         uvnrCIrYdDebQoXaWDmmZNbjxedLO8lmfEfHVhGil+nKCbObNaAwjZjKyAdHzPsmdgZL
         sS6ugpMZr3hIEax5R8q+EaEQ7OBZ1IPrgXLAlEZRiIS+5hPlzWfP2KuGcUpbC2CvWqbQ
         b4NFsFsVakNLy1M+w2eksSPz2fJvPXfzk6hYX/hx8RIASmrYB4LQaJDq/rH0toOpD5OY
         BjMuzFQ3LaVYc/TadQQyQgEdC2LEU9zfwV3NPr7+K95F3rtq3qL4Yk/zcl7g6Y9uLz4v
         kQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794096; x=1789398896;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IS/rYcwgewFHdcgCRoRR2IlNUPHyURUtKmUR1+9WG8=;
        b=NMMK0dvykcvZlJhPReuyGLO9z7GwFazaVzsmY4E6FKpSEyOUni36QUUAHPBp0/Oo0o
         EVedmZ9SNZOlMs2flKTat7MOtRjsKHmc4Kos/u0aGQkao8n1ZVpm9RFznc89Cdw6VI2e
         o2s2TmeluEznxzrADM6oOtL8YZ3n95L8nLue/L+LGqq7+CKSaPQseBSp2+DCviHZrsSd
         nf4tFylvh45hNq0MnO5YOlOmZzhUVxDBqnK0rALVGm2PiceTyvIdfbIv21QBhZNfAUc6
         a2dfjJtEHVdgBfjqryp/607JJF+7GDzGH1qN45sAEHKhgjiWL/X8B5v+gvzWY+R9thMB
         k1TA==
X-Forwarded-Encrypted: i=1; AKwUvBwDk+Nq07FBUIlcKTo1pXWjvYl0heQ5R4IAMt/GeVHGzccwjQLZAKzLM5in1sRUCwkA3bfes4Ob9vmI@vger.kernel.org
X-Gm-Message-State: AFuF++k6hLXgILl1lTB1W09aSLHZXqk+IHG2rAOSrj0iiHYLwOciw8mN
	wCWEJcFEntjemytSKvi1Scyk7ePj/Rv2WdjzNzMfVTAVa4tLWRu8/Kd4
X-Gm-Gg: AYBFou3yg6asLjeZyr+iPbM3vGxbrpZZzO+cDJ07Ygq1+e9PZp1Mpt6u0LopENzBbIw
	tmTGDZoyHb86N6FBqtIuNZQT+/Do0Dh+PBqgYcVhRiXBl6jiKpmPd/RjIZE7izghoQg5V5ORJmi
	57LIFSba2pPcWRhbVxgZWdrpvx+wPUWNKNnV+2d9TQ7GDBuymyFgkqJyvEWmyU8sVb+Jvbt3DfK
	yL0igrJM1jUoV2864ynXoMm8wLe2TNxQyr1dAZPk55YtrtgxRYYgmT2h+beDzZxy6zdMvD8lXUK
	FIhLlRxwtHD8fdzcPylATZe+TuJFVRJFQjmC29ryXQY8ALuv0pmS9Rf7LreAX3byAsw5+Z2n/3j
	P/IwlRWOoippRzyORO9tW8h6hWZrqhFIQxK7rIWhobeNFVHM45lulYr7PTQpjOZriWSGUiH+u79
	mRbGa8JoYKNLsaN9FzrCENmBPOKcdgJYqCvROtKBj4DGC2EK+rqQZ5q3JvDmDgUL3ip3oKvccVM
	qQoMSY9U8l0yynD3Hny6zaU+dDvD3WB/hiX3atM0AZikcgsfNWP2dxV86yn/X7E3N1OdICd/Ixk
	SDgbJkeVqm9Pt8j7tTx63Y/PwewWuzTKep6a2PGLapDFIywsE//9/ayILMjELfnF8DpE301bk8a
	mGd4enXjMxQISSKZUG5A6Q6KOvQ+aDaq4Ccq4oc+DDTDuJXCGYaBRpzNTmwhlmvzJTEal4F7yeI
	uvIoLO
X-Received: by 2002:a05:600c:3f08:b0:49c:fa20:cc04 with SMTP id 5b1f17b1804b1-49cfa20cd10mr194873055e9.27.1788794095682;
        Mon, 07 Sep 2026 08:14:55 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm550897855e9.1.2026.09.07.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:14:55 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:14:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, Christoph Muellner
 <christoph.muellner@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 6/9] iio: accel: mma8452: Add comment block for
 struct mma8452_data
Message-ID: <20260907171452.00004fc8@gmail.com>
In-Reply-To: <20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 16:51:01 +0200
Esben Haabendal <esben@geanix.com> wrote:

> The struct mma8452_data is central for this driver, and it makes sense to
> have a description of the fields in it to make it easier to work with the
> driver.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/accel/mma8452.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index c6af68d2a297..2c1b97b77bc1 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -104,6 +104,22 @@
>  
>  #define MMA8452_AUTO_SUSPEND_DELAY_MS		2000
>  
> +/**
> + * struct mma8452_data - IIO device private data structure
> + * @client:			the I2C client object
> + * @lock:			mutex for synchronziation of register
> + *				read-modify-write and holding chip in STANDBY
> + *				mode while writing to registers

Perhaps add the word sequences after read-modify-write (that
could be a personal preference though)?

> + * @orientation:		mounting matrix, flipped axis etc

Missing period in etc., but that's a small enough nit :)

> + * @chip_info:			chip specific data
> + * @vdd_reg:			reference to VDD regulator
> + * @vddio_reg:			reference to VDDIO regulator
> + * @buffer:			triggered buffer
> + * @sleep_val:			time in ms to sleep while waiting for drdy
> + * @ctrl_reg1:			CTRL_REG1 register shadow value
> + * @data_cfg:			DATA_CFG register shadow value
> + * @open_drain:			true for irq pin in open-drain mode
> + */
>  struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;
> 

Either way, with those added in a new version or fixed up
by Jonathan,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
