Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654558;
	b=M1avoBF/abM4DOeOf3S4USq+JAXps/hX0G3TSmfpXdgYxy+k9T0JTF+Iu8z9gXCW2Fkq
	 liyA/bVd3tlgjKIhtQY56bBmtvDiR857qIhYqplmR4oLCl/oygkwDW2r/c6KFiF2RX9A5
	 mqaVQP0mNS1Qu1ma4rWkfPRXhmwvsiVazM+YzbxBQt8QZluukVNhPJJTwiUSi4kP1MbAX
	 EYss63uq9t3E68/JrIQMskowGZyKm6dapviIT7lYHhHODAT++tBwSJup6zI7thC/iABhM
	 Cnl30qHOrb8/dnmAVjN9NXKymZ6+8Q69DKM0wGvf0F27wISHYCE6a4QwPf+9EHVR7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
	b=CRyj59cezfjEN7J8AztAzcV0P4NqXO8xpXM3/mUUqpcPXiLQLc3NU5f1AUQqZG5scZUZ
	 NtKt931uaDH5Oc5c/qqlanU9RdPbaZdOb4yTiUPiOONT7JXXim6adiQEhy5J8rDx8WAYC
	 8KW3To5iUZUaXiq9BzWPs11yXG2VnslQbkJu8ulmZ/s3Bkch/CxFDNpnV+dNpLqPPwyYB
	 k1+K2k/g+xuO0ExnOrBj+jUzV7U5JD1aFfdTP8uGFaFhkHFxaCz//jjwubLISO/iL0ToT
	 Zq4HPbLR8B2dPFuXWov6B37nJV555Td/UeASz4jE9Tlkb3WUDMplC/YZ7aaJ0SlLJeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mS0v6dM3;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55A3606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B55A3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mS0v6dM3
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso2623068b3a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654557; x=1796259357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=mS0v6dM34dmq24ORBQlAGxRzLZpimVTFq/HyDPsV+wRXhGFN0g2uWelBgOlngP4w3V
         8qXpNWCoUz3D97WHoF2VqYcaVyf70slzLC2Cz8Jo5GFxDPblwcq5IlCa3FlLH4qTFSAv
         UCpE9jTcN5wHWs8NX2ht4heEQUOu4QQOyEek+08FNmChWdEZ9cGhio1qpUjxuQGTsflP
         GyW2GSCpmU3OY8Q5B0DDd5N8mgg5fxk4rZcOYFcvKMISd2+NccOVOKB1osG9yZ8ErASg
         UBbtYU5wtygfOHhHLPvHRlW46mILgnotxvW6qv9C0kssijOpOb2pXCRMVAVtKUARwBHW
         YihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654557; x=1796259357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=Mv/p2DYgtz+P8HgujpDxHmvol1sHMRSfT+lzJiYmJN6PJol62x6nCX9o+AFFYV3h6W
         cdUlFmSIHicAf/YPbFq5qXzF/omhLMc5jq5DCe4ZnBQn9o7w/hpwM6MtCn17MUiGDJxY
         v+gbg2Xvzyn8Z52UgTIyt3v1ijCq9o98Gw+6qwuwyaHbhQVeSW3PPt4IGPCC6PsHvDXG
         Jjn0hTOCyp9Edvomgr8c7D5cbL+7937FtvItG7k20qdjhcJmUioQhXyEs6kSGeu1h/eZ
         5ORLledFp9xvQBXWvQ+MQZiiMXRwB7a24bdIcin8kjiSxx1uAUY4KxJN0FwXFpjedEf6
         DTiw==
X-Forwarded-Encrypted: i=1; AL+hErESUypoQ13RoMH3YdDgbo7eJh15rwlcKopbtJ0K7MYAtg9PCzfdALOLJMr3k9CXraqHf3F5s/PIEts6@vger.kernel.org
X-Gm-Message-State: APuU4Z9VEEf5WuWGusqem/2Wyorp3Ryvkt/jFxxsoBVTkhS0r9ghgZ9y
	dd5WYc4LGSozlzoqdJ/ZN/pBxaji9CfcKCNmizhdGma1XfNbTOWQ4+An
X-Gm-Gg: AZFdTZdj7MTkL/h9hhlOxzp5ZrknukvelAwVW/a36MgE/ZqnSIBTRZcmmZoyvGmVzlQ
	VcX0yWVC/i4FVY1y1EQGTVxNpW0JqB+5uJE9ar/ksNJP5wedtiAB6phA01GVPp3N4NG6TRRlmtb
	W0eJzaPXTeIRIQvsYEfzIRydyTFPH2vTepBAyZbErt0IlBY7wPmMD3Xwlvulhp3M6eJyDL5Zovy
	gyS2zCxnNbGOvsapiu1S3RUWHexCZmJIZ7ng5rDhKV947xjytwbyAb3axMd/PSOwjdHNnns4MOh
	dboify7qx+GebfdifDy95c15m2Dlm4P9PzpI+R3eDDVabJTEpjaofzQPrkzqZBFHNBL2Hug5QRJ
	TLl6e4BewE96qcg4KnSKBeSjAOvKESbt7Gl8+Ea64Vmxho4Ct+6nVIyWB/bImdIblUbqhxUoDBn
	L/WyUC35nszwxhJNhdJQt1xFLV3yR23csYSJdZTSwMYyjU+KkvKXHPCs573yTnHUJkkunhSkXn5
	lSDm+DQh9K/JKjl1ep5pjMlC2cv5p5rS+oyNnetAbgNUquQp6XiBVc/+WuaURlUBwx4P2cAhw7h
	rqbBLg78jnmSPvK4p0OBVB8BgytNYKp9pdDi+5+LaSWmNJvcwVLhbFw=
X-Received: by 2002:a05:6a21:3b92:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-4014a2766cbmr21986444637.2.1795654556886;
        Wed, 25 Nov 2026 16:55:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:56 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v4 4/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
Date: Thu, 26 Nov 2026 08:55:16 +0800
Message-ID: <20261126005524.4156940-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126005524.4156940-1-mmyangfl@gmail.com>
References: <20261126005524.4156940-1-mmyangfl@gmail.com>
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

With fixed-link there is no phy-handle, make phy-handle required only
when no fixed-link is declared.

A fixed link gets no MDIO bus by default. In such case, MDIO devices
must be placed under the mdio node, and PHY nodes directly under the
ethernet node are rejected.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index a71529825955..2f1c0e0afb88 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -13,6 +13,22 @@ maintainers:
 allOf:
   - $ref: /schemas/net/ethernet-controller.yaml#
   - $ref: /schemas/net/mdio.yaml#
+  - if:
+      not:
+        required:
+          - fixed-link
+    then:
+      required:
+        - phy-handle
+  - if:
+      required:
+        - fixed-link
+    then:
+      not:
+        required:
+          - phy-handle
+      patternProperties:
+        '@[0-9a-f]+$': false
 
 properties:
   compatible:
@@ -58,7 +74,8 @@ properties:
     unevaluatedProperties: false
     description:
       Node containing PHY children. If this node is not present, then PHYs will
-      be direct children.
+      be direct children. With fixed-link, MDIO devices must be placed under the
+      mdio node.
 
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
@@ -74,7 +91,6 @@ required:
   - clocks
   - clock-names
   - phy-mode
-  - phy-handle
 
 unevaluatedProperties: false
 
-- 
2.53.0

