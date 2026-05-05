Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A7309F1D;
	Tue,  5 May 2026 18:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005969; cv=none; b=bgyBbH188+v3jaeOSeij5fZtftT0deWD6PbLu2opZ8+W0ewKddIKMdly8OOc+95L7tGU84rbOI+jG+avH5E0vKCn4iHF1S32L14bsyeFHzzt2S7ORlUvFwpkgs438xPm9BxvOIXXiEafEWAsdfwoKEYLZNShTDtRjaRXDTgmmyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005969; c=relaxed/simple;
	bh=p5rU0lFE+Zy6WoZ3trmg7KI/5vhdr0RdMyAwRjjhW7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmX7hYb43HZ8/IG0CuDwMRBlo8ukLcuq56sh8MpDQQ3stkYBuY3JnLPKfI+X2DTBVjFTkMrpFDbybXmC+PGj6NWlbSIUrwoh8mmZWWy+x0bmHfpxtdkI+7qSPsyQq/AA6zsr31Qvxu2s7w7aTIeXJTfiN+FjHVhsHZlon0U8Ssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=u4hhcy2b; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="u4hhcy2b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8XLywXLhWtlTlBR18sfqteObM8GZewXIF3W7Z1e289s=; b=u4hhcy2bO54pmQJm1LJusecOJf
	AYn8xH4o6FndxOJ34cYYYs9dWmAd7VHE08vyjd9h+yQvTmrn0+ykAdncYSsOJsiTujLd5ABpqgTh8
	X1HU7GpdO2esO5kTE9srB+RpoOV06LiQbuJbPfiDRxCDkk0/uHIXoYtbzp2Hr6gWWJLAE77tz7clS
	hLMK5e7Dsyn7T9IFdP7TN4TzYodeqegaIUk4N8xb3mDUUyFLb2tl5Fd+CWdQhmWIctKacDVfmjAfd
	W/C3ykqo8MVvCN+E0cj/kMTSUtLM5d6+wh2vtCqhED9flFcVbrIhKErU4v52+LyrRRFYxzwGxdkCe
	luKunzHA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] arm64: dts: rockchip: Wire up frl-enable-gpios for RK3576/RK3588 boards
Date: Tue,  5 May 2026 20:32:40 +0200
Message-ID: <177800595582.3294944.15259294512505640833.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Apr 2026 00:57:18 +0300, Cristian Ciocaltea wrote:
> Several boards based on the RK3576 and RK3588(S) SoCs use a
> GPIO-controlled voltage bias circuit on the HDMI data lines that must be
> switched according to the active link mode: asserted for HDMI 2.1 FRL
> and deasserted for HDMI 1.4/2.0 TMDS.
> 
> This series adds the frl-enable-gpios property to the HDMI nodes of all
> boards for which the GPIO configuration could be identified from vendor
> BSP kernel sources and/or schematics where available.  In a small number
> of cases it was necessary to extract and disassemble the DTB from the
> vendor firmware image.
> 
> [...]

Applied, thanks!

[01/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3576 boards
        commit: 2cd97880fbc434b49a211784561586f0397499b7
[02/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3576
        commit: 12eb09ee67cba1e3cc0c75149d0a04a5187ca575
[03/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
        commit: ba0d7cfb9870064296a8d4d57ff2c230166ada3c
[04/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3588 boards
        commit: 643d6733e58c663b66defea758bfb8d336047456
[05/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3588s boards
        commit: 3305c44489505e98e794cacce80cb1de9f1b81ad
[06/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-gameforce-ace
        commit: cb3ee61e35a9d60e6410526fec7b74af9be22d88
[07/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-khadas-edge2
        commit: bb85f4f5541de9abbe7e300e94d58ea888dd3b33
[08/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-cm5-base
        commit: 640c768d315b25f8e56844d1d71c8d0040dfd88b
[09/13] arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-roc-pc
        commit: 0c58a27bf04d88c979dc8ce86c62bb13d15626e4
[10/13] arm64: dts: rockchip: Drop unnecessary #{address,size}-cells from rk3588-jaguar
        commit: 161e023cafaca600aa7e5d5fab437334e6e6bcca
[11/13] arm64: dts: rockchip: Add missing pinctrl-names to rk3576 boards
        commit: 78f650c45ec342c16f80c50e7ee77272e76f179e
[12/13] arm64: dts: rockchip: Add missing pinctrl-names to rk3588 boards
        commit: 0c2c0b6cdd71c5a43f83db2e0dcffe4701d10b87
[13/13] arm64: dts: rockchip: Add missing pinctrl-names to rk3588s boards
        commit: 224aa83f3f73a8b17051c1639125260cc04617bc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
