Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765981;
	b=NTWYMvL8ZE8eUpILsGih9z6KhblPN6iXKL0fIv5vegIOgWHl0wsQ6/gCizZMBB143pRZ
	 To4Lh+nQla/u6XBE6q/Mg72xWRnqkAM4l+mRRDE4vqYOIUtPI34zNtEAjOxBwKVzY7EBC
	 mHsWucZDdtmR7gIC0lDDjJFHmpT2Mrx3kr76CfIes2PsEPDj8zvMoTne51tGlQ+mGG2BF
	 hVijWqUlM8hxRrqKB7ElSfjqjFnxPnOTddabGTaHe2dW6j/Zv8EfvZc1xt71XAG7RXEHv
	 6nGIMfZbBaBydDqvTdU6PzwOCs/9NnsL2xgb7ZngvEwvhvxz9xaVpfu12LdacLAL2+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765981;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tygDmtGB+yX+oGRU4+TSbqiueuQzDlrwuhNPzJVJiy8=;
	b=UCbQvVMVi0p8uiZXllKJyBcS8rcG92TVqba9HiDK4yYETv5rv2uwo6so4XKUb6IFKPem
	 ld8egDnUvKlzFeJlMRk/x+fCjTvmxHbhIGApFCg1hjwgcnTBJN6ViigCDquCDhmPtdpEC
	 HMLOowjUBSTL9d/kfnjdhZ8diMbix1VbXH/boIBVlQDjboTE8YGG2ErPxevesaY2i6SJf
	 xTkyVt7QheUNM81qPQa/mWNLCL/qMN5veX++X+tmi15SYHqmYMOhD1+s8YKS/Nh4hKkj+
	 RPz6Bash+HJdG66qTVhShb4qOWdlZ1uCzZ2hugBpgzZw1JPG4jtlP2SK92lKfOoF4Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpfqIk8F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB98606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpfqIk8F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19961F00898;
	Fri, 27 Nov 2026 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795765981;
	bh=tygDmtGB+yX+oGRU4+TSbqiueuQzDlrwuhNPzJVJiy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpfqIk8FfLmraAfgpZIWj8wHoSGrjos6X+GtAsDCaz13hPb3P6zZnR5azKuhfzEUS
	 2oR3sXKekTZvPEzF8jw2D5L3SefszxgSNnZpx0nzdWRrObkRIVBj+gInFk6b7SvwSS
	 O/gVGniKNaDtMeyiHWxUUns5pQ1UcziU+iWDqJeDJvpaEHMg/7XsUqzdigddgOcmOt
	 xTzvnae9edMAOd2QuzD6e5J1TQ6yUcfiNnoqp8wxrc+Ibpqs4KLA+4h83uirMC3lpO
	 yDT0sHwf3VlY6zdH60niLpooXX2UhaeM0DQaO79AyzjTqsBXS4VKu3OO9ZBDKNIpsz
	 Mpd7VNru0GyeA==
Message-ID: <sashiko-outbox-236841@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261127-dcphy-rx-v1-v8-3-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
 <20261127-dcphy-rx-v1-v8-3-9ddfef99221d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 07:53:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] phy: rockchip-samsung-dcphy: missing Fixes trailer for PLL lock
  unwind
--

commit c4cff69d53c33cc853f967f2b375c5dc0bd94bd5
Author: Jason Yang <jason98166@gmail.com>

> phy: rockchip-samsung-dcphy: Unwind power-on on PLL lock failure
>
> samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
> set and m_phy_rst still asserted, and the PHY core does not call
> power_off after a failed power_on.
>
> Today the APB reset at the start of the next power_on cleans this up.
>
> A later change moves that reset to runtime resume, so the leftover
> PLL_EN would stay set, and regmap_update_bits() would not even write
> it again.
>
> Unwind the power-on before returning the error.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.or=
g/
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 =
2-lane IMX219, CSI0 2-lane OV5675+DSI

[Severity: Low]
This fixes the incomplete error unwind in samsung_mipi_dphy_power_on().
Should it include a Fixes tag:

  Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-dcphy-rx-v=
1-v8-0-9ddfef99221d@gmail.com?part=3D3
