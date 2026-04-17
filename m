Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342AE3D47AE;
	Fri, 17 Apr 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417943; cv=none; b=tiMTApb1YzcgasMOZbC4cCz/NEdrNZiEo1S4iC8yXGf9Deyk2uWnPA1qcFULzxeMt3tOHDkfATnA70Oj+IXA6hONWV5Y8FTekCGFLVTbmBgwfXpuk9QuJZPLp6dSpODm921tPpJUWoMexuWk6BmuFG28zg2jmH7gYpR+i/IfYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417943; c=relaxed/simple;
	bh=XbzjAh5GlsBnF+UiRnVx1scusxE5jcPAWzRBxxB3EuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwxWK/NHmm6hQIeb5UpbUawY6qrAlmd+7Yn8rpXNFv5hP2Pd6m7y97NQlqQ2FjdiHR29EpgRFBb6H29AFnbxlz4q4xPtd1oK0olwrmV8zBcEqIp+aJe/bt6Tml/gFw4Qz2mGoMFzJhHq4vkksPMNkcdL0pTRtZwwea5tAQs/IV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f6vKq53W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f6vKq53W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417938;
	bh=XbzjAh5GlsBnF+UiRnVx1scusxE5jcPAWzRBxxB3EuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f6vKq53W7v/i0kvHNhJ327MXUv8AsAhsIzWtnn9WPR8BgNslswqH4blyjCr5gjrjg
	 09u7X+soq3HQZn7OVoBYPSl6oUcAdQq5nBnlBRXt1Xt++gJNtr2uu1LMNNJsQs38b/
	 FS4P+2HhtKoDpU4mdIOSKcPSN8uL6ZKIREwy8l/VE6aWpXjANbWzrbGNAM3v006UM6
	 NuPOrbW3ezNc4SDXyGtQRX4IEyscnhuDg9IfrMkEXeY7UA/3nGK4BO604l0IBF0Jzq
	 FvV0LiRqXtGo4dBO3H5LVcZ6eePZOvYDkTFosajHZePMXFUn/V1CzTgkpfpa/5HA7O
	 FyfEMj5Jk1/oA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 232AA17E131B;
	Fri, 17 Apr 2026 11:25:38 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:11 +0300
Subject: [PATCH 37/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-radxa-cm5-io
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-37-a19c0dd8c9f6@collabora.com>
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
 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
index f80d5a00a4bd..339df05c6d71 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
@@ -120,6 +120,9 @@ &gmac1 {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -217,6 +220,12 @@ usbc0_int: usbc0-int {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

