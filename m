Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB63F411B
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472610; cv=none; b=aajALwI3UpiJwe5VNziiCCLGtjW5NmLNTC5ZbmjJp8DTeD/zPEjsWwIU9MOFKz9h3SAk6lA4RkkzY9O7QLelEmgBQTNTIrTcktT/ZPxqezJfbP376rtcpPBwl0NkUX9ogCeeO6ZVYmxAX18CUHfXywg82oMfZD9lA5zOUhWwMTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472610; c=relaxed/simple;
	bh=/hQx464qNLWkFfJ4RRlKmn6NWl1Pg+PYXllSOWd/ndM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSPFTybR9Wq6O354CoiYoFcE7uvWljGV/g/NjQ2l6KKX0ALQk8vwm3WSTEUSoxiUMcnXgmbyQTND5RiYsvflQKnkxFrf1qQvtu+zKYXm4h8f00S7Bl6pLATkTCaGlhClAxMsH8Ci1amZZWR8LLhOnMggHAxRtUnmJ/cC/DWSeUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwXbKNpz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwXbKNpz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842307473b5so2676097b3a.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472607; x=1781077407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ19xHdzzWeLsFwfgT0pxhD3NoA/aGXvqfgrIFTG8NE=;
        b=TwXbKNpzUdF0m846HolLUbNaFHLTeXc/EGQFGhAH1C1MKBOc2EUccz0YDoNGTmznwO
         TlBTHUG5hqeWaFRlAMx3C9YShf/hIVuyKIY6yY6dIkKldSINBLN34ttPMhrdTRw35UQ+
         a2qH7INr7Xmlg+D61SqgVoZbd8//sda0aa51Cjo15TGsnkvvpKZgR4ARNAEtoetQG5B4
         Pk2FB6G7Up72HMAgNGPXc1tAG3d7XpAMiJ1IrcMF1D10lOFLvBK3G7B5WtlMk5otc3zY
         P/AvSquN31ctfemWPucQ0wf3m5KFKBAZSOBm5k4hkPnPUNOdFg5z146o5TqcjdAsLipa
         HJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472607; x=1781077407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ19xHdzzWeLsFwfgT0pxhD3NoA/aGXvqfgrIFTG8NE=;
        b=atk3mKj8b2pYefvH59AP8mXoY3U6gu+NeEiqQ/jN/AiTTZU0IkHuNq3t5+Y6WShhO7
         TS1x3SbYCOk8vv+2xKgJS0lxsJf7iljO+Ibq5mriRomHj4JlUFlVolrOsqVy41/x3Inv
         KDGEHqv4fhaopjn/uZnxlgGjrkQBB7oMaNKyfIGtkSu+P8ZfSOmOF0t14xoEuuJt9n/g
         iFE/c6jpovAeQjJHTHAu/UMuE2btjD2smhkQSZ7U8tMzCNxQf2MmwSKgVuWTX246lbWi
         TJX+sWiW6UpEBqVIGv8c4hk3DXClaIKe+vjE6+gS/dcPb5AE1ZTzOlPD833+6WEhWMve
         NZIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CxvmMysNf6XituV62H32HzZ+PS3oDEUh2D2tuI1/o10W8iY8T7UsCjjzOibgPxYt4fcxw5NoPcfgZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9BW1BedhGRXY+FkEvP4CxyfTsJTcMigziXRyAp1CpZDAYgIlg
	6NGOeopX3hvTajtEBaAzccQyeDxL7QirjNcsfaWnH8iBesjyyz67RrO6
X-Gm-Gg: Acq92OEvP6xkTHJMhHLTjxFax3ljj02SJU1HRczDNUaUttf6GPrLrEadclIGDYrVSOH
	ok+wVidrEqjIsztQdiWAiHQ0BKJDkkwco2XWr7QjaV5+uvjIRWHGLqGoJW3nd3Nv4Ckt60P6SlY
	7abFzFyhUMueVJ9FITvLKxq9zR5KkTO80qw+rHpH+ii5HNCyQbyQkBruXpTVajGV3OYRuLVOht4
	kTD6YR6J+I2bC1pSlmkowBl/kzy3XksCA0IMRmPq9O3fjJFJINwifZjgKtFoFJUjOX/cvHEy0bT
	1RlLpgkJ8Rl73pq+07x3dWEmYiXIEk8Q3gMhHuGrnNrV79cFYgkrngie4nGbTMVNyk1URbirQyl
	QhObOc3l1w2gJQuS3ZLvVL9Hd/cTkvzP5IfCKuz4KYKVdlXwLwrQdyYDXfPjv4PDsBiyjcknGbc
	AbHDam+uvI30UF/LQFvB8M+z16zDgc1wrM1ZBjKlbnGHurLLLR/oA4bbl9yEsXHz+esbI3hQVFw
	xxep3dpXyuRDSzoGpD2OJqp6Kcuo9+sTqLJI0S5fWnrVMqpCi6x+n6R01gggUEB
X-Received: by 2002:a05:6a00:c84:b0:842:4f22:f387 with SMTP id d2e1a72fcca58-84284f347bamr2216992b3a.49.1780472607454;
        Wed, 03 Jun 2026 00:43:27 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:27 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Wed,  3 Jun 2026 17:12:19 +0930
Message-ID: <20260603074222.593243-8-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
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

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  31 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 470 ++++++++++++++++++
 3 files changed, 502 insertions(+)
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
index 000000000000..28576b87d300
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
@@ -0,0 +1,31 @@
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
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
new file mode 100644
index 000000000000..1e312b1363f8
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
@@ -0,0 +1,470 @@
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
+			compatible = "tenstorrent,atlantis-aclint", "riscv,aclint-mtimer";
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
+					      <&cpu2_intc 7>, <&cpu3_intc 7>,
+					      <&cpu4_intc 7>, <&cpu5_intc 7>,
+					      <&cpu6_intc 7>, <&cpu7_intc 7>;
+			reg = <0x0 0xa2180000 0x0 0x8000 0x00 0xa2188000 0x0 0x8000>;
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
+			riscv,num-sources = <96>;
+			reg = <0x0 0xcc000000 0x0 0x4000000>;
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
+			assigned-clock-parents = <&prcm_rcpu CLK_RCPU_ROOT>, <&prcm_rcpu CLK_NOC_PLL>;
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
+			riscv,num-sources = <96>;
+			reg = <0x0 0xe8000000 0x0 0x4000000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+		};
+	};
+};
-- 
2.47.3

