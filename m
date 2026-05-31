Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C227F19F
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780255616; cv=none; b=MjKJmBjtwG0lA1m9u0s37oeBPnCRnCEcMWYZhsGjXQOeWs+P/GEwRUWWI+DoywWC3of3VWAeNaF6k3kS8RxkPVcciCQmOD6ejHP3yJbd5kMqJr2m/QCBDuzyAL63fa33wdcSKs6c8eb3YsJSiXGZZ13HHV+CNZ2GR+BMBmenmns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780255616; c=relaxed/simple;
	bh=BVgKf01OgskgygeFY43Z0W3nhM0vUepIGbcC73EKjk0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=b3j0R8LFeXBZR6pJ2ZCt/lJxws4xKCm9vCWJQ0H6HW7EhDqqWStH2kcyM3WPOF7h2KobTetvWt4B9m8CXOiv7unXerJH7AiSdg1LcLlI/pCg620r9gxy1LmRzCNfivyuPzYZJGMAlSBEPVFIOnfWtMTEkkiN06ed9x4xG1oU4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pq5W56my; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pq5W56my"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so83071345e9.2
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780255612; x=1780860412; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acBxYatXtrUI34saUQ8bjI1t/UrspULYpylE92l4Z84=;
        b=pq5W56myaRdY0FHLaSAMvxFc/SgBtatj5UKXDUrCVkbBWh8qhEhF/W5jwe8wrzwWxk
         F5JHD8SCRrbhoLKQhGs5NIq9WBQXC1I21SRtcGwBAGtW0HFQrJMdaTmD3jItm1sV3icJ
         yskK1vDM6G00Ll2mwConqQw5nAzDII3AyULuTnjkWXVnBWq+/enG8zuKr7D6B/rsIteD
         kgKW70lDMdFUNoIDA0x605jDUg5shryHonGaey4qZpeUPoIviKerBAHKI04wzxGlrhni
         zUTI2RnO77urS7WDsrdMU984OzBpnLPGD5DwVfqPc9agMP2t2jLlSbhziomwhuadp8h3
         URug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780255612; x=1780860412;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acBxYatXtrUI34saUQ8bjI1t/UrspULYpylE92l4Z84=;
        b=oasLP7Z9f6hrtvzEmVbPEdoVN3Gkpk5J2od7O2p4YIu19VyKDRpxUGQD6CyoJJPzWR
         Cue8BvLYd6826v0r+f9xxHyaeld0mRxeHViuiKnFblpat4X9BVeK3GFP2C9SVKIvb037
         sUSkzMvN84BhEwWgZFHOPvq/a+XV+HuMzXDGyF3VC72qW8iROFvLG3mwVdBPgRh1mlIK
         y+OgRAXnmKWFR+G40Mw5fYU1k6UZ61SOxy4mdm9IjRUqEpfr7BTAVQqdBirSxsMhuvbX
         OJ32MQ8+qCiaLiY/rOiYhVx0pR2Numg4a+wJcBex308XFnfTTfez0xrZljrQrcbgmcCf
         l86A==
X-Forwarded-Encrypted: i=1; AFNElJ8/3aSvl5XaduUpO06A0GbNrLVms6FAVfFC045Vly+m+SwIM4Q5vlTnhGA9WcMFfLae24mWC9cGH76d@vger.kernel.org
X-Gm-Message-State: AOJu0YxtET1eytKZXcJQ1gUN+2xM0vUJlzkUNsGzQMdZM9KDyxXjO2YX
	TPSc/oDcr2kNYNWwmOmChHr52vt22Te4QmZXDzKITusC1x+hTsLGfXYt
X-Gm-Gg: Acq92OGvDDMGa/B4OA8wkrSC+4gssNqmhcD2nP2XVDmpTaIL1qjDqEx5PIMeF6hyS8X
	3qe7o5GwMGztKvBDSYODCBwTRB/i8O7W5O5Te1UNX5ijT9T4nfD+84jCMkqiAkwm9lMhRw5N6pi
	OJXoVqLBhUIRdkMXfRh6vfX6dm7/VQRpJtSBMWsainZVAfxHVCrnrJ/eSwipTO8Kym6XMurSWoU
	WwwGIIe9W5e0mP0C+0WlYB6ErxyyIcJDMjQ9K284ZgUDLz+IPGghnlW0EeLlkXBzPzTzyMk0VFd
	2x6I4lplKqcWxqZPOn0gvmrZBUGt9aRNTxPE1vYkpWOz8tFweI8q8eJ1rPi1VMzIhWfyaeVmnq+
	sjEC0DMOLf44k6Jbsi4G9z8EN5Ad5L5AWT6C7oKmVCFp/0CCna3SH2+bk2Whd0J/OB3t4XFkEq8
	ZWKDkNSRG2XHC0Q3MEZZ/C6CXIjE5p7WpySTD1RWp7YWtJQzM=
X-Received: by 2002:a05:600d:848a:b0:490:9d1b:f06b with SMTP id 5b1f17b1804b1-490a2943afamr100906285e9.26.1780255612025;
        Sun, 31 May 2026 12:26:52 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:bc17:a305:8902:fb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0af2d6sm69505675e9.14.2026.05.31.12.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 12:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 May 2026 21:26:49 +0200
Message-Id: <DIX3Y0PCFW9J.14RSKP23REFBO@gmail.com>
Subject: Re: [PATCH v4 2/2] iio: light: veml3328: add support for new device
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Joshua Crofts" <joshua.crofts1@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Rishi Gupta" <gupt21@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml3328-v4-0-f9b65d71d917@gmail.com>
 <20260531-veml3328-v4-2-f9b65d71d917@gmail.com>
In-Reply-To: <20260531-veml3328-v4-2-f9b65d71d917@gmail.com>

Hi Joshua,

Just a nitpick I caught on the fly because it was missing in a driver I
recently sent as well.

On Sun May 31, 2026 at 6:56 PM CEST, Joshua Crofts wrote:
> Add support for the Vishay VEML3328 RGB/IR light sensor communicating
> via I2C (SMBus compatible).
>
> Also add a new entry for said driver into Kconfig and Makefile.
>
> Assisted-by: Gemini:3.1-Pro
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  MAINTAINERS                  |   5 +
>  drivers/iio/light/Kconfig    |  11 ++
>  drivers/iio/light/Makefile   |   1 +
>  drivers/iio/light/veml3328.c | 422 +++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 439 insertions(+)
>
> +++ b/drivers/iio/light/veml3328.c
> @@ -0,0 +1,422 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Vishay VEML3328 RGBCIR light sensor driver
> + *
> + * Copyright (c) 2026 Joshua Crofts <joshua.crofts1@gmail.com>
> + *
> + * Datasheet: https://www.vishay.com/docs/84968/veml3328.pdf
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>

At least linux/mod_devicetable.h is missing to include of_device_id.
Probably that's the only missing header, and it could be added without
sending a new version, but that is not for me to decide :)

> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +
> +#include <linux/iio/iio.h>
> +

Best regards,
Javier
