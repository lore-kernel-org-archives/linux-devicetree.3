Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7A420482
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120901; cv=none; b=itXhVHncCOSfU6T9eK/ZXdHxpqerzv1MNSWMFPCkXmDEexiGT5zmFPIPk+aL31YcARDsjKKn3g1iEmGwZ6yLm5hzYZPpdSg/yV1egMjDosdSpyY/VjmPxRy+E7+0D54TPB+2dAONdBQ4Gx0tYZ3Fzqo20ogxz69lPOQYl0XfylM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120901; c=relaxed/simple;
	bh=q7OLCL7VgoNJ870EwkW5fFPMIBWQZC0+C92RMBAqFds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liXTyGUdwF4gukFn5FCqXt+th53IrdAOe1JVoNzF4HSj/Wsj2dDPy7AYSpzCKEWjQu+lzWSjaLz/gcGoXMTIvfyO12c7bMejoxkigqcchqodhWjNMLwsdUTjxx90CLjEnKUwyb7i19kZJvsKJ0QI9+mgQA5glLqv9efgkq1QiPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXzGsfw0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXzGsfw0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47df6a5202bso3487449f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784120898; x=1784725698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UfonUu9ln9gTilLrABAupaUf7sQqFWMryYTmRFohNbc=;
        b=JXzGsfw0hYKTM3PjU+vY/5iJNETA1kJwQEClzuquNmBNkoqGZVldJNSBwgTIlpfw6Q
         M0EuO2POJrj6taJ47TEoKuSk49xc5L++UcEfX/2htq3Oe7vI5RghSMYoaNjj5Gil3Dc3
         X0HC73R9/foXxZ2L/UkuYYmAl9uihPH/jEOkH46Qlv8kECyCKvtH95ghjI/LfmlkdbSe
         Ijsz942c605Lv7UAOIfv5SMrZbaQen7FRLZ/gZcEmB5zEo5pRCIeGQ1WzAkA1PMceGw1
         5Kd/qkLYxM08Wr5ixCPfXtfhiJsvN2TnHtH2zPY6NymnTwLXPv5UvJgiHxbdEUWEWTvz
         tVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120898; x=1784725698;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfonUu9ln9gTilLrABAupaUf7sQqFWMryYTmRFohNbc=;
        b=RfrOqBqyIpIl9u0NWCQPx+YxOGj3rYUZQvNwumeH0PVHFgxTntWgPYLk5xHI0NYh4u
         LG+jr1zEugvI3f6oOLHtJd3B6ijAILatPLAfz3xU2qiHynu7Y8lPs8FhZ7GvEIn0rOjK
         g0hbBDkCnmupbs2mJrWEOwxbcbxnQSspWEKqXZXhMiwn8QJ6EbHj9IZEI/4MWyycPJdL
         au/k4B83q2gUU9lLs5JoMWDAKxKQFPZZpPOYhCe1S9kvHZY3ah4MqNOhi960GICwAxH1
         lPKPMNYjb3XHGv636JfgrIkhLxnJFtHuy6kyxCUwluE4fpJz0BwX7AN1D5+jCnuDlOUa
         2t4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrDj0so1qqDSjrsf+8j5vN5eQpcTWRZzbltX0N4i0eSHzVy4HmzsniXPtDFiCxD2pbZ6oQQHAdx6Hce@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdAlwuPO/GS6Mjz8k7yjNly/TRHZMdn0DKTchJ0YCpb16s543
	Y7RA87jdXXsHPtNAi253/XtxWw4ZeQIct904m10lgICiAnWCLHnsJib0
X-Gm-Gg: AfdE7clVDbYpHB07RkL+RD5PQ20vow5e174fl7h8GrdXmEF196mZQ401PMcOyTPjE54
	er2uAoXUnXym562XbE4BnflgKDBKSwy6nhnSltmZrYKOI9zDv6Atsqor2nmLhrSYjWXNqjipB12
	+La9/S8iOkZ7UVLoEvNkyhSL/DyQpCA+gq0MR2/HveOo739Lj/IFGPNv9T8lhlciJz0jUNKPoOy
	5imovA3Bct4t+AXzdP+3Q1jY4WKIfzqLOHjB1smwwE3HcEu54B1x5Nm82lS6/nnarliJ0zTMuCS
	/jdUWRozBOocCxi/BeYYcDzDaFE4hRLRLdGZFZScivRX8tpX2uEwUltUdgJ/Q06J6UonMQsTE5m
	cx8yIvf/gVGEyjFgII6M7hkasBgfUL7RFSb64qeTRm0/QJcpmrFhgIXTY9RCtMdyj6ZNwAmYoNv
	uH9icPXS1cilwqELy26dKsFzz4qv7SN7EJIA8hrViLGhyjCeeeA9QL6CxUPoWgMqAldg4F8NR6B
	BunDL7yEc4e/8MHL9+flQR+QifHHzsVcMWfPNfjbp77gPBB02R81QrlcBQUxaiY21RWzudpInXe
	mKSEdbYE8GpOMF3UUyz0ZszEP1KbmCP4mYoRhUwruwlY/YgRucIB+It6AheJnIlQHHPBXuatIkg
	ezKA4ptB3VZRyQHZgch6rDp0xL94ihQ+OxQ==
X-Received: by 2002:a05:6000:1841:b0:47f:4e42:6f1 with SMTP id ffacd0b85a97d-47f4fceef3amr3279570f8f.41.1784120898478;
        Wed, 15 Jul 2026 06:08:18 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e0e4sm17579561f8f.4.2026.07.15.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:08:18 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:08:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: accel: mma8452: Optimize struct mm8452_data
 member orders
Message-ID: <20260715150816.00007d7f@gmail.com>
In-Reply-To: <20260715-mma8452-open-drain-v2-3-95be9f5f4795@geanix.com>
References: <20260715-mma8452-open-drain-v2-0-95be9f5f4795@geanix.com>
	<20260715-mma8452-open-drain-v2-3-95be9f5f4795@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 14:33:29 +0200
Esben Haabendal <esben@geanix.com> wrote:

> Reorder struct mma8452_data members to avoid holes.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/accel/mma8452.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index fdf7364d7fed..537263085215 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -108,11 +108,7 @@ struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;
>  	struct iio_mount_matrix orientation;
> -	u8 ctrl_reg1;
> -	u8 data_cfg;
> -	bool open_drain;
>  	const struct mma_chip_info *chip_info;
> -	int sleep_val;
>  	struct regulator *vdd_reg;
>  	struct regulator *vddio_reg;
>  
> @@ -121,6 +117,11 @@ struct mma8452_data {
>  		__be16 channels[3];
>  		aligned_s64 ts;
>  	} buffer;
> +
> +	int sleep_val;
> +	u8 ctrl_reg1;
> +	u8 data_cfg;
> +	bool open_drain;
>  };

Also quick thing, in order to prevent too much cruft, could you
please move this patch before patch 2? You introduce the bool in
2 and then move it to the end in 3, better for you to reorder it
first and add the bool after, otherwise you get these "ping-pong"
style changes (Andy's words). My reviewed-by still stands either way,
so feel free to add it once reordered.

-- 
Kind regards

CJD
