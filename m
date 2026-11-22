Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388557;
	b=iESgw5E2tu4FIiDnoqMHrdThG0Ypl9BlHurfSBAFrEOpYQOe4VEcFDjn8577SYvyASKJ
	 5+r6KkLlh65UDJReNxtBL4taNNOXGSvjxtr4VPmLrvNeeheQbKKAWSC53cu3M5olJtWQq
	 g/9gg0wGAKSuD1K8nXPutWa/x3bcFuMSrWIb2/MfEgB4sDYVw6I9LPABlaVINAiER2Dqh
	 BAjNCAi1YNKt3l3F3IYREPKzCnPhNyLUFp+lb8w4kZTYdEjIZAqy1NlH9RMKjMIWWFOaL
	 Vp+Tv9yKvXUAuAGlI1u9dOAarpDvy7g/r1wAk3px4VnqxbjpCreWT2VUaQTzJccuNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PvuQbTGocUKQ4aF1zR8+15VyxR+xxWsbGVLohKjl5TI=;
	b=F8R0RZjFtVtH7SmoIIBgqZg91KhFTD/WSXEBnVy6wiT8LURQmqMG0zn0Dd69zinBFt70
	 2wTQLYWGaJZOA/nyM6VMSe7V1h8oAizpUw09gMyCLMz/JXcnNHFH7daufVsu06IyH6Nlv
	 sLMzRbbnM6fpxrKDW8hbn92LznWuUJqpc8iJGb3hOtt8BLtqXF+DX2gEgBAkqbDSlqJsp
	 wK/zhX6rEooNYNy6oL1zxsu+1gBu2XN7t5K0gheQXnkUjCb3Xkizmi9FWMdvGC/p2qnPy
	 BYw1vFxUXIDF9yUe0hd85u3utklaWWm0aGaMKK6aiI4ibmGlS1GH5mKsSyC4FRd9vJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JcG6HLi;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87630606A31A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 23:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87630606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JcG6HLi
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so136155a91.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388556; x=1795993356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvuQbTGocUKQ4aF1zR8+15VyxR+xxWsbGVLohKjl5TI=;
        b=0JcG6HLiJt3Hx11OVCrBA5MV0nzLO7ZRnKh/SFLqjf8r3+gmYCeJEr9XzIcgTgBnnM
         IMFfwHqnqtt81DA7SA/zasSU12HnWcA8KO8NoHjafCZiXG2/l62IPJl4BlhfEUMYyd3t
         I6ISXaSDWCqyl/1HxhFlEAxkc3H+41bezTBCAyC4nIP3Ikng59HDquNotJoCmWWtmJis
         Qm8F3/4NTmZqr8ORagEtJrmy6kpgFXOqlZ8A5nEeLHXzEoPPrKkBaKqfPIRvYmtUnjH0
         fy4Js49q9dMrsUK5fFb2AAS1I89Uf3fAbTlQ0LaEKPhQpB8LaKjhOAGa/Y1dUpFoDsqw
         /ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388556; x=1795993356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvuQbTGocUKQ4aF1zR8+15VyxR+xxWsbGVLohKjl5TI=;
        b=ttOyq+1pAizLHx6wSb9jiY45ujNQKNieMpC5fI4D0hliSxQw9SslfAwCmAVhgeaDzO
         obhd7UW2wcMMi7N73T0CFhm7/B9mgo69YcvTUKu5a74VPz64RvxtXj/85LtxNFxXcXHe
         zDjILsr6GJRjEZJyXANTv2Kp4hhR2ebwqSnNShHFJdYaXiAs0RAkUDqU4LsJ8ZR3lOdZ
         xMkxR9mjEfnXC0/j5O6M2aLiVjW+w/CjpiRqNN30+15kJnbeNtJc6TUAnArEcn5QPAjD
         PkW1MOfOHEqHZvjGBhMXSBcl/Fw+hkGZ74wXlFcIQQgZGxAhHZw7Z1U3izcADzxbTBXv
         SGDQ==
X-Forwarded-Encrypted: i=1; AL+hErFQ6O2D9IWa4kW3N35jubthzBN2Z4WGHNTZP/vCglb6Eo/uVSpz59ipu6mQzeT9QZSvraJ8/33wZn7Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8ClAfgNig/1rhYQBNntvfduOWi9NB/W3O226FPCXNtwxqm0rz2
	E7Q+t+r1PJKtnUXUFZSZTJUMDaFx3RuLgaEk6imImr8FLL7g9IZuI1Wp
X-Gm-Gg: AZFdTZf9pZgLQf4U4P/fqzWLK5IiB8lSmQMq9on8NmKNFNXFSBjZ5oJ4Z57wYbovznK
	NF80Y22N2ls6DiSPfCGzpiRSoAiWdg1uCKvWmrXNCi2sMrQvLy8crqKhCD6n3WgiUIl/63X1Cyw
	GQT1/xCpPQtkbP/1I19LUneOZy5J6wEDsDjxvntoHjrDh5k1ki3rSGgKWZxgVpnOpdFLIv8G6JF
	x7Xe+pZOx3+LUWwF9LTBLudAc+Qam1Y/W3Qj+qUU7RAhCv+Bt2LM0TxqPngvbq27NEXqyT9CRUs
	oCuNTLNHrDOTXuznAp3Dqg56mFacx77JoBK6SKA3P6dFUlHa4WgA1Fl4+3IAL8RpuyeBsYhYuI6
	JnImrFCHQBptmLIiREfvEeGFH89b95FQdZ/3fTlQ4xBnntGdIE55G4lo7DJXY37c1KK1T7emNX6
	tNrq1KmW6kLrOFFTGf5dwqkm0uGhqZjCVJ9SwhNdiSAyzOMaM4dOQO5a/rHluyKCX5VpNhbWaay
	IDNjJoNTybb4hRnWU1onUnxsaObQvK99wfo0oU75Wz8ah/1Khu3Rlr9zn/e31kKcM3r96xCrTv1
	29MJMmQef2QjRltboW9E9TbTFppPixF1KVZffsc36CFvZNO4+RBF5FdL3MjSr142Qho=
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr9910490a91.58.1795388555726;
        Sun, 22 Nov 2026 15:02:35 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm17663215a91.15.2026.11.22.15.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:02:35 -0800 (PST)
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
Subject: [PATCH net-next v2 1/2] dt-bindings: net: hisilicon,hisi-gmac-v1: allow fixed-link and mdio child
Date: Mon, 23 Nov 2026 07:01:30 +0800
Message-ID: <20261122230134.3366017-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122230134.3366017-1-mmyangfl@gmail.com>
References: <20261122230134.3366017-1-mmyangfl@gmail.com>
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

Describe the "mdio" child node the controller registers its MDIO bus
against when devices are attached to the bus.

With a fixed link there is no phy-handle: make it required only when
no fixed-link is declared.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/hisilicon,hisi-gmac-v1.yaml      | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index 89ed6ab1905e..ae2b1505a52c 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -13,6 +13,13 @@ maintainers:
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
 
 properties:
   compatible:
@@ -53,6 +60,13 @@ properties:
       - const: mac_ifc
       - const: phy
 
+  mdio:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Node containing PHY children. If this node is not present, then PHYs will
+      be direct children.
+
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
     items:
@@ -67,7 +81,6 @@ required:
   - clocks
   - clock-names
   - phy-mode
-  - phy-handle
 
 unevaluatedProperties: false
 
-- 
2.53.0

