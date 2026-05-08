Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128863DB65A
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240675; cv=none; b=gDJGwBbyxhN/B+liPfiqNWVEHkOC5ddoUko/fYJO3srexiJxXSgUPhAybT5JZG0abt/tnG/4fZEv9TufWTY9a2TXDHfJGgPzGuxPC8STbpSCJyZDGR61yMDP77wU4dHVDFVJClb+fIWyxfpPID9a7wm276tw1ku51iBRR3y7ZB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240675; c=relaxed/simple;
	bh=LOeM8ihnb36RoLRaLOifM2tLinrlgXXEyl5wwuq/3u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yqw6qPUPg0BVIkabN/Y4j1gypPLOeFCYovN2qNY8PSvNXPs0bOrecahOJXbhya3pzU4sutbRwH7lE5//EZeP/V1VKEnM5TPnNSHu7PLU6O5CntIfZcigt5/5yk40fnw3C9B6XdyE3KwCx1hNc1mr7dDUDagF0EgsapRqzgnlXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=leak.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=leak.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c1a170a50so2649574c88.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240673; x=1778845473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzCHDRov5czdFb4E1osJ9K5lNOkGAu52SXuGZ3RLxI0=;
        b=PpCKqQDk3HWQdZrcqlMC76ReSb8TghYnFqUO002OHhvfh2zzoNtqvpeb9v7u1DH4A0
         Yph/vuVEejb7OEV/uL657ACakdfr4tLv9YR42ym/aEanzV5E7RJMqDLqqYj0aFiGhsig
         POBh2pxcOshc0YrXYf8043oATEEyVOwHzRjh79Ju6TzncnQg+YYRIavPN4O9jIIu2TUU
         qS/Dr346TQdjpoy+wX/m5O0OuQmKf/UsYUveNAUPAuKThPhjaHeLI5N8tEJzRp4sWaU3
         r8zlGAiZMYdmZODw2oIhNZQ8v0iLuSn93Ji+JfgvSAG1nNtEjdWx7X4OFlHn0K2ylryF
         A05w==
X-Forwarded-Encrypted: i=1; AFNElJ//dkGRTmb8LXpdkQL1r0zBwCd07npSePqDvY0zNYTa9eT2HmmNKra8Evhaf2oj3mATCdKdh3hcHh1l@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9ugRkebtIYbwL4dHQT6laavbAl9SLiogUYpmmX0gN2Y4it41
	i9pHBDdSKKW8p/uCmsGYRpU5TIqSQ8jVuR0Ox1Z4XCQXZ7tdd5N80I2B
X-Gm-Gg: AeBDietUVC4/F7AJAF+BN/GjxDyWvwP+Twn1iXF50tH6TaLLnD445dCD+waCyDBOtKP
	6r90Ogl9Q8TD62IqBSaaEtI23m3BwEempHZ+pwPfiLLylrZuTp50zzjd0yH7ELXoWQxUGQfrB0i
	thMB40ZLxSnfabnYnTF4/Tr35GWjBji2sGygFxSaROsKZDa9jt5y4MEydERZOKQ5blpyRaUI8Ex
	59E0TTya8e1Pnlhjr2SQ9peYUx0aJMMrXKUQcNwsGu5UIn1cqyw/hZ1opaGcLZvD+sliLeX6No9
	nxGyXXqxoZQ9kd4JYMzPBsQy2oSHWEwI10xVPcr3YEKwdcNdrRubAQGXtDQGNXNK66vCMT5CbKa
	l9YdolgMoTopxebYtcd1iLHP34Ck4FlL/X/yavNHARyVVhMq1q4DMZyXtKvkObkGekNkk7eOWXD
	11FzvXoIQ8suc3djwGKRpawZCFPvlZkkk=
X-Received: by 2002:a05:7022:6986:b0:128:d450:bc76 with SMTP id a92af1059eb24-1319cf558b9mr5748384c88.26.1778240672982;
        Fri, 08 May 2026 04:44:32 -0700 (PDT)
Received: from [127.0.0.2] ([154.17.237.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210f55sm1979131c88.5.2026.05.08.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:44:32 -0700 (PDT)
From: MoeLeak <i@leak.moe>
Date: Fri, 08 May 2026 19:44:13 +0800
Subject: [PATCH v2 1/2] riscv: dts: thead: Add TH1520 I2C1 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-lichee-pi-4a-wifi-v2-1-7acf63559e62@leak.moe>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 MoeLeak <i@leak.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=i@leak.moe;
 h=from:subject:message-id; bh=LOeM8ihnb36RoLRaLOifM2tLinrlgXXEyl5wwuq/3u4=;
 b=owEBbQGS/pANAwAKAdIQkqz3TgiQAcsmYgBp/cyWGYB8TW+I2NcVqCYJ4tHDII2NzJeRB0yBz
 vpiduMSkBeJATMEAAEKAB0WIQR9GaDYhgIayZrpu/3SEJKs904IkAUCaf3MlgAKCRDSEJKs904I
 kNX0B/9rUHxQnv/AqrbV4wDZFW21lOOUuhYE4jYWYDT7RH/00N4nFru0RlDLNdUzAkwhEFoUyRf
 Izl5kcrN6hh9LrPrdugc+ZMu4cRG3CrR/LhF/5Dk6mvVFxBkpo3yH4jgTQ6rPvwpDVSAQP1VpUK
 UyXKBLUH2b/Ltrtzsntm9uunPKL6EGZ9ashu5O3aXNyvj0d+Ei4mrIlTp3j9ibIfll6RpspYzqO
 rQCxrUlLRSzEbae3fdjmRIt+98uy51vP2vQT1NCFcg8bWgrjJsoE0CFg61rdYieJxR4vHjNzc8q
 5OfwVRznUPSuD3Ford4A26zBZLD2IGElIzbN/Q+IGIqQw0ye
X-Developer-Key: i=i@leak.moe; a=openpgp;
 fpr=7D19A0D886021AC99AE9BBFDD21092ACF74E0890

Describe the TH1520 I2C1 controller so boards can enable devices attached
to that bus.

The controller is disabled by default because pinmuxing and connected
peripherals are board-specific.

Signed-off-by: MoeLeak <i@leak.moe>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 5e91dc1d2b9b..94932c51b7e3 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -411,6 +411,17 @@ uart3: serial@ffe7f04000 {
 			status = "disabled";
 		};
 
+		i2c1: i2c@ffe7f24000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f24000 0x0 0x4000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C1>, <&clk CLK_PERI_APB_PCLK>;
+			clock-names = "ref", "pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpio@ffe7f34000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f34000 0x0 0x1000>;

-- 
2.53.0

