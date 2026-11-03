Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739957;
	b=Ok9Gf5bNeOepzSUcxST+qF9UbgyESMkn7Ec+RBH6BGUNGEW1S1kURgFQiwh13zTZx+xr
	 5UQAIkxVZd124/Vc7FA2RcwkL0GlX1Yl3BmXfrOtrduOqbG9JVjuHOwNkOc8jy6KIKU7+
	 /ReK+cLC2+nVfNfviCLeEMlZgxQhtn7AiBZFBcsFktTegH5kBXFoaUJDDhIk4OuzncSYI
	 FqRufUsfPs9Q9j0RVJtSlfcePUjcyQbo082didCEa+816qVM5kjXVUPsTuiOJ3MLxWnG/
	 ud6Tig5aPhXB/iC1j5oRUmTrwkFgyUzFHKCMaGaXujzP8sADyjt70CSShd4lk2ViBhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
	b=CqeHi3hTMhYNAmaADM7Tvcb557yL4J7Hvukd9FUPUXDdXGw58rKEDFDpnNS3WgYLZC+u
	 4M0d7yZIhKL/01cJglt/26VHhfqRD8vhEuw4I1dI1xTTeQerNXdVxhv3YWlmfKy+znlZ9
	 +RQ7fXYrmy/Zsym4+j915DWmwDRbLQoVZ5um88XrQ+Xx+5ull0fuQXrq7l2oAC4g7TOH/
	 iaHljEhgDGkQhQU9fJQF5IHwRO01ZQpHcMHBj/pq/hX8ptRyXfOzll22l/K2lzFAqgx0z
	 s3MWKrEaXm8tm+3CzS2rgja7MFVlG088Yg2vESwhuNalNGJp8rlJTupQ/G0oyrhghiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqpcUbkp;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC97606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC97606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqpcUbkp
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso16858f8f.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739955; x=1794344755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=hqpcUbkpAbc76tLYMwSubgMXF8WGebDUQp9v+SdNEyl9bx6bjhb6ZGziJ38ALV0gfj
         x2/0t9dh4kCwKszoNt4CMjwAXuHDzmb9923xIpKDa+Jb8Xn6/PGfYmHwn0/07q/yE1Ar
         0iSnKpBtpxA0ftV6+W+cJJyxSddXbPNtdFeDQyjwVpPFi7mKmqHIezk6Ujm/Ah+2+ACG
         LSqnc3P8Z/VpKlYrbXki5YY90EFkKgNbcIJQOD+4LUsxu7ShXa/1p/PRnKAzPYhwUT8z
         /EnqEm+KF2ty8z6j9DRfJfOiPUHPR8x6kq7lRimB0fOrQajAW7dbyLnje5i9JEf9axIG
         G6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739955; x=1794344755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=UvL0dDKd5QUGG1uUXwFQWeI/Ung1Q4auKoXuXPF4NGk0UNI4GyXTsrAenvTNEN9htd
         vrbLGwDYWKaAnssL3K3hktNJmwANCOgLIbGRK3SFxX+4iCNNhsQMXCeVWY5GOf9bTvDc
         i82tFR+uiiDBeoWsNOjKTLreTSgOsgaQCvEfvH4RwFLTdWf3SjzOc5KeV3jFH52TO24X
         ROzBO2IGQ7oVslktHKb7TJSWP1FB9h7uhzp2TLQM/ozzn+1Q5XsWpGsd1K+pTtEBOVPp
         LlN60PQugUQuQ60WPCg7BxADTUZccQkGST3o61nfaUYMFOvaOu/hOPjtHLvbAbIGOhnu
         LQqw==
X-Forwarded-Encrypted: i=1; AKwUvBznj0bGK/ofQXmq4A+YNoTjCrySrzt+IlImjj7kSdDMpGXRKnJccU4p5hBIUlEkF9Mz70LQ1HLhxXh3@vger.kernel.org
X-Gm-Message-State: APuU4Z+zZvBNE/VTCNjfc8CF42tKzYlqRUKGyBnDt/NhNq4YIEEhqTBf
	eDZ1LZ5K/wXZ2/dUCBUN6MFwAqAMsUp0mU4uleMi7W/vKM2WLQPrf2Cc
X-Gm-Gg: AYBFou2n/H38N/Hc042K9sogwqZibZSxtGvEExmEkDXej+3+8fU+wDL6NnYUdYjYuEU
	A1pcIMugOrmyBcxKu0yKAJtH/oJ3OaVJoh/QbHEF2LPSDsvHFVOfpcfz2D2aRf9q7OIogH2UPwS
	OK4wmSDu7wxtvjc6u7WFyA294SxI0cCU2kg8U8IZvMtYU9dsis40fbrIu9jsNzI4UnzdYAnrStr
	a6jzYPLWBvbr2t5dXrAXyHdjlfaBDow4Yffife5BjIhtW1Rt989TLwd0dvL6+jrlG7v1PISLZDl
	Y6ujz1QWphbpvo7ky5E/FvNR3r9ATEdHX++SXXAE91HSo86u5vNKcyxE398bMmfegPltoXM17z1
	Lm6aUr1/sQUZkqFjzIikzNRlcdPQwQuH18lyYENp2CLYjqKLt80oUGj1PgT7UDyU7f0X3Hfsa9o
	skgr0G/72fu4JP7Ee2/9yA3toUmrXWJD+azogVOJKvYAgK/WgGWm/i+TPwVa70DBgJzXG2shc/P
	02M0hR/6J9loi+DQ+rzmmqDS5pHbHQU7o2CYjhR2KBzZDGsT6MK1xyKxzey1ezg+jUTLTmKxgJG
	RAZCYTMQAISzfs0jRoDfPvJoHDAz6nRM98oZIR5tIM4opbFxVEKxdnFvW+uLw4r9Ic/RYUVlPBL
	4GrCAjX4r8qiEbz+dU+bSrLk/zRpzNTOKR3KgLPHlrgALsjhVf7Hwkx8=
X-Received: by 2002:a05:6000:29d6:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-48e6e2c2f66mr20419511f8f.6.1793739954927;
        Tue, 03 Nov 2026 13:05:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm41850f8f.43.2026.11.03.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:05:53 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Tue,  3 Nov 2026 22:05:40 +0100
Message-ID: <20261103210542.15965-1-ansuelsmth@gmail.com>
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

Add a dedicated compatible for the Airoha AN7581 SoC to account for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v3:
- Fix typo for account
Changes v2:
- Add ACK tag

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

