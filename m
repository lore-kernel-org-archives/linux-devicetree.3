Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA63DCDB5;
	Tue, 24 Mar 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345035; cv=none; b=qfi/m7JomSI2/qKVOXzahReQ1tWMWJ+/i2FXljt6i0U8QRkwKTYI58WxUnqQdqVLZS5PqTKYYM6SNET/zkf7klekNlmoQN7/egSSyrtFU/E+oKIzsNoernLrm1rdm8xrkePHD7BN18Vp4ozp+CEDhOr/00Nc2OEhJ91P1mkOS1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345035; c=relaxed/simple;
	bh=6lFlg1kLwQBHA8HJQe9NdSXTP189MfKUt8Mn53GZmqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApI9ZP9LCiO5lRlSn4DIrdrD6Lmwak0FUTxrkTadBqjAS0cuM3yEXuE3Mg6NY+acJnPSvnmAMoikUCPK+Jahf9/r9TdjtbL66DQrWU56onazcgQqMM5F4AwXj1vqQsfzOhuB0Q46ZtDtwn5QUNDpIoYRBcZ7h5KO+ph0uPaT2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=t2sF9pRD; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="t2sF9pRD"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id ACDEF275B5;
	Tue, 24 Mar 2026 10:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345032;
	bh=gb+3Jow3GAqKqQOMGmcxIHKlMXCv3k5PivcGruWwYOM=; h=From:To:Subject;
	b=t2sF9pRDTyosbkfc2DGZcGDlewRrW3K1bj1bxDPSzyCie+OrxJ5Pif1+TTLp7w48+
	 4qdMEWHagP+h/VcB4BptIDyRU0I/sEd3N6nl5vyoreT9NXRPeSwJJg3KhzJmMOfYpF
	 Avkhr3RR5IZ9esgvaqgZHSkfoEJ740q5qChzaV+tvEYlofLLRt2YgFYNXISnsq+zkh
	 eLmE1t0Gy/uILVaHkIfKMF6bZDS0/NSbyl0jGGksS96ok7OLMwJDOWyLtO9lYKYBVm
	 iIZUPeHk9r+Qga0HEPFPC517OkqAqxVftqmUIPubCpht6XzMB6DdmA48u1WBmxXefB
	 x4XLlN/9RM+ZA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] arm64: dts: ti: k3-am62-verdin: Split UART_2 pinctrl group
Date: Tue, 24 Mar 2026 10:36:58 +0100
Message-ID: <20260324093705.26730-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Some carrier board reuse the UART_2 control signals as GPIO, split
the pinctrl RTC/CTS in separated nodes to maximize flexibility.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 219b729d3caa..735c43c67fc7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -820,15 +820,27 @@ AM62X_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (A12) WKUP_CLKOUT0 */ /* SODIMM 91 */
 		>;
 	};
 
-	/* Verdin UART_2 */
+	/* Verdin UART_2 RX/TX */
 	pinctrl_wkup_uart0: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
-			AM62X_MCU_IOPAD(0x002c, PIN_INPUT_PULLUP, 0) /* (C6) WKUP_UART0_CTSn */ /* SODIMM 143 */
-			AM62X_MCU_IOPAD(0x0030, PIN_OUTPUT,       0) /* (A4) WKUP_UART0_RTSn */ /* SODIMM 141 */
 			AM62X_MCU_IOPAD(0x0024, PIN_INPUT_PULLUP, 0) /* (B4) WKUP_UART0_RXD  */ /* SODIMM 137 */
 			AM62X_MCU_IOPAD(0x0028, PIN_OUTPUT,       0) /* (C5) WKUP_UART0_TXD  */ /* SODIMM 139 */
 		>;
 	};
+
+	/* Verdin UART_2 CTS */
+	pinctrl_wkup_uart0_cts: wkup-uart0-cts-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x002c, PIN_INPUT_PULLUP, 0) /* (C6) WKUP_UART0_CTSn */ /* SODIMM 143 */
+		>;
+	};
+
+	/* Verdin UART_2 RTS */
+	pinctrl_wkup_uart0_rts: wkup-uart0-rts-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x0030, PIN_OUTPUT,       0) /* (A4) WKUP_UART0_RTSn */ /* SODIMM 141 */
+		>;
+	};
 };
 
 /* VERDIN I2S_1_MCLK */
@@ -1502,7 +1514,7 @@ &usb1 {
 /* Verdin UART_2 */
 &wkup_uart0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wkup_uart0>;
+	pinctrl-0 = <&pinctrl_wkup_uart0>, <&pinctrl_wkup_uart0_cts>, <&pinctrl_wkup_uart0_rts>;
 	status = "disabled";
 };
 
-- 
2.47.3

