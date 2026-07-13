Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A9523C8A0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949526; cv=none; b=AaLOI7hvb1B96EIYXHeXcDp3shjiB0aiE9Cb6b4l256+1tQDHClMq1QDNK5XXY5Bf3vHQ3b/+Vy1cwk8G2PNdHGNdsFFTIY3S8drPoxrb19asZt+SUb0arz+wqv/5R3Z+jV71n8Sq0f2fZISEzNNdMq0aEUQGNOmCnTEs12KxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949526; c=relaxed/simple;
	bh=FP0go0C300hY8/zamc0Nf6T4qT0JVws31uk8TsY9USg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQTfPgcTNT6V10z0wznhFlB5sOVROZrniFk3DMQ12W0jo4n2EekMYCV3aplR9Rm9+3B6h9M1GQY9o8FUhpBpECzwGm4mtHTqwItyZEsNU3I0NI8b/v2kMlcO7fxLkx4HBWx+pn332l3/VJC4+qUY9AReGhkUStMiY3mXE1K6M5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7oMrZJ6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7oMrZJ6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so4630975a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783949523; x=1784554323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l1aqdorv8dNx2XXvch+nk0kVc1JB63/bFJ2ZS4jLGw=;
        b=J7oMrZJ6qwfFtf2rzKtuJvQoyG1Mp/o3Pogql6w7RqLvoe9IsWrvnTCjm5Py8lrlJl
         UJgo4hKfiB+TLbA68fuUTFWkj4TYRF2e+U/zwoOlJ+7qe+55Gg+uqz3FrUjOPDwXz6R0
         kRU76oezcKg9ilpcK5gHn/oc9fxJtD+c0wxEhVbfsNmQts1oQWJjfAt7oqZYXmyFoaAZ
         lWkWcHbPgkgqH5FzqrfD80iV39wAO5oZTKYFeLJbed/gko/3UYRs+I0rdAEQAjv6b0h+
         fNFKU6dY4YgKNAV4j0vP1tqryI1rIC/mo2wHQRgL8BZegEO6nwovMoIwFj7XhxXoxiC9
         VImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783949523; x=1784554323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l1aqdorv8dNx2XXvch+nk0kVc1JB63/bFJ2ZS4jLGw=;
        b=DKjIR8zvPpx04kQaFTKuEXXHQ53Th2j9BdHedZw98KADnLbeVJkjOiEiR7SQ0o4Sks
         6rBAVcvaZ0iibJ44a3E1AszlTL5fs1CT2DI/ZKYXlUGDFy+D2EiQ01odItM6gaW4+4U6
         YKevMdzdrU5IEVsUrHUh/07/NarGaspL2I6pSuMGEDvVjXYlzy8WWw6iUxo+wpfqMN2g
         F2QKV0MtpoEYjYAM3OuXrTymrMUzgaUOYurjEqPFKgohqT6lsgk2sLVdEqgaFfXuh+3W
         gZ1K0yuh3d1oYeuClbNsXfgDohPf+W+hmXfupjPBtLszgTGm8sJJYrA4mDexTauTingN
         t39A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0L3tlYOOmpiXJx0QeSFInkmORE3VNWAtoJvrAydSu6GsoxVsZDspck3K5eigY1gvCSoOgK1PWAc1R@vger.kernel.org
X-Gm-Message-State: AOJu0YwlG3FfkuviJEBdLiAtOfhcDxUitCzoKGOkFYbaVUHwQPempXto
	knskpOz96S2kqXpf1cTh0qGiz/ftLoO0pKViAQqxISW+3chz92sY/fEV
X-Gm-Gg: AfdE7cnXvSm67ZPiaNLx6KZk4CNfzSTmmNaL+kxRZYeqCZXmF+OMvl6v8K7qh/x0AOh
	1+4pEsKrY/wifgP4lqx4QAMooIQXt55CdzxLktSrU+yU6Upx9FUOo/0F9REJ58BqQ4klqMwjhcb
	AP31b2rWRnrcAIEO5cQFVeZbnQC4CIO3knqxYBZ0tF2E6FLurlmjq7RUtj2k4W1PfzjMJCzjwI4
	RnLsvbfMDa0Mu/O0fTa7N4bgIHaQszp7Tro22cTEjckeVFh8MsK12hnMmlLvSDk68cBTWiOq0Jj
	OSQHoMi0Xp0nz/5DiUeswTQw9vSyNaKQn8WF6gYyne9OAHxaV+EC5/mLLhBKAFwOIfMsP7TSoTz
	x5ESJrR8O2dh4yzDf0wVAswE2fYfMYA6QOEQvdrbDNtwQSyMz6SmTRP73goY4TbNK2PVZxAumkP
	DNg9Up5A9a0MOOedFqYxFJ1fHV2yLZJR40jjgZokhGbGFuqWPfAOw5yfJmptunQEz9
X-Received: by 2002:a05:6402:40c5:b0:69c:eca:3bd1 with SMTP id 4fb4d7f45d1cf-69c5f102cbemr3782153a12.24.1783949523149;
        Mon, 13 Jul 2026 06:32:03 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8971sm14840303a12.5.2026.07.13.06.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:32:02 -0700 (PDT)
Date: Mon, 13 Jul 2026 15:32:00 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY
 configuration
Message-ID: <alTo0KGWAixkK0i8@Lord-Beerus.station>
References: <cover.1782680023.git.stefano.r@variscite.com>
 <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
 <531d7396-c581-4b5d-8008-db5e9ee5e7d6@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531d7396-c581-4b5d-8008-db5e9ee5e7d6@ti.com>

On Mon, Jul 13, 2026 at 04:02:34PM +0530, Vignesh Raghavendra wrote:
> >  
> >  &cpsw3g_mdio {
> > @@ -159,9 +169,9 @@ &cpsw3g_mdio {
> >  	cpsw3g_phy0: ethernet-phy@4 {
> >  		compatible = "ethernet-phy-id0283.bc30";
> >  		reg = <4>;
> > -		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
> > -		reset-assert-us = <10000>;
> > -		reset-deassert-us = <100000>;
> 
> So are the reset delays no longer required? Or they taken care of
> somewhere else?
> 
> > +		bootph-all;
> > +		enet-phy-lane-no-swap;
> > +		vdd-supply = <&reg_eth_phy_vdd>;
> >  	};
> >  };
> >  
> 
> -- 
> Regards
> Vignesh
> https://ti.com/opensource
> 

Hi Vignesh,

No, because this GPIO actually is not used as a PHY reset.

After reviewing the hardware, it turned out that this signal is a
board-level enable signal required for the PHY to operate, rather than
a reset line.
The previous reset-assert-us and reset-deassert-us values were
associated with the incorrect modelling of this GPIO as a reset, and
are not longer needed.

Thank you!

Best Regards,
Stefano
