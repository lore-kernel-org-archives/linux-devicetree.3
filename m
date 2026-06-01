Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C0E395ADC;
	Mon,  1 Jun 2026 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309226; cv=none; b=U8btMLF8AW3KeYw2FN/kjxBtO2ekknAjqkSvd3OsUPZCM57rFQ9nMZUr9IhTSzJUA63SmA7c7kxfK1iY1U5qucU0pQQIA7vATiNS9SuErO13gpJ+2Ox3xLWiagjziMAU6lZcMv16K0X+6tNAbFcf6RBNQ+saRxSn72V7mIZ4DJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309226; c=relaxed/simple;
	bh=1zdTjK78eqlbhHUB8EOuYJDEYfbTqYlRl9cJyvTI7wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4vdrL0/dO3p2iPk4mqg9h39orOEDStLhY3QdpdNMHkv5mKBwH3q8V3magRvL+bNYEUxawbnKHafym62+BwKVk8yjvRo+3Dki2Nhx7hdxVucRdQ6okFuUrTPSG62+zVgPi4UKQYYQ7SWdVJNxmv5QqM6acZ0QGQahVokAGsEU3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=k+OpxkXj; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="k+OpxkXj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SrImUZyjT4lmb9BXIxXyMNGdgHElksCa33HHo6A2zRM=; b=k+OpxkXjey2Lmif/YVYJXqdS98
	v6TZM1Wo/TjHarw8jxVT8LASmto3lUevq7IivZw9mcm8YnF9ZFC5nbxLY6AiH0kzCmMwQaXkzEIv9
	kzC+AnOC8yktwJToXXt6qKT73ZkFENaOwpflqybM9auVh7Q6TB/lBZt8dD7mMk4fFDCpHOGlSACqa
	hHyhALN3No0U0Jm8YDGw+JzZkQTNyhZaybYV7gL2eK2FnDVwKpM3KUm23i+2QBw0DPzwhwYjwAUsP
	vDyRJMweGynDNNS1PdEp7XyyKbSYXE/LeUu0+71wD2c/EBd5diCLqfQtRS3Yuw92R+88G5FrzGTQ+
	UwkpzMLg==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gray Huang <gray.huang@wesion.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add peripheral support for Khadas Edge 2L
Date: Mon,  1 Jun 2026 12:20:01 +0200
Message-ID: <178030918401.239725.2769966054558634435.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507033541.2576335-1-gray.huang@wesion.com>
References: <20260507033541.2576335-1-gray.huang@wesion.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 May 2026 11:35:39 +0800, Gray Huang wrote:
> This patch series adds support for several key peripherals to the
> Khadas Edge 2L board, which is based on the Rockchip RK3576 SoC.
> 
> These patches build upon the basic board support that was previously
> applied to the rockchip tree. This series enables essential
> functionalities including power management, RTC, wireless connectivity,
> graphics, display output, and USB support.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
      commit: 720fe68fd9f138ada2936ffcf3dd0129a889455a
[2/2] arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L
      commit: ef81db2fdd5a75e3834a4726dc7837f6d2a7229d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
