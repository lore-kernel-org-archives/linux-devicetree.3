Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1683BC669;
	Fri, 17 Apr 2026 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417924; cv=none; b=jEq+ODPgLKpyOEaniQQTBvJ2sYNEc9E0qw0R8GoHiW/Sz+1wRxHlNkCHRxYT6GVCPMx1uoZT5ARIRhPusvr79px0KT7eJxTatYIRhquRjWCGBtoDYPkMnYShne8rb8SPDSaXXkdsktLZCvpguk2BTwFg1EZliVi6uXgZ5vhFXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417924; c=relaxed/simple;
	bh=vkwXOlO6bQNK5dcmAj8eeyqpdGR9PrIdehkj24W1xq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5tn9noqLDe6nClYSdsnDgX5PaQLBSQLCqNpmYY6G1MixUMPqwUSRfLDG9+uKBTT2zdyMKgwTF6CB0ayn0IKwzssKCI0oUpd8gH3D1NPuhW1AoZyatVd7RczTT7CDCOaxDZQx4EPgIHRWWz5hFnWgg/pTWVubMu7xRrZUWZodtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mZKvP7BD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mZKvP7BD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417921;
	bh=vkwXOlO6bQNK5dcmAj8eeyqpdGR9PrIdehkj24W1xq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mZKvP7BDt+jhOAl+sHqS2KZhi0pZ9SZFOVpiP64bIvbEpQ7ST9fDb0OP2JTOuULTx
	 w8aA0xmKWx1QM3e6Z22AlpkVmVJ+tov/5IYkMlPVEN5uYLyUT7y5W1CJLT3unb8Oqx
	 pV8WClajg9rX4BJ+7qxLlTw1xUaDnd6Q0LZ1xObH7O0cLeO0mVDL5N5fynlu44PP+q
	 Z3ewbmJo25k5L4gCxAaMtu/xU21BQ7haSCT6or7TGJF4hTa4I4uorMKVsKBwCnpEUS
	 4OKandBGwumMo53QNNLUbYLQQN1YPauTh4bvB/H7AHwVWvqb/5jcYkHOX7o017s6FJ
	 tK0LXaF2jY14A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD57617E0CA9;
	Fri, 17 Apr 2026 11:25:21 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:51 +0300
Subject: [PATCH 17/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-friendlyelec-cm3588-nas
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-17-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 and GPIO4_B2 lines to control the voltage
bias on the data lines for the HDMI0 and HDMI1 ports.  These lines must
be asserted when operating in HDMI 2.1 FRL mode and deasserted for HDMI
1.4/2.0 TMDS mode.

Wire up both HDMI ports to their respective GPIO lines using the
frl-enable-gpios property to allow adjusting the bias when transitioning
between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 10a7d3691a26..2d17c77e9e5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -331,6 +331,9 @@ &gpio4 {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -347,6 +350,9 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -520,6 +526,16 @@ key1_pin: key1-pin {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
 			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

