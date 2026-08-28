Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A444606D
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917582; cv=none; b=aDCadRrzNuC1fw1nn6lqI4Wh6bDx7Z7dm3IBWlaJOQL6Oc/UxBYDpCCAF4RJSMFn9MXS3d9Ce2msqkbt0CbrNcIQPMqM3/Z6kEzE+5Re6bW6HSkzePmzQlbo0W3Z3RtatJd3AIWEtW6XMf2N3uEFqwumiPvJTVwp6sm5EVLJNK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917582; c=relaxed/simple;
	bh=GZ6xCYTSi9co+IIKhthafL94am9XVPBEdirIBtSwOT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDug74Sk2Y8YhB52H63j1aTlQVQ/fWVMWHoE5q7vSutDlHsC5HbFlgmI1mMf4gYJtu4f0VlWS8QFbTGernsmtztyaB+JW2GQeHtRpcaVQGuIjUvWOjWAejbBnhhn6d9dGdKAlg9KHu6FfNGG2IrxcUOGw8IoSWMO16kwfqIfC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=QEQQdNdX; arc=none smtp.client-ip=91.218.175.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="QEQQdNdX"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GZ6xCYTSi9co+IIKhthafL94am9XVPBEdirIBtSwOT0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917565; v=1; x=1788522365;
 b=QEQQdNdXFBQOheJ1lHP0l3fnpUJyNtKD8mlySnnJaFYxYELojmjqEpFaxy6Q/Dvu5YAbc9Lk
 /kyQdPTGJE0dsBeM2gqjFpTpEoH+1lw2nILKnTzFhY9vE/llLwRzClc5Klw3GT7/leXgAmUP4nT
 yt9OwS96Cd9bYejADjSxHs04OqblwMzPkHilvN4N3W1DKellj0EyxFG4Car5JnZoO8YfxuPUIpJ
 FBVIFGyMeZg+pt0pEOYeuUzHuuQGBm/KY9C18gICTHZARWXX1LpBVBNzbNV8bvcNIXTIqGdB0dQ
 FnlznTKtQY2gCVj0sli4Khbnmoktv5buHB2Nwp7hc0xeA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8da0395c564e6944;
	Fri, 28 Aug 2026 11:46:04 +0000
X-Mizu-Trace-ID: 8da0395c564e6944
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
Subject: [PATCH 6/7] arm64: dts: rockchip: Improve sound config on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:06 +0200
Message-ID: <20260828114530.1315798-7-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel can manage the I2S MCLK output gates since commit
02b9b0bb6269 ("clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO")
So switch to I2S0_8CH_MCLKOUT_TO_IO to do exactly that.

The audio ports are used in audio-graph-card, but simple-audio-card uses
sound-dai phandles to establish the DAI links. So drop the pointless ports.

Add a label to the soundcard to be used by tools like alsamixer.

Sort the various properties according to the DTS coding standard.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index e42b2a14fc82..eb0eb124c4cd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -100,14 +100,14 @@ fan: pwm-fan {
 
 	sound {
 		compatible = "simple-audio-card";
-		pinctrl-names = "default";
+		label = "Onboard Analog Realtek ALC5616";
 		pinctrl-0 = <&hp_det>;
+		pinctrl-names = "default";
 
-		simple-audio-card,name = "realtek,rt5616-codec";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,mclk-fs = <256>;
-
 		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "realtek,rt5616-codec";
 
 		simple-audio-card,widgets =
 			"Headphone", "Headphones",
@@ -121,6 +121,7 @@ sound {
 		simple-audio-card,cpu {
 			sound-dai = <&i2s0_8ch>;
 		};
+
 		simple-audio-card,codec {
 			sound-dai = <&rt5616>;
 		};
@@ -551,17 +552,11 @@ &i2c7 {
 	rt5616: codec@1b {
 		compatible = "realtek,rt5616";
 		reg = <0x1b>;
-		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
 		clock-names = "mclk";
 		#sound-dai-cells = <0>;
-		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
-		assigned-clock-rates = <12288000>;
-
-		port {
-			rt5616_p0_0: endpoint {
-				remote-endpoint = <&i2s0_8ch_p0_0>;
-			};
-		};
 	};
 
 	/* connected with MIPI-CSI1 */
@@ -573,21 +568,9 @@ &i2c8 {
 };
 
 &i2s0_8ch {
+	pinctrl-0 = <&i2s0_lrck &i2s0_mclk &i2s0_sclk &i2s0_sdi0 &i2s0_sdo0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2s0_lrck
-		     &i2s0_mclk
-		     &i2s0_sclk
-		     &i2s0_sdi0
-		     &i2s0_sdo0>;
 	status = "okay";
-
-	i2s0_8ch_p0: port {
-		i2s0_8ch_p0_0: endpoint {
-			dai-format = "i2s";
-			mclk-fs = <256>;
-			remote-endpoint = <&rt5616_p0_0>;
-		};
-	};
 };
 
 &i2s5_8ch {
-- 
2.55.0

