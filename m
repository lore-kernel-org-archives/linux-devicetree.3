Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10463909BF
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079260; cv=none; b=NRstfvUidF74tYoOJn4YkvSO0F39RFtXQDeSrapb5LwKJuKbfRjYF/rLUxBImIT1XjHQmvR/NISzWWEG8aEFq9PXE6e9zUGaSn7z/juRUpmhJoshuRdS1GMBRREB7uZNYetK7Y0BKIsdRkxwrbfO/xT3V9et+kfP65PClZvTx4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079260; c=relaxed/simple;
	bh=JSQqT2+w/M4z8ZKKjnLAbFCD03DWzaJ0PUpnOfTlfgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kEiY6o0vsL3SHs8iFCo1KJ6Upx8hOcUWr7qbwMMtQ77ndnCzt1oX0cd2jEP9qg93dMJSLvB9sPDy+bEcbClM5FY4cF9411s1JAnGyA9XTaf9v3zDhxbKfTej8HcM+By/SFf1Il+8wN8dDVAGYMxXoadZuGPdeuuEuC/nuGZlFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=I814W4Db; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="I814W4Db"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781079257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7Ptm6SPsVG8VTgTcEieeftVdkBihFqITk/E7N/gLcI=;
	b=I814W4Db1hH0tdqi5Rp4hZY3ua5uiZAf5+g46nVZGHyfME3gby6N7Ud9rX7owW3Z5VzyoO
	UvhmOR8ZIts/hRPiYQbrr6+gaoOheccoHHldzA/jA0xCPzQZ5mTH/zBHSDg5CAWuJYuFzf
	uU9tESCySXd2UVDoESOpu5I3PDPnzm3i0aA2R4+7aVcBa/NHerDMjOmgZJJflx1szfkg0m
	97uY3LuEUVfiNvOaPu/e9+SKvuYT1j1lBZ7rlrMjm2P8EvmqGR/nZqueboys/pbYYze/NO
	Ir3z0KICHEn18PGeFnrJk1ChI8Y7fe9tqQWNluHZI/6WMHtlu/YPrbCYK6HnKw==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
Date: Wed, 10 Jun 2026 10:04:05 +0200
Message-ID: <20260610081400.758687-2-diederik@cknow-tech.com>
In-Reply-To: <20260610081400.758687-1-diederik@cknow-tech.com>
References: <20260610081400.758687-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Several USB nodes were enabled/configured on the NanoPC-T6 LTS first. Then
those same nodes were enabled/configured in the NanoPC-T6 dtsi file, but
the ones in the LTS dts file were not removed, so do so now.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index ff855064be08..0ee67ee24f3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -38,23 +38,6 @@ usb20_host_pwren: usb20-host-pwren {
 	};
 };
 
-&u2phy1 {
-	status = "okay";
-};
-
-&u2phy1_otg {
-	status = "okay";
-};
-
 &u2phy2_host {
 	phy-supply = <&vcc5v0_usb20_host>;
 };
-
-&usbdp_phy1 {
-	status = "okay";
-};
-
-&usb_host1_xhci {
-	dr_mode = "host";
-	status = "okay";
-};
-- 
2.53.0

