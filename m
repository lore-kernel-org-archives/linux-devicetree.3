Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43013423A62
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976076; cv=none; b=IEdTET6RGXZj0/T4Fm26VHT4hLPhUpjeSgvftpzwu8ajmOgm3UkpMQMmcu3WmXK7rj1LH9ItIq+sR3h9iJODy4AoSsJB/mqbZS6uzz6Gkyr5K+rSBNYbaVzlE6zLuyq7vFOo7cNfxip6p25wuwreOX5QFDSBa90MGTr5s63Dyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976076; c=relaxed/simple;
	bh=nik/PEmX20T923AHDp6qo4D+HNhofVbHF7e81vpkH+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bd51eZrjTANok2aZvChLB8Rid8t/3TJM6Nh/MycubvMx3iLtuIXA2CVcxX4TrlJmdMmmeCW7nxzOcu9pv7yQOXOC20BOFjuZAwg9HhiMw60+4qxgb8VOPgHiws7ymEgUSpeNw2NrIGDbIOwx9oqpZH1iiuBbHIATKGM9SWahSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y86Q/qDE; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y86Q/qDE"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83975e992e1so208068b3a.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976074; x=1778580874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=;
        b=Y86Q/qDEOEcdPjUyLyAQmS7NyyoA82fVCEjPAO1Xr1jYS2rfdOMouTpJgiBMzIezJU
         vnuKvDhvD42INf05IP3pd1S9jiQQXm/YioaDP6S/MGdmUiwZvnN1lLppHMVxcFRyghaZ
         +zoDijUdUlBK7/1ykQZSTrFzc3jFk9cE3dwN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976074; x=1778580874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=;
        b=UtvS0yaDN+mhhTmTlu1JAzxSFvQaFoBhI3LSDtEP4c/mVZKIY8SQnRYmVFPp9oby7p
         EFgsLziP2O+zha0zdAreXizvoIUyz3LoyfFH2kvCv5Do5/rtbJOh6Rl7T38/+H13dk4L
         XJubafWd6+1uGT1l5amtJ1k2hlhKXNHBJesSjvhKiGjZJZC2xLKXTXUYFkuyYqDS4gf4
         lmcgUE+2EYA3TNYJMtOuoxec+l7MyhvINFMKY2EOPaLhJhWtf0IvN6RMBYuk6kzYzehF
         AOJnGujrWBfmDY/flaBK5ZBE0vJI7uNcC5YjcJRBCiSWiwtlTBbSsER5k+AQEG93A0PC
         yksQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mhvA/McGomej+oHw4h8Lj7DuJkXO814vHdOqa1Ktdowm7eD5ch3rYWiCTtnWNnO1SDvMZy7jnuXcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0jCec+SYt9CsynDIze3zvKF/ewM/pSf2s7A4cNFGhipNeMWi
	51bdVYRWsaqF9REll0LhcTvv1qdMX+bDVJoNfEBS15yToEVI0/tUBE8Psv15eLxUHw==
X-Gm-Gg: AeBDiet2zGEb3VCyjTl7xMaJjfU9w48q8YlC1VWx40Oi7Qkk0U7ZM3944fnpHFU957W
	80cz4v8/IgLSMMW1RtsqcfVWGO/1JaoKMsSkC3ob2ePlpi0QJDZ3QaMsI/lc4TQ41HheRgVatS+
	uf70cJWL+DyTG6aEuyB1RpKmn4CTuApsPYBUVSQyfmAuSLEEKI4jhr+L6UNizFgr0wEb+vHbWyN
	a5hoIzw6jTJ6KCjqsDAUTcUsmL8KeQ+Nz/khq7KhHxykL2ucfnOSqdcpAkoIMoDaGPh6WyeAjk9
	0CCpcnezKR+rs6Wy6vR+DvH56VECl4MNi2x/vwL96ebwl927w5Q/rrnKVuGJOca/rqtUzwldqXv
	D+KfZR6EA76oDx5MYSWW77nzS6e+G4qH41Z0d/ac1XYXhMQcLOwMQ1utg4B5bLwQRLF+UEWPQhw
	CCTF2Pdfoea5BCKsK2e7DKD4qSXCW0oR+1P2WfUQdfpn2jretNzep/YkRbtgD+p8v4Gk8HunQqn
	Z9cazF+ItBoDGGDBj0=
X-Received: by 2002:a05:6a00:1249:b0:82f:6b94:99d6 with SMTP id d2e1a72fcca58-83921dfaa0emr2465583b3a.5.1777976074570;
        Tue, 05 May 2026 03:14:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/16] arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
Date: Tue,  5 May 2026 18:13:56 +0800
Message-ID: <20260505101408.1796563-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device tree for the MT8192 Asurada is missing power supplies for all
the CPU cores.

Add supplies to the CPU cores. The big and little clusters each have
their own regulator.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d08ba6aec382..a6543bbcbfd0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -299,6 +299,38 @@ &afe {
 	memory-region = <&afe_dma_mem>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &dpi0 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dpi_pin_func>;
-- 
2.54.0.545.g6539524ca2-goog

