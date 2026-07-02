Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5072C3BBFA4
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=Otqn3hMAlNB/SgicW9VxjyuRwZrHWhlwBCfNbbA3TYl3mzKRujpXTPQPn+nj2cqG1mfAwXmDObqssNHewojtKf9x58JLoc+ZhxPD5EPt+sZ5dIfVFm7tBs4c14KeeSoKUvAXOjdJwsR7k5uyPqRJacAIrd7OQBARYDggvfal0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=BkGt9gRdq4+mXvxqvFoEqTNlK9VaqJRlmqlDl3FHsIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHa+RiuZCMZ1tnBBzSm/EY+QVwwOMLhWSNzKAj1Ho2Ym2AtYLjSyiO9P9SatHjeLJugms/NEfDQ6M1bNrYmV9sSS4L1QSyt5OCJCJLYM9s9RsJrZfNJ0W/36yiTdIhbfqZbbFfO5bpNIijOO4pXDpGvIKt6ZXh7oVxdQBKS8RhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT3TOFUQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT3TOFUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 324C7C4AF14;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=BkGt9gRdq4+mXvxqvFoEqTNlK9VaqJRlmqlDl3FHsIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IT3TOFUQfkJa8QLK+WFHDey73pO9WetfwSg+QAoJ0XmuOaCA5b/oz0lYh7evmymRF
	 WK8bxdOQJbSeHgu6jpriCRUZ1XIDoBakXdPHoFy7PlgdTsmNDGkHriWG2647CwBW/0
	 KHnuRhXVgnKk3dKhYkMk6hh/6bJ8Yu8Y/pwCpuXVOJVOh352dpCKZYZV9RKtfOU6qn
	 NNB8HekTBGLh9bMZNHgr2XWnRIJVvGUdht6F71DQGIbGTKyYSefHPFwVCAjP/eJVxd
	 aFAnz9PcfaVez4fbXtwDMz5zlsFHXRXf76E3PgF/yaGoSV6uzigeHW7oIbiOSkwq6u
	 BvzqBLt1ZPxPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211A8C43327;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:24 +0200
Subject: [PATCH 09/12] arm64: dts: rockchip: rk3588s-nanopi: remove useless
 vcc_3v3_pcie20
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-9-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1620;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=WBtnT5RxHkG/dyI9jDktqGT/HG3MYcmzS249+IZqSWE=;
 b=FEHW2Ba3FHByCfpL04cDVlnQCu53WMQ3BB7GKPMyohMdwcJ/wxv5p48DBCvVdD8IWE01s/SPi
 8vvzrfn0A5IAc+X9g1ygUPBF8Q4wzMwcBBMzE+RvthbrVbRf8cNbJvn
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

There is no separate regulator for boards with RTL8125BG MACs.
The power is only separated from VCC_3V3_S3 with a ferrite bead.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 463cfeddf270..e4900af9822a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -86,16 +86,6 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		vin-supply = <&vcc_3v3_s3>;
 	};
 
-	vcc_3v3_pcie20: regulator-vcc3v3-pcie20 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_pcie20";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vcc5v0_usb: regulator-vcc5v0-usb {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_usb";
@@ -305,7 +295,7 @@ &pcie2x1l1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_1_rst>;
 	reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
 };
 
@@ -314,7 +304,7 @@ &pcie2x1l2 {
 	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
 	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
 };
 

-- 
2.55.0


