Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1A04D2EC6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031485; cv=none; b=LvdIjHSgY65FglG8NzNnz6+8nUD0AE5hgsln/GpaUAYHAeCEjw8aqQFxO/Gh0JT9b8alEkBc3qHK/XbO4kXTMHFQi82dpTzN7M2WoNrMWoQgvf8AAzvfVuiRGFAJ6qP0skxYvQLp3wHn5R3iU2IYaCx05IlRdhilbS8LAsZGIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031485; c=relaxed/simple;
	bh=4xo0fn2TK5jkPi/2917g98xkU+Bs/Sy82TdJFYV28F0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfcH9Ydl9gmtEklJLuxeWnQmEch2nPkR/CZ9YBCPm0xlw6cwTKA5q1eHdWWiwuUDmGrFQYrVimYX4lMkAfv3JSsiAQxEVbR6FXy7mg9ccTFHkQ4RaiNSq+IxK7teD9g3JqyNiFFvDSiAc5aQ2X4vD2vsSZnu4nQV6ZSgG5ydZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fB1CXs15; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fB1CXs15"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eedc94d37so3016937f8f.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031477; x=1781636277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=fB1CXs151W+MJP3K/vcRysHWUZjbSvjp+FwE71gGWpyOaXgIItJkgYq3zFC8Sc7wos
         j8JGxHaM7o4n3+i1BUID3BUvU3biksjCJ4u7gaj9SIfGHwg/lWOT9Y7jKMNslJAL3c6t
         s8WSJQBiKel7f+rgEG/RnwJsXBw+LW+kh/pYtEUb+npsGsz/fjRLyiC18B0MH5P2l4rg
         /dCHF8xVfY65/ggcTptLE9M3/FB/YxxnejD8kQw7fBGh+ptXroIyVuVmWCvVQfg5QQL7
         a+GHe5E3+/KpR6Zx5XjKtmTaE55oQuGz/Ybwd71utwmlPo5jeKD7i62cBAXSvbBIfkYU
         P5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031477; x=1781636277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=o4eRvK9QiJZGyy4GOs+hibmim8SAtWc39UjLAibG5QXr8GRPMMV2nnZGrSVjG7sg1e
         23oQXVb4OsCBBUvPtRux4XH9dOo1Zz9Tn9Fe/e8rdu5nQAN9huFBIjrGoFN1O9dbTHdM
         D1VxQzzLRUTDRwcaZloM0YadHT8D1cDEHKAxKUWDaAfSD3CJjGyt2P29r1ygiagfRzVO
         JKKMflS2WlJ53JFcIBFFxB0Eg66LgHumt2sR9wJqnT1R4jktCokmwrCNGlqF+Fj+Czvt
         1zks0l8mXYowiUHTY0l5LFaUDAGq3gWfWWNtjZ5SwYogeld3JDbP7kx8Gk4uhxJP4PxV
         YVmw==
X-Forwarded-Encrypted: i=1; AFNElJ/OHMvdooptgQNaRqRLtaDlQP3qwpfOQiLtTaAqxZvDixAaYiraErPl7rGuPzkMLvv8qYOmndgMQQIL@vger.kernel.org
X-Gm-Message-State: AOJu0YxgZdWLt7svye7VkZHkFyCsMPICja5w10TRZs3nOkxnbYZ9fWsE
	PMe07RELMjGzxUFPVTQqVpPWl9boQ9Yau6dqLXWCbFHKWP5KzkfIermI/kkQYj8/YdM=
X-Gm-Gg: Acq92OGQcrWOT3d/4y2SS1qOmGRqM/PlMcLMPOVJ5dgr5EZ+WLR3nM5ZT0hf4tT2Pw6
	f7xsGwUwZn5Y18C3pE+MrQsx2Orc+pEYH/sQvrLRWgdvZuV3iGtn+XLsPuTDa6oWwG2Z4PUsno8
	1AgfhB5CG+zb0rqfrUcvpegmZFKi8SdEQ6JLvqJ5gDmr/ujW4YCoNzKu97ifFyVljy2FySZxN7a
	2SOMBDcvHgdFqKM4Kgwiv76EWsmiTYPuWanfDzpljJtU23ffYtQisd8GUj46Fegl0EpBSpwhuCO
	voySTGeuVG9tyba4glgLMcl2P4NDEwlnZoHhtRascmOw9mDA5jaAzN0Gx4vSMB+fAdAWvgIBe2B
	meFlxjNFIqEoE+1HLA0r/R5DZFrsUMS/a4T6HXSfdx0cUsaB3YLEuW254ekQ1PUCOGm1346WtFA
	fW2efHmRMrna3SwTzrnUHEU6zNfqIHgMU=
X-Received: by 2002:a05:6000:2889:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-460566bef00mr5308637f8f.24.1781031476604;
        Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm65167368f8f.33.2026.06.09.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:20 +0200
Subject: [PATCH v6 08/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move
 wkup reserved memory
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-8-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJK611UFRM0x/bFNb+lb7EWeUXvok/sYN24//Cxben
 nT42aujHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjARvvmMDD/lH5yOLgmR9V8o
 pPXCMOfNiveOhi/EQwuaWnUlG/Msahn+6f9p5QlwkJXh3XP9YIdL2gsx06ByMQOdT4zCu71XpOt
 wAwA=
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

