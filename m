Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F3371CFF;
	Fri, 17 Apr 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417912; cv=none; b=C8GIE0dlCCbsmA9Uaxn/Gx8tLBUnXsPdLm50htRHVHzpir4MQIzGt2Zp21dt2VO9NBeleM8J4TusfkeKB+XCS2vzqRoBF2KfPJQwtfZHhiW+KJCduWJArMoGOPJyUohpylsPoC9sxeq8O/6ZmhunUSXJhJhAwvytLljdxxEJoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417912; c=relaxed/simple;
	bh=d9hxhBPZejunPRDUDJgauWuYJADihmxbqrt2hTgM1KU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrMGBw5kr6rLVZqV0QTq2/tQZX0SeCDzqEKpUq+unl0Tl2qNVPLAzD0RKT446Mz1pYssyfobo4BsC6zuU+Q5vqRiAAKrV4vC0Nx4GKA1a5TjVTjTGfhXWQ6tKViFLxMwP/qRiqNRzJ1PqVQMrNs6wqx5PvnW+N5TBPm/8Vcb3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VaNWlXp8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VaNWlXp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417909;
	bh=d9hxhBPZejunPRDUDJgauWuYJADihmxbqrt2hTgM1KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VaNWlXp8xop58zCxKpkvCYqZm7Mxvb/g/zmSKP/qRSb/DO8NnXeDK+dNSAgmodCcZ
	 rvWK5/GCdoPNNTcoXIP7hMCs+fsmK4A0weOESsxrpCz2vHCpJXhsXl+D4lXKQmZFj/
	 vdtvbKL+P5/Co12o3HW1WwI1t+Xo+tiUg+O8XtsHD+zEWLuizWHrh3VbDAWrBn7Cuu
	 1nABgGkyCtDJS9709dx/v03f5wwsyGAiORpXiMNn+JB+RUOMEwBqoW4CeZSp3TXiwZ
	 EncFXSTS/TMwvjyQeAsA0qjEz4kW6SObLx7Z+cMQbmxudLgHQoZrYgAwKcZd/+jcvv
	 /dKun2qIS96YA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E35E17E1340;
	Fri, 17 Apr 2026 11:25:09 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:36 +0300
Subject: [PATCH 02/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-armsom-sige5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-2-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO2_B0 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 1c100ffd1518..43a5c6859909 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -304,6 +304,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -819,6 +821,12 @@ hp_det_l: hp-det-l {
 		};
 	};
 
+	hdmi {
+		hdmi_frl_en: hdmi-frl-en {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

