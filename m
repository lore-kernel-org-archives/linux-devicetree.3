Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9700372665
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924439; cv=none; b=QZVK4Z4jqnReqiZU0eTB8ulFjd6jl2cC+LdgEOoRRxxi0KXiGO3DSdCb4fQ76MoitwsXH6dHgOOGfeSYvfesLYzBileCwKrxtMXiIs0pyAWKK0NTH6xSFnLDSw4QUbnT8ug+v2X43GKQmoKazs4mYw+CJRV3AKzr6vE//gPUGfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924439; c=relaxed/simple;
	bh=B3fZbdtVfOzxgR/eWP11BGYURdUE/CdzqPlZTBu6td4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEb5v4U/sDrxX8udnCVviYMIa0d6OglvYcLmfh4YewvNSUp8qW4OzlpiY4fU7UYglym+TiZP2N8jVGxb5NnsRT7TK/lrsUgAzBBuCl+KhZiEOwyraOdatIx1KFCHKz3P5o+GrU24/hth4HqEEisCQrStUaSp9XdPa2SIHz/hFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwvaPhRF; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwvaPhRF"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2c9878bbe88so9113495ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924438; x=1783529238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB6M/qa8E/LqUAyzo7cAKot20skT1kqM90AWopBSmro=;
        b=hwvaPhRFKNPSutpJAAX8ZL/x5HeCcl0wzAtR8xIRlxLTT8VLUS4FZaDN2lM1Pr4fST
         +O+sOQYo1VxD3X7nsFtVXN4HjLOR/SFc1peugf14qeAq6SSaVjMT4t/93E1acxh+hKQD
         o0bVLTOrP3YbZy6SgzVZn9G0bdL9GainHUngdBIPngq6AXwfFT8RIGT9WHQf4mMgfV2+
         jYx6gAjOhHyg9gLdBw5Nl9EndNSDdkCkyl76PupRSkuMknGmcxgQ/UYxm/ivqseUZ2aK
         m1pYWNgBzQTNYEA6A5K9VE5ILYAb+iP3J/lQNdIaYLtxzDk4KCRZWy0ykg28zQFfAyxe
         Ro1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924438; x=1783529238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dB6M/qa8E/LqUAyzo7cAKot20skT1kqM90AWopBSmro=;
        b=gCUYy/FlnUhpqi51Q1b1xIcDENQ8UNRAb6ROjAJzWnKtX1ivmUIHtlc0wcY/xS5NMx
         cIIRxbc2BF6NiqJU8QTbA3EEFRb7TiiYMOu/0zXH13/LLV6KOpc7s09m8vc8yN9LQ95O
         OqsuBHSBEPZ5Zdk31hP4zLEWVh9sJGtV3vfCNhrnPbRPbcwPJR0UURWO6gtERR26o+ou
         QdCLsHdxQqQiEQxQ0CWCZZZWT2ywm4roq91gmVWls/EZXL8hKEu3cOAFqeBR2iu/nvVK
         K+R0cFMPLuqhMMgIUojPl0mQHdW80ns9JJavKezuzJzhnIQQKxk9vnfXcpGXZyyAXkay
         qkDw==
X-Gm-Message-State: AOJu0YyCb0iQO2ccvC42dKdmOQt8sjAwvIbawKSUfcuKE2+j0eIhS+Vv
	O5oi4rm0djhVFJKPk9rH0zZGPrGxkNH7ysOkRZCcbO56uP6LfXXcV4Rf
X-Gm-Gg: AfdE7cl+FzqakxyEzLRkViEeqjdLH44Ri5NuVqk04ZZ/KfbIMxXJZ8iEhbxqmb/Xoa9
	DpSDqVvUFr+es8ldqfubl902Z4Zx5W36FOy2ilHjOYZPpeWVeXVrYqjHEhuunHYoyZF4CKfkdCQ
	PvxzSqmB5knXCDmzmUGzEJknrarxtHVvOqZ1mkf25CP9eM64AU3/bFX3Tg06inYsPsiGvb1mB5O
	TklXcC1fYEGSkCHdmS8FLGvwfwa/Q7ODtUeB+jQG2xw5HoXY9PX+PgZnwlSR6U3HS73BHWCVGOl
	vUQYLnYwdSHwoT5D5+leuiLKqR0prMi1dyrGyIr/SfhFu/nucY7AZQprBpPj8N5glIvkqY9vFf4
	U4lJ9Z7vJ5vi4GWESYhhBwhk6kHZUd3r6IRvO+8/+cIaI5dPUSGmvvB6dTciFSe+eucnDy7+UIb
	AbPsU9lFI8j1Q=
X-Received: by 2002:a17:902:d482:b0:2ca:883b:3608 with SMTP id d9443c01a7336-2ca883b37e8mr16422805ad.28.1782924437695;
        Wed, 01 Jul 2026 09:47:17 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a911f4csm985015ad.29.2026.07.01.09.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:47:17 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Thu,  2 Jul 2026 00:45:45 +0800
Message-ID: <20260701164543.3967388-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260701164543.3967388-3-coiaprant@gmail.com>
References: <20260701164543.3967388-3-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Graperain G3568 v2, which is a development board based on
the Rockchip RK3568 SoC.

Graperain G3568 series also have an SBC series with the suffix "box".

Graperain G3568 v2 belongs to development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d0..9eb2f66ba3856 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -684,6 +684,12 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
+
       - description: H96 Max V58 TV Box
         items:
           - const: haochuangyi,h96-max-v58
-- 
2.47.3

