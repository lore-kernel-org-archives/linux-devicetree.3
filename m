Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32114311C2A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940416; cv=none; b=D8Dk/F8tjm7/8D+C+A0lVSwsf7QcAFB/pLO4lr+2aEghVqsPWZei9k6FeCOYxC8zofLVL0eWdsDcBzu97V53H6DBuJN/fbF7ull+vFERUdUS2t1DBpgOUFi7Gf6M5mtuzod8HJ6HKjsoSPsNsDMHXSG9LdZErfbATSBpO5j+5jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940416; c=relaxed/simple;
	bh=EJje8lUuFajupSCorMcXdN0C/Kv0EJmkV80bI2nUd7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xvhq6crQ3CHDHeAib8UC6njZ8IBzhBZg+LKFoD8W/fivfNixW3zQPlgc3fNVT0DAlh/6lRakPTaJhHksBT1gGyoYtlaiuU92f0MPOT4fn0orgY8PzFIHqm09GEQNQrtowfLFqPZZZRDESyzgPwSPdwUYWfb9AveyRVDAI3fFriE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=X5ZUZxOI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="X5ZUZxOI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso1113181b3a.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940414; x=1784545214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dT6625sxT9u6/pwIDim1PTSaGmJ3x8vyuHF6KsxdV78=;
        b=X5ZUZxOIfNvwiIWqeCH3Pop6rEPsi5wRbIgVHUWdvckqDwu4R4T/J91eLdYpHUcS8S
         2FheXODuGpeLXlH7AbVA11lLPl1a8YEsGGyg6m2u196bAFkziyzna26nrKloku87nwMW
         CnV5IVmaMQDutsZwb/iSUU3aFEpUCTPBaMkjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940414; x=1784545214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dT6625sxT9u6/pwIDim1PTSaGmJ3x8vyuHF6KsxdV78=;
        b=Hm1QSmNx3c+gxTXLSE5GHhlnE9WW7Jj+R1j7JDT3YF/z3DiAYcdzqrLKLbOighXDLf
         zCmjVFXde5SLA21fik6EwXj7bv/3tYDt2HLmkkwsHcZQRHR3uGThkIHKEFuLRNNStBwF
         SGHNOZILbYNWA/hQEQ475jHhuSi43f0SSRcrrTrWzTXcvVquIf63kFgHGU2ItM1MQPcr
         HeF1tjfY9YJCDa5rHFudiFv8GuQO78znEuCXDMxyt+3fG7p8zckra2Jse/SUjybrhQrM
         ZCQae6IByEgGpq2KhvM/74zAgTlpoi2JbZQYvAhNgrj//vyW/9LL2TZilQA+mPL90w0n
         eWOg==
X-Forwarded-Encrypted: i=1; AHgh+RrUk6SYDjaISrnMXheyZTGox7LVDfXnFP7k1HyEidBb6OKddV7t4U/XeZGfslqpLawNdNNcPA3FjNIr@vger.kernel.org
X-Gm-Message-State: AOJu0YxLl9XTfXuCzhtUEZOQe3wbNcfFgLAcjALH+9JDeTlcDjxIru6J
	eR2JOcVIZ8kn9JhNXbtj4gc1sFhAi+PXPtWj6fG+kv/6637x4MGFvIz0G2NcSxj9qPs=
X-Gm-Gg: AfdE7cmd1HyHBVShHZeRC8hFhITYwuvcNLaEXLM3Ui4VmWvPuu/QhhE+7kC/Yxh/R21
	UYEz/tACcpHEG2mmdRYo4fMZSvjIuG4ldM6xcZT2RWbqnff6KTrAg4YPoVfxlP7TMYPH7SDKxPj
	oKmZjXAMsWKIaXB15ry4ZA+ebL3WlMud59mXAITA4qOJH9pzAPsMRcvWlx4XmIiAyReWHTfTtE5
	+iXbbOO9BF9HMoTtuex2CTVaOc/wsEDsWo2blbVS27AMO6IzjVYdYjzYQmMRDMiYWJNb2AOas8s
	s2V1YrIL8D/YCOVx7C/mlZTgL+oag46Vd/QmTSuazhzmIhnbrPEX5SCgA6H69FdYQ1iIg+geKxx
	k3rYDpebmshgD6fmkrr+nbWawIkJO67zdW7+AZcKV+rTbW0Lr9chc3CDY4jYcczDSPuSW/B5o+4
	NMeT7JkLpxl0utrX1MXotSs5Yv5HMdvpSvYIuL
X-Received: by 2002:a05:6a00:1f0c:b0:848:68d7:c673 with SMTP id d2e1a72fcca58-8488987231emr7672953b3a.47.1783940414281;
        Mon, 13 Jul 2026 04:00:14 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:13 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/8] ARM: dts: mstar: unitv2: Wire up LEDs
Date: Mon, 13 Jul 2026 19:59:43 +0900
Message-ID: <20260713105950.1346962-2-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Palmer <daniel@0x0f.com>

Add the red and white leds present on the unitv2.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../mstar-infinity2m-ssd202d-unitv2.dts       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
index a81684002e45..f02de5b475af 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
@@ -7,6 +7,9 @@
 /dts-v1/;
 #include "mstar-infinity2m-ssd202d.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
 / {
 	model = "UnitV2";
 	compatible = "m5stack,unitv2", "mstar,infinity2m";
@@ -18,6 +21,24 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&gpio SSD20XD_GPIO_GPIO0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "cpu";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&gpio SSD20XD_GPIO_GPIO1 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &pm_uart {
-- 
2.53.0

