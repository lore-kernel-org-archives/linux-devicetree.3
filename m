Received: from mail-oa2-f20.google.com (mail-oa2-f20.google.com [74.125.231.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B323750B41C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667727; cv=none; b=Xbscsscl8sSY+0LWlae5xy4vLnX2zQvtTqNzH5ClAWDXtuL0L1j4sfv9J1CXSfI+OTvc0vOoigOMU5XSEcJct6DofS9djYSR6ZwmRsTr1pyCIrtG0tQ4oX4lGLuUGTjai2f9C6rhtgsZ+gVMZEwTjsrPuK0CvIQ8vib7x/wirMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667727; c=relaxed/simple;
	bh=PRVkggVtJ5MI/earZSiaP3lIhXMmPnjDvErncSUEbaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWd/SSnDbvtLeEWLmoDGcWtqZskzALvOErToNHHeRqBeWB0NYOc+Xgt02+oXqS03jCqxS+bT3Za6BXKQCW7qcKDCcORWc03vvroDu1DhQNxv8ONZj4yh9JG7sSI5jgm236QZ21SdOLSqjs9La8yACDQIz9tmHSOqZegHEcwpxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuHnOlHy; arc=none smtp.client-ip=74.125.231.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuHnOlHy"
Received: by mail-oa2-f20.google.com with SMTP id 586e51a60fabf-4788fe5736eso784053fac.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667723; x=1790272523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpJyi3gexBtR9fGEP/jcxswIyqDdKggXh7TtgBulLqY=;
        b=ZuHnOlHy/P2Kzfc9GcbIRBhxH5x14XWCtrVa91Qmb6pCRPZ/adlX3yEZrUSJp1jalY
         bfU4LPtXcMnxXEWmZFC6x9PZlz4O2V0cW1nG4PmRR5hNvdbu6lSe1G3+Ov907eU30X9X
         YtQRW3pxefT83oaGxgTRgwliKgUM7NRREYAKME0XtIU+zcHMJBboCss0SQgwc8idn/19
         zyq/yUsGvnPtB+CHGy6hgBLsJT2dZ+NjFO5qfbqUb+kv3zY0oFKX/864K8UVlxtdJJ7N
         t+TWQ91kstvpJsVxc37D4mDA0+HxkJn3mqpT0i4trphsYAomhSiS63XOfX+MedmRkJxO
         LeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667723; x=1790272523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpJyi3gexBtR9fGEP/jcxswIyqDdKggXh7TtgBulLqY=;
        b=UgX4NMRxAYouttIqb3S77iMYONaiPVIFAxKlBPEAtmzOt/0d7E/HT7njo/CwcC76h6
         eBt6G+NGWXGC0ULWYg9j+ClF8HN1SWrihlEmuDibGSWbIF+KJoCCXhukDD8IN2YqgbUl
         JN7KufaTrPaFODdUqHvUbPGVw7uMSPipQ/1KO3KEf5VjYWca9mYxpl7Ht2u0SRnINBQa
         lOEjAayKVLnJIu72vbDxNSPpwATd/2K1/vcKKzS+klCQWIWkCU4GSZQ/HZ1w00g8Ye2l
         Gi0PlYHnYTWNByGjtgmVEaUia9j8ZrgoG/IkFtO24VojFJLM6b7fr7PFpn+rqzJRvUie
         XUgg==
X-Forwarded-Encrypted: i=1; AKwUvBwpLluxclKdnp1hrUs54qdPk4Cfqt94+Rgt0c6FUBHR/qarfL3TzbbQfZSisAchDxobON9yljR/vRbv@vger.kernel.org
X-Gm-Message-State: AFuF++kr135V8Lywk5ZHIvAI2Q/i5rfKl/cLmPrzb5hS4voJAyxSkVc7
	vaCR9DQdsCqgSa5na03PXGuRwls64qm4fPZEwnLfIZrqCCfXPJnFP65P
X-Gm-Gg: AYBFou2UEDOo4dLd4K+a1gb8sFj38l6y5HvsTKLpXBXl4Ub0uaq2b4c9iMHF1VeON0d
	OvlQx2SnxiyuIFktd9LYwv9mz+hW/r02rNXtdIMmPEcOLtJ4ZMpljgy8cGxm92qPsENqEJgS4qT
	vc9l9H7c5EnIzhpwbloUZIqoJ7Yt5kv4XaB/Fx2o7yLOi4V4W26hRK02EYhmY4SZON/M3SG9XK4
	aCNy3inbZrvk0JTuzIdtDtS0y2GBCa5mOY07/59rmqSlHtA/bkKCxoadP7GeUhWIDuHYx++Gvh8
	KAsXUyUKEpAqkvJoaIQ3vXRZmPFruwtD+9cg0CQirO9euQni2Q8Tn2fDHdPzFAruvOxCwphzLj7
	m+13jE3YQ5PvAzb9ts3CyOOOho96kbiDrpdo5GqX/NPHgkHAXzVb1yFPZWqZPo62JGViIep/kBS
	eoIDcArmqvv5b9KIXfrRfR9zAbGJNzzDb2ShOtSMOFdRKh5oTuOToqY3jfUTXWLkN50Wg5NrKkL
	jTAfkTSMkUZiQx/B7lsuTNehRjZ79nPKmLzypyqdJXTE2BerWn6+qjZTRep7K7yjotmYdCfzaxN
	xlCStW72uh+WvH67BRe5pMcG7uT09JA/6Vy75CMZgXaVadKqnWAZ6Bj+bcg+xhiW7bEH91uxb4v
	ZLdefWr0+4e96MXylbym1
X-Received: by 2002:a05:6820:83c5:10b0:6ca:b5f:e6cb with SMTP id 006d021491bc7-6ca0b5fe74amr1221351eaf.42.1789667723400;
        Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:13 -0600
Subject: [PATCH net-next v3 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-2-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2ed4564ae99d..b20149c3e850 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

