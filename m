Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92C3C6A51;
	Fri, 17 Apr 2026 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417925; cv=none; b=aBBPxJvRbYoF/yBkQ5E/GvHqRe3QXknGuk3uqc5uGTE47BNYeJFBmRxKC/z9YN+qCx1Z+iOS7ZmAu5OyQ/6afXVFgmY3bflyxnEVsl4GQJPAQtUsXjwKBH19e/fmetcQoxDjxSefh6Rqso234l0DG27JdqU5pSto1XjHKTYQWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417925; c=relaxed/simple;
	bh=sou77FlTVzMQhjA7gThHrUSzC1twA5ROGWEA2MS9xlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxhTY7SHXH8Dt8V8G4n8RjsrwpF/aLz2Vl3vCs5N98MKAx1LLt/ATGLgUAgr57Fsbokc/bqwyVHpxpVSWhateYhesNYx4LEH8CbY79wYc/razQICpPRAHk5zao8gk/aXU7XTR5w00GPJmiBCo+xYhzLKXVGVXydi2rFi9vNTw3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Eb79kOpJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Eb79kOpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417922;
	bh=sou77FlTVzMQhjA7gThHrUSzC1twA5ROGWEA2MS9xlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eb79kOpJTurKinzugJ5MFihX6th1MTN3rOuByeJmzw5mVb/2HY14zZMebQ1WgpfPM
	 0LO5L6da/BSYuJDIwYbEKqQ9cHgCSybBZuhNqaschQcnpyhZa1hKn0DFLXwukPoxU2
	 jLPqjPctDXM+DBNkeb068w/fFXZ+Xx+Zmf+UJAp1C9D1xji+ZV1N5GEJcPJxm3WZ+7
	 tyyxLSs9tymFH9kzxVwe7yQrfWuf5kTfqjzMpXMqmjLa3T8vuE4BKdCfFTrR+lFrpo
	 w8rZJk3vKlAaG1PHXZGIBgnkGOChtzLwa0CENUsdG4S2o9qqc7mtKetffTtSRdf3hc
	 WXw3WNTOyNaCQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8168B17E0F7F;
	Fri, 17 Apr 2026 11:25:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:52 +0300
Subject: [PATCH 18/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-h96-max-v58
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-18-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 73d8ce4fde2b..03b0cf7da010 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -210,6 +210,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -339,6 +342,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

