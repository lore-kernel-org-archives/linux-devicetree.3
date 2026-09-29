Received: from mail-wr2-f23.google.com (mail-wr2-f23.google.com [74.125.225.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08121A6824
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672773; cv=none; b=QvDfVK6KQPtPGUhllgI7eNZZmoATBafptBhrCa5CUvfJZ4ikvYRMKNy9AImqhXBSwlCxAb2wWUptwvQWepBXsGNGMOJNMAEKY4iXwMCdhrC9MTViMS+O1lydEPJ2a/m1PwxmP8B2BdkzoaP9Og/AkVmfUVoASQ7PnN71WTJvvcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672773; c=relaxed/simple;
	bh=tXJ+qY81QYX6ntiL17hDKcWY+jDR6CzEofjkGotGB90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4XPm44+ri7lKDVkwoEXGiTA7i8JRbiQ1ne8gJd3TOWD90kqIwk98mFLf4bj9Cd7o1ODpnqz3x0W+SOZspfPlkHVpyUL/gsCkQYB97A1Zc9JBixyZp9Fu5AuOhZWW/okia1sWFYNElaHucDdrBYaAOuqZdTC2qNOxa9ktda/XM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSNpgtnO; arc=none smtp.client-ip=74.125.225.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSNpgtnO"
Received: by mail-wr2-f23.google.com with SMTP id ffacd0b85a97d-4888598e4f9so2524844f8f.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672769; x=1791277569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=DSNpgtnOd5FV31vC8ZOmXn+8R0a9zXQAz+jVnfMhjmoh7Hs9z0pQo7KIOulBI9Rl+Q
         ig1KgCzTuj3F2GoQ9+8KgC+ep7ywewlNc8wajiYE88md8LgJ8FBBsWaGbv31nSk/ZBT6
         sQo2uhKeTL1QjoLi3nc2VOfVJUiQAaT8B/AW5DuXIvQCf6ICemg/VFFjD6RusGRYOMyN
         GdiDRkjpY/JG1e8w6PmwuZ3ntqwdXX/MFon8eqqOB0kRJ3Uhxnnsn1ZzpI2u8a4aN2XQ
         npypCMWc8XqiC0vSH4beQZ38GWb3pdJ6wuGBNaMdFbKsEqNeSNFyZnTOdWcwEtvTW8Wt
         QF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672769; x=1791277569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=gFfxaoUrfK+Ac8jTahBpFbwxIEwZn4Ze6Z5Gbc8VQq4gy0ItjD3/+3CWJVVxd1aTsI
         ECcAzEnsBX4DfkeUwQoEIigIYdl4A8ufemcUa3iO/XISrCZ2PZI1kUZK8sSzk02BcrYH
         gZFZefdOSx9YE6Qx672gFiLgECJJh7uA3ZB79mAXBpgbbNHL0gpPl4UuRCmDUxmooG1Y
         zawD/pHbgTuwyqEdW+J1SJr/RKj+acRMOLXEJhUdwsDc+fhsfVd1UuMNngfe+qs0eCeM
         wcCIlPiFe3nHjOcUAVHcygYOzmmxufMEiOCFbdS6ydriWGmFcxiqDjd0aQJq9ktCijJy
         m5UA==
X-Forwarded-Encrypted: i=1; AKwUvBzgObrZtKjdm6UM5xl0gHkiLMiJmE2T6vyDB6RIKxgNR4WyNFZ7h1QsrxoUOOsfWhTLPnBX160r2n04@vger.kernel.org
X-Gm-Message-State: AFuF++kciUIcIOV9yXWKSPB3JvAYxPXeBLDx2LUYEt3nyfTCJs2lWo0g
	nPN7b7WLkms30w3lJyyzegkHOp+wkWGMMNmrYO9Eot1D/nnIubZ4wFYJ64qAmitoTa4=
X-Gm-Gg: AYBFou1igbPNp78r+/z+I3gM3aJMwGO8hVP7kb2oEhb5eTuyojmbXJH8vPlXuQ5Q2uU
	Cy7VDcye2ikf2jC68KnT4EYxQiV2Rp4KaJsrsQLK4e46M5HY+nnLt1wBc7MIfNYowmDIe1WQafx
	nR+wa3c+7kPD+F+MGVYGCCjTJyCS9nZzsCiLZof91WTz5M3AnXTr2Evw+Y4sMsDensFTtH+kgcG
	OxFMg/ZkDErdQDiuldFoh3XVuCeu0XbZ1vCEx/anBl1g7jb231n0IA1OMMufk1e7Z/pVJvvZMr4
	tB+8Ek1XnpSaJxOpkDi4icxO2kbN5M6oGZKgk360B3CDc4knkzL8PAMXVCfQib/pBWl85haTw6s
	isvVMkkYvDd5u0m96QMOarXM1fYq1bLyzsae8Yd+l9q0+7hAXUusDtxgk7Y842tEHaSYqPMp/Xw
	hz6lnFrr7K4a4+SFArCXNkDBhSpvXUVO/hnRuGY2k1/R0PbY7VQVa1xzTvnSXLsniC6dWxl21II
	/6LTrsZwKKm/AHr8+3ERP1bl0jya4LANSh0DxGjG/7bC1E8DZyC5JpCT/7WzbOLx2sTsJNc8elV
	/d4GAZ/CWst7V6o7ibMAcXYLS1CR
X-Received: by 2002:a05:600c:314f:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-49fe66ca9e5mr261828235e9.3.1790672768454;
        Tue, 29 Sep 2026 02:06:08 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm65937205e9.11.2026.09.29.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:06:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:06:05 +0200
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <art_faJ7Zx5CaWfW@Lord-Beerus.station>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
 <20260929-logical-fanatic-quail-2ff20b@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-logical-fanatic-quail-2ff20b@quoll>

On Tue, Sep 29, 2026 at 10:49:08AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Sep 27, 2026 at 02:46:16PM +0200, Stefano Radaelli wrote:
> >  
> > -      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
> > -        items:
> > -          - const: variscite,mx6ulconcerto
> > -          - const: variscite,var-som-imx6ul
> > -          - const: fsl,imx6ul
> > +      - description: i.MX6UL Variscite VAR-SOM-6UL and DART-6UL Boards
> > +        oneOf:
> 
> Please do not introduce own style.
> 
> > +          - items:
> > +              - enum:
> > +                  - variscite,mx6ulconcerto
> > +                  - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto-board
> 
> "board" is redundant
> 

Thank you for the review.
I will keep the existing Concerto binding entries separate, use the
surrounding items/enum style, and drop the redundant -board suffix.

> Also, look at other examples here, like Toradex. The actual variant
> should be the last.
> 

Could you clarify what you mean by “the actual variant should be the last”?
For a board with eMMC, SD card and WM8731 mounted on SOM, would you prefer
variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto or
variscite,var-som-imx6ul-concerto-emmc-sd-card-wm8731?
I had used the former ordering following examples such as
toradex,colibri-imx6ull-emmc-aster. (som - som variants - carrier)

Thank you!
Best Regards,
Stefano
