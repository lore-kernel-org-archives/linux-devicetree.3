Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDF2DF6E9;
	Tue,  5 May 2026 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991106; cv=none; b=EvLnRqHNLe550DzECAqJbMFaqqHmIuBEQbIwgZU4kbw5CWGgM24auNzRz2mrIRz6awgbCQDPXJprtm/RFKg1c80Eg5VgkKFJm00hinXwJHoaFqeayDAIMTfJXHcXU9rY+2CX5AmF1tdWp+YqZC0KDu3USSABM8v6MKP+Dw3/9M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991106; c=relaxed/simple;
	bh=AVBaKymAMimEgUWtRYaUbFG1lawckkp/pv+cD+2y4hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elbA92h8dhAIog9gAqx5141fiDPyeoSJ0+ImC1BNg4scTFKUTDNsAKn0gXBSgfK0mKnzLnKjkTRkQqzsVdRcgDa7fuEd8yv8lDOwg0sQej4bM6rNWqFCfOQrhyXf7x5piR4YjIDEaTuBzAu2oWFFgY4euA1u1/CxXoAjEFGpEMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPA+qTVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPA+qTVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C23BC2BCC7;
	Tue,  5 May 2026 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991106;
	bh=AVBaKymAMimEgUWtRYaUbFG1lawckkp/pv+cD+2y4hc=;
	h=From:To:Cc:Subject:Date:From;
	b=tPA+qTVmP1bCRF2P66dGyA1QN0Cz/Pzqi+KWqlqT1+/fANiZO4l51X88ubq3k2/sk
	 ZHE6SK0odt3LFBp/78zj7wWC0fD8iYWYAlJ92A9VgfiUWszLfRkZ4OICJwTDH3HYCj
	 ODZETpVHWsA+qyiB0zrC0VGKsgVfRay+RewOgt7uSzO9toB/iRUT3RzpzADlDkaR4/
	 KtxThUpLgvpOSdSXcPGj1sLqSx8A4Rp40XRXbvbRpMM3W/gQCtFBWYHpoHL7+DW0XZ
	 iA1sD3InVz0LjMOoA9bb0Fzu03MctsyNyFWAz1bQ9dGDa+Ftjfu6wlYRRozcYYSZkO
	 5FAT4kAmWPndQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: fix pic64gx gpio interrupt-cells
Date: Tue,  5 May 2026 15:24:06 +0100
Message-ID: <20260505-yahoo-deceiving-390a15dad184@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xgqkZxW8PvU3B1C20zMpNDkdyFF229wzrQ2xJQf58Zg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJk//7Z6VyTLlL5gcNi4ec67DFOR4KfZm1afvXGA/yR30 bcri24HdZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi950YGW5NPH0w4v/T9dFd k47GFSZ65Kq177rZHfB6MoeZuuWepnxGho2VD9m2G6f/PKPFf7rk2atYjZ1HNib8TF1R47z09h+ ndlYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

As the pic64gx devicetree files got added in parallel to the
GPIO interrupt-cells being fixed for PolarFire SoC, they didn't get
changed to the correct values. Fix them now.

Fixes: 7219d20f9f421 ("riscv: dts: microchip: add pic64gx and its curiosity kit")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/microchip/pic64gx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx.dtsi b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
index 5cf3e3de0e067..5addfd4357117 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx.dtsi
+++ b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
@@ -494,7 +494,7 @@ gpio0: gpio@20120000 {
 			reg = <0x0 0x20120000 0x0 0x1000>;
 			interrupt-parent = <&irqmux>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			interrupts = <0>, <1>, <2>, <3>,
 				     <4>, <5>, <6>, <7>,
 				     <8>, <9>, <10>, <11>,
@@ -511,7 +511,7 @@ gpio1: gpio@20121000 {
 			reg = <0x0 0x20121000 0x0 0x1000>;
 			interrupt-parent = <&irqmux>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			interrupts = <32>, <33>, <34>, <35>,
 				     <36>, <37>, <38>, <39>,
 				     <40>, <41>, <42>, <43>,
@@ -530,7 +530,7 @@ gpio2: gpio@20122000 {
 			reg = <0x0 0x20122000 0x0 0x1000>;
 			interrupt-parent = <&irqmux>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			interrupts = <64>, <65>, <66>, <67>,
 				     <68>, <69>, <70>, <71>,
 				     <72>, <73>, <74>, <75>,
-- 
2.53.0

