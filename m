Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A44F28640B
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777516141; cv=none; b=Gp54lbCmOb+kejafauaneCypMtk5BUC9tQjMEgQ6dZWkGUe6KeR1gxhwD9oQQtY5NSwu9IcMAXvCgEaHMWiWFgUio8bemuxkAr1xuyKUCHnhS7nwV5EXRE2Zu9kgSoS31N5Qcbb1CRc41D9VLgPEpYZyVPphaGmM1n1h1hHJmZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777516141; c=relaxed/simple;
	bh=m/Xfc0yttr790dvluLCktuZe/Qbje/l2mIZp0WYNOos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BScrzLZQdJz9N+n79crdgMdbZfhcAaNOW9P2tuNmb/FrDTzGcGq/ssA4+YjueRF2qf0u76gCydavlCXmRQbrlUFTDYktd3FWAzd1B7RKbGrYGf/mPH93hFk4nV8q07Kh4gWh2dJBVMFsr2dUr9/eS+8H7TAqWPZhKCFeDaW+r5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDXB3OmS; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDXB3OmS"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c79506f3c40so129547a12.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 19:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777516139; x=1778120939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yamg2LURb/TSAJp5ESv6zShjxXxQYQ9667SLJMB3Nuc=;
        b=gDXB3OmSP2mosEWDrlEEKjQVGNChNiaR294EdbujUUzLBaLWenewCVpjEc+Iv5I9c0
         TYK9qfhPX3dZVxl5SvWgHjFdjOYyQZxK/IFUgow2x+747ZY7QjKEmpBelz3BgMhXdoz6
         GKbqBKqCCJOV4Whiimwq3ydpu08dihlEeUuWKFFvBMxp2uMlTKuu23wWpooXxVVUDxom
         GNC/tMVfVEUBgKFEm9DDsqaPBv1lj+WO+52oQATpSUAVJM1W6WCUJOqCM0t3ve6E5m5O
         41jtDZczZI/2vviKSxEBbXcNHG7Doo/7Jpd4NPI+yZp08qveCjn/gWtDClCsn/lXSE3O
         tUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777516139; x=1778120939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yamg2LURb/TSAJp5ESv6zShjxXxQYQ9667SLJMB3Nuc=;
        b=nuuV24rAZ1a7dUFFLB6vcWYQwVziQHcnhtZnctudPLmXL2lDbNrxKg2I90ILKJE7cZ
         HXiuhjit9VYp2RTFC1+FMiP7vBNYhklcGdb1BOf0BTTTiq19FzlnBXklBxkHRxiisjPV
         HSmHHWCLmvH8ab/s6EycMEA/bAhcI4S3nPqM4CUCx59oxWaanLnSfxScghGhwcNDrmuJ
         CTkvMXbDFG6psObf309jvcQKrKc5vsu/4VkDggFX8iFSMFk2oGe7kYEvbS9IaVIW+I2R
         cbdB1k6iA7XUh3iAFagV5ZgyOk4fSNVnTPU9Ai1k1wWbpKQVcnlw2cw66mZj/t4sr6cM
         JQ/A==
X-Forwarded-Encrypted: i=1; AFNElJ9o+fIra1LxVygiiIgrcWxa6wGh9HtuP3eVnoj52/1OhjHxw6ud8VMNdYLu3RFED/NslwKrN69NTb5a@vger.kernel.org
X-Gm-Message-State: AOJu0YzKaHLbrPXpnk417Op1Srugb59S8a0B0bRgwKsMsXyP84/fv2fW
	/x3bY/8D44p/HRcByhKC9ldXocSbCowqy6P67UYRZcLCtePV2QQ7IyZq
X-Gm-Gg: AeBDiev0hGMaumNFovVvTLtbywKMJ2WrZL60pAFOIGu0/wR5lvKcYOPABm0HsJ0nws8
	LUz7G8L5K+Xou/wVVRqFGDNWQrYh7fJKCmhUQW/K/Axc56ejUSoPfd3fqK/qeNvcZuNtn4f+KCr
	iFWNn+c2kCSfeHlZYZi7UFxDNmVfPeFD6Wwm7s1p0zufFPrD9V0dd6tVfNTdC0ctRF8zejIZocK
	6/wvs4ww4LBtiqCudLx5GNU7DbCGKRAHJzalR99/7duVsjxcRKM9MRT2txtawdpq726vY2sbktu
	qDW6M4zSXN7L2KLNGJKL24KjPOwXf/6UO2FU1Vw2EKTNdBwsxGA0xnhaO8L+8YYHcrFxfAO/vqc
	epiOVhKrKl+W5RrqJ9rjL160EsuGmybWaXPBczDhMhzaxJD1bbTMYNhLTkXkqEYBmrSM72y+b5h
	2qvfuceYIrqTOJdMjzaNPa7fYfUt4ErBnotQ==
X-Received: by 2002:a05:6a20:1aa3:b0:3a1:90fd:dcd6 with SMTP id adf61e73a8af0-3a3cf6b2d12mr738604637.31.1777516138751;
        Wed, 29 Apr 2026 19:28:58 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd64f0a08sm3373649a12.15.2026.04.29.19.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 19:28:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
Date: Thu, 30 Apr 2026 10:28:40 +0800
Message-ID: <20260430022843.1090138-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430022843.1090138-1-inochiama@gmail.com>
References: <20260430022843.1090138-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB3/PCIe comb PHY on the K3 is a complex PHY group that
can provide multiple phy for both PCIe and USB controller.
Its mux configuration is controlled by the APMU syscon device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/phy/spacemit,k3-comb-phy.yaml    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml
new file mode 100644
index 000000000000..7aa2cf9301b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-comb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 PCIE/USB3 Comb PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k3-comb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 2
+    description:
+      The first one is phy id, the second one is phy type.
+
+  spacemit,apb-spare:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to APB SPARE system controller interface, used for
+      PHY calibration.
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of APMU syscon
+          - description: configuration of the PHY lanes
+    description: |
+      Phandle to control PHY mux configuration. The configuration
+      is described as follows:
+      bit 4: 0 - PCIe A x8 mode, 1 - PCIe lane share mode
+      bit 3: 0 - PCIe A x4 mode, 1 - PCIe A x2 and PCIe B x2 mode
+      bit 2: 0 - PCIe C lane 0 is PCIe mode , 1 - USB mode
+      bit 1: 0 - PCIe C lane 1 is PCIe mode , 1 - USB mode
+      bit 0: 0 - PCIe D lane is PCIe mode , 1 - USB mode
+
+      The bit[3:0] is only valid when bit 4 is 1.
+
+required:
+  - compatible
+  - "#phy-cells"
+  - spacemit,apb-spare
+  - spacemit,apmu
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@81d00000 {
+      compatible = "spacemit,k3-comb-phy";
+      reg = <0x81d00000 0x600000>;
+      #phy-cells = <2>;
+      spacemit,apb-spare = <&apb_spare>;
+      spacemit,apmu = <&apmu 0x00>;
+    };
-- 
2.54.0

