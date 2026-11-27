Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760207;
	b=HCdcfo6rvEG3AB2D1Wf8VCSAmqTEq7ag9aGwgocl5J392sq6tZQUXtIwHGdQCh34TVFG
	 yYsV81fs7de/QJJsxVthWjLqFm5/zOnaxaE8XYVq+FzfXVmA94qTfQbibFTPyx6/LCCaF
	 Uh7kcndeekoQz1S2ynCS74c14IzxztHDYroapvh3xOElwlRXFSUdKXlszhchfPhyBb29D
	 UiEhLUaGRgcZ92ENNjkpMl/ZtKb7wQNjrLR4EtgJ25orZ2nzqi4DXsERf04Fb4vl4jcPP
	 8IrtH6YtBBwYpzaVLYE4wD2ROipLC7FRACkTdCDbJsPv5dzHeArf+Sx5zktszYA1fTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=cxu77tbNMf8TwckKPe3yqqEDva2eVLfbZ08vXxipWZs=;
	b=t8m2NyGmBR+hBBFsPn1DDCqBZo36YgtT7VSoId+pRmcz181gefuDoK4wAVbJh45vWBom
	 Fp4EYqim9YFQK7ua86fz4SMS8c1n4Z3kdKuGnRrm68VxW6xa3QLfyDv1wwCSvRpu557NG
	 Vrz3dil+tcVlDk8jJCllnbU12i/iMR0x8Eroof34WhHU3e4In1GNGMURuCXQjas2cDaCA
	 vMtsdaNswzAeAc52qaUXdlP9Cave8+kRaPtHTJhWZveYK/tw1dV8gMHcDNJXtWHSk573H
	 JDTIf3ZJvkXLwLRnCUvO2HwCKAjxEzNnt7wO8FUFuVxM3Etsc1wz1Cthp8a7w0ABdig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUCmBv0J;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C632606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C632606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUCmBv0J
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f020d0169eso38499645ad.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760206; x=1796365006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxu77tbNMf8TwckKPe3yqqEDva2eVLfbZ08vXxipWZs=;
        b=gUCmBv0JWZ0FxaBArSHhWJ5WuBKRqjnHaWKlste0Dx59wJU0sZ/dvJXuiWi35qHTBW
         1URxE4CGSJlcasqXU7DDjr966oKX/gBtDy+n0OYoE+1QdOMVaogSEEkBDUYAfS+/uwY1
         uSy/OWDa8yt/Xa+Kv94UHeqT5EY7wQptYJmOTpvhXpA2IDfRUNjpjvwxKGl/fG7f3rht
         Ab9Au+6cMf5V0LeyX3r1bvKh/JJJpv3JVjc//hc/kJzyWZpNhYzZJ9bBRkbrlBbtVPgS
         Vi+gPz783FkibRpkRaVNvGxdoxrr86wfgMgIhRorH2hEX85i5kIPKmuC76dG8ymHtjdx
         enqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760206; x=1796365006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxu77tbNMf8TwckKPe3yqqEDva2eVLfbZ08vXxipWZs=;
        b=JyxwvbFiY63VlvkOLdy6CHZJg+0ZVe69nDkZzJoOCq4GQAdH8Y5OK1GdA5M7bsgc2S
         1RNFRwXawOncSxLahhhMY7ClBRWVzzwQDfSnh1l2wglhH8SH8gB2B/i1/ekWArEwguav
         M0dfWRYzYWMk306YGhYrFBmj/bHXPH+05n4gGh5dKA0jlDO7KGSTQdfGdflefk7eKPtM
         P4eKQL7QQIgQwp2+sHtwTUYSvDYIyO2JknlG+6GAgeafV7WHOnbzkgKgpVyUhRJnYKO8
         1v08lVQ2oOuhyPhP7FztgDkAFRNXBQeR8NOKXOIKgaO/+3NRHDUik83zRSeB8w+HHVx7
         /KUg==
X-Forwarded-Encrypted: i=1; AL+hErH3T5OqCA1RK0xwUETe7gmLyspXUnARC+S0tZ0+vU4SOAMCBExNLOAIKFjCMaa10MFkATEHlGh6LxXV@vger.kernel.org
X-Gm-Message-State: APuU4Z+gp3zpkn7yxIOlvzyK1AtHwiOvWKqmwMVwTDQnHsFWiKEYZ0g5
	Oswzic4xlmxxeuq1hQUX56lQl5RUeQ+xa0rp7k2preAcfNfvrhCdzMkA
X-Gm-Gg: AZFdTZcqh6a8kDqKz5TQmnSqfglg1D3kJj+jyNxaCfVwP6Psd0CZpIHrbQnu3jOJm7k
	O9cNXiDf9fcX1DpTFujs8owWjnLuumlQ5McrmLrpLPe/liyn55MjLZSG5I7+cRar3PwO+Gvj6uJ
	q6zRFJJsZVcT3aP6bOO/dHPL20Rgu7M1nY4GtG9rqW1LDgQsjCEWWVIA+WUzZbPYAAr7TzhJrBR
	d4EQgelAbEu6H5yJB0Avk5B9ponvzNnW+NYi2hZEfpFM7NXkibyOHIr9cwp74YfkmGQ+sRcgyTo
	XAtBPbB2UZY55bDI0nurKZUOdB3bOIsq9GgJS0F9V+fYyvTdxUvQEzqbmisv8oFPfBbslaT2XVK
	fUY5Q5C7ujge8WP1a1Lg7xYFL9P/8jqgxhherWbf4uEcRG24fjU65KayBgXDmswY7uxYs69qzCp
	DtBIopojOyU2/p/lHbXfWJyL+INYVsmNk5Vdkfif58QRt24J5MItZXjO/pSIH7C0VLLtI8sdKE1
	l161cMah6G5h/zumRuSaD7YjV1J1MZLcI8MIgN7AR6wnKmLsptG8B6xNFIPij+m7RGerrF5fNw5
	iQXaOpOWgwg/liWg86ju1w5wSsQI09TFhX5Nwr5FLi4XMtWcPnxYTk0uFQq0YCTF1NIJ9abuGfA
	D2eyaQ/JEJUsAIxF2IlX00BpFdkXBvi0Y19kGyla+/050vVK3rOBDm4sfqTcyZe4=
X-Received: by 2002:a17:902:d48e:b0:2f0:8965:58e0 with SMTP id d9443c01a7336-2f089655a40mr171452065ad.4.1795760205846;
        Thu, 26 Nov 2026 22:16:45 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:45 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 6/6] riscv: dts: tenstorrent: Add Atlantis platform
Date: Fri, 27 Nov 2026 16:44:26 +1030
Message-ID: <20261127061432.17306-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The evb machine represents an internal bringup vehicle with just the
interrupt controllers and a UART. This will be updated in time with a
full featured machine once details are available.

The chosen node sets bootargs to earlycon=sbi to aid debugging early
boot, as the platform may not have a bootloader to fill out the chosen
node.

The m-mode IMSIC setting riscv,guest-index-bits looks strange, as m-mode
devices don't have guest interrupt files. The spacing (stride) between
m-mode files is the same 256KB as s-mode on Atlantis, so we set the
property so software (eg OpenSBI) can derive the layout.

The SoC has a 8-way 64KB L1I, 4-way 256KB L1D, and a 24-way 12MB last
level cache shared across all cores.

Co-developed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4:
 - Drop mtimer node, will add when bindings are finalised
 - Add cpus label, for use by u-boot dts (Anirudh)
 - Correct timebase to 100MHz
 - Strict style conformance (Drew)
   - cpu nodes: device_type first, standard properties before the riscv,
     ones
   - imsic and aplic nodes: riscv, properties last
   - uart nodes: blank line before status
   - soc node: move compatible up, ranges after compatible
   - root node: clocks before cpus
   - board file: memory@0 after aliases and chosen
   - dtsi: remove unnecessary dts-v1 tag

v3:
 - Fix prcm_rcpu parent
 - Delegate all aplic irqs
 - Drop uart1 clock override
 - Use earlycon=sbi, document rationale
 - Fix mistakes in cache info

v2:
 - Update mtimer compatible
 - Add Drew's co-developed-by
 - Correct aplic num-sources count
---
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  29 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 467 ++++++++++++++++++
 3 files changed, 497 insertions(+)
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
index 000000000000..b5ed5548c6c6
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// Copyright 2026 Tenstorrent
+/dts-v1/;
+
+#include "atlantis-soc.dtsi"
+
+/ {
+	model = "Tenstorrent Atlantis development platform";
+	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		bootargs = "earlycon=sbi";
+		stdout-path = "serial0:115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>,
+		      <0x1 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
new file mode 100644
index 000000000000..9357f64bc364
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
@@ -0,0 +1,467 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// Copyright 2026 Tenstorrent
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
+	clocks {
+		osc_24m: clock-24m {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "osc_24m";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <100000000>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <0>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <1>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <2>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <3>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu4: cpu@4 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <4>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu5: cpu@5 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <5>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu6: cpu@6 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <6>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu7: cpu@7 {
+			device_type = "cpu";
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			reg = <7>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <1024>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
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
+			cache-sets = <8192>;
+			cache-unified;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&aplic_s>;
+
+		imsic_m: interrupt-controller@a0000000 {
+			compatible = "tenstorrent,atlantis-imsics", "riscv,imsics";
+			reg = <0x0 0xa0000000 0x0 0x200000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
+					      <&cpu2_intc 11>, <&cpu3_intc 11>,
+					      <&cpu4_intc 11>, <&cpu5_intc 11>,
+					      <&cpu6_intc 11>, <&cpu7_intc 11>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+			riscv,guest-index-bits = <6>;
+			riscv,num-ids = <255>;
+		};
+
+		imsic_s: interrupt-controller@a4000000 {
+			compatible = "tenstorrent,atlantis-imsics", "riscv,imsics";
+			reg = <0x0 0xa4000000 0x0 0x200000>;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>,
+					      <&cpu6_intc 9>, <&cpu7_intc 9>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+			riscv,guest-index-bits = <6>;
+			riscv,num-ids = <255>;
+		};
+
+		aplic_m: interrupt-controller@cc000000 {
+			compatible = "tenstorrent,atlantis-aplic", "riscv,aplic";
+			reg = <0x0 0xcc000000 0x0 0x4000000>;
+			msi-parent = <&imsic_m>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			riscv,children = <&aplic_s>;
+			riscv,delegation = <&aplic_s 1 128>;
+			riscv,num-sources = <128>;
+		};
+
+		prcm_rcpu: clock-controller@d0000000 {
+			compatible = "tenstorrent,atlantis-prcm-rcpu";
+			reg = <0x0 0xd0000000 0x0 0x10000>;
+			clocks = <&osc_24m>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			assigned-clocks = <&prcm_rcpu CLK_RCPU_ROOT>, <&prcm_rcpu CLK_NOCC_CLK>;
+			assigned-clock-parents = <&prcm_rcpu CLK_RCPU_PLL>,
+						 <&prcm_rcpu CLK_NOC_PLL>;
+		};
+
+		uart0: serial@d4100000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4100000 0x0 0x10000>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART0_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@d4110000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4110000 0x0 0x10000>;
+			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART1_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+
+			status = "disabled";
+		};
+
+		uart2: serial@d4120000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4120000 0x0 0x10000>;
+			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART2_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+
+			status = "disabled";
+		};
+
+		uart3: serial@d4130000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4130000 0x0 0x10000>;
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART3_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+
+			status = "disabled";
+		};
+
+		uart4: serial@d4140000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4140000 0x0 0x10000>;
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART4_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+
+			status = "disabled";
+		};
+
+		aplic_s: interrupt-controller@e8000000 {
+			compatible = "tenstorrent,atlantis-aplic", "riscv,aplic";
+			reg = <0x0 0xe8000000 0x0 0x4000000>;
+			msi-parent = <&imsic_s>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			riscv,num-sources = <128>;
+		};
+	};
+};
-- 
2.47.3

