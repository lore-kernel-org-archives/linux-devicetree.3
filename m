Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307445;
	b=J6oMLlR81ERNZQsjbPUdP6foi8HpRztMdofRlLLX5mXjl+iuVaaG2BPdwEoR8V0NOfQe
	 fjIg/3up0CH7CmZyDZvniS0HoHSCJz/8pVfw2KLAEx9ekduvMjH4zb99SXhJsH9jHCrIX
	 ERX/8egCTYvqaXX3YeDOa1dFYw7FDyPSBuFNS1bmhDG6p0lCelOmBkBJ0ec/P9wLOMeBO
	 90n9ZGzzSrvd+JAE7db8yXQBHCb30RumT3fKeoKu0AtcvwI7UayU/Epa2HX5pWbaJsl7A
	 Q2zf6GEtYt5elfGj9500u3ETZfVILiEB2HLhiRPk1H5Uy8NfHv1WhlyH/hWmi6DgVIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307445;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=+gUYLE9inULQdAdJ9bS6kOu3zld0piruK95rFsfT6B0=;
	b=z2U4aFmUjhk10MAcW2YHBHt9TD7GHreGY8q2Mdr5S9TxNQe9fuoHERBcbfgrFAFVW9uj
	 bz/3s8BAew46/+xTfWMLPHcC8Mmsnw1Bo4vnyfDjL9irSrzwNmAqeqFJPJLRq6og7mD5A
	 yl4hn+uOmo7qcpE+dJ0H9frSFVJVeaVqQLHRwrNY0xij80bwo+eOkJXNwl1ARqOl+w5Yv
	 L412CPjGtZHuUe7NovO4+tATqZnHuTE+hnd9fIudGF9Txk6MrfY2FUEVh2kdE5Ondwpm3
	 ue/CPcHWZOP7I9Y0xqkHRq2R6fzvsVo3hQh4ddMwtZbBsbakMthi2/o2qI7+eqJqgZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mg9mxldi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6635606A332;
	Tue, 10 Nov 2026 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mg9mxldi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40011F008A1;
	Tue, 10 Nov 2026 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307445;
	bh=+gUYLE9inULQdAdJ9bS6kOu3zld0piruK95rFsfT6B0=;
	h=From:Date:Subject:To:Cc;
	b=mg9mxldiafUf1x8tlMkXVLxJz/4snxL0VcVAImqvEDKlTxuLrnII4OMH0pcAWaT/V
	 R9TPd11azz+B8oUKrhl8zrt6CMlY7xLXSTBWP4Y9IVnb1ij+Lr0aMemdcaJBdlGREC
	 Iq7IWMgdcLnroFuy57RAcoFbgdOK3wOKXhhZdc4vAhwiPQK2qdhT4eHT54igoXrUYs
	 yLr8RqUq4EF4nj1dRIgaAX5pNqCR7k/tBQki0ERM3CgCrX0KY8mNQBPyHcVW2a8aOE
	 0IpJl8Xsv381DD1Q5SQmCPsq/95E76ApjqKBJt4acOWW353TEU+294L/72cpDwMFLQ
	 TM76k3Nu2fY8g==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Nov 2026 11:44:02 +0100
Subject: [PATCH] dt-bindings: net: wireless: brcm,bcm4329-fmac: Describe
 the MAC address
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
Message-Id: <20261110-brcm-fmac-mac-v1-1-df9e6264b056@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MTQqAIBAG0KsM3zpBLSO8SrQwG2sW/aAQQXT3q
 MXbvhuFs3CBpxuZTymyb/BkKkJcwjazkgmeYLVtjTFajTmuKq0hqk8TOufqiYOtNSrCkTnJ9X/
 98DwvBtKapl8AAAA=
X-Change-ID: 20261110-brcm-fmac-mac-4a8553dea230
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, van Spriel <arend@broadcom.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Samsung Ux500 phones with BCM4334 store the unique Wi-Fi MAC address in
persistent EFS storage rather than the distributed NVRAM template. The
bootloader can recover that address and supply it in the device tree.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Describe local-mac-address and illustrate it on BCM4334.

Developed with LLM assistance.
---
 .../devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
index 81fd3e37452a..0f99c6261a56 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
@@ -61,6 +61,13 @@ properties:
     description: SDIO function number for the device (for most cases
       this will be 1) or PCI device identifier.
 
+  local-mac-address:
+    description:
+      The factory-assigned MAC address, as six bytes in network byte order.
+      The bootloader may supply this from persistent board data when the
+      address is not programmed into the chip or the NVRAM configuration
+      contains a shared template address.
+
   interrupts:
     maxItems: 1
     description: Out-of-band (OOB) IRQ line for waking up the host
@@ -157,6 +164,7 @@ examples:
       wifi@1 {
         compatible = "brcm,bcm4334-fmac", "brcm,bcm4329-fmac";
         reg = <1>;
+        local-mac-address = [00 11 22 33 44 55];
         interrupt-parent = <&gpio>;
         interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
         interrupt-names = "host-wake";

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-brcm-fmac-mac-4a8553dea230

Best regards,
--  
Linus Walleij <linusw@kernel.org>

