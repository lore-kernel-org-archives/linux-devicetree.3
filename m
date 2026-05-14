Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976BA39F17E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792065; cv=none; b=Rp92FdvqviMxl6GvTxYT4vRyKn8fOz8OyVA77KVn4HiGMT5nrOd68fLpOMJT/l3FX59XnmKExJsRU4Gvl7xPFAcxXTVHTsby7S0bANv4kg7sE4CalAqGyHhWwbkGglZbW61Lg0uFUEfmYuI2xNPA0As2pNkjbh+xFEMxO4ffL90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792065; c=relaxed/simple;
	bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rtjrNNfjefpP6XNhEWvl1XP7Ly1T/fobYizX4j9yQ8L4pm04K+0zXyeSQquM0D/kdL2O3+uvLB4m/m+NOHXMS0spEufv3jJOtSsidBUY0cfii15seVLy9VLhSn+QuJnCILCEyimlhBwirF0ideidqGUkKPNWyI5XkoaaG/EBbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pHykAc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pHykAc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so68628495e9.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778792063; x=1779396863; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
        b=C7pHykAcpNNaBjN4JX12Q5/W5zNGlY6c75d/0uhrvOC5t/td5i224kW4yaTZtBtyiT
         DKEQKZV+C+mSzuISCIYZUF+BpvQ/M8ZtO54y0NwKHQvktfqgW9NAeMbd+3jzoWUmYfkZ
         b6GrRmh9j4zye2/cPKdX0pk3TgV3VhGDXpw1HuYXu07+FoE1fKKpeMrH4j/AAswLEMUX
         VGUPB3r7+pWPW5epjFZQtUVYLg2i2FcAWvRtLTU50co38Uil5k0bipni2j6jbF2GfxYe
         4QUellepL7nl26sCFeLyeInsCada1EdvUV/XOLodBrfCjjh4HFYjKuZiKDVj6zLJD5NX
         idnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778792063; x=1779396863;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
        b=HIiVQ5XHZ1Kd4k9Zx4UEvdEYdHwgnOSaPqA3h44fMbHi07VeXFslFP5f7IZ8ReZuXr
         3Xls3VsvkyZLGYSAI+LgUexNEgWLJ97TTFFV0ULWLP1Zu3FERGL56THfNee06vaJaUeR
         3maC7RJSVI2mbpqzhbeePP4ZFd3PqY47svJA8tqvEFrARFkvlRxDtHE4ohOlsC4c0iFy
         Ba1FUuFi7B4BKw7MvPaAtpKOGyBpsu2/ZR55ipEJN90C9usVdtK3z9j9eYjhmi6CFlK2
         mvsUWfctywsISH+8G+qSkQFs1B+y9xZTW0KwbWaWzNG7ZmZ7bAVAPiGQC88wrnZfTUOf
         41Vw==
X-Forwarded-Encrypted: i=1; AFNElJ+Rv5EI9v1tvR0lgxlmfT1TaMc2hMKWd8EyGP2I2CvKVqdhOfTdU3OnNx96GAgrQ7drE1GZu/MxpkBI@vger.kernel.org
X-Gm-Message-State: AOJu0YytheHsb+24EGvDcrfcHP1QSq0P39MHOrRVljweFUHEVsh1yu++
	2+OUEy3uWSrd6MLEpOcWdT36fFRp6EWlkBOF4pQCKAu4QteImbFTbuaL
X-Gm-Gg: Acq92OEYAfvPb+CGnpxQjmAvYS3gY1x9VQ10l1DnJ8adcFU+vNHCwVDNWmYVmCs852p
	KJVX/iomlrZnsHF6VFUg36UMA2ONFOEiX97KTUtYIBz8u/Wrvxcy0m+/nf7R5sNg0Ir34J1AxAe
	ezDFwdaQkQT9pKXHM6bkbxNaCwuLdGaFo2yb6CraRGWMnmMmt+VKMu0oy5dLuUZOrQMAIb7eUfi
	SeSP0st99p3fb+MO3V76DVpGqwpEdXUmroU6Or+mvf6+Wm17dc8wayzEgs2TgZVozT2xS5jltne
	EX5syOuB2WxygMVfEvRjd6UQoyjwFqonUBGAH2c3nxUb2w+MHXk8yTSjI/LGCLGUW46JkcqlDIi
	GeNicp3wv6AUMF/yCBTa6rJolk0yHHsCVEadKAnzSFIDSlrwxNWYrZPGTaS8M+hhiE9BwXGEu3r
	FG6/v0W9HfjYWTCWcS/gGpG0Fg68Di+/qTXW13HWS3utN+gA==
X-Received: by 2002:a05:600c:6995:b0:489:1f97:6b1d with SMTP id 5b1f17b1804b1-48fe6322219mr11555345e9.28.1778792062912;
        Thu, 14 May 2026 13:54:22 -0700 (PDT)
Received: from strix.localnet ([197.250.51.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53767ecsm14608105e9.10.2026.05.14.13.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:54:21 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock and reset
 bindings.
Date: Thu, 14 May 2026 23:54:08 +0300
Message-ID: <5993526.DvuYhMxLoT@strix>
In-Reply-To: <20260512-musket-gaffe-376f0450a610@spud>
References:
 <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
 <20260512-musket-gaffe-376f0450a610@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6267680.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6267680.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Thu, 14 May 2026 23:54:08 +0300
Message-ID: <5993526.DvuYhMxLoT@strix>
In-Reply-To: <20260512-musket-gaffe-376f0450a610@spud>
MIME-Version: 1.0

Am Dienstag, 12. Mai 2026, 20:02:03 Ostafrikanische Zeit schrieben Sie:
> Unless you want to model top + matrix as a single node with two register
> regions, then list it all. Hiding the relationships is ill-advised IMO.

I actually like the idea of modeling it as a single node. I'll give it a try.
--nextPart6267680.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoGNnAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiz5AQAIUbXFrbsjS/R0yXIQdA
b1difyWEbPGIi5HfSb1sf542X+XVqCXHizeLtRKZlWwCyj0sk9jpqYoRVia5j6dF
ybEknbcJ9zAS2119flV9HxmkGicslIwemmhu+gwZfN/isfPCu4qvc1Ka1Qp9Q96B
suf9ksGMyQw3RQ8QFFymslUufSQDTmkZNZNREBUaUGrlJh0bu6Mm1C3VNtmEur+5
6iHFmf9W1oGmxl9GPVygMFbt3agnG60QySBNj8YPpiBu0ga/9a1ljEszdQc+CgQz
Rqq3nF6yoFZjJpIAfFzkmfi264LwqW3GQigKv6399wxlyVWCrwcH+d64yZwpuFM6
lU0rCRX5D3LpehfKfgrPUtGLOTyW3/x26tTWGKooWKJf9e3+AdjOZMlsa464R2pW
rElZEhBYB7wT5NHyr/zpQIje/3PNGMd9UvoggGsS+rMx2/5BrSOlFGGf7kKhquUk
aF6IV/9pxSZfHJ7v/HYX6NnoBT9L+FtK6bHtX0rgNP65fI9v4kRN4Lj4JkI9Nsa9
eZTciGlEz61crCNgczdNgfxhzvKC9RiJtjHHX9iD/wvLVyZhf5B5BcTdu2liw1EP
TnLsYySz/XcMP3XIlZmQg4eB+oeAy1FgIG3JOIW8nBrtkepBtJyKiBQVvz85tU42
G2m9j2RBmGrgURCqe8LoW8J6
=xlqn
-----END PGP SIGNATURE-----

--nextPart6267680.lOV4Wx5bFT--



