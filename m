Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A72C3E1696
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670383; cv=none; b=B/sPkNzSitfW5t/NtJaucBqnwYM6DJ6cd/ZOs9eBn9m4Lhjs49oZv/WxOX5F0O97+qmtj6SYgfWG5mutHgPokWKV//Fq5M2QG7s2Z2HrDp5it6SxgPMbQxrOKVHU2FXsfC4cFVoF061lWjdLaogozxwT+gDVOTT9OqWvmtUDhlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670383; c=relaxed/simple;
	bh=2WXm8yz/A3qiEijwIvFLb+YMTiqPBikspFN/zgN9bYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AE+S7BRhUaXU0OZkzuGdHWqoGgNFXkxG1dUBkYmpqgmaSQAY49uqyK8XzLepAslB5M5xF8+j9v5eG1/3y0+suF/paMmuEN7gOknxzypzoe2CsKjh0XmOpSKgL844z8O+LwXSsi+F2dR42nyjsxX8+GOKWRpINhKQxQ7Chugzlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=be+i6rYT; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="be+i6rYT"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so322763a91.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670381; x=1784275181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNHx+OsQYG/KhT5bcVFP5J4XDttscJh5ndZrWTFJRcI=;
        b=be+i6rYTNnZ7vNA/BxuYd1EG5k10gWQ3K7kHt9cbmjJCj5FTVvbfufNR4pAqed//kn
         jlC238b8GzlPcRAJvJTU0lNxWFKzzQGZjn+4N2xtjmhiH4nURu8UhP4I5uEth8zzdqlF
         mJBcNcSByoAEcD6QEpbYsUIOBz7cnkSWlVL9o6jvS2VmweBhXvnvqt81F4ROnVYLivrZ
         skqUfdVzEyOh/vd9XLeN7ynLPQJu20U1xAXcfoWHrsARvUEIsB6BD8JORm6ZOQtfi/cE
         RYPWNeefN1CM8cCbVRymyLfY52SF87k0yKAft82JaM1EZDGGVD93cW19EH3+Rl6KkveN
         jQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670381; x=1784275181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNHx+OsQYG/KhT5bcVFP5J4XDttscJh5ndZrWTFJRcI=;
        b=eQfAfJelU2aNWWRH1OURRlVtrk4jlT2nfs4fa7Y47dcjqU5bhb3FB0pvYvulgKDdVp
         ghxH0TsZi0E7UE3bcLbhAWTGhVdZFEwQNjPzPvkIXRr8H7ucDhn1n2aLqqTYYirDfjmn
         ECNzsiPi18+m1qpahXewlPMMv4xSJFtrOahv0blNswkKio7VmWAICcGmrQonk8+VV3n/
         3G1J6ukIQ54hvkC7UoR4M5QAB/Ow/0gArHYzrsYZsrbC9GhndqY5MHEgV26HjsY5kokD
         cCJl8aT/biDKCwCuWHMvi3tGKmzlyPqgz36pu0HzW/sm06s71Q3utYJlRaTAHFTLdqFF
         xGeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIk6ZrJv1Bgd+z0x0tz+kheJTSGG+9LTfaance4urizl2SXcMj1i5QMYMu76Mg5EzkypcreBpLLrCC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4gJ24AkfTJFmNxwwLZd8wym81ov3PWtiHzBnorHMtMhOTVHoo
	bagBlN4oWcbq4IKMowUnQZt+Ny/PHaMuMbKRHEZnIiq4rifptDQP08++
X-Gm-Gg: AfdE7ck4/MO1J3K/W9ozZaO1qp2V335BL0z2IftjBRPy4gVQ9iv+daTqh6e1b/7MGYm
	0hhYXG1EoPdzla/QxQbDc2fJXBfaT63JPCCu5aa+BgxsFoKsrlVxFufzNmpeN1CGNk7jSqMUDG9
	JFRm8CsJwswEGh5DTv8DAKjim7L6BNWUVWWvZ1uJ8cFWTNK4PqKyzhkZE0Xp+JWY2QcrI+jYdVr
	ikRf2hrUA3YYZTOGqSPfMscr8UoT8og38ZAgxB624DdRga5J3xE4DaSwY4bMUvrfZcbvrO5szAM
	PbIhufsrmturWMlD9FcOVPmfmAnidoY6b+y/XNYHKKee+ljEC6IOCMMa0W5MAi+529cxUCmlPc8
	+7gAqwYPOUc5rmxBFKF4jQ+bI9k3agc7lo3bv8xVcxvOSph+hwXBLrICDsXdWD+GkpOaFR9ORRI
	akNkCJHRPIlNbc+x8=
X-Received: by 2002:a17:90b:2f50:b0:37f:e8f6:8d4a with SMTP id 98e67ed59e1d1-3893d33a814mr8798226a91.0.1783670381465;
        Fri, 10 Jul 2026 00:59:41 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:40 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Fri, 10 Jul 2026 15:59:16 +0800
Message-ID: <20260710075917.159969-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
The base address and interrupt number match the vendor SDK device
tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
via the onboard status LED on porte 2.

 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..25ad2bd265d7 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -160,6 +160,24 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;
-- 
2.43.0

