Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802437B01F;
	Tue, 24 Mar 2026 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382055; cv=none; b=dPiJoG2Pn7A9+f8l4lcdgN6ro2BIFtLhhohYkgyaKLSJmrhn6/nUfp9dP0PVZ357srNcWLdhFg6DdMFgWov7XfuT4j0pphCdVPEo02CeFmh58q6FHl8zOLzOz4DnRLAke2dvTh2APfm2n9N6cOQFsSIUeUzszi7OYkFEdBlEo1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382055; c=relaxed/simple;
	bh=VnjcG/VpEFpPDSKnGEgi6+RUDiLXcAievwDKomQusuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nyps7lfxSBIAgyWR8nvm7XxI8gJEvo2p/UFNwLgM2h/7kx2qdFQ/ZBRk27xOyBRjR3ugYKI7BL6XP5jErHeFK3k9DFA00lDjyec1sQvi/zsf6h7eOqh5d/HvbNgH4U/Xk4dQSEPDwGUO9t6y6RV9k2rQHMolt/jwyKlypI82kFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BKwGRvQt; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BKwGRvQt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rSECv1OVuOQtvHFvE1M/Wc8ov8pydQb30vNJDMTEfro=; b=BKwGRvQts0E/BK+8liAolY6R5G
	GHzfgcyu6lstm9Ap5WLpMeaUwAc8IuZpDZ5LjEor/SMg9+KMG6fQ1+vHtGCFs0xfai57pHRQ6/wta
	dCs/qB/Muu5NjZ0LLZGN4f+Bh9xzJ8wCza9a8uzF2S1XrdLr4DL25LpL7lGn+jgynmBW0VieDWhub
	kez39/UMy0aQvmUmZELYBkAlN5hr9mW0bgQMFVN5S1cPER2iqfplypje2PDooWZGq1VkDv6vym2JM
	W9EFZneo6Qh3PqkH9Slh+0gwy77Ad2UfcXP2MQ312CvNq1I4j86B3lTjmoDdA0IQBO3DzE47E1GTt
	K8+bhNPA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5bp-5t series
Date: Tue, 24 Mar 2026 20:53:54 +0100
Message-ID: <177438200687.818857.194935185801364893.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316073621.39027-1-linux.amoon@gmail.com>
References: <20260316073621.39027-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Mar 2026 13:03:55 +0530, Anand Moon wrote:
> Add supports-clkreq and the corresponding pinmux configurations for PCIe
> ASPM L1 substates on the Rock 5B, 5B+ and 5T.
> The supports-clkreq flag informs the PCIe controller that the hardware
> routing for the CLKREQ# sideband signal is present. This enables support
> for PCIe ASPM (Active State Power Management) L1 substates, allowing for
> better power efficiency.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5bp-5t series
      commit: 0f36806da4834cbdfe790de6b88347348cdad32a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
