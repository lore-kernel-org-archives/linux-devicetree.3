Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59F02BEC34
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783208664; cv=none; b=uB/SB+IfrFiogH7u6nBeqEQc5LhAszgjvg6IulP3dBpPcX4NPxvhw+U4yrs8FCXnVpug7RMwdudSdtNp8YC3NgRinLilKuiBd7EeseEa/QrKQJL4d6++SpmTFf1ZPOr9xeuzbmYJK3kYfCLPN29O1QYM5JgqdCbZxROhCB4Hon4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783208664; c=relaxed/simple;
	bh=XIsNZqam6KN+ptafPrdhyS2Xv8HOzf1ASRI1tweH4UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdStBj20Q1G/aHwBf7H8NkwWNSsxcUdAOYYlZxJBgqNIY7sH/Unwh9fRjPvZDfueX4j9LxoKK+tZ1xi0bquYi4ijhAKmkF1pexXcUYMm/AwN89uEeOiUp0CJlpGQH1eSjpraUH6sY9nQrZCeLMX7S7FuWBR1aCzZV5sQQ72r4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6uCffPV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6uCffPV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c99672293cso15808525ad.2
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783208662; x=1783813462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ijJ32Xash5Jt49SnX7A5/BLB4XwCy86Iuli9undALZU=;
        b=A6uCffPV5VnJ4tFYEtayNLe3TcmhtfKdU2A3PIMSu4gSnTPgb/yvm3bPOcf7R7iXPh
         MWU668MhZcnjcOs65OYQ/QY8uesmkGPsUqTPvlAsb4dohAWIl9aNZQUterpxYXGU6J13
         o+5/GvU2jBQQEXpiK5k4Yy4ef/Ymkl4TBZKrFYC4UoRdTZlCOOluZujWO+iCTgdQGFlp
         qul/gf/3F31+Z7umsgEOUy8jIUd+/KplFB7E+AKH107TMAmhjvCXZerzCSXMb8UIiHxM
         yr0ehU0kGAr0CwndP6krnKRiC08O7J7B5TW+KO6dZyaUDXwg9RIH7K+oBqAe3Es7COs2
         GPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783208662; x=1783813462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijJ32Xash5Jt49SnX7A5/BLB4XwCy86Iuli9undALZU=;
        b=lMY4dAdNTAAhSDaUh1ltm7YddI7Ij/dZ+sFGTlVa5y8F1sUqs07bjrCjVFxL9eGfg8
         Ia16zh65NbgqTcT17vjrY0ZRSkPtGaxuC8yfJ+IwgiDfdobz9hPtyMKEziqkwfvcYWic
         4MqPlYWHUwv2Kt53TtvAT7EX4v7ERAdQRs5kv9dzPDEE5P3eJ5drRCDKfM06Kgb0HQHd
         Bmw0RxOF2LrdBv1maG1o6b5O6lw7rGpwy+Sy6yg+kjIkpkGJi+mu0cJE1/mssY0IEmG4
         ZC1OtqtL5fY2QYMfOvkLb6f8cpl/VegkL8TgKwFzHvQTJXKoeBvE5FsxKWIE27i/2qyQ
         ROzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq54ubaJwSryzmyiqN+rkENqu4MlHHyqUr1mkGpSZKErKciawC0FYmJUPj+Zd/r1YEuVhLIPrumUxlw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3GsSl4EaD88r/Ej0bSO0L8ABKqGzB7vX6jeEXWy05+bMPGe+J
	jce3lAHwCThNKX4xEf2STrTOrv9bGANKJRYwjQFCtkrZyrs9gRv//H+y
X-Gm-Gg: AfdE7cl/9Qmj5eZqjul6APexxJPnpHw34vgxGqQWWyuZSWDiXbzPY4TzsStKpzJ0wWh
	wpl2uMRD3JLOpbHfuiiMK6a3MfO8xsCgGgASQJXSFM2kw5fkJT/nGOIQaBrb6DfMmtXJBHkL55p
	9ldDhzFhSmzLMy8ZnMAqMFmN6PdhAtw91HgPhQvr4HDIRYklhJ1au5WNSzXkekVh/zANuBBjBxc
	XX9KniChDK1hXSUraENYJWl6RKeYuFQe7A3fOXQlqbuOvuTVIbD2WbKUCq/64oV/KJbsdVlCckw
	F/cEMW4r3ua3NhB42lxpdvyyw2/2HjPDssaOZOZI+KEQMUu8Fuk5UyJR1o1GNd/QtvnOUYajluu
	WpLlgpYaExpkeSauDfwx5IQFr0X9EjLqA/M2SAXrgVcr2o3eNkzUjkcl+A1zhClBAF6VSjQTxEY
	Ch9vSl6EFE8q7wZi3ZZFb+0qBuqo5zW5OfgUAjjKzhfQNnXdwPrLQGi853MjN9Eqv9
X-Received: by 2002:a17:902:db05:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2cbb74ff24dmr43520125ad.12.1783208662110;
        Sat, 04 Jul 2026 16:44:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3f90:534a:314e:e11d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm34410696c88.2.2026.07.04.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:44:21 -0700 (PDT)
Date: Sat, 4 Jul 2026 16:44:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after
 enabling regulator supply
Message-ID: <akmZOC_J2ZTl4zLX@google.com>
References: <20260703115601.1323491-1-wenst@chromium.org>
 <20260703115601.1323491-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703115601.1323491-2-wenst@chromium.org>

Hi Chen-Yu,

On Fri, Jul 03, 2026 at 07:55:54PM +0800, Chen-Yu Tsai wrote:
> Elan trackpad controllers require some delay after enabling power to
> the controller for the hardware and firmware to initialize:
> 
>   - 2ms for hardware initialization
>   - 100ms for firmware initialization
> 
> Until then, the hardware will not respond to I2C transfers. This was
> observed on the MT8173 Chromebooks after the regulator supply for the
> trackpad was changed to "not always on".
> 
> Add proper delays after regulator_enable() calls. To avoid impacting
> the boot time of existing devices that have the power rails always on,
> skip the delay if the regulator supply was already enabled. In this
> case the regulator is either always on, was on by default at power up,
> or was left on by some other driver, such as the I2C OF component
> prober. Either way the controller has had ample time to initialize.

Unfortunately we do not know that [it had ample time]. For this code be
reliable we need to record the time at which given regulator was turned
on and then execute/adjust the delay as needed. Until we have it we need
to assume the regulator was enabled at the time of regulator_enable()
call.

I am not concerned with increased boot time too much given the driver is
set up for asynchronous probing.

Thanks.

-- 
Dmitry
