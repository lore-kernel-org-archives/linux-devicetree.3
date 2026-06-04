Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B3481236
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581186; cv=none; b=gafhA66+sXyfu3y7G0rU+EE2iBWMr3dgpq6UCxTAcUl60myDDtfuHNNtgjyiemCpLVs7nah69COYSGRKi4wUJWonTA+1cZkao+uiknRVXiGMf1q10r+IG8UYx1nVbk1cdNUOnoG6oOZCR3tNK6yOt/KQuEemiE8wAz0TvT0AOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581186; c=relaxed/simple;
	bh=O8Ms3qpIJaPqvvfdUy5Pzd6rw9MEf+RBk9h7q8KnQiI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=khTflFDQ9HSamprjlS//2DUDQDgUIdNmf63eZDZ0fP/GC2aSTBibk+tiWyGdcsf8BSYw7nHg+DcTauY9tDB5xCzpHJwnBbq4oOcbFUA0b3yDIePcNTSzSZ5TicvFXhquh8Y246Ux9Lmd8Arergfmp5Y0oyEMDXEQ8XkBehk15Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3XmmfO/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3XmmfO/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46019edc13dso379206f8f.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581183; x=1781185983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLUAaZps1w8Jl8h4U5vkB2L5GVDJaAP0Yeaa4HLYIr8=;
        b=n3XmmfO/I6y8n+Dn4vlAnQ/jyKf+3MpwYHXAEhWZpYYiD4zNaN4AZIqmkLFKgzK3kJ
         Cy9EMImaXNtaZeRlsGi69IHJOa4isKVksRneDKpo2tfs3cCIMhPNoQQfEUVTH24iezbF
         7oUklZXo7SGuL3AE4SRDETsOmMPTraMmNexnUiqX/lItDRGNOrKptf10twQoypQc15Xx
         8vd1EpKOavGAC8yUhiXmeszwvHObRPJcjbv3tNbzIhAhL39L05rgJ234JJvlQKQ8CXXW
         vvvDm1xmFYhuWqX+uUkV6C2XqVjZ8TO9vjOZ3q/2tHi+J/zPPwuOcJr5pOHLb/DyqcPj
         RXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581183; x=1781185983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLUAaZps1w8Jl8h4U5vkB2L5GVDJaAP0Yeaa4HLYIr8=;
        b=rK+X9w8c7GCrhXJ72wuafNwxe1lzrXLvzSexJ0M4g26Ux2xKFjuPkhKs7D1pruEf/4
         XtyesM+DiYpYjrVP6U4u1HbYPBhtA1jNALlqb1Fw/xu67D1kXQhHLlpMpzfXeUSSI3ik
         t6ZTB1oPB8YmD7Qc2OMF6nmGHPZkhTEnAVFmcTmTpmI4dqhT+7NGfnFeFdxj/lFjqnKB
         /hT6yQRQNlOgh83TvFNi70geHG8M120YckEvg0R5zrAWUwUwGJVEhVbvdgzcaRS6tBcW
         EXiW6u/WNzJVuQ+lnJ4ZMvPrEcQjfDN2fN7rzejDL5qjVCY72WSF+av9R5pfbIDSG/2I
         vkJA==
X-Forwarded-Encrypted: i=1; AFNElJ/qPfRAlwUGlowHyAbdC6zNcLVenhxWxtv7JA76mwDEo1OpFPEhB8pAxdsmfEDkWa92vMCpdL9X6pm0@vger.kernel.org
X-Gm-Message-State: AOJu0YwliebSK4xook72MCW7PEKcuj4zEhiJ5+btVB8xqEL/jk3PpQHT
	y3vrW3Aln6vp6eszDN7sCFtcBWuCZQh+O5bKPQ86+KpBQdneALxXyl4g
X-Gm-Gg: Acq92OEIZkLeWkuLbuI7H0H9JBFo8Y88wM9266xFKv4NpXlLyLY1zaEHlhjcoG7HrWb
	nBBX/TM8POb7EraJmosqVCOd2Te5Q6DubcgDOlXsHG2jLp4BkVFUNZGLbPE+X8lA2XqocvYpswW
	NmUGgzEl+wViDrAxejyMpK8sws03LcuWottH5ehuhPCaFrXB8TpOGz4Qj+jOtEhosmiaXe6I85o
	q5hYVu5SD7s7ferJuMPnVHYv9BGwTTom2BAOr0fIUOmDTD9E+dxZFuIRm4SOEjV8lZiPleoocv7
	PfsbsPK42XhUlhPfkOmif6MbRM0yOzYk8mlrxm3wP84BD4vF6ef9j7W08GpuwB4zpKt4MeRuLba
	3DzqGihiMEyFchJpKcjDbFAktjmUJ5h1k8EWKPxHlSJEVF0j76cM3uylG8g+KpUpxkDfqt1AiaW
	KILo3X7oKMf53X6gEbW3TxyxHM20bDPhSFEAnZSGPaHY0h4h+/F1GAl4hGnu1VrkI=
X-Received: by 2002:a05:6000:982:b0:460:2d57:fcf2 with SMTP id ffacd0b85a97d-4602d58034emr3094425f8f.10.1780581182959;
        Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 7/9] dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568
Date: Thu,  4 Jun 2026 13:52:53 +0000
Message-Id: <20260604135255.62682-8-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3568 carries a single core of the same NVDLA-derived NPU IP as the
RK3588.  Add its compatible.

On RK3568 the NPU NOC bus-idle and power gating are controlled through the
system PMU rather than a dedicated register block, so add a rockchip,pmu
phandle to that syscon.  The RK3568 NPU has no dedicated SRAM rail, so
sram-supply is required only on RK3588.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd1..af9936b32e9fe 100644
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
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the PMU syscon.  On RK3568 the NPU's NOC bus-idle and
+      power gating are controlled through the PMU; this points to that
+      syscon so those registers can be reached.
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

