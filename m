Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21710376BD9;
	Mon, 27 Apr 2026 21:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327075; cv=none; b=ul724aWp9qlGfYygvrV4564ESdYVwNkoi2JIvBjn1vRLtrWe12vuylf7tPK8zTOypa65TWYF4/snQUW04iXhvpkfqhzs3Uk/491lV5+A6dCaUFVXR3sM4+SqMssW5MSIYT1HhbL/sWVodCEx18+2ZFhIkRwcCLsEfPYFlW5+O5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327075; c=relaxed/simple;
	bh=KpitoL56kjSJH2zK4K2wF3mkADlzeBuLCe4iX7ONuFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDV+LnY4iZtoR4OiIjOlNh2LuVlYt5Q0NKkCQQLQYJOuOU99cmAqgQl0K3ikL1JZ3/3rZDj+zlti3w+B90V5TJmPTt3o1gv5b0Wr/bmNuIEQIhnfo0bM0QRR18PCLqwjZrjQIOiGFPRaNcaenva4vJMDOjIVGbdnfg77kRfm9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DGcWLsln; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DGcWLsln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327068;
	bh=KpitoL56kjSJH2zK4K2wF3mkADlzeBuLCe4iX7ONuFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DGcWLsln1qTLCz7HwxEJL/dzvhjgqfKwhKhdB8MT/xBD9r1sM8ixuYQLANXnf5BdU
	 rtYqjsiuVrXxSim6vuPpjg6tMCIJJ35uFHm4iKqGjl3zeyNTpl45Oj6RVMRMZ6V3rS
	 FO14UTUvEpKob73Lt2Xd2dT98JOqVKid0rnOIe2w7gvP5XYkExCJntI2m2AiUkC+57
	 8RtB85fWyJoMLCVK/we65ey1f7yzO/1z9HGPxYbxir4GENyhWyALhoXc9PGhBW0JjF
	 h6HI5lgm5eIilYT+N/VW3uGq2bl7yG8TrIZ4KF46NEEUfDp77hR9HLuw7JwiDnEvnC
	 eKFq4utsgfwVg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62AA117E1537;
	Mon, 27 Apr 2026 23:57:48 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:25 +0300
Subject: [PATCH v2 07/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-khadas-edge2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-7-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 pin to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

While at it, remove the duplicated &hdmi0_sound node.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf40a8..5afbc593341b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -194,6 +194,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -217,10 +221,6 @@ &hdptxphy0 {
 	status = "okay";
 };
 
-&hdmi0_sound {
-	status = "okay";
-};
-
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -282,6 +282,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	vdd_sd {
 		vdd_sd_en: vdd-sd-en {
 			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

