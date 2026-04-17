Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB23BF678;
	Fri, 17 Apr 2026 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417922; cv=none; b=Yr2vbjRQNOF2yx4oka5WriDIcg4kEOeTmtetOKqAtEvwPeiCgvrARFKfh/ukx/sBRqGt2fqh6TdIqYUgU5cPPt9YblLHKO2Qj3IOVW8jpl5+gvSA47jITmc0G/iASjDYRhmfxo3TUZ2FP81b1raz1d67/cLzhGC/pYJMkQotRHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417922; c=relaxed/simple;
	bh=8q6cJpIWdxH+DQYZp5CzLz39nuLH8uZe5CyQYmM7jPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYkLNXLyFPzRxAmpL47hvwHUCyoOwvLgmayz/7ofRsPXpIMIlY40jsDVCDmrTvQN6/JghREnAUpKmoc19qnaJtsfFPrcR9o2JvuZcxrwFI1lk1zXqFxWgw+Ap+/wzn5iO5/T4Cgqsx8fscgaHdKkKtqU/AdnpmfY7mWppiRFWjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xwu87IEC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xwu87IEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417919;
	bh=8q6cJpIWdxH+DQYZp5CzLz39nuLH8uZe5CyQYmM7jPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xwu87IECGOEY0yWCr2pNCf0y3Z8pw6CLWWRjaAMVX8haJ0rZkA5BnVhWN5hTxRPN6
	 wd/FNt2XBiA8CAUW1wPqDk86Fa7jbDFiYgsoj6mzqMJ61g9np88YcmmFelD7OqtJaA
	 lH3qSEp2YrTTr5xE/HtAFHoHv4GdJNLgeYGCR3UP/OG/ymbOrh6RkvRj7k1ufEhPh/
	 6E5hNksGT8Dl29Tw77joSBVUChoOls+AlFAJn9xNmyuH3dJB/4GPvnWmJ8zS2gSJb4
	 CB+zHGtP9Q43BgyP0K6XFbrz+goYqKScVNVzY2cLh4u2cy0x4AJhR9uCmnC5E6Op6A
	 lPNMIjdBjivxg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40FFB17E1340;
	Fri, 17 Apr 2026 11:25:19 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:48 +0300
Subject: [PATCH 14/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-evb1-v10
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-14-a19c0dd8c9f6@collabora.com>
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
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 09bc7b68dcc0..e9f5fda70da5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -360,6 +360,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -376,6 +379,9 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -612,6 +618,16 @@ rtl8211f_rst: rtl8211f-rst {
 
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
 			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

