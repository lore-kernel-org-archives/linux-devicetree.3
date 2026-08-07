Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D14457C6
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136532; cv=none; b=O0gkLs+gr+Q65kDTZ0R3RYFE6PE0rW48HIxeyCSkpsxwckU8jgsMwNGh2BNuf/YZjBFIKec25h0F7ureJ2P6JayxAP6OEeSPisO4eMKoM1nzSQXeVxrFYC571OIXPUCAhWUYrqSu1GMESRjZdxoLVT4V8vta22WF0+2NSeX/4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136532; c=relaxed/simple;
	bh=ca2rvTqJaJ0l44/M3BLtPDmJgbBNlx+t7Oc64RAbPQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkyHDgs+LihaykFHt5x7q8K4SJOpScmvX3P9kvsdC8L5wpIGY48kPbHn8NGDJZrbX1YBKZVcIz0QQx1WCaCMX3Zm832wlaHWsgCQqyDrprgdLDO7Ioh7UHE6pr6B/MW7GS81AD11tAwa+EzgGpudZaAwzlVvDPpHzQ9+cKsK5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bITsE6oP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bITsE6oP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5725e9.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 14:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786136526; x=1786741326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ca2rvTqJaJ0l44/M3BLtPDmJgbBNlx+t7Oc64RAbPQU=;
        b=bITsE6oP4T75+ZUQ2uAcq9tjfocw4Ee6HaPGHfHotl5edmrjg8xo+7nfzEQuTjE5hr
         vPhsOzYeTetFEEN/6XDDOZaxDwEZ/zuokBik6c0gRpuLp1cHEbC2APizT1Ka0iQAmbIw
         7hAR55NushhEObyZ8UbwNfRbe4Y+n3Df5p4pko4zgC5Nqp2ujH0IGA2vhYpjgoJFiVID
         r310iE2EA+5UwGWd9y8TSL+V3/WJycDwNGN70hD6UYoduszBhVQTYM6WKlpKBix9V5oD
         yHynHilmGTq+uuZ0CGqZ6J9hwVUHN/pLMHMqh/aEuDX5KdKhmGnEUAAFwcrKuFmN5H2u
         ybfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136526; x=1786741326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ca2rvTqJaJ0l44/M3BLtPDmJgbBNlx+t7Oc64RAbPQU=;
        b=pAF9oYigCc3MvtubKhdodd3jx3OkheSLvOr83sunqhXAjqOWoDIiwcz03Mta1B0JuC
         Xz11V+ZntNAxcDa+4Hsf9vTgJnv7BLlAlCj2u8/1UPUlp+1Dv7yHYIs3pUva73sUtMGQ
         cgC1YjK7gmt10LXWWy+gN1VvNCTrVj4qATkhjMk2AxiN7X02i260Z8Yg1K3qvHS3p1Ih
         Kphyo5/XhxIuRCng02WEUi2BvOrqupr7Qx3sJmkRZFW5p7MshkeL+ZyT32xDnJnxPfch
         mo1H2fZp4uMPAh2RYPWoCFggq2ckgfs/G63kWq1EDSG7w2UEMO0VA8c0KiLZceqtSPG/
         PH2w==
X-Forwarded-Encrypted: i=1; AHgh+Rpp4TsRTZ4WG7HqNAn4EEEuxzO5oRGrwO870xtGoXwlvxJesnYRGjXRtRaWd3Tvl4F4QBbK0HZ/3vYy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5DmP8khdZNfRhc2BLfNld8atPkGl/JXqwiKdt0dMJClde4xi
	jzL1O4zt0/XLPOM5gPfHUMaJmtjJm4Eh3bdC8JEw0aMS1r1fzZ75ixva3ZLLI6LM56bebY78/cP
	OaVWT
X-Gm-Gg: AR+sD13CC3LqHnVVK+6ClT13Y2ggNhuHwoZLN25n4rDhYZPupMSbaoqSGkvm+WCBXPI
	DJFg48Dsa9pqPz2gTsnjQULbxUVr4KaVDgEM0BQ7a7G099vlxHZiyyj8bONkpZvoRcyEkjIqX6t
	nBWft5Vvdz8SwelnCbMZ6m3AykZMxvNwSn7AwbFY5XI3ESui7rBeN3ezv//eJ29WVCrJLnatYqQ
	wSvTI8hZJT1pYdUaLLJ//TCKBIH7uZuzQIyvG9n/auE6W2LPGlhGeeMQbA1Mb3GdlUxily/sseE
	S/lIEokiSTWgRwRFZsJ8iAEBe40jwBJRrnUoHFoSyWyYZIPtmyjD60dIureBs0/lxBRNKfzwX4j
	T7HjRFFGJ0glnQbIquWP86yIQiED0/F+X22uXR3kDStvoNJBATDWZRdaefZUPJzsAXNL2/XyhFi
	WvDT1che0Fv6jg9tf0Gku1jvbM1noaKKae/LRH2jkb0k90hTk6labbFVP3nbMuGG8lpQ==
X-Received: by 2002:a05:600d:8483:b0:498:1371:6612 with SMTP id 5b1f17b1804b1-4994e7a70aemr270467195e9.6.1786136525974;
        Fri, 07 Aug 2026 14:02:05 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995ea3361esm69056715e9.15.2026.08.07.14.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:02:04 -0700 (PDT)
Date: Fri, 7 Aug 2026 23:02:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS series
Message-ID: <anZHcBfAeGB5gY3V@monoceros>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-2-e60876fb3640@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="touihyfzdk2tirvq"
Content-Disposition: inline
In-Reply-To: <20260807-veml6031x00-v5-2-e60876fb3640@gmail.com>


--touihyfzdk2tirvq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS series
MIME-Version: 1.0

On Fri, Aug 07, 2026 at 03:51:53PM +0200, Javier Carrasco wrote:
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>

Please rely on <linux/i2c.h> to provice i2c_device_id and of_device_id
and drop <linux/mod_devicetable.h>. The latter header will go away soon.

Best regards
Uwe

--touihyfzdk2tirvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp2R8cACgkQj4D7WH0S
/k4Q/wf6A3pGoHTJI1Jo0utoGpCFl3A2mA9rAlVwEacyVXio2L91HCSucDU82DEK
A1O5IP5u6aJbIqz+ZkG3fEGZlnBiRqN72KzINJNDhf8cpQ/RElwo+vIdPbLRlXC8
j98QII1HTZMvxJwQSK9pH8G3TRVs+Wx3/eNUv/pUeLmnNmPJvsBPkv/nkJQjaPpE
NtAowdUP1bEBNscNe38WHz0wQIiTj+q2Zf7HsORhvt7VXWgdg/fEFvMSTYfUrF9o
aM/Tg3JCfX7AzsdWb7bHrrIYCtVv0DFfsdGcpj1gVpCfgm2tghnFJVjl1f+yDRLQ
YBYhiGSEDKTnOpCL3w3VI7yExYlOvQ==
=Gsu0
-----END PGP SIGNATURE-----

--touihyfzdk2tirvq--
