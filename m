Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248CC3DD522
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367978; cv=none; b=GJtn6NjEH8yi1i4b9tIQXVBFz1zeB2PyMcFw9lx4h4Ztt+y1/Kn240XzTDeQrNX8YB/c6Cxk9M/PBp8pDPnrHaopVIg7+B6kC3bonRfQXXEaNrpIfH3ZE5M2Bb2V2n3pyuUxUTne7ttO8cFo3dHSxgHSWalSnCjq2Jlxi2BE3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367978; c=relaxed/simple;
	bh=VirjA61iZOQwLAxKnDe3FfGkvvDUzTvJontq24LgAoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5tRtYwPFKZUyUKYtryOSGN0IDxa+qIHN83MJdO3rgY63UeQs6EMstcPTnO4AFWGE9KG8N/PUELESDGndHVnBVkUbsl9HdgCQzWM69yoBjR15gkjf3UtTiu5KA/rVP5j1mBmPGx/ri/5SzChHAmBDp9GKpQKksZaqPujLaOxcOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KYfdoiSe; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KYfdoiSe"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso1013455a34.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367972; x=1783972772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTEktTiHYW7+Tdn5y54ehrrNgsnN/rsQeRiANrKwqEE=;
        b=KYfdoiSehR2kUJUggtks83O+EkWbETLtZhAklZ3yDyvJ98+g+BYl4x7KtUN44PT21l
         HwEhMu8xQbWfkNj66W8QHCde4JsViXGUYVBxzKNYyn9cYBg6RoHLAnL4U3kETZE/9cAW
         WLY0/vxa4AKUrsyw0HCGgh4nOnxabuJV7wKyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367972; x=1783972772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTEktTiHYW7+Tdn5y54ehrrNgsnN/rsQeRiANrKwqEE=;
        b=PHt4gPfq5vJYUbj6us4mwbnhU8ufvgkTxibsBMrr6eUi4nXiyyg8i75GktA78SZOOX
         eEw6QMjWXyNL9bsPT+OrfDCFzlRG/7akQggSXyKw8YWj56rL3Jc4yfYyR0ydt2E3bmrB
         kh/lLweeTN221pk/3l03MVGL6C1qBmBtjLp7LCBIYSiQOMWsUyKLYk41ufAd1jTMMxIo
         WaXUq8XZCUitWHLiW2nWB/JYsmlHc9oe+ZHHakZqmQYJeAO31AzdBwBpgtbV+VaL2PsD
         5gfPx7OxpXPi3N1KFxnb/DHSGPYbzscrU9m5c5iP0qrN1zvYY7pN83okujuX1fzxBlAY
         k3nA==
X-Forwarded-Encrypted: i=1; AFNElJ+J8RecVfeT0EY4/Ux3krIfcJN2hlafXhiNCYAfpuCLXj4pPQ8aey4JmGI4lO4G3Rr7ktvYHLDzm3Sh@vger.kernel.org
X-Gm-Message-State: AOJu0YxprN0clPaaN1S2c/spW/bdLUQyGA/tXKnJdbbDSWpZm46N86Hi
	g/CUe/vJ3spLnFiZIzzMtKCmwgRj5LiZyyX9bfpW4hS9VRQuQ1hVEFBlCxPuAl5iJg==
X-Gm-Gg: AfdE7ckEXaDi7pt5eddrAwZzeX/s+lBp5MwCyw3M9wI1WTJDxq7wgVpcuy5p/u2+Mml
	Z1u+1Q1L1eQzrKwuODoxI2y4UN1yO8R4S5yVM5h8Q9lOSN2ptZ+VWSAP7djkYWj9+Uge2MwB+xe
	Cb5LPzBkmdiXsEnuAzaVlvnT6mj6OVXfBzehtvdJSaGoT8YgHoX95+qjPOdb4im/UWwLa8zedJN
	4JpOGUtaTi398BG8Wx9chx7PeCl2bc9NtfRZ4geCptWQ9+1OOun/0gGxjbf+VgyCrgpO0QM1J57
	OULSQVrcFk16ttSKaKh7q9r3P3wDrb53owDA0vQRKYfAB4xoLxo+w+AFM7P4wclQNAUBLFixzq3
	Bv30c9ffmtgJBClhD7PGHMP/x7VSX+o15kAaTa/uWW+u8W4bJ+h6g5tIhUeM9uS7oJnMf3wwCjc
	XMhzWym+Fz2MuorgsXVg==
X-Received: by 2002:a05:6830:2588:b0:7e9:2d33:87eb with SMTP id 46e09a7af769-7ebb22625bfmr1361922a34.12.1783367972711;
        Mon, 06 Jul 2026 12:59:32 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:31 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:58:05 -0600
Message-ID: <20260706195818.3906949-10-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the SARADC of the Rockchip RV1106, which is
compatible with the RK3588 variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index 6769d679c907..c3bb03dc4853 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: rockchip,rk3576-saradc
           - const: rockchip,rk3588-saradc
+      - items:
+          - const: rockchip,rv1106-saradc
+          - const: rockchip,rk3588-saradc
       - items:
           - enum:
               - rockchip,px30-saradc
-- 
2.43.0

