Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BF23A0E80;
	Mon, 27 Apr 2026 21:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327075; cv=none; b=VFulB7kJIBY911qujLA4VVKK8Rc797+2Mdd6LJSE8Lb10xXnFKSFE+Tm1AFMHuxtXGd1WJV+blQ+0XWp3A3yrieWgbgm3ZcyIV21uoA8v8HlCe0B/Q32sYzaiBJlRxJHeh1YMDAzg0Xwba4KqV2cf+8a+4CeTIwBUvQ2UbGfiY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327075; c=relaxed/simple;
	bh=FDI0D3bF0d00cd9rT9aq23OMLT8xla/yOJVEQWe89oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=riAB7DT6D/zYOyb5ORoKSYNOv912I6COj/jyuJ+P5QRv0oapabutqCwYMN/Mvu40yr/yw2eQAAW5/sQKSeTrk6Chei8UXR/RCd2cJ6YY9l8gGCl14G02QFhTIIPf6rDG16AhYvobfeXsFvK0gKo7qbK1duYFcqIrdnG6WTGVaCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kSWeEJsr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kSWeEJsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327069;
	bh=FDI0D3bF0d00cd9rT9aq23OMLT8xla/yOJVEQWe89oI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kSWeEJsrKMkD9pCuqJEh+s1UCk4WrgkXADAHiNMbNBuMjfo7MoSETThMr1osw9IF8
	 zN+xPN8IiDXeNPJu3uHYQZFfFtJBryvKOSDcDM+Bd/xmRKgvfKFlKOw0w63qvu64Ie
	 SlLnFlPgftLZY64d1dfuA8HwwTqYxvqwPYdIpvSpWdlr4RtSNaUW/Gg1Ba40uCIo2a
	 +aKKW3JCQUKH7Xvikx7Bkaueqn4+62i+v9ns6gKWFBOOoufo4xf9od2TcYFCR0mtRQ
	 fGf6pqJmsxGcIY3779v1uAA2w7NoW5XZWUURnveY5+6R0n2RdAY0dwxQcVnuiNXo3G
	 Mhf+EFAMk7Kow==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37CAA17E154C;
	Mon, 27 Apr 2026 23:57:49 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:26 +0300
Subject: [PATCH v2 08/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-orangepi-cm5-base
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-8-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B5 pin to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

While at it, rename the hdmi_frl_pin pinmux to hdmi0_tx_on_h, in line
with the naming commonly used in RK3588s-bassed board schematics.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
index 06120b2db690..20da0c2b3d92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
@@ -143,10 +143,11 @@ &gmac1_rgmii_clk
 };
 
 &hdmi0 {
-	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
 		     &hdmim0_tx0_scl &hdmim0_tx0_sda
-		     &hdmi_frl_pin>;
+		     &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -245,8 +246,8 @@ key1_pin: key1-pin {
 	};
 
 	hdmi {
-		hdmi_frl_pin: hdmi-frl-pin {
-			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

-- 
2.53.0

