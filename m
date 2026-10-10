Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B14AA009
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637247; cv=none; b=oouGId/fWzN6U1d9CwejdVcHFgEAye0GemGAyHIoLae0dO1kLGKjsV4mrEQWoqt7+nh9XX4UT/MF0L60MKIbURHMU+FzZrolKDz0qaUuUokdbQKN07gJDeG0KKP4X779Uuu1dy3/DSgVZ5guftAzaCAZWyeboEdM35/T26EAZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637247; c=relaxed/simple;
	bh=/kJNZEmu/mnNWyTwoYfvKuuDXYXzcDN9UduL//hSIR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzDJMAwIFG5/hoGmPNJ2zycxQV98AQAZXZgNu2Y2+MTqRcrFvrnjkZViQjRykfdewxkV+55FyLAgoz0wPFHcQZYfGOO9ZkxOz7GeXX/1k1dtkMCgoWBcNqAWfSvlSTlwem5iWJN12tJPeiCaGAzJxlu/mHAlMEVX1gRg7TmKrhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQLzfq71; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQLzfq71"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a168355946so1949435e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637238; x=1792242038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MYQFCxh1yQ7ROqRBAiqvcdcm8W2x8q2IXByiIDFhMY=;
        b=fQLzfq71YawWUn8Lf5nmGCm1hb0uHEmXIxQsz6/N4HM7gm7zJUTLLEun4wJMfLtjDh
         Du35ffIlSVkEz9wVcMvMjHR1+3Zi4PI4tq0IulWcrap+Ok+c7eXbe4tVMxbxLoX6SjL8
         Tn/vk9esOW6iApVk5Gm3cvVbt7DLF7+tr+YC/CENfVeCwLFvAUXctmDrc/+eEvDFCxF+
         sB+R+xPiT7Qrd54/QhDiCyHeWBaugOcB4eLIJHH3/yLN+W6bBqExXKKkqhqV+PUnZMWo
         7jqrGcpWwFUUQLvocmf3VNZHwg35j037SlUI1xN076/goQbd5eZRYIYWEFqe88Ol+3gc
         R9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637238; x=1792242038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MYQFCxh1yQ7ROqRBAiqvcdcm8W2x8q2IXByiIDFhMY=;
        b=dTYy5EUmBcGrkByaPOHPLfNF/4y+tkJjsLKVaP8JhID1xFdyX3SI33FmeK7JVLtCJR
         Tdi6J/759CBU21Xdu11VNO3aZyNPjY8Fs5wle2wKu8/gkHcn7tqYh+BanoJh8O7y51vI
         Z4sm9jIvzyfBPxrKXu8zxH97c8EOJzOlfA0gkb0RkDWzECMlkx08Lma41JNawzzGGjYT
         IcoJOVrySlAORBgOYKQyZ2fBBP3bAOXiszgzNeTru4q+MOYwao7cbr0qIMq2FlSVd/hQ
         T3M48pfHKdqqXaQ4fXgpWpKyJ66YIC3/5b4QNNm4TGTJkrY6j59+vdpm8Sf+VTFmNwgg
         UYfg==
X-Gm-Message-State: AFq9FYL6zCrYH+TMhtAtDica/fYnpedXZb5P2ftNkpEc8t8FslPNNdTa
	3HPt8/luSjHjSstUcUZVNnJZKRDatmO2S6aPGpNu4Sa25acnpSwX6p3/
X-Gm-Gg: AYBFou36JR0nJ1kz/YRwrUnEGM/Y5n6u30cVLNfUmyAZJcLz/BPvNn9lOARiqpDRSaE
	IcsQPx6YI24H58bMeL462WkCARPxbCtO1oLJTYmWi5MHdkomnKIJkh2uYdNpTsEL153Wl100LGj
	CI3H83Lfhn3sHCzaMVScPS+wy+wdO4hI4eNytfmc823DcNOyvzXO5aIH8/Q4K69uZ03xIImk9k8
	QgQF5hJVJV+0ou00w6h1cN92omDQ3SpYvDYC5J5b4nhx9wyhfmbhBwYx4nNGRLr+pRYUZrtdX1y
	D57ZcxI53cT+xdZd3jgBmBfezgnFpJtAMDNeNa2w7R21PYEpG9JuH+iEPvg2oWZp9QDpGqavllo
	Zsm6PziFzcUlhJMEb5NDAeTzlT445bMHxSPOIV2WPxe8bXQVizzJ7Cr3936hCQkmsiBdelQYOlm
	j2/Ec0jMLlD5F6JlcGv3pY+U4kflaUCRyk4bFdGrslfZzpzp+28XW0ueAMlnTl+GgtDrlBaSrVe
	QjNZe0GWzPKpOVm0LgjTU+NYwK1oTXNJRbkyhuJ83Vs8qT0HvUwxabOY+N1qWvEBzR/s2DxSz5w
	C0NBuYsRsvqUH21qJZxK/aUk3RZpoMxvQnO0aLU6Jc6HA3H7AjRlLh0WBx2fvw==
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr89706675e9.27.1791637237809;
        Sat, 10 Oct 2026 06:00:37 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:36 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 08/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
Date: Sat, 10 Oct 2026 13:59:46 +0100
Message-ID: <20261010130024.177503-9-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the register-clock consumer and GPIO banks.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
new file mode 100644
index 0000000000..132c7126fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/zte,zx279128s-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s GPIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has several identical GPIO banks. Each bank has 16
+  lines and is described by its own node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    gpio@94407000 {
+        compatible = "zte,zx279128s-gpio";
+        reg = <0x94407000 0x40>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.55.0

