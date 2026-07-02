Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F82B386426;
	Thu,  2 Jul 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019114; cv=none; b=BCxWTUnPMoSL4v5mO+KPMO83q8/AdWa1RxfLr5TT1r5ilPaQodpGJY9scFDjtJpFzG9sbI6tF9z9E5EGfwbarOo7cMDxc3PoDyuxkL1/rKcW40QD1IAQVO6TiWQFOX0t9WLo6BVRxByIj2HPbnZyK3Cr5u7RaGf6XWcuBkMHcTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019114; c=relaxed/simple;
	bh=Nh9E4VW2GnoVPEdX4ZqXN985eAQk/nBhv1kChPSeph0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgpJYik9sFOjJzdXwAudtnWtHfCwgXWPCpn24NCpz9kyGiabb1FOAgw6UpJU3ro4vX3G+jx3aVwNAKqxYcWBditJZZ9hpekRvhQP3+YBbWR5ZsHm5fzwNhed8BoByfha92VpKi/acgVUXnRZRaoz22osaX8mO3AnCRflKSiO0+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LsfxnjEK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LsfxnjEK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=t0NNRG9w6w6jCTySSfCRM9uqcR86GLmzg5Z0J050DYU=; b=LsfxnjEKjnc97llUKZA01GgdJd
	dFnlBw7l7/cyde3yav7xw1ZgV/I7vQ7VBnX/NxjAz/cIbvF6F3jDbB3NBeojbS22ZS6I0XPVI6Ux3
	1b65moljWbK2+G0pczunZ1v3OE0/yT/ERdYmNTd8cXcDSsVDCvQ05cZLffLCVW1ccobviW+3mGvh/
	6xoTGiP4j2YPEKwTOqHmGaJCdFIuVSZeCHd3UaSWC5mlaO0IlwuADLRUOeuXANg/3qaeom/T/3maN
	3Q0dXJCQnr+unhryQgoAqGqRw5CA5Vc3m4zDZkddVop5OYEtnom5Q3eBHmfE+1+F4JUONB9nN39Wo
	kJ9pBXYQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	sebastian.reichel@collabora.com,
	nicolas.frattaroli@collabora.com,
	alchark@gmail.com,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	michael.riesch@collabora.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/3] Add eDP support for RK3576
Date: Thu,  2 Jul 2026 21:04:51 +0200
Message-ID: <178301901908.3838694.14923342654854634320.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605022305.3058853-1-damon.ding@rock-chips.com>
References: <20260605022305.3058853-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jun 2026 10:23:02 +0800, Damon Ding wrote:
> Picked from:
> https://lore.kernel.org/all/20260601065100.1103873-1-damon.ding@rock-chips.com/
> 
> Patch 1-2 are to add missing clock "hclk" for RK3588 eDP nodes.
> Patch 3 is to add the RK3576 eDP node.
> 
> Damon Ding (3):
>   arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
>   arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
>   arm64: dts: rockchip: Add eDP node for RK3576
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
      commit: 5603ce4f1d470af29e0cc76e36ea99e62fa07151
[2/3] arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
      commit: 6f1ed82b7f084c13bffcaa9e2c7acf5bc64b659b
[3/3] arm64: dts: rockchip: Add eDP node for RK3576
      commit: 65bdf72f7fda3b1a24bd6f5ea15ce40ec2cc3e0a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
