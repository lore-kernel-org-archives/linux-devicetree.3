Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F83D75A0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399311; cv=pass; b=XLW55gOhbZyQYAAnrz3B2IKEu2sKPtJRpF0vlU53aQ0CkzLfEYSTMGcsdKb2CFI9Yq+0dA6e+9sjFHa8MG0TAFrCz8sZcfMdm/u8vmiu+OefQrthLGEqaN78SGw/V43qONzQerXIauEXgQk+2ZwiVvE9upqUA0FC3uLIOJX+K3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399311; c=relaxed/simple;
	bh=YFWTpa768Mizy6Y9RP1z5B3yTHYadcLcipl2r2WP5ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9dqJTR50+Nde0d2kvAdGBgjMM/1Ton9GBQmDh52oXeoMnhat0OJaTGLT9N++rOhYYePBNZvkk1XBJcW0vgCMyusfR4Eh5daTY90huwDGavkBXuUxYF/nyuNqQ+7Y5ihlSwR/Qutn1E96vQm5rzENBC1/DVY0e9Uv7T4C/uB/dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCnCVOqe; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCnCVOqe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so2182524f8f.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780399306; cv=none;
        d=google.com; s=arc-20240605;
        b=Tcwhx4p4awGCDHIbjKy0RoXIxUmmAwgTRh+Iyht3N1745LeN72lieCtRp1f0RfIUq1
         gFqIevjHV+imIcKh2wXirfbkf4L49gULI6p4LES0qu4rmPM1BPbrq3vw4ikccxdPOj7m
         51k4tLWqS0j8ffSWlEoHYEPrVDodi3zqQk+qKSPc9sYVeF3UeEUSYkqG46RaLsxe9xsY
         aeDO0ArFh4pxf5qUsC3rvunrZMJGpQZWugAo2HE4zf4pj/J1V6y+QzIrIQhbtzHhszFc
         LSwdEX/hUDCgbwS4zmMlbGlGyEqeYHT3KNFKK6wO7+z62zBZQjBke5HJYOtMW/jRKwev
         ZMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZLqHBgXsfQzat/RItjNrifpP2fiT1XPOaumQDI9WwPk=;
        fh=yvXL7kTO9oBn343rTAINkqvDp/XxEjnqF+cD3U/0i74=;
        b=Y4qIkBsrmR3/KD3GAV7Jl+rBaoKxsTr8BL5Fr5+H5nifPcGAS+TSmAzY+lRJvBT8lC
         Qjrw5+TqrOvGG/GWE9Qlr/jnj/lOKeSYbAJy0wI02oDwcirvu+TnFV2VHLjJcaYm6KxS
         XSoIZXN6dHNqn8tI8rUNVcTGt5YJt36/QC/yVO65FaejR6FppbX8U3SoRl6pGhCMnacW
         QKFIEeiB0wqacQsnW9fwoisfyOq2dUKk9hZDQFbiLFwRp2Y/KgSR2JiseE79ZSBWsb32
         ysS/WMCzdMGjm/OT3yOT5CcUcWgXw3ceLUjcD8TxvQZkWYmrWb1VpADnCKYmMpF+pZtQ
         YjAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780399306; x=1781004106; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLqHBgXsfQzat/RItjNrifpP2fiT1XPOaumQDI9WwPk=;
        b=pCnCVOqeI1WbYufiTLH6wXklubXrzr3ina22dpdrWp1totW2Os9D45601P/l4G3Qv+
         sinI8F/Wk+XwwJ7nQxqg/Erll8Hts3eFSDA0UChjOKfBrViZKQigqrXaDq8HzNFISuui
         Tuz411bUFwQdgBkpIEUevS3zuod4CDdamg9kUU3leExAlULNNq/Cpry83MiG/MfNZdjA
         BB0v99k6uWFNgUHSoc39TgyXEHFggK2gNmR+leJFGScDqJPRy5sl7UFJg2XtRTq1I70k
         nLHSFit3tsGYh5rLkgZG22RKleh66JFC3Bec782yOIcQGtXnXxFiXYj3p0uFQOiB608a
         dLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399306; x=1781004106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLqHBgXsfQzat/RItjNrifpP2fiT1XPOaumQDI9WwPk=;
        b=XMyN0mrfgzl7LblRIoIZZJ377EZkeaVVgUWu1DghR7P3PCc4SDd8vpFS5yqwlbfn/p
         sxejW1Fpn9cjsBoP+45aZqvUIHfMVa2pLhwDAzTK9yOH7cB9bA/HY9nOn8h6t9RqOm1w
         WnEEF+OrtIhi+QcsekUzGJtIGoT/Gdx/hpXI3AXMPDFkkMoDrl6fzEmk7xreDygX4DZf
         lRdb21aqBAOiLSaDTbSGaSTzzRaedmuBN5qyWjOUajjBQJKLxJo+TniAD71ZQ83vTpug
         UisXMIbnNzGE0aiIntIG8fKfSiT93fMzqTro9Je7dcXwp163HHDB02SW9Mc3yZndGMhx
         Og4A==
X-Forwarded-Encrypted: i=1; AFNElJ+0jojvCtpbCgrhTaw7eUFp5tUJCOWYpGuyr4Q6DAEFECSc2RrpyA+M0Cqus1HPmo24aqVnAB8K28fW@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmmy4FvDJDSetV5s+Fxp/PzW5fGqVoYfhSKtlbP8kIGHdX717
	yOpSuHehPGAifHNiQYDNyP7A5ngj0GKwsW801YpnyL3e0boyIBF1csM1wuZqAyOOjalbxwKrk1k
	bccuNktjOZA/8bFIq8wQg0EKZK5eACzk=
X-Gm-Gg: Acq92OGBaHFcppzrHFJ8x9TUOxyF8A51jIgPdqKKms565CjuKuQdkVW1eEjXfBltA6p
	qwsQ2eto0livSHusxepTX6ge9es8fN+3k/WOuUdjZ28ajNJIfafYGoFB0zxBkZqmaixWHdTQ+BW
	WZp0mKCEMQhqVwpqR4XyBLQfa/scOMfKDBoQZSuk5vicMW3u+kmJ0A+w/kNldTHqy/nBXCnFt0V
	RD4BSbs5t7/kb2mUmD/k9joeZKfPnsdF0Y/ZQ50GeKAJIGCewU3iOVYF298Fb2WgRoFtntbAO0K
	fDXu1XE2p2td9Ir6r6DidQCsfAzZEyirXrTeE4yLj1WycCDrXqnwqSPp2b6Bp0/lhuWN9x/6T0n
	q3477HlQ5Sm5y2ZTJfWAaGeMa+2WSf7ogdqm9Calmy8EIeHauM4YyGr1BUTUtPX5w2SWAMR7wMG
	DkcKJRFaenF4eLQzTm
X-Received: by 2002:adf:ea04:0:b0:45e:de0a:1773 with SMTP id
 ffacd0b85a97d-45ef6b93c7bmr20479177f8f.33.1780399306177; Tue, 02 Jun 2026
 04:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com> <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com> <ah66ljSiIc0ywFC2@ashevche-desk.local>
In-Reply-To: <ah66ljSiIc0ywFC2@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 2 Jun 2026 13:21:34 +0200
X-Gm-Features: AVHnY4JnJuVXmwDjzbvcOTJxkPYCt3QsTcWYCYMeswe3B4QFyV_njNnZZmIFMWI
Message-ID: <CALoEA-wdakU-Ei2FE3WpGR+CYRDN1bjv2sZ=XJ01ZeH3NP8xeA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS series
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 13:17, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> > Do you know any tool to automate this beyond asking an AI? Manual
> > auditing is not very reliablo and it is not that difficult to miss a
> > header that has been indirectly included. Building with W=1 and similar
> > stuff did not help.
>
> `iwyu`, but it needs a custom configuration. Even with that it's quite far from ideal.
> The custom config had been shared in the linux-iio@ mailing list this year.

Let me help with that.

https://lore.kernel.org/all/20260512073505.1310-1-joshua.crofts1@gmail.com/

-- 
Kind regards

CJD
