Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99029357CF4;
	Wed,  5 Aug 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949052; cv=none; b=bIwIF6HnchBVIFKDpn5VVDjk2+boEI2IEBwIXxl/XjAnKfdZqYfSvueN8imVD6yCmJNrnia4exPdbGAGoJf9szirlGBYNQWKmyU0fQ7PLBf4mDvnfZ6+nFreAfEW6fWcG62q0oNiaHAm9b54Qs0bW6Gj9j5jdK/zoMom/nOa4hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949052; c=relaxed/simple;
	bh=GiBWASs2NTK3SIvUidiZ6442EpHojiGFto1G6NKEkpc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=uaGwINBSNeUgFEbqEheMjSeyJVy7+CcS7FPKcDjgErY2nnER91QzY0+bEfM+OAhL9rRIgoX0KnbEOtm+gXseXlVcRdf7O+t0tlQZHBQO675xaiuz1IHj/1tdiL9zSIShDlwrZ2Ex9qkQCmKItXRcJw+TDTgEakai3ykeu32M+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=rTP2MB8V; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="rTP2MB8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785949039; bh=ZPOeT0UlkDB7bURmE/gi4VgTTsC5oEgCEAZwO5PY7hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rTP2MB8VN1LUPdnmON8tLZ/7fT6tkkhZtKH3vJGO/3G4+Rs62lPBNKdOyYh7gje4r
	 +LPnoJC+4y2CU1RMJLp6qcWewCou/N6GhF+lVn1GtJYDHQPiUrOdSnv08SnKTIZNgW
	 8oSbUJJ3AYssuB/p8FmtSHDorXS30UI0bYgdC6/A=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E509F079; Thu, 06 Aug 2026 00:57:16 +0800
X-QQ-mid: xmsmtpt1785949036tj1ii2sgr
Message-ID: <tencent_9C3151C59C077D547095ACDC1F08B481A50A@qq.com>
X-QQ-XMAILINFO: MhLcXbI0hPoHMGGAbEH+EabkpcEzS84YEckOoMysrLTZeDMmWWNlq/1vpTr4Dg
	 3xVE6gSA7ehjrtQGU1HpDNR2KspTxyAwHfj+JRXW+c+n14JN5mNsuIDNtuPExuISGp0bg51TESmg
	 prZFI7WTW/M8ECpqSWMdVoO/uX6LDRHQxjNNrJM8GJPEhQC7X8An+hDdrKoveYbE3G2KT7wTb9rX
	 Qa9W764Who91jaJT6bOVVc060H9CkzBRPb3mUka7fsEGQKRClMdUshiq93E+jr3UzMDsGMe1fNCu
	 hYi7KFybCkgFA/QUAgyepy45wnrjoGM9e8HNo/W2kgTkxqpYffvNySlmnbeK1AsYMjM0qjo0GLTl
	 ykn8ZoDnlUwqZvYvvoZAdBe9/TaHezOuIfg+ouM7gFYNJh7q2vCi5Fpr9aSDw3Sfn/r/LMUhsfcx
	 jdghoP7xHufh9X2pp+oP1tgWxhSaDg3qvALYznral//vFn1FJhuzwIwVryr5GYzxRmvB0pO2egTt
	 5dp0EYk1vfNiS5QXAa9LiU27mFBwQVJAfvr6SsCb/qB3yBBZjeu0XSf3ubfTB5I4cno1CxwVJH7J
	 llY88vpRofjheWcSB2mZ4iiCvKQpvZ8u2i+lSKf5wnK5wFwi7Hbbc2CfjLHjY0Sv2v8kqHicGMTk
	 TicXlJQ9WRJhN/BvXR6oMDpx2QBio5L2iffRBXBLu9SsogDXRovjEPW3KZdgC9fBx7vPPrZxq6J2
	 TWSkXVhqzmkoQ6nSR/u84UVi5p6rjqaVUVhgHEM+5GUilddDDTwT8Oe3kRLRHeyk3Y25/VqJyXzt
	 ittfCWgtEKFxx+ajxMJtFkBQgvryydD+5Ra9CGYvOJdxjYMB25LHhiu4nd8TDpeCl1LsbtigaWwA
	 3xM1hETWjnpSODzsQGTRQ5o5lTkgDJ7bs8iHiTyaCtCXrTXux21JF2KOmH5iQa2WbWmM59mb7RoC
	 HBXztE58Fhy6WTnru9BpWsqJ+6DZo1nU4sWL30iM+2Hq7oHTSgASVoyq6iHCfhf30t0ttKvd8+oL
	 gNUFRclwaus9UyBUkRu6JW0cwYIV9vANPFCmeg5nHHrancek5qpkvXSyWpv7rKDreA4W1UIjaFve
	 DZTexdBh8W4qu/cGjJ8jswg/VnUu8e1YpcS5Co1ub3/WdtzShypRqjcTWDmQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jimmy Hon <honyuenkwun@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Enable the NPU on LubanCat 4
Date: Thu,  6 Aug 2026 00:57:06 +0800
X-OQ-MSGID: <20260805165706.137254-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
References: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The three RKNN cores and their IOMMUs are disabled by default in the SoC
dtsi, so the board has to describe the NPU supply before they can be
enabled.

This board feeds both the NPU logic and its SRAM from a single RK8602
output on i2c1. The vendor DTS makes that explicit by giving the same
regulator node two labels, vdd_npu_s0 and vdd_npu_mem_s0, and then
handing one to rknpu-supply and the other to mem-supply. There is no
separate memory rail to describe, so npu-supply and sram-supply both
point at vdd_npu_s0. The binding requires both properties.

Neither property is what actually enables the rail: the rocket driver
never requests a regulator, it only takes clocks, resets, register
ranges and a power domain. The rk3588 power domain driver marks
RK3588_PD_NPU as needing a regulator, so the rail has to be described on
pd_npu, the root of VD_NPU that the three per-core domains hang off.
This matches what rock-5b does.

Since pd_npu now controls the rail, drop regulator-always-on from
vdd_npu_s0 so the domain can power it down while the NPU is idle.
Nothing else is supplied from this rail, and rock-5b describes the same
regulator without the property.

Mainline has no NPU OPP table, so all three cores stay at the 200 MHz
the SoC dtsi assigns to the shared SCMI clock. Clocking them higher
needs an OPP table to move vdd_npu_s0 along with the frequency, which is
left for later work.

Tested on rev 20241026 hardware: all three cores probe, each reporting
NPU core version 1179210309 and landing in its own IOMMU group, the
rocket driver registers /dev/accel/accel0, and dmesg is free of NPU
errors. With the rail no longer pinned on, regulator_summary shows
vdd_npu_s0 at a use count of zero while the NPU is idle, so pd_npu is
free to drop it.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
Changes in v2:
- Drop regulator-always-on from vdd_npu_s0, so pd_npu can actually power
  the rail down. Thanks to Jimmy Hon for spotting it. This mirrors
  commit de5b39d16318 ("arm64: dts: rockchip: Remove workaround that
  prevented Turing RK1 GPU power regulator control"), which did the same
  for vdd_gpu_s0 once the domain-supply was in place.
- Mention the change in the commit message and retest with it.
- v1: https://lore.kernel.org/linux-rockchip/tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com/

 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index a0fc128ce6e1..e5c2e77d86c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -276,7 +276,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
@@ -365,6 +364,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hym8563 {
 		hym8563_int: hym8563-int {
@@ -407,6 +410,36 @@ &pwm0 {
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
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";
-- 
2.55.0

