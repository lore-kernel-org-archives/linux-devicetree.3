Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7533DB308
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276850; cv=none; b=RnK+eg59o6dYRQduUZ0zouaih6zxFM+alZYgZPPtR24pkzjF4eTmY4pjid0MfZk/3nHWJRCix8eMCqC7fyVA76fNOzJPc5V/pyQKov+FPZT61hEWec2pL4raIan6tgJ6Q1Gah+KM4E5ScFzrpySazYLXHQEaeEIiCOaIF4wcSeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276850; c=relaxed/simple;
	bh=mZf398tO0M7pGAFleQA1/zDCux+F0MFC2QT8L3t3rwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsmizns4BWf5RSv5LCUnXCs7TnzfncPTFDZuK0DijhzzFbmL2Fi6t+8Yxm7EQ5ckj+7/19DctzMkFk0NtwuWq7JNK46UlMM8d5hpx1MQSGg7nq0DFHIbzJvz060xow2Ok0YrJNNsiSqlivp0nB95uOsSdoXNx7MjU2Ye8B3ZZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGelq+eF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGelq+eF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-441209fb77eso2943713f8f.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276847; x=1779881647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZf398tO0M7pGAFleQA1/zDCux+F0MFC2QT8L3t3rwk=;
        b=mGelq+eF10VeFQ4swjLpv6f1AzLthYvfWv8m53VQxEOgbkeNSsvQX5dqM5MHSS03X9
         dLK/z728gk02Dbmw8cXWf29NSbiXw4zsiZzPydWAc4gj1LtJFwSX2NnDRhbNATntUky6
         ETqhWkq7evR+BvT3PcXVDfDkCygD4qmuUF9MEMqZxxZ2Q0LGNhdhfRUQeRSZR6G2jE1r
         u0Qikq0UKNGemgFOh8FKlGOs9Q9npIHWtXCVVwXNLcb00VL1a4mFu3j05Hotik8yxZrW
         nRw038+Ct7YhGqOAigrfEL/IscyZOpdizaJ7+Ttnx+NJF+brSBZJbiNdATC8i50Kix+g
         k/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276847; x=1779881647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZf398tO0M7pGAFleQA1/zDCux+F0MFC2QT8L3t3rwk=;
        b=X5y7luYd4K1nmE7LZ4dAbTPq5YeA2VEtHrPPg7NqIqamKwKPhIXrxQAnEFnXgjLBKj
         SfEc3Rjxr7X5gwh5JpeipWEISWPTEU0buWQZqg8vMLXPJoiCCPpgy4QUFRO3zpcsozcC
         QnrCozaVVlYurdIcFd8+Njet70+hYpxiO6fcBRTNaUQlfl3CYPFmHOc1y/Zc0ocV3d7C
         0IsPFQ9Er5T5XtUN9eXNZF1u0J0c29aCpvHK1uh7FwkoHzkuT77ube82OOvvwT6/Puif
         Dl33j4/WPp6a2yblrn2KGaDLuMhYvAsnRNQsQhers4ilnua2gh1RFxd8siZDWfbDaIgK
         6mEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9c+sQd3hn8xxnqa/xS/oCCFCu+fVeXv44z106gvqkJ7Ya+XD3oH36KE++HZXgW+13iPFkXlt+Y4NiY@vger.kernel.org
X-Gm-Message-State: AOJu0YzEHp/WdyBx38r494Vv143F2Kb3uN2d6ZdFy6sCxMI1wAR9ZP0D
	fDmv3DKus+hPCDw+Lmbv68QzNUFQdbj9hAgUXMGklMpsQEjv++1dUOdE
X-Gm-Gg: Acq92OF/bXf55mos+iVgp5HtpFrAzFl1a1p2/+tHZk9MG6IUnCmAATul6JCxAkBnMdf
	q3sPkP4EC9atVstkRUz5OGMNcYGEolx6A94H2fHft6auUEwv2AhcnyQQMqOMATLfCn+hnGo1ucz
	1qecHhh4IBHQnpbTXEVo8WLGKNZwW1426RyKfLtkWH9HmIWF7kJKl0Z1KvHjeLjcL9S5iANpnn2
	eCqvpPxgWM9NaZHfiJQNC2Qwpfjr2rJozxMJS55RKCfs7j05/y4EnMF3xTXMW2Y9PtbwSewnBJY
	dWz1TlStiHT7iaFeViPAs2OsmGCfCxWa4yEZRTgLSEDTiRf75A43uyN+ir3ZlUwAew1M4deLSpD
	jAlUXz1hr6PobnEH+mVLttn4ja2c2l1LYBt3jerxaz8nMA+yC/y/rqer8WpiCqA2tiTWo2DvHRP
	C9/wMx7P431OdRMMf+XI9Yhhv/fXLCAAgv+PK9Dka/C+xY7Tqu5QFSiYo3WvnAshHJsps4p5aeO
	v0nrXsyeQuqpIFHVhK4gzZ0
X-Received: by 2002:a05:6000:1949:b0:45e:7792:6e6d with SMTP id ffacd0b85a97d-45e7792716cmr16972746f8f.13.1779276846874;
        Wed, 20 May 2026 04:34:06 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0f72sm56958318f8f.25.2026.05.20.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:34:04 -0700 (PDT)
Date: Wed, 20 May 2026 13:34:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: tegra: Support IOMMU property for
 Tegra194 QSPI
Message-ID: <ag2bxqDmZsCuOfOJ@orome>
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lkhs67mbj3gk5ko5"
Content-Disposition: inline
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>


--lkhs67mbj3gk5ko5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] spi: dt-bindings: tegra: Support IOMMU property for
 Tegra194 QSPI
MIME-Version: 1.0

On Fri, May 15, 2026 at 03:35:27PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This is supported via an external dma controller

You say this yourself: it's supported via an external controller,
therefore the QSPI controller on Tegra194 (and earlier) does not need
the iommus property because it does not itself perform the DMA.

The GPC DMA has the iommus property, QSPI doesn't need it. This is
different on Tegra234 and later where the QSPI has a built-in DMA
controller and does not rely on GPC DMA any longer.

Thierry

--lkhs67mbj3gk5ko5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoNnCcACgkQ3SOs138+
s6Ee+A//TcqYANcnvRvUOXYnvdCKnAT1aTtAka+rNPvueTfMKdR+PtQxYe8Fx4/n
Yq0iOO4mkYCsMPRpemuE31RDDsUh3MRByyQcpBVa2MgCt0iqTRxV3N7E5hD3OnOv
yFUrnH+lmW7HhOL8m4dDkIr+frii+LMfQpFrIa4jrCJBLkg99gFKSESHlYWQQVt+
/dRje9aazDTmvbzOOSwP4l9RwbNeCLnfHD7ygqCO4nT2rlbWZBo6cURB54Kx/hIS
bS9CrCrYQMpe4HmkPtPGUmhY3enm+RjkNjCswejk2QA8v+gzPlsJwSSfQf6VmfXQ
rr+ZMgTH/agjidFQnWMOZPdyT4PnmHK2BmYkF6kNCWqv2SKNLl1yenGlWrJekzqa
+Ru8z4O2JJ1E6eX4/4tTzBcGVi5gTtHM78nAdGb864vUwAqxh5bFxv2PIb8BmBzo
qzDsJ/dwIQWCdRulC0eD3ZnY3ugVghNPlkufaAM4ix9DvfSpr+ZijpEgU2C5nL2p
oyQ4BaRxAbYi6XL4CwQWPJtuNRQEmN8M86y5t45Dj5i7GskDqrIQmVuI/n/ky4ip
rqC88oHfZ/jC5uOchcXYomZWZvt1GNhU+zDHwZoe0WScrz463Znfx4BLK845QM+H
35MHF4oR8Vpd5s48VinW5a93mbGtLMwWG7lKhsY5vh/W/nfY5kk=
=7UYw
-----END PGP SIGNATURE-----

--lkhs67mbj3gk5ko5--
