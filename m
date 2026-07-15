Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EBD332EA0
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120395; cv=none; b=mY3UobyTXrBohTUrARpymBf2yNwegn63KogHV35IqMJDJeDcJZ0dXz7txhZhfO6VgbCcPxCgsBS/zlO28Xi2cvMQ+cp0sQhAE2tAsDtlK9szYEjIPFyoS7omwFn6wdMFuhuqvU9uXfcVOadjO8LBE3rauL8TzZFZhnj026U7Y9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120395; c=relaxed/simple;
	bh=nVcKHyPKz/W/FvJITsfshyPhXDm4WJXd509Pb5vj2ug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CgnnN/eLEk7Sw9ctKwyT/vIxt4cq9yCNebEa2HwxEcYTNRweTTsW6oWXe0zGLDvH1wL0sJnWPaCRQXmin7gZTVf194iRHmhQbgT24wnhv6dYS3LFFE8xYBUv+OWjaW+K9TQJuarzVwcH6FgVIe5sMsy3npB7xD/vlMptbuh61BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHzw17oB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHzw17oB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso38343085e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784120387; x=1784725187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXmSB/fZgpo1wJ9NHr1MARO2u1xBe0vIjZpMWVhRSx8=;
        b=UHzw17oBf+ApTp76TDefHfJ7TITrucW7MPXpUKVWDiXxtDURbhx0nj+umZKd+fZJE+
         AdKHr8ZaVkvwkfmr8IuKHtFDaNYP0gS5G9U/pEFwOKspMWavpnhvP9BDhL+lz0fw2KMP
         z9qxY89xyZAh4QY56A1Um/brXtBM6K7LA8R+BdAINXQzlrR3y3XORRou6BapS0F1HRjO
         5p3kSA59uBylieexkJGbIMs6ldC6Z7TcWzzxTZrrCzYK+W+Xia/R0HO4CM9yx4Bd+hy2
         1DbAbkM9rDBOk4KjNQt3f1dpszBfZVptDwg9Zxw5nj3DqYdwKxVZcWmjFDHd7GKJKMUs
         /M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120387; x=1784725187;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXmSB/fZgpo1wJ9NHr1MARO2u1xBe0vIjZpMWVhRSx8=;
        b=DgNMGPb2emVJwX91p888VS4RJr6VfiEoISXfBRADIPzMLak5TSHvSA5GHCC4EFOeIu
         wrlnxYthvTpZpUxgEx2Vlv+7M8AtqvHpLgub10SwWwGC+86DQ1HpMh2Bwa+YSHOFy2OS
         Cj2W6j5m3CnBoyw8g1jjAXbYjkpj43oZsjPfTX8ym15KGKfl+eR5XHjiBsSAstA1eBZ6
         Ga6Kg80lIEhmp8yLNeVFRjDr93VreGLuWlY7ePXCCDI7cqZxpDoTSVZLGngnzrQLCp7C
         oQVISKuft2IXO20wv8RDK7qqRm0CAN9WCL534Ub8MpeD0EsjkkSD1aATPHo7yhxRTudn
         wXvA==
X-Forwarded-Encrypted: i=1; AHgh+RqwIw3iOaLRi3l9eAtiZEzb6ZInnoQlFNhCvLzQTnclkmD4IEVoA04PT31JQPlp5b0AY1vYfTkBHMOn@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6xIp1b95zhe0JJBNZX2wa8FaYM5x1/QutA0KoxIkivezWzsC
	O8EWDZewMLriKBZcvPQ+lp5Zjuw7GooLw5L+RHpGpLfXo2TxXwAJk0z0
X-Gm-Gg: AfdE7cnNmnW/WovHB3va1VaI9lGIt+B5kWM9QcSJf/8QueUDkbjV73SRXu7APltaiVr
	6USTF6b7eutuebXJn8UjMddhBfyNv9kGYsquh7XjREtlnoM1OrlaAihDJwSMQn4nzXRX8veBVvF
	/xD0D4jszjls7E/XXvm2wDyDG13A12IFAubWR7fSG434OWuCS6zuC06aYhtM2sRecp+znI4HCcj
	g7h2IpEDzAlGaXNal3azz0XJeBP9glX+ORxg5fSwCkSeXgqYOeeQBX9N6Vmxl2Jd9LtWXCBiCIo
	XG+afBr9KWpFPlI3z6mxxZw1gFC6YcStcPU++0JOhg+jvv2X+RqbNP4l+PBIS/O5vVGXjPVN4qU
	R1grVEWUUDGhIBUAfw2ZC+ImP3lxnuhxaJyvnCu5mMa9VSl1ydq8oQsHr93sHuvT8pOtXZcw84B
	yD6eU/ibgFqb6BMAZ8mGxfTVCGn0eisVYXP+bb/4v93jiA6i6FLwbNSaVDjH6SoCD/Ja2BwyaKo
	rx96d4eLttYygQJWS+QkAJ5Gn66Deu4fsRYE0zNSJB9FHlOfjizg+ecy/aB9/9GK8XrQi0SK9xC
	Jfklvk4L++XSW4RzfenZwp3qGc6u9kiAWRF02XlhfGn/oqWPolxmK4hATQ2IB0IRRSs159nSa3w
	wcVRlmOVXMkQDqu2CYd+PJWU=
X-Received: by 2002:a05:600c:34c9:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-4953905c59emr70009845e9.13.1784120386545;
        Wed, 15 Jul 2026 05:59:46 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm157537975e9.14.2026.07.15.05.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:59:46 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:59:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nikita
 Travkin <nikita@trvn.ru>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: light: ltr501: Power down chip if request
 irq fails
Message-ID: <20260715145944.00001de5@gmail.com>
In-Reply-To: <20260715-liteon-ltr329-v2-4-d18af55edab5@geanix.com>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
	<20260715-liteon-ltr329-v2-4-d18af55edab5@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 14:27:26 +0200
Esben Haabendal <esben@geanix.com> wrote:

> In case request irq failed, we were leaving the chip powered instead of

devm_request_threaded_irq(), please mention functions and structs by their
full name to prevent ambiguity.

> powering it down again.

+ a very short explanation of what you did, 1 sentence

> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/light/ltr501.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 379e57ac5f5b..9d4de798e5ab 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -1571,7 +1571,7 @@ static int ltr501_probe(struct i2c_client *client)
>  		if (ret) {
>  			dev_err(&client->dev, "request irq (%d) failed\n",
>  				client->irq);

While you're at it, you can remove the dev_err() call as devm_request_threaded_irq
already calls dev_err_probe on failure, creating duplicate messages.

> -			return ret;
> +			goto powerdown_on_error;
>  		}
>  	} else {
>  		indio_dev->info = data->chip_info->info_no_irq;
> 

-- 
Kind regards

CJD
