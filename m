Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479927;
	b=xOX7xG9Ax0S7Qalfie1viHfC4+2F81lk2pi1HjJhfuSnCY1YGmXspSOHQ7ltZ70wbUVI
	 kn/DEtMm/qxOcLM/C8dZxVunrlWTToCa9/vgspNOM8gL7qHs8bM5drXFuDdpHQIF/FFf/
	 ewrw2IjGrIe6dCW8BfzCB6nl3AIF2ZYJj9djYRMoPJSMCev6jRJb1gv2I7LsMLXZkVYvu
	 Kg8ygfJQoVZICrBcUV7Qs2RRSVUSjyDtbtw2aIQ5jj89mUVzZvhna++jgxmyunBjCZ1Ev
	 YB1VXIN77cxpDj0AHZQ3zCgtpNbi7LJ/I8xapa/by94SEAlhj76RkMkyzRZUJi+bQKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g/olSOUiAdwLPWk2t+WKBg+xKoNXxwfZMz12DJzrXtc=;
	b=o/dAdxsHSzu6BrhgYX3ABoEXl5gUD7SZB4RcTo3RUPLgi0S2YTaHkL7JPSVveaLpozm+
	 EtT6QsjHl8HZE1u1pxglMkmc5kBdO+Xwf5MBIJ1+ebmx350GTlEIqNfv5ZS5MCtjW55nO
	 G640hvarxymMZwCA6BlrxfoFHPBWQVXlwubjogT96i6c7773MlIIhwjfMf4s9VSf85UGJ
	 jSYrPWBBCZ3N0RX9HEqo+KIRZb86w+cizvD2wgDQZ6WwqoP+WHfhvhAf2IlAH0hjZmANo
	 BV1tnI5bIYFSd/1yJvppYCCezyL18iaxW6v1pCrOvltB+EaJ84cJ3fThGSKTIfHJ9kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQ3V+p7X;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C432A606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C432A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQ3V+p7X
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso1505049a12.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479926; x=1796084726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/olSOUiAdwLPWk2t+WKBg+xKoNXxwfZMz12DJzrXtc=;
        b=pQ3V+p7XpFz3L0RiRxfOe37LEftFwnjJUfheHE2GQc9FloqVmSLlnjNFBuSQnRkt55
         d4OVcCXroIDwhyQ/QfsLtL4VNLknHrKwvxExMnKmz6oFePLyWTlcBef3jR5RGl94puzP
         OWSEtIlNmluO4A9Z3GSrJiWRlh3NBqG2ApxvdnsU0TunOR9qbmgitaOxT6n/Qm4TQn0T
         Nx7rILM6sRVAr5tbrgQLSSQe5UgpNaUpEws6P0xOUleaS8sSn9VPvFEblyValYI72JuY
         cRH8+rJh/TH4CoROwSNtgTpoVQJq88RwWAU2ZfNqoWa736OvWSRFcZmhoKuxWPS376rj
         JTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479926; x=1796084726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/olSOUiAdwLPWk2t+WKBg+xKoNXxwfZMz12DJzrXtc=;
        b=raRnxUtAWmUr7eivXJh043UjaubJr6pRDayIVBOV32bEEKyHDdWSPCHg868qn2wPGW
         8MMlv6QRrqxp339vasVmgzSpdQxIKc+7ehKjpmXAwA51ZP3NOLsldoAogN2PTNX2OVNn
         pWowI4TaC3bAUV779PwcRDSM3F8vHsTtLUq/goFPNPb9lRlekB9VsuPvsGLaaZ+7MP2q
         1qYdETTwCGSXVZlOmrAYdyoSt2mTV4zzd1r3bh+MMXM1oe5IQ+tygWxe9XkKbMOMdntS
         e5KB/O//DGz3fEdWXkRlPrF1JVCHlhdV6BXB/AzLUD2ACOG/NnCB3r27duGtdcgsswVZ
         mThg==
X-Forwarded-Encrypted: i=1; AL+hErHzHaqHw4oSmBwO4uVrm95MRUJJIanVfY13DcET01+y9UE5jYF0eCb5E7zUGy3ogqoohu4lydJwK22G@vger.kernel.org
X-Gm-Message-State: APuU4Z9iYafpaijOT84ow95Z/2Ic+BAmVFsuhsul5igDm2DOiqYp3x6r
	8GutvcbEpiL8EyyD52MzsVaKCHuCj4nMQMtOtsjzymEcPWU1R38FkEvS
X-Gm-Gg: AZFdTZethLtmz5AXm1eI3/v3C1m3uuQQCl759zZ5Wb/JCKgfe/m2wNxSxivXq+UHg20
	R53ZKrmOeaAfXFCAf7m0DnoRe+GF0SYde8YiTgZCWkQKszWveeR0jJn1z3OYQDEjPJWr5id3uBj
	4CmVAJ9QKmsRLIp3x87Z71Q8HHP31ObWaQFtd3pJd2sicuD0SJN+u33E6Kul9snYD/mZfW1eKvA
	PIzJGLEwW8b3lZJmDGDeh3aaznohnD3V1yiDvA/4v93y5Ym2yY7GRWaR6Pxe0Fki+uJvMKKrI32
	sb1+kmmGnOrwbRkbt8hNraSCYsy2JwwBkeb8QIBiNNccPadEBldOMaGPtJ5E4hX6Co+Hb6x0dSD
	QpCDrTrVpIT/2jhiz/pC5u6lzKSMqATg7tx0HmfC8iC3JfpebsBuxkMNuXDmrmFm2JR6b2ngsX/
	G7H6Uho8MNFRpEq47pD2wQ2MR9t4TCZSnBVfA8I/NRyi6qg9rQNDPdwVJFyNd4iZYF8DCB6+e1u
	e7hkZ5Y3kiKusWLhWdatMhjL7QkZOBFj7S4osarJT03w68sQjsfK/bYyCxCc1dAk9MtvQ1YRbbN
	X0DHPTOq/t9yH9iZSCTkHE/GAyWzXeoMnloWrikueG8JnzoMPrsI5qSfXP7bNptK5wA=
X-Received: by 2002:a17:90b:5847:b0:3b4:6094:2fad with SMTP id 98e67ed59e1d1-3b4609432acmr6528704a91.48.1795479925874;
        Mon, 23 Nov 2026 16:25:25 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:25 -0800 (PST)
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
Subject: [PATCH net-next v3 4/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
Date: Tue, 24 Nov 2026 08:24:38 +0800
Message-ID: <20261124002442.19414-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124002442.19414-1-mmyangfl@gmail.com>
References: <20261124002442.19414-1-mmyangfl@gmail.com>
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

With a fixed link there is no phy-handle, make phy-handle required only
when no fixed-link is declared.

A fixed link without an "mdio" child node gets no MDIO bus, so devices
attached to the controller's MDIO lines must be described under the
"mdio" child node.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/hisilicon,hisi-gmac-v1.yaml          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index a71529825955..c283c1b6ac72 100644
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
@@ -58,7 +65,8 @@ properties:
     unevaluatedProperties: false
     description:
       Node containing PHY children. If this node is not present, then PHYs will
-      be direct children.
+      be direct children. With a fixed link, the MDIO bus is not registered
+      unless this node is present.
 
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
@@ -74,7 +82,6 @@ required:
   - clocks
   - clock-names
   - phy-mode
-  - phy-handle
 
 unevaluatedProperties: false
 
-- 
2.53.0

