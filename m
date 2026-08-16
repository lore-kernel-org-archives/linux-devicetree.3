Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550483168EE;
	Sun, 16 Aug 2026 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874782; cv=none; b=i0wF4WYihUJ7qImGojDUdSjVbdGZT4Tn2M9UL1q1B9vd/YUDw9oJS4/2RYFG7OjFkJvo+PwO8Njd91mpY4QbgMq16lBdGRM+4fCZH89GqixvrNFQv0ZbeitEkBzMnk1VolSMQErlH6A/0qw1+nF5SsVNFAvmjiluz0l51AEVUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874782; c=relaxed/simple;
	bh=KPpn5Lz69gyZNQ7UVby8srl4LTB81wdyrgsynS5BeWY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jO7AcjWiUFB4bFOVHJXyLDyHAOLDarWie+WXj6pQhUPH0xDQvhD9FpuAWsZ6dkLHep1WNaZ+7c6nLOe+l3yGGat4RI8RiGY/jAYlyY9DOiI3eBdUcrThFXnODvGXvgTCb6TGwkuF86RkGFUCrq3Ee2EnZJIqBgQ9WnW3LqYT9jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a232e329;
	Sun, 16 Aug 2026 18:01:01 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
Date: Sun, 16 Aug 2026 18:00:00 +0800
Message-Id: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa00a047d1d03a2kunmd86a0852222fdb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBlOVktJTB5NSk0YGUNNGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktJT0
	9PS1VKS0tVS1kG

Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
MMUs, and connect the regulators. Remove always-on and boot-on from
the regulator because it is connected to the NPU power domain.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
index 854c118418eb..640c5be2f0fc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
@@ -253,8 +253,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
@@ -300,6 +298,10 @@ &pcie2x1l2 {
 	status = "okay";
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	keys {
 		pwm15_ir_m1: pwm15-ir-m1 {
@@ -354,6 +356,36 @@ &pwm14 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8_s0>;
 	status = "okay";
-- 
2.34.1

