Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A16F57D21B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963638; cv=none; b=AlXUDgab/JJ02sdY+PgpXpldiTTB/P4fRGFMd0pkumKGZvoEGlKII2FxmsJWv7YLKkcXC1oyTxh6biNpeCQDm1/oq7IfM/crG5/MmNhRzKBmfckbF7ls18ZSNeVqT1k1hGKvOxfiY2xPyNgSneh3y5T60HPu32uTMpR7uvugcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963638; c=relaxed/simple;
	bh=f9Y6CM5pe3HK3EjR5tDWDt1T5CXFfS0AlY2DyqM0SwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk0LCnMeIpoiYzDhO6C4exVoOgX9NQUgVcPFxQ0gLNh87pfxvw6cH4jdnZxoAYUz85kbGgB0zCeaaBwzjMKtfR8BDXqwcoZhONrmXwlufcsFnAcClyLK+vJrTxFCLakKZ9Eygat2FUzTAkxEZs/uXGDR1AVU/Ir19Mx0Z9n4gj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d7wRufA4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d7wRufA4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49954b88fffso43838545e9.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788963634; x=1789568434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WwLHQQMSnh/KCTvcN5PJ4rnq4frOJyb3C+XPlurt7uw=;
        b=d7wRufA4TdjMqrq4UJD19dzGMMgG0Vt66cJEVwnA/I5KMXr75RyL1Xxoz0w9CIGaRH
         MuExlzuhWWuG+3XovFiKw23Hl6ZweHzMbQGOo/JM2JGlkFaumrCG8iYrQJnXc4c2R2wU
         GvV233mv+TtMP8ipwo/H60MsEVOMaKN1+pR0BY01GI3moRPYoTUzyJPsENN7tH9H96wU
         Alr1GpH9vvGZACRFW0k9L/I0w1679ZXKx6yxPECvRDvuH3xStudW9zScucIuyKaZHcCz
         zQAbj2ZY2Lr3dRxvTQXiPm69kBsZu449uYPfX/9q7ygI1RVjVSvYdA3Dv3Ko1gAmhRzI
         Y9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963634; x=1789568434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwLHQQMSnh/KCTvcN5PJ4rnq4frOJyb3C+XPlurt7uw=;
        b=eFQ8HEKzRUrzigIS69qS2gZuS7E8Wc6V+QzeybCj9qQ5LgYCNfSpw9leJX1jBsNazD
         V1oSGUG8IAVK9bXdd+V6VdVS8ziZhut3uM3g5x6N4MvOkRHoN9iQ+hArhOSH/FbSPWqx
         k+GrcH0OKzf1l9yJ1Mx3ta235rSdUkblH5cuHwvrLAJpGMrERCaCixNO6DSuTcT9S4Lb
         0sojvANoW3J0vlx/Y1IMfCoPj9Sf8UxMhHP5iriJA8U2Le989Xq+HYplwCn+BWQFmS9x
         ShvCgxB1qoGNNDDsaXx7h54fl02peWfTFIqYbyLjIgF82Vpiz4Yk92daJBtjO8K/9jLn
         mKiw==
X-Forwarded-Encrypted: i=1; AKwUvBx7zHnsoQgh/zMe0U+wDvJioEsgQt7ZzRGpiQRCoV5MkGmzlfBm4/U3OTavtutdlrF2gdYHF/OUKsrc@vger.kernel.org
X-Gm-Message-State: AFuF++lYgM5Uy07ddmBcwFhSG0wqcO5WqLijjLPceUNdz2fduRAq9H7f
	fFAOmTp8EXuO6hLHxwv3+unCMUFf8gx6V17sf1y2LB178xH5rn2IhGBnLY6C2ITSAbc=
X-Gm-Gg: AYBFou2oEDQas+Ny02xA8jmk+BOkOGW+CEitNE2qoz83TZeKbaRY2rP4myhWNtOTYR7
	cpo2tOqPiTgUhAiSYOYEBUC84loXnIZPiFvU1fptQIKSQ6f+HsDnM31OdnSFZbNuMuTOSE5spbY
	bWXRfLvP+8CpiA8DEA7uhVRMI7IE/NZa9NJGFeDg1DIkT61XmS8XDiulxa3xalLy+3VSz03BJfG
	FPWjK0iQvmCv9Xrx4RsXy8alOamLCaydDi2RZ9TDuu3gXAGmeqQh6J53DU1OGrVmzInUPvtZ8VP
	qambf2Yb9a02wUAl7zDvwz+yFdB5vzF7f1DjMpp7E3ZX1IVf5eFZeze6+xH5ptRNLtFjAegjIY8
	xCUJUcBL3mTlV7Sn/QVEAP5W9/heT9mKQjAPSMyVnG8YJYuERk1H2mDW0wQ23Vu6ItKPu4cylS3
	kNwHMoK+zyjGWaP69Id4+QT9y7fJ0S9ixl0/tWJE2Gl32HRyOqEp9efaZXDtxP2hAB0ZjGZhFT+
	yw8ZbVSsVyVarRAw50xq6+/gQ05tTVaYK0OXgZ4/lShK+IB8wW3JFcuf+Cuk8xyM2zGRKdW
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr267545975e9.14.1788963634483;
        Wed, 09 Sep 2026 07:20:34 -0700 (PDT)
Received: from localhost (p200300f65f19a9042846e5e8b4b91e99.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2846:e5e8:b4b9:1e99])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485885bfe14sm44695307f8f.35.2026.09.09.07.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:20:31 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:20:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <treding@nvidia.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] scsi: ufs: tegra: Add Tegra264 UFS host controller
 driver
Message-ID: <aqFqhNA50674GtPo@monoceros>
References: <20260909-tegra264-ufs-v1-0-e4a9831702a0@nvidia.com>
 <20260909-tegra264-ufs-v1-4-e4a9831702a0@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bo2cqm6hlrzg5q2v"
Content-Disposition: inline
In-Reply-To: <20260909-tegra264-ufs-v1-4-e4a9831702a0@nvidia.com>


--bo2cqm6hlrzg5q2v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] scsi: ufs: tegra: Add Tegra264 UFS host controller
 driver
MIME-Version: 1.0

Hello,

On Wed, Sep 09, 2026 at 04:11:22PM +0530, Kartik Rajput wrote:
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/mod_devicetable.h>

Please don't add new instances of includes for
<linux/mod_devicetable.h>.  Either rely on <linux/platform_device.h> to
provide of_device_id (my preferred way), or use <linux/device-id/of.h>
if you want full iwyu.

> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> [...]
> +static const struct of_device_id ufs_tegra_of_match[] = {
> +	{ .compatible = "nvidia,tegra264-ufs", },

No trailing comma before a } please

> +	{}

{ } please (i.e. a space between the braces)

> +};
> +MODULE_DEVICE_TABLE(of, ufs_tegra_of_match);

Best regards
Uwe

--bo2cqm6hlrzg5q2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqhayAACgkQj4D7WH0S
/k687wgArsy0qdFLf679KsDOewkgrobh46ihhNA7b7Crylg9MkryYaiwdB4Qlmjr
3zrv48WR9cTtOUTrHhr9UT/ALUmx3nvAey+m38JCRTyRc1oTnHq8/etl4TcZmW0e
pWh+Rh6NQr6+Eg8k/uKuVMWdJMBIbxVMYfUj9O0zp0++xEmWhskcXKtB1r0QzqYd
rruRMXw68tfK++ui6+jWZwZZLO8GkGC3fiHgrkOpxXJ4+aPDsfQB69M4LBb5T5I1
65NFieoF25WsAUm9WXBbAYZdEP5lC3Hyz4EpdOeYA/f3OARpaYqgTJYYznV+0bC6
oc0+HyZKufdUxpfaO5vmE+USw5UEPw==
=gTRf
-----END PGP SIGNATURE-----

--bo2cqm6hlrzg5q2v--
