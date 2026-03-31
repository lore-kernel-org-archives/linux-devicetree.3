Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577993D811A;
	Tue, 31 Mar 2026 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966768; cv=none; b=NyGA0YxQzVaugVHeNfyzf2FfTJwa23F60w+qBw3XyYFk9n8ySMjXHaVM+V5U3gC7HF5ph53Nk4C9ZtYxWYwnLNVSXcPbIgjEoqaT0Z7r+WASW1rQ3tNwoDIAwJBZsTigrHW4WLPtpKVbU5OpoQP/HikhAA7UbWkFuG/Hxxf12RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966768; c=relaxed/simple;
	bh=nnqwKeY3tSZ7iGmK1VW91jZ3qqEtcptwPTUk8yZyxsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL53c13UCxdJMcj5rZLjmqCSq2HczKafXN78yD6l9zCLl3wyHXUk8gB8/HGkt7KAm8TtWKC+4pNEEHVmdqoNv3+qOzlD/yU7jV5OT3u9dSkWI7h86n6mFoEi7dOlZ6k48oZv6r5joJ3vRLColtRt2WJewd+568JWdQatWMET33o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k5aJAP4x; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k5aJAP4x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sYKAYwmhafN/zPmLO4GAJE3orSeGPeP68O5+nLKp7Xs=; b=k5aJAP4x8YPRe9sneC6P92hK0s
	7U0r0VyWK8e3BZN4U90aR3S77xBNy9ZSAsgpxurSv6+uLBuDkdVYCPjBR35QWFHu4L9FwDGJwIDSH
	yJPwzvTH08DZu7xpnx98aj9GefNsldOf9i0V1R7dgVKCzbVzRWBr6kUKGzyINDZBy7aKLVfY4FkdA
	h2QVL2tRbSiv6n27FJpI9KKWmyant9a+GUB6CV3L74sEoxMjV3ghnaAB5cB6zAPn+jJTaWPwkJyqM
	ANROZafE0bJomjubIJtIw+u2Jeb0L3HOMeo0nwECQgnGVPbZA2hixKuAAQlgwCI/HY22/NkFYfVdT
	U8qAOu2A==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwC-000Jrv-25;
	Tue, 31 Mar 2026 16:19:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwB-000Mdz-38;
	Tue, 31 Mar 2026 16:19:24 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
Date: Tue, 31 Mar 2026 16:19:02 +0200
Message-ID: <20260331141915.2918927-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Both LEDs are active-high.

Fixes: 04b77e0124ef ("arm64: dts: freescale: add fsl-lx2160a-mblx2160a board")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index f6a4f8d543015..a79290401551e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -51,7 +51,7 @@ leds {
 		compatible = "gpio-leds";
 
 		led-user1 {
-			gpios = <&gpioex1 15 GPIO_ACTIVE_LOW>;
+			gpios = <&gpioex1 15 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_HEARTBEAT;
 			function-enumerator = <0>;
@@ -59,7 +59,7 @@ led-user1 {
 		};
 
 		led-user2 {
-			gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_HEARTBEAT;
 			function-enumerator = <1>;
-- 
2.43.0

