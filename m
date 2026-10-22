Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699610;
	b=TJAfX7lv0tQ5g50x9QZKlzJ4gwC7i2gqBW1gpym2zukJq8d4sOaWle0suRovLYekPt1r
	 zOGGL3MqvbKc0kDUeLaHh60VIMPcz+GPb1eK3KazQ4eI59cONswRqOxA7u2OUmh12eaeQ
	 d9ADm8GC6wYjWkZ5/c/pGWGT0FFrIOgnwKUZjzegtkwZ1Q2andI/J6UfkEFvyr6rf5G6c
	 z0XBfK57WrIIiiuud7wtfmG0QHljqjMifxidaa0tJTBNDOzqYh471862Lybeom/iLEKsL
	 AsYF8UlPerOSjChbaM9/96UxSA26LA+oqDQ454NgACIsTPU7hUnquPvknQZYnepmXDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699610;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RJU4MN4q31InnCqnmctD1bfgzdWMNbsD2UQnbMenASA=;
	b=Vz5PIpb+8pZS5viLRcgxLj1zvTuLiTQzGO7Q6u0HiQwBrqkn1Fnpb+Cx9P/dNQ76jZNL
	 wA8lqou6qBl3ibH+VsB/g82UDT2+kpvARJ+bNmGqK2msEZnWiLVHArOc04kdpjuwJdT+U
	 gg9FcYnsZbUyfgTL4vCQyHEF8uA7q+l2w8GOufiipgtCrBl9/Q4f93tZKr9YN5kXz5JWE
	 6XFPuOJRxV+fJhXo4Lm5aE6ax33OgegkN2+XPbA2VXzIx4J0QAroEnlqSGFElwzERDAdt
	 cD0v1N0EYPP1TtXkmeaf8a1F8tcb+VmEFBFMrjUuQN87uofC6KKv7kNP63BD07czowA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9A8606A33E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9A8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so1466105e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699608; x=1793304408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJU4MN4q31InnCqnmctD1bfgzdWMNbsD2UQnbMenASA=;
        b=wDzSLE0TeBsGKuryuTVEP6pBysYT4jdrkLti7eonY3jMk0gti9TKX0rhiDBKBC6e4J
         zxK/XSxAt7JLTo5zeEhDQ3ySqyfk6W/QZQTnuNCRYDvA5SP8WQyMhe2lRtXHGS13cnil
         iLgr2rGUtN2UvCmfE4GgqaTHt46DL6KglCLrYHETq94tV1Uz5dBkt2xrUUtLG/oBMIgK
         xDPsutj75ljaZzp9T1zNqNvJKBTHUM3M6SBTVc3B1ksf8HiJpQJQ+AZeBcB9tV28F7iC
         uKuGwMhVvm3x610LHWrZNjH7IG2uo5Crpb0SkxqkeRG2taKQ7L63my2mvuia+c534FZ1
         NWkw==
X-Forwarded-Encrypted: i=1; AKwUvBxF057+UTmjZPpkKwfc2YtSLG1P0/O7u23s60t5D7GeUAAAEa+AUSgJzLLCUQ4MdOBLRFQjq2RhAv/e@vger.kernel.org
X-Gm-Message-State: AFq9FYKUQXeFPXQrziy68gY0X3S5KOjoWGYWM3t1QFnOe0usWyfotsp+
	+lD4s+azA/uNcyL8HUwLr6kdCYoX9YbODtcr5UmZESF3Ua/jA+0BySY0
X-Gm-Gg: AYBFou3YQpEi+L/V9+ES3dbAn/+WCY3jWAdFrvP8vkUTGslCxBtDgyGG7zOsvogY6AB
	PdZA/pCbvjV5O0BAd/Wm/C7DzXmG83NAkD4mTVIAOSMbJ7SeemjHgECDuvw/i+i/fkShtmklYy0
	xWrxVC1QMVk9q9u+J7uIJOKzIFXnHEu+crUgMiWIcO6IInX9fNYi4WEHsZdkvuyeGn/DJT4Q01y
	R4c2c+/muJG6EXn3d4sPgOgCINmIINCkCj89biCFRSJGnQg57IDjqgMUAXuNlcuXPTbmhkUf0ar
	rG9EBked2uKATJQ2gIQTGXUKYF3z0Pf0zUN0aqxJTBfP5yFI4eTKNxsNe1fj6gmoLNNrtGd5tYg
	32BNoM9W+bOXkbX37pPBArklTCjsm4YNdxHdtOiHpXV6aHUqIsHxV83TWTZpKPEHEAi0TCfn77z
	NcsqBgil/TU/Sil2PD7LxLswWAthi5hkHiDUqpHw3gz6E+cArW4rQk/iEtOvGTt5C8MHdaxHr2k
	txJicSbi9hfgmYCksEXnNuR0i/HnCOHW8WJHAZHrSJEQ7tCIFOdaF/bHzh8S0GXqp8H5yl7xRhv
	wNGRS/BQ0Ul9uWotP9DUTabFbLStHvgGHyZS
X-Received: by 2002:a05:600c:4e8a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a211eeea21mr2127325e9.6.1792699608276;
        Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
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
Subject: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Thu, 22 Oct 2026 21:06:35 +0100
Message-ID: <20261022200640.3101932-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers sit in a block clocked
together with the MDIO multiplexer, which probes after the controller
has programmed them: the writes are lost and the port keeps the
bootloader's delays.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
the 2ns, and only the receive delay line offers fine tuning, so only
rx-internal-delay-ps is valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 69244afc4ff8..d27f0f2c52b0 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,61 @@ allOf:
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
+        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
+        # The RX delay line of this glue is fine tuning in 200ps steps,
+        # added on top of what phy-mode describes. The TX side has no fine
+        # tuning: its only step is a quarter of the clock period, the full
+        # 2ns at 1Gbit/s, so the TX property is not accepted.
+        tx-internal-delay-ps: false
+
+        rx-internal-delay-ps:
+          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000,
+                 2200, 2400, 2600, 2800, 3000]
+
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
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
@@ -142,6 +198,10 @@ properties:
       - items:
           - const: amlogic,meson6-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0

