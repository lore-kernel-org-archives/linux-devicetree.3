Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0C33E35B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310340; cv=none; b=Bmgh+ljq8eA76Y07KndfQvkn1cERYoqt5bbTrxnFaK+Li3jKYqQsKVQMVax84Uu/L2aF0YCuXznrZVt/3x5kRder0gpuSjN76mhGmjOFnbHM5YL5voeF1ctIF3sdbvHXbwpWLGAt3ZHlIJJdXUUkpOfcI0oU3jiQAuSIEKL9FPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310340; c=relaxed/simple;
	bh=N8F6gruLmVUyvVYMqbK3eV5zq1o0WBYJsoQv7SBSlgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rr/2V1WZzM0WF3uFCDeBN7/gMwQwVsEher/f5MH9rTLj2hp5iAFK4yvBzti5v8V9vw4MQg4xdSGxSxUCyav5jYbXKctm6xeumu5TRHYuv0HQPqvawh0Mr6fOVApoR1qOUPx1ALsY9l/DFA+LV/rjuHG0O78upuQhIiakurvbXjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7PSQpRL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7PSQpRL"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so70512a91.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785310328; x=1785915128; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BOIx6kQw8kncN7CWUML3AjNSrwnvdWec0++IgBrYaUY=;
        b=g7PSQpRLKsTYrPfHoW3xUqZdM3akrgm1WDXWGkU/qs/D5k/B4jUZMtrqf4ieCcN0Bt
         ykj0ZuOYiDB32n7+7vNMa8GyB5H/ldM2VtEJurYdPjShjya38tRF119rJkIeeRT2jn8d
         k7D2jMinCJZynWKcklUTNGmT+Aj1qeM0Aw3Zma9tYfk0mFYrY3d9++4FjFSKm0WwdBKa
         wXOQ+Nh/O+tD4mumPY0h6Yo5Dv2OAwZOKk1uxSiUH7bLAquu7UtPWDcPuRwGtyVCAcMG
         L2gZD8oM7BhSNSq5czBZiBVOR/tINl2wU11KhcmIrnLRjwvbM/mw6n/7Sdm7ypP6/ykp
         /51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785310328; x=1785915128;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BOIx6kQw8kncN7CWUML3AjNSrwnvdWec0++IgBrYaUY=;
        b=dzFEWi8kdgy6HvhZ/Px3nnJaEG2J9RsnYtAX1/wQwV1H+Kz/UAZztl8mdaZvBC+W7X
         crztcKyJNR1QJ1MeD1edVj8sHtUUb3IHAB9aavlhe4kLgn5QGdagMW/OiQRaMl/ydKw0
         Irs4xoR8MzI+YGyflM3ePDGWduuJw1PCFtU1PSsYJIvOCbVTz657hMZIjoGitsdNSiqc
         eDrZe3q9cQCrogh3i0P4V+NotgHlQtlvhCcYqkoJICvlRSNL8NpmbdwwBejxBEqiMCJZ
         Q4un6OQA/eubY4/PM77k9kY+xLxFEY679QDcon6anEvUa5ZqMP1piOOK302ncJ88zzpV
         6qTg==
X-Forwarded-Encrypted: i=1; AHgh+RqdKDGX5zP95cpHdSyCQOGezmGFcHJkPMSyBHK2n9H4S3JOUiokxuUkyb1iT+F8rAkuRI+r73yStABd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+0fgn/WZ7F/gtjrlDbid0pLHpF7h8Gr2YJNrWTS6Xt7jTzKk2
	Pd1ntxwmdEF/2n7lGO4Cgjzf3Ha23ylQCRsUQ5KSfgRPTjj3lFINDWJc6UGZbwyL
X-Gm-Gg: AR+sD12Dqu0oPBj5QUG/tIvXBnISuUwm5Avw4nSgcNk0F2LVE7I0kV25WxX5iWRfDuy
	qXA/DeEJLrb+llIUHRFzYD3/eDe2+d8WiUPUkMZWQWVWhJU4Tecupuj2CABOmRx+4ItziQRYwWV
	rGpvk7H8RMShP/hAVfuZngO9wOCTFn70dMmyu4BYnfyLLXJldaG//lkTSCUPgfyond+82iwzV5C
	hFdU7JAoeeyLKafmlTYUBnaFX5qdGc2ieqWYWLOEyhNaLyvhtNV2vUsi3BIegCAaX/FJDx3TzWO
	JoMGeStiluWqjqRM+LMCz330vc/mm8ELER9cit0oFShT3DHEHZXAtZL8yCnWfND7j2rQlYNNqtW
	KIWEA5e3CKHs/E1OUB6C68IQ5dKL6pw15odEuciBz+JwgBt+QFTjQfTP+8QGfz9W01peCw1Uhx+
	e5AiSFnHGwE+d9htnKOanXAFHO2uhanyh19d877msDXR8DQi9Nc55z592gtu7ODr0CXrxa4A==
X-Received: by 2002:a05:6a21:117:b0:3c3:8f7a:c0a2 with SMTP id adf61e73a8af0-3c8d4ec287bmr5668653637.4.1785310327631;
        Wed, 29 Jul 2026 00:32:07 -0700 (PDT)
Received: from [10.136.11.252] ([2409:40c2:500e:cf:36e8:6bdc:17c3:c887])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm6758159eec.11.2026.07.29.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:32:06 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 29 Jul 2026 13:00:37 +0530
Subject: [PATCH v3] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-ti-da830-ohci-v3-1-e30da330780f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12N0Q6CIBhGX8VxHQ1+ULOr3qN1QYD6t5IGxmrOd
 w/0xnl5tu+cbyLBerSBnIuJeBsxoBsSiENBdK+GzlI0iQkwqFgFQEekRp0Eo67XSEEBNI1hsrR
 AkvP2tsXv0rveVg6f+8PqMUfyoscwOv9bDiPPu7Vd83rXjpxyKlownHMFTMKleyl8HrV7kdyOs
 LFB7G1ItuS2lKrVsmZia8/z/AfL3KCs+gAAAA==
X-Change-ID: 20260622-ti-da830-ohci-2a2299d045e2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Axel Haslam <ahaslam@baylibre.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785310319; l=3406;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=N8F6gruLmVUyvVYMqbK3eV5zq1o0WBYJsoQv7SBSlgw=;
 b=KcpnK6gaa4ebpbq1GxjUGrl5aWx0q1JQnwo3+lKh0Mo95XAfg5tjFFuuUs4mWebftPam+czK3
 71dNPuxUi/PBtnAIo+Lnp1wmfPFoehP3yjDOmsxZyEzBB5uSI1kDpWy
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments da830-ohci bindings from legacy text to DT
schema. Name of binding is changed to match primary compatible property.
Add required property clocks and optional property oc-gpios which were
missing from legacy binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Add allOf reference to the common usb-hcd.yaml schema
- Link to v2: https://lore.kernel.org/r/20260723-ti-da830-ohci-v2-1-41e54afc4703@gmail.com

Changes in v2:
- Added clocks as required property which was missing in legacy binding.
- Added oc-gpios property which is checked by driver.
- Link to v1: https://patch.msgid.link/20260717-ti-da830-ohci-v1-1-3f2d111a2042@gmail.com
---
 .../devicetree/bindings/usb/ohci-da8xx.txt         | 23 --------
 .../devicetree/bindings/usb/ti,da830-ohci.yaml     | 61 ++++++++++++++++++++++
 2 files changed, 61 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
deleted file mode 100644
index 24a826d5015e..000000000000
--- a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-DA8XX USB OHCI controller
-
-Required properties:
-
- - compatible: Should be "ti,da830-ohci"
- - reg:        Should contain one register range i.e. start and length
- - interrupts: Description of the interrupt line
- - phys:       Phandle for the PHY device
- - phy-names:  Should be "usb-phy"
-
-Optional properties:
- - vbus-supply: phandle of regulator that controls vbus power / over-current
-
-Example:
-
-ohci: usb@225000 {
-        compatible = "ti,da830-ohci";
-        reg = <0x225000 0x1000>;
-        interrupts = <59>;
-        phys = <&usb_phy 1>;
-        phy-names = "usb-phy";
-        vbus-supply = <&reg_usb_ohci>;
-};
diff --git a/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
new file mode 100644
index 000000000000..148b9d0d83da
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,da830-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DA8XX USB OHCI controller
+
+maintainers:
+  - Axel Haslam <ahaslam@baylibre.com>
+
+allOf:
+  - $ref: usb-hcd.yaml#
+
+properties:
+  compatible:
+    const: ti,da830-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  phy-names:
+    const: usb-phy
+
+  vbus-supply:
+    description:
+      phandle of regulator that controls vbus power / over-current
+
+  oc-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - phys
+  - phy-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@225000 {
+        compatible = "ti,da830-ohci";
+        reg = <0x225000 0x1000>;
+        interrupts = <59>;
+        phys = <&usb_phy 1>;
+        phy-names = "usb-phy";
+        clocks = <&psc1 2>;
+        vbus-supply = <&reg_usb_ohci>;
+    };

---
base-commit: ef0c9f75a19532d7675384708fc8621e10850104
change-id: 20260622-ti-da830-ohci-2a2299d045e2

Best regards,
-- 
Bhargav

