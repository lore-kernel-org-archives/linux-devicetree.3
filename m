Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186390;
	b=Ufg3iulB6ZO6p8ORtMCXmDsTxPACr/K/1qTuuyuMc5ULkcSfon1LMm1WtRX0e3H8SgGN
	 HjetI6fczuYywm0M/98fOCqk9lk9Uj/aDDT2CCmWSXrOpu0AXJjvJOF/FFBp9/lbRXGqg
	 OEFmL4+P3NZGjdQzpKdrb9DKMfGQg/LAbgJgUIVLmrOYWpjojhbdCaSB5NJLoc0+HnfIE
	 LleGr/Ma/V/vap3UZbRZmGIqSO73/v21OVeIMQXGVd1wIXA7jxozBI7xvzn5MGi3XcP9W
	 YaHDmGs4s8IcjyUSJjhp/YEX3ac0EMtNPeGMHWtAoAvUP7l7/c1+iSe2z9Ol5IE41Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186390;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=iBP+b6prP6kyCPScuNa8zQ2uYPSjomx3LSDLJkMRsj4=;
	b=spbnHpl7AZTiuU4I9Z5J5+VuwRS9IGqVHUtcCA5skJNBUfvmfeq5Nx9k0iG0tOiUgI6U
	 932spWZuU3PdwBmABzGkA2g/8aFhoMEx+nVxRLmMbSAV/w/e7+mb5ecIb56le+AsENnWH
	 oDbQTwbsWYyV7Aog598Kuw1FygvBEG8oJWFrs125jYr3ZpGOcG6t6N04tWHkYKnIpUU+l
	 KtonlYBwtmq98Yv06k6xMDh4HLselWxHkqJJ9mEqU+ARohTwABHPUmtT3k7i3zfAYtV5x
	 DvBmUojOyOVdILFGV89QxMWFqekSDt/TfhivdIuH5WAlzQkeBeh6RmcySYr+qHI7BMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Wjfs8+jL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="B/P0r81C";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF78606A333;
	Fri, 20 Nov 2026 14:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF78606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Wjfs8+jL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=B/P0r81C
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBP+b6prP6kyCPScuNa8zQ2uYPSjomx3LSDLJkMRsj4=;
	b=Wjfs8+jLwZFhTJO1wbR2IhC06W8LE4oMzBM1nIERkNpssNL8eibxzQtKmtvhF7M8N/8/DS
	xBVEKiKzcZ2aShE3dmigBB4P1yN18ZvFZj57oGUp4FD1jfbWBut2bobL8yL089k7a3t1oQ
	kJC9g5EluKwvDUBNUeECqc1QYWDEXrCemGMAv5LGYtG8EGflbvoHkzdCjBiTSM8Ptrbwz8
	UjL0rV/GMqul4t3IHxfEz3PuNJV35YM6WQ13sizFKuRTkVwx1ajmDb918VJN3n50I8lvFh
	47QEpX58LmZ1eEisfypxkuSTEWjuCXMbrreiSQdBPf8MoRXb51b4av6t+AtS+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBP+b6prP6kyCPScuNa8zQ2uYPSjomx3LSDLJkMRsj4=;
	b=B/P0r81Co3DWzjv7xpdy2YORB1iaTu6HASsaIE1xcB4wO53rISO3Bwpeivg+8OGyhNwAsi
	LSRH10Nb4q5RVdAw==
Date: Fri, 20 Nov 2026 15:52:18 +0100
Subject: [PATCH net-next v5 1/9] dt-bindings: vendor-prefixes: Add soce
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-1-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
 Lee Jones <lee@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Vasilij Strassheim <v.strassheim@linutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, mfd@lists.linux.dev, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Benedikt Spranger <b.spranger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Document binding for System-On-Chip Engineering, S.L.

Link: https://soc-e.com/
Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..20a850a6e86f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1599,6 +1599,8 @@ patternProperties:
     description: Standard Microsystems Corporation
   "^snps,.*":
     description: Synopsys, Inc.
+  "^soce,.*":
+    description: System-On-Chip Engineering, S.L.
   "^sochip,.*":
     description: Shenzhen SoChip Technology Co., Ltd.
   "^socionext,.*":

-- 
2.39.5

