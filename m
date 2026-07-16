Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2259350A10;
	Thu, 16 Jul 2026 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784229889; cv=none; b=ez9nyQcwO7mLlZlCRc5HYVYZv1jtJDZsXDpjM8ZSe9rcPRla3R8ElwbD/Nc4Y3Yja7ruCTBeuDPnk0aHiiWNCvbtI2abbOTvX3VeE0CONJuSrNSmuea3gGTgE4gAQh1b8rVRyKhB13LtZ0JMXBMV07ZM8kUIA+DFRIauduFtVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784229889; c=relaxed/simple;
	bh=H0vujam9KZK1Tb02uDfWG2Rxr/H9M5whUU8qwep0xY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPc/OX4oLRP1BqTK+r3oZTdKU9XXhgsT1KvBauf7e6lYS/WpcjNprcJkA45mcSiacDWMqcpwaitR8GCe2CEIRMfpiDaQ31b9d6Oe0nPzvDeeYEpTwnBDau3/PPIJ+U0mD6pibdBGo8CTN0wcrzq9Qw46GqJflWVIiXqKaH3OmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=L278ZaGZ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="L278ZaGZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=87h17Vm3Kg4e1AvNbenx3pMVHZ02lJjFNP0N/SI3OkE=; b=L278ZaGZ+l/HlGPc9/ZvDmVq12
	9AsMVRfzZd1OFMD5Nsh6x/6Oo9XkBcGUxDXg+3/TA3CrC14fA2GOW+tQiq126G+3KCsx8EAY6ziA5
	g+OA3jm+2H7jQPBokaJVz+RsvrEyQUZktrlMDEZZqKbGC5XeBb1D9ypwej7n6VaMF1cmqXBs+pdnp
	17o4qLE7Jy5zVC5YM1aiydoJrBPlwnt/CJj/1WocYeYyYqcrgTs5wbcIY1hkJOuekd8f9JGeKtDoc
	uZCM/SAXbuwYhWP3KuQp9zigUYue0YbDemdoc5oOrbus58IcTteBY39n/Ub66SmAGuw6UMLowHPpC
	F1DxYiaQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/4] Add support for Orange Pi 5 Pro
Date: Thu, 16 Jul 2026 21:24:31 +0200
Message-ID: <178422977233.2335819.13925907620580546087.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
References: <20260511025352.106126-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 10 May 2026 21:53:46 -0500, Dennis Gilmore wrote:
> This series adds initial support for the Xunlong Orange Pi 5 Pro, based on
> the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe),
> a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), HDMI connected to SoC
> (Second port is disabled in this patch), and a 40-pin expansion header.
> 
> The series was tested against Linux 7.0
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
      commit: beca9854e249515fb1ff4c575c875a85df9961dc
[2/4] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
      commit: f724b899d0f30d78a7b2c3f025aa826cd3f5eccd
[3/4] arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for Pro
      commit: d20f5368a4db0a70a5a7d3deb06553aae61f4ac8
[4/4] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
      commit: 4d6c68f39300bc52dacd204d08a4470ab2524726

Sorry for the wait.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
