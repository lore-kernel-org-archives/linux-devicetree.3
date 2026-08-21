Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16648481661
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787311228; cv=none; b=pe2islzNy/2jt5HVkMGHsukT89+1fmxFY1Z5piULH6IYwK/ZAfgHZ85OZoUUAtTiIDV82UeYKlsneX9qx/nWoV5FWjtmXZhMzngcNsoft4SF9/+6mJ+mAWCXgpcSGTdkzAg/Uv3/H254YX27pUcLI+J7JhbXUfadB3GsyBeixH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787311228; c=relaxed/simple;
	bh=zl+lcKVUwTw2hdXwH5M71fIohjQYAkHgT2vGYk8sVcI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MmYyUgIVAQDMl3vGbV1gqhQ0bD/sygWIF3EyXdnktPUJnrvvjrtCc/g2m6jqCaU0Ppg/3xJ3cgSZ7kbFWcgb52rb/TS0y+Jz84Bvk0glKwT74lPlu8XuFdLbQIQ1QWpyRMMYbQQ07pwOcm9LfM7x2tL2q7iwVDWzWQrUfuC32EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQWQ6tUB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQWQ6tUB"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1826495a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311225; x=1787916025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/G4kA1oa42FAHTTSOZ1rtStYiGFk+bZCYLupm5QyS4=;
        b=kQWQ6tUBcIJF+jcb8qBZ4bN8IhgFxCytsHiQhSFZ6JQl9diuPrQMs0AkPOqXf1+Bre
         f0lCpasDgnu9OJHvG3a7u1lhbAXTMUahPAkbfKCJrL6mbvrjligoFL0fLY9E5usjvPgN
         XoLFfecTEVAhDjYf7LciWsJ4ViKEjRkYbQEvFESoU2Vv+pCARd2MW3xM1iDUUhtqwf43
         eJK2J/CfdlpaAFuhAJVRk7g9bpDa5B2J7UmSZ30hqTerMMXmPmj9e1+dZ5SMmkGsgCrm
         /dKOSVtbvMAGwsEDNSsnqrHjHGTMLJhy5+0llLqgHMeuajHJ/msruKh8P9JX2ITXlXIf
         4bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311225; x=1787916025;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/G4kA1oa42FAHTTSOZ1rtStYiGFk+bZCYLupm5QyS4=;
        b=Z8gjx0mgRCNiQpxqLurppDOtI0u5YcFvhqv6LpbP2AW3soUuhHenOSmgKE8o6LeoBF
         OhnRhmNoE7B3PRt8SsqJVsgkXNWCkQiUxrxE4/0rWzRu3JOdcUpvfNrr1kTtj7OX6YFK
         ONvbcDz8X3UQBMdiaW/pa5s8DDGA/V2eiaMHnpMnGJpK+eIZyu3ZKUEPgoDvb8XTQIrD
         dh2VHaO8qwUy6ljLuXkSCB3OLheyj/LMoGapHhBGOR1+oskzJ8e7K3MUiUmW1blyGXpP
         2910JF+owWC98n0FOKRW0I38PlfW0gPCo9z4PM+JoxP+4fLo96xWTqgp42sqihMdbRtf
         ivmQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHJK9HYkQyM1j5OkLr3CExu/+x/7Iru4v8PD+kpCMNKHXVClMlUgpzknrDDoIvtZOSGUHAoHPEycWL@vger.kernel.org
X-Gm-Message-State: AFuF++la9XEOeHkWshyAyuC7J9LlUAvnsLP68WoGcXuKJpvr7nIXoK1Y
	boDV2rTSFfpxf4qmQbZ8ZnbLnlel6mRPPbtH8yeKfBoG6Owo++pMWIN4
X-Gm-Gg: AR+sD10Y1y91Jfe8zS1TEx7GN4H5R3cN69TQSO1eQPUI+dJ4fcUcGHJb9wTGuNJloZV
	EpJalfYgE63VOuzowebIdwjXEG4vjH/kgUBI/rISrxca4HXyNF/D7Qe3tnTIbcm/p3sHrmVxXoD
	pFVs1/RuokULIRzXWhDfozXvULf0RRL2FfInvjWPorKG8oDMDTyfZbbUCsUOzXc8hooH02EzvTZ
	ZSJJyTEGHhX/6XKPE8sGh+TDjEiYOGroZf0MOBzcD89eoVwEcj3tofVkt0V59KltZtp27eirfeu
	1ycpZVUnh8gKpWE5xYLs6JYIxRNXcR7VXlRbOxtZcGG2kIppnIj8KxFR4sxY1wFVklXPdxKfHFx
	CuOa000uTq7pKxSWnBcOPSIYmZNHbvYhL/BFNUIu07VIi9VTffRVXNlhJnS5Mp14hyn8gBFxmIW
	om+d/IehZ5q4yDZEMopttrnjFZoXlgqXCq0/IhHuxQMBc1/ea57YHl1hJUy/9dRvVzsNsExzNu+
	o8qFD8F+ITBk2b7h56erPK8sD67S1xHaPFEoIJX0WCholXUwV8z2W17WLBBZMw+zr577dJ3DFEZ
	JAexWkkVhZaB8poaqW83HZB4i40Z2C2gPi9hXLg/2Iju8zA1DqV6kT5rcse/N3bGzeywX4LowhS
	VjVDHIU8OCWR01SeGT0A3Rl5C/cwkfcUlohYaYjtIeZczbzOQdbpNoFBVJ06nqGxPRniu6NVoTO
	DxkuJi6A==
X-Received: by 2002:a05:6402:380f:b0:6a3:9e00:8ed2 with SMTP id 4fb4d7f45d1cf-6a42f27795amr6505598a12.16.1787311225089;
        Fri, 21 Aug 2026 04:20:25 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1780c9sm5978930a12.28.2026.08.21.04.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:20:24 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:20:21 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Taha Ed-Dafili <0rayn.dev@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 skhan@linuxfoundation.org, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] iio: dac: ad5504: separate ACPI and DT paths
Message-ID: <20260821132021.00000d2c@gmail.com>
In-Reply-To: <20260821102452.37407-4-0rayn.dev@gmail.com>
References: <20260821102452.37407-1-0rayn.dev@gmail.com>
	<20260821102452.37407-4-0rayn.dev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 06:24:45 -0400
Taha Ed-Dafili <0rayn.dev@gmail.com> wrote:
> @@ -285,16 +292,20 @@ static int ad5504_probe(struct spi_device *spi)
>  
>  	st = iio_priv(indio_dev);
>  
> -	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> -	if (ret < 0 && ret != -ENODEV)
> -		return ret;
> -	if (ret == -ENODEV) {
> -		if (pdata->vref_mv)
> -			st->vref_mv = pdata->vref_mv;
> -		else
> -			dev_warn(dev, "reference voltage unspecified\n");
> +	if (is_acpi_device_node(dev_fwnode(dev))) {
> +		st->vref_mv = AD5504_VREF_ACPI_DEFAULT_mV;
>  	} else {
> -		st->vref_mv = ret / 1000;
> +		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> +		if (ret < 0 && ret != -ENODEV)
> +			return ret;
> +		if (ret == -ENODEV) {
> +			if (pdata->vref_mv)
> +				st->vref_mv = pdata->vref_mv;
> +			else
> +				dev_warn(dev, "reference voltage unspecified\n");
> +		} else {
> +			st->vref_mv = ret / 1000;

ret / (MICRO / MILLI)

-- 
Kind regards,
Joshua Crofts
