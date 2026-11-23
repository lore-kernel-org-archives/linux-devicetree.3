Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425316;
	b=08tWZUWnCksZNFoioReeALsmIBiJuqjmuhleRjqlTjahU5rl4UvBJVFsuvR0tt0GzMrE
	 o3q5GF9INoTaBGZtcPEhrOvMpKZX2uzTOvkWqXV4ZhgW+O0DMOxLYk7M/R3bHcnUV0Iie
	 029VQKTERKlkbk1RSkYt105AlaQqiWYVVTmO00gnAOV1Lf393oI2wqGFI1VQxkLqAFtlv
	 8WJSox5uL/gQBTE1N04GcNfYkxtEYzlJi9ZkrkNQl27v15jK7EovNMD9yzpnLCLxqvVj6
	 Kj87aJaWAY5BKdqjldIVb/Y5I92KgkjDxHAI2nGUBdh4gfMayWjc8BK6aNT0oPlSoxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
	b=MD0mrBdrtLYdGO2cb+ucWOEOmwV00rmCF8WsypqpO94UgxYRmeDqfzHO9Zl2Ym0o6CZJ
	 Quo9OPC0G82Q11ChrrFDaIdi3scTPzRGn/IfdBAZUVS3ivcnAoEnMl6DpxDlbnh8bMhZo
	 ZvZr1zY/vxU8vAt/tVggZV+p0xh410A7JcENRTg56MmCniyZFy+/bXajgQgTZazQ0Brv6
	 y4iINuSsKhs1llZ8Pck5g9rqueZV3mwDDPxASCRMJ4li27WpT5anEybMyY4JScQ0mqoNM
	 6c56GV4siv2AeR1TaBwqC7FZXJyKTvkXkfHWL2SMGF+ga15DwyKbNsa6ZLbM6ljFA2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="LZ/loZX2";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB872606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB872606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LZ/loZX2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28469165e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425314; x=1796030114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
        b=LZ/loZX2sGBA1LmOAVWd0NM0Jg/udrTxAoESEXHdSAVToxI9PS4GDnOzF8cew+ac9L
         8u17WQbFu2KSI1v/6Vq7nAzhJUAZQG1KBK+a/aIo+lO+dIpTaufAFNuLSkh5k41ZQ/Di
         JJ0QHMCoP935ekri9cDlNpcOjPS+UQhbauqZbL7/0HXWPIEBiyItfVZt3Co7f+oNypJz
         lai1iKKFLh7mr/HYmtX055V+qR4yKJuRbbeD82cSzFQFaCN9iMhv4EIDdo3v0c3H063Z
         xgyiU1sxfpt7xk1unZ7VQbIv6bHA8GI0WtqS5mjBxFtGSmvWYqzcnwtOyxqgQYU/ngiA
         9/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425314; x=1796030114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
        b=sEfkuTd7LD6Y9TdIOeC592Fy+WqkwnyOHvtPLTkJ/eDPJcsm98ueoOrWEK0aA3I7zI
         dY0MmKlreiwLjVWjOa7q9Axkkq+RuUyeucuBQSawIa9Z2XZCzDdIzXBd6PFmzTjNLspO
         OA6Fu/S0Vc1TFsmp2+McfivAQ74iqFSwFeb1/4uoGwBzArdN556Hv2ywM/3YsPlJT5bs
         7XezpgUvX1Sb4/h69G6YI4xO5CcNXJuM2D4quh+qwOV6QSQKy1Iu6wcsNnaCAsC5iG41
         Y9dg8tTp1nc7spARdwy801UzhdD+CIZR92azYRZh5WHlVWU+hnqMIUMDq2DlSuxRGgVU
         AqEg==
X-Forwarded-Encrypted: i=1; AL+hErGWO3Vd0bw1EgIenhpv7gWsNguZFvyCnIHmKZEZyFO+EZzXMJd9o6INRpne762uj3hZstlbHnuKU8ND@vger.kernel.org
X-Gm-Message-State: APuU4Z+YZgzRZgjx8J05DIMCZxERB4jSqU9CEVZ+0LBHP8X54/gwxH8Q
	2+Pf0IopNJ17osrZIuINQ1cAnW8SATbCJgwI9robFkeP0j2SWmivlU3MGpgYxnoqmoA=
X-Gm-Gg: AZFdTZfQvH5CFf5xyA50I1zX8IF3SmR3/kpoebniFggTXe8eQI/xDyTVsvNDOA8ZvOK
	grHIo8dfXYLuTVHdPgANzY8Ni6JSofbM1xVuCvnREZXy5ONQMl+MrrMcpRE66Y+F8trvifHFi78
	/37ztIfHNQ+RTV1tnj57LppQ17RcwugWhsnMe4jLOSyjsax4etsiuMZhVn96EzWsCoRBkSvKpnV
	fjmaWMz1OMKP3u/02DztdmYPAK/d3aNmoiW3xZeumhV+WRaeK/pP9pdpyGl2rMBQleifcJYVv48
	ABKktW3ls+z0ePovUcrH/j0QOJEDl396d/0HVFbMJKRM4/6IY0R7ZPscATbgHrvWAxY4wJVooHD
	ZeEFMM35RgJnbfML3IR7m0kjMR8TfxJrV7qvbL7n8F5AYHZlCtEoeaz/OxRpB2TFCZLVmiuQVDs
	5qYhzzF7xuAdT1bUoh3czTOTrpeQ1U3yo+VpxWtqqVOo49XMbHYK/Ie6863duFWQEm8k3y2+S2m
	6Ate88nPTQrptjaqotjQw8BL1WEX+YkcJMy4ELNQa7MrzuNnlTyFLpFDY9b7xzvTKSDCWQVz9Ca
	oiZwL+ieaxrhalWt/nbsdfTVEwBdiu0Suw0fbeoYpC99PJTCjQKJ+F/Ynd5cEbME95mTrlujBZY
	UtnNpE3AMiSJgifl1
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr218391455e9.10.1795425314064;
        Mon, 23 Nov 2026 01:15:14 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm626178365e9.4.2026.11.23.01.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:15:13 -0800 (PST)
Date: Mon, 23 Nov 2026 10:15:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, 
	tan.siewert@9elements.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Message-ID: <awQDxB-09pHSgfJ_@monoceros>
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
 <20261121034053.39878-3-prasanth.padarthi10@gmail.com>
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
	protocol="application/pgp-signature"; boundary="v6s5d2pxosvbykll"
Content-Disposition: inline
In-Reply-To: <20261121034053.39878-3-prasanth.padarthi10@gmail.com>


--v6s5d2pxosvbykll
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:10:53AM +0530, Prasanth Kumar Padarthi wrote:
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/unaligned.h>

<linux/platform_device.h> already provides of_device_id without all the
dependencies that are implied by using <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--v6s5d2pxosvbykll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBB0ACgkQj4D7WH0S
/k7Hxwf9H/8q38Ueri9XT0N4hYnYWo22+INjgZLMlUEbSlxNQBDn1IF2w7mkk8Xv
BdxmX9P9vtKw5T3eYt0Ay8rnTIvrpCTlqxLAdjeAG35Y9i0teVdHBZ2NoruLywJe
o+SMd+vKFQGJIaPZpqZ+8l9UVMX7cw2f63hV8DDB/qOQGLOxUp+8+SMlTSh/0vpb
tdDetsWfXf3zXpUhcdm94FD344QDgGcl4xldzIYrZH3YFr+1yZhRgrSzHEWlg+GK
LazzxZYuxXq1ViTVixTB1tYWNiQjv/4vl/Vwe8zcAcpBwo1usnJXrObYY1gG+00g
g80CYxg/efXxv1fI8Yd2zVP5nAVxKQ==
=C1hc
-----END PGP SIGNATURE-----

--v6s5d2pxosvbykll--
