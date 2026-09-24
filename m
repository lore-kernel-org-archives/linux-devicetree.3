Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F0146AA97
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268613; cv=none; b=Q1nGiEAROGQGrcZ8hLvnGOVrv04aPODF56xsI9i9PN4nhS1eAp6EU81ijh9D8pog1aQff0dVAZk2f3AbARNYoEC7RWZb93bZeTxAAV9CBa6iPIF1o+r1hXS0lXi55JfffZz0P5P5sE7cysrlqHczzyfPJuDVzFzA1bPvmT0EJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268613; c=relaxed/simple;
	bh=gJ9ftD1d2EfioBXUGyGjOPvuTpmoSQYjEu7aTN6t6Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0PKT4oBFeA876f69RaX0iXvCcOsukKWSN82IuG4zm9gNBnF3ZTth3Pak4fY83ujGLGTX6o8uq9V8d4x9U7Z64cRLxbDA1ZWbG+/zgmd+07lYOmcS80hCO+HFgcDQDd70jqcMDYfZj8bEFBRERSp9aefc8kg+W4unTDw430vqo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=EcPc9OZ6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="EcPc9OZ6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so181155e9.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268610; x=1790873410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=EcPc9OZ6uZ9aOMxAEKiMLGphfxjeJH7axgyJ76i01fObs85kSuUhTJhEEj7rrCey8x
         C1vrP1QhoZT9AWpcjGzld+nkz+cO3HXM/moPfw9exI0OF06xYCe/BqTOhaRGYm7ZCaMn
         j6P6AVIhcXGZWTANdx4bikIKE6ICTt7TTeRezVAgbMqdER0+xvQrRDF4gvcUlXFfailt
         Pfvg9jcq7gxcdGD/Ms9qe8iJ79scAUxnlOAkUZJCvBqkuXndDi5GCAM68Gwzvr904kNd
         CHdrbi39oA4Gj62PuQbDmFlbD41JhOXu1vKVPqMnoIOlM4E+nXnFTWKT4pXrGOTnH+Ol
         xVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268610; x=1790873410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=pHyitY8oVpIOB87Z8vIaCTy7zojqZ+l38yXfK2SQtjmKqjbspupdhxAPa2yychMxj3
         8rh+N5GNQIxCStOrCqd3kB06FjKBmu0Bhghb4doTFtNSFela+CIhn6SZIVm5ugNNFHQ9
         LLTM/hifUi3e9y+tUJr7CnLjerGjR4wrBZmdeA2ZnNeXQrBl7iX3HxY68pdjZgEVLPPu
         fg2thDAYxUcRTZq6v3j7t6in+wrmC13LV2RVwudLS8WPPoHPllmZ4I/Z/79Jufo7d1Dg
         4ar+C2zEj5J0kWCBrZAYLeKLEwjUk/w4ZByYZ7GVdXWHZ8MUE/ZVXybM0K0Ge+gssT1k
         BmDA==
X-Gm-Message-State: AFuF++lOkBwmODWz5NgvOfLBsEkDiFF4T8s0PY5hNtsMvSRZSuiNlNVu
	Ctxte7wzFCAEkv0UPvFW9pv9MlchUZpbvjn5/fOSWvykUicNBTnRsb9TDr8frMinZAo=
X-Gm-Gg: AYBFou2ScnoDzTkBhG2CJeCNOlh8cVvepWFuWOH2mkxOTgJkvcDVHkZ+oUaBHsyj1D8
	YFDEOreJoimNKowFwFisFGr1AUcodAvSbjE2dropqGzOn0htUWOf1aW4vOs0gspTZKJGeb4zZlc
	U3e1E5UIZiIOJ4XXvzrUg1UVaQnEhzUnKS4MgOBxyg2YU/o95Xs/pIiGuegws39m0tp/EofAGqN
	605+9ZdVFMf6YzkGfdB6MO2d+l5ViipAvzrf3H65Od6aY+8EqmedL46KO6mx4Rk1TMsuaiTIyyU
	qZRR4I2qMRLW/hipipIVdWiXkciT2Zj0R4WRNFB5uhdbwXtNwjOXQO0Zc3ortGIrlyLABkoGs8n
	qaLHMWNiksukrizyBphR/9nXtdB96Loj+AXJ3AeVEtQ3KIOWczttN1AwxeGS3L1qXDVtCD/sy3u
	lSDHfW9r8RzSsNisL9E51w5JSRjIabiOsh94KxOWqdO+E5n+t0PCKksaNZGOUz1Am4TTp7IfL7u
	dXfb2fTVfpqe6RtlheEExmqguE2cspH/whzlw==
X-Received: by 2002:a05:600c:4e8f:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fe66d062bmr55000975e9.7.1790268610145;
        Thu, 24 Sep 2026 09:50:10 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:09 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 4/6] arm: sunplus: enable SMP via PSCI on SP7021
Date: Thu, 24 Sep 2026 18:49:20 +0200
Message-ID: <20260924164922.117236-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SP7021 firmware implements PSCI 0.2 via SMC. Add the psci node
and enable-method = "psci" on each CPU node to allow the kernel to
bring up all four Cortex-A7 cores.

Verified by boot log: "psci: SMC Calling Convention v1.0" and
"smp: Brought up 1 node, 4 CPUs".

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
index 493d32357e4e..b73cfde7ace4 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
@@ -24,27 +24,36 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu2: cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <2>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu3: cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <3>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
 	gic: interrupt-controller@9f101000 {
 		compatible = "arm,cortex-a7-gic";
 		interrupt-controller;
-- 
2.53.0

