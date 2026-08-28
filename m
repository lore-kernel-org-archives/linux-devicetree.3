Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0D448CE6
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917588; cv=none; b=jyMT8wp5OSZ578qBuHW4i+XkF35AF9QNmrhWrs4BgxnDNrNumIvqqEPFrkJewpcCQYGgq5oA+TK2QvW9rHW44cfqq9KxYiXn7maeJVZPpD1gGo0X/0cc872Rc6Gjqv2v0OzGR0opZ3ZvSKDVvkFQ2r3YX0xjKvtMVYugr5zOj0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917588; c=relaxed/simple;
	bh=WmzJl/gDki4yCRQarSuDUHp+vGo780vLHnW9dx/7YuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NRFwKIV/WvLJsGJvAmWco9CcZX2QvOGPQG9uHh6dMCpeCfgCgqwSvgUdojVMc8QzkDNHosOG4Ce01xYKONcP3uP5GFzdmyyN00XQtsgbFljmycMeei/I451lVSvkfDIFRUMKgcytapoDsWpvYxUW5e/wsDJ8p3zLSzAgo/5Rohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=hiGTM8YH; arc=none smtp.client-ip=91.218.175.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="hiGTM8YH"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WmzJl/gDki4yCRQarSuDUHp+vGo780vLHnW9dx/7YuI=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917550; v=1; x=1788522350;
 b=hiGTM8YHVvGCyZ/JGYFUvM/aucdzvC8iw+Axb/hY27GC5stllEqGczXKQ4lUnL9gArzWfip/
 kKRgxqV/McUufBA3s5feYb613hMKVvPZw7msSXKPap8X0k0+OGgR89DaTb3aDlb0hzidcu9Oqta
 K6eyDEdIJAwgBo+zSDABJaYHWvRqiwlu2Uk2TFZK6JcppyyO8IPTUY799c+ZTZPN/kmc2HWfY9K
 xvbLWh6luDqw9PPQxSgvY6LBEDysZEV9t+BaRsEzWq1Rxnw8v1Npz/KE+VsRO8VaWeeoLKoRIlo
 i/M2vQShocY+7lO69jJLZD5Q16U+RDOmvluT7DQuTdM+Q==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 632b3452a606ff6f;
	Fri, 28 Aug 2026 11:45:40 +0000
X-Mizu-Trace-ID: 632b3452a606ff6f
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/7] Cleanup DT description of NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:00 +0200
Message-ID: <20260828114530.1315798-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the DT description of NanoPC-T6 devices by
- Remove unneeded nodes
- Align pinctrl names with names used in the schematics
- Fix sorting of various nodes and their properties
- Fix an unneeded pull_up
- Switch to using I2S0_8CH_MCLKOUT_TO_IO for audio

Diederik de Haas (7):
  arm64: dts: rockchip: Remove unneeded vcc_3v3_pcie20 on NanoPC-T6
  arm64: dts: rockchip: Fix PCIe 2 pinctrl names and sorting on NanoPC-T6
  arm64: dts: rockchip: Fix hym8563 pinctrl name and sorting on NanoPC-T6
  arm64: dts: rockchip: Don't pull up rtc int pin on NanoPC-T6
  arm64: dts: rockchip: Sort usb nodes on NanoPC-T6
  arm64: dts: rockchip: Improve sound config on NanoPC-T6
  arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS

 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     |  17 --
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 165 ++++++++----------
 2 files changed, 69 insertions(+), 113 deletions(-)

-- 
2.55.0

