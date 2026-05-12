Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC73DC86D;
	Tue, 12 May 2026 17:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607336; cv=none; b=WVzzeT+jxsmxYjyUjXl1S2lQ5bAQ81wuYIZIfvxo66xB49oPRyu5ZiBPqQsBUzY68yvpn0+nRzttT7WgUkCe2AP4eWd91krjC8IGBcoGImDzQfMHZKtNbi1h58B8qGn6VvjMFAzXuLw/J4o6Rl2TFMze8/hrk//7FD8dZkXI2KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607336; c=relaxed/simple;
	bh=E/8jHobRhl3fvjbk+Sy7uVr+KCQO9y+fFB42QrlD1bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTBkXJqhIAB4YebkADkFQ0WSeALblFwBeKZZNIhDhI8j4wjfzpysvMqDTNpyoEzM6DFMtcw5hLbtgF6RYbEXW7RJHUQKS94L9ulzGj6Ap2LudTlhtQQ83IG5pj8ZsYR3MhrEg3ZAWp3GokDcaw0rSLrGKkPIuD3hWRcrdrgGWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de; spf=pass smtp.mailfrom=muenchen-mail.de; dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b=67eur0z+; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b="67eur0z+"
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gFNz43F33z1r75t;
	Tue, 12 May 2026 19:35:28 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=zjlSRQK2LCpf/UnPgngtDb/bIrcKfiPvhWIxHIN+CIw=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1778607328; v=1;
        b=67eur0z+MlV0Vl7EwR7Ofl8Cr05t+lXg2dkykF9r6xI3YuFexJwQHv1GvWvh7eVA
         6xsv3bI7b8i+OM5JNIHKvQFHbG+hiV/st2BzkU/8JyFRvgI7FhCNKewkngA2RuPU
         14XzgEZdVPhj7DxkQ9OwjV3bAep3yIHVuYEqxfp5+9BsGf5NPTnFA+lcieu6fUfT
         sd5hr9sihuPsKtRiz467/5mNvKbVT1A5diECHSuxv8Se3MjHs8aQ2CQy1hG30R9U
         PXv9I322qf8pUsBKnmfIVX0NoGhJ95tK3uaof8VLX2/ZhxWUhxkTvjkrV39PkY37
         64dRHEGX+W9QbrOb8oixZQ==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gFNz24FKPz1r75s;
	Tue, 12 May 2026 19:35:26 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gFNz22wWjz1qqlS;
	Tue, 12 May 2026 19:35:26 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id LteflfIKIfXq; Tue, 12 May 2026 19:35:25 +0200 (CEST)
X-Auth-Info: 91GaYJQ+NGh0hs9G/zQwsrj6xjnoC3Db4JuRGpYVG05vX+YPLJ2uxb4ffPQYMqVN
Received: from wiesel.intern (aftr-62-216-206-65.dynamic.mnet-online.de [62.216.206.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 12 May 2026 19:35:25 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:6cd0:601b:18ce:3549])
	by wiesel.intern (Postfix) with ESMTP id EEBD279A0507;
	Tue, 12 May 2026 19:35:24 +0200 (CEST)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH] Enable wifi on the BeagleV-Ahead
Date: Tue, 12 May 2026 19:33:31 +0200
Message-ID: <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
References: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
Inc. connected to SDIO1. The chip is compatible to the broadcom wireless
driver.

The AP6203BM is a dual-band 2.4GHz/5GHz Wi-Fi 4 (802.11a/b/g/n) and
Bluetooth 5.4 module. Bluetooth is not enabled by this patch.

Change in v2:
- consider issues found by sashiko AI review

Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 91f3f9b987bc..86da4bd8ceaf 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -86,6 +86,11 @@ hdmi_con_in: endpoint {
 			};
 		};
 	};
+
+	brcmf_pwrseq: brcmf-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>;	/* WL-REG-ON */
+	};
 };
 
 &osc {
@@ -239,6 +244,28 @@ rx-pins {
 			slew-rate = <0>;
 		};
 	};
+
+	wifi_pins: wifi-pins {
+		host-wake-wl {
+			pins = "GPIO2_25";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		reg-on-wl {
+			pins = "GPIO2_31";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
 };
 
 &sdio0 {
@@ -247,6 +274,28 @@ &sdio0 {
 	status = "okay";
 };
 
+&sdio1 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	non-removable;
+	keep-power-in-suspend;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&wifi_pins>;
+	mmc-pwrseq = <&brcmf_pwrseq>;
+
+	wifi@1 {
+		compatible = "cypress,cyw43012-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &dpu {
 	status = "okay";
 };
-- 
2.43.0

