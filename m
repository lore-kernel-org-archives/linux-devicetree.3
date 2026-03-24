Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F093DC4D9;
	Tue, 24 Mar 2026 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345036; cv=none; b=tyYuZb8eR6TWBklxnJUEyI/ROsXz7tw/6kwPtQjNHb7c2RVbUDeCDT9I/eyJZTRXtQNGriFeS4AwlsTFIsDu6iwgu0agtGYWTk7DdQeqMq9f9AZHmQvwZCCwfBCyVe4eeg65UEDQwoJuMAWbidAaHPIpzAp42P/hsOrfQr6hhuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345036; c=relaxed/simple;
	bh=QnwY138a8nQ7iWK+gvjDSfRMmJTSvm9dpepcjPOMV28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtpyFUSNGbGT/Mu5gDThOPFCmn9tcZD9kigx/uxyQk2O6/gtvMB56GC3dZVgY1w7wIL3px42CclVChUVEQtjXWNftKYV5AHvRR5ULkvY4LWIsLeFJpqaqR9NROPmvqiiN3yXzQUgF8tywRnHqlPsuTBcoF8aLr0TJ01idEF8WxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=nf1A3cLb; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="nf1A3cLb"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id D354B275C0;
	Tue, 24 Mar 2026 10:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345033;
	bh=ziNRxF6wJwQ72ndkJaxRGJmIPHBGp++CSki9vPy5xpk=; h=From:To:Subject;
	b=nf1A3cLb6AxucZ9/fzjIeOHLm7VwWO1mlI+4XwM3kFyDAcxRNN2lPdeXSJx05+I+M
	 2ag15jOg1ubvJssfUxPPJHwcQ78MAtpNr2zuCXQPKlNHTbspOjHcAfKK0IBZWEa2n1
	 dDfotOdpjYxxEuG+oK9CFNwVReuQD0ng9VN7pifdrK67ZmMLCKL40I7WYWERuG8q9C
	 s6YrryMDheL6WU1s9b+3vbWpTjmb1cA9wPp40DlijpSdxa/1k9aNkfwx6fkBdQCJ4h
	 ns1mmIF5FOFcWQ8ik/vUxhpeOlUVAqodozyGzXxTt4R0+RNe+jUocjEzgl9LV2UJak
	 fdaxX9PLky2tA==
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
Subject: [PATCH v1 5/7] arm64: dts: ti: k3-am62p-verdin: Split UART_2 pinctrl group
Date: Tue, 24 Mar 2026 10:37:00 +0100
Message-ID: <20260324093705.26730-6-francesco@dolcini.it>
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
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 22 +++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 34954df692a3..1c4c951e5e94 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -767,15 +767,27 @@ AM62PX_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (F13) WKUP_CLKOUT0 */ /* SODIMM 91 */
 		>;
 	};
 
-	/* Verdin UART_2 */
+	/* Verdin UART_2 RX/TX */
 	pinctrl_wkup_uart0: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_MCU_IOPAD(0x002c, PIN_INPUT,  0) /* (C7) WKUP_UART0_CTSn */ /* SODIMM 143 */
-			AM62PX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C6) WKUP_UART0_RTSn */ /* SODIMM 141 */
 			AM62PX_MCU_IOPAD(0x0024, PIN_INPUT,  0) /* (D8) WKUP_UART0_RXD  */ /* SODIMM 137 */
 			AM62PX_MCU_IOPAD(0x0028, PIN_OUTPUT, 0) /* (D7) WKUP_UART0_TXD  */ /* SODIMM 139 */
 		>;
 	};
+
+	/* Verdin UART_2 CTS */
+	pinctrl_wkup_uart0_cts: wkup-uart0-cts-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x002c, PIN_INPUT,  0) /* (C7) WKUP_UART0_CTSn */ /* SODIMM 143 */
+		>;
+	};
+
+	/* Verdin UART_2 RTS */
+	pinctrl_wkup_uart0_rts: wkup-uart0-rts-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C6) WKUP_UART0_RTSn */ /* SODIMM 141 */
+		>;
+	};
 };
 
 /* Verdin I2S_1_MCLK */
@@ -1410,7 +1422,9 @@ som_eeprom: eeprom@50 {
 /* Verdin UART_2 */
 &wkup_uart0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wkup_uart0>;
+	pinctrl-0 = <&pinctrl_wkup_uart0>,
+		    <&pinctrl_wkup_uart0_cts>,
+		    <&pinctrl_wkup_uart0_rts>;
 	uart-has-rtscts;
 	status = "disabled";
 };
-- 
2.47.3

