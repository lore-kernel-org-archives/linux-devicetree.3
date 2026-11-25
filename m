Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580150;
	b=0mB/kSWHFAIq4wx/KuPaYFVLM9l3iyv9M2H0YrvevGfLoXiL2BSBwQM1FViFBEV5ZB46
	 lfr8/lcuBTPQ0dHqg9VUXqBs4FLfkf1mXavzTAMHqJ8LvySxDMT/opBEONYIFpJLhTfTc
	 nm/kNWlyE6jkQ4DKyeE92mOOtApeGfe5SZEcBW9LdXWj2HsNW7G4ZYwsRVe2d0IREUMbL
	 a4epve/hU43fAtkdehN8U04h5hHuEcWhcStKMNTwC+g13oeiNKGZrrV6YEQmj3bRzvlH+
	 U3iRJmThXwR6w+mqpabdCQx5anzIF/q9LcCx6aaOWAOP6WBtOwzlHB+bDK5dH7469og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
	b=vzNvwXiVg8kxvpYRgbZgZtazK/7q7RoC/kdpYr8qXcuaeE9v51RrNwKYg5JFQAxWZlGK
	 pAjTTVY6TjyK7EcRtEg/KZR5lIHYPH1VzRyljDlbyYr16QPBFADCm73R01GkJ/CqVbELE
	 Iz7bRmqv2gMUgJAs6SIhAlwMzD2uy7KaU0vchMZ6sgUFRqmfD5MQ3D1Au9CChguDbljhR
	 VT4JTlyIcQoaAbscSkaQMSvub2o/1xINVvLkpUvCLlgo/IPWJGKG3gy0LipGyI31DIemT
	 gLCK/0HIBRGz+Bpd24OOEHCc8A1VDkFEMrRj/0KJ4swNCxCSNp0EtJmRKXgS6Ao+aLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxkz6Iq8;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CE606A337
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40CE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxkz6Iq8
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a070781f63so2478079b3a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580149; x=1796184949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=Cxkz6Iq8TOzSh/DEeWv/n+zLEBKaBJLzuILtoqeZxIPxfx1q0BDaVF9Opc43yNGB0P
         IF8fQKuHP6ujy17EFfwQr1r8s2FYmGmu44EYSYHRGxAKlLAfMpeG1YjDXKRfv/QbEjGk
         LvoObMpRzIpVpfHFBEPTw1klZwCLV88mnevVkKlbhLHjVw/rhF3haZla30WbPKUBOZQf
         KYlWJAbv07yQ9p3lqN3M9Lr5V3DpCC3NF4jyu6w3ZCbiwf/eNh6ptVZFpB90o9Vvtk3L
         S4/BDeJa1cdUVV7ZJnYKUoFxnD4n/mXcPiDjmMaQLc4rd4UABwqODlryoOZBNYB+tU+y
         IP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580149; x=1796184949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=1dG6KfW6Xwr37d7G3zj/kJr6K41Cc5gccA1bxgwEFNdHzlF4v5lGcwjxErlrRGT9v5
         dD1VNEGrgBQo/+zT5L+GvwBA56i1+8brXesw0oiWjzubxLilqqX9GpCgOLd+6EBcpmj/
         Tim+8jOic9XwrRPlZux06zzhXSFsISwj6tCaFihcmw5jQrGi7yaPTgbcQMjoiBLxUQH2
         907jF8FfdbQ/iSIzQXO4zI+OfZmkhXfsHuZHaFN7GF9nfAJkYS5tTNMA3O/oaR1RA2kl
         WLG9oKBDwiPlt6XWq+QhnKGlRCWLblWxxCfDml4jtuVNa3mwiRXhk8ZVNebJDn+JevDZ
         QU1A==
X-Forwarded-Encrypted: i=1; AL+hErGVNbbEApwE9CGP0OcSBGC9dyRhPGkICTgUidajrwoRMF/U3m4qV327K0oFdvYcjtlDROmPrDdQtFUe@vger.kernel.org
X-Gm-Message-State: APuU4Z9d12t3z7HP1Ql7Vd13V2Mx4bvqP0ryF+Psce0ecg9gL6jj1+Y9
	QnMZ+LVkk9nWpWeXk3IArqPvkthXCUmuc9/h/b2pPNYjHYKWQux9GV76
X-Gm-Gg: AZFdTZdVIJMBA3xYAv9HuOFC08wJkEFVsgmM10sdqeHARe32Qltftzxy7qYIZV++EOF
	1oo8ppCs6MDy34NOn8/Se+cGZIAo3ca0YqYtYTy+NL4RF+4hDCms3/m7AS24uRgumH6bq0/pOXm
	hGtalI7eucuiVWLPHDgnOjw0AGIgOXz2GVtCOsX5Z4hrzuUP2HTnTmuVYSG5u9GEnllhoMi+2Bc
	OTCar8qJlE4CNekUbcqfPxWKu1qPp7BtJA9QY2Cjr9bibJxOxk029vjQ8Nc4ctlaBPZeqOKxOES
	a/xKUth2s3WE5o29LBEZi7vP/6ts23ZUcUGxVX4oRqIT2Z1RD4GRuZuGCqdo8PD8xxKHKR01JAQ
	YK3XLTQJ3KJKb3VBjs1CaC9RG4KpjoAirowgFNs5QFVs6aJDH73APe7wAOinWrXfKCA2VlYNHaz
	DMGU4+LoLRgZxIafSXUa+Vm8U+Gn+Ir0l3n5rizGM8FoxjFJCeC3o1nmRQIXBMXVyKhG5wiBgqL
	NAAeNdjfX2jeXvqA5gSShewXjrWgTOe1CLQ4fV+d4BofxVFtHUX7ljupPhwRKBm9rgnJtwEpT3O
	trHcpd57wIaA3Yn2B7TaHw4WB8E=
X-Received: by 2002:a05:6a00:1f14:b0:89e:9c7e:fd49 with SMTP id d2e1a72fcca58-8c87b9cf695mr14659779b3a.20.1795580149082;
        Tue, 24 Nov 2026 20:15:49 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm8204660b3a.46.2026.11.24.20.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:48 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Wed, 25 Nov 2026 12:15:19 +0800
Message-ID: <20261125041523.242588-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
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

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..af32e427c0c5 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 PCI Express Host Controller
+title: SpacemiT K1/K3 PCI Express Host Controller
 
 maintainers:
   - Alex Elder <elder@riscstar.com>
@@ -12,28 +12,32 @@ maintainers:
 description: >
   The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
-  controller, and supports 256 MSIs.
-
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  controller, and supports 256 MSIs. The K3 controller uses an
+  external MSI interrupt controller and may use multiple PHYs.
 
 properties:
   compatible:
-    const: spacemit,k1-pcie
+    enum:
+      - spacemit,k1-pcie
+      - spacemit,k3-pcie
 
   reg:
+    minItems: 4
     items:
       - description: DesignWare PCIe registers
       - description: ATU address space
       - description: PCIe configuration space
       - description: Link control registers
+      - description: Data Bus Interface (DBI) shadow registers.
 
   reg-names:
+    minItems: 4
     items:
       - const: dbi
       - const: atu
       - const: config
       - const: link
+      - const: dbi2
 
   clocks:
     items:
@@ -66,6 +70,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +90,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +103,43 @@ patternProperties:
 
     unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 4
+
+        reg-names:
+          maxItems: 4
+
+      patternProperties:
+        '^pcie@':
+          properties:
+            phys:
+              maxItems: 1
+
+      required:
+        - interrupts
+        - interrupt-names
+    else:
+      properties:
+        reg:
+          minItems: 5
+
+        reg-names:
+          minItems: 5
+
 required:
   - clocks
   - clock-names
   - resets
   - reset-names
-  - interrupts
-  - interrupt-names
   - spacemit,apmu
 
 unevaluatedProperties: false
-- 
2.56.1

