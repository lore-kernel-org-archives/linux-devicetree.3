Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828703F4DCA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653030; cv=none; b=gstQ3xA3MH/nwZ0KOSx/uMhYb3edRv5dw6lKcWC4iJrtlKaeEhxhTe6VEgfv13/b5AW3oxkSg4wGp82QKbTUcULl2jfbhnvjXes5eDsXi4Uo9+/aYFbeVLCRJfUXRlnxqA33MtPOG2B7jgq9PH7Rr8DZDyKmkZdWDhRBim63m7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653030; c=relaxed/simple;
	bh=DylEgGTC2ZmoMOn5+eHkLb886mOOmT3l5cOVBuayCvE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kR1w4l54qwUVjEgHG4tCJNBYU4SYd6dek4cRrkQGRlS7y2vi6UanzM1AppXo1KZJlrNRFqfDJgE1eE0CmGsg7+HCMFX1i89NlEQ/4WTJd4we/ygMYAHbZCk3L9Ia5cu1YdgdCJ+ZXWWP7ZmCLjxvg1SwLQ13s4m6p8GtN2MtLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvPNPMDE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvPNPMDE"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2074710751so826686666b.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787653027; x=1788257827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=obDo/k9wFAw+PAwhVDyJ3UlS7CKTwOSt/1gZeRxnOT8=;
        b=SvPNPMDEE+ar8U0t8nKtrM3A62+j/e3qTTxmYSa64ZvQcJ46/07oK23/n+lEnAGqbl
         Gu8ABt12kfk9NB9IVFXjV4wP+JNW4taog45HDFyVWTqXH02I97RAK2zN7+SOuDA3asIx
         4FG4RZgTaNJzW/QZwmdUiPNqNiOhSwM97IN6wHfqlhlJPDiA4BCw3vuV0bayprC/qUCI
         mIa182fukrKo7u4o0y+IFpG3dzD1nQ5TPu+LpDQeFMCsNamrdkR//q5bdx1AAUJe1r+l
         UxQ1apBtMaVv9OP+8AqgR1ZTwL32KWvwr9rPzCJRyV0rjtBufMDp8tCTv1YfMcAFxBAW
         s9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653027; x=1788257827;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obDo/k9wFAw+PAwhVDyJ3UlS7CKTwOSt/1gZeRxnOT8=;
        b=NqqkUR1MQtvawL2JqdOTpDKVZuuduk6ZRFB1u9PC3dWJiRi0Nbvysy5oWBY+RIfcC1
         I87tJItHo9aggx5P8hBsuJ78TJ6TNjmuboxdl4vMkKP8LtBj0S44X7sc6dVsvherbBHU
         2MdHk+52a29uATGn8yVk/Xd1TklomFdVWxvHO7l/HodcTiyQBOy0usYiTIic46GeoU+L
         PaZ1B/qH5rqTG3ULmdnEKidFPJ8bpYaF4AjqSAa2PZgUXXX7fLdqiqYfRcXCoZHKjiLf
         KZYx4XXHXcDZD1jQ47Q2oPzHjxlfVgyt/q4iapVmprkRRbpLQkg1XfBBYC7EhO5zbDz/
         pd0A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3ryg69hGQGfnQlSOUi8Ioy7QEb9sN5eYZEhLNw1sw3GUSQOtBv8SDNQCC658mVJd7c2UJFfYXOTL2@vger.kernel.org
X-Gm-Message-State: AFuF++k/OXXw6goLQUgG+ci57TC7g9X6myPYWasBCSCmilPd0FqYTpWl
	6yaUTYR47B81Jub/ktiGALJyXhfsRDduobMHKevbARJiZUUQsA7A76Ag
X-Gm-Gg: AR+sD11mbq/faX6X7Wg5GgIusmI7Z+7Y4JnlxqAA/P8XtXXEy6EZDSttk0bT/AXdzZD
	19dV+VEibzEJHhCq8ShyknphWZU3kvmQunjU2RLZaf5Zo5wXQ4fUeLZRv5rT/vFfB+pdlSgII94
	oqLayIOwfz+yyl03S8QJJ150a82dl6pRbaxMzM/lBM9soA5hbPAcseVi7ilmrPITTsWkRPynBpM
	/frC+I/TfuIZbl+RQdAAgEmCsSILdBfSaTjZog+3OiA07cblQKwtaZI5h5+kb4MAvIE4mZy3jdx
	SpauslRcQTsZWIQTCkvZYnYkD1L6RjLWhPTsd74ppfwIgRRJjT2QJW/I2sFBAkyRXldm9jjQtah
	zX/kKtozLsrN0vyUGTTgBfr7ghulXM9AZCP8N2GPzlQMPERWMtxjvvNApWciAsUnAWFpLRqOt98
	8i/pEoFGyaLHw/Ervy+sRZzMXGsIc7jH7X+UOjx2cXTtw1Spu721UYi/w9aJpNtUNt/IUxV12uK
	oVy519tqJPC9jCDob+7mIxWDUwulPBWiI1eOvtMCLjdSYHC5HXua8vcMhybj70f11bOr/MpNBJM
	NWF4ro7vZ6qTfIccsviNwiqYZH9d/ev7KC5FqYdbkq6sDpKciP9B+po23lpRFoRe7yJbb/Ezim/
	j+HHsqFaEd1IplKqKSCLDRK5f0EYJ44b95XETNogvRYIl8IMmayELL7LFt1pGQMJt+QJU2g==
X-Received: by 2002:a17:907:1983:b0:c16:66dc:3ab7 with SMTP id a640c23a62f3a-c2491ccca9emr2777700466b.10.1787653026209;
        Tue, 25 Aug 2026 03:17:06 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966fa8aasm1800093566b.34.2026.08.25.03.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:17:06 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:17:04 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, Christoph Muellner
 <christoph.muellner@theobroma-systems.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/9] iio: accel: mma8452: Drop unneeded lock acquire
 on read
Message-ID: <20260825121704.00004ed3@gmail.com>
In-Reply-To: <20260825-mma8452-open-drain-v6-7-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-7-9b252804ee80@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 10:27:45 +0200
Esben Haabendal <esben@geanix.com> wrote:

> There is no need to acquire data->lock when calling mma8452_read(), and
> dropping that makes it less likely to end up in an AB-BA deadlock
> situation.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/accel/mma8452.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 7ef1a9a91c31..9ae2c3e60576 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -504,9 +504,7 @@ static int mma8452_read_raw(struct iio_dev *indio_dev,
>  		if (!iio_device_claim_direct(indio_dev))
>  			return -EBUSY;
>  
> -		mutex_lock(&data->lock);
>  		ret = mma8452_read(data, buffer);
> -		mutex_unlock(&data->lock);
>  		iio_device_release_direct(indio_dev);
>  		if (ret < 0)
>  			return ret;
> 

Sashiko has something to say and I tend to agree at the moment:

Could removing this lock expose mma8452_read() to race conditions with PM
auto-suspend and event configuration?

mma8452_read() can be interrupted by the PM auto-suspend worker, which puts
the device in STANDBY and disables regulators while mma8452_drdy() is actively
polling over I2C. This can lead to I/O timeouts or errors.

Additionally, concurrent sysfs writes to event configurations invoke
mma8452_change_config(), which puts the hardware into STANDBY to modify
registers. The Standby transition flushes the hardware FIFO. If this occurs
between the mma8452_drdy() check and the i2c_smbus_read_i2c_block_data() in
mma8452_read(), the block read will fetch flushed or stale data.


-- 
Kind regards,
Joshua Crofts
