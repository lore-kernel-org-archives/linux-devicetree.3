Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0B440A36
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537329; cv=none; b=BxwUjPyS+65c2n34NPuNntPwiVH8kkqGiCMc0L26h+9abjgDkVESMi264ixIslcXNCNmpexWCNDy1I1V7koSZ5V/JJXVDlqcwTVSpW3QMcPx5Gg8cxc8Z1jEfWQBd7lI6HKyUtFf6HUn66s5Rh7zj3sSyXSYk6zpyJMaZL4xHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537329; c=relaxed/simple;
	bh=o3BrW0Pk3Yb3QqbEL5Wk6HQ84Zj7L0TGeiDG5ECjNWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfjtOSrqMIAAb2Kjv4FlhER4ZmTRi1IDFrHABquAU6oh1aZy1Kfwy8pRwyBC8g7SIj02HdFt9Ih9H268B+3TIl83Teq1tCMQPbhrnA97KWBw1qk6GYvDaf94Voe+2ZL/79ldCOzapi7fAjd0ckpIhAhu0dG7sj2zbJ5sTBNUXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ikuuhI+w; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ikuuhI+w"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so6558235e9.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537326; x=1787142126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYskKRXMT/E1v5UdRHS7zk2d1epkZSuiJ8hCmRGEFMA=;
        b=ikuuhI+wj3oIUv+yA2hZ+FdTg9AkLT5tzZM20HdgR7snHAI9f6FokhjwBQo/R/R2dK
         ePedG2iEYD3apN3zIGrT1ndtHIzUpFc3XApZjPQp5XpolZY+iAFQlKVeLrGYUWI/4q1q
         GX/b9w/d34WkU8ebXXYcxkuQGVcL+pmwOu3kO3BUDlAZJlNuWIrCcihR59+yFkzcE31T
         0Qc1itQwLyj4KAEznqPa7CXd2Z2yD7mEnwBfahVvYmjgyz3ZtQKvkvc4wNTiv9JNQJ/P
         dLJor423IRQCy65elsakqkP2y+PBejsG6YFtdD00n8b7MvCApCuYAjmJC/Of2mqpW010
         Kvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537326; x=1787142126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYskKRXMT/E1v5UdRHS7zk2d1epkZSuiJ8hCmRGEFMA=;
        b=E/INSbgWlfJ7v77bxP6/Az+xCSfgxfqybCpnHDg7po0onKi7Fz2h0sGRcbBy71v0NM
         U+QQpzB/s0DYpOLpxMgcmX0lKY1pVhxfq4mTWbgQXJPZLyZTpQsv83Bhqknm70ZVdsS/
         EYi9bJzx/2EEu8UXn+fgLwMgAtl65DIeY9H5Dx2Mb1LgMi/MZhdXZdA1vObMYG4NYDec
         ksykn5JwYH4p/7XbjquX1woQvN5+G9V4hf9OKFmVjtOHbJCVH4V9XplowLoGlR/vh0PM
         fR/Tt2VDXftwLWAKT3aTPUidCrdqHrgeX0iXuZ9N7d4ziQF64oK4Y7a3kIMvyAt19UCY
         UNmA==
X-Gm-Message-State: AOJu0YwYQCnTxCJ7sYJ+PSwI9UNL2AWK6PTREHBphq2eKiBKkTVGII7k
	lePn6NKBepJggm3Q/O7StK8Reh2M+2z5VqAMpU0fJwN3Ane5alfiTlPAzOsULQ+W2xqnTY0B/E0
	WmfD8+8z/87k4XcoScork9fSSywHfdFasWS4m+D0eeX4NU/Vk0NO7f6qtQaIhP5rey09M2xq3tI
	0ia6uI6r1bgeOLG6p3/wP6JRq835eh+Whh4mZwPlDi/lpzJAAZjn83wl4=
X-Gm-Gg: AR+sD13rl2MueJh5CdjI9+bkuHYl1QTBSyKAloPtBMqvFabZ6dZ/zsFLMxBSBYVlyqk
	SczIFsiOMhjeIyr4bgNR2D/ixgCJg8x3kNafvI598jdodj3mNsMDhiAo9x3QDWq9bcxYYA9T2NG
	TIlh7y7SZVLDPEJhp+uHvmZBz0h+45jnssCaO8pslfrZXxiwqZD7XkD1Vd2l5CDV9ZgNUmiz5Bg
	guDCjzvLKJbvkR2dTV0B5SVOfaFrnQpY13EybsYCTNa1Lx1NdoAdmFSZD7L47YDmbc/B23ErzRz
	Ek5b/PRn0nLOEE3Z+FUc6m5yDxJISjSiqvAAb40KAsxy+PkcN4QfL9Y2tkZQaDx4VkXYxqidads
	XA0MqqvaYlO5MHBk7Y3yIpHFwL7Gm0wRVCK4ZlseCPdakc/9WngsYj7wFrz3hc1wkyfPCWnSWc7
	L9b/2cgTx2TSg8ssWQoB/2H6JhlMkrpq71IXXlGkbx5rYNQ01xBZZT1aWNirQk8U90jyMGxq856
	Umzl7c1g2sV
X-Received: by 2002:a05:600c:1f8f:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-4997bf83d13mr43895935e9.0.1786537326046;
        Wed, 12 Aug 2026 05:22:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:22:05 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Date: Wed, 12 Aug 2026 20:21:30 +0800
Message-ID: <20260812122131.1534906-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260812122131.1534906-1-peter.lin@sifive.com>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add per-hart DT properties for the RISC-V Worlds architecture:
riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
platform-defined values are primarily used by M-mode firmware
to configure World ID CSRs and restrict WID usage across
privilege levels.

Also add schema validation rules to enforce valid property
combinations based on the ISA extensions present.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v2->v3:
- Drop riscv,nworlds property
- Drop 'required' check for riscv,pmwid
---
 .../devicetree/bindings/riscv/cpus.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..326b68398b90 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -39,6 +39,26 @@ allOf:
       properties:
         thead,vlenb: false
 
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smwid
+    then:
+      properties:
+        riscv,pmwidlist: false
+
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smlwid
+    then:
+      properties:
+        riscv,pmlwidlist: false
+
 properties:
   compatible:
     oneOf:
@@ -113,6 +133,30 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,pmlwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for S-mode and U-mode use on this
+      hart; each set bit N indicates WID N is available. Firmware may read
+      this to select platform authorized WIDs for lower-privilege modes.
+
+  riscv,pmwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      M-mode World ID (WID) for this hart, M-mode firmware may read this
+      property to identify the WID for M-mode. For a Worlds-aware platform
+      without any Worlds ISA implemented, this is the WID for all privilege
+      modes.
+    minimum: 0
+    maximum: 63
+
+  riscv,pmwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for M-mode use on this hart; each
+      set bit N indicates WID N is available. Firmware may read this to
+      select a platform authorized WID.
+
   thead,vlenb:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.43.7

