Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627131D5AD4;
	Mon, 10 Aug 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362400; cv=none; b=Mjx+bQL+O5xndwoMuoNc4PuDcYhJdlqn3ZWbYCeNusek2LEInDIJO7pO3I/KjicrWHtCtsCYjMdK6FKgsNGXsugNMUz9mCCgWOH8GRX2I45oaVn313EitdRI7hJ05uSyeJL8cZZ+uyyvdQBu1zwgaBHmLknN59DE7xPmQr6ZD40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362400; c=relaxed/simple;
	bh=OY8lc8Vz8pu7sRcvxbNmJANYtvunkxTE4JtLFk346G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GT8kgOA6iRQzSVMCHpX5zVpXJgVezOfKFjKI2h3wEmPvUTfnUtfYj8ie9l3Fr2jWmRISgSccoCncLUAZOE7m8plR5RvNNAbNviB93H2Y6VmS9myNPyF4JGp3Fyj3K3HauydFt9mixkp2w0c2uPBLPwwO22yTfFrvr/bBML0oLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4DsGh//Q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ojujx0/R; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4DsGh//Q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ojujx0/R"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pk1ECRw2Yyocn/6K3wE85Ur7O62uYCnJHZBJkQdAbyI=;
	b=4DsGh//QE48BwOAa+ppUSo5lqNTMrto9evYOUAHs9nmD8qyYyQr/VzGfU56M5JZjGNndzF
	ewWPeXaJOmIKc+/QX4Q+K73Tjue92pWEVvCKgc+gAXAbVEHx03H0LhURp1NrARezRFcnPq
	lHvICBI18KUCv9FXq3S/3gmpIXMow3EJer7iFRWyWOeqskPwaCR6XisuOIq1UgOgwYCuv5
	yyuHl9+uLrXwcl746M6C+viPbILXRbkWwkc97IbF9eCZ8Zn5+0SoYWhqk3+GtTcm0WsVu+
	EIe+A7IQiqUzezNkI6TxR1wdgk8QzZab800ec/gTxkdh4a0QpCXdLfscyWC3XQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pk1ECRw2Yyocn/6K3wE85Ur7O62uYCnJHZBJkQdAbyI=;
	b=ojujx0/R5TlGrwh5PY5OZonLNhSv61XCpge0Fd1ahlyeXbr6ugNhUZqv72dXnM6TE4PFWb
	2kNAb0B1BYVngxBg==
Date: Mon, 10 Aug 2026 13:46:33 +0200
Subject: [PATCH v4 1/2] dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786362397; l=1074;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=OY8lc8Vz8pu7sRcvxbNmJANYtvunkxTE4JtLFk346G0=;
 b=dUI5DcroJ9xnueLOGMGFrLNGsm+UmtIfhuGRsVDNJwWf9LsK8eQdpE9R9Ql0L63Hb9zTmhlh0
 iUE60sK4BAKAiglwM3n2Z8rWXX6okPN3BU8PCGYGxIU2Itxweqp6fkY
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The bcm2712 SoC, found on the Raspberry Pi 5, is available in a d
Stepping and in a c Stepping. The two steppings are not compatible.

Introduce a new SoC compatible string together with a new board
compatible string.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f35..7ad6583f7fae0 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -29,6 +29,12 @@ properties:
               - raspberrypi,5-model-b
           - const: brcm,bcm2712
 
+      - description: BCM2712-d0 stepping based Boards
+        items:
+          - enum:
+              - raspberrypi,5-model-b-d0
+          - const: brcm,bcm2712-d0
+
       - description: BCM2835 based Boards
         items:
           - enum:

-- 
2.47.3

