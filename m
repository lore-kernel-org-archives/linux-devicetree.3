Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112012;
	b=4h/S7KBowYp2gip1d8jreNHg+mNCkGvAVmBG0CUchV4+W55qTMcXqm3HM9ngPo2+up90
	 6pNWwhKYX4j4JnizXT8to8UOFzSdIVVXpFALSm8i74XI/x1v6r3MwFMXIQzOLRpfPymcW
	 zKARiriC9thjYdwVchjcSgj9Bc/NcxHTBJU6spKm6gVB39wbjA5FSte4NAw3FxigH3+g4
	 veNcc6M+zL5jL+Bu6qjRmL05nhfEnNUvtZYRGoYWY3jqSuRuSNf7aHbgbyp9rYpHeNvEm
	 o8GsEz3M3kiPDPbRTeYnfdMXwjA5nF5dmwnVRhb4TC4RgJ8n4bssD3N9aC8N2Sq93ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
	b=oA0xIZo1aFD2E1CBpP50tsejn9ENNw+9t3TFvdLRfoBpDQ25612NKNsIiM0h2Gj9kQRd
	 Ols0RtAvSp5xMijhauVI4MVOmnGv0Ld2lYdEyH6ytEljn0G6N6kaGqd2DOyjcaqbNd0Ft
	 ylcuzQkT8uHqZlHwLhC5jw5YeszxbkT5gMfXmJq1VRS2plyyjPsfSUh78JAmys5vyFuyV
	 NFCC0PAbKYGSQuu4Hoes7tLDr2mshzd9+Ywj2i/Qfqk/ZcSq3+npL0IoZOZJKBgnSdUfd
	 w6yOXMbXpzXaPTiUoOiGJtvDFZsSjgzw0dgyVezFEHfRw1ki1MdTHCQNXHP/2HmdHSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQfYoMZM;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29689606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29689606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQfYoMZM
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2997403f8f.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112010; x=1793716810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=uQfYoMZMNn1b1mHbh6BEdHCCn8DL5Aam6pau5FsCwoApvaqSWc6sLxG21oIz17BYzI
         L0k2l7bv0VS+ZIGumi42bUm84ELP45TwdrWN3CGoU7IbX4XU9LVeg9ofwkfWCjDWWz1s
         JNOzuoyKHh1F8uyfb3dhlzvQbJV/xEVomKgYc8DNOYZ3/WHWf95BJw1t7uF1D4XGgMWQ
         sETGkTXXDsBUpc/3S+2vBdIWiMGUQKNj3B4bxzUjSfYAlbPnX6qrzBXFbEx42cfzsofz
         Mi4j8QfggNhHyZhBbRiycvz1LOO+Hw7lrmym7Hv1C6DVZP7HCAQ9Ue1bh5z0yKowys24
         SB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112010; x=1793716810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=g+HqUNbRIcfrFmVP+stujEDGIeuHuR1Odap7XwvbGpm6bwP9LdF+co/uiX1jinagTc
         JwECGhMDXw0LEfRCH9XLF1aXNc4b9lap3ks+LORAn+1WIs3ceDquCBnCM//UUCVVDNaN
         VOd0s0NygC1VaXhhATHfigrS3DXyhneRf35vkCB7Jo9ViBBjdS2av2QghQYNRPdlAXu1
         BfiZ9lEm/28/WNU6vCLWgoYVG0gNbn632cgGO6SXhjMQrcjgyJywkR6RdC/qQyD28TDW
         7qHeZT6lSxFCnfqoc02ObF8He6aCSY1teJYruCM8U6brSntVyeph3GViwMSj4KdyS+1I
         ROhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfozOOWWFBpBd8pGztyl+BryRz6cfGKnJJPie7lNUfxeLyGXhTpqYkMj2MrvrNZ7ydKivUR3XbLpCU@vger.kernel.org
X-Gm-Message-State: AFq9FYIvu7dveZwT1d2BrcIH6vR7nV+ikfVgPzKgxo/MOMlph2jBleI8
	uvQopoRq4f7jlwICD89DWQl21PbDvYzfbDFVpCcXb+D0g+NDaR34fktk
X-Gm-Gg: AYBFou0bYS29pAYaEk2yA/Aj0JaZ4N4bIzi1VVVRJDhTfR/Jyw1GynyZ+2QLOuklKTz
	CxdAOKpBuUzt+GbOW0IPjuRrvIdiPNGEKWAPOmLI4s689XrGbioJhFoaciiPSksUjdTtkA7w3fL
	iiyJNadSqdnG4E4zGhKO2LGY0JBcYIHYSfN75hXFuz75ME2s/wSwQmXOQWojS4+ebGcORSclSwj
	dTh7QdNbnNglUi6XpkW77FXgGoYNgosG7Y1ywuvXMb1+DwBhhHlhkvpAYqsxT3beB72gFa3fNDi
	UYSvgXXUbLQnfaR6tKaPL827M/fU2j1wNHI2vT+lKXH+a+iXnipF8i/gEXa0NEsxIrCjlH/eoXz
	wRmrotbwkBzDggUvD6TLx8a885MbbcspAEqo89kc99qAh6kHnhF6yXlCiBKM8SUTS7z5DAve/xN
	NVlaUELHNlTF1rz6cl8JuwotmMW3E0iAHb77kCAFSvBE5ptvvgukDEDtJUFn8HkrmBtXpz3witv
	Sbelw3cRDf71HLC/Xii//ArkUNtgnG7IWWtwjQgpuVCaRsqYB9qGbdLPAAnu68e4MYhdxFlKlY6
	nDZ9SaezuflSpB/7mRZ2g8IU+V5XANT/NGZZChFJwHmuxsTz9R+sstT/rvN0
X-Received: by 2002:a05:6000:24c6:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-48e3ebb0fcdmr20256092f8f.40.1793112010059;
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Tue, 27 Oct 2026 15:40:00 +0100
Message-ID: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Also add compatible to restrict clock-names for source and hclk
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..704d59360bcb 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -182,6 +183,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - airoha,an7581-mmc
             - mediatek,mt2701-mmc
             - mediatek,mt6779-mmc
             - mediatek,mt6795-mmc
@@ -238,6 +240,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0

