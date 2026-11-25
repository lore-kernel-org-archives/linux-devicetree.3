Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649445;
	b=ZHarPg0gF+PcpCX9ILcpnmAzNeUDfAuNEZlzY3WzzT+3DmiSkkRXQGUoewN5sDS0kOc3
	 pLMbLahZXXP0J/DZ4NQ8RdHScYqRACes79/0+mLdAhOESl8njV3Rk/mx7iyL9VxboMPbp
	 W2gwgllJjhaSqlABSHegSd3nHI3Xzf/7L28Nm5s8nxoVUoV49YAVjGK0lbrlqnNkXoWXc
	 kgjW8nI2ymkKXtAhVN2CNvBG2WzGhNpkMnFRix9SyMPhN/c1uUJYYOEC29KUvNwKtCwXv
	 1Sx1ETJifZfiwAIs0qfQX2Z677td4hxPhQMjPvooc4nBSQgSzbJakVcCjPm36ybhPAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
	b=f5+2QJw5YaUTfcRi0m5xbgzfUu1jB+J9cuOZoXMO/QGa/oP68A96fXN9VWnHb0grvG6+
	 T0qdSthp1pyoa215WWdo8eBY9xEi/i1Ga52QgH6SZbomsNtZASpLuX5Vhq2Qd9XRpumQ6
	 KmVk64YFTVc/GIRiGlDX3go8jKKpGw9oaK1zAZ0oB00KPvf6RxWa3xW1SNdumYBvYoyxP
	 BC3Wc04jO52a8n1FsOwJAhBRMJN9oKEY+Mu+ckvMpTyyVgzOYbwIMRofENCAB4pFOMyQw
	 STXgXA7219pwdpqlUVzxpyz+/8bWviuAgKX03cjNFpKiKEHKgCD3cKDZfgTi0NvOmKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaZcNind;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9E606A33F
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD9E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaZcNind
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso63507395e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649444; x=1796254244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
        b=OaZcNindlVZTkWt/lkrLMkFezPyo79sZ86e9MOwDp6Lb4Q1oC4O0U2a2rFVe0Og9fy
         e7OMdDnP4g4AFj++mUj45KqLf8Oc1B12Cze0S+n3MMN8145ph0l5FlanhXViZL1BEoA3
         AEg8O9nuWTsfRpZEq+ZM8XWR0lUy+HJtvom76dtthN6atsRL/kSd615Ir2pc+PyM7Wgm
         zSqUj0JgOy9koffqWnFTI2tFM/YhjiDfMTHd+743oin1/mDjS2JnS59YUcnbDhv39qZN
         +dz+Zgx2a59YxDK/fYFzgsrxhH22KSlmIy3/ensLdZ574EsTma9NL/qLJ1ArRW3YLRiP
         ipFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649444; x=1796254244;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
        b=ilzk9hLN4u3LsRG+fyfJpALErWDAQOEBf+YK33L3a3nHVjKXEBb69D3OyMiD7RDHxB
         FQpX+rm3HOBU5kHqjhiAYzh3gLauJfzGKfdOpQdbJs5hBFL0hMzVFeLqtm5AePa5brpJ
         VYKhcKenPTPubAxVXYAdBaCyBhai6jc73yI3b0KTEHhyfh6Cq3ccew0LjU6HvbLBfzeO
         cOGSTBSiFAFECBWmipTP42k0P74hu7nastmpb8FoEXrN2AzOCU6wXLOWnCqWJr25LPV5
         1onntq5JL7J5viJaDbwKiOGNRWKkeM+0ssv6hu0IMW9h8fJW5Db1g5KAeJMrDvtUl3ff
         cHgg==
X-Gm-Message-State: APuU4Z9hRznmkc+b7A6W8nxj7n9MFI58n5vt7QdUBQilFU0HvONeZdOA
	9ENHGRv1gFBmVmPAkFBmta1E922y3arVBJMD0T0F+yBniCXoCvmwgeSRSGkze3xrvW4=
X-Gm-Gg: AZFdTZfWyKxGLRp51OPtONVRZSRCC9Di069YprvABHXR7D5xOANmZTsQEMCLKYuzhFk
	mg5oW1H1++f7KW5DCXBXSgRk9u6phe1jlr6amx8bsiU1+5hpdq+sRNpIxB4TtUaqYRPlYCWDpgd
	o3SPdAAGg1SZrJipGXFrWc7ZVhKM8RHiRGOuJXa1EDaCFJUhV+hAvuvWEjeW7G2dhnFOBzgrhJM
	czsTtM6LiPuEId5mdnOZ1bCSpuCe64zV9PpCX9vm9jiSmLFNyIbXYe4mZwRR1PnOT6TeB1NYrjM
	fCwMfDBMXeiiZ36Lxs/Zmq8jS2QXfXNB3vNbDenjUoq2Gz0O8wwDTmyVqyFwdoKwfjq+RT9OrEi
	fryTUE3xK8HUuwuSYTibTt0LAR9vhO8nUEDl3oUq8KB+m1ByPtmPHedpEiRlgMPBgJ8Dyctff76
	fFsOKhuDYqd/zWCWJQE/pRyxVzGzaq3HxV9enk/Kp/1rEvFFOmXEvG5V+UUhidbqRbH871lsUHq
	lWvxb/oqs+r6bH8aKNW3lYjTmUr7EmXucWiPwSe4Nuwb+UM0sV1feWp3oal7oGVWFMgGS7Czb2Y
	1Q4oZK0jPNSQ5Dl7q6Kth9oy5q8qe93HEn9GhD+c4FAwJlMrmcvWZ190hT/FHLQ78Ju1dMfU++v
	rVi1Nuo0dXxMy9JYVnOz1S59o2VXRjpQ=
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr407121945e9.34.1795649443783;
        Wed, 25 Nov 2026 15:30:43 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm36428994f8f.49.2026.11.25.15.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:43 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 03/19] dt-bindings: interrupt-controller: Add Espressif ESP32-P4 CLIC
Date: Wed, 25 Nov 2026 23:30:04 +0000
Message-ID: <20261125233020.1380594-4-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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

Describe the memory-mapped core-local interrupt controller on the ESP32-P4.
Define its two-cell interrupt specifier as the CLIC interrupt number and
trigger type.

AI assisted with drafting the schema.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../esp,esp32p4-clic.yaml                     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml
new file mode 100644
index 000000000000..2ef36e4e4019
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-clic.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/esp,esp32p4-clic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Espressif ESP32-P4 Core-Local Interrupt Controller
+
+maintainers:
+  - Vítor Hugo Silva <vitorhg20080@gmail.com>
+
+description:
+  Each high-performance RISC-V core has a CLIC that receives the local
+  software and timer interrupts and interrupts from the interrupt matrix.
+
+properties:
+  compatible:
+    enum:
+      - esp,esp32p4-clic
+      - esp,esp32p4-v3-clic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the CLIC interrupt number. Interrupts 3 and 7 are
+      the local machine-mode software and timer interrupts, respectively.
+      Interrupts 16 through 47 are inputs from the interrupt matrix.
+
+      The second cell is the trigger type defined in
+      dt-bindings/interrupt-controller/irq.h. Use IRQ_TYPE_LEVEL_HIGH for
+      the local CLINT interrupts and for signals from the interrupt matrix.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@20800000 {
+        compatible = "esp,esp32p4-clic";
+        reg = <0x20800000 0x10000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.56.1

