Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9932133BBA2
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584091; cv=none; b=NB4fORYXBvP6TZElrAh6GsyHqOblsVYGvAEGweoHdxTNFZ6D0lSwEJjLH5xY+G5YKfhs2/Pl2jnkWM8/RqLA6G/8oPrhtsi+CjCt+QqEW9Do1LVdZDPiNuNLkDddOG5Kl6aJhn99RJrSvK08ZcknTaCcYgKCwsNaj7hyFZpJYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584091; c=relaxed/simple;
	bh=uJ+5v7tTBaGA2EN6w68xDGS98Bl8lz+gbPuPJeapzds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyjUgld1JDWj6eQl7TdFemnyWEXJ37Sgv5LDXSfmhn00+1I2vsuMg44S7NgzYVFfEe5mTKJRmkQEmkQYdyt9bOo/Iocfx55U6JNUcSlhqndU1Hy8UX4d97OI3Q5S6ouaLL/RydkccYcvZ5CBOaCOKfEN8hIP8MzD46RlUzZ5RIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0WJ2Ylx; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0WJ2Ylx"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842307472d4so291725b3a.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584089; x=1781188889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxhpIhSWykTBqWelmCLAKEvyzrcEJTlmonazORQ68/w=;
        b=T0WJ2Ylx32Ac1V/6PphnHW88PzctjiTkjjMLhuwMZVDhvrKS2iAznff0g9DiSte2ok
         Dl40MZhIQNRejHzlsirB+DMF/JOLD9diupJzkRV/J2OZkX11C/wzOvoA0dlefJ0SY8Gc
         PrzKArc64k/v6zZFWzE5staU6TvuTdCZv0V5xY1dFIgyEblzRyjec3AE1CMyqcCpbQFb
         167df8mDm5qc0+b2Iaagcg8jNSaSVKiNf/sXAKcYqlOXLmj6pa5NLvzfnXr0tE/7LXdU
         efc+TLf2gfs4C2cF7GL1P22vw3PWiu4NCAWXlft52P0FHk14IS2zSjqREORNZhxUT+GU
         06XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584089; x=1781188889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxhpIhSWykTBqWelmCLAKEvyzrcEJTlmonazORQ68/w=;
        b=IrKj/VaK/AHPGEkdIg/rzhvcKJpY7UXxM8rnpdqu1pypIzfw6AsEdPy9BlXRBDWGkL
         lP67x6EvSSnQnZfXyEimBM9dhiTd40Hdk+S0bTDTbS5k2FhQQMhjl0RNtQepsMtMQW/G
         m+vf90ygt582Cxpt4o0a5iqWwYDRFls9jYCkviTWQowFFkHns4LRqPqpvpyNGuIDbRYo
         8TeYXOnD/Wwh6SYuuJhX98x6hOWVkJEHeywZs7PuqTHoH8BV5bx2MJjzSENQQNDRY3vX
         V5TWgVizUu9wyWOp74RLChYwDzeIsLHG/qGskymztFtXD5/WkscGcpPTWVjcD3EP0bHw
         5NuA==
X-Forwarded-Encrypted: i=1; AFNElJ+Jn3wx6/MzFdH/uJ2FIlX/amiWoH0sGtqW3cRcFKiwY0wbQfFjhZquP+EuImIZrp4ptiVBQWWTVJml@vger.kernel.org
X-Gm-Message-State: AOJu0YxsvKhb0g22pWN3EwMedNjKND/NzFxO3iKWetZmm6wiMxWU4/4Y
	21i9zvJfY7etkutnrP++M+yPKluUKblEWiptnSAtaKCck97LSlnwkB4F
X-Gm-Gg: Acq92OHMaz+qK7DniFbsKh71chi92uri3W9pnYotY5/pHwno9A7pk0FhlPWMkT7PkhQ
	RYEAuk8vnw0x3B9j2vcCxbLVg4cBO+nDBDa3rOmziRSYEm8ArhtN9CNrNteY3Fy0y9YNVGYquhE
	GcqaBDYDMxBEx2l0m5ZYV1gMWmV+iDQaOGT9nNilp4dyC3YA7o6eR4ifXpnxWoGWAp3XSCzNz+u
	GBDRCAn43pZ1/lbaxTHRTfWoh1/DcWk2fDJgKVXnxCDBLX3zWRuj/6zvx3yThhVfcp9rl0f3C/M
	OZJXf2dBAlS1IDM7g/qWTRNKs7OGMjLoaZS4OF99Uz+TiBGHIYdftBDAur6qXt/UN9YEcAvHygO
	7rs07DZDYFDC2dUoXIyvgiwD6K4Oy67Una2Tl+HHMVhVuyPzAiCjHiA6kb4Exy07UxTM9fjAftN
	cjNXUPNoOu09YQUM4e3VnSy4jAlg7Rlp65NKJ9VOUufCpzeMYRQZKEsbA8DbTaGe1IOeyfVamlI
	4C4382I0Q5jkirYXPjUkF9FSGkwkkFcHOgYD33mfVJsJgfagZsSpq1YlTmWrRWJ
X-Received: by 2002:a05:6a00:3403:b0:842:48ae:1d56 with SMTP id d2e1a72fcca58-84284f37c67mr8070696b3a.35.1780584088833;
        Thu, 04 Jun 2026 07:41:28 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:28 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Fri,  5 Jun 2026 00:09:53 +0930
Message-ID: <20260604143957.668047-8-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The evb machine represents an internal bringup vehicle with just the
interrupt controllers and a UART. This will be replaced in time with a
full featured machine once details are available.

Co-developed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Update mtimer compatible
 - Add Drew's co-developed-by
 - Correct aplic num-sources count
---
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  33 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 471 ++++++++++++++++++
 3 files changed, 505 insertions(+)
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

diff --git a/arch/riscv/boot/dts/tenstorrent/Makefile b/arch/riscv/boot/dts/tenstorrent/Makefile
index 2c81faaba462..92d8bb1a683f 100644
--- a/arch/riscv/boot/dts/tenstorrent/Makefile
+++ b/arch/riscv/boot/dts/tenstorrent/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_TENSTORRENT) += blackhole-card.dtb
+dtb-$(CONFIG_ARCH_TENSTORRENT) += atlantis-evb.dtb
diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
new file mode 100644
index 000000000000..06259cca8357
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "atlantis-soc.dtsi"
+
+/ {
+	model = "Tenstorrent Atlantis development platform";
+	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>,
+		      <0x1 0x80000000 0x0 0x80000000>;
+	};
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		bootargs = "earlycon console=ttyS0";
+		stdout-path = "serial0";
+	};
+};
+
+&uart1 {
+	/delete-property/ clocks;
+	clock-frequency = <5000000>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
new file mode 100644
index 000000000000..2513f0dcc62e
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
@@ -0,0 +1,471 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h>
+
+/ {
+	model = "Tenstorrent Atlantis";
+	compatible = "tenstorrent,atlantis";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <1000000000>;
+
+		cpu0: cpu@0 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <1>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <2>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <3>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu4: cpu@4 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <4>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu5: cpu@5 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <5>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu6: cpu@6 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <6>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu7: cpu@7 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <7>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0xc00000>;
+			cache-sets = <512>;
+			cache-unified;
+		};
+	};
+
+	clocks {
+		osc_24m: clock-24m {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "osc_24m";
+			#clock-cells = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		interrupt-parent = <&aplic_s>;
+		ranges;
+
+		imsic_m: interrupt-controller@a0000000 {
+			compatible = "tenstorrent,atlantis-imsics", "riscv,imsics";
+			riscv,num-ids = <255>;
+			riscv,guest-index-bits = <6>;
+			reg = <0x0 0xa0000000 0x0 0x200000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
+					      <&cpu2_intc 11>, <&cpu3_intc 11>,
+					      <&cpu4_intc 11>, <&cpu5_intc 11>,
+					      <&cpu6_intc 11>, <&cpu7_intc 11>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+		};
+
+		mtimer: timer@a2180000 {
+			compatible = "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint-mtimer";
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
+					      <&cpu2_intc 7>, <&cpu3_intc 7>,
+					      <&cpu4_intc 7>, <&cpu5_intc 7>,
+					      <&cpu6_intc 7>, <&cpu7_intc 7>;
+			reg = <0x0 0xa2180000 0x0 0x8000 0x0 0xa2188000 0x0 0x8000>;
+		};
+
+		imsic_s: interrupt-controller@a4000000 {
+			compatible = "tenstorrent,atlantis-imsics", "riscv,imsics";
+			riscv,num-ids = <255>;
+			riscv,guest-index-bits = <6>;
+			reg = <0x0 0xa4000000 0x0 0x200000>;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>,
+					      <&cpu6_intc 9>, <&cpu7_intc 9>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+		};
+
+		aplic_m: interrupt-controller@cc000000 {
+			compatible = "tenstorrent,atlantis-aplic", "riscv,aplic";
+			msi-parent = <&imsic_m>;
+			riscv,delegation = <&aplic_s 1 96>;
+			riscv,children = <&aplic_s>;
+			reg = <0x0 0xcc000000 0x0 0x4000000>;
+			riscv,num-sources = <128>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+		};
+
+		prcm_rcpu: clock-controller@d0000000 {
+			compatible = "tenstorrent,atlantis-prcm-rcpu";
+			reg = <0x00 0xd0000000 0x00 0x10000>;
+			clocks = <&osc_24m>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			assigned-clocks = <&prcm_rcpu CLK_RCPU_ROOT>, <&prcm_rcpu CLK_NOCC_CLK>;
+			assigned-clock-parents = <&prcm_rcpu CLK_RCPU_ROOT>,
+						 <&prcm_rcpu CLK_NOC_PLL>;
+		};
+
+		uart0: serial@d4100000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART0_PCLK>;
+			reg = <0x0 0xd4100000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@d4110000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART1_PCLK>;
+			reg = <0x0 0xd4110000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart2: serial@d4120000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART2_PCLK>;
+			reg = <0x0 0xd4120000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart3: serial@d4130000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART3_PCLK>;
+			reg = <0x0 0xd4130000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart4: serial@d4140000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART4_PCLK>;
+			reg = <0x0 0xd4140000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		aplic_s: interrupt-controller@e8000000 {
+			compatible = "tenstorrent,atlantis-aplic", "riscv,aplic";
+			msi-parent = <&imsic_s>;
+			riscv,num-sources = <128>;
+			reg = <0x0 0xe8000000 0x0 0x4000000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+		};
+	};
+};
-- 
2.47.3

