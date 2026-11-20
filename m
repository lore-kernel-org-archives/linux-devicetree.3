Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134361;
	b=bif9dEX+ndIGGN9yetRzgo5tafhroe/2WZww3YolZ8OL+8ZwaXBthDrTZp/jwlMj6KBb
	 LqC1Ujt5XEYtGm77yG+SPrx+gkkP3Keq2JKwLKB4Q8gk9Ypchf/PVHCF5SI6TJaeGJ3fE
	 i99yAx0Q1fMpExnatV19qIp7Kf03Y4ueYyswnLny+CFEptdZeTj9ye6pmRG6OMlJUWfW/
	 FlgtWN7P2s3hbAwXV+Ii+xiDTkl8u6a20InL0Z/2rc7EN+5u/34gml6goRXH17247XHX4
	 CQ1SrVdn+RLqJk7058K42xE7GxxN4Y5kBcDtWNDKavOuzvv5Oa7FLTvWTC+LxzsEWgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
	b=V1nPQ6c6xsEZN3GEm34WjPDdL3fmy5qSl+2ZkMVDEOWJL3z+PwzsMgYbWDXZSvGpwcr2
	 yzdC2qBHsq/+y9mxVdsN9J7+S/V7tMTSNPF4YbIedgCD1GTM/6fDOqPrC55p9Qw5qdjq9
	 fQYlWRHUAAkjkr72uTh/kogihbPkjnUXZi3p/DpNnvpyQJiOVr1o/toe1lNoiBH0IrCZ5
	 gamCXJp+Iu/x3sIcBqbZYEGZ/MsxRIC7KB0ECq6I8WjE0aj8W9G8ooSY9U43FZtrouRLU
	 o5CA4IRZdpBzdpKOOOTB1orPGxH3Hawe8xpaSMHhe1FoOYSierW2Elr6r1iveTiIjjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yes96F/A";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B59660A2628
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B59660A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yes96F/A
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so1037795e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134359; x=1795739159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
        b=yes96F/AWcke++2IhWE9S1GYVPvIXwQVG6b/67QK1Dtq+GI0p979xDnhwZF7MYRYUV
         F7q/FAavAX5OEsE3akSi6OSoO4SdmRPvImkns6ZK7JPzMNEB1dQlC5DpaxOJRpwvD1sS
         w0dE6AGEYfAtR38BmhAXGRLUrDNHUMYlP2vvUGXTTbybQr0+OFkG9w0Ym6aMxdLsrcpn
         2u5vPd98/Vv4RylkQ5SrtWhMLkeWxSPadMS/W6Y10MMCkDCACELP6h78N0gRvO7v8J61
         PfLMW3z/fv5y+pH/0AG36zPyG/bQXD854lXzXEksKn0NEg8DcbVEyBtjec+MKW4KYR4V
         67xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134359; x=1795739159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
        b=a5xKx9zvLVhlcSoCMTAybeS9sO1xCldJVBRRyP6hEKqmXY06NBryrklfxUE91aTGKE
         SQYcAsMbWFm3vDmYxDtGhpG7AGvsg02AW9mIn8aw7B22T9w/c1Kgcwh8IKUxW9yZ0+Xk
         5x9+7gCCcu6aT9lubhcBDvXgIjEYrP/LKsHvY+trOEsBsGcVjIhF03UOPEfVfPOubku4
         WA2/wuRsSj7uXBh3AatrcxtMozwOLdbSH7/gnaU7VaaEmTE83yx4vR2qdoAaiub2Wv2j
         txF0yvlV1WjPi0TCWmh3KjoqTQynL4hU5wkjxCK/AemSxMAGQxKQ4alWNKQX630E+llV
         bCjA==
X-Forwarded-Encrypted: i=1; AL+hErFIyZQbR6bHKXooQG3As6SbeuE1WtpzMgf7x3uFb+leO0pv7r/msdXyGmpvFx3c89tyyuDLN7Y5L8gQ@vger.kernel.org
X-Gm-Message-State: APuU4Z85JUaitkQZ0WkiBGuNb7xub4jB9v4BqLxqeVFiODqdj71wf50p
	MNX0PbOz4y/WRJzyj3rzXY78ExgH9wW28G+8MM/rbAJT2W+QVXhCf4Sz
X-Gm-Gg: AYBFou18ktPpTxjFz8o+vQzQdRnfX/PF12QsyAOtOrmxQ1vOChJBdg9pP5A6mhZWalB
	3muiFc4aByW2zkDBNuNVeaauJLaSp6cMC31ORKZtcH7Msx6BtgcveYGtdMNUknKP1mqJnAmdZaO
	h19bK4ceqo8zU6QmRnV2E3ZqYT4g1GEG8i0fhk/NoyO7+U1lYkvzpumAWRLLw9fKfcBvhaJU4/6
	CVeDVitEn/vtMOaUyPpJs2f94ox0G9UxO0SphwIGzOXU5lnBRw5jFKkGLjDzqn4QdggNwNFx/oO
	4gDiramcAL38Klv4RakED18qXlIf3BmOo2Stm/pp0O9lALtWalxsLTFeMc9r7wvWsfcjeS811OG
	oJJhUjMU8jR7kn5g8t0mudIB9xj5Fvn9/36orIpAhbOBwi+A3uExaJ8zkXJVYzZMo/S7WDElRTo
	zBKZxU2+LV67yGT5QmfK5LNn4nXT6QbGqYWT+uRalgTLy8N+OUisSI28V5deS+I/fXNV+RCW49d
	+SzoPoDbbFYlCGaDlUUWPStr88XalkL+6p298quo9zUJXKoa6+1zY99pHVhT0ry/VnisY87T4qi
	xXOAvwcCdNMu7UEmSdqqroFeyFSposHTUetsKRT7JIb+p5Fs8A0ZUCnTvG/ZCNBBq1bQB9bfK9k
	IIkma+Hsg0RVDASYo8zsswuayubbL80mmz/A8xiJVKtcR2m3DUtPyH7hAJzddn/jtfRXgdJrb
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr31085375e9.13.1795134359239;
        Thu, 19 Nov 2026 16:25:59 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:58 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 05/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
Date: Fri, 20 Nov 2026 00:25:15 +0000
Message-ID: <20261120002549.1908299-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

dsa.yaml accepts either a "ports" or an "ethernet-ports" property. A
devicetree using "ports" therefore passes validation.

Replace the top-level unevaluatedProperties with additionalProperties
to reject the unsupported "ports". Also explicitly declare dsa,member
to keep existing devicetrees validating.

Also Add ethernet-ports to the required list.

Existing in-tree device trees use ethernet-ports, so they are unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4->v5:
- Added RB tag

v3->v4:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index fab6aa6237e9..9c477ceb170b 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -45,6 +45,8 @@ properties:
   power-domains:
     maxItems: 1
 
+  dsa,member: true
+
   mdio:
     $ref: /schemas/net/mdio.yaml#
     unevaluatedProperties: false
@@ -73,7 +75,7 @@ properties:
               phandle pointing to a PCS sub-node compatible with
               renesas,rzn1-miic.yaml#
 
-unevaluatedProperties: false
+additionalProperties: false
 
 required:
   - compatible
@@ -81,6 +83,7 @@ required:
   - clocks
   - clock-names
   - power-domains
+  - ethernet-ports
 
 examples:
   - |
-- 
2.56.1

