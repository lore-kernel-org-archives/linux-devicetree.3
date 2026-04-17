Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583A03D349D;
	Fri, 17 Apr 2026 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417938; cv=none; b=E7hHpu+/R5X+J7mQYfw1AoW7gzroGhrJ0iLarEcp2cSTxCvCIWSsQnENODWFn7Ls2MX7Xmhiglh5hukNQEkbyrtE3OB4/pfKaBWZYHhWv5kW3RlrkJssqCG7KRPC1pDzm+nr7E4zxzcvR0qFUl5UfI5/JLzUyJoiHz4SsXkwBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417938; c=relaxed/simple;
	bh=NlHg4VGvwnByoVZ8nGKKfl07owTaqbpvNt+6hi+fyo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czKSZZb5PamWCYcLTT0yhuL4KfM0lQkONftLWrZCOAFTyNNvGBCpqJurj2t+KS7wEdacokBcRZ8GVyfMdsePjb0fo2h5n/BqkboqOowOiF1/9iiPGNtP0OBBCE4WOh593DVwx6NxF7tcX5HMDIBHCawDSoibjo9a13dcXKQO6rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jMTBZKIT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jMTBZKIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417935;
	bh=NlHg4VGvwnByoVZ8nGKKfl07owTaqbpvNt+6hi+fyo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jMTBZKITIHzNnFNxdB2hm6gr/JYXwQxLID0STcVxyfQuCA7BvfRG1XDhcWIdvtlhs
	 aBBzTMwCYV/eUhFzF2LCbStSIPMhOebmwFcIuD2dTzoor44zWjc3eAvl2F5cPsRnDs
	 dYe302+82A+OHWdOFF2oQs+SKqHxfrH+vVYM3u1GeyK7w62T+SBE6fVVvk6BXYjjLB
	 JeCsDmxQj+pjL8ZDzIE//ZyKyGXsa6/Zm/GUzkWquHX4GiYHaZt66BsD7AJRlEe8G1
	 Vl6TQ0crxp5/2f1x/KA5GV1tR8bXfuOqDKmzbR3rtgcz2z5REvKz4qLOfeqEstPhfU
	 PM+wb6N4H/VJA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6BEA17E145D;
	Fri, 17 Apr 2026 11:25:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:08 +0300
Subject: [PATCH 34/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-odroid-m2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-34-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B6 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
index a72063c55140..2ec3bb6d682e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -249,6 +249,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -438,6 +441,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	lcd {
 		lcd_pwren: lcd-pwren {
 			rockchip,pins = <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

