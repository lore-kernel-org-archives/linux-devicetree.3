Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816478;
	b=MNx0tkbcXrWsWj7g5uAVlm9LZ2v2IpAqS6ksp6xK/F1KUGxLyCjPTQisOpiKHT3hPW6z
	 DmjakGnNCXF1qhN0YCZ4tUsqewkFFG07Uj0y5dihh+2a17fSTnV+/eWIqyf8VpeOTdPQF
	 JPY1VwSQouXFwosFmSRh+HlV0pUaTzxkhNiMjomdAToFLZf5QflEVph0xhGZ/wg10ZZ/c
	 LzCAinRI1RLH+YlrM3gY3XlEKIR8RnMO+3g7gXBa4IrtA7t7eCsenb0i6C8MzyxjIgUGi
	 F9R90rHBU0tk363kyoBOYrnZIjGpxkyq0SDihF23h3g+slnbKzv6I6YYjsqSq7n/2iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
	b=b8aBBj0TNPv4KjyB80ONhNJEBhsyKFDYyCst3pe197mapqCvbtJmVFdzWhgQDXo/BH44
	 Blyt+OX7lWwlPzwlt7dc6eTMHydQZ8mm2dCsMf3GQZFceX4s1tNtNj2LLEtx+FAF4VjuZ
	 /sh2WYDi7CDvFQ+rD9FCE++Y4nCrm42nWiQCVaSVAAwdAGdW4dvYjG3sLVplSTGOscoLK
	 W+RBtZe/LxDyHLkG8uD9tjId8Jeu7pb9QjW0iqu+DNs8ivh9vp2UBHQyQV1Qmjt4SgUx5
	 KMnmmLJSeg3fx5BQWSFFJdSmwRnO8hA2wwJrBZctCmeZpv/sSvaZQB/MUYfFXWFE/jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAJJNu23;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6286082BCA
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6286082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAJJNu23
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso751047f8f.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816476; x=1794421276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
        b=iAJJNu23CPWLdbMHHLohwld1D5Iq0H3WizJY08Cj5VAeuOddC9clsyvI7rB66WUt98
         dy6pTFjIawIbQIbhudn5TDxpFBV/fjcvwhGzl6Ee+3T4pAkxhVBxVbcAd1S/vOg9Bhln
         PzanBZjK7SGNdSpnWfovET65qjh9FQIPy3xlCNZ1L8qUKcx1KvQCkeuwd0RTojXoaAtV
         ookjBWFVN8Hxo3LQsWXifYUYHasJar2ogNLEvjtUkghFlDVL1vv1Ya5FiU6cJI//V1yH
         ICnj5RnICtljg8BmGifR2hHlT80ahfbRROT6t2qE+Cihd70iIlsd6eVmkHYQykUDJ5YT
         racA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816476; x=1794421276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
        b=Ta2L5j6KKuVDyz4qkwQaYW1z/699QKaSkhGQ8+5acZTTgCkppG28YSPoxtbOwFw6wz
         NMoKmNItNp8c6/xjGXRYVoLOfRxK+r8V9gGmCBznIgWLU3zT8UOmMSBgiN0NBtKWB0hz
         poUjgDUOKy6ZTZqNSFBlqqfZ45Nc2JT8AMQ4+tz2kfNVmZ4dfUO6b33Uk+2AklaE2tTA
         BlLTk4aF6FlLsqF2i7G/E0iaxAxpSaLi/HBEpGMPuuPnjBhjbt+YoetlnhkcfzgFr3oD
         B676Rrm6eRiSK1FLNIYsG9wBWps/cwz4Z5pT6ONcniWqx15vf8hmLM3QjyMf1BDivQfU
         dRfA==
X-Forwarded-Encrypted: i=1; AKwUvBxjsgVkctw7XLLrbRhhxl7GrKwwufh2gXVXEshFfFtIE1dI4E3OSDKgX30X6baEC3LvUEVmFrfxVVzf@vger.kernel.org
X-Gm-Message-State: APuU4Z/twQlMh+yfFW7YnDlT9ULJKafWC6sc7Olxjlk4R2LcuClY6HWD
	Js1khiWInr1r0qr02dmEqmj2+eMtReBG23qf4YI+j3nlBpqYeuH5JwRP
X-Gm-Gg: AYBFou2leZFHvXN6AoRGXN/CY/wsqR5DsT5LZOStRXSbuC/P8qf0ECOAV9jOkxgJxp9
	3Fr7+WjAJAmGqu/9Io1uP5IRGdIux+fqwo3gwbnlASq8Ksoyi53mBC1/D5N1uTxND7ZbCuA0H69
	UtzVB+zuZx6CxGMlSOVqAPZUoXamIAGp17zv9KOOQj172HoqzvRk/t8k2EaIavjoxHX+Dvnb1+5
	hYaybcZPUZi5Wt1xoCNdzBLQI58qI7yocVUinBeu9tN0jAiPXVf9HLvjIsGGcPmuhl6VQ244B8g
	9tFIjKisNOQUiX15iSFk6YVzttMMQFxzanmBZgu2/UBc5i3C09Ap7107i3HEs6sLmFxb5MmNRp8
	4WoojfP3FnXqgU9CkzS3WW4jbjIUOCJquPp+Nfu/e7kc/KOJga2C3eu/f+EpONkAngN9XGZnuVI
	fIEoIEU075ti8OAqm7yRh6KC8j+pQqx//W5FnTRYdhX4szGllT/6oL426r7PnKunVYYcerZcelR
	B1DWKr1y2bCoy/WWAYAjPhfQicjhIDRHPXxbUb2pTmOj8jHldm2clSjhsspXOBZWetDjexvfbkH
	lS8OQkB4NkUjf/ec8P0UUyeKMHlpO9ZodnLZiuwQ3m6UKA30ULjqlNWPShuCQVuzrKVLgEq33lZ
	93l9xOxv112AnF89lhb+I3lf0xYQtnvjRZYfrM7e7/kd9QqUy8E3u9gyzxK0=
X-Received: by 2002:a05:6000:40cc:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e6e30543fmr40091601f8f.31.1793816476315;
        Wed, 04 Nov 2026 10:21:16 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.15
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
Subject: [PATCH net-next v4 04/14] dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
Date: Wed,  4 Nov 2026 18:20:52 +0000
Message-ID: <20261104182105.1102555-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

dsa.yaml accepts either a "ports" or an "ethernet-ports" property. A
devicetree using "ports" therefore passes validation.

Replace the top-level unevaluatedProperties with additionalProperties
to reject the unsupported "ports". Also explicitly declare dsa,member
to keep existing devicetrees validating.

Also Add ethernet-ports to the required list.

Existing in-tree device trees use ethernet-ports, so they are unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
2.56.0

