Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3883BED32
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162536; cv=none; b=S/QMpzksHQydlC5Flpig4+m3n7JdHwi6ByIuMJcPp+qrUiKYhF7+6+SjRt7pIprVbnPsau82VN5LWkE7GqRkVYZiS1O6ASGBJUWJgx9VRtWDyYmXU6mIips8ZfCXihy+R7+Fmbz+QDdS+mU5RtLGaDnso8DWRQVBkCxkIL2YMYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162536; c=relaxed/simple;
	bh=tFW3YISywSwOMjdHnG6FZDjw1jg1AF8WKQoGy8w1cNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRIjJbY4KgMoeb1c8IZ8POs/rdL/Lc204LQSgCRY2qZfdg4K6IP1gX4Qg77CcaPwunXHO7RhPSUMsa5G92R5XjBZ/rl30A3jCbMAdLHIhDL5T2IACJHEr7B6Q7p4wa4fSprKFCL+Q3OqKocfwdE3NO0po3VjkZR7S4rNNlytJaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcgK84X2; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcgK84X2"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-914ad42e617so1023873485a.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162534; x=1780767334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=qcgK84X24qIT7dySZQ2MD+dVDb106AXzZSIWnbKYlrmbi0bit01BAplPDRlG7YPImw
         ltpiT9RI2mR2AQlZhw46MTI7GG0T1JIDvPSMylDVZUflgZs5FBJ1L7pE2pZ+WP6nC5DP
         ViSlR3xOkds3gff6TbGa6fDP9kQlw6g9ElhGXa+FkXG9mcJ2H+fbU4++nrJfHLVtUXJr
         NF++V7MENbt9h/yFLSxV2EdgCOzS2rSRzMGWLs7x8zl96/tevzIye21kR5C9CHCSHpNS
         1OUcj25bi0ulqXjIciklx41O4XEazJkOynpD9FUxzYVNjtQl2Qw5hyWzP35TRwZRY2mI
         jgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162534; x=1780767334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=R4gkLlzwzSr7Vo0fnpNYeXsfFh3T0aggMxglgzIzAi29QCna9e5/+EeIDRno2o2MZE
         B/a30nORDcuECVIZgWLqhjR1I+c2XseprSHALH+11VhiCqWfcUkTqX2Lx9qPbkNEkNCO
         HiQioN4oatQv9N21tD5Ozz/711CT0ShH7UyaJMpQ92Run5q+knAuAqFqrkY7g3kQU07l
         i2NTStkTX0bCVWOL3gNXBFSvhD/8ZcI9WfFwPjPLg21ryIyLEV6AFA2Z1fTt/F53BSor
         fkzoSpdApGtQBNoVNTSX7Da4vgOmzZizydxtgSp2tYg/2FvCJHV7CgfNtoxwWUYMAmBm
         drYA==
X-Forwarded-Encrypted: i=1; AFNElJ+yhYy92kgYHS8qPIspEm1MfHs03VZborEpcRGpQrvzJhIbEzsYMaJByDnaTKrFOnEwTCfPeEQa069K@vger.kernel.org
X-Gm-Message-State: AOJu0YytMcIKjiu4i6709a/ZpesUriGJQd2a+9P5ffwhIaBHZ1QlEort
	cTBfw2+zxyXrfOLxOharp2FxZXYkrz4SSqVAt/T75mXdPvZysBfOuj9j
X-Gm-Gg: Acq92OE8IS0+arOI7Ao3rE4mXfgLkfF6C9fBmWziQU0xhfKfNhZgZzgy3bwu5a2gOLF
	22o2I50L5H80xrY4QzOgARATrYb5muZsXffGDs1VMSwAPNqMGETEKq6EhD6QgtloaCSHISFruc3
	JQyIE/k3K+XrBeMau6NQce1IGz37eorfG/k605B7tf0TD9QdV+ZmXTkol4a2UZDGlvNa6aC8M6d
	F93gs+a7slDomwKraTkZmP2oZgtCDA7GQvCNps9TgraYr0fPQrhFi36CsfhswoCcyPUNBpz4DLw
	3jAt6JilJ4WuScrxvanLAGu5xAu/G0/qU1fRtUAOo5EQpcHl7lpj6kuzihoaM1BLT0MduzMhuIE
	34yNnQRkUIf/4fgjPiGGLQD2dO3YC08db32nXgf0R60Gcu+3s8h3ZDJCn06nOLcuITXYv/BYt80
	cRW78x4xFzHz7enTwN0eruG4PKbMhiQ7V4kxZ+BzHco/l/9WHQ3n/lXzCF7kqxtkAtrCIz7hVkh
	/FCNw==
X-Received: by 2002:a05:620a:d93:b0:914:c82c:7a12 with SMTP id af79cd13be357-9153dbd5aabmr664027185a.38.1780162533921;
        Sat, 30 May 2026 10:35:33 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:33 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Sat, 30 May 2026 13:33:46 -0400
Message-ID: <20260530173347.33533-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 0000000000000..412adacc00576
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "cv180x-cpus.dtsi"
+#include "cv180x.dtsi"
+#include "cv181x.dtsi"
+
+/ {
+	compatible = "sophgo,sg2000";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.53.0

