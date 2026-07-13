Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A8311C2A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940424; cv=none; b=nGbNyhNP0ZUgCyf7t8R8itedNzDpoVjaKdnD2Nt5i+WhkHtCB8221yelTTl7FLB4uX/NGgusKc7wthW5kK9JyFH+cgNImCuBVsSMuWfMg4sTL22pnqyYolmceXQCJ6Zblz9lZwLSmX6av6xc0Px1oIIMHzxSsifu7y25AYQk9L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940424; c=relaxed/simple;
	bh=8MB4E2UurTrMQQNKlrDKnakx6TBEowVKPcUjoB3PzW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scLMMTz+FYjjU7xFpy+D7gSA+M9EXrzqTfYO57bFlsruHgiO0G7x7yx1+APmx5UIGTChzH7BopM2rbczwI4kV9lK6fiKIIMk1cwHQe7vbCZNgGpIRLCO8/3HCMTV2ev9sXaNGGzEWEKM8/t3Ygvew4QpSpJpJYQ3qcUeqbetx6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=LpHBypps; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="LpHBypps"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848882fdb18so2101753b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940418; x=1784545218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ5iHgXe68coNKsyjUEJY/KvBzACNRTOom6/ZK/yLLM=;
        b=LpHByppsuP9L2eJGFtNnAQ7xjvy9WFCk0rVXp4gKT61laeq3VIs+z9GvoFk70wra7g
         +wBZm47yB/1Ew+CuQnt++De85xUURsd2pkkRRWPs3kmD2BuPy/LtQpBHJWco6cgDbQ1w
         88sf0dpte0VfDO8bjrIAJ3nUuxCHVvzTiWm64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940418; x=1784545218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ5iHgXe68coNKsyjUEJY/KvBzACNRTOom6/ZK/yLLM=;
        b=PNUpS3EvGMyrejcjqRkHixfr/XmnYlLfLyN7bb8hqWEXboDRrNNwqZ9axe6Mr8nVZS
         dGIWNFBNilpiOoFiYqduYes87RMXfnEi3+YtCj1y1lVzT9qFSIgVHucDfUu82+Y38aH0
         TwgfI4XI08AwL+T4Ew8IENdYjQU+FhYb6w8w4EEQNBConVn5wIc5GSAQMGXgFESJXtzR
         q4XYirEuRe+tE8jNaAb+O+xxZCh1IkA/CWIcSWcMuojVYTBvErF6e3eV04asHmvqX94G
         X9f4WR9F42Op1LMF2KbTsbyY3y0uDlgN6DfeNBBzDtxjZOWKps6KKeDhdVE34vhVWRLH
         BSUA==
X-Forwarded-Encrypted: i=1; AHgh+Rouuh3ZdG2M+CAEr9ARGPIqJk0HkcApzwGzZj+k4wXXPLzlYnAJZeHo5u9ufC9fLP4ZZz4pP/hqk3KQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx25mWZY+aXbQyUbEWRYnAJMA2s40I2xfCeAvczWANdwvQeYt5h
	R9BxDqiHm14BZBLInhz/ov2IXKcWDWIWvU3b8lWHWuWngijXW1rCxWbIIZ2aadUHPag=
X-Gm-Gg: AfdE7cmevdH1WkvWMuJlqmy4yeByqDOdYe+QvY6HiuIZbtwJU6OzzhuUJTg2a33rPxx
	sjkTtChsoo7aBHQu5ZLTUbykafT1C62n9RkkWHRgYtKQ442E+q3DDH5YSmscn5X5QPsZGX3hdQs
	I5tHXoj+2YejIBSvxix/Hq9kurKvwjc8DQu3W6bnsk0d6BzBLNp0wDzi57dVw1k+MhvYrBQNTFE
	0K6Hvyd+1tJexyfmpCHJrUlcrBcKtKZKXdaafmU0CoKy3QtYGHePc/geZ9lj9knourD9O2KoaBm
	Ysz64EJ06k64+ZOcGm97qReyzu3suE8/KCgdMwTpaPwLLkjQcloPBf+gtbjhwFCaEtIeqzD80Ew
	hRNZKBoUqbkRj6IuH66g4GbN2pCL9hREz5+XNPVBIeMtxDnRPeoPjOggxc5ilf64xkFTxEYckOV
	a2i8xR7ZYfkYZxuNTI5iZM1UuwwNmfOLCPvJWjLEaBZoPbc6g=
X-Received: by 2002:a05:6a00:b8a:b0:845:e9f8:67de with SMTP id d2e1a72fcca58-8488965bcebmr7867993b3a.27.1783940418459;
        Mon, 13 Jul 2026 04:00:18 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:17 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/8] ARM: dts: mstar: unitv2: Add button
Date: Mon, 13 Jul 2026 19:59:45 +0900
Message-ID: <20260713105950.1346962-4-daniel@thingy.jp>
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

Add the front panel button as a polled gpio-keys device reporting
BTN_0.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../sigmastar/mstar-infinity2m-ssd202d-unitv2.dts    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
index 5e79819a070a..b5a282cd1a67 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
@@ -8,6 +8,7 @@
 #include "mstar-infinity2m-ssd202d.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -40,6 +41,17 @@ led-1 {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		button {
+			label = "button";
+			gpios = <&gpio SSD20XD_GPIO_GPIO2 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_0>;
+		};
+	};
+
 	reg_vcc_core: regulator-vcc-core {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_core";
-- 
2.53.0

