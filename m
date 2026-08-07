Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA136AB4D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088453; cv=none; b=UEbflbTj6qT7i3xuzeAvVv9YobHtFCXNxUO156hOBQPusd8z4NdZYIcoFrF3AFpw6llx2dWXYfHuhRP5xN/c+xfeqkrzq0jHE4mb9hfeWvaxOuduuRxkvmLM9hCDFIf/HPhyLiH0PK4ruKJbxOZ90nfeWXmHpDk4AfPq9qKh+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088453; c=relaxed/simple;
	bh=XRjWR+Miez9ABrBTjcbrpXIpp8Y7F55xFix0sC+e4s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s4ADRGRhYgBa1LOD5b6qiB3Pxi8DIf7/JVp76v08Zhv/u7691HGCiJHbHpdOsPa98um1hAAaGER20aVCgrE9LS9P40xt+yw/sv9z5eec0xPHPxmO4SMrNr5NHBD/UQ6IiyfvGBXqqbprYmaZHlhHzu3/q16nW9CcPZv/KaaT3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=Y03dLBLr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="Y03dLBLr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe377a217so2003703f8f.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088450; x=1786693250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=Y03dLBLrZvklntcaLJuPjYXR9VW+ycGwcGeDMdndTzfuqWm/V7TjSjIeMvkjo+CkoN
         RcjVL/ARmDZBn8SN4aRF5BmtjXJ3vfJggQs5oQS4JdugZP61EeE8UDGWxdJwPmiNb01K
         tQN3lk+a9GusYTSkR8Mqum5m+qvLWnmiqZGLjPywlD9M2Ehtg7rPPcs9ZQZ8idymvUU1
         veX+lDz5eu8joy8BAKogHYnsUVDurA9GrK99UxdqYpvh0GB9XA7Z5n3tVd+cazvVRYP0
         2XJSr4YRV/8Q9U93fgNas2DHxKaftf0JKWnxFfPdhydQvyIH/QGa5R3mMwdAeTmdlzUC
         Eb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088450; x=1786693250;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=NCCwH+FWkjVSWG9ixP2o+70b1ueaDTiBsZwp+xSINkTcz1ms90ypz3PycVnMQxWSDI
         PfzAsmN3z9DxMmASil/q8RPpYIK5zHY3sK8acO7LyBmcrcVHWzezDtCOmQDd2v1cVEG7
         zyOpbt1zMD47/vk+LBp9Y1flvhtdXCOn4bjuyoJ7Z/Q/f6sm+YMGgdi0A5fYnGikzdCK
         KiiY0VGBJpOAcp29B/LqVUX/qQY2vbNiDdViGuAAz1tHi5oFTWcu2B48fU6JutrZHKac
         BpYhwGoHj93JOAcTXJlcXxUohUUjJNi9YExMLjWNytwTO2JzuxOcttvdG69z5dEMyXgr
         47Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2LthRntC4EgLtK06RLNQyxeQj4U9x0GQogBjgEb4AQHsx5CFspquQKF7QZzn+I3K0a4691UrpfvcH@vger.kernel.org
X-Gm-Message-State: AOJu0YwsCrxNN8saSaL2nV0bVOhUso3C1VPyRbUYbWtiLt56sv4B8JCK
	vqjsuXyyQP/OP+eILRNJZ11MaDY/0iri08Dth6ofJJ82olEyfNe88NYKcRQ+pZSgRJ6t
X-Gm-Gg: AR+sD1004toEEfvhmsLsx7aOoQ1P34elRdr9wO1ktFEDX5mo9D2IUIecdz1YKlPRNMR
	FPea7DrFntztnIn+6R6hTdocaUeCyJni7DoOWVosMa606NeFnz0HKPxYAH/bQFl2XzEH1Y1Yv9G
	zYtWQlvz3AOrPNI24KGy4aZXOBUEroKB1CG5JZXqdhg8XLvutgA7C4TgBHEPwu/J0YD811Qk2jx
	okZBCdV5yHIG/BThcOmGWq14TSpsfv1OaT/XmHJFE2Gr8sYy20Zq7pSGDHnz603X0pSfW/uMH5z
	0/tU9RrXO1aQLf2rhupslYFZAjxxhUcJpxqEG3bplknrgZOZxBBfKApz9x71jVR6FfI5UnoyQMQ
	fBJTzusdfudl32tBtcPyb1MwILBiqq6nem+/v1T2Obn+Tc2O3OKiC1DJ8rQpuE9JG3BK93zqacw
	elpN2EF95fmnGP76/0geK7iBBX/zDCeyMQjlIMNjcb3a3L2W6Jgt7Yezq3Hkt71ro=
X-Received: by 2002:a5d:6f0c:0:b0:47e:9f16:c0bf with SMTP id ffacd0b85a97d-47fec63e205mr36677851f8f.30.1786088450464;
        Fri, 07 Aug 2026 00:40:50 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:49 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 1/6] dt-bindings: bao: add IPC shared-memory device
Date: Fri,  7 Aug 2026 08:39:28 +0100
Message-ID: <7fe7fbabed8d932a9d8d82e64c9c4d76100964c6.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the device-tree binding for the Bao hypervisor IPC shared-memory
device, used by a Bao guest to exchange data with a peer guest over a
shared-memory region.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Describe the read and write channels through reg/reg-names instead of the
  custom read-channel/write-channel properties; drop those properties and the
  "id" property; add a vendor "bao,id" for the hypercall channel id; use a
  generic node name (shmem@...) (Krzysztof Kozlowski).
- Clarify the "bao" vendor-prefix description.
- Subject: drop the redundant trailing "binding" (Krzysztof Kozlowski).
- Add José's and David's Co-developed-by/Signed-off-by.

 .../devicetree/bindings/bao/bao,ipcshmem.yaml | 59 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
new file mode 100644
index 000000000000..60947150d576
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bao Hypervisor IPC Shared Memory Device
+
+maintainers:
+  - João Peixoto <jpeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description: |
+  Shared-memory device exposed by the Bao hypervisor to a guest so that it
+  can exchange data with a peer guest. The hypervisor provides two
+  contiguous memory regions, one the guest reads from (written by the peer)
+  and one the guest writes to (read by the peer). A write is signalled to
+  the peer through a hypercall identified by bao,id.
+
+properties:
+  compatible:
+    const: bao,ipcshmem
+
+  reg:
+    items:
+      - description: region read by this guest and written by the peer
+      - description: region written by this guest and read by the peer
+
+  reg-names:
+    items:
+      - const: read
+      - const: write
+
+  bao,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Hypervisor-assigned identifier of this shared-memory channel. The
+      guest passes it to the Bao hypercall that notifies the peer of a
+      write, so it must match the identifier configured for the channel in
+      the hypervisor.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - bao,id
+
+additionalProperties: false
+
+examples:
+  - |
+    shmem@f0000000 {
+        compatible = "bao,ipcshmem";
+        reg = <0xf0000000 0x2000>,
+              <0xf0002000 0x2000>;
+        reg-names = "read", "write";
+        bao,id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..b11b3dd995a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -231,6 +231,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
+  "^bao,.*":
+    description: Bao Project (https://github.com/bao-project)
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
   "^beacon,.*":
-- 
2.43.0

