Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF153EA94B
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811615; cv=none; b=nntaqBI5MCEWycp1UUxcKaQJcskkI48A3Te64faXy+Q52qT980R8lvBDCXDmq/ilnyWtbP4g2RCezqxgTm904oyxcE73B5ViHPEUou0+Arc/PxpU1U5XIYgohgRy1Ij2ABQat0r8XdHXnDEM2Nv2r3lTdPCNmk/KZH41zGSmysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811615; c=relaxed/simple;
	bh=r/kQB8sryRY+hQAergbcUOGcrEeQF5gaq/+Enmzt9ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeUjDyBEGNi+/zIrsyFlBXKHDquom7EjdlCHp7tqZ7tTGl3h+DesP8+8CCLn8XpkNTTQ0l+sHKr56djqF+BuQcdQXFNR/kWpTtmWhXdG+BX8HWJFCl+8hUQ7YQhMcX8SiyuyY4C6WAH2BUdVGUx9i8BBY6ypv4fMPJnmuIaO7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=PoWGRug7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PoWGRug7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4631679f204so239224f8f.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811612; x=1783416412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=;
        b=PoWGRug7+KVT/2DsdMVJyutFnS9GWVBivTSeHevbj7qVtj2Ddh0KJJ4vXdviOIWe1g
         6tVpKxiRtq7RjTXH1blyyG+UQA/WZy3NiRe+bSIW3QPFQ0hkd6t5RzGCWH1pXZ8dWgu4
         gA7lmmSq3L78TpZXrJi+lkeZwsuqs9gin10bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811612; x=1783416412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=;
        b=heqOAM1nzMudWDRniN3I0+oZ7wNW6nrX4AGxKK5SuM3WvY9T1XMlB5wPu3z07IUn+x
         fapr5GDKpnxlkMwlTk3DcZ0tz2m4kjKtzatU9a6uaMnpH7JGJ58Pf8AIWnYkT++QFcbl
         G9rEvNsSHUNBqVhOxrTg2CwdrLoiBy09i6HqRtbPNKACSTRIxIweKNEjE7CUIHHbXZzW
         6C0q+20JbYnURMKTqTfgagtITKIuLz4SCDtU7jqZIoVpttXLljaI+nrBQaQduGpcOeGH
         QNe7OdzHOX0y1txWIlK0H5cKO8d9xCv2NZj5gnhtPo/xMOtaYeVVKL8sGDB6Q6XKsnp6
         k1Zg==
X-Forwarded-Encrypted: i=1; AHgh+RqKkjbDpkI33ENtvfccL3FOFNtmr4wOTrVNF4VGYblf3gkskbHjHrsreJPL1XOUUtSVvGXqLjl6EbHg@vger.kernel.org
X-Gm-Message-State: AOJu0YwrkHUUn4cC6BEEDlh7+JDrHJsMCCTLI6qEcvySqEwvQLV8LajC
	HWIl8req63r+V5PExou+tziYA1xnLvzaeDPmcWqYYtqctsZWrLCPO8V8m1G3Zy6wSKs=
X-Gm-Gg: AfdE7ck+/T9HkDsqXk4Ri/NuLhbN5LZyALFnEG5/S5O2Squrtx4fZlVKlspGXWpSRLs
	BiWzaGG+HvMqk9e09TSIaIgngJjv/laZBTHVDOdlSPTQYzAldYTuD9PTUxSp4rmjo+KIfyFSEqF
	iIcIUjK8YRfqVTZ+Rzujua3XXm8rrSbK8OAWqhLWT/nmWlXILBfH6yodvI8ZwLThnPPm22Y6da+
	igMvfT2KDa/OOPPCzq3m8cpY60roFq1x/3bvlcNNQSmfR5LYy62CNm4TTLHF40ZOxkfF6mr3bDa
	4m+2BVFyxTolzdJvlkHFoCHT5K8OG2wNjSSix4w9ol30EybDZXcOrJodHWHEY4iuY8KTn4NIXjr
	O40VWr9H0sfwJE70zsB1wG+dknQvk2vWLMIxpgYL/y2vyr8oSv+hh3zkTdWvCO6VUt8nUqYw5Qc
	uD6HzcHSu7yckTuCLfr3Yy8hFtLU9HRL8z49A1Jl7NSI90QUckwxvcXVTmxw3sSkVxE95+6PxIt
	DtQj39qaqYVatvo+ItG2c5bCXunOqII/hbHKU9gttWSV64OoABUlnFckRN0u5A0ijPPfUcy/qpx
	O057/L2huxp1OA==
X-Received: by 2002:a05:6000:2dc8:b0:474:c3a5:4132 with SMTP id ffacd0b85a97d-475de54e0c8mr1597205f8f.9.1782811612406;
        Tue, 30 Jun 2026 02:26:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:39 +0200
Message-ID: <20260630092628.1695560-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0

