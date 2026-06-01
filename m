Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76C2225397
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303620; cv=none; b=pldeB97j3XRbAylR9dGKhLoa/a1p6Qlt/u8SVe250wamwQJErKHMbU7hqDIhp/NPh1G4vuDGHWrSkFOomLo4KLQ+ffyGyB0wbZ+0GwvOAWibvVQMo8RqWYYRxUO5SasLZnpAeYz9C/cYPVAe+FqDloUMHR6NN0ijSQVL5TM6TmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303620; c=relaxed/simple;
	bh=AoejhMWFhhzgn/Oz1rWsnXYdKgFZw/QDwGfYGclplaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjO+wzbPpyPhoVPP4QFvv9RLiUQnEUZbjKSYiHQEnh2UvCxmMTtWBti956vEmv8S5fhJpzQvbTBvJqQ52O7SvTTgejH1UPyJFlXbrhwNOJlKaNdbGFocxlpxJxm2v8FjfkcHRezqZsR0WjPsa0G5+YgXr6j204U/YW/G1yfIp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aIc8l0Rm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aIc8l0Rm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eee266c6cso2608091f8f.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303617; x=1780908417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC0UVsmy6URrMQSSCL/Ft5Q+Xpgj2pACeOoCZV6IJH4=;
        b=aIc8l0Rm1Bsm/Pjyl52IhIfO082unliVWrw13DP3eBGaazvbNI2GqHvvqfx0YCkN9N
         wzMhE372z+UbIrcIvNbz1wpnlDmigYHqoPPWs6bqwP4uDGbOeqtH/rtMLglcZcwB/LZ0
         8yFJMpbKl/9gDp9c1vetYwYAo1FxSmXQqfQp1ldQ1CnQpU9Q6Blz90xkKpdMZ6w7tC2K
         k8K+QtJAQoVdTuGfnAo0xUO41RiBclWuNgMLFHulJxmmITAOj3tjzNb+2m5MKTyOlcjt
         YZGCenGviTuMb9Po+M8iuo3c6dzxsOJ/Y8FzHcpqui+uM1IWichUdPywE76Obq8yD2aW
         oz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303617; x=1780908417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GC0UVsmy6URrMQSSCL/Ft5Q+Xpgj2pACeOoCZV6IJH4=;
        b=AwTqp0+aEOumDJMG12T2qXw1p61OzC0c5/xYv4Ry4fb43mbckvudXe6vhgBapuItjY
         D4r7agJq8LBOrVKgveaYzUi65thTBnQ8U3GbI76XctAKtwPErbdq4e3z3BqkyxelAIG3
         yr16FdYc7rMumX+wlp5Kub5uQZ7NNxw9LURLLTp9tX5xeOIJhjQjfJoW6qSkphbpqOZP
         HkQRdGZ0s3eBavvtoHgqnO1WF6eMl/rje2to7P/Wmfy5kVWt4MF2JB4ROjol5vZKC9eP
         Gk2v3CKm2iPHB+inR/nt3s75tp0SnG/9BisjsRZ4GL/CYI6GXLCDbuBoJIKBlB2r38Yd
         p6fw==
X-Forwarded-Encrypted: i=1; AFNElJ+af0Eiyh8VsvVNZxcBZE6keiJh8cT08zQJeDSkwzcZbAn/cPk844YGkQkMSSBGFFLVL7wA6FQzDqxn@vger.kernel.org
X-Gm-Message-State: AOJu0YwUh4FFZb6QRiLGlNlJ2AqTdMizQXk0+qErjdJp7saStfj3aiXr
	X2tz1Q8IjkW9gY7dnYAMf4s5AJ5V6MJdY+J3eIVmg3xLrY7gTa4PyH19lBfWZyDhu10=
X-Gm-Gg: Acq92OF+azP4jkFvqKsXPHzevkgc1F7LapjS4D6y9b7EGmAUdi/oiv3ArGcKkj5MJ2F
	QqnHhypcDjdH5iG/7Ufl3sNIrxquUgeK6JLmDZu80+EZgC/tmRYmHxsjo+WyIvDvcTziAHoRMFD
	oWRJ5ji2QPgQcRyguGI09w5/9avaRdYYX/fkKLCkrpURzVY13f0SzRE7aIDgU6JSuicB0oF2sbM
	ifcCpyIrY2P2cjRRP4ER8Ek03ClTYRPLAUJlJ5hpl+mRLnUNWiTIYU4Uw62+bBR1ZmmlVF20ltM
	iwjeqjCEvVyesKfJXkbUCHx1+ZH6qCSkrvBD5zfEQhaMtHyFmBnHuDszSJnba5QNkUjemMq+GVX
	D2gTbP4Cn1m5FU+h8GyuNse9JQ+I8uDsm7N6bh0kyYbnwgfoYCnO609Sabxd8Fh2CfQq78U+v3t
	9y+j9qezZc9kjlqUep33Hq6+YQKE6KClo=
X-Received: by 2002:adf:f690:0:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-45ef6b8043fmr14522597f8f.35.1780303617148;
        Mon, 01 Jun 2026 01:46:57 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0403sm24643087f8f.6.2026.06.01.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:13 +0200
Subject: [PATCH v5 2/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup
 reserved memory
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-2-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151; i=msp@baylibre.com;
 h=from:subject:message-id; bh=AoejhMWFhhzgn/Oz1rWsnXYdKgFZw/QDwGfYGclplaY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZtyeNteuPBxa8rFt5Z9XjE+YVkfu+bz7jIXOr2efYi
 qbs9HbdjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjItO8M/1PPJGUU8XqX3rLS
 S77JW1LPsfzcgt13Lrx/t+LWk/7zN+4zMvzlePJnz72ftwuNHNxyvvpZ316fa3tDadlhf415+nK
 vlnAAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2d8308b637f3064c560e485ed85f2..12902231e58a7a958f335096047b0d2384dee722 100644
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
+		reg = <0x00 0x9c900000 0x00 0xf00000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..6444aa0c106197eb44088ec99d7c7dba7f8f854d 100644
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
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;

-- 
2.53.0

