Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C323A6EE2
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719477; cv=none; b=XJiyuVkdBQIrMZYymzunxwjB6tHBfvUozhi5M6+Ou3MjIdP4pjCH/i7JiCrivGGDD6K21MhFp8Id+l/7ZIYOOcEtHm5il1alu60xOD5Hdb0YPZZA+kPy95TAGp1Uj6G3ftcdtavcrLlKRimKVGJQac12ZgQUgpyKs7t81eiSraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719477; c=relaxed/simple;
	bh=tFW3YISywSwOMjdHnG6FZDjw1jg1AF8WKQoGy8w1cNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chFS30vHmta/JiVsXmXvBTXUPUhjVa/7LS6/t8ABzGfWP/b8VIe9UexQu2wCXdu8ZWOIy618V7cfMqOWm4b6pdo3WLgfWHGR32otyOfyXKZA1NR4swgzrff09Xeo7nQ3+0z1FzuMJ94NMGMD+srlvdKwUko9ChpQg97r1l9W5Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh4o+FVj; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh4o+FVj"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50babbce85fso18558821cf.2
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719475; x=1775324275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=Gh4o+FVjdq+k0RSamnmguG1bURGDC9jOgy3lMwGoOvvsxfHU4kZ8PDPw8JZthNaebx
         CmMnSkcASEtm5rWdl7EAUOq9ss0wjEMmbWOkXQ0nPVIE5p6iu9HnQLByf+8Ho4sYV2Lc
         TSWDGBpNKs/2LI1UiJ5qDW+8wZBxjdSLPlYlTdFfs5xYOFMB+DEEd38ZK1O002E/xxX5
         +3uXpj7NXbXfjJebgJmOYODoLNk6gT5MJAhsnHlIkQKSs7QzcxY1rawO7lMAxh45GC0E
         OFtCFpFmCaXlKVZmIKVhUjV102B8MujcPvi97Cj6k88pVGC7aoyuBZZIt3qDtrUZhTtN
         18Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719475; x=1775324275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=VmEUaadVaO3AqwfTVU2KFTKBAF/6B/3UJBKS9r7BaZYocVMtULPh8Caa30lk3CCYXf
         4lOO4QD3eYfe7lpdcynoQmhgXeWCt9+R6Njk+JmJPEXM2lN6xGmfuhwVr8XKhwd6ZG15
         PMUvZiNHx/79VsbFDJ4ZX7D8WNnb2s+elFrlVjw7BHzpDNHFlNpJ3r6XLH1ss7zky/C8
         89eEkUzU+cmdAoS80/Cbw9zDXhSl5mOoCjrkUlbXWlZU6s9dYugq6uEs72EyVsu6gpQr
         P3+ErZAMMXrnK9SV9K8MAlZq6l75vAswt06G12HJGV/BdVk8Dy4tOO7AmPHH1CVTm9yx
         0xug==
X-Forwarded-Encrypted: i=1; AJvYcCXi2Wv9vWWPnIjBq6HVkucEYtqmDDvEsMsZLwzp8u6v4Mo2slkh9owLYwvzkiZYMObU8EQEOalbMkP2@vger.kernel.org
X-Gm-Message-State: AOJu0YxZyyr4me/gI2tzFB/qdr0ugCppgw86mfpg5LEyGa+YppVBNjeX
	P5bs4vSwHvFkTJjGeJ/cd+5aViCvXGsVmA4wq3S+3r3Y4wMI3qSehMor
X-Gm-Gg: ATEYQzxmfdnAPyYYTbt0/u2oXeLnTpcjGMbTrAJIS27FzbmYESvgLOfuGFnDDRnpPtt
	fltt0TdDT3YSfYK4+pw6jaIRiEvoVuPh1khJkFHUtQjLxynx5USHOIPGx/1LDL84zPIBuXhpiiP
	NA9ljIB79oRWAg9ToL+NdMEff+Jr4/IacNarJF7rTutNVwOTyvZ4kzMlRZL4wjGN17GPp3G+EGA
	KFPyrq013bO0D4JhoRZ1bJs+qxl/jizJvby+3FlYNMW7G67+qB4MYVAt/yi4BGma6xSsJL5cWCE
	xrM61ivkU1by72GjoXVzihl5RSp98VNNApl35FxqZb87z2jG7CJJCWuJQ38q4LC8JxCchaqDnb0
	UwXrTi84Fpd+6TQD2jghv3LQo5HIKXWx3tOD0Ka5uuhoG9Hpr6F8zELRvpXM8fW6VrOPm48xqKX
	1QrH12CLa6IAIvDbYCPPZK8MF/P/zdX3XN91OMxaxQg+mN/IuetD3Brm1ixqjtBcKKe3A=
X-Received: by 2002:ac8:5dd1:0:b0:50b:3b54:d796 with SMTP id d75a77b69052e-50ba380f13dmr94020831cf.27.1774719474903;
        Sat, 28 Mar 2026 10:37:54 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:54 -0700 (PDT)
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
Subject: [PATCH v4 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Sat, 28 Mar 2026 13:34:49 -0400
Message-ID: <20260328173450.219664-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
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

