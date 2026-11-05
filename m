Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873009;
	b=FUJVFxWuX9zO5urPFLPm1nCSSHeh65Szntuv9bVdnLerkZ/dIpN8KPBhCYh/VtVqU/ez
	 IW/WrFVvHwXXh4+GYpV7fRBPm/SOJKOfxlquzZBs1fywnHQwGB1FG7FTPdbeP25MlJdkr
	 RiQ+YTvuQpRnCKMtxFn4VtF8+yA/0zr+f6qdlpT+6aluEwBpW0PZ/lGdWnFqQvQq/FgFY
	 JrrYvplX004cIyGrMon8OVZiGwDjvRJEzkBqCYMHcvVGiqW2OBa9+86VmfEJHjtQvRzNQ
	 TlhYFT31KvJ7bwLz3lLSFlj4KdM28Kf2dO+jeCqdt4ImjyhTyMWLpcvtdR2RkHWwJkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873009;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=riOJeDHnKOl8qZ1I9NldksXV+t7kX6cUU4xrN1nR2eM=;
	b=wK5539R7mgG2tEEV/HOMuMO4rkhhmvo9pMhNRTr71mZ/tTNhRfPdtJcoGNzYW/ZOUwo7
	 1YR0onsaE/pGheXtBy5EME8i6/37CS0J51kxdMmLLMJAJDg774bsgnGZXOG0WjXt3SFI7
	 rTQYiah3pARfCMOS7pgFRWY9ongtAciW0Km8B60tqT+iwtDpf3J1dz/vq+DTylf5hdptZ
	 Sz3yCQAhOe108/CbaMuhgsipPTtxIxSTYJxRaa3YtOS3Kj7bBSDARSrJztX/EN8nQ5oO2
	 nq54MK806me/FWT21sPs+Fg9frIeRLyOfwWYTRNYimbr61KGO44auHPC5pB3prH6wpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E9606A339
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B8E9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so15337475e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873008; x=1794477808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=riOJeDHnKOl8qZ1I9NldksXV+t7kX6cUU4xrN1nR2eM=;
        b=yyNX8s47Ndq/M789UkhRpfn5fXeGU+vjXwR0mmhjGg4uJRLsBprNXi4pSu6XvUbpr6
         0uqy3KxlgZ1WHcWUn4jLTbYfSyWAPw8ZognOn8xAMgBPBklRx2wCILbcHv6vcqQLuiJ4
         VB/Qcl3olzjeR7pAFBo9W0jb8/XiUw9FmMcwnTKQj8scGTXICZwhAJspsYOc1I+BGWZj
         z0OI5X8qBWv449csBlYm402jIpmC/d34P5+UM60eThO/6vkv9Pddk2asrghwSbVm3B5+
         tOvOeLGDiRkux/YH/4EqVkZ4+FSz2UPpIF8DcBiu5N8k4Ira2ioZm6OB6GptjKatwc/+
         xxwg==
X-Forwarded-Encrypted: i=1; AKwUvByQYcuV+Ccu4U3PHWvNAcP7uaqaxEPJwdSUKM15ggQudoYCow1fM5VHjLnbixDm9gONpEhAdksaObC6@vger.kernel.org
X-Gm-Message-State: APuU4Z9NjMBJClA6WKcikY9gLaZF5sIZc2HFT5znAyIq44qWPj2cPHIH
	JBhZFu0f67vecm/5Nvy7C72aneDfIj4zBIKxjxBbjFJ0wtmmeDiSASLH
X-Gm-Gg: AYBFou0RLV8YsHGpx7t8+2up+dQ20bV0AF++pN7aK12VmgN1aZwAe5Au6ehn/ygwa/U
	EzMPNq98gYuI8IgkckCIlbXAyMYlxShyHfl/D+2XAZTxMlGReAQQHnSleDf0o8r+3DVJlVje8QU
	219s4YiCnM6SFoxxN2w6e90XfM7q9ei2CK5f7uvohxNzy9CWD20SSdBZRg7VeH1DW5OexCIoIhW
	R+EU6oIOrLJESYGhssES9n8d8U4RnY6BDZwDL95vIq+MHwAtCIlqIKQIs4MENj735a1YaJRxGEF
	+iETzDv8CHA+b7a2KZxQw14oVD39pI4vN6wfAwNHnYDxwAjqS8rec1rTh7VKiTUTgx/ezYGu+gb
	t/Nngj1zvlIDkXHASd0QmTEq9uWjqLySNAGpx699LkIm5GgJAy3Jzy3kHUsJI653LCKS6Z04Ela
	/EGsTe9ZNOdQzT0ctwhfzj6GT5kqx9GeVTIRABfUSDCXPK/FgdeYAfNFRCgIZluAas/EzBFTY4Z
	QVr0sauTlc7QsqtbWcBS2kNUn4vL6rngM1S9q8assQuVAjLXP3oY1j7bGMX3otIJifPqE9rV+3w
	UMRiC6RbOGxWL2ceYp+5OcZxkM2Rihhj4LBoy9YVyK1sh7Z3SMzlmFMoIZuC3VtVncqNp+Jvela
	5/+4yxKVYDNfHEEnVSqESnQKXGQ==
X-Received: by 2002:a05:600c:3b2a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4ac1709a2c3mr391986775e9.15.1793873007590;
        Thu, 05 Nov 2026 02:03:27 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
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
Subject: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Thu,  5 Nov 2026 10:03:17 +0000
Message-ID: <20261105100322.37816-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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
 .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index e769c9bb70d8..ff5e50f65114 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -84,6 +85,49 @@ allOf:
         rx-internal-delay-ps:
           default: 0
 
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
+        rx-internal-delay-ps:
+          default: 0
+
+        tx-internal-delay-ps: false
+
+        # Deprecated: new SoCs use the standard *-internal-delay-ps
+        # properties instead.
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
+
   - if:
       properties:
         compatible:
@@ -106,6 +150,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -142,6 +187,10 @@ properties:
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

