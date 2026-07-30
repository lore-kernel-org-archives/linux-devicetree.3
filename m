Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D032F3A6F11;
	Thu, 30 Jul 2026 22:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785451449; cv=none; b=grVcL+/weKiv6JZq2dlxI5syxQMU6AL8Rs+A3XhrNcmk/IN+FwMbOtNVfv2+4QUEOJkfYr7E+gBn1M0edvrL/7CYDH+DBDgfGQbAWP08TYq+MtDfyXxsF1qstN9kzV3l3z5e5tcUXBahSgIAJ2Gi+AyZM4jSakHoRifzHgt/53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785451449; c=relaxed/simple;
	bh=QsKUysKL+QbLKjZWxuThVsQ0AK6zTlGogBO7XVEwnoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLr9iTPeMISrnuTQ+k5QYRcoB+Kh8SQTdw57qISOuS6EOeXS0jmHdA/p35X0T0DwVF1ytYVAzkO35dQrFjpzA13vOkKYSNa9AfDlvk6dzuBo9pFC8EpJHH3p0phSEKwfS+7RajrD7jmg0DHqrozvyJNKDeFcKFuskrugpWdskYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Yc+SrsCY; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Yc+SrsCY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 818D911B91F;
	Fri, 31 Jul 2026 00:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785451441; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wy+7pP6/2786p1cEJdzAOhNBv0+Zz/x0WQIVBEqSFIU=;
	b=Yc+SrsCYWQCVEePKfmFCdqfH+82wm8HVFHjD/EhN2wSpB7xFgggWS1/JrBy+wYsO47jl8n
	IlFcfXkB2hFKlRGlG7Kj5Sy/60PMQrl0rQP3yoG5XY3Y29yX380LfHN0t9v1yPuGX4ek8k
	q74F4rRLdNx41LjuOzk0TDpfZpIm7Ap2dqYiLB/ZeEP2j0MfJsBG04y8TZIuvu2dnpn5DY
	/ljtOj7g7kJ07Xdh2Q1+QouGzAD+4xT5gnVPzRQXglv7WddzCBxBpVwyT4my7aKpukIlz0
	HArekm27iUUsfUcTer91FbbNlNWmlheyBs2QlaFt0MUwEdMbGxdIRHrmH5halw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Fri, 31 Jul 2026 00:43:16 +0200
Message-ID: <20260730224351.95006-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT label to SPBA5 bus for usage in board DTs.
No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V6: New patch factored out of previous
    arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
V7: No change
V8: No change
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654d..bec64cbb36347 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
 			#access-controller-cells = <3>;
 			ranges = <0x30c00000 0x30c00000 0x400000>;
 
-			spba-bus@30c00000 {
+			spba5: spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				reg = <0x30c00000 0x100000>;
 				#address-cells = <1>;
-- 
2.53.0

