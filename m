Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438E9388866
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 22:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786746581; cv=none; b=Q8OyJhkjKoGaBtVa+hnFxbw84iYWlAOQDvdbvzh8h8N2frOdmvzd08lc7LTI4f/qCjxS6rers7HGbuGi2u8rD5ClA+OXMUE3LUMg+ADrpoH4OirSC0I7QrR8tL0yRwlkN40Kb2KCLHoueW3U3hpIZVvzx4lycGLTaqmUJHRPyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786746581; c=relaxed/simple;
	bh=88xvazfiyDJvxemmT7YiwI4CUasBJNtOlR8LZ2zzVMs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=E7/RQeddCRYNnE82DQAsaG2e37gKYulWJ22O7pi/BDCh4R9/HWqryo1P6hr3sTS9yChhbVymdIbf3ez4GQtjLrtKQ07TU7jmUN6C37h0b0VXLoW7OR4o6wE3meiVXKzxpUxXbJJOBK0urxnJ59wq1lPScZv5OdiBS/wJo3KIOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnhScjQ7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnhScjQ7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso18385445e9.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786746578; x=1787351378; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ikckCEzn9xT1LxvvFLKu0gXourO5git68rDM9mwEXE=;
        b=UnhScjQ7e/aOBY9sRvkhwoH38E1MRve/yogSHJGraBTaENr4NVRghSUwg/ZGweKZm9
         cU18oc8HHhwZ5t4Slx17/XtxZjfERnDvShkbmI6k+/42Uh/K3c9EKtzkPiI8QJjbA+5F
         RscKYU/r/kbO68vT2NFK8NlFDOJGpLkTqRvo/A8z40/zMad6SIbeb1+i6eS+hh8xCWxl
         chJHMviMUlpakYn4URx+Ux7J85lpcw9V+zOzPLWl1aYrU7ujzWeGP52J9mxh40hyA/m9
         qUh+NBmr/KOZqIbBUA4iv5oRdgLoHZXy9gotrkJkmHy53/rkcqCdGMSOe+qPZVybSYz2
         pBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786746578; x=1787351378;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ikckCEzn9xT1LxvvFLKu0gXourO5git68rDM9mwEXE=;
        b=Q1sH2FbsW+lkBwj/H84vTl6SWuUQKC1Lj/9MYYpMucLVkDXKLdOtVmRVokBNGo9l69
         kEPJ1Xfwn68SqrsmImsGkhz6QNeO3CYTi0t4EEMAFoUH1gSXqR5YNdzZs6O4t7w7hpNS
         vhsA+sHSAodUQHPmaKGOvi5DLm4eW26mGfeGhkhD0GqFRaK5rmkOk71IunIbhyn5ItnP
         fKKW59E9qXGq52wV528xS4HWGO7TfmuBN5tNjdk69/8MwBPRmRz2bcNIK8Rorv9WA6Oo
         rfRYkc2GT01Vbc8XbNilAw6c+v9cNP4B9+YRoAatM91BwRoOVz4qIV9ADZOumGWigvKx
         +ItQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr27s3B+jBHMI5AjRNhJBJlzyZ1AbPlT3iudhQnbUTUzUsCr+X9ozUpn3NxuEaRruN+oNXwzlibPIp3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx51v4E1mm/0uT7ypxvx9358bnckGmKz9BIHIbBtoaDYsA+9KQl
	nMCZGXe8d5X3bBclOw7x44TJj7PLeRp7SOupOgC+d4jLuSX/8rgF3znB
X-Gm-Gg: AR+sD13eLZes+K+CByfYDsnZ8hBB9TS0uDDGAeT/+TDHU2QufNBY4P1XbFUjGqhIOxI
	mSr+VYbnqYlB9gs5mpSXelLoUZPXWajHIPToLzTvU7OGNF6HkW1Afx4CgVLyyZ0C8Ccxa/JH3GO
	MQ479F8z1la11RdSefrknyUZmwHsRrPnF1ezWJdOxg9UIAVQ7puOrfnX1bADCAPmXHxU9nzWKEI
	T/ttPSvgq2fanMNi8zAbw4W9+zPtqKyuE1iLqxbABiYWzK64TOUMUPLDJ9MqVDsDEjvavH9mpmP
	Kmzt1IGXZfNUcTw+Q/huLAky5bWw8l9PoDkqbhpDJfv2f0AKqJ6vgndaklsogVC/tJ+iYcda9Fs
	TI4TGb6XWtjyN3IEaxYIBLEQISNTp7a8BFTnIFi+ejZD20Y1cHp9YPSnDqHTCP0HjW8FAeVQPkW
	6AHOSgNtr53zNH7VADLX+G0CZgDxE5AvyM2vNUoEp4gi1UbqU64UPR0D2EB7Nqu+C2fjQBkQz+e
	7TW6ptWGG+Ydw==
X-Received: by 2002:a05:600c:6b72:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-4998795f96bmr102384785e9.11.1786746578439;
        Fri, 14 Aug 2026 15:29:38 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:15e0:4de3:7ab4:f4f1:da62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998bc827f1sm60227755e9.6.2026.08.14.15.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 15:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 00:29:35 +0200
Message-Id: <DKP0ST8HQN0D.3LRPLKSAOR3E7@gmail.com>
Subject: Re: [PATCH v6 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
 <20260812-veml6031x00-v6-4-7eef6e4ce290@gmail.com>
In-Reply-To: <20260812-veml6031x00-v6-4-7eef6e4ce290@gmail.com>

>  static int veml6031x00_probe(struct i2c_client *i2c)
>  {
...
> +	ret =3D devm_add_action_or_reset(dev, veml6031x00_disable_event_action,=
 data);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add event cleanup action\n");
> +		goto err_pm_put;
> +	}
> +

I just realized that this action is added without taking into account if
an interrupt is registered or not. It passes because the function checks
if the events are enabled, but it is unnecessary if there is no
interrupt in the first place. I will move it right after
veml6031x00_setup_irq(), and when at it, I will take the whole IIO
device initialization to a dedicated function to make it more readable.

>  	ret =3D veml6031x00_validate_part_id(data);
>  	if (ret)
>  		goto err_pm_put;
> @@ -693,6 +1212,20 @@ static int veml6031x00_probe(struct i2c_client *i2c=
)
>  	if (ret)
>  		goto err_pm_put;
>
> +	if (i2c->irq) {
> +		iio->channels =3D veml6031x00_channels_irq;
> +		iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels_irq);
> +		ret =3D veml6031x00_setup_irq(i2c, iio);
> +		if (ret)
> +			goto err_pm_put;
> +
> +		iio->info =3D &veml6031x00_info;
> +	} else {
> +		iio->channels =3D veml6031x00_channels;
> +		iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
> +		iio->info =3D &veml6031x00_info_no_irq;
> +	}
> +
>  	pm_runtime_put_autosuspend(dev);
>
>  	ret =3D devm_iio_triggered_buffer_setup(dev, iio,

Best regards,
Javier
