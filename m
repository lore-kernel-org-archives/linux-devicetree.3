Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A483D811B
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960090; cv=none; b=Zi3EYlr6KLlZvaSloy1IVnmZ28XrbjIhxdszwD0eFHJ4qkR6AHFzg3dhBvpj5dEo4EoRA4citaeGF0zrbuDfFXnIHHK0NYvp56/dspIuOP6KMPbZrmSsr8e34r+IiBjVbaYoo1QpbYcesThgk45jDgvJAtaDiar19PDY6d5EPD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960090; c=relaxed/simple;
	bh=pDr7mi7egq3Xd+OpGVwwm8oE92ju/KDFzIKYrYbruc8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PNOMO8Ty2bB0AC8ZdK3EEl6ez1AZPAp8dGNgQVrrEzNgkfEBRen1tZTHW4DqtZADUdqBVuWbJEB47ip9gxWbH1lpTy6+Msxgtv3U2FCH97/sSZt2nIJyDWiT+cVEaXyT9fZMZcKuqw2DdjgWlvqEgSZzhqnCY/atV69JJxWk8HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4i8U7+2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4i8U7+2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1852023f8f.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960085; x=1787564885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UOVNQpPLxNG+nZZz+2QurUs28OONGC9prKgB2CFOhCc=;
        b=P4i8U7+2NPZ1UNL4ewPLlTJvRlcdlzKVZ1x7VWtoaI3zoNx1+/inZlbxkIfzhSvnNw
         UgnExDl4k/LVV/wapzvXXQxY2sxtB6JtGhWNjm+m7YgVe74v3GiEYJEKkQenhwjOCHsl
         1UwggBkl3ptZvxV0W089isMhukmnLjNLrmbhSmSlNm3x5XhfbUE/jZtrwrLl7cAdA+i5
         PDh7wELtoouhOk0E7d97npISoGIA3+FgGP1Adn4P+tcDFROZ91PdaQtIj93YvPnhEmz9
         sCXhfoRExzkQEFnumTaf7SY4KQUCux+Jol2lqdkAn1XteXtlP3ZordfxiOR3MyTf2OlW
         X2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960085; x=1787564885;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOVNQpPLxNG+nZZz+2QurUs28OONGC9prKgB2CFOhCc=;
        b=SyoVPn9tRblO6/ypITkc4AnprEW4HmJMRNH0mf0sggQesoXBnYw5eDU+RisHIgCCmS
         tTPNG9TXo7lvGqLZwJudqiFZCD8NutfKaK6tHh+F2vlMMEs5Y4zXDJyhOTsg/7poLZFB
         tp9NDSY+0qdTnd3UtXs1pxPyKxwVw0a/G3KeSNwE1zmP64IH46iLpfaKT8JjUXfofvHc
         3xv3pY1DPDj1wRxNLvEH/2wlFb9BqXX4YYYEa61FEXqpXc91nMBRlyyQsaFVzQB45qs6
         mySvLHUakvGqbw83C84WXMiBOrwGjQ25Kt3MFXgFvKqRg9UrtGs+BuwKFXjLQ40AGNSo
         HDzg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4vWz9q+hZ1EZJKBrPjoFVzhH3Qc6Qkbr13Lvtv093pDMmwWKu+YXuXMdsNKvpcRlnhNJOKXOwt68w@vger.kernel.org
X-Gm-Message-State: AOJu0YzXaXjsCacHG14dVGtDrI+D9PJpfAkAkxOznY+IHxOZKthMQZR5
	mCoYMkMkFcgYmu35OvG8br/AvI6DJstsUTr1PFAynrl/HP/zgWfyr615
X-Gm-Gg: AR+sD10+RPUhCIjldoXpY0CYDPcCNOTCje1LIKHEhRogaiqhnDHSRH9QDZpSzDf/0/P
	a78yH92sKb/rbv64YUPDe4P4WfOSiDTuH9ZcL9JT4+NY6BMz0LLquj9FCc4fDa2scGlGHD0I6se
	6ghZa0aFxYgk32yeq5rN/m+n5vMitHgTXScu4PEeUSOfwvr66OY4KPmVga+ThDudv4h6HoqwgWo
	u+RDHQHteUmLCjqzBYDpLyXCSiPWJlSZkjyqy/NhUHiqb3HcmDFamd+6bKT+T/2QpT3yJysZXL/
	TRbDDZgnD9+hsaBaeugHjSVUKyzQrEnaUGn5BREAiKZ1hr/Ak+FPfyf4eZp6+5z8Aq9yxcriaHh
	U4QgNAHekUDMjrm0vuEuIjF87z0imhN8dVyjaw6/EcjQuHm7f+NNsAI4BrS7UbnZbZ/RJBDVODo
	rtwdXyUeuSzpk5uHBz2p075dNEV07at20yMhy1r75cclLNMK2nH/k+/uhLF4e2gSTPtRNZVlc5Q
	y5IrqjY7LoUiiWi0JK/+n1FRzketatsebdbF6XMaYZsNEiLkaIiQwy+YXlVNfCATzeI1r82yDTK
	/naSraVibaUjMPKa5LBG15Vcf0xikxT0BoLXx4b2OFmtKiKfuOg75Sp6vrowlaqXkhEB1TkpaaG
	ItyezJ7G9c+ZM8vg3UWyBs4LgqekPFK+ZYmBSLm7pZm7V6LNJh1HhqHoMs4mOXfC7EgVT01586q
	l1uFal
X-Received: by 2002:a05:600c:8209:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4998796f497mr392883625e9.13.1786960084649;
        Mon, 17 Aug 2026 02:48:04 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100184sm168855245e9.1.2026.08.17.02.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:48:04 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:48:02 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Henrik Grimler" <henrik.grimler@axis.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: Re: [PATCH v2 3/3] iio: accel: icm42370: Add FIFO buffer
 functionality
Message-ID: <20260817114802.00005872@gmail.com>
In-Reply-To: <20260813-b4-inv_icm42370p-v2-3-11aedfdf76d3@axis.com>
References: <20260813-b4-inv_icm42370p-v2-0-11aedfdf76d3@axis.com>
	<20260813-b4-inv_icm42370p-v2-3-11aedfdf76d3@axis.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 14:26:12 +0200
Kanak Shilledar <kanak.shilledar@axis.com> wrote:

...

> +static int inv_icm42370_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42370_data *data = iio_priv(indio_dev);
> +	struct inv_sensors_timestamp *ts = &data->ts;
> +	struct device *dev = regmap_get_device(data->map);
> +	unsigned int sensor;
> +	unsigned int *watermark;
> +	struct inv_icm42370_conf conf = INV_ICM42370_SENSOR_CONF_INIT;
> +	unsigned int sleep_temp = 0;
> +	unsigned int sleep_sensor = 0;
> +	unsigned int sleep;
> +	int ret;
> +
> +	if (indio_dev == data->indio_accel) {
> +		sensor = INV_ICM42370_SENSOR_ACCEL;
> +		watermark = &data->fifo.watermark.accel;

You don't need this check, since the ICM42370 is an accelerometer only.
(I assume this is still an artifact from the ICM42600 driver you copied
from).

> +	} else {
> +		return -EINVAL;
> +	}
> +


-- 
Kind regards,
Joshua Crofts
