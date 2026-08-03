Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A143E5A38;
	Mon,  3 Aug 2026 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758972; cv=none; b=AgtYaPuw6iUwJATyLgTi9BeSP6k5iXhxvgSNK7zOv6JqEWn/+qScS3yZ4IIRW7sG/sPLyWFCpACmVU3EQTjX0SlEQDstCm5XBhOSWK5MCGOFnHruvpNBdUre7p+8SanmIu2W+EaWt/ds4pKsi12V/P7EoIKxzzculFrX3FwVXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758972; c=relaxed/simple;
	bh=XG8BGoZ5rDHN9sieMM8ydUYdrNf3LVxIyfwS7rX9x54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKL2YODzh1se1BLzqxO74codrdH/kefMWB9Ndy+NWiyqb2RXZXhFj4ClZi8pWyf7C0bB3ZWRv5NTLB6Tl1Tit3rWiWHQPZJw17i1McuypHPyuC4B41nNeS6G3glBeR38ilNBK0ubf2RdlwB0Ye0C3xGnweDstWTb5M2zsHZhpa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tkn3j+VC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4zRGa/VC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tkn3j+VC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4zRGa/VC"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VN/XifTmcyL8U+YnV4Id202dxfpcYpR2oDuyUfOryfs=;
	b=Tkn3j+VC66jGW25t5Eds1Z696iRBn9ejAh8Y1TQrMkMukRW/hosrjtEQAi/P88MBartGKd
	usYUoT6kU3IPflC2BHrYcIcaWmkeaPp/Twh8xE7TmtjjEsIZ3WjIb/6Ue8j1zXjEG7uP5K
	XlTj+E4IHp16R9BYVNtGzOswN+b60fMNMjD2+D2K66meImfkc+trYcDBKJNSEN3EzZ9Gp/
	GRrW14XjT6EVFnUGGOQEnhZJfEH41YyvW1HUuAOQUdATN4RJAvKjDoCw4QtVLQFkaA20Zu
	Ebbe8swHJf8nsr/foVb5ywo5Ofsa7+trjjmgRZ7R+vZCJ6FGF26DHt2LJkzckg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VN/XifTmcyL8U+YnV4Id202dxfpcYpR2oDuyUfOryfs=;
	b=4zRGa/VCiFiuFdqpvv4oeEOvnpzuDQv7YAZhpUsocbeRZwtnThpwy04ReqWchTxu0iT3Xr
	IkkbsOrvpD67jvCQ==
Date: Mon, 03 Aug 2026 14:09:24 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v2-1-803017e4ba7a@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785758968; l=923;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=XG8BGoZ5rDHN9sieMM8ydUYdrNf3LVxIyfwS7rX9x54=;
 b=Axi8nMAvk33K60m23y5OxmVYGDO0qmKaehAY4lvSNQzmcqeO7Yaxiqi1xMcY9TR6GnObZ3+WM
 FS6qiac2SNlCBEYoGMtiqwNZOiHR6yyPgqreDEqE36zQRShUdiDq9TR
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

Add the Raspberry Pi 5 d0 Stepping to the schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f3..32e1b01676d6 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -29,6 +29,12 @@ properties:
               - raspberrypi,5-model-b
           - const: brcm,bcm2712
 
+      - description: BCM2712 based Boards d0 stepping
+        items:
+          - const: raspberrypi,5-model-b-d0
+          - const: raspberrypi,5-model-b
+          - const: brcm,bcm2712
+
       - description: BCM2835 based Boards
         items:
           - enum:

-- 
2.47.3

