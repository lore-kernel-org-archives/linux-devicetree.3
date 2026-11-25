Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591745;
	b=tHFZW2eY1zhtZXfhS0H3+qj55KSdwNL+f7ZG92OEmz2aZQ03Cc8CmshHL2bXljPrqkny
	 ekm1j+tsvgxXiAC0y/Bj3IhUlLaY1HCE4WW9Kautz/D57IoHt6qptj/xNvHXg86sUD395
	 t2E8bb+/Hr/oDqwzEYWG2Q2/BXpXK9jOx+trXBxl6t09kQe9UdMZaTWjoj5A68d6ham3V
	 AP8Hd1g/YRd3uPHhqrmGr5+h75L7XifiPq2tRKKbu8wkiwtf5MLe3AUAWfgXB2Kym1iPU
	 b6i2FpX4Mwpq93px9hAjd1tvP1KegggZgUONGNs6+SA/QKWtcVyZN5l7GDmpnCS7AEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591745;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=bHf1QGcNLukYOKvss8i7yiqfftKfCazZf1FcDcnc7fk=;
	b=kfDaw+0dtOSgBfAM6cQ30q3XajXDHXQjK+UJ+END2fKmffgv8qN2Qiwixekr03EzqtHL
	 HucwZe2WQCPMUl+CjRqlWVQAzMOUZ5Lh1R1Je7K7w0PNec2HUjDXlIloUj5TifmEbb4Vn
	 Ay4Mw3dmT19ad1JY+JmU6YBohYh33a8+sN/oUAmeH+IwhfpQdOPsgVjBCdyoNMiUfvPqq
	 eyE7Wm5x7wVbxigHM1GYD9t8jpzYegmQ37vV8ceWgebxw7xCY3HWHXbR09LW55/GMrvGN
	 LqwuXCVLGzDtiN45wU+mQPLts5Um6Q88VDWwE9vSmGQCF4P673odSEaP2iXAdYHH3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=jBboMUQN;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541E606A321;
	Wed, 25 Nov 2026 07:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5541E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=jBboMUQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bHf1QGcNLukYOKvss8i7yiqfftKfCazZf1FcDcnc7fk=; b=jBboMUQNel5D+hNLUK/fNLfj0X
	qvBqrIKRn/wgNZzOUw+WM7ZAZxIdoVUnZdRLGE3a/uwGEfonTwWaS5kOoC88xiZBgeIb50n+ICeTk
	Tu/jz+GZKFO9gm0LwNHJBDalsWYYPXpCKssN6siMYQXrX0V4Y46d2F+5nCywr0YdYyjKFzjBnQoBU
	LQ0L65TW9VglUSbm1E61Hef8+b6BNGclQJC13Vv9yiwFvLe74jZ/feX3OffI2eY5eXwi2jJGey11T
	GQ2b5JuNZtef4CULseBC6NEXicWM0NqjslEyaiBsf6mrmMmU/UGwmAONNA4mFxEdMyrrtzyWEIKE/
	NfAQFzxA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-000FhA-2O;
	Wed, 25 Nov 2026 08:28:56 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-0007YA-2d;
	Wed, 25 Nov 2026 08:28:56 +0100
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
Subject: [PATCH v3 1/7] arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
Date: Wed, 25 Nov 2026 08:28:44 +0100
Message-ID: <20261125072851.3379079-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)

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
2.55.0

