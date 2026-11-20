Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134363;
	b=iTEne2nP/jmUJTn7LVSuiA8L7yc/NEWAtH2VOS7nLbFxOhp/e3tMOSmX5XMcDvaOY6Jz
	 SJDnV79QbnE5AqQ9cXWOMssLJ3/oA/zATMxZfAJclV3k+1d62t/6lOduKCZjZSgDMgzCi
	 Zh9Xmv1LTWGXdok7gDWgy5FRuSwf3VAKvqxK/7d1JxRZBstWIfMQTnCzSC97FFx2qTxiQ
	 39/xlxrJj99SGYdAX2MKHACTx+oZJukLTtsM2sRrv2wrCr79UZsfR+jM5ewRpI4JH/DL4
	 izctxWXG9Kv727r//wkEW0pGbHj48F68Vjb7Wl8geq+Af9hliyVGjIAw02Es9k414Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
	b=a4mqDUVs2V0B1dwF70BGCIbcfFCFcoo4E/OcL0aQlXaIwV0JLgqGVA2kBsHQPEdRQa4r
	 wi+JHiezPW59LFqzhrf12DH5heaEv+IEHB129Hxd4CB4j3fCoZCYLSmtwHDxuw727tZJz
	 BSapPxfsB1copD+x2BfCdKTPJj/GMD+at+pVTPYyAZ2vM7KiQQI2lVj3bBfns38UtKXx+
	 gTIABf2etdzy73XQQM5k1faQPcGkxZ46T8RTEtGqEdx9NfYqFpxDJp04HB8y8GBj2wBuu
	 2UqCymcUbkjvkbBM9a9iGqfhkFlaaTNl67DCxZjEZr2PWfpWEkTTcpQCgz3+KFuyRXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhLIC0Ks;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1F60A260A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C1F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhLIC0Ks
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso174721f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134361; x=1795739161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
        b=HhLIC0KsGgt0LEWcR5XuMA9Tl1gPM+5HBXY3dGeCM8bivITyBijOVBo+zzhoCqkh7C
         7mPs2j9sxSFYS3qszG5vD5fz69PpDpe/aF528zANi4bbQTgSwnxd0aTrgDiAbzoYXp62
         tRw5u5Vg2RqU4m4o+46zGhJGkXX/zDUXB1j1Is5nN/KfLas0kIs3FJF0PKJpPVx7TY9Y
         2IuPwOquedzU4+M3FrHASrGReZ51mRmJoblmuFRv5RtxQYdrJ1ZlayyhggJvQUkVhAkW
         dXl672Jk+kquah+rxm/7odgAvXqJtkHBmFiUynlYXirgwp7jDkpLCf+IwgA01z3zLnXl
         9/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134361; x=1795739161;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
        b=PkjruJvTNDWuCPKc58iiyrL9OU5Z4paN+VmvrDEBa469L4GhRLjeeHsi+MQColF/AS
         JamxuT3QApOaUATh2+NKdi8/GvyJ4YRyaan8Z4v95R9OOZcQbx1Gpt/Ouot3QeNByubt
         7h57/WdI841XHayJjZ+ux1EGiW5sYy133B6nbCKAoQBYu2L5lZBnXtGeKE3L7mBMkFrp
         ETxG5UiqTQ2B7jvoNFbbZaeswUE8ETqZaePSZCtp7fda/I4uyZ9qJCYkKkflpIh+weV0
         UWrErrHaAhOyCp+rW9wUzGER7mzp9YPeTeiAJ2F3sO66g5Y2Vd/DklMo2PNea3CPS9Zu
         zbIA==
X-Forwarded-Encrypted: i=1; AL+hErFGCEYanhtB0dFOuwvUlR0fuKX5uewRoILavVlLWcID3I2e363oeWq1FAnDXHzHCnPkzC9Bp4HjvWO6@vger.kernel.org
X-Gm-Message-State: APuU4Z+wnsV1IorQBJ7Vdoxwaoja750DYZtOIRv9HnyzvHJWCxRw5F/C
	Gf4hbn+fGuN82j/u1DNnRnWY2+W5wIksvyEb+C6AvCcaybgUPuIzacdT
X-Gm-Gg: AZFdTZf24zUsJ8w+Sl6z+0Pin7CIIKZNZtZq1T7rlSXgNH8W6ptf4zvuaRSlQUfeFKW
	Tv6sgLMepPdeXYatUXYHXioTZ7qzhImOp3x/LWgSOkOrXLe/FHhu4UxBeBX/cQu17FgZ9iV/2VC
	VJz1Hlfe2DMAan2ytfFyDWC8x4byjdnB1vyURJBGkhsMAao8YlmqzG1ABDnyAy33c5oy2SwcOlP
	1bWsxjVDKlhLQcGVXnZqe5x16JFD8tDHrxsTK9qDeoXWCPct/beYPeeGQLomeBOWBs0skhQir65
	968h5TLvGUYT7oPpGmI6rwf8SOHeyZBWOMDLcYx3A7pK0qsLySKLFwFwTs3xJQjzmdvqn9CQf0Z
	wpmQ2PQANYNFkL/Xqs84Pdg8lZWgSB8+QMKHbnY+nezy/iV0hRnxyRx3WEk318kS1b5XFLy2VqX
	Ee66EjccebgWDMACCtzr3Dr3FSQGTrUxOUsX1H3yU0kTkLa/Lv/QvEQYb/YFjrjkFKHIEmJxpek
	4lmdle93DTnCPDdx/HrNOv6XyZ4DZ9Mbwz5fA93DauTdXGNEQKm020LpLE8HrDy5b1CDM5cIX0l
	nZyNs20AJKQ6qif0yWYaaihybTe4u96cSRhk5085VSVsTn0wTGIsmKqqqaKBhSd7ybOucqa39LP
	R8F9kn9Qj3SFQXV8G8VTHAjnu2QUX+39KFe2GUsbWbH2T9lbJUjh2VJR/4oICXU/aEgHoaijk
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr6828586f8f.11.1795134360987;
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
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
Subject: [PATCH net-next v5 07/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Date: Fri, 20 Nov 2026 00:25:17 +0000
Message-ID: <20261120002549.1908299-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the A5PSW DSA binding to cover the ETHSW variant used on newer
Renesas RZ/T2H and RZ/N2H SoCs. ETHSW is derived from the A5PSW switch
found on RZ/N1 but differs in register layout, clocking and interrupt
topology, and exposes four ports in total (including the CPU/management
port) instead of five.

Update the schema to describe these differences by adding dedicated
compatible strings for RZ/T2H and RZ/N2H.

Use the RZ/T2H compatible string as the fallback for RZ/N2H, reflecting
that both SoCs integrate the same ETHSW IP.

Add myself as a co-maintainer of the binding to support ongoing work on
the ETHSW family across RZ/T2H and RZ/N2H devices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4->v5:
- Rebased the patch due to previous changes in the binding
- Replaced the patternProperties expression for ethernet-ports
- Set the maximum constraint for reg values on ethernet-ports
- Restored the RB tag from Rob

v3->v4:
- Restricted the reg property for ethernet-ports to maximum 3 for RZ/T2H
- Added RB tag from Rob

v2->v3:
- Added a restriction to disallow port@4
- Updated commit message

v1->v2:
- Added full names for SoCs
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 156 +++++++++++++++---
 1 file changed, 134 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 30f25b06d62c..c08729136176 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -4,43 +4,108 @@
 $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/N1 Advanced 5 ports ethernet switch
+title: Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW Ethernet Switch
 
 maintainers:
   - Clément Léger <clement.leger@bootlin.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
-description: |
-  The advanced 5 ports switch is present on the Renesas RZ/N1 SoC family and
-  handles 4 ports + 1 CPU management port.
+description: >
+  This binding describes the Ethernet switch IPs used on Renesas SoCs:
 
-allOf:
-  - $ref: dsa.yaml#/$defs/ethernet-ports
+  - The A5PSW (Advanced 5-Port Switch) found on the RZ/N1 family, which
+    provides 4 external ports and 1 CPU/management port.
+  - The ETHSW (Ethernet Switch) found on the RZ/T2H and RZ/N2H families,
+    which is derived from the A5PSW IP with some register layout
+    differences, additional timestamping support, and a total of 4 ports
+    including the CPU/management port.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-a5psw
-      - const: renesas,rzn1-a5psw
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-a5psw
+          - const: renesas,rzn1-a5psw
+
+      - const: renesas,r9a09g077-ethsw
+
+      - items:
+          - const: renesas,r9a09g087-ethsw
+          - const: renesas,r9a09g077-ethsw
 
   reg:
     maxItems: 1
 
   interrupts:
-    items:
-      - description: Device Level Ring (DLR) interrupt
-      - description: Switch interrupt
-      - description: Parallel Redundancy Protocol (PRP) interrupt
-      - description: Integrated HUB module interrupt
-      - description: Receive Pattern Match interrupt
+    oneOf:
+      - items:
+          - description: Device Level Ring (DLR) interrupt
+          - description: Switch interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt
+
+      - items:
+          - description: Switch interrupt
+          - description: Device Level Ring (DLR) interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt 0
+          - description: Receive Pattern Match interrupt 1
+          - description: Receive Pattern Match interrupt 2
+          - description: Receive Pattern Match interrupt 3
+          - description: Receive Pattern Match interrupt 4
+          - description: Receive Pattern Match interrupt 5
+          - description: Receive Pattern Match interrupt 6
+          - description: Receive Pattern Match interrupt 7
+          - description: Receive Pattern Match interrupt 8
+          - description: Receive Pattern Match interrupt 9
+          - description: Receive Pattern Match interrupt 10
+          - description: Receive Pattern Match interrupt 11
+          - description: Switch timer pulse output interrupt 0
+          - description: Switch timer pulse output interrupt 1
+          - description: Switch timer pulse output interrupt 2
+          - description: Switch timer pulse output interrupt 3
+          - description: Switch TDMA timer output interrupt 0
+          - description: Switch TDMA timer output interrupt 1
+          - description: Switch TDMA timer output interrupt 2
+          - description: Switch TDMA timer output interrupt 3
 
   interrupt-names:
-    items:
-      - const: dlr
-      - const: switch
-      - const: prp
-      - const: hub
-      - const: ptrn
+    oneOf:
+      - items:
+          - const: dlr
+          - const: switch
+          - const: prp
+          - const: hub
+          - const: ptrn
+
+      - items:
+          - const: switch
+          - const: dlr
+          - const: prp
+          - const: hub
+          - const: ptrn0
+          - const: ptrn1
+          - const: ptrn2
+          - const: ptrn3
+          - const: ptrn4
+          - const: ptrn5
+          - const: ptrn6
+          - const: ptrn7
+          - const: ptrn8
+          - const: ptrn9
+          - const: ptrn10
+          - const: ptrn11
+          - const: tp0
+          - const: tp1
+          - const: tp2
+          - const: tp3
+          - const: tdma0
+          - const: tdma1
+          - const: tdma2
+          - const: tdma3
 
   power-domains:
     maxItems: 1
@@ -52,14 +117,21 @@ properties:
     unevaluatedProperties: false
 
   clocks:
+    minItems: 2
     items:
       - description: AHB clock used for the switch register interface
       - description: Switch system clock
+      - description: Timestamp clock
 
   clock-names:
+    minItems: 2
     items:
       - const: hclk
       - const: clk
+      - const: ts
+
+  resets:
+    maxItems: 1
 
   ethernet-ports:
     type: object
@@ -86,6 +158,46 @@ required:
   - clock-names
   - power-domains
   - ethernet-ports
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: dsa.yaml#/$defs/ethernet-ports
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-ethsw
+    then:
+      properties:
+        interrupts:
+          minItems: 24
+        interrupt-names:
+          minItems: 24
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        ethernet-ports:
+          patternProperties:
+            "^(ethernet-)?port@":
+              properties:
+                reg:
+                  maximum: 3
+      required:
+        - resets
+    else:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        resets: false
 
 examples:
   - |
-- 
2.56.1

