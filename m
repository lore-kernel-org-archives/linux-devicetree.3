Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EF32AAAB
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781470578; cv=none; b=JnZdZRmiImXvRw1GJdbDprvpyiCiDynS7b6SWSELUMDrHhlkjLCJC2t++QzzYcIIzw0uuwYVqrg2WpcwrO4rG+y+MdB9AazEN18MaPRa74JrIc7+J4mOcQnAyQOhgP7JLuHjdaE3yZoBSHa/MNvjlQ327MLBxIAAN7km0Kv2qeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781470578; c=relaxed/simple;
	bh=Bb/rWWWutaDXRMzhs4sxlRByPpYceIR+Cvi4m7nRTYo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=nLP55fEgzmCW5chsevz7EV/3fIil9tnKHLzm1nhsymv3MS/0z5bb3lWjkUE1/N3F13kGtEVshOHumxaqloVXZbQRXa6DxGYwW7NDsYlu0+adOkfJe9oDZFMg5SYXs25XWdZoqD6hgfCTu/DyxnWeIqOaycKjOD8d5dZ3WdlT8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2c/E+5t; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2c/E+5t"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6cfd9f4d6f5so899694137.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781470576; x=1782075376; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrNIi2oRpWcsa/tsl22AWn5wO93Zua5ZZu5VgAo/93I=;
        b=s2c/E+5tb41K9LC7rerrXvAOaOf9DooYNgxJXPhFKPEx5QgvOdnzVHW3/SwCYEHBbD
         cMeUPmUwJ3mJra1Q7JI+i5vYlBqui/tECiHPnaxvEc7QLw43SIiF+27tgABeG2CfVBQ5
         +Xp5h1jRJhE+fe4E23Y0kF9oA0Q+vvNEEQb+Y0+xQfS//SMYVJNkesPvsOX6dwtEM9ts
         oTRT5oBsIOMUcYxJrWglb4QoHzUMbN6sgqZdIdrJQA8V1fe7v/W0Uc+2HtLp3g9LjTxn
         cH6P+j37CqSuX8Ww62r6CLFMByuKxoCSEXzCo92xH32j7pkVbNg7ftwhj2sHtM4WqbpT
         VnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781470576; x=1782075376;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrNIi2oRpWcsa/tsl22AWn5wO93Zua5ZZu5VgAo/93I=;
        b=eLF0Tt28E9ImU1Q5xu+mBVA9Te1KsPNx4QztHXlXQQo0IYnPsANiUuTKXojTpta88i
         TZgpYvDJcpe6eX51GOuUafrS7N/tqeCTKtmKIgRrSA+1Pvm/US4Rfr+MfndbzS1GoWM3
         cLzq/Kru8JV994rMJ4ZXLCkYt2sESrGvWfRo8ZjG449EY9czFTbnp5sgANM+66ekzh0o
         LHm46b82CMhFsXCrBdxPCodFl0YgOdc3FWT/zZLJCqTyPV8c77ecCtquXiMi0dA8JJy5
         oYdKvL0XCBw61IyC0gnikINK+6sTXGuQCmCnpNwNuSJC3pNU7JcOcYOgLbg6LEstEWFm
         9HMg==
X-Forwarded-Encrypted: i=1; AFNElJ+r1jFNZczb/O5y/ew5THZIAjVp8Xk41fcrcjDqvTaEUmokFRkvFF8ZgwJQXVQRWQvdPmZ5LFxVHai4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+iKcTqqEKeYkPN/4uljo/2vohDqhu0jhtvW0hn/BJD6UjA/9
	Of1GYKWypNbm7wmQZwruCwoHRq5IdAMNyDbWOEL7Eq6SdGn1in6Clfdx
X-Gm-Gg: Acq92OFxyqdk+dXMRW5CaztDK/DEdPd7ltpHUzXwbukHrdcaOisk1AeU4his/ZCvmYa
	sHoztO7DEOP45vmPbXChJOa8y2reecjb5apBM3AS94bpbbgjJ8VvogGGLQtinMmbc89pKSjclPS
	kIaFegQ3445GP54wQB9CmdnoK7FIJY5W0bOJgZuI8VW5im8sroXVQjd3AooNqvJ3TeVZw+/flKh
	6Ew0xdhWe3zCpA0JcwSaZFTWK9Du54LChgVFZ/IZiY3NAwmEwJX7kxqAqrdGMIjnlUcv33ihqMN
	HhwxMumksTkUio6fWbxN9ezkfnuhFfWTYk2Qi2rkm1jmrvQbab7bOXp5oxnKIpQ+WtmpPMMXBy2
	8GzzN8QI6cDraarkSkX49C91VUoixkiVQ1LZ6SuHq7QkzeqMCHMGOD22SOQldn55XCZjSr/gLZF
	6mmfrItw4dl+ZDYw==
X-Received: by 2002:a05:6102:38d1:b0:631:26f6:701a with SMTP id ada2fe7eead31-71f6191d9b1mr4187582137.29.1781470575602;
        Sun, 14 Jun 2026 13:56:15 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a03767eesm1751064241.3.2026.06.14.13.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 13:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 15:56:08 -0500
Message-Id: <DJ92M0ZMSI2C.2I39LHFRNQS7W@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260613-sparkling-naughty-tuna-3e9bf1@quoll>
In-Reply-To: <20260613-sparkling-naughty-tuna-3e9bf1@quoll>

On Sat Jun 13, 2026 at 1:59 PM -05, Krzysztof Kozlowski wrote:

[...]

> Functions used by probe() should be before probe(), not somewhere in the
> middle of the code. IOW, entire probe is together.

I they all are, it's just that regmap stuff takes a huge chunk. I'll
check how to reorganize.

[...]

>> +static const struct of_device_id ads1262_of_match[] =3D {
>> +	{ .compatible =3D "ti,ads1262" },
>> +	{ .compatible =3D "ti,ads1263" },
>
> So devices are fully compatible? Then it should be expressed in the
> binding and drop one entry here.

Not fully compatible as Jonathan said. One is a subset of the other.

I'll make it more clear in the commit message.

>
> Best regards,
> Krzysztof

Ack to the rest of comments.

--=20
Thanks,
 ~ Kurt
