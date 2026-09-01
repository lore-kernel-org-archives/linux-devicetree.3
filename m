Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC63441A559
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276812; cv=none; b=i8g3Q90SNd8P+P91TrgcZumUAuh1coMsGlfdgQUJvCg8bd/LjExzarlHmlmrZrlXuzmFo57ks1NNj8XinonmR/Put5eZxfSBJwbrIFLRkAnf1odXXzIhutK/JgqfrWX8ZFcNk+fNMp8jqJ2JTf1gsMLCQZILC2G5qJvYxdpb1DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276812; c=relaxed/simple;
	bh=gbqk612bcsgInYoFXSfKuUjKXJIWg/fCJSQ1WjRdZrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOW7wMXUzImZ8thggbhOTub7G821Uev9RyRM2EinwuTfMFxbqgTfT0lS5cyfyRHQGiaOrSIeqjaEDftzzhs/KGR0C4daaHorFjGNBq2c4sqz1Pi+kEHpzSvsAHJP9N7y7sVupW/WJijrtdllBrKigzQ5mu6kwYIhz1R9w8rG7xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=7JLCP6K+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="7JLCP6K+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso56812265e9.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276808; x=1788881608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y99lfkM4lfRyGnQf4vtEAa4xKTLI+p2p582CZw7DOpg=;
        b=7JLCP6K+poeQj6VjerCNtkurAZ7gRlc6z2Gpk5F1YTmrmm8UyjlshY8284npZ1nvm/
         tm00sfgUMnQ4j69vd00RBoSpqxmLv9DMrSFIjCBxig5MLp0JX9zQLS7XX7By9/2BZp52
         DEszL552pOgraOvZIfimflYdcMJ9UZeB0MfddRAqSheq/1LIRpqJopnryWv36D/vhZjd
         O/EN6Jm+ccrYkqledArNbF/9TUW4MzK6KFRV21Ccmf13RbGktOlPUqpdv3wpDjGjl9NP
         NVQe8Jp4Dedj0gECrm+VSCwgh6iKcMCvTWuTxJ6pJSnRrQ5tLAeaKGEmawxijWyun8BM
         9C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276808; x=1788881608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y99lfkM4lfRyGnQf4vtEAa4xKTLI+p2p582CZw7DOpg=;
        b=bmVC6GazfrLUz3uWTfe7gPiOTd1GAwO8gcaa7P3lqVTc1FdjeuBm5x0a30XK32j4tq
         fIgIR3C2bcyT7hMSMsyuVAqsfsgJeISjhid77k5/GnRGIYUwX5yo1xh/UFjo7r4jB69k
         JtJKtkU2v2p3CEajlT973rOgAiJrlNB2Ku9vlu/QIh8FONcvW/oJKQAZEW3yMF/uNb+4
         RPe7f5WWK2Q/80/muJFNqMiJsqaXliOj+jZbr5SXZ+BwhA+oBXAxR8nbf8E2DXTaCPjR
         LbzIhwwdIYtx6NOQ+NodgfdmpSx+rXS5geSEAE3Z+wblZ00HogjZ/XjFc1HgT+FtStnL
         bVcQ==
X-Gm-Message-State: AFuF++mZ0Uo7mlbMRMsD07SCqReGxCfmyK4KNqEawfuGYTD2l8qpRJPp
	o9kCO/Cimp00hYXUMr0lF4W2X38Jqm64AsD/itB9YxTW3gJlWqaf7kc4+Q53/BektjU=
X-Gm-Gg: AR+sD13W1SnSAK3Gxm+FsOG4r1+Lq0M8CXKx5K6BpHZyCMntO9M6JJlnwTzVKQB2afJ
	zJWdlhUAzxBh5Y/GMPSTs/ftX+KSfXIHlhONOBRfdvAFX+WotyfIHYWBdJDkU9L0MZljGa6xoJ0
	32bKGQmyDXgWbiBF5130IvVvi+DjmsaZ6FUqxfUFuDKDegDnE38hTBTV5mmlYbVKf+mqVzKiW2W
	miI8Dl8ahWf2hhLFfnTNa/+rOuZ/KcKuYThYO1pDK4IEaq6I+z1PYTKyk6Et/paIfdaWmltjwTx
	HtNEW2PJ9HZ10xurkWqw2Cv33g4PhzKYPduo7AxMD+0noWc2xdWP1eJJC/H9x5XXc6hdjpPmsWQ
	qLE7BmMZkkMdReJe8DN29fyw/0np1QWNerCGI8YCiKOc3lbxjT7kHuyEzRhNK14daSZyxmsqRZg
	MFmGP7MIy21M8AKtERPmNafOse6SwGFfmk/R1ENKPxl42/usdStpgyV5z/AuCcU19734wtAJ5fo
	TqwXxou6ogMvyV7xtJai7FBoIZGoKDJT64nX60N
X-Received: by 2002:a05:600c:4514:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-49b91c1f2a2mr561066925e9.6.1788276808041;
        Tue, 01 Sep 2026 08:33:28 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:27 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 01 Sep 2026 19:33:12 +0400
Subject: [PATCH 2/4] dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID
 layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-2-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4722; i=alchark@flipper.net;
 h=from:subject:message-id; bh=gbqk612bcsgInYoFXSfKuUjKXJIWg/fCJSQ1WjRdZrs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2D3v1K22fvkdJVbDxKZnF9mnVq/kkvolMicZTaX7
 QIyz85f2TGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBU33nJ8D989rzHab8Fn9z54BMt9Uc94njWGqs9CbaFRes+XlHyaUtk+F+2+1e
 mt2/TpsJLnq5vdR7P/BB8z3CehuKO3MK4D/+aKhkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs ship with a unique CPU ID programmed into their internal OTP
memory, and Rockchip bootloaders derive Ethernet MAC addresses from it so
that boards with no dedicated storage for one still get a stable address.

Describe that derivation as an NVMEM layout, so that the resulting
addresses become available through the standard nvmem "mac-address" cell
whether or not the firmware got a chance to patch them into the device
tree. Keep the compatible SoC specific, as the location of the CPU ID
within the OTP memory differs between SoCs.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/nvmem-layout.yaml       |  1 +
 .../nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml   | 73 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 3 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
index 382507060651..ab94dbb41aac 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
@@ -21,6 +21,7 @@ oneOf:
   - $ref: fixed-layout.yaml
   - $ref: kontron,sl28-vpd.yaml
   - $ref: onie,tlv-layout.yaml
+  - $ref: rockchip,rk3576-otp-cpuid.yaml
   - $ref: u-boot,env.yaml
 
 properties:
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml b/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
new file mode 100644
index 000000000000..85153d480950
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM layout of the CPU ID in Rockchip OTP memory
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+description: |
+  Rockchip SoCs are shipped with a unique CPU ID programmed into their
+  internal OTP memory. Rockchip bootloaders derive Ethernet MAC addresses
+  from it, so that boards which have no dedicated storage for a MAC address
+  still get a stable one. The addresses are computed by hashing the lowercase
+  hexadecimal representation of the CPU ID with SHA-256 and taking the first
+  six octets of the digest, with the multicast bit cleared and the locally
+  administered bit set.
+
+  The location of the CPU ID within the OTP memory differs between SoCs,
+  hence the SoC specific compatible.
+
+select: false
+
+properties:
+  compatible:
+    const: rockchip,rk3576-otp-cpuid
+
+  mac-address:
+    type: object
+    description:
+      MAC address derived from the CPU ID. The first argument of the phandle
+      selects one of the two addresses that can be derived (can be 0 or 1).
+
+    properties:
+      "#nvmem-cell-cells":
+        const: 1
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3576-cru.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        otp@2a580000 {
+            compatible = "rockchip,rk3576-otp";
+            reg = <0x0 0x2a580000 0x0 0x400>;
+            clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+                     <&cru CLK_OTP_PHY_G>;
+            clock-names = "otp", "apb_pclk", "phy";
+            resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
+            reset-names = "otp", "apb";
+
+            nvmem-layout {
+                compatible = "rockchip,rk3576-otp-cpuid";
+
+                otp_mac_address: mac-address {
+                    #nvmem-cell-cells = <1>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b91655b34f0e..b35b3677bf0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23713,6 +23713,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP OTP CPUID NVMEM LAYOUT DRIVER
+M:	Alexey Charkov <alchark@flipper.net>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.54.0

