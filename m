Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61AA1DDC1D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799038; cv=none; b=mmsDpAr7LrgWYTgJYlth8cnXhkYGbJl43nkxDdmyOWDVPB64bW1hX2z5yBgU35cr9HEbKIopgribrNwZZOJ8tegp1itVZ4nRhD6N9Zmfmym2Q/ZfJstUNkQ1r2//KBtkNklOHJEPaH5zNoyBgUl2+WEf+GeGyo9GT8WnQqur0dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799038; c=relaxed/simple;
	bh=9axRLpJPKjzDysIbQ94KaYEF8vGnh/56ahK/E9Z0IAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=drBNPw1PtzzQJtg9ug0r4Ar461JTpOJd1jDVF+gI7YLiHfondME+ttF8ERZmsFxkiQHcDpuIvOC8qvtlQLmKOdIRp3KdPYDl8GYXb+4ojxkjJNLo/fFPrEIp7yXxOx/+VkkOmbAIg8t6a9g6PuSCBZN6bpwpB0AyOvfdVIIA0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxWtOYsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxWtOYsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E95E1F000E9;
	Thu, 18 Jun 2026 16:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781799037;
	bh=3nXZPgulRa4wuuejmJDYrHu4OhbK+RW7DSL0aGmL+m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TxWtOYsJpkUt3HmMDFPjFBq6sPeNt7ZKwBTZIzY7TP3Ke3kHaCrxuSRDGd0TaeZt8
	 ElhKSGkBHcZbRxAUNVsWS/aB0YregJGhoI7zq3NHjGmDnmS70xh/xcMFcO8KoVJLkl
	 y7tMiAa1/tK5WVrQx0UpaLPWybNWD9ziV0LGND+4I25WzMvuApLST6So2/6KIhi3hP
	 SGnnO0d2EiAzMwdl0mrY4RWeyrGhdMOo3Z5BQhYF3IMv8Pd7Nrxj0xVX79rvU76i6/
	 SGs51crktxDsImYiwmo7dG8x2Utx6rwDMdw8fQWj2QWTOs42lwEeK1E3u3ada0xGDb
	 IFmvK99c10QaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: magnetometer: add Melexis
 MLX90393
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikhil Gautam" <nikhilgtr@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618160141.11409-2-nikhilgtr@gmail.com>
References: <20260618160141.11409-1-nikhilgtr@gmail.com>
 <20260618160141.11409-2-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 16:10:36 +0000
Message-Id: <20260618161037.4E95E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new entry for 'MELEXIS MLX90393 MAGNETOMETER DRIVER' in the MAI=
NTAINERS file is inserted out of alphabetical order.
--

commit 756049ed43f6fd027532ae2aea78e2889e87ad8e
Author: Nikhil Gautam <nikhilgtr@gmail.com>

dt-bindings: iio: magnetometer: add Melexis MLX90393
   =20
This commit adds devicetree bindings for the Melexis MLX90393 3-axis
magnetometer and temperature sensor. The initial binding documents the
I2C interface.

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa163..e9ddcd12feb5e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24926,6 +24926,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/magnetometer/ti,tmag5273.yaml
>  F:	drivers/iio/magnetometer/tmag5273.c
> =20
> +MELEXIS MLX90393 MAGNETOMETER DRIVER
> +M:	Nikhil Gautam <nikhilgtr@gmail.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.y=
aml
> +
>  TI TRF7970A NFC DRIVER

[Severity: Low]
This isn't a bug, but should this new entry be placed earlier in the file?=
=20
The MAINTAINERS list is generally sorted alphabetically, and the "MELEXIS"=
=20
driver block is currently being inserted in the "T" section, between=20
"TI TMAG5273" and "TI TRF7970A".

>  M:	Mark Greer <mgreer@animalcreek.com>
>  L:	linux-wireless@vger.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618160141.1140=
9-1-nikhilgtr@gmail.com?part=3D1
