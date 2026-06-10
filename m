Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160D382370;
	Wed, 10 Jun 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075503; cv=none; b=WVwOpFB3pZuYbxKdIioiBPgrrzJryDAXoVVD0Nyo45XXACe/0+g3lzB/EucvLkHQxirrHOzeLndaf0PL5xLoZX4vAYHCOfQ5vWOpJ8yrKrh0J8qIN9CwMAgHNectmBUtV+1sBHEZqAFQDo5nxjA5pR4YUu/n+mhQ5Fd+SGF6FNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075503; c=relaxed/simple;
	bh=PsMBXlxnHOppNxrhsXjBCOnq7L8hjFFj6STOMBZvg5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Me5c1cwnu9p7q9wtSMsOdkCXFc1p9XMSLQvat7DBrIBxBn3SNd1RCPCrvHk1GRWVLBEJ78mXve0KF8tFWVBumZLylcE4posJWBVnCLwhwmBhMklraH6KYwWjKsouGN9LD/kwczy2G+VMUyEEqud4/x1UBhB96e0Qbakv26E+Jsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=YLXyy1ra; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="YLXyy1ra"
Received: from francesco-nb (93-33-119-89.ip44.fastwebnet.it [93.33.119.89])
	by mail11.truemail.it (Postfix) with ESMTPA id 02EFA1F973;
	Wed, 10 Jun 2026 09:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781075500;
	bh=C466Soiyc7PE+BjDcL+dY8Zp6o+u8OKHxnynx2bmrho=; h=From:To:Subject;
	b=YLXyy1rasTXaW9KYzP6V1ymLFbPNXR+/kWVDSZsbhev2xaXuybQ+gFlD64tJiYKYd
	 X1wUK82EEd0o6W2ssMbvuJCTvI/qXcdSoqDnJVlSrILJoIUEq14J0Tbpby8CFO9nXo
	 RnuPKnjQJilNHsWQZDOW4Prpc1RcuYg1CXDFb7S9PXvd9UDlNORV7X/ACdyhcBCLnF
	 WQNZ/UMtl1wW4Hzdcuu0uUDycvB5P2Tiv89JFDQW5+QLjHPd3KjR8BsIGS5Fp3x1Xh
	 onUNDKPqnuaNT3v+/ocLF4PXGKHT3E1V+gLWOz02tTn3EzY/9X/x5h/kei6ddBb0qx
	 AkRuSYCYW826Q==
Date: Wed, 10 Jun 2026 09:11:33 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] arm64: dts: ti: k3-am69-aquila: Add display and
 peripheral overlays
Message-ID: <20260610070736.GA24495@francesco-nb>
References: <20260602115123.1324474-9-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>

On Tue, Jun 02, 2026 at 12:51:23PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays for the Toradex Aquila AM69
> platform. The overlays cover display adapters, DSI displays, and OV5640
> CSI camera modules available through the Toradex accessory ecosystem.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

