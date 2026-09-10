Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F03BB135
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020816; cv=none; b=MaHjUa4jpc5zfUvKA0bWiECSYPn0C9IjPvaUXP7kMD0q/HvuddQJphAYTs8LeE0cCuIwCJgnJA5QmN/lA2NuR0cxHtNIEB3lb+njVHEqU5l0bc5qXGv36pDtra1/QYal+hJpn285IZxFgZ4xhc3C25D+N08RzYi1vqxhLxDOZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020816; c=relaxed/simple;
	bh=4DRjpTmqx3rm6I0hvi9f55+dQTsiCr0e/ow5gOW+LpY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gl6cYzWI0cIpuQ3i/3ITr9dHMzMG3foJ6JzodRnGTbuNSf3wo5t/6PCUfy9e7amMhEBKkscqIRxQQn9EyLHWqGEh22Ev4cZoxh9TtJxg0nBcqwIB8rYziyhtl6Ydr4q+7Mh4YIMQY/A8E8DBM/HyzyHT18doBHrPfPhLGw5wopk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hEx0l+z5; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hEx0l+z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789020801; x=1789280001;
	bh=Zd0oHaUPampheUnb5yp3fSoD46Zp5JgfaDgEyt/77nc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hEx0l+z5MazM82bsK0LQVJgbNwzldOr6D7oexcHVXrvG3G6Ut7o8b62vriwR+5SJ0
	 YB8SDumn52wbJV6r6tr4h8WBBlzPCzoKG/i5CILdZ4aXHgw7dkDXshmHmm1GdNMeSQ
	 dTRc5Rso1psDPR+y9pH8PGA/6S5VYD0Yev1L00VsGQ8w9aN++17WcVWPLl5cq8mHKt
	 vXmarUU0bTdc/JA7KfuIWkdtth0noA2pgv/fi8qeLmscI8K/goOiWFzerv2x42dIQr
	 9YSv5XeDII5b+LN2siBBb3KCs28YaUZLgjRoUPSKueDotjdzyob+FhrpUFaRPRamje
	 VOyIy7uRVyOHA==
Date: Thu, 10 Sep 2026 06:13:15 +0000
To: Andrey Korshunov <razor1702@gmail.com>
From: =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, "diederik@cknow-tech.com" <diederik@cknow-tech.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
Message-ID: <VIvc1QJ9XRgfW_Po-U_fVw3BL7qNmB3Zrl4K3PXWt91BLhwpBHvwhN62PaVPq5YFX2VrZNkbrct8X3HfIBBvy1kbd9mQg9O_mGOrmoRLmcs=@proton.me>
In-Reply-To: <20260909225002.976-1-razor1702@gmail.com>
References: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me> <20260909225002.976-1-razor1702@gmail.com>
Feedback-ID: 91982645:user:proton
X-Pm-Message-ID: 6b1b673b5273e349cfb62c001e3957c12eff0c54
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the test. It is better evidence than the Zero2 would have
given on its own. The mechanism lives in the MDIO core instead of the board=
:
`__mdiobus_register()` releases the bus reset before `get_phy_device()` rea=
ds
the ID, and the two boards wire the same RTL8211F to mdio1 behind the same
pin, so the R28S result carries to the Zero2. I have annotated the tag
accordingly:

  Tested-by: Andrey Korshunov <razor1702@gmail.com> # NanoPi R28S

Good to know 2026.07 leaves the pin asserted as well. The commit message
does not name a U-Boot release, so it stands as written.
