Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1835C6B8;
	Thu, 13 Aug 2026 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610572; cv=none; b=n6wdaPMDUOcK18NnTuGfbavJdsvx+W7Tp3YKRM7lbzOMQTuSXGhB5WT0c0HvuKn7fl13omOMOE7lfnzyag2k3MKKQJb8g+LNq7eayhEMKdQZSKUDYjJe4Jz+1/Zo3XPD8Zh1T1AuYCY+Y2q0gVl2cOmjB3QpItdgID6KN4rt24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610572; c=relaxed/simple;
	bh=r6E+vZYyNSzdhnlH1EUk7Jj1FYlvvxArupc8Y1DexT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBbNzIWiOpxqHNxf0qd7morlVTKyPZUFo5PIPPTqRpHBoLrqh+nkN6Rmk5q26wBM8aQpU+5zf9UAHZxbpNhdU9IJujin5RqZUA9jxSKJtioZpQijBiZHKHPFcKrqSw6fGDegn+aLp+mKGT1WLpgTaZFszmzcSPk3ljp7sCcLQi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=WzaA9CB1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="WzaA9CB1"
Received: from francesco-nb (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 6BDF31FBAF;
	Thu, 13 Aug 2026 10:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786610569;
	bh=Lkf6vS4aGzqlZUODBqAiya0+zZLWqU0oIUrwtnAoY8o=; h=From:To:Subject;
	b=WzaA9CB1f1rdBB6zHwxQfYbE3BVc4L291yfI6Ei4Cvfh8IEjM6qVnt3sypNjBo6Rj
	 UoeO+a4/Qs/zWpq7DB5QAHES9fhvx4Ynqo8oVYi5bLd0usYphhegcpIZPsluEZUnmX
	 8aBWi2VnuJtLwycLIEjtsVkMqeiD+iKPi719rLh6rLRu3QTH4xcoLLDq9DHDOzR7Ts
	 qQWicHyEQoct6wshUAawnAwE67C3JrnYeUmyx0WXpEV3IW4av3C3uTCewv7sK4FNVm
	 zOmTjLmv/JKPUWTsvjus0oHzqUk/iYkm2gZZFy5ykMEaqxIu1++PDyW61dTyvn7imV
	 x1EhJGtHxfNSA==
Date: Thu, 13 Aug 2026 10:42:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mehmet Fide <mehmet.fide@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Message-ID: <20260813084246.GC19687@francesco-nb>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-5-mehmet.fide@gmail.com>
 <20260813-comical-elastic-beluga-abcb1d@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-comical-elastic-beluga-abcb1d@quoll>

On Thu, Aug 13, 2026 at 10:22:04AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 10, 2026 at 04:20:47PM +0200, Mehmet Fide wrote:
> > diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
> > index 0a4a7f9..47be8bc 100644
> > --- a/arch/arm/boot/dts/nxp/vf/Makefile
> > +++ b/arch/arm/boot/dts/nxp/vf/Makefile
> > @@ -1,8 +1,10 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  dtb-$(CONFIG_SOC_VF610) += \
> >  	vf500-colibri-eval-v3.dtb \
> > +	vf500-colibri-iris.dtb \
> >  	vf610-bk4.dtb \
> >  	vf610-colibri-eval-v3.dtb \
> > +	vf610-colibri-iris.dtb \
> >  	vf610m4-colibri.dtb \
> >  	vf610-cosmic.dtb \
> >  	vf610m4-cosmic.dtb \
> > diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> > new file mode 100644
> > index 0000000..d0fa107
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> > @@ -0,0 +1,125 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> 
> Odd license ("or later"), but I guess this is a derived work of existing
> code.

Not related to this patch set, but related to this comment. As Toradex,
for some reason I am now aware of, we traditionally use

GPL-2.0-or-later OR MIT for DT files.

Should we consider moving to GPL-2.0-only OR MIT for our future
submission? Any additional info on the topic?

Francesco

