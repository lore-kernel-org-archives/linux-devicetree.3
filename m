Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9672131F997;
	Mon, 20 Apr 2026 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693267; cv=none; b=NQeMDjKxvgcRTXIoSg5W2J6o7aXnsSBwZ+/5AB7FzllyyFxLHv8YTL4h7qwGBZEMa7FTvJRBymqscYqbGzLc/AZyBMLbOsMZjzYyc1HOg3osVVeeP2EOmLtEg0QBt0pWaTp51CG1VEPrm0bfFZGGqhPW1NDnJVLtl5WsxT+gftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693267; c=relaxed/simple;
	bh=2xif9DrmN7soyQpQm21uxoFmAmF5UmT4xjhU2FxZ+xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hB5h4hnvyv9t4os+Im8r45ypJzlJgAsM7hsxg7e4223rQt58Fx7yY0qLNo3CipLPFp8PX3ROIW9cJJrtVFgpA6iwmu6VyNmEJiwl5TnA68qSwIV8UZNLo3qVm4WjMYCDAe1YVbFd/IzZ0lSTJOnIJCgygL0mMyZoheFPc6rnjXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=RdEfQYMB; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="RdEfQYMB"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776693262;
	bh=2xif9DrmN7soyQpQm21uxoFmAmF5UmT4xjhU2FxZ+xY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RdEfQYMBc7KxHZnntKxysggUJPzqbo6H3R8CcMZNDTZlPe7kNc/dJduE9hslXAn5a
	 8hbDTwgsZaB30j0yDi+HWzhZTetHpGJFE3gMcXDKptQwriAk0mo4gYZJaZQebwMhoj
	 uldq2vu69zlgOHL/A876rClMTrG7vYsjJFfM94os=
Date: Mon, 20 Apr 2026 15:54:02 +0200
Subject: [PATCH v4 1/4] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v4-1-9505df0e7016@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776693260; l=1042;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=2xif9DrmN7soyQpQm21uxoFmAmF5UmT4xjhU2FxZ+xY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPuqg4yh4nEMBxiZjZbHTCP4zI0FzWHil9LvEk0WtPvvtgxdEAbhBgxzFhUfMQp1jBZ4gCOJr4M
 CzPuIgQe5HgE=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
in the T7 SoC pinctrl node, required to route the UART C signals
through the correct pads before enabling the controller.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

