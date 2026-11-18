Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991408;
	b=XHXrKb5kBPesyxCHCav0Foj+/ZkcDp+jkIgEmYJmWC6Qjfy12UGJepLae6DlEvkNFP3T
	 JbHV3C8IoiW6SxhcE/zkpY0nfoxDyfIOO5hEIL1sMqvK0cGnjvGYE1ioh45+lyBev1/Ay
	 v+S2RUKEtB5lT/caGupZLocNbugpv8VgcoasiQDVwDfl6SXmGiUvKHb8b9UqXCvLb0El9
	 kNW2V9fX+HkLN05vjleHaN+588Hdxb6/qzzGLrxXqAybkSeChTizNRPIiM4VczzJX5P+5
	 DP0Ssxoy+kEo8TSg4zTeVGOiy1AuH7csjes0j7wkvIXKLufjNxTnE1mvjf0P7RNpjCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
	b=c/9IA+sUP/C3Ckpyq6Q097EHQ5UIGdys9bYAQ+MKfBuwi+Qms/2XSb6iExcfUcr1OZeW
	 MI63rRtqRFLm6vdkedtKikn7vmRFTXXHAVBa+XuOgFkw8IHCM4YVdNk/2GwMjQvn7srpH
	 2vctZVMgiwDMlLMkfSzKzG4l24/A2zr1rZxmKIaTQPm3Prljk/vLvvr52gZZeh1QMYGZ2
	 T76oH9pe4C8G4p2Q/fTxinoYScZM+b2iSwdZzJuMObtO1MpjIR2fdc7Yqv6GlH6ZaVv2J
	 VaKhXWVnYEETCGvZ8Gom/rtDS6nxP40sbRhmXP1qywpkpUO0mJ2XHWltVA3nIZeUrAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VROO+ogq;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAA0606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAA0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VROO+ogq
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1096218eec.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991408; x=1795596208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
        b=VROO+ogqJns+EnDqW36fjRmBhLzkWPI/HFbzhAxc/QY7ljuFYEmKvs8XqVIstQk80I
         fDoDHKYm5Up2k3Drer8iyhxSI6shDDVDBfmeu04gbICfE5mnOVgcIn5GPtMMo7C7A0uL
         ZuvoT+LuFzbjL7cBRKInQd/+X4cX0LOxoRhK+iqVdaqTONd4qF/hT404TL4MVGZznlqc
         jxsZLbCWIxJfbdSC7+1u1QyhhN8r+CcQY5IrrjofoZV0+Awf5O5H8xX23/ZknNFMVscB
         /Mr1yf3Fdu7B5P16Gm9aG+opsZmJheOvizwbnYWFDwMEVmbvnEEZOZRX3F5mzOMw+8bT
         SrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991408; x=1795596208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtXMK7nafDq4nF/muvbhyZHVq1+wfpdpFg6fV8GOli8=;
        b=wy4DdePIhiepl4Sb0K1HWrPC3Riw7cchcdPPjf6F5WKcm918JAHmwwgPKdG5azzVPu
         SMMl6NDSz1746cE2RRtHVyGfkdgic1XzwTdflb5BG5tZjMa6R76wjl4mHrdUvomxS9LI
         Rhda1RKzSrLMAeDPvJ40qXNyfTPs7rPmgYS7WZtbfSpdY8LfBjodAZycaH2c7xPFaAB9
         VXIUJyn9LfQHKNbG3NRgrDXGLMu/1/7MAJarQbBFz6+bByhSSpcXlGUT1tnuC1T51G2K
         Aa5aJ00VClVDKEA6vNbhKV4F5YyE3abImX5pMjF9hDy7INSlqvohDg9yK4+73oL57ptn
         ebgA==
X-Forwarded-Encrypted: i=1; AL+hErG1UOVcj9ccxnqTEAXe2/0/tmLZoc5EOsX0BSLPUCjV/AE6K1nwQbyHQDH26uuQyGn25PzZlrn3HbMS@vger.kernel.org
X-Gm-Message-State: APuU4Z/0TFzX4RYZIsop++xrIuT5jvq1j8fn65nJJA+hsP7ZdQyI8FYt
	lSwV4WaJSlD8k+7FKgt76Vv9oXRwOkGEdUkQjUI7VtHhFP1l1l8Cp4pL
X-Gm-Gg: AZFdTZdEFQ+YnVxU7huei+MAgxEtGyozl6psvQZWr+URLDn0oM4mYYfaATgnt6ZsWvO
	mIqLucXz0EqJsQ6Ky9eLEGjBuamuIDQTP8Wdc2wAzxeDn18kVaEk5fiZpvwyYflm6s3Z7xh2ANZ
	ABMza957hdbbeTLQ61hxWRqSzosaliPTRkyeDVX5XtEVihwfgUUDKQBHdf+4Gv2/UDUkfLYVy41
	l1fzTT6zW+pZmKecCnqg/d1aeYGr3Qx4G5wruaO7UYxCdx4/mP3U1oo21x2z79rhqUyYA6JY26a
	w2II+8aE6ozX5YzfCuOVZ8VLACJE5WjnXcSBrvyk9krDnQpzOm7sJOFRPAchDnIKj46ZQyOp+Zy
	9Oq/3ldSe5H49OJ7RssqtSnQCQuyJ54ydzDFFGvamVKDW1ARNoEeXexFrVrhNx6rdm3uhmqEPAF
	ECyEP1laY9ZqQra/UsXw0hGfjM7NQl6pEZaFjYcboUaJJs0R26Fe1lpYa9X2CD47TI9LhTSc/pG
	3dxo7bHT4TypURWErWhgJCrI8VZLT5tMRLxRoqaeM6oQm3u0tL04Di46Sti9FcYhE0kqorXsdmo
	2c7dfB2RHK5CSNYXAU46r7NrJKBrTrU07Lo3fZTMK+XSlK0kIP8fmUauxnVK7Zt5zjAL98O9h7k
	F3nEfLA==
X-Received: by 2002:a05:7300:d214:b0:382:42a:d3ea with SMTP id 5a478bee46e88-382821d53edmr1784295eec.29.1794991407621;
        Wed, 18 Nov 2026 00:43:27 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:27 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:43:00 +0700
Subject: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Note8
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
8895 SoC and a 1440x2960 Super AMOLED display.

This initial device tree enables SimpleFB, PSTORE and GPIO keys.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f1946a95cb42..1faf01dab180 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8855-smdk.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos8895-greatlte.dtb		\
 	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
new file mode 100644
index 000000000000..a7cfccd59bf7
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy Note8 (greatlte/SM-N950N) device tree source
+ */
+
+/dts-v1/;
+#include "exynos8895.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy Note8 (SM-N950N)";
+	compatible = "samsung,greatlte", "samsung,exynos8895";
+	chassis-type = "handset";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer@cc000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			width = <1440>;
+			height = <2960>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
+		pinctrl-names = "default";
+
+		power-key {
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			label = "Power";
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
+		voldown-key {
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		/* Bixby key, mapped as a camera button for now */
+		wink-key {
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+			label = "Camera";
+			wakeup-source;
+			linux,code = <KEY_CAMERA>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c800000>,
+		      <0x0 0xc0000000 0x40000000>,
+		      <0x8 0x80000000 0x80000000>,
+		      <0x9 0x00000000 0x80000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		ramoops@92000000 {
+			compatible = "ramoops";
+			reg = <0 0x92000000 0x8000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+		};
+
+		framebuffer@cc000000 {
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};

-- 
2.43.0

