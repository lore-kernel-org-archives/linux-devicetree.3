Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894163B47F9
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403208; cv=none; b=onxRIDB2mXgPpUy0MJLP4pQwha9qvIl7rf5qbiJGSUbfCMFPD3QKPGxxz9OTayvoDsfIKHyGp56n8X3T5ik1BmQ+NYeV3HsOP484pAmCucUcF7NC4ValFG2jy47OQC+eb6op7b9wLwwglxKqDl2Qy7XysgQTFt4/7TN1LxdfOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403208; c=relaxed/simple;
	bh=ZVxOG33XzzMNHk1oqzzwmRCKYAbGR9wBVWiGeldsiuc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fsDqFs3K7rHYTOvK7oZuw4p+aa1qcTO2HjO2FWy6/zzf4L3w+QNZcGskjVXZIAq0Ufg40KXSShnGYbBLy/8rta64mKxkzw/v2vcNOhWpUo05OG1XImOxrNHnBhonDF90WwtSsTgJIMIljDDhDIqfXfQglffi1heJfgqE4QqGe38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGalDDki; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGalDDki"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49802c418b5so22914475e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403205; x=1787008005; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZVxOG33XzzMNHk1oqzzwmRCKYAbGR9wBVWiGeldsiuc=;
        b=sGalDDkisHjzznQRso9u30bOhTQHWp8Mt+cyHbB7HCMXmaoy8NH7V49J4edu+6WAfz
         tUmWD1iResKN/nsMsPyJ7teSQj+A4JKp/jnSOhjYuSz3uhQcl7pkSK3mM4EtHVg/GqEX
         xLtPcsZON4CMzJEgI0KqbUSFKWWhLySKmpngxTg2lyRqgjosO+XfnaVnFx5TDG3DCxc0
         u3Pndkinvc7uyOS5Z+LH1GLtvIOBGqn+qhOm8AizktMbXdlYrxV3d9Fe8QqLkey5HRfG
         Evvfwm8OK9NUXUZu911zyJPrHnmwaZbaOlov6NgAShcwNuDrgmzjK4aShe9sEUYplQoN
         jPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403205; x=1787008005;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVxOG33XzzMNHk1oqzzwmRCKYAbGR9wBVWiGeldsiuc=;
        b=MipiOQ0/AHbP0V2gE4XkIjT8Zo0Xik5I8+Res/hKUF0W/dlEIvmSv1kG3DIMex/bn2
         Z7C0PJHidXLbPGkuC/39t/2d8KDW/W5OJNpbO0NXRUBKIqZpTp0KveSLMV226dMxjTW0
         28cMj+bCgPpDTnHWNA1mnvii6KjliWej0oCIKswWsOOQ+yLzmfgMUue+TJN2R/3QSHzt
         cCuN2BgltzAiam+/OmxTs+YXYm8u73OEBrWvHvJRgXaCQ7mDs5lNU8MKonEiog/jVZHd
         o8Mq9ZHFx9ZjHSItmwE80Z4jKt9FDDMzz43ncIEGSvLW2kVt0Pcvg8G2wM0smBZCnvIl
         kJDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYzDCD1JhpiUjoNusfxzwNqtYt1vjlpt6/+ybyqyleVLSLx/4XCdrvvR1s/ntHSHYcoRmD/xSrtgxV@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFkqatbxd4opXUOnJ6XLqsIky0E2+8RzbFxmcU5gGC+ckvPhr
	ayx4vWRsf5QL/JsOdZNgNyX4WAfI27ccIRQLpAK9TFn0gcZPDV/P7KwK
X-Gm-Gg: AR+sD120K64jLb7rzoc98THMnr+fhaRtVwXBKH7okGAsU9wq5qIrcgI36tXBR2l6/FO
	ayhl+zPDA6Nrd9HyQQlF7K4MvX8ueAC1Rvv0U842nZSb/LaTX40QuwFXPJUMDxlfI6q8wdd4Vl9
	mPvJxPTbS7u3khC7k4+c9I06Fo1WPh61dLVnYnWrt5xdG7hpgZxpaKfV/AjdplGaqUYJZjBxTLu
	WRmUPPYP1PSvBs2M2UuFPn23TAqdeSniEy4WCgIymoU/F6lrdfPwmXwQaWJy4O6ZWDLqLgJyt5D
	q4Hd1LpW6YnbLgWA7RSTI4FxIGISw3FwotCHUPuNbosgun85/BfFl4e8Tu3/wkn+PxGtN7vfwER
	T7NMGhUmJ0iaIC+CtKwWz4xOgvwzm7C0DzdpQNS/hE58TL+9EKrVT/K7okElL58JGSdIR5J+XgW
	WVWhshDo29LoZ2Xx4FWYrDgEbS9cS3369C33h5Kyv+jM305iGVqd02wiouhjQwUx8tulBLnzqsG
	erSFSRZjRYxwA==
X-Received: by 2002:a05:600c:a42:b0:496:c378:6420 with SMTP id 5b1f17b1804b1-49961964937mr272065215e9.8.1786403204676;
        Mon, 10 Aug 2026 16:06:44 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:15e0:67a4:d119:6328:800e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm40104966f8f.18.2026.08.10.16.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 16:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 01:06:42 +0200
Message-Id: <DKLN31OCJZ98.3JFEAVU1AM0F9@gmail.com>
Subject: Re: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-2-e60876fb3640@gmail.com>
 <annUbQQn2TzzuFNC@ashevche-desk.local>
In-Reply-To: <annUbQQn2TzzuFNC@ashevche-desk.local>

On Mon Aug 10, 2026 at 3:38 PM CEST, Andy Shevchenko wrote:
> On Fri, Aug 07, 2026 at 03:51:53PM +0200, Javier Carrasco wrote:
>> These sensors provide two light channels (ALS and IR), I2C communication
>> and a multiplexed interrupt line to signal data ready and configurable
>> threshold alarms.
>>
>> This first implementation provides basic functionality (measurement
>> configuration, raw reads and ID validation) and defines the different
>> register regions in preparation for extended features in the subsequent
>> patches of the series.
>
> Since it's going to be a new version, my comments below.
>

Hi Andy, thank you for your review. I agree with most of your comments
and I will apply your suggestions for V6.

> ...
>
> + array_size.h // ARRAY_SIZE()
>
>> +#include <linux/bitfield.h>
>
> Is this in use?
>

This one is in use for FIELD_PREP()

> + bits.h // BIT()
>
>> +#include <linux/cleanup.h>
>> +#include <linux/delay.h>
>
>> +#include <linux/device.h>
>
> Oh, the whole headers hell is loaded just due to dev_get_drvdata() it see=
ms...
>

I will rely on <linux/i2c.h> instead, which is also what I am going to do
to get rid of <linux/mod_devicetable.h> as Uwe suggested.


>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/limits.h>
>
> I missed probably it, but is it used?
>

This one is used for U16_MAX.

>> +#include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>
>> +#include <linux/pm.h>
>

The rest of your comments need no reply from my side.

Best regards,
Javier
