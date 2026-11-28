Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852799;
	b=1uf/IA0aMyg3pnnDI5NKajzxxjXumNRLV16MS8R/X6L8MoCwS2TDvaxJ4ucFb+YfLlJR
	 s7l8hJnUZ95oSqZ/7VJxx9C95r99L9Gybuvktnd/A3g1nc7bKfmtSsScXMGt3jzLFd+uN
	 xq2m3+0v+WbI64V8hYaGpUEnbQWsRcE8ub2qalAhJv/oEuIQuNUN5H0KiQ4jNMDKKLdGz
	 7+I3cD6xxXRW71Qo6SVwoO6GNW4Pa5EG26DSss33dnZtYyPRY+NAAkZJ0S0KKJmehzs2O
	 xh24YBh3rAhLH7Uze8DDnQgB+L4uuM/ouWDqqjQfubK1xCTGTU7PRUr6WQBCahrfAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
	b=KOtPerWSWPsRnZmdFIC4P1KWA4fyp6jdfQx9Kn6o4C0UJyUiLf8WgM6TbhXCqPP7ehNh
	 pIiXaBH07V5jhet9Pn9UaTFQpIh2cKb5KduPdHrZ2jMyO3+WJOQrNdAY8QJ+gG52IOQIG
	 0O2QBqBDj5fTnpUSuYgaT0QYLqGpN9NnRNmP4wr1XUfbnMwocM7xik2tCheyW6YCAGhFx
	 u3VSyuFNmqjKcvcXWrNz/YFVPLvcpa4QM/rtEKYC5QZwwyaf26iyRoBD2R4zkyuzLTR80
	 PWoOgFuAzd1zHQZxf0sVpSyi71JG+XrlbSBw1HFzhvmtc5mnW8DQ1dljs/fJsBseSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="i/U/to+v";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB161606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB161606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=i/U/to+v
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49465892f7bso6444508f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852797; x=1796457597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
        b=i/U/to+vCmL1lcMOCEc3owu39hWkCjDpqJ213buTkVu7MoriXmrx+7OGqlR5mKjN0K
         HJznAwo3QdHX+mccxMSx8rXVqDLQlnkM3P4KKsZD+//BlVONCBDPn8pZ4yevOzRiXp/I
         gJxK0s6juwE0bQ5bE/7yzG82cu1twxYL71VfcfhRCV7DMYxDCXh5JSCk5HmLwiBDbGcK
         /3LWwAPMgikzdeET6ZLrmfguyXOEAu3q8eXawDWa1Mz3qgEI2CVV/tpVSCKAYuyGlmKD
         c7Nrf1KPWTMmTIelV6zqs20Kg89Kf0hmSLldDN2UR8QXyMgoiMgC0Yrgxd++VBF30AKW
         lUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852797; x=1796457597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
        b=m2sholuRKo7FyL8Sl4VDJj1miK5LZnb0ZlUdKOzPjeFdboxWxyrQXtVmFqYP4D6Msp
         9Wsj43SsffRbnAEY7ERx9ooDI1NKj1IFJdvA2zkL7lgt0GkElg0YyDn2SNN/wHI2HeLF
         PDINsbx1pUKGyGzFfaswOOi/YezIbJitDuk4K5UrHT21VW1aBJHkxoS6Gd3JHAXyzRAu
         hoNz3HwgICNoP9SosbCQPmBRKcvibGMpNhP85ySWxRrkp6VSXCahsQVQQEQqP5C5Df6M
         tSCoRC99Mk2MMk5Daojpm166rAzCV6lugV8XtPawpDle0K6Yr+rDdenO9E6LYCYLGqN4
         CH3w==
X-Forwarded-Encrypted: i=1; AL+hErEhbsv+x0cR+oRR9o2Lk5OoJFGNgpKmQXn5aksQoeF8aBXmX96UWFgEG2r5G9BzVuSZP3hdnHM+EV0C@vger.kernel.org
X-Gm-Message-State: APuU4Z+n9cSRE+qnQgXopf3CH8/bYE6/wKkLLfWh4GyNthA2nuLDwLMo
	97rfXD1iA3RmC0gdN68fUOq6SjzX3tDNWPOZs0kywsm9ZtQYU2oc1KdnSTxvk92qD0s=
X-Gm-Gg: AZFdTZdPQxhNMoT+sesRiLeuHuEKBS5DZFQ9phTLNLes/zxYE0ukgwXQgSaQYH2sIH4
	y/QYbmCM8lw4GkyUFbBzU67wXuwSMs359lrafOECof8yueD8oE384mCLqvIpblCZdieWOt7jEls
	0tO2iDkwx+RPIPPv+46aNBSpxLDf2m6JLzWyvgHNAQwlZCsAb2FS+HUh2r6nbl2RY4t7HhA9maB
	VFEesAufEM/esafSeMy6agXha1FARcU6UVDZBK9Ue7+CrtWeoKC7FLpRUGaOLGypG+lap2zylr/
	1PId1O/4zYKywCvn785P9+KdwooDmY9crgFJRTrZ+CpZ4EHNjs5e65l23vd/yw0ccXMjOKlMeKk
	wZ8Mhv7APhkUb/hhNk3r1dOjRlx4NrGepEHzkFAcCTCO5w3jNtsca/xFEp6LYmhJ77XFKKpT93/
	dbp2zMpaoestgcPBjMaB1EM66yZpzX1BOJy49HBesn0z0EcscBxNoVKXZZ0KCi80x/x5iQ0iZ3Y
	D6ORaPd2wrBb01PkekPmYOP4/mCSijmA5BLY+MMBA2tcHsxrEJknngsWv19+5emuYIFztuczB/V
	Du2yOayS238HB420WSZz/pdX8Jms9KApahp0tqwig1gravoutmLMCS7/KCf2Pzuc84pXHri5CjW
	I
X-Received: by 2002:a05:6000:2893:b0:493:f3f2:2241 with SMTP id ffacd0b85a97d-4abb272746fmr52992473f8f.23.1795852797142;
        Fri, 27 Nov 2026 23:59:57 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b110ba3sm42679550f8f.35.2026.11.27.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:59:55 -0800 (PST)
Date: Sat, 28 Nov 2026 08:59:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
Message-ID: <awqJkqQ_8tXGIqo9@monoceros>
References: <20261127083807.2844507-1-shivprakash.gupta@nxp.com>
 <20261127083807.2844507-3-shivprakash.gupta@nxp.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5kez4omv4kntvob6"
Content-Disposition: inline
In-Reply-To: <20261127083807.2844507-3-shivprakash.gupta@nxp.com>


--5kez4omv4kntvob6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
MIME-Version: 1.0

Hello,

On Fri, Nov 27, 2026 at 02:08:05PM +0530, Shiv Prakash Gupta wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Both of_device_id and i2c_device_id are provided by <linux/i2c.h>
without additional build dependencies as are introduced by
<linux/mod_devicetable.h>. So please drop the latter.

Best regards
Uwe

--5kez4omv4kntvob6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKifYACgkQj4D7WH0S
/k7agQf/dUy7wCorcL/I4owilXhYjnsXPrSYVFuZTI3zBHYDbdxpHZa80WwZlBG7
E4SFU0OwJbEJe6jfB4zfEAJno76UQtmfOsPNrRBjhVwTHfHa+eurWy0zb9D/2CE3
T9IHil5xV6MLLjEsteKu/ubZ5uOQpl/GemFXCbkkgQnOoNk3fu9vTRW3m81xJ9bm
uNWYCMXorvZ4Wx7PB2OLQd5RwRNUormhf1E7zoUUE4ilF3XfUbBOvueHDCr0dCy2
b/wJgjIiQzRLVsEcMQ1QhPUbCxlrMuzkchAgFdHqygmuxVmNh8Sz3yBHvjK4aG4Y
MLYKgxWCCTBVfnXialkv/zpFTTAkgg==
=jkpr
-----END PGP SIGNATURE-----

--5kez4omv4kntvob6--
