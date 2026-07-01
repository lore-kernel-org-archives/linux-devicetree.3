Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0B47F2F4
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909661; cv=none; b=b/i33thLAjQ9CXPqbvSmX+WuX0ibCpWvXSJy4d3mZxM4DpBIMGufv7+fJocaCWLRWH2S0Nt/ShkXalZcmQ8tqyvsSzvBP0ROJY/oV1VjO7w0GtJ20YeHHTlbkvkKXcWWmAb40Av6INo8lptiduMhbmFC1JwLU3vjz6QyxkhV12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909661; c=relaxed/simple;
	bh=4xo0fn2TK5jkPi/2917g98xkU+Bs/Sy82TdJFYV28F0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uc5rr6d2Itdq7x5UuVWlrRE6xlOHl9S9O3pDguvZLKpHotmJPhrxf061pU8E+qf55YtmnRHsKWgAJVbWMfNAN1A7INM+boRs+JS9Gm+PRmvvTZY3sOSsoH8COqYVj4R53ltxBt6P5UmTP3YSkXZMAc52nvflxWD62R/KKlAZ7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mWykSBEa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mWykSBEa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so456238f8f.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909658; x=1783514458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=mWykSBEaksHQ7qq4F6NOLL1y8ZwBxQ1JGPQG9mjVh7vsy3cwgoOACjyCrLBg67H4gG
         3yOcVhKjnVXLPGwoQqmunujxdiTmw8nH1+6j9fFQakdYVWFZQnraEnGe8OiPQv4F2vr/
         LKPuTnmlrghHrOZIVpV2PbVbXOyj18v9MdkA7/+56e3V7LeGWq9P1YmQtBXDZHVsJIkI
         Gf0e/+vV81gBANX8ae81JkUoA9ZTb/1Wj5m3AbKPsED6TyLBpNZJZHj0nzCGul1y/DTF
         0/JbKS0LCWSeDJ7/FH3nLBw59ks2QILAaefOUgFgv4ECFoB3TXqSX1kQMCJ1muq4H7LF
         jjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909658; x=1783514458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=qWJb6j6Gtpa3WeRAkrJUk995S47SSL0OVshjLQBp6BpBjwZd/9yR+9U+x7JC9IuaOx
         usGPcFE1tLRLuf+mmIJ4yMUnj5/lJY4i0EuOLqV5lpZAlIN79dYiRqJSVYLiLKzx/xPk
         4UkJ6kDKCi5Fpx3cPiZyof/ioV+9zgKFOVqjlvkpuZkgd+bD3Iqfu67ki40KF3XwTDTw
         y/TjrY+ovOR7FpcdCLauoR1x8t3ZaZhzqJC7ThoUUEow4dAJVkbYGUHhcrsR5BXoQ9wd
         Z9lBTbXyeKOjCXlsRFux8VK9u7+Ex06ZGPgFsMKc3jGe8XxiQTNRwPnWB5kYLfm2ksvj
         4hxw==
X-Forwarded-Encrypted: i=1; AHgh+RrwpdeytjgDkZul+HURurLwJeIgUKFMQ/GSVi4AXyQBWg6dFdyJnYxCt29pLf9wjQnwbXaQy31XjeWK@vger.kernel.org
X-Gm-Message-State: AOJu0YwStIWVKOos0VfHX+xfuSnaTol6tPNjEIdoGajcDVenGX7+nvTN
	X3p0ekk4FtdUlSeumStG8t+2d5wMIWeAI3FRdixvQrGYBg3da9y6TQKAh6NlX4MsNAM=
X-Gm-Gg: AfdE7cmZu78y1Y9ZzDlp2vfsFzZuWLHFZKk9zRJzimFrliPN3K8dg7N049CXlhoDGV1
	wdOzFw5D2NWiIdZT905mcxRWX4FssHFZKFuuBND6SJUYCfHQBSq+bGC/KTRqV9r3hlcIXNutPqe
	Gw11j9OZQx0VchPCgmLL2X3hHyklYXh0w9ppi642Qzth4/MERJXCcpOTkpbUV0jvMkFJTIiqvsP
	HPeCjaFJ8V+Tvfi3FDjhSRh1dGbsklG3VYGY7USXBDHyxgHVJVo23ZCYBwi429Y9Xx3mxRqVHmQ
	IDY8rQfgXhWXuyDNnHuDmKmDTMy2U/8jfuNzDBR+cblzgCwm/n+NstFSw00ROgWp64C5C7/m1BB
	FIsDTTQLTG67EXX+KYS475vdQko6VFsReVVyjHewY/IzV5ZnaGWRXfq688uewCGYtMTiq4b6+xM
	GV5J0VfEISZg==
X-Received: by 2002:a05:6000:4687:b0:475:e015:c2a with SMTP id ffacd0b85a97d-47757e57e6cmr1834835f8f.8.1782909658387;
        Wed, 01 Jul 2026 05:40:58 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-476792758aasm9625791f8f.11.2026.07.01.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:57 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:20 +0200
Subject: [PATCH v7 08/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move
 wkup reserved memory
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-8-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4xo0fn2TK5jkPi/2917g98xkU+Bs/Sy82TdJFYV28F0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrvXqwpH7ehcf/qivasnx8O7DphXLF7euW8/L+7Tq9
 IJNKXzJHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRjUsYGabrp578P2cm0+Kk
 rTavo7Zv2T7v6jTzEzNCXfQS+9yMtj5iZPg/83jIeqZdjI/fZMyYxbfyfs375+tPL+AOUltovXn
 qik4OAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 12 ------------
 4 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2d8308b637f3064c560e485ed85f2..f77651109564224408723b72baba93e39a82be07 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -17,6 +17,18 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
 		reg = <0x00 0x9b900000 0x00 0xf00000>;
 		no-map;
 	};
+
+	wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c800000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 8a5ff5c457579c7b1be7157d235fd4b4e5c6af11..49c78b6b8b2b43fe381c761823bbd93725f331aa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -161,18 +161,6 @@ secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;
 		};
-
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 16549fd7340a556798cf5a242746c219d3168d83..6444aa0c106197eb44088ec99d7c7dba7f8f854d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -49,18 +49,6 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 1408c970f1942e8a720c9cf071b2f49eafa9db5e..76295e47eca9d6373a89430355330c9a4ac9be32 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -63,18 +63,6 @@ rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x00100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;

-- 
2.53.0

