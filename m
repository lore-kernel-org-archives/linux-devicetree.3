Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2E2E1F06;
	Fri, 17 Apr 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417911; cv=none; b=nuQl8ZkFSTNqX/qafw1uISzyApG8NXWwXfvUg3f+/68vYj6ibq5s9MUdeNSR8R632atG/4wqUhl8l6/Ieb69jKoKnnkGMFqySf6jbIeXcr+WapuLCC//dpSI1jLhSlUZ4Zzpo929Y6hHcz7GBlvhbubgyOFcl7vfHhkxzMyfALc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417911; c=relaxed/simple;
	bh=1FB8Ne/opPut3k7EyBbqr/Fla+NvE26RGBGOhlMg2hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZmsAbJhg3Eyw3kHQzvx/aI7jhmRxkuDJUM6T50kXABK9HJ9qOPt5mLAb59RBf9G0qlfCVgE+v76b1wbBthC9liNukKfNRYFH+sepgu5cOE495KFbonyyoYrq2JXYCySvBBQ//i/3bFpZ3fPejPHM4mZrdRW6tZdZFIoAO4GojM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TpH6t8oJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TpH6t8oJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417908;
	bh=1FB8Ne/opPut3k7EyBbqr/Fla+NvE26RGBGOhlMg2hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TpH6t8oJdmqg64wHT3X/ZeHiGTsq1Ucyd42T2Ay78yhi7QLYC57U9S+9Pv2V8hiIR
	 bfop1mtr4sh9alQjqIPa3OD4zzCD7XvexXwcUAizHS950nINxsI3DEt6N39MHd4IOa
	 WzX0qk3O/0llDRCqJQSQt8hbhItLfF0AEZeQxbNfGIlhjBUhTZHDo8I70eBz5GfdPQ
	 qph8aoVYW9ZlFJMsu6kLWOtYzPbq+EGBCyoQK4xdYyJzB87kN1yTo09Ja7cuv20fLB
	 oPUgX/fQ8pfXO/rjJo9dXaiU9RxSMKf21CD6v9yPrTFoGVOKFxtFkzJVOGcb7hN5hm
	 7ZGvFc9e7F7fA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA87F17E131B;
	Fri, 17 Apr 2026 11:25:08 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:35 +0300
Subject: [PATCH 01/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-100ask-dshanpi-a1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-1-a19c0dd8c9f6@collabora.com>
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
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index b19f9b6be6bf..9f356bfcb663 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -278,6 +278,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -738,6 +740,12 @@ hp_det: hp-det {
 		};
 	};
 
+	hdmi {
+		hdmi_frl_en: hdmi-frl-en {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pcie {
 		pcie_reset: pcie-reset {
 			rockchip,pins = <1 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

