Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209277;
	b=mCGvpHJTnMHrCi/VLX3tEpWuLVwlSNe7FhfSNZFdYwB+ZgogUjrSYfd3fyuNGDWRAIB5
	 UIJwF7ervFBMslEgwJLaNoVzeexRu9tStMKwXD8XKbBZjKm0BcCZKIF/EDtqm2Nwz6N4d
	 SXBxI00KVSXcjMSufWFSrtq+UjtREBpx/cjz2/MmCbeRuxiElP47nuRvIpNQUOqf5UDd9
	 M7xGWg03nyXx2CkWzhSHyT4gou5QVSvWrt6sWMtj+EqPSP9suv1VLnBz4JxWiuYD0QYoh
	 1V0bUcqScVzJMyMFj/R2l8jd60qcsibZvo+VuStlidBYTIYMPUOhcDEHq2SeBFdTlVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E3GSLX6Y3E8KleKfgQiE/C3m6qssnf8TIwA8ymgzC0E=;
	b=L1iJN8YzKya1L63PR/zOFrbpYHD2hyewh55U8dTCTOKVF/U1B2Nk5+XaBFS3tk9IuRSV
	 QP6CDibxY2uihD9h4VM5WV0x6zK5s4QWymTk8ui61r4cj2/9ACiGuCO9ZVgusMYWbyFZ1
	 bhReP/vF5MI6VxIExU13azpk5DC/M7U023jGyfHXNyosTltTyn2VYeSVATTZjtBKVRFEg
	 38u5s3FZ7IhkDEATU5wnzYqsu8mInTrZfTI0aUwVUXh39g0zSEka4sAMMOsKUNsKSgIwa
	 yAL3U4p8944xhgFhBTuggb8HaEfMaZJk2EyJsJgyL0jGud6IBw3eIYpxUIsXUnWnEgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YsJJzZWo;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65C606A331
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 07:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C65C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YsJJzZWo
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f563d1c6so107141f8f.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794209274; x=1794814074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3GSLX6Y3E8KleKfgQiE/C3m6qssnf8TIwA8ymgzC0E=;
        b=YsJJzZWoS0kA6/sx8xVmsiX3lY7D97+g6vmXE2cme19Nw3wx1YjQMQmFrHMzY2lCsM
         XcR7m9yMzZZuswXowtmaazeEYerimzOcQm72n3THFcnV/ZYKFFf6o5aRdPpKzQ84woP1
         gArrQlhv7cd+czWvjDX7vYWw+Iv+PdDhH/iL+9VJJyFGW3b0yz3xrIDgC4vpeLAVcI16
         Nd8eDoPS9WHdAjw//uYc65it8yepxLbt+KEGnULUWt8eOKO3lMN+IEEcxxH521D1/plX
         v8inpkSfVYu6aOmd0+AK7zC7l8ZPue95LJE+R1FOMYQdj9TxgT3YDsVxvTTCMMvK3qRH
         RSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794209274; x=1794814074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3GSLX6Y3E8KleKfgQiE/C3m6qssnf8TIwA8ymgzC0E=;
        b=XwL4vRQjTfKVWHeCQ8rQjOgfLHKsqdougN52JO07lFHUMHqZQF8F5ttPNEj0X962qZ
         CgBiE8RvFRPaxxDq0GrHWmssyECEkC91lb4CUoOMwL+VpZFshh/ZM86ITz5afUspmRt+
         V05vw5/QAWOLErBKQh5nLZPt+CPMS1qHeqWNAffmqCHmDMZVoYhTog1pBQ0c4mOp36zQ
         NnAqiEMZqj15XkZ+RkRJRa4W2UVg6P2jPDq8X4COtv2365xdkhSvlhiYaiN21P93X5Vn
         UtVhdZkmjJSbchFsO9MyO48FHIFTP+3/XFoNGmhoOSe+84gMcIzE/Ho18N3cMj/Wp/bJ
         BqQQ==
X-Forwarded-Encrypted: i=1; AL+hErFvTtf/3BdVXfIwM3/UiXqVHijozjN4QAMvcb+MU133F2JuppUlzREH3KrDo7XNHMbipxu+WTodUzfs@vger.kernel.org
X-Gm-Message-State: APuU4Z+r0vviMkwzPio8V9/0ZxT3cR+sZYnQ9TnQ03Zf4Gl+YPZjUhAC
	/PSIZEVnnGAgV9CU7V0Lr4li2ER+ZgaAAl90KjbRdfKGB6ZfDQ1W10UY6wWalFT8FLQ=
X-Gm-Gg: AYBFou1d1wyLhmuB3eoW0hxkBVzQFLhxBwqZO3OdSh6WwanaOwWABaAhqVvKDh8CpY9
	XvnbPHfUkf2QCX7EPlZhRC94TiYNr4NyWiZIPXy6cLzzXzdcnAnIc20PoVNkcu5EGbIKaJH3ptz
	gmgcuR/s4nQBpO80hmJPMW6hvbXOX9nwaCSIPfAId7lmDDbphfW2zxLLWFvfuz1SrNKDjgNxdgE
	cOah+jOXmMH3DYFzNgLli8XYLQ35zHjZuXNGDIbxES/67MB+ITS+9bPtfrnOsH29WgpX6AFB8HT
	eiJzfgRfkBS0Vm1X/iYES4SEpmFQ7Mps4BQ/fWuRauSrZIarPLnrC5ua7Tdzg1rv39nh2cOwMk+
	t/IQGY9NjoBzxvYqGABu+s1PIYYF6ivxMMRVxpo9ugz2i27Ppu7dSA/h2KCswH8FiFN+NVLxkR3
	QXZYnZZEuyd1qM/P/Mg4GjjK4Nmq0iotb5BxERCeXmOGb9TZTC0GR8D67DLYOMSSnbPkECO3g8l
	hFhcDQR6rzHC4JecL2ODc3h79CQEuNRvnUoFqZdU/zzp6PbiWGT4dgV6je9GQJ3zBuSNYOHbCFd
	5rG1274KpRM5h5CVLNjtxf60gkYk14Ezz28njhUnHt25xRnnko9dtNaZUUQg3RDp/Jr0iy+DvNz
	q3EQJzE/hKT3sy94=
X-Received: by 2002:adf:e18f:0:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-49583ee2222mr5349721f8f.18.1794209273617;
        Sun, 08 Nov 2026 23:27:53 -0800 (PST)
Received: from localhost (p200300f65f19a904b11874a4d8ff21ec.dip0.t-ipconnect.de. [2003:f6:5f19:a904:b118:74a4:d8ff:21ec])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49592f38e55sm8523279f8f.4.2026.11.08.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:27:52 -0800 (PST)
Date: Mon, 9 Nov 2026 08:27:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target
 controller instances
Message-ID: <avF1aKFpDAnJi4A1@monoceros>
References: <20261108212458.275980-1-marvin24@gmx.de>
 <20261108212458.275980-3-marvin24@gmx.de>
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
	protocol="application/pgp-signature"; boundary="fkuwnclrflkupg2u"
Content-Disposition: inline
In-Reply-To: <20261108212458.275980-3-marvin24@gmx.de>


--fkuwnclrflkupg2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target
 controller instances
MIME-Version: 1.0

Hello Marc,

On Sun, Nov 08, 2026 at 10:24:58PM +0100, Marc Dietrich wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> is good enough to provide struct of_device_id.
So please just drop <linux/mod_devicetable.h>. (If you insist on full
IWYU, use <linux/device-id/of.h> instead.)

> [...]
> +static const struct of_device_id tegra_i2c_target_of_match[] = {
> +	{ .compatible = "nvidia,tegra20-i2c-target", },

No trailing , before the closing } please.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tegra_i2c_target_of_match);

Best regards
Uwe

--fkuwnclrflkupg2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrxdfQACgkQj4D7WH0S
/k4pyAf+PbxEvdqRidzu2MVCrCyWxeamOnr6Hnxx7hAjskfnXnOBNqZ10n3JDJ+U
r8iXDCToc1hMFO1yCzKSbqVSYpwzA2BvUAJQ8wngzhF5IMv4bqBBCvl0Ce1NfPSK
xHHV+dFRjZ53sshblFCv1TBnDdovJZ5FLA+q57pP3pDyMnDPJFRcTQj4praFdVQN
GScZLPkhaJye+EdS/X9gFIaxZK2i9E+FONR8OD9pt09l+y+0B/CGwm3M3BsWw02C
bS8D6rJ1FxFFawAvo/38LXSGhShN1Z/xNjeC4015E1Xb2NWTuQgBM44jdQLzixDQ
0j1UHQnBBm1bVAdXXZkIosER7AEa1Q==
=o0wN
-----END PGP SIGNATURE-----

--fkuwnclrflkupg2u--
