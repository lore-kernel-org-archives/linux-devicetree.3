Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04F4355F53
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468039; cv=none; b=rS5y50ldG6NFqC9Wf/korDWgA6J0d0NOPFoGt8i316ZlMrjYqbDFRA6YiMLV9ALaLdrLd/LNKTZgJfdsvNj+Hhok3F1xL6BSK1UPuI2XlC9xXY87awpIg3cC5W21bOit187FjLte2vNqlfxhXVs2RBFhe0W4/RKRn5osP4zRC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468039; c=relaxed/simple;
	bh=zJ39uAJoSBW0uMQsIOlUyhDXKamg+kliqnyzBdMjWWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0CnE5H2wPXCMQNe+qWvsU4bXbmmxOtmxC6p67UMkN0P3Laa1lKANPd+KyzhOX3PELnalEI7z92X9q8gpYcEw5HgjdVrXggk62jCfHEq/8ll1p5zTKvmzF9Un9xSZfUTolms4UNx/XwvYgcAhUSbv2NClgKNg4K9WKQZyol/f14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=dFdRJ8xp; arc=none smtp.client-ip=209.85.222.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="dFdRJ8xp"
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-95d3492fb1eso2722077241.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778468037; x=1779072837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBzxrwb3u6aAy65Ew28k5XS4vquizRynMypljlvuLRY=;
        b=dFdRJ8xp53A2mtaOcxIEqnKReelAaRk/ilGt2jGPZ3VP3eC9zkKAXBEj+DLD32VOK2
         8ChWMEyrhCic+VBtf72guuYI1fH3sUbOr8IRWLBC4iVhGlKZ+2WZLQik5oGl0xFPdrTU
         w350kZCJo1hFUWNCJ1ZadB0cn/LSqrm7r79+QcYSj18JAJi/JqjZLoHfVMfan/N3k3dl
         pCWEAiyOIPGWKVQBVhUPvAOEbX6xmCJCfMwKIQfUvFkeSYAEF0+4f5ljkds5WbHnzgLk
         50L08n01V8zHt0FdJlhYs11i7QLNEIuxBSm//B+XXdkvh2MwRolh7px+MRc/QIUFTCri
         zYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468037; x=1779072837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBzxrwb3u6aAy65Ew28k5XS4vquizRynMypljlvuLRY=;
        b=sNMQPlMuarX/gElp4cPNbvVZd9NoN+f1XWAihc7xk2L2wXwK9FyEyUHFwwPArO0c1K
         Z9u7URDBbqFD9ABl+e30zD4gPOCk5KJRpSra/25ACF17JmvupvFmMyZ2Ky+6h0k5ig9x
         iST0ipVnRTPQFqfIjCSeIoIDjebGzXyBSsnYjJO+gXJN+q0FuczLlbInklRfVD8MQX2W
         ZtdMTv4vCRXy0bubriY6G+fLeD/XvpyunMb1T3XvPA0bG8+Nh7YaEMseOKCp2pC1Rs78
         NfFX31g/ioj5byskn31OukQDbEkpN/vmLMs2zCejNOhkp0rSHVE+Sxe/4k9hRKDGVqqh
         8N2A==
X-Forwarded-Encrypted: i=1; AFNElJ9d7BSID9uagqoX6DbCgqmBO22266GUrYDeDFzqz7WKMJVZJJ8WhA/9UUoqzj7R+nJctREF4JsnKk6J@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWqCH5rU5BdI3UvKa9UQS0l26/z1mV2EeX+QDCDMqjtsTlhns
	XEs8+e1Ux7OOHxbciDJGUd6HtDq6gU7wvlBGdG/lQK8rAHOn9WGIzl63CNB7AleWqzh4Amh7cof
	HFwAVj4KunR9oExzAQxhXm5fZ/AnXypXShzvm
X-Gm-Gg: Acq92OHbK3GBN9aiK4kXvZJbzREZarfoNlF7OpfLT7zWas3J+hkN3KA1mR7e9d2xXIE
	HCO5aBe2YNm99+fN9vPSJW7KmLKAocwPZrQ0cFZgIAH48b67neJLqG5Re7TVZv9Ry6VOyfOc9D4
	Xy3pw8NCYREYLm07PEgIOmSRQRu5irK+uunt1Y53YGtZUhRo9H+8I7XBgblwX2ji+aN8WDCo9oM
	sJa+dqM4GWt4OQ5SJx85aDRONkv70bTcZYNG0A2BAlhJcxipRri30mpdza/LX+cY3OcZtNOTNTo
	h9tnW0mCUzBUx4tXD7XfY/oFR1fIjFXlkbhvmzTecNpv0FM3LOLi+6RT/QZTDOnI1lE96EnxB2e
	MVZoiWT16LIpprqmZQPtp69ZSg/W1GhuiXe43sWcOLKxn
X-Received: by 2002:a05:6102:5698:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-631ec2d1a1dmr2814871137.1.1778468037614;
        Sun, 10 May 2026 19:53:57 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6313ff6c191sm698744137.1.2026.05.10.19.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:53:57 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/4] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Sun, 10 May 2026 21:53:47 -0500
Message-ID: <20260511025352.106126-2-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
References: <20260511025352.106126-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..ec1303140600 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1338,6 +1338,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.54.0

