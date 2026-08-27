Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E683DBD54
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833307; cv=none; b=e+ku2PNWEOAN/ekSRbxmGsS3hUFv5PBTAf2Wd1yhS5h+IuJ5nH4cCVOgrLoo4YVk59X9e2NTmjxtJKJaYln65J1ens8loOPt1CPk+rLDw9VGNPI14Yi0BIWs2ci7GW0KxQuamQ07nXcQVr5NaFVlcLOCCPOB+CwmIfctiykrNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833307; c=relaxed/simple;
	bh=L8b31nsSu3eyJ5Xih/nWqGKHd3UwblyHBpxcDaKT2oQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4YJI4BufMC0Mk3wZJvhqGJB5bUdu+mQ3Ni6gLNdtFZ0EtjliHplMRqHTwaiUA1cdVlIKEfhjI8iDPYEJqLjstFXgfwkXndl4HctdfL4FzpHPxp4vQGzoEChirALUyLbC+SHaBbm3g58UHlaxhnga5GNLQCbRHh5NvFNH0SR0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJkhbD6T; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJkhbD6T"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so18844785e9.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787833304; x=1788438104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfBamOBMdgFDLlZC37nZvSYpxKYZZF6KSv3Lu11CekI=;
        b=nJkhbD6TcabpWca4gcOhOAejVkxbkQchg2dRRmyRaTbVpXYKXc2mAJQ9ZkcWSaUZno
         NZIP95rFnAdkOIrQJTPtdYte2T7gp1jwREgpEeWJjhP3Nzn3lwX9ZfY1wR7xTBC4+GTa
         ozVpuiseuz1nIOzbQS12N0yWIOAKYyJR4LOLt2d5Hu47emz3dDBeHGG29Aqdc94zKEjM
         XIdCDOzVL78Qm8E3geZxoS2oLTSEpE+xBwgJcgm1fbjLvbbCX6AYriTnwAhhYP5Lw3rZ
         CqV4DQQVFSahtraATgSpDGbwWLIa+9c1DSYVQ0JW353AT7PHvYaNGSiVEk1r9vyro3a/
         PwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833304; x=1788438104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TfBamOBMdgFDLlZC37nZvSYpxKYZZF6KSv3Lu11CekI=;
        b=jRA9oCeq1MYn8SHaaNhgSkHmM/Hh2fCin9FHCin0FjOlrIW2wN0wlgWON6OwFeitN7
         kE6f200/uy/r7Wz/Dp+Woon0JXSoXLPGfrYpV30fywb786bEsGrMWA/svBqv+CHuZhZi
         J+Ah2Re1nBReCHsqQ8tt042zF8OKngoEx6iusAZMoAghpArKThZqLf28QJe60cpuvt2A
         +0QzVYzkW8/m0fKn9w1z6u7rp+f1VTxap2JPQDm2kOoflYPsZA3IqFnVdHK+GDLsakS8
         R0al31wS9pqxDrTD+fcLmwtWupOSo/jHYFu81kCC/jUaTDvTNoTyyq2dvTSXqNl0+Uhm
         Pzdw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7bouyuFj3/Bpxv3Kyoc+oDpmIU5TW9Dch8oBNNNOCSz7iI7fkIpLxVcivrlU8br6FEx+muWcAOKAw@vger.kernel.org
X-Gm-Message-State: AFuF++kMSl1gEi5OT92W77Blw67i+Ew5D3pc9QbWdaFJSnY/Fe0WXVut
	Z/vaaTB8LtBLJDR+WtRZ20l77BkuxGRFNFtXK2TMzSTmTLPbO7C0wfYM
X-Gm-Gg: AR+sD13Rxx/mK7z2RYZ1FjpUw4WFdjam+5YTYzEi06Ganowv1afNLdRmeKmoq8jJpoF
	aNOnd36mSx+MjFRygFOR3IZTpTvILBGRZI6ZtfQHkzVU6zzZPDH9C1mKHSLCWje63801MjANei0
	KoIqZuvLKDS9XfAVJlZndyfoT3P3DZqK35x0jE+E+zDqntWUe6Y6pBfYuJuh7OiEXhk2lO330L6
	jFrZwRCC/OdL8e8KNnmo1vjBCx3gqJgZSxdDjFkGt2ILNEBui4mGfirQZ0XOfEHNMLYSPSiptOC
	+Vts4jNeH239pDCvQmDtCVEjy+awGclUor2EPpSaNbm9gvRSqoZkPq3LvwPh6aHIDdBllEvNPkb
	N+MaSkEymRL6b8sgUaggAToPoSXNHUzXCiY5bPehnoYS//ZqOFL/gh2vW+hCS/fivweuTjmhCDZ
	a+6Tj2+bc0mCQBC0Jm8PEctLS+GYDHjLaPRbJgHJ3Nfx0HB0wGwxXrdL4VKnIM3cs2kI+QbFmcP
	sibhX/xewnkYjyQWTLaeqXNy4NqUnqwFeOZ4qA9IlDJH+b4ZCPmjVY=
X-Received: by 2002:a05:600c:c48f:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-499dc6eaca4mr142110795e9.2.1787833304197;
        Thu, 27 Aug 2026 05:21:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b465226d8sm50099535e9.0.2026.08.27.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:21:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Thu, 27 Aug 2026 14:21:20 +0200
Message-ID: <20260827122127.18874-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827122127.18874-1-ansuelsmth@gmail.com>
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..07bb20152c0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen3-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: xr-dtime
+      - const: rx-aeq
+
+  phys:
+    items:
+      - description: phandle to QPHY phy for Gen2 support
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@1fc7f000 {
+        compatible = "airoha,an7583-pcie-gen3-phy";
+        reg = <0x1fc7f000 0xfff>,
+              <0x1fc7e000 0xfff>,
+              <0x1fc30044 0x4>,
+              <0x1fc35030 0x4>;
+        reg-names = "g3-ana", "g3-pma",
+                    "xr-dtime", "rx-aeq";
+
+        phys = <&pcie1_phy PHY_TYPE_PCIE>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0

