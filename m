Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E708366836
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049389; cv=none; b=K8ko+NuBkOj7wS1GPSAOhsJOqVlPz1Vk1rxjF7M8f1MAeVPxcaByy6bNBYWTHQO7Jb2ycX62Axq7t6mQXgHxldIDa3BC4YDQRERQO5j8S+HgyletDHgCjvpdCawbbOwN6cvJKOzJUZw+lkuvVqh8jiKGbIqApMPrm550a8KvGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049389; c=relaxed/simple;
	bh=3GXIGXfKC+ENKp3h89elxfUW8klgdIbPtLP3KT3uJG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M55+mXAjQ8qC/SFgdt1yr+T6AaobalROY0NMr8wUE8pBEcE888S0dn83Zk7FtbPmbeatVBB2NPoLYymI+b0spaQdlBFTHNvdK0eeqhSqPblMWHCGQ8SttYAuwJeKkjUrClrK2Ia0tA5qwB1VL0wA8K+Ug+TjSm707rcx1QfMSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=ammDxO/P; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="ammDxO/P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1775049385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9VA8VLKfLTkWm9X+V2yaryP/HfItXGzqwbDwkHn4B0=;
	b=ammDxO/PijDpoQqzj7DQwMpkueSX1AAj0WsOe7zd8RKA61V9PJ9IjhIOodiQ98QJqWjrEH
	TeW6Uh8+HMDkXJ1rToold42E93cc/4gbmvNB6f6u9KrRudAUhIrmQQWO3e4PQOGWmaIxk7
	TRp5u7WnNYE5sj7gwj4mhUx0GHAZLS5pZKhc4oPfPMggQcVy2up0KbKCaoLpP5inacSVmC
	l6Q6ytydUzH3ID+rCClNIUNNiL1OctH8H99vAaZArQOaeGVOicU/7/3Dt/2BI5exguZpwV
	iUQyJ26h2whaam+y5gTxbzDyWdyVdMBrLrGXd97u69N2rdXJJyEXsCNH8FWSqw==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Replace deprecated snps,* props for NanoPi R5S
Date: Wed,  1 Apr 2026 15:11:39 +0200
Message-ID: <20260401131551.734456-3-diederik@cknow-tech.com>
In-Reply-To: <20260401131551.734456-1-diederik@cknow-tech.com>
References: <20260401131551.734456-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The various snps,reset-* properties are deprecated, so convert them into
their replacements.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 90ce6f0e1dcf..92d044ec696b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -85,10 +85,6 @@ &gmac0_tx_bus2
 		     &gmac0_rx_bus2
 		     &gmac0_rgmii_clk
 		     &gmac0_rgmii_bus>;
-	snps,reset-gpio = <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	/* Reset time is 15ms, 50ms for rtl8211f */
-	snps,reset-delays-us = <0 15000 50000>;
 	tx_delay = <0x3c>;
 	rx_delay = <0x2f>;
 	status = "okay";
@@ -100,6 +96,9 @@ rgmii_phy0: ethernet-phy@1 {
 		reg = <1>;
 		pinctrl-0 = <&gmac0_rstn_gpio0_c5_pin>;
 		pinctrl-names = "default";
+		reset-assert-us = <15000>;
+		reset-deassert-us = <50000>;
+		reset-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.53.0

