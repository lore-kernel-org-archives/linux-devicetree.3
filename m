Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816479;
	b=cqz5wi9pkCmY64XJma3D0/EYijRI/9xzP++AkelYC+6+lsm3C24FJXatsOsHBxiQD+iT
	 bthZo3WZjFG+7udWYq4/5jnog/d6T6nhyBqooqeAxQfFWplgZduBnQ71rANwlaqyX6gXx
	 VeIzYU44au0Z1H6ulSsffnti/9mFtzAPniUes5E7FG4xBjkua8eyhWo6/TIYS5nE8pm8C
	 bWWtrzkE/7lr9AbrUUKmFdk0VhV9BL0nlyC7x5d4lSMYJxGe0G8RZonD8xswVRrLMdylZ
	 cijwg1YJ6JXtPhucl92NWVOtzPvl63Yvnm3eoFRxb+PZgaRxmr7QRbamTV8+ID5AgrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
	b=o/j06anPm5qWzw5EYuxz7SXpDAf57h0NHTNgzHDleRslezR9wxbKL4AmwfV5JjpFu2/h
	 u/FjjL8r+0P5UthJPHON6mXD9C0q919PEoWGozEC3x5HFXeAYYupkGASqC3dajQ4G2b9Q
	 vPum9/m1v7YrW8SMcFZDzY9Gmd3IPGkmWpck21MfPGiyTjyxrxH1hV2qQKbstPZ1tvJU2
	 iTBPw8i/q54Ap4u+kR2QjHSsdP1rRT0vZchNaeblwsuiwr4Qxdktf3Q1a+v5xwulTGfwk
	 VTcLA+86a/qZtwhzb5FDIXKkI6s7j5dB94cS0l4i+k8PXP4DRxU+hkv11u2AEFCBFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc2YvxkD;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055A6082BCA
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0055A6082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc2YvxkD
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e46e449e8so640886f8f.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816477; x=1794421277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
        b=mc2YvxkDKEeg2lcrOssOXv0I+WaqYQYrqleUksf2y8thSRC/rHemThvT7wQcFheOf4
         osQJ6NhXScf07S4avWAH2B43pAlG1y0GWM41g5kRwBOvatoiSl1gOLxuPaNxXFU/eHsC
         RxwLTYH/fGt+0xvlHbcZxw6iJyGvI1KJ71nr5rGwn5wew0ztYNmDZkVrmrFawweApqdc
         qFD15KvSU6EKoKCRxvTxIWfeYFuhZLXYRj6MTY85hk29aqVH4zH2WLFyMMCE/v9Ehc+g
         xpdzZ0MZgcfZ7seqORjj266fQ1l2huUXps5oqIRJUW61KFvrTaPcnw1Vj1YzMDIRvLSg
         TulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816477; x=1794421277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
        b=CWhUOxWM6rNG6XM8hjDTEbdUWVZIqbiu4YDFQxTOuPLVrdlLd+4P1iRmk5bLc8hYhk
         cvGfDAd44+ScsaGLPuggeQHc+NhETf3tBYZOZTvX4ntOG1K1oK64n3ORMYhx/KySzezX
         KlBwGPJewZWtPt/W2SiVpdxCfDd9d5lCPweOPA0R6UcrQNeyunFiNajajLdjVtar5QFN
         +lO1lDdGkDVOvKRo/57JedI2JWR8maHsQhQHLSHBlTXhRbZuuLVsi3rIOxDFjt+oDuhZ
         vYJ0S5FGKxYz3hvlEE3laF9U7DGOIvL6MBbCreo2iQIw3i1onO8fEY8mw7sQhbkKKEaz
         bgBw==
X-Forwarded-Encrypted: i=1; AKwUvBwppY2X5z0ncoi79L1XpunWvcydxms9nBwONhCOjXQ44lMJm5B+QNb2aoEqxP96E0UDTHYTydrwaf+D@vger.kernel.org
X-Gm-Message-State: APuU4Z9uq5yfSSAybDmmaBhVel+QTbzGTql80w3itrcCIzPw8+IXYZsj
	BJrxUGVpN73EyChI6ewtm/ehYbfFYAqJ6Yj/WeBhrf7Kqkd1mnrKnYgJ
X-Gm-Gg: AYBFou3lMqhzfOo0+6jJ0graUFjB0WtVJZre6e5gXNYMrUNVEw8dU26db6xg0+xUS3u
	hzedPQ+4EVoKzBfdG+TMnN37e7GwAtGgyZg69rdt5Q7vzGUmPz8ya2sZ8c+cXbHhhKAp8MUiIal
	4TObHU4vXOFGlbHSA38O+6jhHfHTwsI+siTF+dGwip4+fQaC+Lt1n/hWtj3g18q2a/cSZw4sdO6
	wrw+I0AdnIDBr6fDk4G+qlGA2DP0sn2XSjnI59Jbzk1KmTfUaFPCcJ4YYkTKRiQKRLfHRMZzNRy
	JzE4wanb32K7Wy9YqZdAhsRXHyIhirOM1Y0fl9sBpbHT3KOZRYe0ekBWc6XWFFx+yZZNFAxnVkg
	UBWxPn+4t/dS4hmuZMYh49Vqz+g55WP99bg0j4Pme0N10SuI43BYyu0yL1cA4FL7LbUhzOfAJZ+
	uDLkVWVYJLfgHrZUGJKnrYPnH2YLlokjhVjBDcTillnSi9rrcXzp4PvV/i7shW+vpqVCKfOhIi2
	wHvLuvVZxLZKj0ba6CeCMex01WI9BI5m7QDr0oijA/jLrzZhOCAIXgErZtO3n0ZR69AcVsMIxk2
	bITvzA8UcVGQFQ7GfI9fonECpgqUig5SlR1im9Xn9AZqxZGco5dVs+SXjSyil25V4cZrkiZw2ZD
	7N37msfdnSudC0+oBtZ9PZnUuOP2H/wvK05Hmdw==
X-Received: by 2002:a05:6000:290d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e6e2dba63mr36517267f8f.7.1793816477063;
        Wed, 04 Nov 2026 10:21:17 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 05/14] dt-bindings: net: dsa: renesas,rzn1-a5psw: Disallow ports beyond port@4
Date: Wed,  4 Nov 2026 18:20:53 +0000
Message-ID: <20261104182105.1102555-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching the
hardware configuration of four external ports and one CPU/management port.

Although the schema pattern limits port nodes to port@0 through port@4,
additionalProperties: true allows other port nodes to pass validation.
Set additionalProperties to false and explicitly allow #address-cells
and #size-cells so that ports beyond port@4 are rejected.

Existing in-tree device trees describe only port@0 through port@4 and
are unaffected by this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added reg items validation for ethernet ports

v2->v3:
- New patch
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml         | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 9c477ceb170b..250c59e58439 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -63,12 +63,22 @@ properties:
 
   ethernet-ports:
     type: object
-    additionalProperties: true
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
     patternProperties:
       "^(ethernet-)?port@[0-4]$":
         type: object
         additionalProperties: true
         properties:
+          reg:
+            items:
+              - maximum: 4
           pcs-handle:
             maxItems: 1
             description:
-- 
2.56.0

