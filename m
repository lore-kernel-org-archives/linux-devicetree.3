Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C462338734E;
	Mon,  3 Aug 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775378; cv=none; b=V8IP2UGjs3e9k/2CEpzVGkYrBjDkhn1ABJXrcaVx7yU6v6Mz3f5ie8ToAUKuMKGqvkItBTNbdBtB2KR4Rt+1NQWVNZHUM8ZM9IVTxQ6K71lX3pbA6PdvQonltFal74SxLciYd5gi1un0TtrrSE9CCmZdBiKcFHhVye+8EO48pk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775378; c=relaxed/simple;
	bh=X6Go8zEKyjaMoINyUyyNAPX8x3taesRwA5Ge8XnReMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X4ppuD605e6oZnhp45bcuuQsF/LJM+Gku6XDVKTe8HKIVB7PlwM4lufFgX/5CGy1QJV+9W/6E2vpQV7KswEhmeHV3gM/yBuLqJAe2cikeR+SrUa4czdvjauGzAo7rxHwR0lyv00Q8WIb6ZMS2vY0nqySPzCzwiTXqpwgkeEVvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PGnl9k4W; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PGnl9k4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=d5B/vZzoZuX96M04fD0UoU2qDVSNKydBpBo9Sk/Nr/I=;
	b=PGnl9k4WkMoLC5FCZo4lTIJyW763VsnMKlV3cppJoaSrR2D3357lxYfSmwPVC6
	bGqFKmg3YoAlWG4eUt+z575chHwNl5znKjyERwI2fNWrCRHM8epAuF+f0A1uPoW7
	wkFIyhGYcVx0K8W0HxX09hNzcgrZLWNC9wZIO1o4Zfu1g=
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnqYnmxHBqPXceMw--.40390S2;
	Tue, 04 Aug 2026 00:42:15 +0800 (CST)
From: Zhyi <zyheihei_123@163.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: [RFC PATCH v2] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Date: Tue, 04 Aug 2026 00:42:14 +0800
Message-ID: <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
In-Reply-To: <20260803104646.26836-1-zyheihei_123@163.com>
References: <20260803104646.26836-1-zyheihei_123@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:_____wDnqYnmxHBqPXceMw--.40390S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWftF48tF4fGw1kCr47XFb_yoW5AFy8pa
	ySkFWrJrs7KF4F9398Gw18ur4fAanaqr45Cr1Igry8CanxZr15Kr1jgFsxtrWDXr48Cay5
	ZrnIqF1kZayq9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgJ57UUUUU=
X-CM-SenderInfo: 521kvx5khlsiist6il2tof0z/xtbC2wchu2pwxOeVcAAA3a

arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing

On the HINLINK H28K (RK3528), the RTL8211F reset line (gpio4 RK_PC2,
pin 146) is left unconfigured at power-on and reads low, holding the
PHY in reset. The PHY node's reset-gpios are only acted upon after the
PHY has been found on MDIO (fwnode_mdiobus_register_phy() reads the
PHY ID before it requests and toggles the reset GPIO), so the first
probe deadlocks and eth0 never gets a link:

    mdio_bus stmmac-0: MDIO device at address 1 is missing.
    rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach to PHY
    (error: -ENODEV)

Move the reset to the MDIO bus level: mdiobus_register() asserts and
releases the bus reset-gpios before scanning the bus, so the PHY is
out of reset when its ID is read. The PHY node no longer declares
reset-gpios for the same GPIO (a second consumer would be rejected
with -EBUSY).

Fixes: 145d4af4b204 ("arm64: dts: rockchip: Add HINLINK H28K")
Signed-off-by: Zhyi <zyheihei_123@163.com>
Assisted-by: Codex:gpt-5
---
Changes in v2:
- The root-cause analysis and this fix were developed with the
  assistance of an AI coding assistant (Codex, GPT-5). The resulting
  DTS change is minimal and the hardware validation was done by a
  human on a stock HINLINK H28K board.
- This v2 supersedes the accidental duplicate of my v1 RFC sent from
  my Outlook address (Message-ID:
  SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.=
com);
  apologies for the duplicate.
- Use the standard MDIO bus reset properties (mdio.yaml reset-gpios,
  reset-delay-us, reset-post-delay-us) instead of the deprecated
  snps,reset-gpios on the MAC node, as suggested by Andrew Lunn.
- The PHY ID is not hardcoded, so boards populated with either the
  RTL8211F or the YT8531 work unchanged (as noted by Chukun Pan).
- Thanks to Andrew Lunn and Chukun Pan for the review feedback.
- Validated on the stock HINLINK H28K board with Linux 7.1.5:
  eth0 shows "PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet]"
  and phy_id 0x001cc916; both eth0 (GMAC) and eth1 (PCIe RTL8111H)
  work.
- The U-Boot side (generic RK3528 DT does not configure the reset
  line) is out of scope for this DTS fix and may be addressed
  separately.
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts b/arch/arm6=
4/boot/dts/rockchip/rk3528-hinlink-h28k.dts
index 0ec50e9..7ba3fa4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
@@ -200,14 +200,14 @@
 };
=20
 &mdio1 {
+	reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	reset-delay-us =3D <20000>;
+	reset-post-delay-us =3D <100000>;
 	rgmii_phy: ethernet-phy@1 {
 		compatible =3D "ethernet-phy-ieee802.3-c22";
 		reg =3D <0x1>;
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&gmac1_rstn_l>;
-		reset-assert-us =3D <20000>;
-		reset-deassert-us =3D <100000>;
-		reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
 	};
 };
=20

