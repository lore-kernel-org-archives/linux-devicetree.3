Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448146;
	b=fI19LsULlRNg22DMBE8Sz66CiyYk1WwJrpFZpBrXVRybaxbz76A43Y4+3+v4OgEtWjry
	 vEZ7IUGrZvvq9zFEADdWuUXzbT9lPiNZvB7GZdAdIjWzglEzXq2fCytKLtC+FcOIOkXSL
	 UE59yb7M3EyO78QqYRpUai+MxFX8J9GkzBOtInP4+DZhxQuu+N5Hms6CyWLL+wpLtjbpW
	 CeusIcpVj85/TJ8IIWKYYUwZfTyeSof4MB8ao3wbvbRZNt41UXHE+Yed536wfyUMVKlpm
	 6GI4/62+nccFfkLrJnwmiul91UTh//KuB6FJ3d5c0L8DOihE0/Rs1IzFONN0vw91ruQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
	b=MwBEwRdxTN5v7NxjP3duGlKyn+yIT1JeG1794xycBSHeamkekT9yCYccYqg4H7FbZ9SI
	 Avt1NDWPYk9Cgz8ic0AIm8Ct513su8FBHjjNwC2ra4JZn1Wd57EL+LSv0z2u+vFIVEOJl
	 C5GIpwf5eo7FI097uGUQv2jzYHbVjQze82D1C7ai978qF93SJram/hh6QVYZKjHZXok0I
	 3aqA51G47aurh7nH6sjvQ90VNLJ6Y3qlrd1eNgKC2p+JrLHtEEhpN7e9T/G/aOEoNdzWE
	 OJrSfp4ap2fYcPcmfx2QCMAWxdRQ/mjFhzGCDiSgyDmTjiKjaIBMkRb1PIrGQ7GkVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ToI0FsWb;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72A606A33E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C72A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ToI0FsWb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so32489665e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448144; x=1796052944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=ToI0FsWbD0Eah/2QyhzClH9SQPlsS38lhruMXa+ffVAuIRscFhzB2Ur5Y9KtNkF+gZ
         cgK4/0U+C3JwAfK6wKVTG+2gvBMlnfkrPCOy0UPcm2nYYLa3JmmsdhSpfOuN+oXmsXbr
         AWV2TUlc+IHb5CAc1BrmJ1MW5QEmz59IXr6kfLJLWj/E8asnyr91D0E+yRTOWvSb060z
         klBtrNGDNrvqmquHYK8fAXtDT9xofocZjZqOQDg93SW2wrl3XhkO/zfC1L4+nX+LPnVn
         WTA+9yXuqDfaxRLLioQlYobh/pJI4HzcsBUUmXnZ0ttMcMZlQutCumbv/UwZCu8R/XAv
         06yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448144; x=1796052944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=SptowRYjO+QdqUAKlvgFhIYSsu83IC+iBSwzLp1Q8wOGx6lazUqtWLuD6BXr4pCgv9
         2iGc6sKXzOUgRevRdTN3bPoDMWKYwEq6rqgMLdhNPeT6yOWLa5mHFOmCQq8evLhfNM1S
         ogfAPs1jhYVRmFCkSt2B7b4KJiRrDnRn0kb5/HG1TfmMX9YIGvPEFpfOU11livJjz+iH
         ZfdrJ1lMHDWM39u2bCOECcb3GNPjX06CjzR3xsH+36hwMV5ljoHmPe+CZhF5r1dK8i/U
         XnHTA02unDhM78lSWY9a8Sf5/vexmXEN62MhXFHYOfV0Y35vuu/8eyc8Xz4vQ2qCKWtz
         1jDQ==
X-Forwarded-Encrypted: i=1; AL+hErHhVNJZ53Oept/wxCTupRjm4dvjjG1pBsfooxpTVwcmtrRnE4p1toUgcmbhCPXwHt91zUDGmdo4J0zZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8ORR8PYBgctD6BWONg5GX/G99hnbqFzTlt8qs7Pmh72T3A2D46
	C2v3fqmuPI01sBhysMY3LQUpAxRR0hv99snU7hQAr+90eKaq1a0mS03s/iDz19OlXmk=
X-Gm-Gg: AZFdTZfy7H74O/PmY18doSthZrEMPvMO5m3i3GzSCupJY+kPT14uc++lbiA5TXScKcM
	a8buKg4MZ/ryeCgo5a+ZxLHDOR61QqEq7gC9QMq8Zpd0rs3gBW5TreOYRNuLdTeEHSrnx4vAk1w
	X7zcscNGp2meLbMoawoFaipLcYPKD1ZSbZe3/Prqs2iHZsEXO2BHyma04QneSUJDIvQsoQxHioP
	+KoZtBBb3GpZwSgpYwl4H2E8OcH9Sq20GlC7RRSAW4LICuSogHL0YzoiPJcYJd5UJRHPWiStH7B
	AWUv1f0ZxaA9GLgxdHu5zGTS1lB/7BAu6OQYC83UqszA6slf3JmuPV8Mb58TpfO/s2oepNG7NtC
	wFUvj9QaAg84jJX+xYO+YoHanaPknwxsGKl/Ak1s53yzO53A6itkhUmAqo93ZQhyUzaHWs05zWY
	OU5ZprIrXeNwwhKf02sBssMCRhBCEBetOUE2nrVbT/5CI5j80V/VhrqPV1TvlhazxiwHnTgtO+z
	lzNC5WwIwaiMkPtky9adPgYOMytm+dbsrrDuKB8Qp0aBYBTSpGRPR2tOG0lj3mFCscH9/Bt9bhR
	vhWFq3ux7dmxUw1rw0F9zcHxL5XIais2MjSnuozAZlqz9yXEK7zE12Qh7qZny2ytonQeOeKECDS
	8ezxYoKlHWe+OV+yAvLUGH/LRgVG4rnM=
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr225893635e9.4.1795448144501;
        Mon, 23 Nov 2026 07:35:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:44 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:35 +0400
Subject: [PATCH v3 1/5] dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
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
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-1-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=alchark@flipper.net;
 h=from:subject:message-id; bh=CS20fXFVzcjdeDfFRS8feA1q6Da6FDy2IYeGw5SpswI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHrKKs0NOXrWbHuL6dy7FkVJ/w/fVjU3e1eiHZF28
 uiFi24VHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1ejUjw+vperrr1krosv0zKhQ6bOgZ/p99ysff5eIi0kKBgke3fGf4pxXLKK2
 9JWrJNEex6/NyY7w3zfW+Ix6m+GvtNP6wk7G3OAE=
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

