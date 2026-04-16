Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829A38E11E;
	Thu, 16 Apr 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329713; cv=none; b=Qyy44pXaM5eWzIN8gs0EqcJmR2w0vbNyKzrCViLmtPWnHDdpEE3C11EiJw2+ggmPhHGEY8OLoPB1hqnkAeSwBGSNd1wBcwUf+cP9m4M53NRCafdGR6v9T+vLQUluLtHmlAD2bViXDMWESrIDgXFpx+xfG3NTasQFuxFcya5A2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329713; c=relaxed/simple;
	bh=lyciA6D1svothfyq1FxMYi4aiIW3PQdO74tZM2hpXA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZf8JD7wH5pQc2CKRxL0i1+iWpfLaZfoTHMClSu6jjdWF1C82RSUFroYa8Pif30KVCvCTxYQuUOj72laSkVhduma/LTg1tRse2zdCls6iRY5qTZVIsJ5lrObNto5FQKOvf9yOW66kKYsMJa4UJ81Jao9WQ/FcJGiwyZ7B44ZZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=kwsEX8G/; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="kwsEX8G/"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776329704;
	bh=lyciA6D1svothfyq1FxMYi4aiIW3PQdO74tZM2hpXA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kwsEX8G/0e7NI3BHZeK+D3umxmq1QR8UBHlip/pFiUW+Q2cZtUooIg/iV26BHQk5V
	 RHiTIily0lJgcY7a2cmWyYGlbRoYYaM3rmz3V0/CxZPSvyKgg3lI3rPPDj61skPzPv
	 lpaFtZNudERhezoXTNi84fiQJNL8XWUyzVkdeOtM=
Date: Thu, 16 Apr 2026 10:54:40 +0200
Subject: [PATCH v2 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-add-bluetooth-t7-vim4-v2-1-9a57098fd055@aliel.fr>
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776329702; l=985;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=lyciA6D1svothfyq1FxMYi4aiIW3PQdO74tZM2hpXA4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFCzFomjZs+CMkB5MNCBKH0DvAIST7/IEQ4XXSET+/GzGlbYz9T79cA7A0210rhPfdJtvmz9RyX
 7aGJ3fo/OMQo=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
in the T7 SoC pinctrl node, required to route the UART C signals
through the correct pads before enabling the controller.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..4a55d9641bc9b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -553,6 +553,18 @@ mux {
 						bias-pull-up;
 					};
 				};
+
+				uart_c_pins: uart-c {
+					mux {
+						groups = "uart_c_tx",
+							 "uart_c_rx",
+							 "uart_c_cts",
+							 "uart_c_rts";
+						bias-pull-up;
+						output-high;
+						function = "uart_c";
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {

-- 
2.49.0

