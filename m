Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A09332907;
	Mon,  3 Aug 2026 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754067; cv=none; b=TEXfSgbiXbJMIqENHDb8kehzVCDdLsFwDg1bH1ajx31ZHA1/nGA8X18p7mT/yZ8eKqmyre6FXen1UGaRq9jKNeUvbECIpmhd5Jp6mTD+5hfdP+zCwr39Ev2wYewQ5Wc5ttxLYbn2khP6pvS7/RHOtuqCcQHDLxS8DDF6PsYlJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754067; c=relaxed/simple;
	bh=V6PITVCZxajUh8lYHaimE4g3irqIWEsEGdahthEG2KU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsSV6MIbNvF6MsuZ3hPAFU2DIulxG2Yk+1Te8yABSMW48F2eCiXGw4waJjMQyUnqd4U5ryN4HYa/Cm1U23h13gBmjRqztxiNvpAps4pVEB/mUlnVSGhOebS8jwXYOy/59x6rQDePZ4+mUD6m+fLiOBs6VTAjJMdxdPVs0aPxvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cmfErLPR; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cmfErLPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Qr
	r2Zysc4pyzy3uLfxsjmMcf5E8OW7lBqpqv/XW/WdU=; b=cmfErLPRdE84v5o8wg
	1soPBZduhOYc94YCh+4YG2EXZ6/UQsdYIKYfAO8HK4FWEL6iCNFUB57hIL6hBd4e
	PkLyV/wx0n9hpaPVEfDw1BIPkt5uLG3I3M6YefsIfJqsiiGKuBQ9ZktWzMikRqKF
	aCjCRmRvWce+AjUH9Mx8SVYjw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCnVF6WcXBqw5sANQ--.10564S2;
	Mon, 03 Aug 2026 18:46:48 +0800 (CST)
From: Zhyi <zyheihei_123@163.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Zhyi <zyheihei_123@163.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing
Date: Mon,  3 Aug 2026 18:46:46 +0800
Message-ID: <20260803104646.26836-1-zyheihei_123@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnVF6WcXBqw5sANQ--.10564S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy5WF1kuryxXr1fGF4xXrb_yoW8Aw4Dpr
	s3uFWfJr4kKFWFg3yDJw15Zr4fJwsaqrWrAr1IgFyIyFsrZw1Iyr1jgFnxZrZ8Jr1rCayr
	ur13tFyDZFWqvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUhL8UUUUU=
X-CM-SenderInfo: 521kvx5khlsiist6il2tof0z/xtbC2xg502pwcZg7NAAA3V

arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing

The RTL8211F on the HINLINK H28K (RK3528) is held in reset at power-on:
its reset line (gpio4 RK_PC2, pin 146) is left unconfigured and reads
low. The PHY node's reset-gpios are only acted upon after the PHY has
been found on MDIO (fwnode_mdiobus_register_phy() reads the PHY ID
before it requests and toggles the reset GPIO), so the first probe
deadlocks and eth0 never gets a link:

    mdio_bus stmmac-0: MDIO device at address 1 is missing.
    rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach to PHY (error: -ENODEV)

Release the reset from the MAC node via snps,reset-gpios so it is
deasserted before MDIO scanning, and drop the PHY-node reset-gpios (a
second consumer on the same GPIO is rejected with -EBUSY).

This is an RFC: snps,reset-gpios is deprecated in favour of the
ethernet-PHY reset bindings, so feedback on the preferred way to release
the reset early is welcome.

Fixes: 145d4af4b204 ("arm64: dts: rockchip: Add HINLINK H28K")
Signed-off-by: Zhyi <zyheihei_123@163.com>
---
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
index 0ec50e9..9d7e33a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
@@ -191,6 +191,8 @@
 		    <&rgmii_rx_bus2>,
 		    <&rgmii_rgmii_clk>,
 		    <&rgmii_rgmii_bus>;
+	snps,reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	snps,reset-delays-us = <0 20000 100000>;
 	status = "okay";
 };
 
@@ -205,9 +207,6 @@
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_rstn_l>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
-		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
 	};
 };
 

