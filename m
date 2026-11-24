Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521890;
	b=xaWidzATb0uy9bIMgOmtOd8RnuSfoEMS614OZv4szkf+3UYkHA7b5Bn7Dx7b8b067lp3
	 2zQBZT3UoCUBRdejxY4rR8zS3EsJZjQ2vdDuVe4YZ+ppVimHncaGlrNLhDtallnjDDU6E
	 /nZsT4PoNUrXBlpjG57SwcmZpsoZE059cybX7rKjC7OmlecrsmO0F/LqfA+fIHqHEv+t1
	 T23iCfJxmyjfDW04tuxAuWRkYuP/J83NRzDRPR8NhoG7zu1lP7e5PIFo59qpXIH9Hvclz
	 EXwIayFgSYHniylLrsUdNsialIOLIqa98aKVIOUAu8/FBabeg3CPNX1NqhudPxZMkog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
	b=NM7ukXFD8z2Cpobe+2opmEbPKnPDptoi9C4wEJ1pXw7LivsG715FefOs7o0VGFHmUV87
	 rjuOGlZaPeJi8N/Fb518mygEdx04PsbY6OIHynVqIaEYx1C7ORKvUjnNnyUwceiUOfemv
	 rMALivQD93WMrDqjlirEhUWF4JSAZYrvrk7PSNLh1avmgULfm2WE1qVqYpdVHFf6K1xNN
	 RH4RlLsnN3wArzmrDGtVf5fOCqVCqDZbSUKLUwm6i5YabzM6e6+jlPRZlmW0sZtxnODce
	 JBgy80f7FRmei4QJwtjaezGxQGhcRi8g1OI+4IuMMRE0x8D6v6h8B5D/zulgvsyIevg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=mtdcb6Y4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F5606A32C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20F5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=mtdcb6Y4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so34151195e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521888; x=1796126688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=mtdcb6Y4DTd6/bcxrnqy1cCsLId4/s+OwY1EJeDc5eF6fgF2z770B4GhTMuP6tTPa0
         uPUrumxuX48iNUfYgxqWsP0giSWZI0hVIgJhdN5eQwKtpJLi8AgAvhbzpUyHBH+09IyZ
         tycB14h1Xub69zj26kiPWYiJ/PJVmmmW7JMeNX3Y/6tdhTjsCL++j6G5GYScK+DTjwCP
         rzYCwCY2+uVj6SFZuAvuxIYPqOMfGRwchGa9oUvo38tYXgcrRH8wMYSMeo57eScaVs54
         N2isRl7ocmckRI9IMSjo9B+3UxjNLg2vm6Kdc0KzXHW1VA8pklxMeGMf+eihP7p2d6JN
         RnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521888; x=1796126688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=AJgwmqkQIKaJwijz+ejI8GhCttMhVW02ENf49baNz0fH/wjhA5VpipbFpc87SK77cF
         s3rqSE91gYj0wb3FyBsHyJ1JOa9MFfuilK1PyZxqVU+DPQkc0KL4O17QlDTkRut39XQ3
         0jLHWtWNPyI+IAv0t/v9KmAIHFeelBuWFGU5TUZMc3/eh7fvfcY39Q1AXiUVayu7RGaG
         NrI8kzvucuCZ+vbc3zj9qGjyiQfyB+dA6f5we7kgEiSnDydndCJEliED9fmRIRPRyeB/
         Md/dmJ5CRz0Tpp7OTm6dXtGQtVcdSiT4e+730PPN95f8DTkWzXpOxTw9EM4tm5hQMaOV
         0y1g==
X-Forwarded-Encrypted: i=1; AL+hErFYNYH3QCbWXELdo5lReYojirLpXR4kS6dpDqiFBcVN4z18M/7eMZw6XRvZnQ2R2s2g546Td9ClHs/v@vger.kernel.org
X-Gm-Message-State: APuU4Z+lSOyDUvvCpvbDgcASDgSO9LmyJXn/cPejLfYtkpMby6vi5sVt
	wMAVoPd5SG+pagQmyZyTwFVzyW0y+oT7tqEDnE8fw45vyrm3SL+4yv5rk46pj3lX0JM=
X-Gm-Gg: AZFdTZcHwHr2zqbrqWcSZ7TkouExJhEkxHLM+EgjI5Y2S7beGUkfoevPpJ1xH8OfyG5
	rHcXGCWVHsY/4+qZwEItc+oK1trmWW7EppgtayzfY9NlM3DVcbsRLPmoHeGBLkulW9Uj3FQA+vJ
	rEFlIXR3HV7mJcH1+tdbA6ntixvPHIs5O9YZzV6MVpGSdToAmFH2aG+b7qv+0gkmgQIfju3CxSM
	QF/xosJadbDyjsRnlQnFOKvILbGM3etVGF1Oh1E0SR/JtCjFC9aJB9kjoIOygGlPmLzsJ00vUVZ
	IT/Sc4ZNq0JZRhnw3JLn/USut43cg0nok+HtNr9kkXObFOhDLS6tH6UOa9bNZvy0OAXjufIlq7t
	e8yc1MgK34T71BcCBGifpmyAvvArgJurr7T71+EzKwGwBjdGwp6hhVIjG4ui0BmJs08vr1eiJCR
	UUct3v5BATo9qvHiRAI9s2SZIu+irf6dSaEy7lQ0B+8ULdK9gggBUWy8nwJr9NH3cP/cLugwDea
	f+4SD5R2VO9fJrdkd3pJaMajSXUFKienOuYGM3J3XUVNiX/c99PtYfYif0ja4NlEpAQAaDBjwBs
	6kaiyKJOCwZO5XUFO32xC4u5jeLNS2o0gOyxPtaqEdYElJrRg/T0BSmf4zG6JkPnhcXEnDiQa8W
	3XEHBtDU/dgEhE1h6h4ZMyP1PaJxPKw==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr320380315e9.5.1795521888248;
        Tue, 24 Nov 2026 04:04:48 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:47 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:31 +0400
Subject: [PATCH v4 1/5] dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-1-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=alchark@flipper.net;
 h=from:subject:message-id; bh=CS20fXFVzcjdeDfFRS8feA1q6Da6FDy2IYeGw5SpswI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gb/cTkkOnU6z7Mg8WvBWxZIC6dIne6/+bxhV4vEh
 O9ytk88OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqE0sZ/gev0w9uPyqSnpO85MoFybvMdlLvja7sNeW/kFZ8OW6jvxQjw0v7PSl
 rmeY7e3f86W24O/N148I+y9L0na53zs3TaN7Aww4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs ship with a unique CPU ID programmed into their OTP memory,
and compatible bootloaders derive Ethernet MAC addresses from it, so that
boards with no dedicated storage for one still get a stable address.
Whether a board ends up with those addresses then depends on the
bootloader patching them into the device tree.

Describe the CPU ID cell with a compatible which also defines that
derivation, so that the addresses are available to anything which reads
the device tree, whatever the boot flow. Referencing the cell as a
"mac-address" selects the derived address, keeping the raw CPU ID
available to any other consumer from the same cell. Keep the compatible
vendor-wide, as only the location of the CPU ID differs between SoCs,
and that is given by the reg property already.

Plain "mac-base" does not fit: the CPU ID is not a MAC address in either
of the formats it allows, and its offset argument is added to the base,
whereas the bootloaders XOR the index into the last octet.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml         | 33 ++++++++++++++++++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |  6 ++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..ad38954cfb59 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -19,6 +19,18 @@ properties:
           addresses.
           It can be stored in a plain binary format (cell length 6) or as an
           ASCII text like "00:11:22:33:44:55" (cell length 17).
+      - const: rockchip,cpuid
+        description: >
+          Cell with the unique CPU ID of a Rockchip SoC (cell length 16).
+          A consumer referencing it as its "mac-address" NVMEM cell, as
+          Ethernet controllers do, refers to a stable MAC address derived from
+          the CPU ID rather than to the CPU ID itself. The base of such
+          addresses consists of the first six octets of the SHA-256 digest of
+          the 32-character string of lowercase hexadecimal digits representing
+          the 16 CPU ID bytes in stored order, without separators or a
+          terminator. In the first octet, the multicast bit (bit 0) is then
+          cleared and the locally administered bit (bit 1) set. Any other
+          reference to the cell refers to the CPU ID as stored.
 
   reg:
     maxItems: 1
@@ -48,6 +60,27 @@ allOf:
           const: 1
       required:
         - "#nvmem-cell-cells"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,cpuid
+      required: [ compatible ]
+    then:
+      properties:
+        reg:
+          items:
+            - items:
+                - description: Offset of the CPU ID
+                - const: 16
+        "#nvmem-cell-cells":
+          description:
+            For a "mac-address" reference, the first argument is the index of
+            the MAC address, which is XORed into the last octet of the base
+            address. It is ignored for any other reference.
+          const: 1
+      required:
+        - "#nvmem-cell-cells"
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
index b01567f99284..f30166109a7f 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -56,6 +56,12 @@ examples:
             #nvmem-cell-cells = <1>;
         };
 
+        id@200 {
+            compatible = "rockchip,cpuid";
+            reg = <0x200 0x10>;
+            #nvmem-cell-cells = <1>;
+        };
+
         calibration@4000 {
             reg = <0x4000 0x100>;
         };

-- 
2.56.0

