Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B43C3BE0;
	Fri, 17 Apr 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417945; cv=none; b=jqgYOq9SDIzWUbxiGW+FHaFHzkLieXcJYclDqLtMXnWw5AXOwp4F0YXimvh11/slogxKite/KwYGCGqGJG7ZjlgYQ80xBTOXMHs291B2Aa2uiAYGS9IMj31T4ehTL05PUYx39uoU5bpKuy0Z+Vm6Xm6x/gzqhZXXRczOgUtOg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417945; c=relaxed/simple;
	bh=DqumH3cbOiT/lZQvNfpDqshvLeTDzUp+/4PTZ7qWh+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/7nPDe+jmHX9RVNm7yqyg34oOBvU8mlAf3sWUqgdn1/T4CZD2KLUC2lJ9mwZ//bRPNt0Jbmr5xn68jNEHSttsj+4FvhsO3waNSHN0qh5QvjwUIxyY3TCRcKNpxWqzvsiUFvfrV75HDuL78tVn1JsUaiEoRpetmcYrf9RhAgg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hdNNIsPF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hdNNIsPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417939;
	bh=DqumH3cbOiT/lZQvNfpDqshvLeTDzUp+/4PTZ7qWh+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hdNNIsPF6JpDSsoAp2ohdn+04Ph51QsdLNCObdyS0qvKVRpnuskLKhFR/AI+ry9Pt
	 dpismdBmY+kJk/tP6aq9F9IZv6pItaah29SFoKLa9UErheaSSrZMOpPVCNqxvKo0qV
	 jUFb3O1afBYYRptM+Otw4jyNI3cMwaSd15SaS6Ob0nnAQ3Ny+zToLG7xdMeDxt6Bod
	 1SsNOVP4WvGYMSrprbfHdS+mmTzjzKlu3vLRICSrhM0cpKXNOuMBJVcaIn8DiwMRzm
	 Ze46BWK8cDybwZ/6n+7ArcZNhMcXdLB+lVG9mqf6HoV7Xe/6vcSSC3VoHW9H8XA9jt
	 WQY54N8kaJQpw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C139F17E1340;
	Fri, 17 Apr 2026 11:25:39 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:13 +0300
Subject: [PATCH 39/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-rock-5a
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-39-a19c0dd8c9f6@collabora.com>
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
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index 0991f6a21190..b3afbdd7119d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -327,7 +327,9 @@ &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_cec
 		     &hdmim1_tx0_hpd
 		     &hdmim0_tx0_scl
-		     &hdmim0_tx0_sda>;
+		     &hdmim0_tx0_sda
+		     &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -373,6 +375,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		io_led: io-led {
 			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

