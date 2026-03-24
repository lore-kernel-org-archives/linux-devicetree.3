Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F16318EF4;
	Tue, 24 Mar 2026 19:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382055; cv=none; b=Uv4y0Fd8Na2bHFCMHrqVySONXndvPAFUj0+heVz+gk9b7qxX/sbYjoiRmOSFf29XlVM1+C0Np0REnFvvmrmWbE4DepCUgrRWA+WDRTFSgAo53PEdgZprNCtSo4Vnvs33mDPoVaZtNwASe/v3i9POTqknzmBvanO9r+bxJnP9hEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382055; c=relaxed/simple;
	bh=N7xdAsnYEa5es0/W84G3FWLBWJWjfzVxkeMKl+CJLqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o2odXfZYHd67VYtCurAIuu733TTGYrv185fby6+yt/F/oCFb75qqL9SRE3cPg5+fCkPgCl/5RiU0iMaLYkLb8nf30oEOws1SurIVvce/rVA6dMc2LzLWym4RMnn3W4d0tJk9ZzRWW58x/AsB2AbP6cDvk3cVrjjCGNZHdGyjnq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jWLfHngN; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jWLfHngN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dl4I20khcnPtNiwIO0FoSOod5kTJzQ8CNj323iUPvp0=; b=jWLfHngN8P9DFmaJcfaWOIaxga
	HfjqYFOuMkFYHp7n4o3R+WPs1GdYMYLzXn1Iw4+DtLatHcStX0ZfaMoXocjzohmUy/qd+p2OgWZ7m
	Jccvq6lxzJ+c2/KiExS0ESO6EfdAqzAu+pS9GmjqviUn/FfjelTkv+5m6bXP5u8nxnO6VSxIS1gkb
	KMGh+/bp4ZWLIQgODZyKppiTbl5x0PaFy0hW+6oKlRERicZ3ULqGQsG5PCcBiNvGiNeWjJ2PLW91Z
	6Vlt3FS3oS4pfWIZelEltL06Ozpe80v7dTTSWoK+U7XzO5AK96iMKIWJB3ko7+53rnXNfJh2kGHua
	WS3BLLqg==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gray Huang <gray.huang@wesion.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	naoki@radxa.com,
	jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com,
	i@chainsx.cn,
	michael.opdenacker@rootcommit.com,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	andrew@lunn.ch,
	alchark@gmail.com,
	pbrobinson@gmail.com,
	nick@khadas.com
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add initial support for Khadas Edge 2L
Date: Tue, 24 Mar 2026 20:53:52 +0100
Message-ID: <177438200679.818857.10509162196522852647.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317090731.600787-1-gray.huang@wesion.com>
References: <20260317090731.600787-1-gray.huang@wesion.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Mar 2026 17:07:29 +0800, Gray Huang wrote:
> This patch series adds initial basic support for the Khadas Edge 2L board,
> which is based on the Rockchip RK3576 SoC.
> 
> To keep the initial review process simple and easy, this series only
> enables the bare minimum peripherals required to boot the board to a shell:
> - UART (for serial console)
> - eMMC (for root filesystem)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Khadas Edge 2L board
      commit: b1a9b33cff4f58f2507e930d2c5805877928c6f7
[2/2] arm64: dts: rockchip: Add Khadas Edge 2L board
      commit: 254c6ae9c5014497e840a6fb8520f70caef31097

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
