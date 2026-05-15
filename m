Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B6383C6F
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834307; cv=none; b=S3zmDgN6XTBBnQVoxDQX8wftvRgH+4aFO3jWWbPph+SrGPAKXV6uLSsBwzdlaCZNtFDqaZmVHBWhdlnJ0dO/Ij4Dsyh6Hv+W3cLf4xBKuNQ7qQoOEvYZy/H1ucQKRdX7/Bk5FilFkHMjW5o0V0wj4Xpovy+Cb+A9Pnzw0XipBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834307; c=relaxed/simple;
	bh=MsUJBDLFj30krvCb97q3qO1jJ5/R4gqH6OLypTiMYnM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IEOIa3iq1KUNt8tG2Mf2tc1r9onnPWqlRhhq+0wV8JbARzRZLXaTB526dINQN3VP/vWCdG0sqKuVtY+K4mNDUyWxpr33qlfsQKU30/vOejqar5x6GCLlJ9ljqp5eX0hctkS0/SbXavAZoAOR9pa8k0+yO+O+KFUO+snUFWTx3x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=fNQVuthh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="fNQVuthh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd373f83042so576030066b.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778834303; x=1779439103; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsUJBDLFj30krvCb97q3qO1jJ5/R4gqH6OLypTiMYnM=;
        b=fNQVuthhkMOL5HGyt6FU0uci58PbQeiBKdzvL4FkdxhJ/ZRiR5muHDgpdkLt9SUC8P
         bq5vQIrvZE15jxAvCXeIyIMJUEy57hoguChyKlmsYUSDVCLQGcfzZfVYbPPDdhcabbcn
         kPCTcsZ9zVNLryULZAYRJniBM0mn0gt5rjNTW/FK9BNGrINq7sqs8WFooBnIMrnNUYyg
         y1uYAh1PYK2pkqsthpZO1BpcE2NbUiHMlmsHRWWWudc48fyYPffVb5f2MCg4dGxLKhWI
         T6EWmkemRWlix3v8/QIZpG/lGrW2ulR7e0UGnH2JDmjqwFHFZhBpxWIlebo9yZH28S8t
         ZpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834303; x=1779439103;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsUJBDLFj30krvCb97q3qO1jJ5/R4gqH6OLypTiMYnM=;
        b=DJ6QhMF1eMYaZe22dIkp/cxY3D3sYECz9XdeaD30rwEfvxV3PntPXIrDg+HF30nCNT
         +nTcmgCse9fq6frbxZ26D1T+zTDP3eNpRB6U+529DhvCUp3vN2BVz0crCxmeIwj8ltm0
         5xixqP3g+XgqO/r3P9kyxq01qxmnO9+ksvOeiRy4YCg4yD4rZm6XGAHAzRx7hVD0rIv1
         fVSsPSMrZxVqbDoEzlUpLY8m5rdkncJUtxfNTiLDlnlYPm6tvNuLXFd4xmJXYxsfZquq
         XN3n2oO9JL5i041HepOrVgzEiRNMxVKiQhD2yjMOtGDuwJuuhtVtwt/I7HZnn3+KKu5U
         drug==
X-Forwarded-Encrypted: i=1; AFNElJ/6uQ4foTK+GBWyZm3dkJ21LxqInMb9XHqmNxWFfjKmFmerljrin2wiBi9e4s8nCuITPuuJRzquSmXR@vger.kernel.org
X-Gm-Message-State: AOJu0YxyX5G2UMa/6qjtysrLc8B/M2mU837s/2MibfSQH2twiDz8UK78
	JSoZ9YRYMIZO08pBPxA7E5qdDUULnXjrDsTzWzic4ys7xXhQz2w0NropQE0v0q1ZtBs=
X-Gm-Gg: Acq92OFIABF38hDR8c9mLjHUvATt9gTch8uRceGTlbAREy0XKgDLzvSMV/BcPD1+6Er
	pSZdkXFeAj306BKSVc3ppY0Gh2Lh9GqG0hBDI6OvmOs3ErPT4x3Grh8RzHK2PwU9P6b3pLyc3u6
	27n3gxi2z8sldDqN/of+AtFOoUeVsND1sW5THjRCYsfjR4vsgvePysCrBh+8FWSQ91LA5JF1dkJ
	2/NZOvnkN23bw6xZZw6Jt18mNcg8tONCvwe8ToWC3An7QTDLjImGmyCxzOoHKvBCoGH64w7tJ4p
	FDSwmaWtReL3/q6PncQHwi04rODqbFw/wfPahNA6Z3NL4k6Ul3hFFUZIkCJ85bbaqd7cx6LjNHw
	/7gCu80I/x+LCxkTak+/E0fJ+IDmCjYBTeoZB5en3vlPiQV3WpgYI3Gx54QyXlFDEpBwd3M31Zv
	YOeKzOIFKUlS6FsGMo9IXvEafcog==
X-Received: by 2002:a17:907:c714:b0:bcf:9dd2:f79e with SMTP id a640c23a62f3a-bd517964d82mr164496766b.29.1778834302554;
        Fri, 15 May 2026 01:38:22 -0700 (PDT)
Received: from [10.169.209.7] ([151.19.40.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm195094666b.24.2026.05.15.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:38:22 -0700 (PDT)
Message-ID: <f77e96bbf0a85cacd3ec300bac3bf4ed6b8605b0.camel@baylibre.com>
Subject: Re: [PATCH v2 5/7] iio: core: Add IIO_COVERAGE_PERCENT channel type
From: Francesco Lavra <flavra@baylibre.com>
To: Liviu Stan <liviu.stan@analog.com>, Jonathan Cameron <jic23@kernel.org>,
  David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Antoniu
 Miclaus <antoniu.miclaus@analog.com>,  linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@analog.com,  devicetree@vger.kernel.org
Date: Fri, 15 May 2026 10:38:20 +0200
In-Reply-To: <20260514144712.64374-6-liviu.stan@analog.com>
References: <20260514144712.64374-1-liviu.stan@analog.com>
	 <20260514144712.64374-6-liviu.stan@analog.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-05-14 at 17:46 +0300, Liviu Stan wrote:
> Add a new channel type for sensors that report fractional coverage as
> a percentage. The first user is the ADT7604 leak detector, where the
> value represents the portion of the sensing element that is wetted.
>=20
> Signed-off-by: Liviu Stan <liviu.stan@analog.com>
> ---
> Changes in v2:
> - New patch.
>=20
> =C2=A0Documentation/ABI/testing/sysfs-bus-iio | 10 ++++++++++
> =C2=A0drivers/iio/industrialio-core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/iio/types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0tools/iio/iio_event_monitor.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A04 files changed, 13 insertions(+)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio
> b/Documentation/ABI/testing/sysfs-bus-iio
> index 925a33fd309a..0570e8b8f5e5 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -1980,6 +1980,16 @@ Description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Raw (unscaled no offset etc.) resistance reading.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Units after application of scale and offset are ohm=
s.
> =C2=A0
> +What:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/sys/bu=
s/iio/devices/iio:deviceX/in_coveragepercentX_raw
> +KernelVersion:=C2=A06.15

This should be 7.2 (at least).

