Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F2F2BFC7B
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764949; cv=none; b=Vr+SgDzVpVWIwMBMtjRedlNX8iy8kTRXn1t3a4hKeLdtR+s5SqKJ4Bwej8LGmHi1u5obBd0hFszOpd+ZvdBIGl8Cg0TlJaODxC2QHTWkwVxnF2LfVTSPXSeBEnGGKVdSHieOHPbwRUNuH5OYCv4kxLmoCYK63i71texRxXUG8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764949; c=relaxed/simple;
	bh=2otHkcmCT9w8sLLXpwrGseCnidGp/GU8lh5rUN96wp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhmZCcevWdPT6Fco5f84NLcRDMHTNS9k9aFHBVbyyJVxFfGZlfqfomTXad74lJXT5pFslhxF2VslcUDNJ5eoV6d+qW42ea47QBjiYlsd5Xrt8MpiOW4il5GLh99jlhIQPWlsg96bdQoQKDqFLH9ESMb0vPAKQQII+maT7/HXgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt0EuAwl; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt0EuAwl"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so1800624b3a.1
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764947; x=1775369747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyUhv8dZe5OountEy6t4pKCcPVDlgAwS0iiOUhBetOM=;
        b=gt0EuAwl2QTwnnFrDZdN0XF+Fg/Gj3mNudO7d8wW7LU++uFc6JPWThIFiYlTPMuQjN
         XhIUW1Zg3zGx2S1R0IFPY6tEF7o6cTxYmFr8lfY8fzuMd1UgNNLvyh7YotWVmN7cdviE
         B04J0tEMoGAeQnVghLlJqa+E6CmFTeKlLjbqdgpvOBd6WcZFsEpE6mLfMBbozFJ+GG+o
         29EYcprqW1bQkV7hn516WfHSxACZ/bI28wuGwnKg0kLYuTK6IGZFf+R1cVVQ9erpfsny
         8W/dcZ28AVurzO92Ror/AfMkWIshe3pwisKPBwUmE0RA2jwv0DKHi1pmvVjDOOF1eB+V
         kDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764947; x=1775369747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyUhv8dZe5OountEy6t4pKCcPVDlgAwS0iiOUhBetOM=;
        b=FEIt/sASoxC8cPI44YfmMRmcgbgwhnGH9h2Y6KirzCm2jJEoi+aC8RZhsgl929kFNv
         5npbC+HAOZwngDnmW0eam10WswKGdtDt22f/lx47W5Bpea/Or2xM4RM8JpjN2xdTasY7
         afDe2nWHjjdiBe87qmtybhQ9WynEpviEUAGD7UM9J3wwApb/YsdcIg1zIJo8kOZDWnPM
         sl5fU9pVBlHv7vgasjdZjbZQYC2PuSe5Dk3Ct3kYUqTTey97f/94voPFWS52/bFxh41N
         77qXWSG006W7bXlTAoPPh+XPfVlSj3EG+nYo9oTYGr1Nftb702McjGmzDkO2d/Xexnim
         CIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPvRgPH4pSuJ7YMeojtLUtY+r/O5a06XFB9cm+JPmqH+HlGN0G5A7clf6DpJaoN7zr6rXw6oBK/KuT@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLnKKHOpXtrxTE8CmIISh+DvTAWDlyD70IlwuqV9pb85RsOfD
	zsFgC92hExIXJY2rMmTwOJemR+HElIRJGgeotSi8SNDljgQKZDUeg0FdX4edYswQC44=
X-Gm-Gg: ATEYQzz1DRRF/osq8X6NV3akvZj9v9LRMWsLsXKmHTG/gWw3AMZYYpAEXhZy3iCQ7N9
	2FbON5rQfm9T3/aeknbIo95HCTcPt/iHSh2ksNnxnGQlWmlCEOGK9401ZHVID/kgQaEQZdkd461
	sWEdHmwxqqjArwox+Qam9qSdVNS2AIXuZv2VbjQcIvQcxrjBBDeA2KdX+FcVRtbWYrLt65sc5WQ
	olUYOznYvUJW4mI3BTefZ44CRrg+uClhIBgZz4d4j1g1xlMennsOb/XFC90SsMa8RpUSilSOY+H
	Rpa9uCU8RJBVesT5mSZ+LxKjFsBhKJg++H5XvcBwsb7r5lshdCvc3iuE4u/5gxPtFLMx3GlVOz/
	fHdoF4O+beymCWyuql4NjMcxfLVlvUGltL3MX49eXUz5k3+OS//pCKS78du99z4vLr7t24aH6Iz
	BpYhdP08LXFVTWeQGoeM6/cuzUJDU4tiCFQNYa2rm8mY4YiVt1nd3tAWFRYsygDbTx4h03J2r68
	Fw=
X-Received: by 2002:a05:6a00:2d27:b0:82a:1337:493c with SMTP id d2e1a72fcca58-82c95e9559amr7945631b3a.14.1774764946822;
        Sat, 28 Mar 2026 23:15:46 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:46 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 11:45:19 +0530
Message-ID: <20260329061523.98346-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329061523.98346-1-krishnagopi487@gmail.com>
References: <20260329061523.98346-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SPEAr Thermal Sensor bindings to DT schema.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v1:
- Changed unevaluatedProperties to additionalProperties

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

diff --git a/Documentation/devicetree/bindings/thermal/spear-thermal.txt b/Documentation/devicetree/bindings/thermal/spear-thermal.txt
deleted file mode 100644
index 93e3b67c102d..000000000000
--- a/Documentation/devicetree/bindings/thermal/spear-thermal.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* SPEAr Thermal
-
-Required properties:
-- compatible : "st,thermal-spear1340"
-- reg : Address range of the thermal registers
-- st,thermal-flags: flags used to enable thermal sensor
-
-Example:
-
-	thermal@fc000000 {
-		compatible = "st,thermal-spear1340";
-		reg = <0xfc000000 0x1000>;
-		st,thermal-flags = <0x7000>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
new file mode 100644
index 000000000000..e3462a974691
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPEAr Thermal Sensor
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+
+properties:
+  compatible:
+    const: st,thermal-spear1340
+
+  reg:
+    maxItems: 1
+
+  st,thermal-flags:
+    description: flags used to enable thermal sensor
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - st,thermal-flags
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal@fc000000 {
+      compatible = "st,thermal-spear1340";
+      reg = <0xfc000000 0x1000>;
+      st,thermal-flags = <0x7000>;
+    };
-- 
2.52.0

