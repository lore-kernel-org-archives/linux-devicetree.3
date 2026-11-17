Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925023;
	b=JR1ln90W/pO2tDMnDELBvUP3HurBvc5u2o4idkPql94hHtyhw8XBk7zgNSLggFhCpPyv
	 e55pkDqse2euaTheud0bQzXqEt3o6TE9CT6K+5GvGnQsNmrhUy0F6R6aLX2MXARak4gAE
	 mqN/qAlD0wCwzphxR8tpOWC9NWtESLc5M+OX2O2xWsxMljh1c+FNpKTfwcu4YAcyrUKC/
	 MhQrbyjom4AV+chPrVXSlwg/GC67x0iJTJH1EgEnf38/bjGaOY79qRpzcqdJU5UKskpO1
	 9FD8aX+rtoz1+GnxrINLZQk4k8EWOXOEH+0on98x4O6eblsGHX+6vdvtQmtM6itiQ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
	b=jA0dwasgZjsfr5rJdRQsSyaN2HXeezeFul8AvZrHHvlr70axbSteeFlojh8jQ0MDvoKx
	 E8oJjgIbCBvkb0X7VgZWO5x3dZdhqtnbu+oTW3DCDbrL6OupvytBQPeL/XDZhkrMLF4QY
	 TMv96BaahTK0oDZX/gGd2u6LyQQrYmEd6N9sbvXV+rFMgI7lB3yk+1Q5R4cPS6lJpPIhV
	 SwrioWHZ10l3hTZ/LsG0mDYoOPrU2wLg14QVZXEyDIafm5PIP92PCyBlLdHfNuByaFHIM
	 qM9rovRlfAaI0HWLH4/vZjryLS5FkM9jEFWdRm0W5nWhNaK2WEncXD2fDplnVg20NaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RhiufrUh;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAE8606A8A6
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAE8606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RhiufrUh
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so33533345e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794925021; x=1795529821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
        b=RhiufrUhYJjBG6JUCzddjd2k82NGjiJeZaYoGiaT58Y7S+fVxjIS54WriGq1omtvWM
         PA7cZQqfLrVWs1Gh+LycF2b4oeoWhq7JnbPNlOoPWzNjhgEH0AF7+PLDOu6BDrVBNuc6
         LSiAkOFjys13B/uRMy8s4B2tsTv59JmsOtzAsfz/dL08Zojbw+It48Y/TplltTPIAPhQ
         85vJmubk0JRqhSYOSfPbeax/RRYgzGEzSJ0uo5K6T2gXNxtxuWO0t9rhEmE2mXAGQTvk
         j42MgJvjz2VicHJxqMnFubHTuOCspZLJpyxvpwwjGa0BmsNKWEvdS31u0G0iwXW3orlT
         LtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925021; x=1795529821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
        b=WUUgD8qIH3r3f4PHnY00r/iRq4fTKg2LMI0lfXuCeYTfv0mguw+mekqEqUnCZAjMCH
         nlK9WNP5byFaBApsTHcbTLZBa5Tb818DKhN27di78YJKGaty9RxKh2hpQNKWHWClB8MY
         vtJureIjWy2W86cDnUoc/VnkKV//4mir6sEH8YnrPO2EWbX+RMzPKqqhYrwmCGVxgcXC
         uiBfEPH32Smt1vDoynaQI8pYL64ipjG4Ayk0c8Pz0gf94Giq9S6E/Sb73okki3MrXxcU
         b0t+hZK0VIxBci888UX2mKlUBIT72mOkaK8x7MuaVoEuxFsG+CTJklPgfoGk+YVYkpku
         Crrw==
X-Forwarded-Encrypted: i=1; AL+hErEB1P8834VMvm0rMtUWiiexqeVhmrGRbFENdfdCfIOS6G8ZmbFfrjXhSsFMmjD5t8Mm4PJEaFd4HjK+@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fx+WfnHeGa8jFSbSE3S0iassh34VYMXY9NDblCqKFdN1lxg2r
	FciYRNTm8920LsbMToZwMK31fD1w6dwcLeXqw6owy7ud19m/azP+eXHhnnR29WJbusE=
X-Gm-Gg: AYBFou1L0x5jTHRALSGAZgzX6UViv8ye0SejPu29BtfcLAHb8b9exZvsVWGc7fVEVph
	zx4hDyYyXKUtRsYz+OIV8/kk350ehw4UantKVbAsKLLEvLc96+zRwl/4qytHzFVicPp07n4HL92
	yQi1iydc6bEqHR5+mtHAlj3wMzRJDiYXmdUu6Tn+WZYPED8KV7hiQDWpc/9+Y6eOXllQAXy/Sk1
	p5BOyy3CJT9DkJ7cfGf7eoQvEVh+0LZfTa5PWRYogUryplOt7hWW9lvizhOiZVx9YKX2ff2vTSF
	p4wdCbA050DxevMSQbOO4kEt/WdFZbPXYgJG6+4nTrhxZs1kYEG71usxqIvViM5mDlWiw20yb15
	imTCOVVvqCuK5R9qVuyBdxz0p2/jXjMioiLJ3gocx18we9imT6uBlQfhGlvSKN9WzUHrsg+zwC8
	5VnHXYz2qEFZ/i5N3HIvKHLGFMPu4GJzSSMS9HYpJju1Vltxuo58uiLz0xVWg1TgXb8TnKU/ynI
	qs8lT3mRI8yxY32zmxt/RNPUjGYy80PoG1hRKj3iHt/78Vxp0JQq7gS0mWp+lGzpula9Mbt7+EA
	69ZNAls6n2aNlziVoIClGAK/FYkVwRyHCKY631UjjeyEMntVL0iQiaX7hiDUiTfwDsm/wF5j54O
	y0IBXovBVNECHYqs=
X-Received: by 2002:a05:600d:2:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb55a57c2cmr223922505e9.10.1794925021592;
        Tue, 17 Nov 2026 06:17:01 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb5f350d51sm125990395e9.4.2026.11.17.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:16:59 -0800 (PST)
Date: Tue, 17 Nov 2026 15:16:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, ychuang3@nuvoton.com, 
	schung@nuvoton.com, p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
Message-ID: <avxhlPnmjDhZlUmt@monoceros>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-4-zychennvt@gmail.com>
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
	protocol="application/pgp-signature"; boundary="qlzj55hqn4bynrzq"
Content-Disposition: inline
In-Reply-To: <20261117060501.2611071-4-zychennvt@gmail.com>


--qlzj55hqn4bynrzq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
MIME-Version: 1.0

On Tue, Nov 17, 2026 at 02:05:00PM +0800, Zi-Yu Chen wrote:
> +#include <linux/auxiliary_bus.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/auxiliary_bus.h> already provides auxiliary_device_id, so please
drop <linux/mod_devicetable.h>.

Best regards
Uwe

--qlzj55hqn4bynrzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YdUACgkQj4D7WH0S
/k65jggAtbkfrltbaO6eNfAgtd7yBmZsvKQs9ZqNLrv/4BbdaUEN9BpWSES8c8TU
8A28wC5BGe+pBDAUyMn8DquMXd9blMhvyFP+4MFFbx88o6fVpv9av+03ek1XBeSb
s75G4PhGBqkTX887zZAsGLJlbHctBxujR/+IjNM496gRWStwZ6dqjd+ar6GcTdDC
I+QeQmgJl08pRBwC03L/nY9R0n77kzF2oj3u1zOO3OOnyzkdGER1z4P2EDYpsI3f
LU58xgiNfDdY74WhBJPcEY0ZzD8o6CU5N8xms4Z1ry3OCh7/QN+QiuFyf7ZYUj7c
wc2kMsQbp4G56o8VwLMzjqTwTjKdNg==
=gJWw
-----END PGP SIGNATURE-----

--qlzj55hqn4bynrzq--
