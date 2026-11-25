Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649526;
	b=wiIvAmkajFn3SmRY2ANCsVtR47CMDoe/G3kvwazOMJBcW38bCSaj+Hk8XWLReBYqrOOJ
	 A8z0s0JNC+vEy31OyGMUatJrxj1wwzGUaJPdNYLOAaHTsVrMg+dk5pclSy3LI1tGa/zZ/
	 Cg04Uu+JpXat66Urz8teUX64l7XgrTZVI8zDEQ7gjqfF9XpFrhANYIQztJFuZK8dAmF3U
	 ssPsm+Nq/xUsteRujVkSQgCboLSXmOl5ZtltRii6Cyuytk4iJAa6rbh8RzkijThZRECbE
	 WxJja4+7oJ8bt+W8lN6MgFeogXPtgJ+reFSaqdUWR8I4j/OT3qr4P4J52/j/h0mlvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
	b=MSwnbQmQWlwAfmf3Q5p15pSbDqRVeUFJ8MA3MbCc/7gLrBndk/22PJEhQS4ILoIw7sNU
	 tTPr7OP0+HYIrqhu3Ci9QXyFXWITOulPRK0/QXYqBrNH5ZKsRYUcIwKN4pxoO9HemgJ6+
	 ZofRQGZsflabVg+uItmIlClHD1il/6pvRMLllNfkNDCh93J2rULuPfqwNsVBZQLef5pJK
	 cgvTVLkE7QyaRr4omlpqaK6H5aVJaKKZXhISxVp8e2YLA5bVW5uFTuEFc24vLaU0tTIsb
	 t9SW6w0q5Hj8BriP+IywQwXDoLInhOK4FpKTkxdKuRe1t+NUGUbH0/joewks/MM/jYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g/NqC1qt";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B276606A6A6
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B276606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g/NqC1qt
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49465892f7bso4629001f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649523; x=1796254323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
        b=g/NqC1qtssT8iPVoLdhIM+ghphV3dQq7EnxQcsbIazQo9CzyDFKNSsL5M019Z4BU7z
         1fRZFN6pHoVQijRDmsp08C6b9BIWQ4RfkqanNA4/Mxpq4dUAsnTneBc6KvRVenae6kTq
         SHl9PgLpGn2meI4J9PHA1oUoNjzy6yCbu9bR/u+7/TgfMLqrwK9B8okKw/FxMS95JOAQ
         rtULO2PW3ffyv37FAmrjyghSdnLJy1uc7GxTiGRYepWjJPTVPpCBY1EMgkCn/tYBuHVj
         O5AyAiEv0j94eoE7R6kb7sEv27tiXYY2DPqLNt0e9ih5qJQ+DnHM2ZE0gJnheU5atYuN
         B63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649523; x=1796254323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
        b=CC8MV6XyWnCQri0vayRrl2vxCjbg6Gzf1BSJ5XBmI2MOGVyfDfofz/CPB9dkH7BINS
         gLwKz8n0iLl3NpUJZMy48xC3UTY+sCAMfwpg7LCbS5GNZIbcJVCw4bcq05jvH0eJPiYG
         Qp8g/EjLn3Jg79aesQnNNWqKLn14mdye+mNx00kIvmH5ldRrovU7BqskHlqAa0FXfUnV
         h5c5fcnfWJZI3pHLugs9Yby68bkTIm17/I5YxtiOmxSA1yhtaiGvKPTFK/Zt4mRoaIWp
         jz0WUyuaGsG8CiwKITTLRqL1teqZx2xPgdHplPOLM8A4CUEeqR4X5UtB18x5k5EXguGZ
         wKig==
X-Gm-Message-State: APuU4Z91NJD5NxPMi5dtRY0O3I0HsEaOFKSxmv5nf50nUGTAqnX7MXu0
	/PeOyjY5OoBUIvqeqZrMMCwP29Upfq6OUTNWmcp5OOWpQrFhQ4FXrBca
X-Gm-Gg: AZFdTZciN+H1vbs8z5Y7gUr/VfMvbZYos4T61V4XQyMupfT/4B3Pb51T2fvPjWYR5B1
	6vkp6flQfrle5AsBXrIO///lKBoV7paQjEKzb6aS1WSLlhqQhdrxrR/MlCt3Y8x9yjc+nCm4+y0
	/vlA8lspwgB4aO73JzouwBC8Ev2/tQ9ChSEil+LMLKRRZoWVZVgAYZJOjJm6F9NnK/0Viz88fdK
	jYosL2jUO1TLnnzSQXJUBRhJbSmPoS+Xn7h/p/C+v1p3Ai7zOSyHg9t2gExb52l/ouVVMeZtk1+
	AUCBQp//dWmX1UoGdcKtp7w6LQKcvSYuSNkvkiTDHoNj+HH1+r6BFygN4ZXYIN95Z6NWAeLe9nl
	aVq0wRjhulW5UMlORNgcVeaIUohSHsDe3inrIo6hGCaEMVJ3a7a1b7hTmBX+KtQRKfFTXBDqeik
	wG4fUtWbJqv+lypNXa8wnNahCGAlXp8/CEIjnzawIR/KhgSTcIKNuZbuPWs63TWc4PIQCTi4oFT
	S1wqkArJcjZDS4+ObX1OnIlqUmAJUVIpa1Af4yXnuSHiuLQuWFGjE0OsIjQMdLGFFRRjaIX6bvE
	B66iWPUiWSwTFqD0sHjdkX/Z0/7s7KkqiPoeNRBhkIabTibu3xbbtDyA7zAxqdLhIwP5EHiGLQy
	CeOTfvySdig==
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr36258812f8f.0.1795649523589;
        Wed, 25 Nov 2026 15:32:03 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm36432985f8f.49.2026.11.25.15.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:03 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 18/19] riscv: dts: Add Waveshare ESP32-P4-Module-DEV-KIT
Date: Wed, 25 Nov 2026 23:30:19 +0000
Message-ID: <20261125233020.1380594-19-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the initial ESP32-P4 SoC description for the CLIC, CLINT,
interrupt matrix and UART0. Describe the board's 32 MiB of PSRAM and
the 40 MHz clock used by UART0.

Build the board DTB when ESP32-P4 CLIC support is enabled. The initial
device tree supports booting to a UART shell on the Waveshare board.
Use UART0 as the default console at 115200 baud.

Describe both HP harts in the ESP32-P4 SoC device tree.
The initial Linux support runs on the boot hart only.

Select the revision 3.x interrupt matrix on the Waveshare board.

The CLINT timebase follows the CPU's clock. The firmware must populate
/cpus/timebase-frequency with the actual rate before booting Linux.

AI assisted with formatting the DTS and validating the resulting DTB.

Link: https://docs.waveshare.com/ESP32-P4-Module-DEV-KIT
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/espressif/Makefile        |  2 +
 .../esp32p4-waveshare-module-dev-kit.dts      | 46 +++++++++++++
 arch/riscv/boot/dts/espressif/esp32p4.dtsi    | 64 +++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 arch/riscv/boot/dts/espressif/Makefile
 create mode 100644 arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts
 create mode 100644 arch/riscv/boot/dts/espressif/esp32p4.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c..fa0f23de2616 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -3,6 +3,7 @@ subdir-y += allwinner
 subdir-y += andes
 subdir-y += anlogic
 subdir-y += canaan
+subdir-y += espressif
 subdir-y += eswin
 subdir-y += microchip
 subdir-y += renesas
diff --git a/arch/riscv/boot/dts/espressif/Makefile b/arch/riscv/boot/dts/espressif/Makefile
new file mode 100644
index 000000000000..fd89616862fb
--- /dev/null
+++ b/arch/riscv/boot/dts/espressif/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_RISCV_ESP32P4_CLIC) += esp32p4-waveshare-module-dev-kit.dtb
diff --git a/arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts b/arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts
new file mode 100644
index 000000000000..bdef328e19ef
--- /dev/null
+++ b/arch/riscv/boot/dts/espressif/esp32p4-waveshare-module-dev-kit.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "esp32p4.dtsi"
+
+/ {
+	model = "Waveshare ESP32-P4-Module-DEV-KIT";
+	compatible = "waveshare,esp32-p4-module-dev-kit", "esp,esp32p4";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	xtal40m: clock-40000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		reg = <0x48000000 0x02000000>;
+	};
+};
+
+&clic {
+	compatible = "esp,esp32p4-v3-clic";
+};
+
+&intmtx0 {
+	compatible = "esp,esp32p4-v3-intmtx";
+
+	status = "okay";
+};
+
+&uart0 {
+	clocks = <&xtal40m>;
+
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/espressif/esp32p4.dtsi b/arch/riscv/boot/dts/espressif/esp32p4.dtsi
new file mode 100644
index 000000000000..211eef62b52e
--- /dev/null
+++ b/arch/riscv/boot/dts/espressif/esp32p4.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* Firmware supplies the timebase-frequency before boot. */
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "esp,esp32p4-hp", "riscv";
+			reg = <0>;
+			mmu-type = "riscv,none";
+			riscv,isa-base = "rv32i";
+			riscv,isa-extensions = "i", "m", "a", "f", "c",
+					       "zicsr", "zifencei";
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "esp,esp32p4-hp", "riscv";
+			reg = <1>;
+			mmu-type = "riscv,none";
+			riscv,isa-base = "rv32i";
+			riscv,isa-extensions = "i", "m", "a", "f", "c",
+					       "zicsr", "zifencei";
+		};
+	};
+
+	clic: interrupt-controller@20800000 {
+		compatible = "esp,esp32p4-clic";
+		reg = <0x20800000 0x10000>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	intmtx0: interrupt-controller@500d6000 {
+		compatible = "esp,esp32p4-intmtx";
+		reg = <0x500d6000 0x400>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <0>;
+		interrupt-parent = <&clic>;
+
+		status = "disabled";
+	};
+
+	uart0: serial@500ca000 {
+		compatible = "esp,esp32p4-uart";
+		reg = <0x500ca000 0x1000>;
+		interrupts-extended = <&intmtx0 31 IRQ_TYPE_LEVEL_HIGH>;
+
+		status = "disabled";
+	};
+
+	timer@20000000 {
+		compatible = "esp,esp32p4-clint";
+		reg = <0x20000000 0x10000>;
+		interrupts-extended = <&clic 3 IRQ_TYPE_LEVEL_HIGH>,
+				      <&clic 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.56.1

