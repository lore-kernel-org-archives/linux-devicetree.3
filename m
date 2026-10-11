Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6E38C406
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760408; cv=none; b=cqsHiWJhWxAGnfuZ/i1xKPYdijF1dHpnG/IZ0HMP+zFmyaGSUzY1gs/KaSRMUK1uPpn2nSeF+J1h5YdGLz7b1sJ+emcjnlTLtLx7d7DBAnx82lhef57MRm8D3CDoFWanulcngsCstydw/f28382Xr/1+t89rM2nuu9EyDRoHsWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760408; c=relaxed/simple;
	bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFaHzcWiyJ/0q+vga9W7sVyw/OEP7+/2HR/L3eiXwVyrr3WF0UgYzX8LgwiHXkbpVd2ShFim1YKBCbJ8rpmMBveLzE/En4vO39QD8FEXeX9dy/3argqAatmT0DHd/khmsxOOMUy0aDe9ZBJDv44W0V2qSnMS/Jzj9ul9+8y/Wr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QON8AQ/y; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QON8AQ/y"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso9224935e9.3
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760405; x=1792365205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=QON8AQ/y9KiDFNy+It8hlob20YtDNppEISyizRYGEuYW850wo+nChbnur+Em+jCztB
         /cfm0szmZIEThkdWA0vzorgpsLyHphoJCOGuoxSaxkHSTuVsUvYjbHMUvcpF1GSOvHQH
         nHqOxVlwpTfrcZWDu4MicUvoyfJIZki6P55XjhS7hl7Jl2Y8eU8NAkukEuSWMuR6J5LH
         EEwOvkvRhxkR8rbeLvDMsm2dFOwRHKntRAgG4wAZupdVfBeK4nCTZQCp461kYasoojZm
         fq/V4bUMgkGW5XYnKG1N/OjUd3ViOc4KA1gjEfBNP9WJjIr+e0Yah3OW9cSPWGX7OIWt
         IqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760405; x=1792365205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=bdGSC7Zd2pLTGyqZHNnEg/Q4qyU6HzaA4avoq/mKv5l1tgI7Mp8OpSSxJ/k76rYMpJ
         F1oJc3VsJ/h0A976sgr2yqKZ21PHucZvfQqAOVyrGbDsqpUfS5uqBIOev7uT5sO9NYa5
         6cbH4tPxya68xm48GzMaay7UHn/MPGVWWwcOhjMBGXtKD34u6v8ShUc1jJbRJg0OX1vb
         m8/cJcjFWgM+5QSaW0E9Th0h09MtyOJvMqK0GhGJ22uYsBbEug3qgYCXoGAF1HyqVnTp
         BieuNU8V+9tnVviC7+nxOXztGEcJdlGhzWNGXSccJdR46NgSFzgPk0cIxGhWkjmmkLyK
         pTYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6zpsvAxDVwPX/5R2JVwVf+vbMPk4c0m31It9CXmZBVi93ODxV9kDG+1lh24ws77pQgKZk09xwauys@vger.kernel.org
X-Gm-Message-State: AFq9FYI3q6pxsUtzTwTgQdXUCBa4iQawAm1dE4JHTF+wekTkr3jOVjuk
	zUJ4Lwr+QlGZmSWcerjKzhkGIly/XSum6BFEFMzvXiac2OBhxht61zi0giG1nHLUCxM=
X-Gm-Gg: AYBFou1ncQzN/vtngQZlZNs7g+Klvkya3dB7a/ExrUPvnyf2nJZ/EcCr4zJuA4XENn2
	4h20LMiM5SNlznFbgnoQiacbsISGFyIVXW2rkA7cFzY+Rqa15mmptCfVrxjySV/wEmjjYxVRvMA
	Jf2S+Xbk0J1C9EuFxyI4+IlO6GnkBHCTdr5qbe6nZWkTCoIfgiG5/nyWgYl20IkLBSr1dvoPg7l
	SGoWgFH/cwELfrFP9PapKElGwO2yMl0lf/EWQLcMyNIcYhYznY+2vpho8/0XZro9qgRsonT4pJg
	fgMXAkOFHyy+XhnBuVSl/nOwbYoxI7Jll0o2PjUVkP+GiUYLSX80fJV1QdbSiMQ8t23uIfAeRsE
	n9X3N8x/y0VKDszr2staZP4z1H32pIl/7K0Fa0XPqnLX0JbcIVLfI8HoqJrupYcTJRJ8z/hVZz1
	ICPfJ5aZolcFgmeJJkBkbFCnmjKmtgS4BYoM9yY45z4HB28p10FqsZlsCvwogqSVt0xr5+NTWz0
	gw=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr165188775e9.20.1791760404876;
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea1021sm222382515e9.10.2026.10.11.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:13:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
Message-ID: <aswXwdgpWTVoItYy@monoceros>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qngddyqnkwhditii"
Content-Disposition: inline
In-Reply-To: <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>


--qngddyqnkwhditii
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 10:48:34PM +0700, Nguyen Minh Tien wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the inclusion of <linux/mod_devicetable.h> which does more harm
than good.

If you really want an include for of_device_id, use
<linux/device-id/of.h>

Best regards
Uwe

--qngddyqnkwhditii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMGBAACgkQj4D7WH0S
/k5tCggArhjqsIMxWZn1mdwNpWwWCgDbuq6GCyhWvxK6/4SoEqOcbECNykQJkcqM
gvBI7Zcz8K+t3TTUvkpf5ten3RucpB85MIpw2zPZyT7UNFTU4XpVJ9KXFNT6G57g
GknahtuMpdBREceO6pO3vd/yn8VMXV8clPTPXpgNywW5t6z3QOzEz0IcrZMJb8V6
cSCkPm8gLqPQcJsxc5Jwdjzt/xaeUIEVlS9TgyVY6BrcotwmfGeJsCPubGsR35Dv
rCHn8rkKSLOaUBG2rAWF26nch4TvC8JDsPDVi5/HJBfJhBqHK5hOi/Nri4WSmi8T
kVp10DCvNgThgd+VEI82L4IL+a9Oig==
=gnsw
-----END PGP SIGNATURE-----

--qngddyqnkwhditii--
