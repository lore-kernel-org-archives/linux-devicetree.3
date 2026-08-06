Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E86329E6C;
	Thu,  6 Aug 2026 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033593; cv=none; b=XppEz21rbqJT/HkRMmuxGZlGZ1eZpGLF1Oya4TNJ0t4f+AYMJTcKc5gO1VQ5GpOKxc6F2MTFH8Q7pM2v+1SDQXe5Q4b0WR4IW8ajyP88b3v86uX3b4Ff8Z9i4A5E4tijw1qxnPhDajAsX5K9m81SF7+UY5QAmBiaYpFAitQsYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033593; c=relaxed/simple;
	bh=+n2DsX/0fsx2YvErKUukCl7lJN1Wf39KTDK52IeAi2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m1UDc0mCRSw1hQno5e4GuWvTjmV2OUq/5V6IyCVNufC7kBhgp96pl2ExO8LhGbdRR7BhZnpzM09P6rdgDVA1tdnaFxQTq6KjMexox8bapGA4r5C3ZOMsGmFMedynhYdQN5Z/2F1A3ZGeVtgd040hG2MTRgW0yQkMoa4vwAeqXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edRoiQNr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edRoiQNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561361F00A3A;
	Thu,  6 Aug 2026 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033591;
	bh=hD0bHzpZasfcL38d5d9W31p3gaknBWPj0YJDakcdYjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=edRoiQNrUGuoHhuPWLn2rm2pKovdkhPVwVR7yuoTp9BAqAjio8nut1f4pj0S76gd6
	 p/CgqmVaEChePAr0pf4RnkHvLGWm2ure/PNSBtKAkHrtl7bq+LxG/U0zsi77pzgw/0
	 gu3qUak9paYt7JRI/jjYCl4NnbVeOkd4aB8i9yH1PBHJa4gLIMPx/36Q39ezJujk35
	 XDmY4YX0XaawZGejnHYHFckp76wmMunxYAgddlIOnyyOndKRGou/8tLfX49kNyGdug
	 3qQ5/W1cE/BskXKcdaLB/8wUbmWximsPiA3ifFuxHbc3QMnK5gd/2BrNDwK2S2djps
	 UJGw5pB3E2i3w==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
References: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
Subject: Re: [PATCH v4 0/3] phy: rockchip: inno-csidphy: fix 2500 Mbps
 support and add clock lane phase tuning
Message-Id: <178603358793.674490.17206086804451771679.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 25 Jul 2026 18:56:02 +0200, Gerald Loacker wrote:
> This series fixes and extends the Rockchip Innosilicon CSI D-PHY driver
> to support data rates up to 2500 Mbps and adds optional board-specific
> clock lane phase tuning for signal integrity.
> 
> Patch 1 fixes an off-by-one error in the rk1808 hsfreq range table:
> the final entry was capped at 2499 Mbps, causing a rejection of the
> maximum supported rate of 2500 Mbps.
> 
> [...]

Applied, thanks!

[1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
      commit: 4fae43e33a7c10951fbdc6baf409d51bd66aaefb
[2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add rockchip,clk-lane-phase property
      commit: f82ff8609f582ca5105e45f18dfc3e949dfeaef1
[3/3] phy: rockchip: phy-rockchip-inno-csidphy: add clock lane phase tuning
      commit: 333c23c31696dbddd7dad28e82bd34e37a67d5ff

Best regards,
-- 
~Vinod


