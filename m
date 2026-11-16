Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857424;
	b=O2Vft7nJdE50xiroBVoOEJ3tRpv95gDgpiKowE4LqUoW/Fp9m5/K6sDx01eBpsX/zwir
	 WuNRqXVDHhW+4bOsmaEqfxZDMv1jI2uAAOXIqDD03JD9XRIfD5+Pue0E2BWQCreoDas06
	 OXunCPfRmwsylKNricE9flI7eRvjj0yDF/PgDWLrTa+IuNWJi62W/6yP2Z4iY7VxNXtGQ
	 9B+SIOOLYwa/Pk2ZEQVQ7ZBuUgEjFyDKeLN+9i1qKRyFBZ52KERBGGtgHodhX3R/3Io7u
	 lH5Vls706d90hSB2wcf9MH3g3IrZVYD3iXZOidx1NwpnwyelL1cL/+EkIbJFLVhW+rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
	b=SByM9O2yU/vzlJjBnsetHTw90d68EM0oO2tAbHqqz00UVG1fc5Ho3NvmsaoonrSCdjpA
	 FR6cWrw/Q1+k4dkaH9RiZUlaKoLiEvA0QWsI2LyN23QDOidBOquqlg22HIC3F81y4HyGl
	 Ax8GjIJXEA76WPLbidKBPsI2YR9qJZ5t1PCsKdMzJjiQQKMjDW487Pdi3+kBLrb4clzV+
	 1d+2SX8+FmSVkwoHl1+LK+Od4Jt9lPtBqH9VzLuGBRkHu+hS584uUs9+mNVtdPtlHKRLP
	 I9A8FkFwd1dfScuLEaUaNDd2WExGaRLcNDF9pvlCYJfWtJbYhmag2H5FH8xYhc8KHRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36541606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 19:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36541606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9496473b511so23634285a.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857423; x=1795462223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=E96WAHkT+sP92lQq8lfU7rpYkYmClz1BkPu1iXTnY8MIB//GemYHc5QdBt1ld40Smy
         acUqrFGAqUxCszfVw+pzy4SnJCfUKiX/A4Q+0gJXedFRj+sYatxoMGnyXMoUK+xgqxjR
         s4wgXwYNtTus15EIP5/qVjorQQoKK/mBth3DTSneehjsfS+0679AFf3GT8wrrI+TLrTG
         S67lGTnC4/NuArZMxsujuqU9DVFtqdgciQWqSBdOrH62D7p7LY8rnKE/kpe2Uczm3HkT
         7VhnHMuAAjm5NWwm6eproW22AIWHmXSjkJumB6jc+PP/hWJaqbaadKSgQjgzEdlnANOm
         VH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857423; x=1795462223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=2fzkiV6iy0EpnkJJ8uV2I2NzY7I7loCMwohjbnfyTof1ZL9JhThmkZNVeTHP62QlVK
         tztfSKNysoPVqLTxcAGpQG/6eJ6aBtSapBI+A3CJrUSe9eqIiiz1/SAP+7uFT2BaHjrE
         IhqouoMInoy7WH7vLfy8/XhyB9hZn7L01wTGbDn8HKapP67haXxvOG/wLO6JqDE0Fsdx
         QGerohUmQ/IlLHM4a80r78tJcuClRMncdKU0mRCq4mBNG6nUlh7MHiSFGtcgCknxloWZ
         ANvvoOhXIhZaJFoftIAZXQuOr++scdoD8QGXtvq7cWdqoFUW6LTb4XJDh0KNxi657529
         iWTA==
X-Forwarded-Encrypted: i=1; AL+hErFW9Ct2joz4BQwY2EY4WSjrdLvpmx6whV+eozDM0nwQ66oiQh754NfFxlPrKlv10UE7W28LON3/MNbq@vger.kernel.org
X-Gm-Message-State: APuU4Z+LET8GqM1GzvOwF+UR3WrkZ0ZWyNH/0pgYP38e90N5Lpi//bqE
	jls1GIdLHpyj6lWmu7rIWCg+E7lHxOKGJehV6H/vtY0k3fkMIiW+tBLj9OGqGQI072A=
X-Gm-Gg: AYBFou0vz3gbjyjipbiWTaMDIgnccmftc2Ps8d3thXW/qO6RWESvSn43u3/dk3DO03W
	99x9VNbZTh1hJWuXSXyy/I9OFNr2EamB8lhmmc8o0sSNVo+bz7W1IloR12W0/fcIO2aevWH/M24
	j8iKmarPQpRQ4zbem8BF+0hfsRVYiDeVBUqHRUNw2ApHvAsW5UIUyOritzGR3UWivagzSW0IHE1
	K0qsX3En9BRZf+/iQywl24AycQ3lTuiyKFM2hoRPeqZ8GGsXANELN5YlDNTqF3T+mS+tBdpq0Dd
	RT0CljSHwuwHxF2vY4fRHOmv0KX4V4f2D8/oX5veN6NJpXHeIUNm8KiUDROCkqHZZBLUsg4bB9M
	0tl/KCMq7GEa7xZXhqdpXGamiGnecT7zR44yjdUMab01hGDHoAMRGfH6WbgP1Se3hSld6RZA60o
	WWGMx0yjsp4f+JBeSisrRYUeTpGgXLMTB+0EGlKGk/AUZQYCxnZxTRRRTeuwzpSbrzokJDlMlRe
	a3IYLTBzQxYd3qikjLXIEjdFM/I1dDkakM2bhXeaTZ6QsZZp+Bj1p5a5hUJRNo+d+E+zvO1vkLM
	0BAEvA==
X-Received: by 2002:a05:620a:4406:b0:949:7058:dbcb with SMTP id af79cd13be357-9498b875510mr84935385a.14.1794857422999;
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94978ae5483sm390417085a.12.2026.11.16.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2PF-0000000AJAU-3HLU;
	Mon, 16 Nov 2026 15:30:21 -0400
Date: Mon, 16 Nov 2026 15:30:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261116193021.GB2452510@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>

On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> I used iommu-map for eDMA, but iommu experts rejected it:
> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> kernel creates is the same kind of DT abuse from over here:"
> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> 
> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> "Thanks Jason for context and detailed arguments. Robin did not chime in
> yet, but from what I understood the DT-child-node approach will be the
> way we should go here.
> 
> I accept above point of view and I am fine with this, thus Vishnu and
> Vikash - please go ahead with DT-child-node solution we had some time ago."
> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> This series adds per-channel DT child node support to fsl-edma and, as a
> prerequisite, introduces a proper bus for DMA channel devices.

To be fair this is discouraged too, now that I've seen 3-4 people
trying to do exactly the same thing I'm not as positive about the
DT-child-node hack.

Can all of you come up with a proposal that doesn't involve hacking up
DT just to unbundle the SIDs?

Jason
