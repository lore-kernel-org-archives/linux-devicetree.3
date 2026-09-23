Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C136576EB9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195002; cv=none; b=U3G35bFSPQej+5Ept+MHtSjbn3/t34yeyu8UENNnooSFVJ5588QkCsHb1SL778zenFOf2qSZwnkCN2M1KQewjWBsvBzPfLFnb5mO2EXsc0bHq6QuxgliVGqoDmZj4haEAGx+x0rYaxCeydlJ23lw/U462mYT6jfP7xs2I8BXhu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195002; c=relaxed/simple;
	bh=ctaMtyihF0ajmk4Gl6vHmDSDBA1iaCLst8FkJRBGR68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPhGWsTUYXbvUFdpdkfhl0U1XT2hX/EzEnvavh30D/BuO+RgBHPJ7i4XbCu/ULetiMTuIP7kj38f0F9xJO47mnV/3edEARQcpUkOVo1v+bD1V8GC4aajkdMZ2acRpZ6eLUFdztxfJSCQ2RKPALbB7w2NMEUhPXR8X2IG4eYr194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bS8ukALG; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bS8ukALG"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so204317966b.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194994; x=1790799794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=bS8ukALG3SfDdyd1TBiRO4+2EfQ3bzN50RCGOgMS2U7GK+X5wEsBOc7dVs6efryK8W
         7arvgI6tVTJUi/EaBJnrwkIXzFY+2L6bGuv9cFhTkoQYF71LCHyisoM1siJjNmw4QcmP
         GqPMOZQnik4aVW6BrN7CTb8GcsUreAtLlL35CN1SfjbeHCeGeDIraIfS9PedV8R8Y0dU
         cttXw20957n+oF3r3P4N4VyD1pmMH4Pqypk/rIoP0Pqu+WT2P+yWLcy9XUtCam+Yc0UE
         mVc89w+GcjNIQh6iReajeFqyW41gL3syfD1CRoNi23p7FM7RqQfgne4wrsTMN72pP/Bt
         pTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194994; x=1790799794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=a/iZTSC7luzXLEzzLlRfmjtE0zi6kzTDRYoVFKT/Q5jzCrExD3SUbt3ydxUUGnnHaZ
         qvpI1QPcLQ2JmW32FJsBeDLqib6KAiPg4CQXfFTiHnG5b2avQw3wJXae4k0v48lpkYJe
         k5vZs1deycndt/4t0OxI+wqdVeT/FpOvt+RUfRh+vDjTghl4wFXFkfKnJJKFiyM2syeC
         sdVTrPeBH8bMd7xINz74dgOIAk9B+OCe6MZ2OmnlcAAUaF6SDL+zv96oPfPiWd2mCgnG
         SI08cevD8cY3c07ZJBpUNTWWLTbWpoOQma8kRZFQEXZGQuFDAbMDAq1XK7dQ06AfAe81
         jtKA==
X-Forwarded-Encrypted: i=1; AKwUvBziuI4Qjw7V7SmMSVg9gSw+4RJsIRaf0F9o8wlHoaS+R0gUSL1vd4DI3O5v8BIQMre4zEmIV9b6bADz@vger.kernel.org
X-Gm-Message-State: AFuF++mRTuJJQQfB1fZVO/XXrRxPj4CAGh/78yJjibBQuOlBQdk8k9nC
	crsTMz7eVUB1GSEQJaLE7uhNkyfbdIiGC3mL/cn6iwXWr2fjewH5fp7b
X-Gm-Gg: AYBFou0QJ/dt/4X2jwsKqvvmT1NBdpHcq4wNhyfhFoO9hzkd6fhTZQ+HJas296y5SrZ
	n+hPH9/iEdv8QeuWdM4Vu8MhKGC+p9cLCa80bLuRM/uveia9BO+d4hjqfnM8UR9I5MppOmirp3a
	lZri+98DC5RoPxpNvEYHuGGHrm5lXHIrmoMIwcWFcvj2zk936zyE7eqJu9p/Z8UDDaajxKCRBx+
	eozHp5CPnwUj5Zimc6UsMBdjEPNgXIq8vS+RdlbwiK7D9TVKJGngtvqBnbmkJMhg8yxXLaKzdDf
	qbHlmWeFiGsU4X9gME4ne9W1FptKZu8za9Zij2wB+/qRqxUruy8lMZoVthXoaArcaGYNuEsOdRi
	XpemSjGownAOaZhMrY18qf6QWMCZyc8sm5vYusXzpJOc6581xvxWFcpjcCs4u1CLX6+xVhSavEr
	psyhPGUblaCwusoyvY4XGIXZXU0jygtQPcplim7enn+gMJjUdUsWFSqFVWzjq/MurqRWBP4bCq5
	1rbkjUlWoHJ6VfHDiLjzeuTYv6bgOMFw3cEZdE9vlI=
X-Received: by 2002:a17:907:7b89:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c2ac1f0c09cmr29718266b.0.1790194993528;
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Wed, 23 Sep 2026 21:17:00 +0100
Message-ID: <20260923201701.43391-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630a..f66c681d3788 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.53.0

