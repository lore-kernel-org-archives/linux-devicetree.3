Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D7328B61
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278997; cv=none; b=ST1xSZQxMsaYYJTaBqNCDXbw110OgiJYma2KrgPv2QJWae5r8Vxs6PBbqzcGQvJADseFSaLF+kut3cethH4wYOZ7sXco4iWVUk9oyDYFQBRPzH02eI06elgSfU7y26yTD81jfux0e5yS7/BBbyHLP4aDQHfBj74xMkJ6wBkC6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278997; c=relaxed/simple;
	bh=devex1NxxbO5Ce8hDzE0PrM0NXXbvrKcL0k+gmPGkkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThPGhfpJUEAi7tjk6f2+S+EhE0SxzpUWLPbTmbnz0lTLBYLF7MY32rk0yWu+1plUlrVgI+9dbtkq5LaNXm0gm5ESQjuw733oV+ux7XG1EwqyAZaSnr8Q7rBpRpQ3XlNPc+mlD+OftrhLyaAxFMIayfVoDkkYee8B2Hj0k7XONQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WOb786Ov; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WOb786Ov"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so41953125e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784278994; x=1784883794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=devex1NxxbO5Ce8hDzE0PrM0NXXbvrKcL0k+gmPGkkk=;
        b=WOb786OvzsfQN/n21RIzt2pT27L/IFLWc6zo5CCZ1u0wU+5C1DjHdAazpctkqj4f83
         wsZrrX7fTzUV8QMOu+u/13PIyxezdfGzrhVsc2pIjZ/f5Wc7GmZnCvRwoEQf05lRKmCr
         9ivkWLHmtTrMAf204ovHOMCMoqpaa9PTc3cwGHl6SG74LdYbwRskt8QLlla+xugK403n
         W446gR+C2AKdbWBsVexpcK9TqHQfVLOOIEp0V4Gi818KQoCHDEQO/JuPKhZQw4igulFN
         PGLDLwPcos6FMa52ICGEY9+xD3BHzoWB0XgDHtaEmBKvilJJaFJOAG11G0uvv8e+uHTZ
         DLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278994; x=1784883794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=devex1NxxbO5Ce8hDzE0PrM0NXXbvrKcL0k+gmPGkkk=;
        b=Ammg7hJr/cekqHANvrRVRyFNHDCb+Zh7DvpfxrvqquZuSJpTI359KRApS/mgCFDXvn
         bfbqlnX9FkC0jq25Go6BguDAfMuaHFozj6dG/NJl6nzGTq+aLJc8nHEMO2oQvtKPnJh3
         dyfZvBw1msavRywtd3vznDJ4bUntkrS/4igoBVymUsAORIc1YGgYvH6osMHn4ZnC0qHT
         e6DnY5bUcXBS4p8gRu3Nxc+9A3eoSmmyBG6av7tcG6NRdG4dRYUUXLO2SRlZhrpk1/Mf
         PcuoxQlys5E4Xvhk3GMbqwye9cmNAHuVs2mBrRbjG507l9pi5kAxdW53YQH/af8Yutca
         4aAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxzpKkGnGrpzXdyQFMV42PzOTpyxiTigF5q+bC/TCtA3U1Q5d7sc+aJBlytdSJp5h2doGkVPV2S7Sn@vger.kernel.org
X-Gm-Message-State: AOJu0YwLz8mRS6sAorn7I7s+0iAfJJEzdFFwVs5FyhvwG9X5THWfhWem
	UrDcu4ibl7pBovn2SsHWVb/hwsygAZm5P2pCK45OObl4KBmhtpom3p3Y1zP4+4BYsKM=
X-Gm-Gg: AfdE7clVTwk9tlueYWCRBxZoe8Fu7CwSc/UANQQoLJA6OlzMoWcE09m5u7QFTznrsDP
	SfYYnQke8oGzobQpv83P0S0c0O9r4dSnADW1RxAWBWRUp+9/kynOhg+jN/8o0YLgEQvE5d0m1Jz
	IWLoeDbK6wjYDLPfKeaw6mdh/eHLC6Wzna/89gS4KgsalqaYTkHNfp3prwTxztoDb2Ffq/2atz/
	dD1OVSTZYu9KKPpqAbNbyPScj2ZoeNDzrOQN78ZECdCqBdkUKwLjS+i98nmgqVbvQbehKckAjyR
	6sjgF4fyNlZH0uSre3NdDaMCXNZ68XGvqdNNsZmEzV9egcT7PBIwz5DQhijSmI5aur4zoPnidA0
	LdGbfoVmHpTHPsLBZmnWztLF0cNmMXnReNeEKMSwlWn3y0/2xDYZRrIsaFxg5mQiHR3cHC6c5GH
	J3+2Njw9foO0G4TErFoH4FmtoZq/j8YFZkR7mRW6S5WKI1vGE0BannuGVGjT0RkX2kT05sf7u3H
	iM2
X-Received: by 2002:a7b:c416:0:b0:493:bc92:ef45 with SMTP id 5b1f17b1804b1-4954a50c54dmr12670645e9.24.1784278993613;
        Fri, 17 Jul 2026 02:03:13 -0700 (PDT)
Received: from localhost (p200300f65f47db047d2d8b161e35ab77.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7d2d:8b16:1e35:ab77])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2e850dsm35096125e9.9.2026.07.17.02.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:03:12 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:03:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, nuno.sa@analog.com, 
	dlechner@baylibre.com, jic23@kernel.org, jean-baptiste.maneyrol@tdk.com, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, heiko@sntech.de, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, andriy.shevchenko@intel.com, 
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V17 4/9] iio: imu: inv_icm42607: Add SPI For icm42607
Message-ID: <alnvV0OwqMtRVmF5@monoceros>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
 <20260716182637.24310-5-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e324wvcflz4pjyjc"
Content-Disposition: inline
In-Reply-To: <20260716182637.24310-5-macroalpha82@gmail.com>


--e324wvcflz4pjyjc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH V17 4/9] iio: imu: inv_icm42607: Add SPI For icm42607
MIME-Version: 1.0

Hello Chris,

On Thu, Jul 16, 2026 at 01:26:31PM -0500, Chris Morgan wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

Please don't add an include for <linux/mod_devicetable.h>, I'm working
on removing that header. The two device-id structures you need
(of_device_id and spi_device_id) are already provided by
<linux/spi/spi.h>, so you can just remove the include line for
<linux/mod_devicetable.h>.

Best regards
Uwe

--e324wvcflz4pjyjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpZ780ACgkQj4D7WH0S
/k4xZAgAtfjTKvZT7A4NQhBqkvJ3Oh/IEog67mulCKGQg4I14S3TLgflro4SP/yy
Ok9NOw1Vn3j3SaeaMFYTK5mkJ8Pl3zl8WKMkZwRK0VDFFNM+3RH0T4UdYMzkGGw7
XC0daPY9wUVkAZnnrtimlUmStbsWWa11jGq1yDHeRSypF3U6dBhyEcOFdaC7pnlD
9h5M0F43a/c9H6lRUVWguiN2egwEtvJtzQzQmW+r1+5I4zUanpbR5xP6gGhYcnPz
HF9zOCNiqJV0BiUdzTFh1cFZyHdMTktzpDmWvPm3kmGSetsOtzLp6y2rEXxx6r1w
X8sGDrKRln9uoLX3A9H0jCz8WLXAoQ==
=wy4O
-----END PGP SIGNATURE-----

--e324wvcflz4pjyjc--
