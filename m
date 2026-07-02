Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB25384CDD;
	Thu,  2 Jul 2026 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019111; cv=none; b=ClhYWR0vxXewQ+vFQr1WFhmOmpIraVT4RAtT2/FZQEJ0ipYWWmpQcQv6qF0ddK4yHiqKPsM0jQDLX8r5ZTpf3jw1fy694tVf76xSpySCi8JX+o+E5scqW3R/uxcWZ0BqRRuutyiD7QW+e3DU56lfbYoUYAUIwcJkMAlUPUg7HWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019111; c=relaxed/simple;
	bh=wFScMTA0aeosbk+Qcsd4y2LEslJSobKkD7dgWff6iYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmy1rfoaH38Hv2c/nHVfr7pPd3AexrTnu6DzHwI3Ve0tCWhDnM90IFkf0q/p2N17vUuVt7LUiwLpzvcECqzHZKVZr+FgBnaklFd9VzJ3vfxBbYoD2Q/XN/K8/QzSvcrUNKCz4bSwcOc54huQRKVRnSidm1cEMc02AVxpgwEQ9ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Jt7tc2xh; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Jt7tc2xh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=m7PQ37TP8TLSa3Y3Mh+GfctL0Wog2HZY6fsfi5VePvQ=; b=Jt7tc2xhJjWGJQavuRgUHV+ifa
	AF2X59WYmK0VSW8hgH+znp+G7NDBzxiYvfWopRG1R2YBftbapRvA2HqK+3aVWF3tR9qFfiCCjljCr
	/0Q2tGJu3BWzgKNWrPhaODRK7pzblPOiBZipq397eqYyrrj0dvgqPAsgOjAbjp5ZXImtwuTzt7iCy
	kS+ngbY1gvR845pAYYd/Hvh0XLkJQl7eS3XxOncQSPdrnKlTrGvN1pQNggaVPOogVgMgw2PrHFZQr
	t3QAo0x//o6NJHvcYfpUAlg0PUYntH5iEtXybCK+UZ2GNGlcfob7zB1Pz60wGYPeXOCk4JOebyEc5
	Vw07ddog==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Add Youyeetoo YY3588
Date: Thu,  2 Jul 2026 21:04:53 +0200
Message-ID: <178301901896.3838694.11723513577053090499.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jun 2026 15:58:57 +0200, Daniele Briguglio wrote:
> This series adds support for the Youyeetoo YY3588, a single board
> computer built around the Rockchip RK3588.
> 
> Both Ethernet ports, eMMC, SD card, USB, Type-C, HDMI output, WiFi on
> the Mini PCIe slot, audio, the recovery key and the fan have been
> tested on the board.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add youyeetoo
      commit: fe76e3493f9ea5e927f9ce6bfe7f8785ba2d0c44
[2/3] dt-bindings: arm: rockchip: Add Youyeetoo YY3588
      commit: 1e476370fbb1def308e6da3785843f1d34529721
[3/3] arm64: dts: rockchip: Add Youyeetoo YY3588
      commit: 19847bde695f7bc65b16840c91cda4c2e35b36ce

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
