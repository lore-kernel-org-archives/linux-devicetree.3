Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503930;
	b=06/4vXRtd1bgR0+U4UjpdKuZG1CKYKiXyo3lzhNJJmfahpr1Jyfi811cyeczXCJVLw5p
	 aLKDKTmv5h9kuFFmPbJhtCNSBge1MJVgNJYbxo+6w5whd4AFQu4IS03NobvRrM036nuYJ
	 2stOjp/I8cH1biPYI7RKFlNTRbHgzUqfiZGyjJYimnPzbrWY27o/7zPwHagzZDhg8HrsE
	 DaaCNJ2BsaUMh2rddjF6yvsjJI6m/DMAg9KmtzACWFahoU0t989RZ3YUtet0Udk2KZHsj
	 O8faxkzBbezfzlaHBSN8lGv9kdUb0EkJHHjSnik4ryLUfUe8+7WVSJmGUAcYrUvADxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
	b=2ngBzQUos1z8gpSoJmJb4dej8wdIj89wxm7twZxJZ88JCUuAeupcGme4N3tz35kFcP5r
	 Mk/MvLeudQdAmIj689O3BgucTQAzr/IbxSfuG3T9VPSShtEbEIc74moJhCTDeQ+8K9eQT
	 7hq6W3DN31X9qIH+4Egv7013IRbZXY/n2PooWWwStW4uYTG1bKuxbFkLA+b45ZruHCJet
	 QEe9rW9ylg4c834OEPe9Bz/MjiEi27LX3ofhmysj0hH27Kh91acH0sAW4165jUN/Z+itW
	 CMhzM8g4vdHIg7co1J7roWUrd6X8ST+MqSx0zwLyYLGzQz+G8xiUkh0l2eDXp3XSVcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kqgoHF2Y;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C3606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475C3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kqgoHF2Y
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso29195375e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795503929; x=1796108729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
        b=kqgoHF2YDALc+f9/RieVMk3nV8G4RNjhav/vx18ZWMiMNQndDTGFtpK7lcTEzu4Lkn
         9D2G5/ZTGnNt+knnZeBE3unSxyw+zi93B1ut2dNz73+v2ADuPbdSWQHuzgkO04DLXmjL
         odO/YveQjmNTTn0H+03xgCdf1ZxUHYInFSTZxJpWBDm3bXL2gxi5n9PTKva+gOc/DtR7
         yntni/qD8wXpjNrB5LrlQnzvYJ4UQla64AG0p/S/lLP9GdKCnl4O7O81qKWlobG7lzKs
         4w6H9D1N6dKGYzVyikfctxOhKpa53SVjdwgzU+e6ys3k2v2tqOTyW+ukNX2O25ez5MGH
         HMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503929; x=1796108729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
        b=U9N4JuGiwSMORNYxcJNLyJCjQsrkIchOCs5Vqm/rFlsHCSccEhj4O0plPFhNOar2pX
         RtnjwcYjr+FLFIHgkZmdzAbBi0gEDG9p4JjAy4d/+TRyKMvyAAjB6p/h5D4GFUrZPd9a
         qgKtC7B9/zgYhJ4Ze5GhCmhtU0MLrgguykJ+6Lm/TLE/24Mi+SfUbx8ntBpvyQRUfAMp
         7lH/w/mVRd2kqdHnRGgT8o+NXQMxQHED0/ffszkxBbah8EtrnTODHVcobs83ztHCN2QQ
         0WtCKRh2A7wYG5Whs/PQFfUgq1ZxQ0hkz1yXMRItyVbHWz5Z8pB/RfDXGSs9laEnNfeU
         Akvw==
X-Forwarded-Encrypted: i=1; AL+hErFBHD6MxhjUhg0onOCyKtmDTCR7gN3Cx1AW+pdsoFyX+7+diMNJLT8yLbyoPM/RTiSclGHyt/cty1Zg@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z+NLwfRSq0+MOV72kvh1XgGkilweaLZekn/mstWjMOV+exxMK
	GscZAZ7/uZgXJXgnPDoZy6QTfMfcyOuyag1AJ3CzAUErvQ4cwibu62FunJxIka3xY5E=
X-Gm-Gg: AZFdTZd57eYL+bcX5JGOCkSgJpL9Pj/xoL/iuQq//sdgX0B4o7xwQWuT95Hn6WBe7O/
	LkEdBT2rpMAjXMO3jXJNrno3iNQstOcoTjxU3vUEVrB5YhUK6Yjkyd8pCj4pnPc4J/15MHb8Hr3
	rj7Hto4K8hD0DwvCQv7E80T2nPJUQdx+965bVbSLgv+xKMAdBY1qtyTdxk3mh0PzhqDukCLttob
	U6rmz0Wcm1DfYXx4cGBKKHf1CiQumDMfqXSYtB6gMO1iyo2d2o8NK6TIG2X5Zwpbf3p28oS477s
	YGfD3HFAXOlYEqQ92HltCiFaw/mO8wfTNDbYlEAryEdDeyqTpKVFsAN6NU48rPyycbidXH1KsmI
	3sbNfxKTO9XWp1FiVAeE+K4yIJd06vpJJFpoGUeP6EJ3VWCdVo9YAN7qUoLTU96koJg14UX/Af9
	ruJqB6IPo1RUJX+OJNfBrtLGt35r+lIzG5v56BoDebL3TqpPSSQbHk5jUroKR6KXZaoxynHeKDC
	Qg73JlGl1gEZLYxEG93MuY57vxTdvGbRkTwSvXUoHTKtgQy134DXZT7C31LOCrJEU4ZpYkhdkEo
	hH/Pt9do7/zjY3LN0B+jd+EmHqd00QMipig=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr324067185e9.29.1795503928774;
        Mon, 23 Nov 2026 23:05:28 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm541592115e9.0.2026.11.23.23.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:05:28 -0800 (PST)
Date: Tue, 24 Nov 2026 08:05:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: filipp.dunsky@gmail.com
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
Message-ID: <awU2-KjkZB7WvqfX@monoceros>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
 <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>
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
	protocol="application/pgp-signature"; boundary="mtdygncuvh4wucsf"
Content-Disposition: inline
In-Reply-To: <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>


--mtdygncuvh4wucsf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
MIME-Version: 1.0

Hello,

On Mon, Nov 23, 2026 at 09:41:35PM +0300, Fil Dunsky via B4 Relay wrote:
> +#include <linux/bits.h>
> +#include <linux/hw_random.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>

Don't add <linux/mod_devicetable.h>. of_device_id is already provided by
<linux/platform_device.h> with less overhead and build dependencies.

> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Best regards
Uwe

--mtdygncuvh4wucsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFNzMACgkQj4D7WH0S
/k4RvAgAkmX1z3ggD4bQYR5QDbQBtW/xgm40V3vJbHo8sFlOzs9OnglLP+iPjhHu
WKQBnpxjsqZITO8X1LvclAujKd6LAR/OEzTxOML37xIoq2uBbct6r4uBVug8dmzk
0TZf3jIxobXh6AuI2klxHcrpbIkEKAJgKFnJNJnRnS2pjQnmue649DpG/SF2PgAm
tIIPrcfWA1AyLg82sa98l6cfBXT/Cj1+457Y+hc7mN9Vs6T+gLTj9cRd+VHY6cW5
FqY3RUG/SNcyRVT4K6C6iR6RS2S41VNXYMCkhMXLIxu7ERVkC/tz2juaeFdUr1Zp
bBg0EPgOCTpcZl2EyaSSblW1G3fqCw==
=IJHG
-----END PGP SIGNATURE-----

--mtdygncuvh4wucsf--
