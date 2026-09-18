Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A050E591
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747340; cv=none; b=EZCd4IzL7QSWvk7azYGFkf/DVSn09FNH6fyX69PWdNwkiS4P5dDzw9t0oHYUAGARhRWCe3xhOx9g2CZK14Hlrymjn7PiBCLzlJqOGTDn8agNng2LHGaW2lriF7OhmnsOjmAclbenwjVSXGiE2VMW1RBd3bBVusD8bZ9v9FAlu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747340; c=relaxed/simple;
	bh=dFhy4My3gTfz46T+pP1ejh2aEiiK+pEn+gpbRz8FajE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaJKdlwHrv9XqgeonbC40gltg454mfQqNR7N5hW0I4tiUdtWhtLD/V6zYLuYgRLPKH4vhybqpeqgFYzNBhF/3KFRvq16ojMv3Mu8vhR0SI1TcziAjGO56kZOBpz16sGOX1eDhqrbH+csbmURpdu8enSfRdMscqI0MCZfGCEDK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DUHU9klz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DUHU9klz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso8864925e9.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789747337; x=1790352137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFhy4My3gTfz46T+pP1ejh2aEiiK+pEn+gpbRz8FajE=;
        b=DUHU9klzHWINy+WMe9czFJ1ecYRgil11QqBt1yqu1/x0RxDoq10xKqKUpRwJjdw4Be
         AvWiI802dAY6BSjtgWj0+9OGjRx3avFPSHysNex2AwODac0is1eFYeOE4aiYL9RZ+X6Y
         JI95UNzqkF+vw3p9sA6PTaT7HD8wR4LGnZBZkq1HkGAxd8U9RqoZ0lNW/sf2POZdbDV2
         1TkXHF+LE05zecYKmP1IYhNVMjOioWfUXegRJzciqOtQNJ3wwDBmQu9V4ClaEbza4H2c
         vihECAr+JkdJ7itKbh82cOQZjcVMc4kK5ZV6Bj7pfq4f7DDcnsW3OhTkHsXnFf5AfsbU
         4wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747337; x=1790352137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFhy4My3gTfz46T+pP1ejh2aEiiK+pEn+gpbRz8FajE=;
        b=mfSixAvlAgWqhDo5VCoWLE4gk3iai2+KZm/Wkw7JVzvtCHEIhkay3aUL1IydCaLQoS
         tuTiINgRguLaIB9XGXj9am7G1DjG1uVdYX91Mbgp/iDvJSANCzC67LPbv9xSzHw/Nzq7
         5ses1Mj/PhGp2yyhHUmqK5HrTpmNq9RCvGLYgPIAmBUD6KLLrhVwq+qzH+/BFDhEUsD5
         q+7yERCeSvEarlWZthfzJiRstE6IT2oM1QUTgCHQL5RA4MR3PTrLyNOjIknfM2Bi6/lA
         TWTpisKzr9lJzHdtedsX5IPGDncpQLdHnh2BHId0AsS3GTDKzMjyBc9Y1oVbtAb2DE4z
         +A9w==
X-Forwarded-Encrypted: i=1; AKwUvBw/59S/Kt6W4qq/LekaJioqWRw8oiKrDmU7yPhsnECxVz5oJ+qP8viPuuE4pmd8LK9hb5DN/mID+It4@vger.kernel.org
X-Gm-Message-State: AFuF++lsBwJsY8BieIiXqC0FPBWpQ3K77vGvKb4XlWnRxxLihdY2iQe6
	mveY5X+Bipk8CM9F+t07NpnQJ8Dm8StprUsST0f8cVP7jQDrmQZETKCu2xF8jteLzMI=
X-Gm-Gg: AYBFou06+jc4qmFddVKRXXYcqgVeCc9Fiy2eSYHxZ8UOzjuAn8mcg17E8Gr6BTIKWoZ
	a//zXm2P2qVVq6hj8YCfMOO2jDZDWNpgi8JIuk8hFqhE15CnTsJ8KXE8CPPTZBw/Et6a7isZ8Bg
	9dhBmCRE3gGhlcXSCuofaZjcU0225jfq+2vNQMQmVNalpss4unfSevlRRDFvHsCP7jOZz4SvQ4w
	1Hnoeq9J9PzgtrsM5TcbmO588dgtTOPy4Mr2pVStnbdIlcMFqpW3NtggfmeTH31aUgW/djPUu00
	FDkFD0pIgD4CahalV7xaWHJ9gVDajWerxYb+sEU24Nj29ojPGjzP6F7btscq2WWIxapUyPuCbR4
	+Jtw/o6Yu/xir0d4vSoKWrJuG7wnXuyNvvZW5EUHqatToFLeVP+1HOs7VCtVqw7E/ZT/3lJoawV
	juPEEvOXG+3qO9yeVZawpkEELo7HvPsbZNSKWRMKB//wnod2NSrqT7hk9r7b29yWqNWa9up7Sjw
	ihEvkWY2TS363jSvbEglmumSfWfcwlEc79+QbsutnjBEP6r/IjICr2YE3p62g==
X-Received: by 2002:a05:600c:6298:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fc5687acfmr41014655e9.4.1789747336842;
        Fri, 18 Sep 2026 09:02:16 -0700 (PDT)
Received: from localhost (p200300f65f19a90444c8989fe13f5be4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:44c8:989f:e13f:5be4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fc59286b6sm53740535e9.4.2026.09.18.09.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:02:15 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:02:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	andersson@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tiny: Add RAiO RA8875 display controller driver
Message-ID: <aq1f-jvrptlrgNO7@monoceros>
References: <20260916175942.3186804-1-azuddinadam@gmail.com>
 <20260916180410.3188922-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmm5bprmcbrsaq7g"
Content-Disposition: inline
In-Reply-To: <20260916180410.3188922-1-azuddinadam@gmail.com>


--wmm5bprmcbrsaq7g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] drm/tiny: Add RAiO RA8875 display controller driver
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 02:04:10AM +0800, Adam Azuddin wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. Both of_device_id and
spi_device_id are provided by <linux/spi/spi.h> already without pulling
in definitions for completely unrelated busses as dependency for your
driver.

Best regards
Uwe

--wmm5bprmcbrsaq7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqtYIMACgkQj4D7WH0S
/k6OKwgAo93p+YA+UUSlkto/NDiCvLUIcuiQ2j4Zy1SQo6yvwOwKtQhS0a9xRd70
PJkLsOWZjvAvH9/VGKVv4rF+q4G/xoItjAtduwtvOjP2KYbO18leBThT6nYH+Jty
dFY4f2Ojeh+KZ5S5RP1D1RNKDzDShLkMjyijFAAH1I8AT+ffQ+CWUSUKHuOQzj3V
o0JibztPyaqUaMKdBJlGWrKBjs1H2fb8MzjqJMDyFoebhG1Y5TAToybnB1NaqS/I
8oXtqsbZm4smXEbFtgSOGvjDxsnGIG9hsct26ZSFWIohO63PdRrRq1kmJ0YbyFbs
vRBd3aUl/paAmNz3GgpU69S9MTyy3g==
=yOZu
-----END PGP SIGNATURE-----

--wmm5bprmcbrsaq7g--
