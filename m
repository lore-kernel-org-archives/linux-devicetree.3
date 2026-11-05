Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912865;
	b=fPYo5EU47Vss3HQvaMW8Jpmj1kM74giUKJLYx/aPkr5+CVmF1Bz0Xl+UIn5I9nhtSCO9
	 FQVNAwG2tusI0jACSlrft7kPKdf3CxiJ0K0K7qUfLkHgfPFctqSemhrGM9EKFzRsEFl60
	 GPjf58gAThdqHGoUNcsomDNSEi03XgCQVnfxPfwy2bNzT76UMW2t2rfliP19D+1nk6obP
	 XItyLP7L59TRn3UDR9TrZE6CG5lfxfB+5bLmcccgkCLI7zJoqjxPMDxUvFI1fNDwUdyEc
	 oji0osX4eZQBH19vxUY+kn86UARhYJQbNdytMDHceW/QW5tfdL2jdUJTootfATs3iPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=;
	b=lhQNUw1qgclq5VprJJrQb2aHKAdlJc5Lx1C7bZrWUWumHrp3vEd7+YDtfObm+qLf5s1b
	 7lEn28v/1FF3+ITq7/uaSJlEPg+FdlsswAk1YgHy0LvtKYjE/rJ7R7F8PrGfTjiUxlROO
	 5CE4yH+kmAVY/K9j98m+tkJw3z3ptPupz7W6r3dZ1MQxsfDt+chnPCsQgYSEefQXqn5NZ
	 5qYYgrVUZn7HCviTD1TNhajZzIIEJJHvcsh8mOcG3cagG28QHCEVY3PZwPw47MclmVSUs
	 3Fg4BipVPaBqSD2zfzL+6UKmi12+qvAyFFqFVG3RnNmfrGHNKJENn9SOfzLFJMKKdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVbTYfMc;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B23606EE96
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B23606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVbTYfMc
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2270086a12.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912864; x=1794517664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=;
        b=wVbTYfMc2NycTeVAmLq4nRIOCydobQyMo97/MS7yXoZ6GJ+6wfV+KGsmoou8d8MCtd
         zPUGIlMzQbJ002yoRjm5KaRgtGiFBUcuqHJLeY9yvFkWxojka6y/KhEdvswSUaqocwYO
         w73K6UnCHcQKTl+a5YO5ztbLvoxu8LQ4QhmKgy7yvMUn2bWm5cjk1dJi3jyAgE83Yn7z
         nkGPMEWcGlwz+xbqOQqBWYPH6je+Ir5Qp1jB09T4yV39OxxnVBy4Ai8EvlFOUKzQAzVo
         /F0rqPECyrSgUctPbAi0JegStEzuuKJgdLIVh+ay0Fz5ydttEtCX/vzn7t5c8NixLOuA
         j5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912864; x=1794517664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=;
        b=pTImUKFCXsd7A19QLhUQllaxc8zOeAUj+UOPxBVFK4m8tW86pfgKUkIeSvv0Q43KAV
         IgCkPrGs+GYAIY89b3a1GAxtTl2Hmoyc0k4OO3YJI4JBu3U/c707XZ/wyZAlInIs/J1a
         /5Lh//sHfKOz8LUgg/WI2H45Pc7hK2OfiI6LaJ1BPTrR019OXOsK6fcDIj3nSH68aPek
         Sd4E91EHnpgA8ng9HM5Xc9yZPclJ3WptQMhUZRnZPMuC8IFDcyrNMrDANlyJH/OeYG3M
         TB+qeGtv9LHEVcNV2mxqDbaM/V9QRinUu/7VI0tU3HvjBCIvlBMrO4nyikpcMjsZWnS8
         IEvQ==
X-Gm-Message-State: APuU4Z/k+bOcS3sDNGXPPYgMd3JkW+kKSv3uojQfWoxxKNON+Kry3Ygd
	mr9qli1F3FjitUhvbYn7wuTwoSKzk1sbkV4Kslefffxyl4OS3YcGQMGjvD2gTrUIKDP/8+RJ
X-Gm-Gg: AYBFou20E9JGxTBlCYgfYE3DRlJDpvy2zravHjQw5SSh8VCZ4MsL7641iJcVOtvuPnu
	nLZ/ur0E41IaKPzTCbS40K3VFT3EfX4acUZ4czLEhuoSzKTIME6HiYuip6ofhlf2ocBgIqKkcR2
	rCDtECtTKxSD/zS5ZUXm2sRp5CFN/hsxeSKr5lssBE1m/WU1oBQi3AtuKgSfi8PIW4Y1UDxS+dN
	ZFzpLGm6YCX4jOuu5xpuiMm2BpvDDg5o5GdLTCRW+7EzkyhPlw2Cin3H2LkDqIJyVPaX6D2Nrsr
	Qa1aQpxD61UsyaTxxC6lNIpNKUn6PCxjm4YsFnfKEeL72tveXg6eJbqprRD6Dj6IJ5PEv5g1imq
	MAy8CuKsEO9kHDv7m3jdvp6W+p+PheW6rOKeX12JYjVESAOGYyE4v9B8XovmdH0C/sXmcdZGHHC
	NsXIC16IhO0VUDWU6CyfzxfWDVu0KMVwSDCtGkPNsoWkbsXSrHtfLUNPoV+tXzfxdICJEvgBsJX
	SosX8/Sfng/Cbz1d+K4t8Dw34BrZyA49OMhjVaZpiBX9gw2eWaNMjrCuozocYIvIMHaODwfQya7
	LSpAD/KSHa+OsO/mmUy3uk1uglC/tv91XqE1uruR5Fdp8ezm/w==
X-Received: by 2002:a05:6402:1ecf:b0:6b5:6478:a9a5 with SMTP id 4fb4d7f45d1cf-6b5977d8c85mr324805a12.10.1793912863653;
        Thu, 05 Nov 2026 13:07:43 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: mediatek: Add MT6895 SoC
Date: Fri,  6 Nov 2026 00:06:02 +0300
Message-ID: <20261105210622.523747-5-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add initial support for the MediaTek MT6895 (Dimensity 8100) SoC, which
has four Cortex-A55 and four Cortex-A78 cores.

Describe the CPUs, PSCI, the GICv3 interrupt controller, the architected
timer, two UARTs and the watchdog. There is no clock controller driver
for this SoC yet, so both UART clocks use a fixed 26 MHz clock.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6895.dtsi | 166 +++++++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6895.dtsi b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
new file mode 100644
index 000000000000..c80f30da7bf9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt6895";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+
+				core6 {
+					cpu = <&cpu6>;
+				};
+
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	clk26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			reg = <0 0x0c000000 0 0x40000>,
+			      <0 0x0c040000 0 0x200000>;
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		uart0: serial@11001000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001000 0 0x1000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart1: serial@11002000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x1000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		watchdog: watchdog@1c007000 {
+			compatible = "mediatek,mt6895-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x1c007000 0 0x100>;
+		};
+	};
+};
-- 
2.56.0

