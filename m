Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696347;
	b=fwq3NDOEtMl9iMoE29gk+I4PjPUapt0Dj2Y0sdUI/W1HAjTpFJUtB11CE/gVQPlrP1LC
	 MGOnBfW7BsckU6ourLJUM6wLJ+ugVihDehK688oFlyY5HwN8yEARvbR4QoEzMHYhEZnN1
	 0tPeCs1BNv6/KjbooIUsWbzomKxPjGmD03aIqizZFgzBbrKlqF2iIToEoz2DMNDEBOqZJ
	 DR2nerEpvkUg2UkNscZUVDrD2/M6LaVGvm4v+i+v8aUXvubyHosUrduM1R+6lQcMyqM6H
	 6UUjbPmVCOflaXLQNrMvZBMO+AvEiVal3urejwgQxPJxS5bxqs//ywxg8JyrMvXf7Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
	b=xNZpqH3A53rnSzRSPPP6t69vrXiaDt+nASqp6K9JB3MXMP6W6MtrMjPWig2eKcWG82in
	 KWyj1Uqci9Qn3FV+0+4jtWZAQbrKRX3b0DG4iK3LblKJBHUjMYg7YKd2byGRTvC+CYJfx
	 0ZNXFS463riDT3iCSYfcdgyOUklsHga3+8l9EW/rSdT8NIQXslA2pHj/e86NnVj/v2KNK
	 kGdXtVuUOjt5OyeCDSnaXD6fn7dKGU6c5Vg4KlgvKj2HQIv4mCBQbA6nK5lRgnl8t46l5
	 PbZhnnxzJEa32Heqq+cqmMbmAXS9Xb9aOxPAwXqvbaF5YIMs13DWcsCZf8ei6qpgGfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LIuF6/hp";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48454606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48454606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIuF6/hp
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab2cb02816so570045a91.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696346; x=1794301146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=LIuF6/hpv1AgtjFXjp2ShrntXPKcsD88kx0s6e7fdlnL8ABV7PiYqBep30VMoMSMLd
         Z32mVdVeN5AiZHNtTv8LGxnzxyov50oTRROB4Y2AstoEEd72TutJlCfLJSxSeuhj09GH
         kgN4n+OfsHu4f9W1l8Ww+8yYYqWsXdiDWtrXgj4nKb/f7KXO3jg3xEbKCZorhmJq+zCZ
         EBZkSKVVyRgHBonsQPlpYT9sJ4kwlKDWBnXoLiha5WzA0RhfUV7Q7YE4Tri6pJOosH3+
         UHfHrK03cPQliS+K2xbkqR5SIuofSZLwSbm413A3siMLaz/ShIL+rs6MWfP0OiYoSQC5
         3JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696346; x=1794301146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=NXBOgem4O2OGeDn6WCrRQIO1AVLVtUxocFaltZz8spVe8SBMSj5Xs4RSOeWSFClUWo
         +TsT58MYEOCLYQzwi2Qh7GYdBc5thXOSTKqojWwwQ7lyMqx7Ptn2hUOtio1Ye9excx5Y
         +ElxL0HmEjri7eWMVYWDi1n782EV3laCrfWvFjxreb5KV0gS9sLQ522XvcgbD6n4V3fJ
         uyag2xH8XGQmQOmwnrtIfxnEJKgM9GyzvrYD5h5rAysJuV1jtwpFfsPE9g8FL4IcIO/k
         mOvTT8Ix6uMNCpJHLrwocrh/sSF1p/34/DQ154agWwe2UdzEpq1UiUM2gv+nXnxGHsTs
         fQ1g==
X-Forwarded-Encrypted: i=1; AKwUvBywh6qn4j9bRXYIjYCC/NR4F+c9pIrFqITL6FJEaBa7K8sKuS99ZgiktcB2AfmHeNGNymLe1Ph5KbBj@vger.kernel.org
X-Gm-Message-State: APuU4Z8rZMGAvD2WrITF/eZlZWhrQM1w7qs70s3mNCKXcTdHR+yHOPuC
	e0QM7anc4g//bq8r8uioPzNilB59/AVcYYAqAnRt73m44F5TueLbNbIK
X-Gm-Gg: AYBFou35+POMGRUFeQ5ulEbIhOJHawoqe8xtOjei/02tQY9r4n5rRCqcxOMpLHILHJa
	sDLZAqADcR7wBUx4YusbYhFneIzoPcShEVBgnN5FyR25AnPzJvkDrf/ehHGwc90tCMATnMCoaxX
	MJwxfNnMOtaPF2P/1R2glJavbT1NC+dpw98lXWU+4tlrPPZCZFkQNE2CvRpjPKyUv51ca2SSxAF
	CRZNG++aNe9w6pPhDbuHBMzDQOolCJDj/MfBoMp33obfNu9XrZjK6zA2fPgaX344DiNFCxaSTEv
	xXy3hEFWLZOd5H3b+xtLR/1Ws2M169tAvPvLgriRgUT1dXIyH+fMoshRgP2pxzmxtSlo7ikHgXz
	FFKdxZB799caO7iqGuwNphnPJT7AfkSdwDJ0jdUEn5TH4v3OMXnV9uzZ6G0D1XRO7rwMC7VWRnJ
	64Appd1prTD/FYz/5ndrtR+6AYIXWguEVwPWE+aRQmNJe3X948nfzWavfvgpFeaMKyH++zDh3FW
	ToKKNu43R/igXo5PITBDdBSgars1PFw5wiPzvnWX9Oc3ExT0DXbHg/feeywaaTgPIjEH+dz6Zjr
	XFlwgLFyd219f3JpGx/RPjjjfu/B/dysmjlRZbdSxehl2SbKp7egOPJDF0pp8B3YtrzslqvfZ4h
	RBmH4UU5RJMcN
X-Received: by 2002:a17:90b:4487:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3ae89626108mr17481897a91.2.1793696345686;
        Tue, 03 Nov 2026 00:59:05 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:04 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch properties
Date: Tue,  3 Nov 2026 16:58:45 +0800
Message-ID: <20261103085847.338613-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB role on CV18XX/SG200X is selected by the ID override in the top
syscon, which belongs to this PHY, so the PHY is what provides the role
switch.

Allow usb-role-switch and role-switch-default-mode on the PHY node. The
default mode only has a meaning when the role switch is present.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
index 2ff8f85d0282..a1d164686b07 100644
--- a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -34,6 +34,15 @@ properties:
   resets:
     maxItems: 1
 
+  usb-role-switch:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/usb-role-switch
+
+  role-switch-default-mode:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/role-switch-default-mode
+
+dependencies:
+  role-switch-default-mode: [ usb-role-switch ]
+
 required:
   - compatible
   - "#phy-cells"
@@ -51,4 +60,6 @@ examples:
       clocks = <&clk 93>, <&clk 94>, <&clk 95>;
       clock-names = "app", "stb", "lpm";
       resets = <&rst 58>;
+      usb-role-switch;
+      role-switch-default-mode = "peripheral";
     };
-- 
2.43.0

