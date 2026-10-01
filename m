Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A84B1260
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845847; cv=none; b=fYAbLZB+A99xd/lH4stZm1n3WbkFvUSevZ/74XhuUA0oLAkVIBuxVoGE0ZHvTEqwy0A3hCYl0oQ2D7sMqvULv7qR9UnWAESuYayJFpTeOrwdKaEgx4iebvZk27rDYs5YB9fyt8t3MjdOR2YnfKPn+Y0YcgZG38KgiXbQnR1TWXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845847; c=relaxed/simple;
	bh=nP4uwT5vKhhI/awkQd5oqbO5S4qnAT6kxAGyn1bp2X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAgD3dwAy8uGGIgI68wextlSmww+y8QRmBwtIEjMBGoSLcwVO+yYGHBV1bZ8p3ptTl/f+zkA/Q0vkZeJYFVofZjAFj/8DHi/VpIG88eswJOUpevgcBj9/VcKeto4XyTUPLEiNOV0YubNPkr+jMGWHz6GAgNAadgkNdYdeUpJX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqkOWjow; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqkOWjow"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso312138966b.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790845844; x=1791450644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UudBeT5MtTtLRJzGKTgVM/EBUgESY13lKxlTXfP+GNo=;
        b=GqkOWjowIRlppQ3QqiiEmrZSBtiu1oj51rCP7w53ipLoSHl5yp0JLSFG6b5zefYHjd
         Avj+0UQ8calMMvNZcDrIFQ2Asi7LAJIf8YcsRsFVUi5SsazmqPY859n5/BbH0i92vUjQ
         cGr2bFsDfReV1O2w2wsYyp1/P7bmtlRYWxpwN3npRb5DgLfA0aJkWjD0D49hDk9qTyFY
         BxUHKCRoxI3COiIEiBySuexVi8p8uLgyyPsWT31FxdHV6C22ODWv+QHH/hWtWMsKBXNs
         jhx4cKRzMw24bHqkxhLk485it7+ifsuCubYzxP40DgiGQe7vbTxMLRKYolQVhnNQZbKJ
         BdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845844; x=1791450644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UudBeT5MtTtLRJzGKTgVM/EBUgESY13lKxlTXfP+GNo=;
        b=wvsacQ9ep3xQYL/itfqh/RseSMwqGWps7pXsphc5+AjZk52OsqbkTlpbk1R7j0f2Pc
         bSOH/abhhi1Ma1+otsFv4xH9rvkAghG4ADiqYpcusNTjIRlE40BCLeDSfHq01zWK5+KK
         mOcc1v6N4Qat8cI/Z734T5G7U293+Xhs2ID+V3je1uJPYyzoTUPmK/xL60mbwNCp9MsO
         zarI6PgXOd8MiMblSAwg03g9qSmfV5B48QUEYaey18WtXbal/RVZ+T5XqE+zNurYQjWN
         L6YukeoTitEsUHBSSmIY8m8KoImJtFhwfauUi+C2DImGvE0zOYLXMxuZdtHrmvTR68S7
         HKJg==
X-Forwarded-Encrypted: i=1; AKwUvBzAZjA2pPOWJSlebVJGTN8hCLteWcncbQyFNCo2UJoa7Atry0y+FDnCXqciKtV2ahz5IXtA9JaSUELF@vger.kernel.org
X-Gm-Message-State: AFuF++nt/6y/E66o1JnxiOOC/cLS7ob5RsprVEQatYU8rbLGxaCWDnBU
	zA5iRIrCmsKh0L2f5SbxV3sr50BLG0zf4YeQ3oyesABwPSUCPmIQGWa/
X-Gm-Gg: AYBFou2o31wEBe1i+wa0kh/7jig7SifzE+rCeKd8oje3PhQ7OBBk/2fd/09W61epUdM
	kZAHzwqyV53noyA1arDdVfwmcAism2VQfCL0uZieqED/CGpL00maaBcijcVXiUzfzNM/je379w0
	YS01lFlqFO/8I4HrX3ihcBZ6/itsTWZzYGFLiDdkj7uuwB3ahcF2waRkaEEaMyGzyaB9yhZwKLA
	Bf60Lw2XTdTtWSBK/UenRJGEg7TjUHiRT7xRXirsu1HKbPt6RE2gMMCXRtVIzPGAWJCHjuvL4DJ
	x0LxksIojM9i9xx7uj9ldnsnYJ5Kq4EoYdJstUB8WlmDbHGfXN+2qPsKTwzUgFhkV46jVN94vmm
	X+5jP0IMWlBsdjxK2MhL/bCu+85K+KUs0w9vBBMVhmcBGGPfTbs7jTNdZjAqyy2U+aGhp+STxvT
	l6cJnTFTP6zeNn81Sy4gVeLTO8Q9k8BmDjpfywTRLq5I9DhmsgMCoC0Ey+FERiCwhj2aQr/QqbR
	slNgcYvaHH4GuwgsvKRrCjnvf3E4s9YlAv6OlLoLLuE5X+gYhO5fUu48CfiIFZs2KqxNLbsp5Uo
	wGSbJ0if3ED23R7Mqbv0kFNVtVnZ
X-Received: by 2002:a17:907:3cca:b0:c29:4cdf:dd70 with SMTP id a640c23a62f3a-c2e23e5d1fcmr349826766b.44.1790845843677;
        Thu, 01 Oct 2026 02:10:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d80d5csm116136266b.51.2026.10.01.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:10:43 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:10:40 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ
 board variants
Message-ID: <ar4jkNZc0eoF-EhL@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
 <20261001-immortal-wild-wallaby-23de50@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-immortal-wild-wallaby-23de50@quoll>

On Thu, Oct 01, 2026 at 10:09:22AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 29, 2026 at 05:17:30PM +0200, Stefano Radaelli wrote:
> > +          - const: variscite,dart-6ul-imx6ulz
> > +          - const: fsl,imx6ull
> > +          - const: fsl,imx6ulz
> 
> Is this the right order? Which one is superset of which?
> 

I followed the compatible order used by the existing i.MX6ULZ EVK
and had also noticed the comment questioning whether `fsl,imx6ull`
should come last.
On review, I agree: i.MX6ULZ is the reduced-feature variant, while
i.MX6ULL is the more general compatible.
We can use `fsl,imx6ulz` followed by `fsl,imx6ull` for the new
Variscite entries. I can also propose a separate patch to update
the existing EVK compatible order to match, what do you think?

Thank you,
Best Regards,
Stefano
