Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E83E9F93
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653386; cv=none; b=AeKuo0aSMdTNWO+cHLl5dz7Wk3wxfnbO1Mb/rpx8+akuC+hccO4dW48Ku8WuM+c3n2hMNHladfaV+b+ftd+OE8R7Ib9Il2poqT7LfV2P5jBF5DquywBfzvXCol6oLzsVpaLrw6YNzh96cvPkqJ/SwQ0kYzmEOLWaBid/xTWx8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653386; c=relaxed/simple;
	bh=5x+8HPjpXqhgvYAk50e7uP9DNSJ3/TXNvQ39Lw8wTOA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOhxVaTiRNPolWRns4LmDu7COeKwj0cNZ7a7O+pkqYLj4tHYoYAPaK+sZiuMsN1EMn2y1bXtUV6xVQWSMsr/05PHWifi1FdCTgUEf/5SDLrYeCwPCxuztuM5GfTp/Hegtqzav43IweGZMjwJ/inRHoNihii6Qum/8wYZa0bP5Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpjovjF1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpjovjF1"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c197e7e4e94so800613266b.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787653383; x=1788258183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4eJ3nmbGLFNyyQbwsnCHRPDBdQQucCu/IaTUqHFSaw=;
        b=BpjovjF1Xth5CIN/kg9NWMefP342vj56Wmri29jTjypi3oN9gohT2xRfn0jmxvnvwG
         3YWSt+B6dBGZrKcxdAzbV+GdxHTVww59xm4vVqUodQNwHmmZfRNrNxr3rMJw1qQOgvKX
         4eD2MMS7aXeE0C86gxlRl7qnXiIscgN3U9CR8FvwPwLPuC3qg/T/8yQD6P/3MAujZRRY
         F1o1KzbbVmNN1y+hRyClVRq3t6OG+QKkGbQuWC4afWRtCs2IuD1Lw/CBeDZ/JKVTGOuK
         bsZzQdNC614HUST1LLsycYOrFDfXKZnXF6NF2Fd1pz/XnXSe4xdDTnNfAoHJrRFXTEzI
         54vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653383; x=1788258183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4eJ3nmbGLFNyyQbwsnCHRPDBdQQucCu/IaTUqHFSaw=;
        b=DMmHOkiFcdkZThyRQrAy5vNnNVwxj+xvlkHzj+YaOV3vzh5H2L7e/TDEj4nhVhY3a9
         O+MVLHCy20Xqw31N90veMP5vevPd/VgXwYX2cr2XigzBm9A5RGNUU0MFr9YHY4g3krcb
         emQ+7uH5P4DlICdhPbmObnv0vz/jx6I2UdcUrDnagmFSjl8SKmj/gpfjcuEqDZJx/0cf
         4T9v7fj5yTcV5U9cznbFf5hz6WzBPFIAXxYcQLoqyhZ29n79LpryjC2uPTROAO6Vc/hd
         lrvrafQ0p/4btnvytbL7umzJKDPCoU8z4qLTCzIRRlHx4/JhxWga3+io7GqAj8YI8eVo
         j2JQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJSSHkKvfWyZeB7JOXpXrtbCdBqaz3vpFkV4KWD1KTRan+IZyboFd1c5p8f0+BaoZyLHftweLYS8zN@vger.kernel.org
X-Gm-Message-State: AFuF++liNIK6hueKCYw3aHIRuda214hG1cKbzZAlMm6xVYyfC3DyZ0GP
	JLhW6hoG+/yze+SA99cK9rduFy8bzC/iM191m3IHcOmfiQbuCxVlvGc5
X-Gm-Gg: AR+sD13vnpW4x1ENF1IuafQrRIlX6R73RvMpEce+Kwhz+O0zj9gJ70aDMjAFPqyjRtU
	jDyWDJhqZTv9CIKscakYGXmz3bdlskdyDe47z+rQCSPzZOHUwZAapquMo0oGqfO+FkWx8n6dQQL
	HumcwM833ULL6Ivp7tb8aQhjWv4P3ZHtPMOflzuArV5DInEJgD8XCfVCPH5MTQ1znaaHAmlxFds
	n+7BsrWUV3UgSzpq8Rs3AeqorHGDcWppoWF1nA0S/nnLg0Set+UXpQTHQga9UG9wTINXVNKAFYv
	fBHobs0iRwM2phn+f+3Zyfqdh9lX83puBUfplWn9dddEyCdxDGd/S08ZbO9RamwtllYdJwe99y1
	CnO7Wf6UDhG5wjx5/8ih6AoHz15bGNsTYSBPTFqihqUGhIIgjsLC0fPyr6lUj9Ie8CfR6j25BmO
	zjVpCmPwrazLnMpGau4XgD73ZeofHNOdYeU4VVT+ZoG7LSEF570JguDikzdxG7pXVbOWrIDMra+
	+F7xtzU0hD28w/InIR+ww5Zta5I21GuOr063G2zYqvkbSO5Z/PpTtE3jXVarPoCRvbM5gun5TPF
	KuGNaer/UmCBOu857dTRuOTStjTMXvnkfEy0uBaxndDm21ZkKPXmInmxp7NSsK01nk2F7j+0WlU
	+OLkJFVa9J57YMvJTdsSaa5TvUHK3b40Na//VTARMi6nT5JX2BaZ2PoMbwLaCR98UE8UuuIk=
X-Received: by 2002:a17:907:a089:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c24924b8000mr2775291266b.6.1787653383180;
        Tue, 25 Aug 2026 03:23:03 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6b48sm1773503266b.33.2026.08.25.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:23:03 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:23:01 +0200
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
Subject: Re: [PATCH v6 9/9] iio: accel: mma8452: Use proper error code when
 missing device model
Message-ID: <20260825122301.0000531e@gmail.com>
In-Reply-To: <20260825-mma8452-open-drain-v6-9-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-9-9b252804ee80@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 10:27:47 +0200
Esben Haabendal <esben@geanix.com> wrote:

> The device is there, but we don't have data describing how to use it.

A bit of a weird commit message IMO, I'd do

Switch -ENODEV error on i2c_get_match_data() failure to -ENODATA to
satisfy the IIO coding style. (but this is only my opinion).

(We recently had a few conversations about -ENODEV vs. -ENODATA and
while there are a lot of uses of -ENODEV in IIO they should be replaced
with -ENODATA when checking *_get_match_data() results).

> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/accel/mma8452.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 4a1eb196589a..42e3371cdb1d 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1595,7 +1595,7 @@ static int mma8452_probe(struct i2c_client *client)
>  
>  	data->chip_info = i2c_get_match_data(client);
>  	if (!data->chip_info)
> -		return dev_err_probe(dev, -ENODEV, "unknown device model\n");
> +		return dev_err_probe(dev, -ENODATA, "unknown device model\n");
>  
>  	ret = iio_read_mount_matrix(dev, &data->orientation);
>  	if (ret)
> 

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
