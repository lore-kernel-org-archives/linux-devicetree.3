Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1833AFCE3;
	Tue,  7 Jul 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417864; cv=none; b=glZ6BajB6Sv2hI6SQzKsJJ9vYVIwM7DC246qW4TCKf53zshwSMIXcmsoEOaWig/OEjemb7dLvCMYh3CG7a/NWYfHMB5B/voT3ZuX7vkZsPcRDwN+tud076SAHPY/lSPl4hFamuvKiTIRUNEgfW8zDagTu4XosKjjx3kFc+f4tlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417864; c=relaxed/simple;
	bh=6VYNn5rS1OWxKhfd1yEZBXc+RwztAsee/HR0ugRsX5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7wVzLB/AgSMpLdXeaq1wOYIvqiYc8uHgmTHQ/65+XLrZhsFrnei13ZR0Osw8SJIq2uB66Xlp7eS1c6rUqsKjbeY4XC6eYLHhdX9J7Q+XbGmrO8Kv8SlrQZnsXiFHIVoPMqo+5LCDSEUURq/T40WIw4xnYG63J09psuN+FtaBPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GC6W64O6; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GC6W64O6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=s40cH+vX8rwWaQKZl6NGST6EdWNHw+REK35EOCVOABA=; b=GC6W64O6J4qAusysEYAc63DqJL
	K4u0y1sjQbhnj7FLAXUJATp379gOKrBMuRTc2a88D0IsecIqJihXdVoz8BVBxk8H+bh0n/43OpwCw
	3jTCQeRXI90Lu0yJFNY1B442HJWZ69DZeLCjKmdp8O3scTAsNVQpsZvmzEnZzBXXDn7l4HeeGzE0L
	mvh8WqGJTeGX8KxtlRq0dU/k1ueRnj9TOvoSAzia6H8pjfzYyDU8qhZVKsM17/9+EwsAf9kLBIgn2
	EOGk+JOLhceiwG9xxxyvpJvuIVEzQL0eQ8lP8LFfY4Tbofb1SRzDYXzLcYnVVtvrCFO4PAHWrsmnB
	DMsE8nPQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SD-000PVC-0g;
	Tue, 07 Jul 2026 11:51:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SC-000Ck1-1k;
	Tue, 07 Jul 2026 11:51:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
Date: Tue,  7 Jul 2026 11:50:48 +0200
Message-ID: <20260707095057.1745867-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

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
2.54.0

