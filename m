Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747165;
	b=HsVTbdzg/9e1jU5IU0nKjJ5tkLEXTDgStrj/jnCFvhbziGnvh55qEWuUFOt4gIguyYtZ
	 OhMCOti7slI4Ej5nrTaMD1EYVP4AtMwY8ZXMh1yvQpdCVZgvJr3j+IyfyXCFqJBJSUosa
	 M977lh8A6UeyVYHbCtjRO1+EBPqcHcfEnoAsspSccD8BSGP/WRB6ws1TEcsrG7mdPkIt1
	 rDN6tN/tB1RUT+bUM2zXp6zduIyzaQxxMVLZFX3WWnfVuTKXZk6iLT57J/kRh+kxnLo5b
	 +DposCfoVXBF3QkJPHsy52voK8wHCv/EmQuN49o868nrUJcqZ9TZvdCWcSzIST89xVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
	b=30jbbmyFJ7mlL7UqXlXLBZt0T9zqIFVhdsCh7pG2A/Lhen46bqmBRwhRjdfIovgASWok
	 ZXKdMv0iAlDS9MFHvtAb3JtjadUkV+zT0pTdc98ETXYrzJlRitpIcIbNnnpKox/KeIkvs
	 yOMte2vYavpQsqwYnbRQsIjxVPYoGzW9ueXiHyfV/cBS2ga3bkIXTEVMat99b12WMidV6
	 JePq8TSsFkYUOifILlon5SW3Z2Rb5NP8WWUqBKDq6Lhu8urhymJ/LoPPMXAy4Aq0WXmzk
	 Ax/M6OakPqQJJsqUreWbmzRvl1gUFSQtUXmJnZucCLo4i+cG3zIZdgTDU/lZt57htlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V1nv8nw7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F740606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F740606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V1nv8nw7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20c923847so5727625e9.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792747163; x=1793351963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=V1nv8nw7Es+VgKoDXVxc2xoowsXtxzg4VOgfLThVNmD+M2TSPogeK49BjUSvA0Jv5L
         Pv5BHJpFeO6BLUSu7GXLvDraEV8/PDb2l8Z4ioMuWUrwJZw8TVg/h1PIOwJPQALK4Z6Q
         wQrror1EM3CQSHD1uXgcCPYJVlXMhWwOVV+FrwEnZ1Hn4TR901b1o34mlK8lGL4AwGy3
         8O7/XatVkZEvCQl+BZMQUso7fnujZsgo8hBG+CTHd4zunGhpg8sWGbRY0cOYIgGNraon
         zJyWaDdIaMKhmREnscAlUZ77uISpNRcd9G5GLS8LRmwPpAFazvOUpMmuWLXZk5Bq+6mk
         mtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747163; x=1793351963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=ZohKoPxS/awab7wiqoFw3AlWtrNJWQwxdiZ+sNeXh9yJ0mxBcBHpADQO/N3jwqSf1p
         rr5QGruBjxQQyRvY/FdwmisU/tQ7pA7sFNoQMqJ+YCMJFpXG8C9gTfodwED7CYNEwOg/
         FxD7CwMcSEUq6x1hEA/TRR+FNXp0cGhns9eKjBKoM95GsU3VxbQLPek6aA6qkUCZQAvT
         bE1AUMVUASCm5fhvad/DDv+9WPaEhMT587yTTYsg1Ft9zz3JyrEq3tVKXB8dNLD1oHWd
         gICgzgP+VWW/vldikYw+PIX6mWWIUWU+LbnYtv0IcPpOhymndC1jXylmmFv8Vl8sSTmZ
         wTmA==
X-Forwarded-Encrypted: i=1; AKwUvBzicwpxTzF4wC62fqWE/zOfodddYb+WQGpauImWpEhYifUty3V4W7qry/NXcVNncXVFUmOxPGaaQuYC@vger.kernel.org
X-Gm-Message-State: AFq9FYLQhUtU4MFGfv7E36K91jN56H/8cvssYniPUFy2nPk28z9ylyXf
	aCamRDFTQC2ZXJHrTXn7UPoYvsnM71jjBU+895w2zHOjx6xz5JUiQfZYEdDL1LxSYMc=
X-Gm-Gg: AYBFou2Bj5HsCCK/beTMLIJDMS2ln85tDLJrvCynnels8nuatDN/lAkNRGnA4bwWv+C
	VrnlNLauutkkv6PAVqzxJq91+8u0jjzljTNY53CjrJl/kiamaktI4VXy6L3GUhwEP4f5N169p9v
	kV8Po2t89cM8CZrzzY+4FEVZBLUJggrQUUCo4q3ifutSpI6DyiOxMOMcsmb4uvUPl/KOWuOfPea
	Ylcn6yXieHPnQu6seZpZbagJLxK3uIOVQoE0q6mtvOUQKYibVkrvAxuK1AzBhNdb+9bQsG2UQ3H
	iRvh8PeV8GBBXaZ88LbkGgCjJWV9oPLhK4msEQx57m5yA+QJyRyBfNUFHsT0HPFP9zPibY0hLIz
	SeBhbvoqTcGVjLxv0D0heET/pAzlJUNLP9i5LAb9EW3joUtlLoHcjpE8iBvIV7hlP2GzjN9UCT9
	PLgzcm6bKvsg1LDhv6MVpH0XvZx9vVRuIguT7X2Hosbonx1EHM2mWDfBt6XenWUeaNf902UnDZc
	pMQNiwZM4FkYJBneqfZ6j9yphDFvoFRmznW+0F5jQCmWbhHigIhhLUai74sFMGTXa1D64ge80mV
	U9G6OE6h1mrxGRBsnmkZyXJtSY97MyQUpKS7QGSKIoU=
X-Received: by 2002:a05:600c:8712:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a211cd5eb3mr28983755e9.7.1792747162862;
        Fri, 23 Oct 2026 02:19:22 -0700 (PDT)
Received: from localhost (p200300f65f19a9045816c66224fa2d94.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5816:c662:24fa:2d94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a211ba3e22sm53005535e9.8.2026.10.23.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:19:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:19:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
Message-ID: <atsmP_5sX5RFunft@monoceros>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
 <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="covttcbalrymohfa"
Content-Disposition: inline
In-Reply-To: <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>


--covttcbalrymohfa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Thu, Oct 22, 2026 at 03:48:17AM +0800, Han Gao wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> pulls in many unneeded dependencies,
everything it provides that is relevant to your driver should already be
available via <linux/platform_device.h>. So please drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--covttcbalrymohfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrbJpUACgkQj4D7WH0S
/k7J6Af/akzqmN8ibSwrfi12ffHOWdI7Our+3A4vhm7xG5fLhDxm5RVyO9IOnbZF
hEEqQasZCXUckEd3P8maCUNMZrumlljeFYUKxiiGeUptwiJNhDfD5gwgvKN+QznX
WUBMP16Z+bJ04qU+9Jvxwu2AZERVCQgTDx7HM49rEY2meQdARZ+74mmtm7x3AKyE
LAf4maK05HpWCQtSPGWBSz9ZRiv/TrfMYyA43n2Say17TUHYMVEZfRooCn3JlUBB
TybkgcHqyHLbqU2SVAqhlZIuIVWIEQWz1aD92G51OANqUqboJ0wTWbGxYyrQMMd/
VqEBROgHbira21nt4uuVoVmMDk84zQ==
=XQ/k
-----END PGP SIGNATURE-----

--covttcbalrymohfa--
