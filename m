Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED143DCD8B;
	Thu,  2 Apr 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124034; cv=none; b=rkNobZPkHPKpkJaELCPVA5obvWBTOnKJEwiPtGbDiObExkTHgKhZwB+7Pecb9GfxuTNja+RdxrD8XD3MU+Jgkn9BS+PO6HPAF0UdRKT52VgjGYc2qXdNRzA695xFvuk8Dkx3HrJFobqm6WfsH1pzSYOgbBV2xLxd+oKNVXYDwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124034; c=relaxed/simple;
	bh=JJnpY/87iMHeEp3faBQtcCAjMSkD8erttOPa5Eswg7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xa6WuDF+aZ72zVtKgzlNjaQJdVKZJ2YqDm7H7gq6JU+m03KE1HJwyuGIV1jqaD1cN3trPrqhNE4QoMw3OkCrW4mfn7YSxA479KWvgkRNr0msMXFv1saEHSvU9fN2JhjFI5giFAOOtl9kXYTolnkjB7OkYkQtak5RzYKU1rPhkcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 394e0eb06;
	Thu, 2 Apr 2026 18:00:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: enable USB3 on OrangePi RV2
Date: Thu,  2 Apr 2026 18:00:07 +0800
Message-Id: <20260402100007.110201-4-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402100007.110201-1-amadeus@jmu.edu.cn>
References: <20260402100007.110201-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d4da3133903a2kunmcba6113b55c1ba
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkIZVkpDTR1KQ0IdQ08eGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+

Enable the DWC3 USB3.0 controller and its associated PHY on
the OrangePi RV2. The onboard GENESYS GL3523 Hub provides 3
USB3 Type-A ports. Enable the corresponding VBUS regulator.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 929b70d384b5..ab835c30dd86 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -52,6 +52,20 @@ vcc4v0: regulator-vcc4v0 {
 		regulator-max-microvolt = <4000000>;
 		vin-supply = <&vcc_5v0>;
 	};
+
+	vcc5v0_usb30: regulator-vcc5v0-usb30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb30";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
+};
+
+&combo_phy {
+	status = "okay";
 };
 
 &eth0 {
@@ -111,3 +125,13 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	vbus-supply = <&vcc5v0_usb30>;
+	status = "okay";
+};
-- 
2.34.1

