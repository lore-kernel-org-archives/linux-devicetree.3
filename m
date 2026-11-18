Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981725;
	b=M9plYsVJN0j7SJt1EPm0iQ+UsU/larQTYNSgkuP7cbDtT74OrKgf71FEdE6Iej/kqZZc
	 5nOjNAVD67nOmYL5wBUoGBJESLSz3cVuHy7Su7pcixFPd/jJ+gxC0+ABCdVBAtb2aXWu4
	 WLRGrtb+TR8Wg0PS95Q+j20HCXhyEr6iup+FaVFqedDg3oWkWPlZOvBADq0dfqcn0+eXE
	 oBxkCxqjOH8v3OhFVmqJJRBd2jTfMISgRp9Me4XuLjNBlGbNHpANNFNvpuJsS9Mntaa6I
	 ZyeUMtqubwr5ubLRWWEYyF1EY0yyzkeegtQdZzfblHTU4BqHAhQw68VtF80EZBvInQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981725;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7YzBbUvh+YmQiLurxmFfCk1GR6xhELDIM2Yj32PmuSM=;
	b=2xHwKiNXQp88tVJsUMGlsmIxvOkA/pF0RXvJPWNAsCGh/r/2MNuHPdCLoVG30GkScK17
	 c2P6T9ue4kxpsn4/ez5+4XffDwSh3ZHPU82Rr0Ra5/UHoM1nLfti7DHUTy8cbOAfJl9ab
	 U53bvMxrdYE5orRLtI3w3lRifvCNpU0022aegIqcQjs6o0sl0GjyijOTIxJyqeNzaOeCV
	 /OViAAXYngXsnVtMg+h5ZTzeypYBafI3dVzz0AsBOmV7MBNC0YN5TXAwA4FahkF9PQTn6
	 rNzaE5OGEJSUFT9psumqcPS7pTHV6PbohG7ecmMRjQJ6CuxE+U0gHu9J71yI8oaSTSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HoIYbTIS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE54606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HoIYbTIS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BFA1F000C5;
	Wed, 18 Nov 2026 06:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794981725;
	bh=7YzBbUvh+YmQiLurxmFfCk1GR6xhELDIM2Yj32PmuSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HoIYbTISgyXS13am253L6tzK45in91AC9P3BEGG+OKaGCCoN9o5IORjK/HmkEmqdZ
	 yCH3dpdbuyTGMzluebQc5EbGtYLO67dTXwc1uqrdNtuAKl9Qgkt0uYWy1pTzxhKFSp
	 OL1g06Fomg/jDANHPVa5XL20A2cnBGWtK9aDFtxt4CLL8e1ZSsKUx3dde/PjbZvqX4
	 JNVrXM2JNKm2HitYP89tF/ZHGBkM1m9g6DsMD/4tAxwy7hEeZIGDrpiuLoedpoUiZ0
	 RkOUcgEIj+zZe++T6Zn6OzZKA/tWdbymmtOIONbdGFjHC8LNozP5Q2Qa9FfS/e8kHb
	 4ty4KbLSIYxVA==
Message-ID: <sashiko-outbox-220195@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261118-dcphy-rx-v1-v7-3-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <20261118-dcphy-rx-v1-v7-3-8de1adac3a74@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:02:04 +0000
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

commit 6c4b17f61ef61ed9fbe1eb97449b228aaba3f155
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
This fixes the incomplete error path in samsung_mipi_dphy_power_on().
Should this include:

  Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-dcphy-rx-v=
1-v7-0-8de1adac3a74@gmail.com?part=3D3
