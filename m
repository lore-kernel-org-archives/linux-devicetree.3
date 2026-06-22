Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D73905EA;
	Mon, 22 Jun 2026 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120927; cv=none; b=jE0icj9wJ9M7KMhvUFDWL9Wal6dqiR2XmRom2NAMv3bXzmoXlL5c+scPzRrQeu3WoR/uLHA8hKhaoFSgVJIgWiE39ZjApA2EMDeDApLvKHNGIgRCXq8AJRzcYi7oAVIx/Bzn8pq/jvf3W90xk0t2VpFJVvseiLRK8siq9VRYzAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120927; c=relaxed/simple;
	bh=ZIo82ep7GovsrR8A2jpkssVrywg877Z3OT53FyuTn0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mLGJqBqEq7Rc4UyVOoipn7z/D4UjwP7LZKTH8pPASKBJReBACkKMEgoBVfEl/pCoyGqEhkb+yx8DH8ku7MsJoIX7h6CcHMHyjQPYO6arvtfM9kxm9vBgTF5V9C5jpoGnSTJl4/f6PJEmh0Z4IljdOtnk91PJ21svpPHyWIHV7uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=lMpDLwRt; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="lMpDLwRt"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id B0C2E1FE54;
	Mon, 22 Jun 2026 11:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782120916;
	bh=QDh8cyCuG0BvRFs/KskkYUXoHG61lWt4Q8mGTanX63I=; h=From:To:Subject;
	b=lMpDLwRto8FVTIVQFZ5qHScNPQEX4h6jcz7YL6kReq40+Yahq+8YmrBihWAQfbc0X
	 Y0kUQZAI29s7i3gqQkWUGmtfxMcryYE2MLUpykI20cHVAAQTwdXq5+Tx4QQYTuyRr0
	 DTv2yvV2l+kIYdonILIpiw8j6GLKURnHalAXJ34PAmF+omiLK9cnLR1PrKYYXvLp6/
	 kKvjlNzYSq2dloEwDUkh68UVzuLPUS2n9e/E5ypjgvzyUwMCyUvv3uGPhT9MQmxntg
	 zD6kYYtK7s0aP1JoRasSuqZ+G6aYel95NNNycys5atONlV8L88uQeDpTyCbKR9W7Vm
	 UJhZYA0tdBdLQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5
Date: Mon, 22 Jun 2026 11:35:06 +0200
Message-ID: <20260622093507.44132-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add alias for lpuart5 so the UART gets a stable line number.
Without this alias, the lpuart driver fails:

  fsl-lpuart 42590000.serial: failed to get alias id, errno -19

This prevents the Bluetooth controller connected to this UART from
working.

Fixes: 104a391bb6ff ("arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7d760470201f..a6c5398a81e3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -24,6 +24,7 @@ aliases {
 		serial1 = &lpuart1;
 		serial2 = &lpuart6;
 		serial3 = &lpuart3;
+		serial4 = &lpuart5;
 	};
 
 	chosen {
-- 
2.47.3

