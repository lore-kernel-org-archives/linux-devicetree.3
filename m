Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881723B71DC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439603; cv=none; b=cTgqjI2RPyo2Bq2SYxGBwNaooEFL/uahTMu+TZP0dRNS8JlTChJlS4i7VyR8RV+m0pwCiZj+I8dxz73hz7nam6CFIEHjC05pq+aceP3w9/x5Ox3XpjBzU1Fl4olC+9BGX2ZrcqTllhlHajtYvY32ygn5eHFLTndZ6gIMOOMUUxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439603; c=relaxed/simple;
	bh=UesWAnvidu5V+vT7hnQQOomMWRZS3pnTvN95fJQ+MW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9xUQPEalCw0MHX+OgyAoAziLv4zcFRzZF4lup/feZzdA2qX+CKa9XnYUXw9eMmpxMMQ1oEVPEMLDU28TIMAx/V3hv9CkpmPpM5pTsi1rf7T4aFyP6sfLAIZZPLiGyisZgOZIY8wtvdOeJqvbwsTglknsNAZ14Pa8U2/anRHWe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LO1uIhOh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LO1uIhOh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4b5bdd578so1214372a12.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439601; x=1792044401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=LO1uIhOh4wVLy5iD65EsQ1S6CJcudj5SKFmzyFEbfPsNhAMMk8EbZ5WWFgMkrq3fz+
         vg9snVpD4WRASbEEHFJqm/3EYzf8AWKf0wBNAHXFNKWLtFUbkF5vliWYx/6oWr1qPBhw
         gDEbX0Xdea5tqN8trxmmwHY4zkPidpBpHj5itFxrgigfFTHpiKxOzietGNaxh1gmkriu
         3g8WajHr5lcf32n9GvCJqXvQWab4TPWlopS/xSwjaMRYh/NDfh0jP0J/z4Trylc7u3Fk
         RxABPLYucUnPISM5NUhLQibToJ/dceMHmb4+xikOzjG6hhubTTGJ/fGll+3PbGwcjvJh
         wKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439601; x=1792044401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=h0iCPkPIZXL4RCU03+hYZ4qr+RHO28NXBr/Xx4gXGpnpOCGsKQAytLL3a/tQxI7GTz
         hOz6IFeDg6KqZWxY6zoxiD8aEySKqZlZ2YMTzIiFSAdF2uKHZPo4OmTLVWD47UMhXBGv
         UrzNAOr8Oqxg52YZ2apPxT4dXu/7aGBiX6yrJnBFAmNvDTXW1fX0yRKK3HQ75Sh7e6ZH
         aHzr9Cnd38/JIZVxzD3RwhlkMB4NCgC1P5SAYF5qQcykfme0DeKgiwo5R8SRznhs6MyM
         u0cFNgTciltSR8k8/gTqEED/Ht7Q9BB0E2SJa834S9RkKjgC5EVy7/zvirUTq3LthOww
         eYrg==
X-Forwarded-Encrypted: i=1; AKwUvByMN7hWG9mhRosaF/fMI1QV1kia+mHPWbaZSv+xPwkcbfQUqeyy6aSkhhjBl1hYeSfbexnV4m0wNcMG@vger.kernel.org
X-Gm-Message-State: AFq9FYKXxS+XC+YN/lvh6s5GwhKpRlUGW6SCd7PQ8hdD3eDGzaW8UdEL
	BwgyO6I5I0Cz2xAd1tfCpS5YUaspPcFYKxliFLS6RMBl45QdbFkRmh5cOBLNuA==
X-Gm-Gg: AYBFou12wOksbU9lbHQ3VWA1RgtxFbJWLYsdY50eCytw/gWKSV+CAxjRsdCV5QX8gk5
	H8NhMi3JwHjA1SAOLUiNwz70eS/UNip1gSQjvM4BIVNyR7Xo5Q6B71sZ5cBUR/9EMiT6UR6HMjZ
	+n2ijjxGI+HBA7vEPwInrR/sHV7vn5XGhrw5NMWDDenLRh+Vizg7zZuva+9YDJRLHr/qlsJcqDo
	Q8yJdWXNeW/5a53V6GR69mKMsRnT7Rhq8WYbV27eo/K6kGI3+LMJslPMO572PfZvGxMAxIEaZ7u
	FX1FqXpFWyvucb/pZoW3bIcm5lXeb7/wnMuME9/+OTdMzRBCRrHBOCrqhYGTavrSmkonBlcgcfb
	qDUga27SRAgpdinBwk/ZkT559sDKdviWXXnh+iPwjMl7Wc7FgdLPzHN9triiRzzKKK0D5KSZKPE
	T+CECiiYagChgeLtfXH11muhVHtnD4kBYPCY2Xxsy4SnO+hSh4a/7Su0s9hSWY6ziFMRFAjzZx8
	0y+c+o9p45PkLgP9MiUtE8z8iYdZh8lxxVX8r5fRsRqVRdzTUBvL/eK6PxkbXFZ
X-Received: by 2002:a17:90b:2241:b0:3aa:fdad:7d73 with SMTP id 98e67ed59e1d1-3aafdad8873mr755187a91.55.1791439600648;
        Wed, 07 Oct 2026 23:06:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:40 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Thu,  8 Oct 2026 14:06:26 +0800
Message-ID: <20261008060629.2736806-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 exposes two USB PHY ports (PHY0 and PHY1) managed by the
same hardware block (USBPMISCR register in the system-management syscon).
PHY0 is shared between the DWC2 gadget controller and EHCI0/OHCI0
through an automatic hardware mux that follows the USB ID pin; PHY1 is
dedicated to EHCI1/OHCI1.  Because both ports share the same register
topology a single binding and driver should cover both.

Changing '#phy-cells' from const: 0 to enum: [0, 1] lets consumers name
the port they need while preserving backward compatibility: boards already
using '#phy-cells = <0>' continue to validate and function unchanged.

The two new optional properties:
  - nuvoton,rcalcode: the resistor calibration trim code is determined at
    board design time to match the PCB trace impedance.  Both PHY0 and
    PHY1 values must be supplied together when the property is present.
  - nuvoton,oc-active-high: the over-current detect polarity depends on
    the choice of VBUS power switch.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..1bd22dd0e5fc 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,6 +8,18 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a standalone
+  platform device that accesses the USB PHY control registers inside the
+  system-management syscon block via the nuvoton,sys phandle.
+
+  PHY0 is the OTG port whose signals are routed to either the DWC2 gadget
+  controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
@@ -15,7 +27,12 @@ properties:
       - nuvoton,ma35d1-usb2-phy
 
   "#phy-cells":
-    const: 0
+    enum: [0, 1]
+    description:
+      When 0, the node exposes PHY0 only and consumers reference it
+      with no cell argument. When 1, the single cell selects the port,
+      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
+      and 1 for the host-only port (USB1).
 
   clocks:
     maxItems: 1
@@ -23,7 +40,29 @@ properties:
   nuvoton,sys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      phandle to syscon for checking the PHY clock status.
+      Phandle to the system-management syscon node providing access to the
+      USB PHY control registers.
+
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries must
+      be supplied when this property is present; when absent the hardware
+      reset default is used for each port.
+
+  nuvoton,oc-active-high:
+    type: boolean
+    description:
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
@@ -42,4 +81,5 @@ examples:
         clocks = <&clk USBD_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
+        nuvoton,rcalcode = <7 7>;
     };
-- 
2.43.0

