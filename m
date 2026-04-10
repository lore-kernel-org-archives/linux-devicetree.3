Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79A332608;
	Fri, 10 Apr 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815229; cv=none; b=WV8yWdvORv2RJwIxaO21E9kDzS2CoaWxYJQCWDwa6EE8gWrabImS7vMmll9adJqg34kQWrQh8NLzI9eJ0bJFxzagHvS/BcZSWWkdJJyTR4AnCRDPwygtVCRwwo4jF4oVgYJJ5Gure1VGjOotOBxBHIlLskgtJBtmyvBwnblPoQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815229; c=relaxed/simple;
	bh=N81AytQXIJSdPhOHFgN3oP8rDvXYCeZuR0EWT8IVeLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rWDINRTLyPzieTEF6K9C5qP2hTVrkhyLpz5EAgMaZP7uVHm0mXRdnXdOUZRHjcYOal/aezxd/XzIzih7c2FjM2clDOfzGCIB4H4u+5o9EKQjr98RUsiStuNI13rLehe1V5UbY71FbwVYB3wtzYN2GTHSwxa9Qhgix11EMt5L/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [116.25.94.53])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a3f23e96;
	Fri, 10 Apr 2026 18:00:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v3 1/2] riscv: dts: spacemit: add fixed regulators for OrangePi R2S
Date: Fri, 10 Apr 2026 18:00:09 +0800
Message-Id: <20260410100010.1197804-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
References: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d76d5d62103a2kunmc24b7d52bd023
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQx4aVkNCSx0YT0gfSBpLGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VTkhZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVUtZBg
	++

Define the power input and the 4V power as fixed regulator supplies.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index de75f6aac740..409a6db269ae 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -21,6 +21,25 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	vcc_5v0: regulator-vcc-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc4v0: regulator-vcc4v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc4v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		vin-supply = <&vcc_5v0>;
+	};
 };
 
 &emmc {
-- 
2.34.1

