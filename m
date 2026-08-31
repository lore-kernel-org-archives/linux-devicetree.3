Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36906499F03
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193736; cv=none; b=tVdD3DLeyf9V343jNMHUauNGisAQbCLCnrZZUOShwYawp7X18LMfsxhBwNVWN0qrO5QdSRwkMvwQ/fdLz7wiHINVIhtiw8sMSxyU0ouo3TpmD76xwDJp7ds1fgng3ZcWhFzAgxdVULzKhc1rh1cFdJtMai7vQOticiu4L0P/K+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193736; c=relaxed/simple;
	bh=RBFdUe9Lqu+3E6HjxM/7EycY+o+q4NHjhQ/1rLOnzpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIjvdzJlxaHUP2Ut5VovQbLyzh3G3mUuF2a9hOF705uyMNDI5YEv8RH0VtjpvRaqjFScSM69CCvk7txtUvUwHRKa0i3hYlb9EMtcGAJviz8ueSiP15x26hLiuutttYm4RWLz3WbCazp25vQnGlQsusAaXj7yn9TH9dpuQ2KGRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cVvUotV8; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cVvUotV8"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f432ac553fso3076835a34.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788193733; x=1788798533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWqZKH5cJQNgKE7le/WSTlw6Pq/lpoqP4enPlKSIv4U=;
        b=cVvUotV8t4gHLwPbNl0AUFJniJl4drCTxW8s4qKnZo1uH3AAeYJUdaXa/UJ7PKWJDW
         BsMSX4oZSvkeYOV1uGuG5uGLAUNkWyXd+YSO2pSdd7ubXsew9Sj3iJz3Gqza6nDTSRAT
         dCe7YRWtgVLXl6sBVuC4+m442YektGGfoVDjXTwRuXSv/4SbZlYeNKtNhRymIWVoyu01
         w7HO8z/FeUaC188xu/bD+3XqmcGYoRLzFNOPL8bA/qPY7518k/EibzWdoSP31TFVMUSV
         sKUyEHk7VBx0Poh8QW/t0oAWdAM0jTEjS5pLmW52UcEcar6kx/ACFPI5b/rKMKbTGBld
         +rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193733; x=1788798533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWqZKH5cJQNgKE7le/WSTlw6Pq/lpoqP4enPlKSIv4U=;
        b=kY7hQ/Z0jpJg23df806mv7zJg+/Ki7WTOQZ+sutrHvq4DLSy2umDppr4s16g8sKlca
         hpcOe4UHDJpkucGBflVZ29YQsP3UWtxvocaDQul5ZMJMiMTtAXiDsoQGbl5G/44GRjcU
         El1cf3cgDgPvhrFFn7To/e4ATVhciU4nDn8ANfL3cHIDq2YOMSwownSaE74Y94jVDZ5D
         pNPHj0UyIY93MXYbsmkyg0VwbLqz8JodABVIamBruoG2DPHdw7GspTy5Gbtw8wu+139F
         y+B2Lvae9ngzGDhKYGuYyJMgu9r23p72tZgVoWqvdT3oLROcFP6G12kx1XkQg588aGke
         lVWA==
X-Forwarded-Encrypted: i=1; AHgh+RqCaojwODCqBKE/KF4dP5lJuTbix9CvF6nwHvtBdaYSfwJ/4ie0bnNp+IwCsMQNjebX2HXnpzerXgR0@vger.kernel.org
X-Gm-Message-State: AFuF++kCsBdTpDLZLDadrBJUKEhGhROhp0hppwnrW4uFgHX+Ullrl+ri
	f1ni4fMRg4ZyJAlAoCmL5v8l4MP3KIO7XYGQuT8eI6aEMQqjXZdP4PrbJICmmvfM1G0=
X-Gm-Gg: AR+sD13OaVvz+Q0KJ8yndSoOb/NVsPPPRnnbqeKln7gh2Qj9C+FyjG4DNy33b6El4yC
	jkyiPGjammejL9ceCn3+9PUNpVwDSS3Makc+Cz4fNFa6S2WDfOcSunYQoS44L/tqlr8jLK9imbd
	mJhKGRlYqJN6pgs0VLPzwrPD4aOO8Ru/qcX1Nhg8J2OPc1wrgPPHwHktStWY/0y3H1LTi47ugoy
	J0BA6F/qQFEVwR767MFNAIJfPiMOhw98dNPBvaEl2GTdmhlXNz9Kv/cILOD/nL1PYlz7UHCTeIs
	DGPUrIUDLE0HQHRSMYNWh0rGgyRgRwPlmS0dqvRepI9byb5b8b8ChOMMbQb/ffTFC4PBygnw6oy
	xoYlb9Nna3SL3P7qJXxKvFGHmk2YOQpkwizZdwUmL88RBKHw4hxH2VLRmmzGQfxRehAjW+sh8T1
	IH9A4QiiUHyWPH2oN4HSlAvmQPuiS4+z/lVIkTP/qntptLHhfKG1MiilfV73hDUBvBsCYZW8ya5
	rh+/v1nBSisVBzkjnWMEvT45mWEAlDRBVhH
X-Received: by 2002:a05:6830:208a:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-7f687bcaa4cmr1802418a34.14.1788193733045;
        Mon, 31 Aug 2026 09:28:53 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:778b:da9:a8a1:bc78? ([2600:8803:e7e4:500:778b:da9:a8a1:bc78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa96cd7csm8181194a34.14.2026.08.31.09.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:28:52 -0700 (PDT)
Message-ID: <268eb714-2849-4ebb-9f9d-9607fcce3358@baylibre.com>
Date: Mon, 31 Aug 2026 11:28:51 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824-ti-ads112c04-driver-v7-0-6b3c9c87d0e4@gmail.com>
 <20260824-ti-ads112c04-driver-v7-2-6b3c9c87d0e4@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260824-ti-ads112c04-driver-v7-2-6b3c9c87d0e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/24/26 3:49 AM, Kyle Hsieh wrote:
> Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
> delta-sigma ADCs.
> 
> The driver implements:
> - Single-shot conversions using the IIO raw read interface.
> - Dynamic parsing of single-ended and differential channels from
>   device tree child nodes.
> - Hardware interrupt support via the DRDY pin, falling back to
>   software polling if no IRQ is provided.
> - Per-channel reference source selection (internal 2.048V, external
>   REFP/REFN, or AVDD) via the reference-sources device tree property.
>   refn-supply is not yet supported.
> - Hardware reset via the reset controller framework, falling back to
>   the RESET command when no reset controller is present.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

