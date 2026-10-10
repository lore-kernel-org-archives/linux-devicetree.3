Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9651740D59C
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629949; cv=none; b=KH7+BXqwgJh+rSNRbynq1gHtoUWeqmRqUTcTqMd/FK6BAVGxd5x3glWJYF8fOUcuV4+kjvL2EKeNPgzPNR7MfJtwO0gdbK0Z+371e4B38decIitP4f4lvygowFR4zPPzVwJAyNDWdntFZRIfTzJYUtDU/kkriuaxp0BbHOhvcVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629949; c=relaxed/simple;
	bh=oE2Rl8+D1TRG1w8Cfdh6UV45uZxBzx9uVMcPjpIOUtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ot5xraXml9EwULX7yLQu60IiEEJC1q6v85pOjXKqKpYiTkrpK49zJOQaClo1Lx0MqKA0y0XM1okKt7UKlSF63kI4ccpAvL8i3orbePo4F/NwnDeXe+lMyMFDEhXO1UwIbtvmKmhnFqGnOoab6f0GDAynuVbzzjqf5igjSbN8gNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso463651f8f.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629946; x=1792234746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4gXjrYN0DCkNltbrRiGH9pQiOBUm1iOh6yJiBhfVz8=;
        b=tYy+qDbzVJ6GbVrzu3a3LN42lJCt9GRyF4s4CCfAA0RvFmp+og2ZI0G/7lC1oLJjqQ
         zyH6VrwAuIjMZxrt1C7QcWf7IxLNGTQKuvdc98bp0iF3Tn0BMlJWrWpjpOym3SSvIphl
         fSumQDkn2mQ+7oIgys19ZQ9i4T5BfHPcMea75IHXMqnJCc5z18xrWaZePc+UIDq8A5gD
         C3MOw+lqVIcb7mdPw7dcVBzaTWcDUQylcpyXOT70KeLMSOaYsdrdq5hH+eyn9f7V/QND
         SXpTRBcWwLODUMb42TURs65pFqY1Xf59t6Vixjes6vbP3s2t5Ejkf3rCFLIIUm5rEqeb
         lMxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAu7N8ngBg0ZPK3vTCFm7DtX2pppU1cC7I9rS2JRsLc2f91l+Ny0QocUiBSo2gScRfnvnRczqXoYB4@vger.kernel.org
X-Gm-Message-State: AFq9FYK+wx2u6m2Ls0IwIgAHaap9iydYFahEqO5TaNsnJvHJyUrq2M1v
	bZXZxgnjVv1x3tVPMjAEnp6brYEVKflWAcA4+jIrc5l8rI5XzqCDW2B/
X-Gm-Gg: AYBFou1WzHGuRN8N87GaKt85bMeoelQKgrkcoTt2ybneZa45A5IXvVfCM7VcTuOJp8W
	2yswinPxVGCX2krPMGxBt400UeZZIX2Fz78ys2LKS9bUlAHNE4aM/DvesKUY1CP1JyG3zvRs+bi
	JQEesS1yPSxemSf8eWnmWoGyJs5QBtE5tjYHf1pSKxhuPstJS6YlOGoNNkkFjgQWM7v5ZuoYxux
	KGcdvdGSnOGOhUNzPhF6kBxqnelC/G2nGmH7maxdieekf4zyYC1ElBNk/y2jQ5bWI9JkZzqLIyn
	9Plw0jELs2znfr8MPJRXRRbSt+aabQc6dSO41GRWp5OQOwWfzkIHnNdBW4ZYLnfAwI66dr00Y3M
	CXgB8vGxtlGqgl7+JtXTk8BnKKmznSl+d4umNcQ+6dTNQcZ7Jq8JIIG1W7JkrLxB+h6dJxWHW3w
	K7ZftkKDmPHPiBjSAIanjSqwbGcHw8QKQACCjcjBR2e0rtTv1oQb72nSxul7eFUZWmvA0kxJvmp
	voK9QftmCK5YsIVXqs2bE8mOJgnsDZoTT4=
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr8860590f8f.29.1791629945711;
        Sat, 10 Oct 2026 03:59:05 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:05 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Sat, 10 Oct 2026 11:58:54 +0100
Message-ID: <20261010105900.247342-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T7 has the same ethernet glue as the G12A, but needs two clocks of
its own. The controller reaches memory through a pipeline stage with a
gate of its own; nothing else claims it, so it is switched off as
unused and the port can no longer finish a transfer. The glue registers
sit in a block clocked together with the MDIO multiplexer, which only
probes after the controller has programmed them: with the clock still
off those writes are lost, and the port keeps whatever delays the
bootloader left behind.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. The delays follow ethernet-controller.yaml, so the
vendor properties are not valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..2353dd9181ed 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,56 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+            - description:
+                clock of the register block holding PRG_ETH0 and PRG_ETH1.
+                Without it, the block reads as zero and ignores writes.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+            - const: pclk
+
+        # The TX delay is a quarter of the RGMII clock period per step,
+        # which is 2ns at 1Gbit/s.
+        tx-internal-delay-ps:
+          enum: [0, 2000, 4000, 6000]
+          default: 0
+
+        rx-internal-delay-ps:
+          default: 0
+
+  # Delay definitions for Meson8b and newer
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +157,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +195,10 @@ properties:
               - amlogic,meson6-dwmac
               - amlogic,meson8m2-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0

