Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41492414409
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802763; cv=none; b=RaPtsl455h4T7gJkIc2GbMvXAMSdXovnWD7Rsq45Xpp+D1H6qtau/NTHKeMOGjWCJSCqiOfYUs/B1ks8TTIdACSSJjsqfn/3twoT7ZtswawThR4uZYFlnDHFwqSASLtFi0Q+ie6A5R0KFZ0tQNKyM0cG4AscfsXEJsa7Yt0TZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802763; c=relaxed/simple;
	bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTEZXS2EEldiy4G5tVsZI/S3q3uxfTFEHX47LKDvVFh2KNEQARZk4SBPyt1qsUg5Te/Yl/+oscx7a0kNyMR4ztxNt4cLNjKu3Z4UUwcwJdwKQDEDfgAIshy5bGnbL9vEETcICB/eE/dEHbk+AcFXaFRT2InS73dMXSzfaSIRdLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j+pOZ8Mo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j+pOZ8Mo"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b060ec084so1016229f8f.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791802760; x=1792407560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
        b=j+pOZ8MoXvYpknHcu6hOJto/ibdqGyXLUobOIKBi2Kq5YV4XtmTtnmgzNQ92K0Tns2
         YDDVTKcnavWEeZDkbv0qpsat/nMrI0dGmChd3tpsUuz51TjHwzVsKRQG6Fovks7ttErx
         nmCXZQIkSYQGlzuAv6RVlEZ2gxQ5KSQRvWxV6LT76ZAz4enLF/FSxynMhV2Qwo1pTovR
         nTb+3McCaS25H2t9XxeB4ZCmawKpIf0Wsj2/xjntT3MwB7C37asYChGRiaj+r8+7d6Wq
         0NqNWdu/mNEfdLWLSUgs4Z7l563iRm6t8NbNdNx9EsI6FXy7boLYVBHlZi64Dl9+STRq
         KISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802760; x=1792407560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
        b=ors+LrFBOrhON9+z/BJsGETwVPUn2Zojudc/MSS9jVWLOltw6+Wr+efH3ZRAltVkoM
         Uj/JK8KXQXWbATy/1fl43gnZgeK8tcrkzRRWmXgXfpM8JEQKgp4KZJEqLADlmBNpzvWi
         l5VT0Q5YhDWQzhnobdnaJF2hFhWtgU7zDzdFTeuVQNfYVQ/1cd9ZFj6zgUua6VqTB9PQ
         gi+BzznHT1hv4oglcddSAW5h9AoD3vDCggucNNYKC4gY0R9iEZtkS8freKl6LUlmf5PI
         ShupxEknI7hq37MqHiGpP25FzE+y5wochAh7gEJUvAgJaMjoMaWar+6O510Ur9CfSw43
         aZZg==
X-Forwarded-Encrypted: i=1; AKwUvBzYqnr0Kc2+G+1nbFxxEdv9BWaP7flDWJoNHA1SC5PZFdExTlOpBbap678f2sq3sa1sD5RKMHl6eBqD@vger.kernel.org
X-Gm-Message-State: AFq9FYIwZflxDDmzJuwCJR0Zp/v8Q4uIpoYqUhFLS9w95FIk/Rmj/qUu
	uC+wuv+57xq40lh5DDEdUz8u7lR5AI70vQhy2iKxFi6MoNfw+ik88izN5gYKbsDgjcNxf0cNVZw
	om4VP
X-Gm-Gg: AYBFou24XxYLJPf9gNzwrrJd/h/KxSNmmhkZTUW1f8BSXT2OALbhromYiWcWhfSLr3c
	BmYbFaG6/Y1pbxt7puhD9FTy7VnGIX4BtSKwB0hNa6seSrkxoEBAz9NSkWUe+TPwt2rPtriX7iA
	5aGgr6GykgRAtRg+wWavSN/rKDTN2IPPA10LxInB0v2mXpyifFmOWMr9LlagD8lBDBvk+o3JoPL
	1CB1AANOUhm3qn/zW9Kkf8EBEI8Jdb7apccrlEMjskBeQG9zlf6xt44gvEJavHFdAhR5qw3ehg+
	OExUcbBIRY71L6pfZiVbIJyAxHP2ekOe1Ua1ME6eTtuGdt8FHAu1rSN/0akhC4TB/ikBXxM3fIx
	LmKG6QP2SfizTrd3+eYArlLI6dCi3uJis09Cfff0poMF61Jku8JbwMH/cVu0mPEUVDHe6v6rUxA
	LmbTJHOQ6QNRniFUzphsloxKy3FFbrK8KMKyWm8BWjxi3er99g2y4INJ9cbMJEspAVi9HgLUvJu
	BkgAHhb6dIjYXBSXAb4b5nJfpDJwbUJNhMUu1pdqvNNCRR+at45ceDNNrOcacqoJSLxFHkr
X-Received: by 2002:adf:e001:0:20b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48dba7b405bmr11892966f8f.6.1791802760381;
        Mon, 12 Oct 2026 03:59:20 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db9463a9dsm19504613f8f.6.2026.10.12.03.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:59:19 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:59:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, stefandoesinger@gmail.com, 
	robh@kernel.org, krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Message-ID: <asy9K6Gqygrl492D@monoceros>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q2hmm3keht6hv76x"
Content-Disposition: inline
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>


--q2hmm3keht6hv76x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
MIME-Version: 1.0

Hello,

On Sat, Oct 10, 2026 at 01:59:47PM +0100, Navid Ghahremani wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. That header creates a lot of
useless build dependencies. Either rely on <linux/platform_device.h> to
provide of_device_id (preferred), or use <linux/device-id/of.h> if you
want to go full iwyu.

Best regards
Uwe

--q2hmm3keht6hv76x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMvYQACgkQj4D7WH0S
/k5D5gf8CiIw5ZmHa/4qhjWhI9bOHEYttUfLI5E9sTpo3TR8gSP3wq21tpb9ywRb
nvEYlAntKnE5j1YV7okO47JWOPy2FlFSIYfB+bl+MBanR4v7h5vaVIzlFDQvZI3x
4/s9TDLNdORgidiC3wYjnlvk/BYGYeV3Xcz3Edd10vTvXY1nkcWX047ClGlweYLQ
0KRRSVKza1fIczofidCe4h3TDpDFsG65SOK/OfVjl7Ao2wOK/RPk2P++gNgzstkq
7FBEgasH+SDPqmohBCxOC5y+hbfVkRO9TtxPaTtCyPXjy7bo3RVXFSBI/NrgNEoX
lBI6nUELanucYbUs3YpLmyfwX2p/fA==
=QMtx
-----END PGP SIGNATURE-----

--q2hmm3keht6hv76x--
