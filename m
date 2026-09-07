Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B34F797B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793829; cv=none; b=HkmPjqkJowSAPUoWPNRdcciKlwwCwvrw7T28lBtSZSpXeS+QILZfYgZEk8i6gK/bjLkp3c/2VIzRZkHO6VFWJOkuG8VZNz4gszZHdbFd/C8hR6HN+64lNJ82lezL46AWYotkMxGZy7eWrZC+UTK+hQ7fQ+U0lqKNTT3x0tFVEYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793829; c=relaxed/simple;
	bh=9oy5qButklff8GfbM0z4UX0XLV0AKreE357ixiVYz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLhAh+r+b06oHtmA1trgJCSJ/xYJM7G909fd9R6ZAH+rZdFqWf0yAaXWaSjlkR+iyrFgxkBTHb8t6oncnQRupUvf0TU97usMhKHPxLFHNgTUJM5J2Lv52SkoWIGocCbLiX/czupU+qkbXvrXmOoovpIhTj/3bs5At+mmUgxbv0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSEl4jDi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSEl4jDi"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2352563f8f.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793825; x=1789398625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMzNA5pqITvRuO+ddPK9SULMMrrO+6pkpf8K1+l6RNg=;
        b=qSEl4jDiK/u0HPAvp6tWHHHl8bZKP4M/Tt4AGAAqjjy9xs03mHyY9PugHq4E/HkT/t
         l1O3xY5u2i0cvbm+WybdwgySnZDI1pdXULVToavF4s7j5FmtTVrnfCuGmVCjixZXLgdi
         1CnMCquH47FC8EK3ltzIZdBRpaDVjbBYZ3MniSTWR4ngErUKzMw28J1SzlIcYa1C/2Ev
         svsJAuk4LDrHbt0W81Jy0cQm0nREWEhnRus42R/KLI8KBJPiR0Yeo5W3dAvrIOJr0zFV
         8i+mHjKTHiNY+vq+iFYaP1GSUuoAh8YoBi3FAK4/g6VF1+awvc/fKrLf1rlrBmkpO5T3
         j+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793825; x=1789398625;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMzNA5pqITvRuO+ddPK9SULMMrrO+6pkpf8K1+l6RNg=;
        b=sy1FUO3Z6ktoqlTtGctRJSKeo/qTc8WxeJUP9cgeWbzgARH9oDZQjI3OKM1luIh6Vp
         eWZEZpoiIslHl45c9Z1TjjN6Gfajmp5AcGxhYf+alO5MbRXoEE8U3R7SfYJlZIWdpDCa
         ecH82kmUvUKhauoVPSLp6PWd7TEJ01WBEpbL7Lt+rvsyG1hchOWGZtPSPzx/z+0kDZ3b
         gCbAZnykgkBV1YQFG6WSiAzTV655W0g0h5eihzMXHHSNVqpD2S2Tp9sl3N6bAKqffIh/
         mcYUfxVp19gsYtEIa2P2MH+i6XmMzdUll8wEwqfZztIG5ZtHZ+ya7aWD8oG0V9pnqI35
         +2qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjxd7dVBosvs6sm1N109HObTSC3n1WZMRwOfLGZ6zqiINZe3vMC/osXsHmmo1BKbdI6PoZf4PVwWjD@vger.kernel.org
X-Gm-Message-State: AFuF++nUU9IjN4tEFagv6Od5rTdLchEnbSpydUvo9VfxgG7biToHS83X
	4kyXqJyKpJux9yiKeys2EM+Za4+v7FmfAoB2y8U6Dx419P5e9xjcFZ/w
X-Gm-Gg: AYBFou0IkW9sO8T0Pt1PXBrVDMV7UxZdf+orsVQ7qOv/vrxNWjMphCAm9/cg2A9F0z4
	wXr/SgmM9zyT/3hXiq7syn5lnta53JFXxmyoUip1y2o27M5icuco98MVffOubQjm8KCYghKpRNm
	E/qnSBEAK6v7GfmvyExVazT3q1cHO/8x9294KUQUG7YCakuL3+OAYqcg/732HgTemRIlI+QBZvt
	BMX5+9vQS1nSiyZenGcJTPjHacwyPfWG2EB4Q1zpTuOuY2BCJ/KiUw/OJJvtRBlZcv1sIdq4feJ
	s26mdKvP92NF3CzO/Qc2N5lVCgK5A5Y0+30/dNxDJsUSDCR86Qb5SLqvzuAxUvO/SGKbkgeFMlj
	L3P9ukdlyNilBlbSF8HNtu2GhjYIAK3qBkBzFnDbRGVbMyjcrZTJNrtQDR3JAOEAtA50xgM66yz
	iWMizexi6wPUQzvCaZScnMcDv3CnxgerT6uLderag/DgbDHyUVkXZXFNnlY7OqRQCjgceWXhop1
	WZgC6vC0ggF12g6bVQ4DY5+kJUNJ1HoOgnA8cXCdWhBX3gn9lExrIOPFvoTiRg6MV6+ceesrJnQ
	cmQJBMLlxAYvNiiOIXTvtIM+TOY4fxQY6AOe+P9aM7HaIFXd6GhMiOht4U0U9SDdsmNwSmI7G23
	+p4UA90CO21aauXVFqs7kfdvLlA1jwWlZysGCopY90UkgHT5TYSBjxxI/0wl/gng5O2Watg==
X-Received: by 2002:a05:6000:2dc4:b0:485:8a47:5b8d with SMTP id ffacd0b85a97d-4858ddea668mr18452129f8f.42.1788793824528;
        Mon, 07 Sep 2026 08:10:24 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm17177278f8f.0.2026.09.07.08.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:10:24 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:10:22 +0200
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
Subject: Re: [PATCH v8 9/9] iio: accel: mma8452: Support interrupt sharing
Message-ID: <20260907171022.00007100@gmail.com>
In-Reply-To: <20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 16:51:04 +0200
Esben Haabendal <esben@geanix.com> wrote:

> Adding support for sharing interrupt line with other device requires the
> interrupt handler to handle runtime PM suspension properly, ignoring the
> irq if the device is suspended (maybe even off). And while at it, we use
> the PM reference to ensure we do not get suspended while processing an irq.
> 
> In order to prevent the chip from raising irq while suspended (that is when
> using fixed regulator, where suspend just means setting the device in
> STANDBY mode), we disable all interrupt sources by clearing CTRL_REG4, and
> then restores the value again when resuming.
> 
> With that in place, it is safe to add the IRQF_SHARED flag.
> 
> Keep in mind that the device by default is using push-pull for the irq pin,
> which might require additional hardware design to allow interrupt sharing.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

...

> @@ -1784,29 +1796,62 @@ static void mma8452_remove(struct i2c_client *client)
>  #ifdef CONFIG_PM
>  static int mma8452_runtime_suspend(struct device *dev)
>  {
> -	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct iio_dev *indio_dev = i2c_get_clientdata(client);
>  	struct mma8452_data *data = iio_priv(indio_dev);
>  	int ret;
>  
> -	scoped_guard(mutex, &data->lock)
> -		ret = mma8452_standby(data);
> +	guard(mutex)(&data->lock);
> +

Hmm, this patch might benefit from breaking it into multiple patches
(the change from scoped_guard to guard, the local pointers etc. along
the fact that these aren't mentioned in the commit message), but
that's up to Jonathan.


-- 
Kind regards,
Joshua Crofts
