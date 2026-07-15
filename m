Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3073CF054
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105156; cv=none; b=J5PoNelBJEecG+hXvJlSkenBtD4erWmqa8X9c2dhzBHS9gPPOvCToOSkFVbeQi/c2il8Ax1LXFerpDTH8TIj10BfrYImsHTLud9zHlvdCDWN5cTjPCB4FVrwjtExWk9D2Mp0Xi3LbAkkWCQYbnZZRKGTyMQVhj3qYbpnW9oIOd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105156; c=relaxed/simple;
	bh=eafklUz/Nihxt4G0Y/5YOLYKvHeikJPXuRmnhgcXHh0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8J5o/6DQWjXWy7DuZNo+iXgCUUw91BdczOaAZ7TdFYRaFLzu6yTVyuEyysQSInbzXf3+ubz//++7Tln0xnycOPYJ6cqnymfhI6MefGSxIjFRO6z1a2Ac4MS2PvzaZW9oHEtxWZrl35dnm9mzGYBkC+r1k3rFmxwaOrEyldEPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpepXURs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpepXURs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-474560436c3so1361552f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784105146; x=1784709946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqhbTpyt7Pwu4H6jri5SJXn72wEdVDjqv1xv5v6hVLQ=;
        b=DpepXURsGO+PHl3fwOc6BOyBNiq5HwMl4MxMVuV1BD/3w6eVSxLhzdP3OV6p+Xt13R
         QYzZkD49NDzYzI7PEjwC4C1PiFhabD+XBFk142IYe3Tnzyz2yApBRuJlrvSYtExmVqE8
         RBfw+hoeBZuabjxNJJkk/kqCgS1461NP88RHUcCUbaHmmAaTPmiHEj0KnXEpyHldYgJL
         MeUarCQ2FVhrp7gxxDggMqlNj9HBUMGFSQaQdDYOTK8MA5SGC7j3xwVXpTEvM9sPTUiP
         +GywDoH0zsI+vPsKi7ObK4DcHT8Dwk7Dhz5ioUZUX2ayg68hLXVlWQNYdUTFF3WhgdTz
         YpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105146; x=1784709946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqhbTpyt7Pwu4H6jri5SJXn72wEdVDjqv1xv5v6hVLQ=;
        b=Wd4x1l8IIlkc26FayteV7/c4kj7dS6X05SZ70TMvwhwQyPt6wz92zsrDGQ/RVGE0KC
         yTwxDhJucgWPzY74E5dteJY/Mh5Gl10ewhNs6EpVB0p+qMcXr1dWgY10XBbtyTWOBtPt
         tGswQkODCsSORRkiECrmeyh48Nn9pBKJKD+aMVkMgWf0VOXLSDVgnLnJybx6FvMOQa1X
         KYjNY4+hQR3A23dLO15gcXkbnKW6a2jJ2Cy4DGzUSK4L/k08K5yKNxfUcBjkBQt6QftP
         UfygC11UktJMWeJKkf6rcLM3l9bP21PEMr24Irmch45NjFMCbZGbBIaUi6mKn+4BjvM8
         hcQA==
X-Forwarded-Encrypted: i=1; AHgh+RrxBrJXZbqNBRGTmvRTQIWEUk4E4dbo51YQ0FN+jQLObWfesQJ7qIK2NvJFm2yAbyJW2LnIckgUZChp@vger.kernel.org
X-Gm-Message-State: AOJu0YwKx8wGIwRnLmFQrUrbkRSFQDjvDAnjBmuuLxbdHSadNAfIN+qy
	I2jYwKb1hqCLbF9U220ZMuCgb3T9T9OFeY2TGoszfTieuf5qkTOEF9vE
X-Gm-Gg: AfdE7cl0d0ELCL/acxDfLneGwMu1KW85CN3U1L646bmxwlv44WFa4tI28RjdYp36Amt
	V42LJzbILtlxfsnrLA4Q8PB96dMC+fMp9ZVFXiJvCU2y9H60CrD6Qn6lOR0Mz1svssO3EWCRS7r
	mqGlHAnOIeKuzi5QqxsWj1FLr6be9nBfhPxEx0mIhNe2kftwjWrEWE9blybTLXqMJKA6T5+PqZ+
	/cDxAC6zRodEUUVX5Ag+Uvczz3+A3JW5txLU7YSbdXejGubajbF9q1F/c829E8Fwo8KLfpex7fz
	Zxwgoq1usGPx5s9nmtO5FTRIArK2lP/6N9mbxFqCIz0plC/aU0J2DJEmYSto2sDfv/NaWZu2RIc
	yoV8127tiNloswSsFHJDfiVLj1BBtzS9yv7JoEDiBYe1WuXjNJJoeBq77TfjpnYh9A4WR3nOJjx
	9q70N6aT1bzZeaQtX2vwXsJOyetJ7E/exmys6Eytd10MOygroC3xtQpHq8P9W8YeDXuQJtpmEbW
	RtNdQg++RQTELjEwj4C1nFBsHGCAq+HoJ1vAz84Q7glPucgiraN1tZD48K3TnmsbhLSbtWmQ0Gn
	OklsDlPknUYyiNo3a1+Gut4h7wDhbBvW9Rvcnz7OtXDwVATZ3kWCUNjBqlxvKNoHUOZJnDNe/tX
	gsR1iShu1ha9gmp603jrNFEM=
X-Received: by 2002:a05:6000:25fe:b0:476:d52b:b85 with SMTP id ffacd0b85a97d-47f2dcc0208mr19425011f8f.16.1784105144565;
        Wed, 15 Jul 2026 01:45:44 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a973fsm15495170f8f.17.2026.07.15.01.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:45:44 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:45:42 +0200
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
Subject: Re: [PATCH 2/2] iio: accel: mma8452: Allow open drain interrupt pin
 configuration
Message-ID: <20260715104542.0000433d@gmail.com>
In-Reply-To: <20260715-mma8452-open-drain-v1-2-b1dd2a440c60@geanix.com>
References: <20260715-mma8452-open-drain-v1-0-b1dd2a440c60@geanix.com>
	<20260715-mma8452-open-drain-v1-2-b1dd2a440c60@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 10:07:39 +0200
Esben Haabendal <esben@geanix.com> wrote:

> When sharing interrupt line with other chips, the interrupt pin most
> likely needs to be configured in open-drain mode instead of push-pull.
> If this is needed, you must add drive-open-drain property to the
> device-tree.

Why are you mentioning the device tree in the commit message? Just keep
the first sentence + a short description of what you added/changed/removed.

> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/accel/mma8452.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 7d683686dd9d..a20c02ce0b9c 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -81,6 +81,8 @@
>  #define  MMA8452_CTRL_REG2_RST			BIT(6)
>  #define  MMA8452_CTRL_REG2_MODS_SHIFT		3
>  #define  MMA8452_CTRL_REG2_MODS_MASK		0x1b
> +#define MMA8452_CTRL_REG3			0x2c
> +#define  MMA8452_CTRL_REG3_PP_OD		BIT(0)

I know that the defines are completely incorrectly aligned, but please
ensure that at least all the defines in this block are aligned.

Also, consider sending a patch which aligns all the other defines.

>  #define MMA8452_CTRL_REG4			0x2d
>  #define MMA8452_CTRL_REG5			0x2e
>  #define MMA8452_OFF_X				0x2f
> @@ -108,6 +110,7 @@ struct mma8452_data {
>  	struct iio_mount_matrix orientation;
>  	u8 ctrl_reg1;
>  	u8 data_cfg;
> +	bool open_drain;

Hmm, i checked pahole and it says there is a 1 byte hole, maybe try some more
reordering to pack it?

>  	const struct mma_chip_info *chip_info;
>  	int sleep_val;
>  	struct regulator *vdd_reg;
> @@ -646,6 +649,22 @@ static int mma8452_set_power_mode(struct mma8452_data *data, u8 mode)
>  	return mma8452_change_config(data, MMA8452_CTRL_REG2, reg);
>  }
>  
> +static int mma8452_set_interrupt_pin_mode(struct mma8452_data *data)
> +{
> +	int reg;
> +
> +	reg = i2c_smbus_read_byte_data(data->client, MMA8452_CTRL_REG3);
> +	if (reg < 0)
> +		return reg;
> +
> +	if (data->open_drain)
> +		reg |= MMA8452_CTRL_REG3_PP_OD;
> +	else
> +		reg &= ~MMA8452_CTRL_REG3_PP_OD;
> +
> +	return i2c_smbus_write_byte_data(data->client, MMA8452_CTRL_REG3, reg);
> +}
> +
>  /* returns >0 if in freefall mode, 0 if not or <0 if an error occurred */
>  static int mma8452_freefall_mode_enabled(struct mma8452_data *data)
>  {
> @@ -1666,6 +1685,9 @@ static int mma8452_probe(struct i2c_client *client)
>  			goto disable_regulators;
>  	}
>  
> +	data->open_drain = device_property_read_bool(&client->dev, "drive-open-drain");
> +	mma8452_set_interrupt_pin_mode(data);

You're not checking the return value here.

> +
>  	data->ctrl_reg1 = MMA8452_CTRL_ACTIVE |
>  			  (MMA8452_CTRL_DR_DEFAULT << MMA8452_CTRL_DR_SHIFT);
>  
> @@ -1683,7 +1705,8 @@ static int mma8452_probe(struct i2c_client *client)
>  
>  	if (client->irq) {
>  		ret = request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +					   IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> +					   data->open_drain ? IRQF_SHARED : 0,

Sashiko raises a pretty fun issue: the statement

IRQF_TRIGGER_LOW | IRQF_ONESHOT | data->open_drain ? IRQF_SHARED : 0

is actually evaluated as

(IRQF_TRIGGER_LOW | IRQF_ONESHOT | data->open_drain) ? IRQF_SHARED : 0

Bitwise OR precedes the ternary operator.

You should wrap the data->open_drain ternary in parenthesis.

>  					   client->name, indio_dev);
>  		if (ret)
>  			goto buffer_cleanup;
> @@ -1800,6 +1823,10 @@ static int mma8452_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	ret = mma8452_set_interrupt_pin_mode(data);
> +	if (ret < 0)
> +		goto runtime_resume_failed;

You can just have if (ret), as only 0 is successful.

> +
>  	ret = mma8452_active(data);
>  	if (ret < 0)
>  		goto runtime_resume_failed;
> 



-- 
Kind regards

CJD
