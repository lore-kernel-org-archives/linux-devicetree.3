Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597202;
	b=NDtKJYugHfRSWtLrUbGvGN8ugG2+GoBjFgPDSY2DCP9lJ477kdOw5voETZWnCEDzP0as
	 8cxBJuW3tJ/px2mf3dpKLs56KhXSPBAwXI+3XB+oP9kyQ7uiNjYs8ETXZaKpNllQheQSJ
	 97okqbFPNHZmEt1hMy5e4/fxbqVHEpIdWHGQLH3imZ5Xzo4Lt8LYJzafH1gfBDJThqFDH
	 D0EoFnw8f33VTdgR+4ofOTx1YIpSfcEx7covU5qkSoYoyWUrvJ9wM8mPDUTVL3x5Sku76
	 kgObpH70rzk4iNvANXuCov08NszXGtALPKnsWl6H+x71iDWehmMI8Yh16Hc3XroLpOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
	b=iwlmO3/FVOHWL5rCF3ihLfbfv354mf1ffsPGQ8YI/GR6zdHd1hdKWVYqeG2SXU/R54zu
	 hvVvqO9lLGAT4p19DEZ2f1qWzs+/1XD7IuSx/5ADwllIQMAk8w8RwroiHcxq2uXK2Yuje
	 liFOQvhKlgi62vApmvKZilrIg3PPrgwm7u2MmPB/ecxbfP4V7FUpI8rv2bY9mkikX42ZY
	 Jcfe4jl9jDBu5irwI/ovsUvCXSJKdm8dF0przii6TIsC/bpVsdjmbmPHCEIt3aoBGnPMQ
	 2zPUC5I25hZ8xu02KUr5SvzSHU9j6wo38JhOKQbLM3RpjQ3U0BeuLvIPkrTjgv5ubxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rg/NwLb8";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD08606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD08606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rg/NwLb8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso5636625e9.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597201; x=1793202001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=rg/NwLb8t/dx1u3ms20054DPd+uqAc/PFciJysN5ahw3RUkjyXCYiu3TcXjMUbhssn
         JBmW2XFUGvpEIZuXrRKWERvjjRRxuARfaimuWyukv9KagkSpAdVcb5F3oILdMHJIytv5
         enINaPw57EX65qn03Sv7za0WUpq4VS8QdokhbAM9x3nt2icy2969M75Z2bN6MyURiTca
         sIhUJpU6AXQQ3nUjMJ5ptX6z1PSaNC+mYQYv8vuhKJPT1FJFyxEQxUp5car28WYcB74g
         IlrGayVarn2Hk8Sbstmn06bypann0+vygpt4LTAbOWFE0uoV7/rOhp64mUyq5OZzI+RT
         KLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597201; x=1793202001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=Wroogbzpr0aQnFGALRrVP3bksAyOoewFZ+jh5lbqh3HBQd2pZXVlFNsXnyDyEdJOMJ
         a/Nruo17WRR05L+8hbdxKAnEraM+jGVs7657/KkCF3OyVxThrMJFeaEqtSWbfjOjWKmI
         R2iyQtgIcJ/ShUFDQ3TrYiNpVbyyY4fgozgBeUFFCbrZ7IXCJs9GOHjYbpHeCFA9MBSX
         7H2fLGl/Zydqc6tUIa3akGGu/+hB71Oit30Jxzjqeu4KjBV1Ar3G9gj0rSU68NivE2d/
         td98jnIUs9XQx5sDF/D4evYAbVWSH0irzzMnlQYyEg55qSPO2YuZx+DNuaxxgvJ7fybY
         0YvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXlWY6O5gyTgmxyLN3aNp1pyDRK3hVIRyf8ieGSChMtgPPFRSMrdkScOLkaxdAt/7CFH9xiz0XLSrQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIVx43WSY5jOO0vPXqAxVVLt9bafakcD3hkWWaBYBuwxgybhReq
	pNqJ5/hCTU0bRu8MTrZz4nQ28OPthWMtJYtpQWvoqe3Rn3A2+IsxT9h9
X-Gm-Gg: AYBFou2SSeo5eG6S2ypbkhIPDAE0AyYwwytvZxZBdATwS+kHIkdM5YikfpX/QH1wKYv
	hNPjU9L9LmL8eYjMR+7OBZyPueXXC0ZbTQuIq4rpF9cBJwwEx4r4A63ZZ/OmlRR5tw0eTCSUBem
	0kmzbfIS38upZa9o1llPDe3da8lVDo+c1Y6rbojFc5xtYlT8ujqLjC/ssHSzR8tFCLym0509br+
	shoFE25qn0SABk0UXqwqywk7ym22xqDuYrMUYUPB5SnO1FglVvW+YCaHVH8d9YqQXFRp2oSNA5g
	gwHckevJbxSk9bELuHZYlXmyWW6UjYj4O7pyUiMYiRtiIjy/B3W8fjA3m9aoAq51QIH79GNv3zl
	9rPNZZ065H9WwE2WHBSZZjYuI68pPJ6Oj/1PgkqQaSjP4RvOW0tH7/lg/BBtXtaS4eBdBvxdCYA
	kNNKOsot7epkkr1gXHR0f2wHjgW+utb7dRwqwWRfZm5aUfMvhUMKbrMlq/zTas5DCJVNXCgVrsM
	x15A2wwbeij4Fh3G7BgUed1yri3cCKs9h4PE68Kp0Thx69ev2Yj3k11iN/9x9BottUKWW03v+n9
	uKX6mR7IWnRzLTX7Ui871LGWwEgs2VrjiT9CJQI9hJ+1VscoTHhrv1EZKG+O
X-Received: by 2002:a7b:ce82:0:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a1fdd22b0dmr39355265e9.33.1792597200529;
        Wed, 21 Oct 2026 08:40:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm27793675e9.0.2026.10.21.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:39:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Wed, 21 Oct 2026 17:39:51 +0200
Message-ID: <20261021153953.285222-1-ansuelsmth@gmail.com>
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0

