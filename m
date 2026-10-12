Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A5417366
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803769; cv=pass; b=uSM/YE4FHisyuKFtHekgMrIaVwkTrX6QaTLlJZUuGjJgcclhFUCRDk5MlaMuEoSJcUXlRoG0PgdMc6Zy8xmPYLZ4V9RtW0d+XbRGJCx/iJZl1L8qwyblTCLUZai8h5+3gEgnyJsjzIivfIhbA3KsPTQBu+/tN3X9nIml0LbDvss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803769; c=relaxed/simple;
	bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYOzAcsMzeQYA8GpLacOW82rMS+7fLBfwo4csCJyIlIhfceF1g87sQQWEtdpmLEvbhfGlFwWaP4RO/E5eiY285KPcIhKyKbhs4bCmW35DtWYvo+3LzopoFPlyBiob3KyJdDiF/hUAKXaRCLKJpIX8J6l5miCsCDWcIu/rtqM8jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk0WAK6V; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk0WAK6V"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e5d08214dso225974766b.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791803766; cv=none;
        d=google.com; s=arc-20260327;
        b=QB32Nmb4IB0ea//W4c2dJHUYPsp1qBaQ2VPHpzcjJN45y+liMPL2DSfEWgpzaM9aJZ
         u57Fh4DXXoQfoPn3YFiTPlHgqhNYcWIW6QLC2lPxGE8ySs6LO4n/rZJh1WWAAq/gJWFC
         Hz9AF1BFhCE5/9jvmxedcsWiRK8k61qF0yGaGHYIg7TEPjn5nVr94AFfSI7qWgIbnXhz
         rJcgQrJ6sOlMwVXOp/ot2GQ+dPyYb7Ldl+HQMVlO/rYSWPj/G7jB4ePjfkEG+9hHj6Sy
         32sPB2ibMu3ZSLNCrGJTZKZxBgLvFKit1JlRWoAp9d4Rk4igBEv3l+LIfw8+ojB21Hum
         GZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
        fh=HN1Q0/7iGisVt3oFc76viDdwa3xhXmi5qWQy2dmCmO0=;
        b=m7Jv2A0ZXbKhFpNemjg2SeIeyZUJ3FO0QKByjUx47zzgJgZWWo2HLU/INZoz+sqKOd
         zSKUaRylJfIqcC0h1P7fD0gmDbFqf28u5+fWfKdvayOI/KxoQPK5FUC4sXWmn1vrsmfl
         sNrXCpTFGueyIt/jNHs2wJjH5342VGH8io7QS9kJkLUKXlpS5y2DpWcgfAuF+mnnshO8
         Pd46oSmKn/enlrUOVw9KK0rh/dAvibTbTJp1pjtkAfThuqddrYl0FxZSvRJtHEUp2z4M
         d+i6euXIhd3VfYdLp/+TEp4taCj0+veqyiU3MfK1jhcpDcn4v5CTjqq2uqTbE7ABv2ps
         9A5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791803766; x=1792408566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
        b=Gk0WAK6Vgm6dDUsf+IsaYP2DUbXKD0CFA2nyx7qI5HBvdE/GcTni/ILHTETu+QER99
         ufpGr+otFH2p9jtrDoxelU9VYH/PGGyyAkW2q+/UjBAFgdQSoV4OgpuP/8iMZcyFvKmd
         dcdTn5aOmF0dlADFG1EZkZanMCXrTKRz0H3qcQlBQFYoMwM2Wu0P/OVebdMcZAim+TGn
         KqzvNSrR2uDeQk2nA1GRa0gx198ppL0EIXqcYMrZ3xbufAUWSI4LYAa//km4oWSQ/XWQ
         Qjr/VYl6zeHfZ8hyEM8oGWE7OpHu0xderlYpZ6j5klAw9J7JjyWgoPd4a2p4bmGbNmip
         nPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803766; x=1792408566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
        b=AbtywLlTT9+3xnqgA/yp6oO4tQKdVMvZXPGpNALCIVN5mCet2nEl97S3cHCVQixlOs
         ycDGnZFLS1ET21pXIBo6bQe5rkmQGlba+pFj1A7G5ONqvix57M8gblGlP3ox9Zfv/JZa
         UVtU5AB2cXGREiQGMNaZ0CQ1rMChejM7nnsFn71aBHnUhGEUUe/mqJw6eAPzbn8lGwSa
         I6fXYTOBhiD2jQLl0QxORTYKaI36sBjm9qNeJLPOcSfxkbzFwLIYs8+CN5xCCz7rFQmx
         UAAnT296HlWBudWAfM9XscS8f8jYTo4O6J2FukguGgKXO3fT8oCYPoXoW0A3ZzncoL3Y
         apOA==
X-Forwarded-Encrypted: i=1; AKwUvBxD8Z9epM22sFIekp2SXU9R5EdKL5Zfx73hWeExD2P+sPSgR/WvooXhGpH8KIaV6/ITeNbdGIiuhQcQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIPwK7jLqAzUNAxer6nskNiujJPr3bmf0A6yyGWiyj7nDpZr63S
	UqLUdZSEZ4u7JDobDYnLh7z1BYzrgaHTzMps4rSPb0h2d/M4N+G83eWhrO3kRQI87ma7VjkXmMf
	PHaPSDxPI6/c0U2emYzJMDz9kt/BjBL8=
X-Gm-Gg: AYBFou0p0wjQtqtWqL6MoZKd9FuiXf/mcEsGeVJl6FxwDfSE5Ey9nOpA6BIJCv3NKs8
	E5G3ILaT1gfy/7xdDg6uGexz+0CfWElNBWlQ9DvMVo/Ev5XNHTwCxIDdqHBE6NvnohB0L4CEDP2
	mfWdNnG9qLPzqWajspAIagPJE1Ugt9/w7orSZXO75OfkS1v/Qyowni2ZYGWDkUdu7y5ZIBqZG6V
	eTlllC6YCA9NdR6Vhtp4X/iY7DarFPOOHTUtEKn+sPBQ4Daz+qfMmyUDIekzmYxTDygUOsYSSJn
	S9YDy2bmbDfMv0RtrpBRMxWpP9Dl6UII3sKpBDG2g/kENZGS50xoupac1+p33u0pan1pKnnuqVV
	XK48+4rSeAss2bUaKeACb9yXyu1kNIKgTX7MKG3I+jXp+gwA0oaXpcrHsyzHxQe6XwuSOM3YSnr
	duOs1YjVve20k7uMt2bMqskXJclGAqBBA5Gb52hgzkekYhGqLoTtY=
X-Received: by 2002:a17:907:3d09:b0:c29:5b0c:1b44 with SMTP id
 a640c23a62f3a-c31a9fe3d17mr877054666b.37.1791803766024; Mon, 12 Oct 2026
 04:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-adis16607-v1-0-9c89cee35d56@analog.com>
 <20261001-adis16607-v1-2-9c89cee35d56@analog.com> <aszAHLVf7MEqvht7@monoceros>
In-Reply-To: <aszAHLVf7MEqvht7@monoceros>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 14:15:28 +0300
X-Gm-Features: AclHuK8PxCMj8iFJZZKRqYPj-GoQuTI01kOIZSMNlNkGPy4YGUhURoNUhpmsmts
Message-ID: <CAHp75Vee96s0-h0kSTs4O9rtKjYZEPB_8AnEqj3j=+SuzLkiOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: imu: Add driver for the ADI ADIS16607
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:12=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Thu, Oct 01, 2026 at 12:11:50PM +0300, Radu Sabau via B4 Relay wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/spi/spi.h>
>
> Please don't use <linux/mod_devicetable.h>. <linux/spi/spi.h> is good
> enough to provide spi_device_id and of_device_id already.

On the same grounds as for OF, it has to provide the data type for ACPI as =
well.
All the same to i2c, platform_device and so on...

--=20
With Best Regards,
Andy Shevchenko
