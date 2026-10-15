Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF10A3B9D8B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045945; cv=none; b=mRNoX7ZjVpJEOeO6PH+B/efj1BR/zCgKW4cwndlu32okPNp/1p8AVdSIYJQjoH7po3zcifgXqRKxpG+soQu1ylke0E9vsyiLLpN5v1exmv111OdxYmVZxZ1FGrwh93JsaAoKe5TIeQGP5otTvjWrFkQHEbTN78UH7lrUSwN0klg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045945; c=relaxed/simple;
	bh=Pcv0I515WGpSBtnjBoWfAF6yKVeQ1TVrn7bNULKjLFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKetIKmvXemkMGQ2q4oYK9PLdHnNwD8Ywxa55YcoSOCjLPGW2nrkrkKaHXHHxXtbwGxsPJyYxXAYW8QGvXTaRWDdOvzaIT/WPHigUstEfnPaRpSjSM60q7H3cHhaJs0pUaEU76NF+XL31i7gwtipVvxN//qa1ucFgw4x8/LWZ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YjYJDQcV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YjYJDQcV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso34563275e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792045942; x=1792650742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=YjYJDQcVyFSw63Fiwwp5obQy3dSQmKLqmiyHcVMkMdDL/JbMLNPRXGrmnpxvq2jluJ
         iLHM6jvqaAXSKQvJdMvJUOeSXzu5QxAS8+kHt+6a/VJyrxqV3sdm2O5PKDEIQoboamlY
         5XPdgqrb7Cc8ZgCighvffnjYYKzoZN+Si0NLc2FWViPNNOntgfevgXkOIz6qy4yTEw10
         97rxNZHcBpSzzzECsyaZcmvmEQZnNNATHFPbz7cWUj6JBZSFfBbqc+pKegd7MEeIxWn6
         7Zmm0xBFczgJCNdudv+OObJT6RnLVWhZlC6Me129u2dnCINDYBgNbNcMzVcMtXF/MzPw
         zYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045942; x=1792650742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=imZB7yE/kULUtJBUQQBCbY09+tLjdoad4a+ftQ5SbyIk29HrNWihW2nHk+BdK7j3m2
         ZVP5Sy0+VvhFaTqT4Ot2r16hymi624RbngNGvFpSV8yn5RlznN1mi/TVp2h65qkc/9m3
         KU2G24FtLBsb9xzzctSCg+6tiAnsGgGAstMHID1zXRk61qIC+g32GYNNWw1sF6TOUuy4
         2z7LhnkmJ+kNYddbcibhomvK296lzwwNqb9VuUJ9eNl1EXh2UM5guphwmReL/xyefFz/
         iRNXKQssFF7elEJR3tF6r1fgTT9ajuQYY/7QTRvUoQqZsEsm2s1/I2uvF7frrQErVBTq
         LXPA==
X-Forwarded-Encrypted: i=1; AKwUvBwADNMAcCLxUWWkAX2y6jd+Tiivy9jX+ZGOql51SzNBxl1GCjdhXKWBGdKav36t4AJpq9FjTo1ikZge@vger.kernel.org
X-Gm-Message-State: AFq9FYKGxLmrWnbv1JqDwIeTGu5Xz418Op3/t8SuvgEqLf0rLCnK4I+8
	k8vjyfIDgr3OgKkUwHXuCSSKw3hjGhDdKWCdQF7sj18Pdjh9YWf2LGnO7GxylhR7X7k=
X-Gm-Gg: AYBFou1PvGsX9FFpf72uVaAxElpPkSEmA6Y3QV/1pKr3H6Q+QnsFMDNyRCw1jM+crya
	JbObE2walixEzE50tou9wEkLrQY+uhZyFd8Lg8JlvPM/Dz9tUkiEgUF35ht/cpdiaU+MHxgxaEc
	sds/02hQiUWBRDhGAX7iEidwWs4qSCnAokCovPnFbChvmcVosAt7mi9l/wwo7FnAxNLxYSRxsdS
	sDuJpOickGdxckP2rqF/5oAYFp88ztxZ9hYqz6r+tEWkJFemIxNPVTkQEEOcURvpbdUDU7RZQ4f
	LB09ez2zJL+AIFxb9PqrfBv+fqeF+2NHz9rnbtpRUbui4MQ73K0eAVZpHb5v/UOspOBLTPk5SEs
	uDVbHce+wpi2dGX5oVuPsgIuh4VNSDk0c4w2hORf/GQ3P8LVAce+KRp/m19W2GHQhbuPrr4jJ+Q
	My5ziRPVtGLNXDjwvvnTgRKoJpCy4cF/rprjeQx5n7UoMrDfJ3ObJ/7a/Q+JD/LxSz4GaX/YyjC
	18vzajcrewGNig=
X-Received: by 2002:a05:600c:46cf:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a18e4a3ac7mr390482335e9.5.1792045942037;
        Wed, 14 Oct 2026 23:32:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1bd9a8a22sm52340755e9.5.2026.10.14.23.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:32:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:32:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atByyAg-c8v_IiAj@monoceros>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2wqyi6vrkxoccpli"
Content-Disposition: inline
In-Reply-To: <20261014074516.240247-3-inochiama@gmail.com>


--2wqyi6vrkxoccpli
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
MIME-Version: 1.0

hello,

On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> pulls in a looot of dependencies this driver
doesn't need. So please drop the latter.

> +static const struct of_device_id sophgo_efuses_of_match[] = {
> +	{ .compatible = "sophgo,sg2044-efuse", },

s/,//

> +	{}

s/{}/{ }/

> +};
> +

Drop this empty line

> +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> +
> +static struct platform_driver sophgo_efuses_driver = {
> +	.driver = {
> +		.name = "sophgo_efuse",
> +		.of_match_table = sophgo_efuses_of_match,
> +	},
> +	.probe = sophgo_efuses_probe,
> +};
> +

and this one, too.

> +module_platform_driver(sophgo_efuses_driver);
> +

Best regards
Uwe

--2wqyi6vrkxoccpli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrQc3AACgkQj4D7WH0S
/k6AXAgAiAV2USgEzQOtvljyc8VbWNuSTr9JlXOIb2McAei2yOxSLalBc1rFQsSh
Z/UTyGYma1+gCD0MWFS1n4maltg+40KzZAzEwnGc7REEcSdkOYpss26bTQRHj4r8
R8DCErxJRfj7+lKnoNtLgK0hz28wPFBIp0YSPyCVkbQJF8N0hl5NhmR6cp+RykDI
u/DFIl+DUwm9fpHVxvTBWsHdigv8+CQ0HKLesoqDLD0RyTFiA3MMqg/g0cyA7qAs
6gqYBGn1ZjmuXbiAdTslU0ASU0cHgIthGhMK1IxTlwrU3MErYG35z24LQGMxeL88
Hz3oIY6HAz9ZzGxGZV38TB+eQMPs6A==
=jQo+
-----END PGP SIGNATURE-----

--2wqyi6vrkxoccpli--
