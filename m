Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB6357CEA;
	Tue, 11 Aug 2026 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474080; cv=none; b=hrzRt1dA0DzGyH0W9ukhzuEN6ofu0M+8Ed7ivfFvGE176KvGtoGiGetEMlpGvDTPKQs++YbcPe+936DUHHaZFJ6KOb3theeat2a8pNdSa89FW6JUT0Zq8wEAzkBFGzh3vP1xjGlHk26IyH/p18PzU97+54jkZpuxLaXGT9he1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474080; c=relaxed/simple;
	bh=1+rZQRmZ4F7qt5OD14QPmbAbXKswDc0feOOroumDaWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkS+WZa/zWDqFJ99/p9ZD3eccixlLkqDMMJcLWLop7ftBj/i/8x79D+wOOqFNROSSR/3Juytj2iUkZqneI7AVdamgZQzWTYIlE/ZgTWjRJYEwCk4jhHdJupptnzKgdNXTR9R/cIo6Rd3IBtkxRIO2p/JMXlT532WUQJRVafElSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iga6MBp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iga6MBp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FA91F00A3A;
	Tue, 11 Aug 2026 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786474079;
	bh=I0L0v1f4scbaR3/WwGeZC8c8Cnj+Uxvi2dGU0apiVgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iga6MBp4YneJJTMIKiorkxUz/WYlwpYtS+KLulbGRy+d70cLAJbuB80UjJXW9IbNl
	 mdFF7MkGlctvghNlOjH5T25nXSs8Amj61lGedL6JkjEULH1GYjxqiwvN9GR4JdF60e
	 jjuL8qjAx0AtwgXO9F2B/UNp4ubv8weAF+ds6bXS9WpogtZZdSpGsICaLYShvWScNx
	 vSLbfU5jDVAT7PDSj0uhlnmEnFGOQyQljjwQ8jvkwrRT8ZKIVx8Se8OVTFRu+FZ29h
	 AZCTzetUr8waVoxIaqVadhEKk0S2jSypgl7nV13UdDx5pOckC8/Bcm4bzwJzo8yTxV
	 uoR2TkvI8hv5A==
Date: Tue, 11 Aug 2026 19:47:53 +0100
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mfd: axp20x: Add support for AXP318W PMIC
Message-ID: <20260811184753.GV2869284@google.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
 <20260717-axp318-regulator-v4-2-50aff97084dd@baylibre.com>
 <20260806120952.GA2869284@google.com>
 <20260806122433.GB2869284@google.com>
 <1j1pcbxte4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1j1pcbxte4.fsf@starbuckisacylon.baylibre.com>

On Thu, 06 Aug 2026, Jerome Brunet wrote:

> On jeu. 06 août 2026 at 13:24, Lee Jones <lee@kernel.org> wrote:
> 
> > On Thu, 06 Aug 2026, Lee Jones wrote:
> >
> >> /* Sashiko Automation: Issues Found (2 Findings) */
> >> 
> >> Please explain or fix these Sashiko reviews.
> >
> > Also, please Cc: the MFD mailing list next time and you get these for free.
> 
> Hi Lee, this mailing list does not seem to be provided under the
> 'MULTIFUNCTION DEVICES (MFD)' entry of MAINTAINERS. I've been using b4
> to get the series out. As far as I know, it only picks what is
> documented there. Is it documented somewhere else ?

It's not in mainline yet, but if you rebase onto the MFD tree, b4 should
pick it up.  Either that or add it manually: mfd@lists.linux.dev

-- 
Lee Jones
