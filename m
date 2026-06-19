Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A7930498E
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877306; cv=none; b=eA4EbZ6qy7cfmRTOYJIuVoNx4WmV+fj3IFt8XCUzkHGfE6KIQyEdeGWTNopxLy/oi4hvBJ3ycoGf/xm4wABGKq+8unUKWf3a40B6Zml+8ZOH0+RHQyY8tQ+QadLnLLhChNoehcLtZWo314mausI+hwtDC73bUl5cUwpU6l60fkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877306; c=relaxed/simple;
	bh=YHho1W7z8mDTSrmx2x2mx+vt0TMFKl8MlygYeiLgLLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6bdO7M5414L2Y6rj8VYiSPuGMk27FB3tdJDk780Pt5aaziQnS/F+Ejq5xpKgSMD1Dc5/O/AEnxBBsYTodgvI/qW8wBf0UUSIn2f+5YPNfaIizGtmVANWgpq01BO9TaUDy32iiS2I4PZMoYO2ZCIn1MZpTksg6Xopk+5hOhU9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jzNybQeo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jzNybQeo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1087450f8f.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781877296; x=1782482096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Xcl53W/d1zCewy2NCxbH3yCSfF9le45zZCAWmtsM2w=;
        b=jzNybQeoap1knJjgxp2o3ucYKDggB4m/UoQm8qZVL+Gc+H+yVlOjVIN/W4lMn0Qlhr
         A0q63yIanBXiGnptkYtFj4AoJQhWQxoEdah+2fN3MHefFJXK2LmoqesFRhVMPgJIrnv8
         oyau+BWLiT4aqcG+8gthnScV52NVuQ2RduF9zDXPe2/44gBF3cZClDmIOryvKhahp4kn
         EAdCpa4iF6cRSXY5VLEeyPSvoEl7UkEJkRslIXhLdwGtTkdNxBk7UQhaymPUu8G21Pzt
         SPA8XMQgUbkUMzvJSW1VSGjTZTLHVt7xVw0k4CmZnLcgIlYFB4amyJnmInapLXCYE/YS
         MWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877296; x=1782482096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xcl53W/d1zCewy2NCxbH3yCSfF9le45zZCAWmtsM2w=;
        b=GbfzoSvQDRYiBuN5XWQ7Jz6dOm3+u5anEUeavre5he6z7UWEBxBSDQOWvK5xSE6HaP
         HRk6h0EPcrU68crhhnzJ6XtTbdTWSC1o8vTvHFz8uEc7Hpqf/s9ALQyducJIiAh2zjzb
         yMPhtzdULd0+7+GXvsCGH1OYFEVpWNSuBAWy0RC1Jlg0qTBk77KQYhCWw7HmgxL0aMwD
         OJk7uGa4kIbfc/3Me/enBIfvSSS+0gqeKV3auMYybWEc9jRz3LZ7/HOitIT5JbJUevYt
         DPoVgDpS+lLhqGNvv35I64JNlgaTGi6/4nbD3EOUs3+A1SmmYikOZSZaQuUrVmo0nzr7
         bLvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8r2foLR+61hPE1MlczaQmtrYyIMBCj4uDlVt3QE9cuoeLuuBOXmdLw0wgniN+WuL6Pay8hqLwzyOkt@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNveCPTvSo8hoaP8yPDFv8dXM/psx4n8ib0PpRskj6Pr837kn
	CkTLslRdLMTTljRGUuqw/AVu5jaS219cdfZOIziJBoeLXZO+MWixt/nTRG/yuy6P5H4=
X-Gm-Gg: AfdE7cnPGADtUEDhZYa/WbPGD8wXsLAOHOMksrQ6l97RSRmiuobMV9H0k2bR/RgjwTE
	GBTrhYrXGdsTid4qK4ThGtjgQh1kHuKFk+YSyUp3x0cQxJLOGQLgy+kgaWlQEhvHVjdXXY/EkQJ
	zOG7iXi6tE8uhXgWwbMfOZE2cgpBacrDhswXfD20JH1vo/hVzH4tWXM6PcACRejT46OwVZ4ubuJ
	z0ODLEo/vzWz1apgYz+bfucWxDHklXTlfDpXhtyYFbvwDpL8X0MPvy2MxOJRQ59rj/R4s2iXDrZ
	4sKBXhAkLjPkZm8Ddu3IYtJ5S7uZvUCEGz+6Qf+aju0wKWO+mUeaQPlV5apTmHQa2QikKj3QqcA
	oOv/T94ofv7+oau4kDPM8i+4MIDmzqKpnF8Gawe7dQhlfTqJy8v4ddXgMW0SrVssG0SIMC9iBhd
	q2vW6NyV1YrmbeD83O+nSd8MDGle0+9vgSLT2UTt4g8TivurKhvsffBkMbIVp0q3mjEQAJoWB9Q
	j4=
X-Received: by 2002:adf:efc7:0:b0:460:e2e:6e2b with SMTP id ffacd0b85a97d-46501d44f6bmr5284891f8f.20.1781877296318;
        Fri, 19 Jun 2026 06:54:56 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650bc423bbsm8215153f8f.28.2026.06.19.06.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:54:55 -0700 (PDT)
Date: Fri, 19 Jun 2026 15:54:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, nuno.sa@analog.com, 
	dlechner@baylibre.com, jic23@kernel.org, jean-baptiste.maneyrol@tdk.com, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, heiko@sntech.de, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, andriy.shevchenko@intel.com, 
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V11 4/9] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
Message-ID: <ajVKBsanqx_2Js4b@monoceros>
References: <20260610175455.19006-1-macroalpha82@gmail.com>
 <20260610175455.19006-5-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fqdmbuvony2rmfoy"
Content-Disposition: inline
In-Reply-To: <20260610175455.19006-5-macroalpha82@gmail.com>


--fqdmbuvony2rmfoy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH V11 4/9] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
MIME-Version: 1.0

Hello,

On Wed, Jun 10, 2026 at 12:54:48PM -0500, Chris Morgan wrote:
> +static const struct spi_device_id inv_icm42607_spi_id_table[] = {
> +	{
> +		.name = "icm42607",
> +		.driver_data = (kernel_ulong_t)&inv_icm42607_hw_data
> +	}, {
> +		.name = "icm42607p",
> +		.driver_data = (kernel_ulong_t)&inv_icm42607p_hw_data
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, inv_icm42607_spi_id_table);

Missing comma after the .driver_data lines.

Best regards
Uwe

--fqdmbuvony2rmfoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo1SisACgkQj4D7WH0S
/k4xngf5AfHOcRigvBqAnsXwv0DuvWRHWEyTHKoVr+MdoJvfw32l9h+n9PyP5GJ0
bQaTazLaUF7bwmmz7OyOXjjAnfgoDG87Aljxk6+ahdxg/pk69KY3jntHRlQsDiJ1
eibfV/XzjGdZ2VfKRPYVRja3Fw8h+3N1nrDDGM5sahOnBHca8nIoxvYbyid4ELmT
Hxr032EqX+p9Ul+wfojNFYGI563rjHf3l3KxPmb7REndTAhYCBIlyD6nbmLp/iHT
iyjkBkMbyQlgiVyRFGtruSO6J02aX+9w+0/YIbG1m5+WYXK87W93DroIeipJI7+O
LmshblDilFCetr1eijawAtkueNnNhg==
=Yazu
-----END PGP SIGNATURE-----

--fqdmbuvony2rmfoy--
