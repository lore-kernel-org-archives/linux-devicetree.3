Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488000;
	b=SamWCeUHO5PdcRb0rxemtbwfZ1VbDLeeSk9s0VMLFS1lXhUfgY0ZwCPoVUSeRpzRbbsc
	 er0PcfvT59Fdkrdn4z7ADviKD32YFoFFtnNwxzlT8nMM7sWSJl+s4n2orzbkORky+Citb
	 gxqII/74b5QIu3yJF/iinRtqvCJUG4Oc/1HKv80/vkUlVwMGe1p/cZV2A15PzLmJ2fC5f
	 GJOJr5Wi2BtzuunPNbIbNOUpT15zhKrn4jSdpBHGfZdknXUEZNkKJC9J8JJK3GgkbqzU2
	 cMv0Y1Qxx2e0dXl1Yn2BNivr1GsZu3C1ZVFbp09UcrngIzWYaXWucDwngyCg1PxC4FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488000;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jGP1b9jLSQAhw1LFbHdnVE1Cm2LzDCydg1pHvlgHSlU=;
	b=S6N3iE0ugusS9kHHcTpL2D+k7q/NUR0yJKsH6AdfhhcvjRmzCLBWUJmappw5vkuMH2Ea
	 +LO04Uc933bgBUy8Yj1b8zAoj4hs4wvhfcq4tcmxHNQ52xnJUpr/tLJw2c+LLPpzUHyMm
	 LeVlqlmLF4F/1nfLYeTGXrlDjszccyGjac0b+IVz09PX+KzZdQwgNp0mytiWz1Y0hZmjl
	 cOqYN4hxn1KToiR3Mjyo6XYINn6XNdRIZusLNjpuLWDCmDDWvo9F0Jq9jy2AY86QBPrrO
	 lYKQBdI0qWOA8szoqcBn9tIbqlGIkcG4rtehHyKZPetJje3khB0NfHb0luQgHOLHv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=m0BvharU;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3604606A333
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3604606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=m0BvharU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794487998; x=1794747198;
	bh=jGP1b9jLSQAhw1LFbHdnVE1Cm2LzDCydg1pHvlgHSlU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m0BvharUtArG4OstXIzrvNfYNCC4VZhvXTlvV9msTyo7x6bfiVWEAQE3QcXUBin17
	 ub8mMN8L6PHCPEYXlNqEhJS7oBDtkHv3VVY5cd/r7f1MAqwfu7EMSRcowTj2HnZtnl
	 LU/ZuilRJb+1nmqI6MvC5mGv8VCGVWCVpgKVgIRozLTAo6XVcdxBqwKtgsMlhC+y3v
	 vR995jHgD6DhGvPmkZrSkwqnulBRwduA0fs4FezDJJJpflEH0e5gELUVYFkWTQ+hMV
	 No907ESqdTkXIgLwP98X69v9GqQNY3NLuAhM+BkS2IPvKHYpetIGwegv/3QMr8da3o
	 SLmaVZkaNGGFA==
Date: Thu, 12 Nov 2026 12:53:13 +0000
To: Vinod Koul <vkoul@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the Exynos5515 usbdrd phy
Message-ID: <Dhrinh2IqyBByHLyFp_SHX9igTjQgKk4G62C1vp6tHdO8QkM4kiFDLaExxnZeljVMXJ8YksFrLRDRT9voAj6LiJYqPvrUg3nFVNFzi7C9Bc=@protonmail.com>
In-Reply-To: <avWeJqbpbLcWgq_R@parshuram>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org> <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org> <avWeJqbpbLcWgq_R@parshuram>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: cb3b8ddeefb938cd47e6dcf3bc37b5939fef5922
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

> .n_phy_cfg does not exist.. Please fix this

As stated in the cover letter, this is introduced by dependency [1]:

> This patchset also depends on [1], due to using an
> exynos5_usbdrd_phy_drvdata member > (.n_phy_cfg) which was introduced to =
fix
> an out-of-bounds access bug.

> [1] - https://lore.kernel.org/all/20261020063559.3530901-1-selvarasu.g@sa=
msung.com/

Which has since been merged by yourself. I assume you just
looked at these patches in a different order so saw mine first?

Kind Regards,
- Aiden Isik
