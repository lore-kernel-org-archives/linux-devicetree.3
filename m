Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8D3C37B3
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151771; cv=none; b=o59vPBM8pukjut9PkejF2U++eLtm5r0ABwsgoPeB/Y0o63NoyH6J5qspbutwooUIogPZy3FVUqHdkfoFvIYiYFKFEmoCGIwRPu0MTAdEO5s1MErudSlNEnS5CYzjKOn8LkhHFmMHGyoJ9plMT0vH52a0Sr2i+txtkzYpfasHWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151771; c=relaxed/simple;
	bh=xfLwN1G+HlsExvrUNsOEe+WbN3dPn7HjsbyOumjvMds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grwLFcufdH952Nf/z8KeTQqfsDtV2WBMmK23w2iNgMwveB9MuIlHTSZSi+nSUv2yfoP2ZualOdtRlviXqrI6rK4TIkmdwnaFgTVz4lPPUWhmG/F0aq/yOwrRQaIYQDzDV9V5jjyBweqyLQ2spTfXL84v4metgQfRJyCisjjhd1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8wRv7Le; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8wRv7Le"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2901414a91.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788151770; x=1788756570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YOr/QpJoSwvrQj9qbBH1jCsIxrm/W8lOOhFj883C40=;
        b=i8wRv7LeHbFBTZEnjcyt7BJ2gvU6Pza9FrQN6TnwXXEqgfHLoPAyS2RZ1oNOs6gtsu
         hNTf7WQ2AfbvTczbi1LIiPoxU46wM3Asz3CeUlQmACHVEA45KKIfnrphwsNJHpfa9ZRO
         xsIs4g/a5UYRqcdpity6u+qd4i2kS8HWFYK3M0MwJHg8oWPfacuVf9CaEZ+rAvomtpTK
         shMLs4sW+fc0Fcs05eE7Ny0UTUBUbZMdF10QpmmMuwsGUqoq4VWDZvHBXuKEp8Rt+f2F
         ebswOyAhCq2/VT50TX3+H4uxomEHXi3UThJYJn3xZpWA2g6Ak8WMY8pkCfB/j6OdoNKv
         HmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788151770; x=1788756570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YOr/QpJoSwvrQj9qbBH1jCsIxrm/W8lOOhFj883C40=;
        b=d56e31JfkaHq1L+/2b/iJKaovL4vpD2aBUDLpM+il6z5QIcRx6bAwraNiYerhPJqr4
         Lzatf2f4jps2At+PjxpTBfyEseREhIULsvNUh9XQdmCq42fEtQgdBQX0IMErsBwjAyxf
         59AQRxnCaXyptE69wAwStHWssdhipcf5atCs67FAcNt2kOzKxyyE09EmodZVogoEsAaE
         uVQIQpyXXJul+j1SAIAtq/Wslqx8tWdo9sYsv8LlBJ0qUiaBoV5NKuns/XvLOufKQ1Ej
         PxwMNIIeLrF9IGtrXPbbh/+TBkAkJfu42aWRxVk1ZRmT2tCMtscyjfDaPbtXOzFLPz8Q
         NpmA==
X-Forwarded-Encrypted: i=1; AKwUvBxa/WqYf8pifxNIYp/j427SwI9EDYrCcuECPNf/TkSFM6inXkx/A8JnEfLdVZNgtvfPOz/Ahzrl3l6B@vger.kernel.org
X-Gm-Message-State: AFuF++kY3gMGQ1M54eXfZZXnp/QO85S03io0ec4cJaI4BlKb+G0lpJZr
	WoqyhcjsjCoKua75xR0gBUB4feimHWZj1rkh9RGj/wwDaCoHGO5GXroO
X-Gm-Gg: AYBFou27GgDDe7bhH/fQPTMPS17wSF4dgnqEWIF8lz9ec0y279gxuWzQDtpV3lMWrH9
	NLkjGx0NpqcvHrv6sZPE+yrTEvdML5pwx+SQ68LgGQjRL30xHssfcqwjsfZRGN3UxxUzzTZFL/Z
	ylSODkiPGyTBiPhoRhrWnVNkn3kgS604oAsrIb/ta1ZxSNKr8gzHSd/+h4nAON3JwREZf5Oyyri
	6/bbYqHRUymmGMNI146NYLthocE6ATN4wEpPb3Ziydfb+Zkb/rG9gmpxy2U9Jb3DBp5RSw1Cqt1
	QBL73jqXqztMu+klEdcW6tMSmtH6yNQHmXe7zJxhd7rpUkTbruZGADhpYzqj7xK58dd373qMse5
	DemNnk7d+kLzDYJvob3jwW0vCVp3crBUCtRROEYeiJ7ODi940Uk1bR9ZfXFfnkmI4j+3nXA0yDe
	epeO4Bh5/pYQW2fB4xaXGvnoaVYkIumCGYSeqaAUff/3bST3I8IWSWztKaUxnbPHEQ2Psr8pOj9
	chpUOJMT/9Ikw==
X-Received: by 2002:a17:90b:524c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-398f7eeed6amr1371508a91.0.1788151769702;
        Sun, 30 Aug 2026 21:49:29 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4cf:2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm19345763a91.8.2026.08.30.21.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:49:29 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v11 5/5] dt-bindings: net: dsa: yt921x: Add LEDs definition example
Date: Mon, 31 Aug 2026 12:38:58 +0800
Message-ID: <20260831044818.4103477-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044818.4103477-1-mmyangfl@gmail.com>
References: <20260831044818.4103477-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add LEDs definition example for yt921x to describe how they should be
defined for a correct usage.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/dsa/motorcomm,yt921x.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
index 33a6552e46fc..93ba5b181205 100644
--- a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
@@ -21,6 +21,9 @@ description: |
 
   Any port can be used as the CPU port.
 
+  Each port has at most 3 LEDs connected and can be declared using the standard
+  LEDs structure.
+
 properties:
   compatible:
     const: motorcomm,yt9215
@@ -59,6 +62,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
 
     mdio {
         #address-cells = <1>;
@@ -113,6 +117,25 @@ examples:
                     label = "lan1";
                     phy-mode = "internal";
                     phy-handle = <&sw_phy0>;
+
+                    leds {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_WHITE>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+
+                        led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_AMBER>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+                    };
                 };
 
                 ethernet-port@1 {
-- 
2.53.0

