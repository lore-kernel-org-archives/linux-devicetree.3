Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5AB3E1228
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959584; cv=none; b=AWKBag7jFIxb7DYpyp5mh8yCqddwo3oraKXxuRUYcAZDc0sGGKIZRFv8dXC3NOIQ6sRo7Vm1PRfg1YvCj1s4OvwdFk5l220G49ZRJuEaiQpVRlkIufkZWxM5WKJGe1bTv6wefPAvzgnr3i3WMGln54kJ3wCdykLPpmLOkBjpKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959584; c=relaxed/simple;
	bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4P7CqSvs/He3BTf+Ajxl4sZ57/dz6BFR+Ft3TLfUhtz4UEH9A/wsAINNgJndSagbWHtKrnDT7RSX1cZRC3Dm5nw9xweORYd+WNLvRR1QvUWlzJCOEMBciZ2TOKm+U6UJERXGEHsXPorSWJn7I1LhZRP/mgdIBFCpiYsw7rXbaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hDHFMeiv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hDHFMeiv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so25569765e9.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786959579; x=1787564379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
        b=hDHFMeivnqgaKc+0lZ93f98BgXbzgnxU3Ky/WbFz1oZPuM93N2vbfUSzt7WX7xQNZ4
         IJc7twCldleo7/B430+SRGv34cEn9G834h7wlUXuQXGkyozNDRowruON2bS8FQwesTp1
         jxY+ox2LQy6qF+0z/RyxRHKl+sBVwkdtK4oebDRIuueFloW4Jw/OxostUmk1SPyfxVZ1
         Or9GM2v3mTfzqv9VATtVzpbgn39+vkAMKrlo6Z458IKTXsTZ2qhoHzbFWgGEqEeJbJm/
         jDOxRdBbimbQBqz/0nQlvmMWUMlS/CpnEdHMEsY1t+5F6upQp9HKhXGq/CQPUzOT8/FR
         Fp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959579; x=1787564379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
        b=WL+Ej86zXHFrj8CvgHXAjJf31pSOXsXpl0N+KPP1He8rXtgUMuIu1Jl5DGMDouet9Y
         6gL+LSmMe1oJVfyvM+ZESuitZu2iG6PAIm2uzdirRKxt1gOOLVtFA1wzsZ8QG8bcHFU4
         azRPVWYjVzbZkJxf7YG3boCCqA+JOP1+YUJEoL+FAKvfKL1Of1gM/Mga3MxRWqj4vlyf
         itnoq0AFlT199jWpQ30ooiowFIumDK1P/NZx0JdA6W+tl3u6AUkkDs6HwsaYn1dpmFBj
         QnhvGtJ9JPgxNQy+UyWLjZk64poYI6usMEEsFH0zv5T6ujUpwuATJHZUmB1mmNURLF3h
         oxJw==
X-Forwarded-Encrypted: i=1; AHgh+RoE+7pJOD+Zyk/rley6nYKj4RN8wSaOV9zAjTB1fCuehaJZwwA8ExvaYCGYN3KjypFEuJZZHWSlOLLo@vger.kernel.org
X-Gm-Message-State: AOJu0YxiWE7V912KSpaiX2C7PSTQ09RPXJ8xycLw8OwJ0fiDPk3Iy3Fx
	ZPPgv4vWO9+YKyDqpQNiAmAsPjOR19Zr1vnu11LbMq2csX+AmW9TF50pU2xoIRJOZio=
X-Gm-Gg: AR+sD12EIYLEmcTw0QsGhRy/6ur12clZmsROBl/w7j+LVawIz89n3sOTojeVGksMvbZ
	Z/2jMWDf5uRgnoJf0+o7LToR3c7GNF+kwcc5sBrBFlrOzmqN3Rw0cE7tZchP6CmM37uNT8EEZcV
	pdM5bOGUN3V7wlLQuAsKMeKejWdfW9CDjidVkk4axYc27y/UptikUOpOf3gb8GIHap9JneaNNkK
	MVTwp+nzuTMz5cTXGWi/85iLV+JsyZurEb3Dyus6ZXPiimR+FY3eAE02HDkYnZRWy93jmTrYj4b
	oKaLf+S+XKsLU2YVk2n3u/9VEh43wp+g1uTje6fEFuUFPAzGD2hIX9cjgz9TnA9avyaINv/IZUt
	X9MRBG3G2vG7qTGTOJVKViNqQ2ae5Y14gZVpraJpdfDiYajyt07JZdRfnRxP7htQ3KZ5y33ytmj
	aQVLAIgtJlm64yYt93IVmG8dMjAnVolYZWtVv2Pek5hcuFH6luuQWNLJ/DC+Qmr3GBK6lzMq9p9
	Np1+v88+sAipmquVj6fBQCUiXScQgPAL2f5lgiHP+cdJPWaU3qN71bRGqtWqY9Ere48LMBus/Th
	m+KIRBqDz7uMzE0PIwWYQdgW6/4u2T8mUEBwCVrCO6wGAA==
X-Received: by 2002:a05:600c:4f12:b0:499:491e:4b0d with SMTP id 5b1f17b1804b1-499879c627bmr387093535e9.19.1786959579385;
        Mon, 17 Aug 2026 02:39:39 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610ed6dsm169142985e9.8.2026.08.17.02.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:39:38 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:39:36 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	mfd@lists.linux.dev, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v6 04/14] mfd: lm3533: Pass only regmap and light sensor
 presence to child devices
Message-ID: <aoLW2Lo7LDD-OcWF@aspen.lan>
References: <20260731113632.158440-1-clamor95@gmail.com>
 <20260731113632.158440-5-clamor95@gmail.com>
 <20260815025203.2618cf8f@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815025203.2618cf8f@jic23-huawei>

On Sat, Aug 15, 2026 at 02:52:03AM +0100, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 14:36:22 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Instead of passing the entire lm3533 core data structure, only pass the
> > regmap and the light sensor presence flag to child devices.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> #for-iio
> (I didn't read the rest on this one)

... and it looks like I overlooked that there were backlight changes in
this one:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for-backlight


Daniel.
