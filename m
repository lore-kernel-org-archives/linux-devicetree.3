Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF342EEC5
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976095; cv=none; b=pHM+Wlq/36S52AJJhO+MxvreS/ZhplV5IcWWDEaYfIBBvaodaP4T0lwbAyYlmae6ozuiV2mB2675eo2LZlSPHflvJ42DypRhSdv3qYxhauSpetl7TaepG/fIsC/8dNb+cdbP04MrSnU1fBMF4oETNfBhrjSv+BrWMIJURY807Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976095; c=relaxed/simple;
	bh=t9mAVkU2Gcs0ZiuzpsVhMnS0SAI1hRW48W+JYB1uaz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ze2uwR+bhOwYgpz3wzDxpgXa+jEd/p6CIpB3LEA3NLYlm9A/+eUC8SUmxeYW9u1xdq3UHSnwHl6+xPSsJPBEIC7gQOt1ZcHd/Bu5q7GHLEHRVX80K3aGSj7pXUJdq4Nk8BMR/kuleNJcTfZk5Asxgkt0XIaUpr9mSS1PLW7PG+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V6fspz7v; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V6fspz7v"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-837c09d2268so841038b3a.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976094; x=1778580894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=;
        b=V6fspz7vza/sAu1M03Ml6wor4wPvx5eW3HSwm3mZYrxv5yIWQreDyPsLVjLrZUEHzT
         Iggf6OWBWwKZODuf2OkWX+TQBR/n14bp7FZvM/Je4dSbhYRW5NyBFWYqmQJXft/ssJ8l
         Aw2FexPBgUvFnaEgD0hpbUN26jvWthBpTblu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976094; x=1778580894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=;
        b=AB7nkqh90BpoJRFivQkyH1TlsZQBvvxQKFXnNrU8FDEzuHY3X/Kyn1PGDlgwSDRiqz
         XEiPJn8LM+a2HNbCfalXOJK7+g4e2Bwn5UPYlxdKxhz8A4TSkTXtpeWjUV5bpjDTZXj+
         nPO0p8B7EU5fbvuqjq7kX2uKyr9ZIf/i+sHmH6tG8cdY1JRYPhvGU0MKoaoczM9VoXTY
         lj7npz1LZj0eC0cBlZzScSWMWCdivReqVC0HE+4uGRStWKch/IRzL9z+Rwu02q46Zhkf
         JVr4FRdev9cEXUD/4QIMoFt+2EdyH/19TTOzNikcGet2AtZaJ4Ex6BmBBMvooqi4NsEe
         UHGA==
X-Forwarded-Encrypted: i=1; AFNElJ/H51AzxaCPZ0J3unVAip/4sX3xu/y4yLiY55/6pZIukfgioBWT6+uF3Cyp9RAPl4OTR0H5ziLlIY/a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Zz16wdTvfP0ingp1P1OONshX0pHAEfVJK1WJ8uVrSVuE9WKa
	R4zmX2MmoBVCC7oeBJh2E0dnzm7oOdYFVIh7MUpdo5SFsbmOUt1KiIKnnHqpn+ZUiQ==
X-Gm-Gg: AeBDievhwYuOpeziotIxq7dgGjA3kDIBWC6/L9DkWNnhvbKo7z2egNp26jSHUe2pHJE
	JSOSiWRgx6DSTs9dX8kgtVEn0l0LaL8noxiHjMLzdJNiALlYOQc4cQekKjqsp+pNQSyqd0AL/0o
	LNCMbdI7ZYiNX40kwEHzTe1D78AIsmGdrTrFfnI8Y5P5dnG0tgP3ElbKamDnnujvZW9dhFQywQ2
	B3Ctvxx7BYWCcSSUaY4T5f6ONmPWXSmJhZazHbDMsFvC7ALe4BYfm/PU2Rsbp+Vpwjv/bDMvHRj
	yEh37+61//n2CXR9Q+xrEemWVbduQPqOB+8kObDLhWVMlrELZb9W7td5zsnwCYKJCrYDDQ5gwhV
	bHWIMMK4xw3V6NetIoYvF3Aso6oFZqnAFUxRhc0SsQofJ7lqIuQq1NJLiquVcH08yEgbewKUiPR
	/cGah4+GUHciFWA+RJu/MItqu0dpZtFQiypDf3YRitaEvkLrhwYGzrJyIipfvep3L3uv799BGN/
	YGLVLx2TtYGu3azTji1uG5dpay1WQ==
X-Received: by 2002:a05:6a00:3e0d:b0:838:c01a:7a54 with SMTP id d2e1a72fcca58-83921dfaa03mr2439889b3a.2.1777976093740;
        Tue, 05 May 2026 03:14:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
Date: Tue,  5 May 2026 18:14:02 +0800
Message-ID: <20260505101408.1796563-13-wenst@chromium.org>
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

The VBUS regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index bda1b0f9f72a..dc1ba143ccf2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -212,10 +212,9 @@ tboard_thermistor2: thermal-sensor-t2 {
 	usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
 	};
 
 	reserved_memory: reserved-memory {
-- 
2.54.0.545.g6539524ca2-goog

