Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE1367B9A
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070169; cv=none; b=BaYZ2asEWjJMc64E+BNn9yTrCFdzMpVjG551A2cUyGL/zROoMloWpcDOuCdpOKKtyF32FPwk4O1vc3UwXAmNznII0O8ANm82x6abaC3pIhbt111Eb7qcTbAFXqiyTGnXEXerRmRKz/TAUfPYiPydWZWuVsNmFoH3Gx8ELI6I4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070169; c=relaxed/simple;
	bh=xJH0Uap0D4orpwVWsdEK5aDp5BeI8CTJg9iKCi4KJZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EVIzL+yuAj1nIgeOwGEyvVZKYYbXBfdp5lswc5xtcD8L7ppT95NDERfVFcfuUFezmqjPuwycqsdbmIVICqlJoC2lgfBfk1p2GIzKYRKx535Be+IejBNG491MEUJ4RJNkomPhyKIoBgolqqER4k5gNOIn2g4NZUKAcsXSI97OxDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1p3G8+j; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1p3G8+j"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso46479495e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070166; x=1780674966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksGpgyBSOY6krVRLLbP0F0NC4KXp/RG/saaAZ0uBhZk=;
        b=d1p3G8+jo51J0bICH4NtA3q4mSaD81koRcQ66v0Z99pju04+jwIeoxxlx4uL391Jvi
         sP6oTUevF7WiutmFGVYu4KKOxzZxxtzO3IU/T0po1xkJRXa+/dYj/LEXPJxGhISkxSTE
         SEM+bCF1RGrjIRz9+kSdUqbcqt+o53HkhWlvIbnX2He4LeuqLlvSnb7uEHK2DjKKPH2X
         m36E0dMK+9yOxO46LO2pDvFOSFdYDdSOHD5OPO5wUnWnvd8BeL/2yvHPy8mTKV9F3Uih
         48S4ZoJRXJ1fQNnGyhj44njy7VLCd0WGDKZ4SSGrphRxCb5oWRwfgIjyadt+PPbT8q6P
         Jruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070166; x=1780674966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksGpgyBSOY6krVRLLbP0F0NC4KXp/RG/saaAZ0uBhZk=;
        b=Xtw/TuiYBjRqTNK8+iUIc9okeW1B9RPEpmM0mOhid8cf95nJiSfBO7jTdl9SWELhHf
         YtxxS+wwgEZJr//68pOskGxcu67GHpp8ttoYFzUmMAB0r8Gp/MhsmjF/Uk6J3LFlpJdM
         ZePtp94s5ib1i3MtLcLFKh/L5FDRho5LR86SKdovkOkjupm61TqXMgLbeBne5OxfD2nD
         WzN/C51XNruL3ArActxbE4OVluzGL2db7738dYecQqsJqqx4zCBsrMMM7fXloU5pi+9y
         o7PLJ1ZxbhomyEejcqfY/mZfQANL7cJh1NyZEKgRkc/3amu4s4yItJTCQUEuyIAt64oj
         rwzw==
X-Forwarded-Encrypted: i=1; AFNElJ9zRVj4KlpnHW5LozvRNb+2cOe8WPhTepGOHVM/dvtapVG7tZogad1uLe5NEEMmp7lVBdFE5aVa7Bn1@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1AVj6Xn6ZORqLfZ0gqnuzy49Zfwdw7B/AGfiX+WTHX2OsgmO
	qzN3yiBcklCTw6zpURj7hxUJ6kdDCopjKYS+IbuwHU4fdzTXuGD8cEv4
X-Gm-Gg: Acq92OHOiTMgD19XdA7xNP6x/OpsdhAb7aFJjGlMTd9Rvfn9gfchH60YW7clk74YCX9
	91oTaN3VgMn3tLACEPOYB1rOWCQ4d9Y1Myc9/SQiUgT6K4loSR59JCNeskYJxRXOyS/JM7vmKzv
	dNr7NJZgQa0pQjq5WzUlgBR4q0J8CYzmMdVeVxaoaoKw7v7B4lONaRpkSDAv315789RRE92JRBy
	gkxvdoEOXaHiMD6nzpWmpSQbYyVLjr6Mp0iWQ/yDBZndwWiA6VX2hdmKuD7sqMFV+vypPTaU3AZ
	cSeoblJx218qDit9S0ehAGLrDQ4ubCq3geA8nmTw7SLC1bFwKkMjFZkiQmuRq7SBY0stLC4jnDz
	zgPba4tQXg4HE6DHA/HQcyqtCKRStBiXRokD2XRjyQ4dNRvXB6exWoMFvFoUJEniUWjZS1xYDY2
	xUAkCETK4IxR3i5R+MTS5PRpKWyvj5sEMrzOFh0ZL5Y6c8RAt4SEUf8RQi3R8k303cS8F7DIgo5
	VzYolFvB/gt7kRvVVsBSeIMIj/TqjpDXERlpnpC
X-Received: by 2002:a05:600c:1988:b0:490:9d1b:201f with SMTP id 5b1f17b1804b1-490a294d4b0mr2703635e9.32.1780070165977;
        Fri, 29 May 2026 08:56:05 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:56:05 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568 support
Date: Fri, 29 May 2026 17:58:22 +0200
Message-Id: <20260529155824.3099831-3-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529155824.3099831-1-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

Add rockchip,rk3568-rknn-core to the compatible enum, document the
new rockchip,pmu phandle that RK3568 needs for the NPU NOC bus de-idle
sequence, and make sram-supply only required on RK3588 (RK3568 has no
NPU SRAM rail).

The driver supports both RK3568 and RK3588 RKNN cores; the binding now
documents both. The rockchip,pmu phandle is consumed by the driver to
issue PMU register writes (BUS_IDLE_SFTCON0, NOC_AUTO_CON0,
PWR_GATE_SFTCON, BUS_IDLE_ST) on RK3568 only.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a490..6582a0c5c 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3568-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -50,6 +51,13 @@ properties:
 
   npu-supply: true
 
+  rockchip,pmu:
+    : /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Rockchip PMU syscon node.  Required on RK3568 to
+      perform the NPU NOC bus de-idle sequence via PMU registers before
+      the hardware can be accessed.
+
   power-domains:
     maxItems: 1
 
@@ -75,7 +83,15 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: rockchip,rk3588-rknn-core
+then:
+  required:
+    - sram-supply
 
 additionalProperties: false
 
-- 
2.39.5

