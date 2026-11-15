Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765718;
	b=1wV6C65B782enNFCPjqhKp3IjArlpsxl9Kjblm2SYa1995DhkWb281HGFIMDLR+BFhgH
	 go18S5X7OL1L85xhersmsH+/S8+xRGNE7pFZYv7jxyKwHvGN11amVwqHWfomU+tUiWSYj
	 BYjjqCfarHpplxH+6GcW3onR241LDn4rXH64n5qpoWtw8zIaU9N9E1g62pRLgfKBduppi
	 wN7H9YgGD/lj9tVx2/+9yDWvA4g7qPMuOAKa05WdT8rbOhVx+FbHB0q3aZXnMWt/QJyXf
	 GhBjmHnHel1FiS53WNOrEgEhbxqDVsZhryPTl7pDvaDr6vWtwNluItbAlSlvqpll+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
	b=tJT7EOyX8xz5OLbtI+lat6hM4CpQzEjSpLeviJFk1afyOy3XbwC8mjfk0A3qw/NqYJQl
	 qOP0/pjk7/57S6GZlyKFL3pJEMGSNbCKP3RZAeKeRwxe7rz2vpzNwGFAordrZT3t8gMt4
	 isDma7AVzYO4+2xU10avzqqfP1qcB5DoHkCq5joyZXirQWQspHiiIJ2NnP5XnXGbpeGiM
	 MHS/ejitpWfRgqTRQMWw28fsm++IlJxzWjsDBUIiEvkpKGh/VukcJo4CXEH5ZQvPUIMyq
	 BTVW3CE9iQ7GFH4veGl7c1rrUQtYP823JZs7q2OClK+DbssPQRmYFeOIQ8+BgnPBY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFWAQD6x;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566A606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4566A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFWAQD6x
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eddadcce7cso14929865ad.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765717; x=1795370517; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
        b=mFWAQD6xtMHKem2eI0x6NCr6QrofMMV1tkLrw+reNWVodsjsQv5b8BziZmT5z8/o9m
         LCxoowpM/leeyzHmRKtLUOEhe5yT5jhc11klCMAoOHnZMClNtgQr9mbOb0fq+MfZQAuF
         0AxUpWzO2tRP817qG1oo2yUBFDpDqG0NlHyKqY77vwJHJGcP1khfseGaG+jhJcnWtaBT
         RmuY//YNlsyl/emDSg89+H6pWlICTHugdrS9KhaSENx9zasBZhdNlJXHWbQz4XwXi9Zf
         JkS/MsUnjMfZNzX3g7wv1QpKeKt8+sUqTHzogp/PC3fjLigmrRqHAOp4zFIbp43k09JL
         dlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765717; x=1795370517;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
        b=iGliVng0hatS0uSG7e0sFHF9+XLaoRdrS1VZ2uqc8vnSmlZ+BoBrEj9HrjcZszZbV7
         fsWaacR9lX8AvGa/hR73q6Cmtt5MDCHFIGFoFuV+TiH8jLywDZdX5+lInVfFW3AI+hYI
         aEJIBrRd4uE2ORLOooC5QSg+xuqyP9DjE9Un7flOhd4KyMcuwOt3KEEFBwNXr+38JFNy
         9bf+PiADh18IAOLYVswwqHF+FCqARczyhnCy1i/yiSkxOwwh4Ow1M9z3zGFqDcqfMkhn
         F2dQrQcd7zJzwxsb9NVF6Cz5s9zRaxQ9amzIw0BuvdDVRVffFr5+iEKVlOLicNcrnZw7
         seaw==
X-Forwarded-Encrypted: i=1; AL+hErF8fu50rdOcC5QlfClDpFZPmn9Pes1MwQv0tFvBBpvY3/xSOwEnwVvULnIw+MLtxblgJFsGVPurSFVw@vger.kernel.org
X-Gm-Message-State: APuU4Z9PGdZ0mUMD0mnjNzM+l+yPUVABQQx5VQIAEWswm1f4ms7VXUHW
	W79zacG/Zu+SGORLsfKuhvVsLdpPsKDxWqu1flbQVVHPBYRajgsABZfsaDQIGQEsqFZ1L1yP/m4
	YgNT1lqyqDyRoqrN6oyfX8lotRX8ybb4rCQ==
X-Received: from plbmz13.prod.google.com ([2002:a17:903:350d:b0:2ee:2d4e:e83b])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3886:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ee0dfb0832mr69763855ad.40.1794765716407;
 Sun, 15 Nov 2026 10:01:56 -0800 (PST)
Date: Sun, 15 Nov 2026 23:31:46 +0530
In-Reply-To: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115180147.1208082-2-vamshigajjela@google.com>
Subject: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Document the device tree bindings for the SmartDV Technologies MIPI SPMI
master controller integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga").

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml

diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
new file mode 100644
index 000000000000..60d1e1769cf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/google,lga-spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor G5 (Laguna) SmartDV SPMI Controller
+
+maintainers:
+  - Vamshi Gajjela <vamshigajjela@google.com>
+
+description:
+  SmartDV Technologies MIPI System Power Management Interface (SPMI) master
+  controller integrated in Google Tensor SoCs starting with the G5 generation
+  (laguna / lga), supporting MIPI SPMI Specification versions 1.0 and 2.0.
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    const: google,lga-spmi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@14853000 {
+        compatible = "google,lga-spmi";
+        reg = <0x14853000 0x100>;
+        clocks = <&spmi_clk>;
+        resets = <&spmi_rst>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eaeb60c1e1c2..cd5ae89b4f03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25243,6 +25243,12 @@ T:	git https://github.com/cschaufler/smack-next.git
 F:	Documentation/admin-guide/LSM/Smack.rst
 F:	security/smack/
 
+SMARTDV SPMI CONTROLLER DRIVER
+M:	Vamshi Gajjela <vamshigajjela@google.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
+
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
 M:	Steve French <sfrench@samba.org>
-- 
2.56.0.611.g1030f0b940-goog

