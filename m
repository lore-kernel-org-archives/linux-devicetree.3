Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0433CAE95;
	Fri, 17 Apr 2026 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417927; cv=none; b=MND5w0aBkRXEQ7gDTNHqa0AhXLdVtwcWj2D0lC/Zs16msTht3Tu9WPnnprftRwkh2KJ1rtwHQYjru6JGt0za7V5V4QuzJPVb56p56jc24qmvOmhPj/TwnjTyzuFlU8k9AFst9VgImv0IcLWOjHrSlta4xb/RGcfspcotDLuy8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417927; c=relaxed/simple;
	bh=VEHvR/rfFEr/wjIRsp05a//STrl9Mt3CF6cDO7GtNQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zql3Hk6AZAECbejpfKIeWDC6U7MP38IuSPdUmIxAZG3ncKbhkRtxsi4Ws+DXIeO/OR4TC27Q1gbECSaFdRz36kcntAu8Fkg6Xswcg1bFAJ+n3PryLdJ3TK/0CQUCf6epAbheVKdDMOO04V1F2E617dOa2RL/7/J/mN4HFNA+hQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LKmZd7fN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LKmZd7fN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417924;
	bh=VEHvR/rfFEr/wjIRsp05a//STrl9Mt3CF6cDO7GtNQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LKmZd7fN76gs+SCFEUqD7SBckpSnNVM64A1e3INTdhIWrBFUNlE+7TYrGU0K03xgW
	 sokVRHgrzlEIzfMCPkSlZIQB4f3spElTT91SrvTy7c32Li0aFS9Y/tN20Ymh35nso8
	 as2u2YjTLcwp8MzXYOkAm3PakU4aOFisUBCivxsteh+CDzJmw4yT5FOxoKkh2+37e0
	 kjdL4u3lEtHea5zJdHqk93RaArL8wmaFqmXt0NIGbLlRxGHR8c4XmdVI9kg3t9944d
	 4p3nkVeWg4chr4TSGi/+ZGPa99TSC5Lr46UOrze+dt1SfQYbMqPvZhEJnOw1igNG5+
	 oXJ5pED9tt0bA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B78B17E127F;
	Fri, 17 Apr 2026 11:25:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:54 +0300
Subject: [PATCH 20/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-mnt-reform2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-20-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_A0 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
index 78a4e896f665..9e657d953566 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
@@ -148,6 +148,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -205,6 +208,12 @@ dp1_hpd: dp1-hpd {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pcie2 {
 		pcie2_0_rst: pcie2-0-rst {
 			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

