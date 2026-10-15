Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A587411FAC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090600; cv=none; b=df3TA1SvsdJrEcdi1WqDswLwMkv4bSUJrGOyC7SZRvJowS/feLIXFTYsHqCKyIIbY5ckJgyBOZE8Tp7kI/RH4pViK0xi9HuUKaTh0hRnHxAoaTtcw9hIE02yTpH96LQiTXr3BS6+EeGe1plmLdqM4xgkM0rcCYr5suctLYMV98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090600; c=relaxed/simple;
	bh=AYquGq+PWPwHCXs0e1iyppBvIZnSoNzpk6ygDyKiN40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajZ4AEFkAPvxshGtTLxuikt9j/VYuMH4ay7DH9rwozVj+j/lcz7iLF6N3S3/j+DDDQAazU4oYqWZuDcgGLTYQlOb4GIX5x7ygXx0Lm1xVmBelCwmYGkrhBKd7ZNOtorpWWmt3ZNK3gwooFuxCrDwNRO5Od/ITGbKvCOk+5JtJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkCq5C71; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkCq5C71"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so50302425e9.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090591; x=1792695391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=PkCq5C71jVSwiX8IWVxs5ShasZoHXTJ6JE3Mh30TsRWDHUJh+r5789AenXQTlA6e0X
         aEu64mi7BJhsP/GPRKmc2GRszbip66s9pMUQanlP/4v8953xVBAEZkN+97Q/l3iXrQe7
         x0pFbnxEvYrugUPB6VE/OJR0p2DcBi0YSa8TAu+qjmI/vFRyrIviUeW8NefCBsIYkDgb
         7dbzZE02civBml+XiZmzIhY0iAuz/xmfc37wxDCFbNxWRIu9Y0NbJ/n3wQKIggROeUfI
         ssv0GWg+b5+2KZaFQnCmj0W04SJii8h4RYiSFNOaJUJoE/6agxiuZbdsJGr45ANkKW7z
         f8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090591; x=1792695391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=ccSSclrwuHXhe23hQSIi9HCocIDJwCJSXWBWChsoc2p7vQ9/M803/ai3+ZgmDAL5Jv
         j07aG6FgLiaU4SnfMOJV0/JuPHv8qbBkMheD7O9arwUVGnlmWKM0DAc3U1VrhyEnF4k9
         ++qPaEo4IaZFQ7JaVxsFtK19QRPpLj61E0LLGPnuArPF3jKtykhyWGRg5TrVvFFSA1BO
         7Htdv1oSJKhETyja0qUiTy+kwCXLCmD5uczaJpTzvwezHyAYswof/tkiLHw3x6qb6iND
         cM+DfaqYxNca1Fa7njBBWaVlnfY1GwRr6SdCAJmD4Gy05Ti1iTOlQXdqYejVh4oEo9Q1
         WGEw==
X-Forwarded-Encrypted: i=1; AKwUvBxnzAzHomM2ey+j/rJgKTRxRbY0GsXRycuUpSMQJBdsqmGY4oVFgf/GGspdPJJQKLx+qdPv/M8lmfhC@vger.kernel.org
X-Gm-Message-State: AFq9FYLeprtNvFGHRENrwPZu7VJG3NSPVmJ8suLedBROmJ7WZXpYj2VL
	2xmB2bifir2+8BWcingQPRPckmlPQNMbZtAdEmp/WinAFjD0fs3c74tT
X-Gm-Gg: AYBFou07R4fbxXzUlN0CUB8lZBYXUr5NDVLWxKJ8KOIrEJPDD+p2IpJkxMr8YV/ko26
	zbi2XMoIXUNTq15h6Iz1o76IUZVv5BTCUbBkRK32IagRAb60dfkN4rM42ZxUwT1HTWCW2yjs1ps
	xthxH/ubq0LQepgUX2EK/3VzKHrDgefpUWpoGU8Qh9rUCvSnoDBLi37TO8xKBQkoIsgMk6bUDeG
	dC5d290KLHE6xTkcZ/7m8VcnDDjguWrwn5srug25ENjeCiswIffMWRtMZkH+R5r5y2elSJk/VQT
	N0SogYTeeieoCqhIJ5r1BvVBz+l5ci0ImypdFwc7mT85wYa3OplsDOZPB9G20SPYRxoEydSbZ64
	yGZ+win7J41EVDg/iSx190ItHM5N59Ve0bP+F8TcI2P+aYDlY4ch+9M9icpgZ2T3PKv+uC7xxOx
	3R2K+Ub4BWRH6FbLd/IgxyQrt5oupXSS1UU7+B9+W90yuiI4pf+p7qNsaYioYKBETFFWhT5WRcd
	17NVS1tC1WEMqKuIcNLeg192uowbxhmipVBvqkQRw==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr398603945e9.5.1792090590951;
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:05 +0200
Subject: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Add device tree node for the Imagination Technologies PowerVR Rogue GPU
(BVNC 36.29.52.182 / BXE-2-32) found in the Spacemit K1 SoC.

The GPU is located at address 0xcac00000 and uses:
- CLK_GPU for core clock from APMU controller
- RESET_GPU for reset control from APMU controller
- K1_PMDOMAIN_GPU for power management from syscon_apmu provider
- IRQ 75 for interrupt handling

Disabled by default; boards enable it individually.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..82cade2f76fe 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,17 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+				status = "disabled";
+			};
 		};
 
 		network-bus {

-- 
2.56.0

