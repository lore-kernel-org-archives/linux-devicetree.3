Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EAA3A9D9D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941278; cv=none; b=p0g+4UlIuyBbicH8eH0GaCnYADiJIChVw8O4PNNwLUNU46XEze0R1Y7t3i/4BDS7FB4h4QP7Qu8TE3EcJZr823OpYAvvjo6XteFK9wn7OzcWxkHGLc3MhXaw82kH6+VeOV0laiKxSAq72pHgB8LeWeOyxj7xC3olsDzfWYGvpF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941278; c=relaxed/simple;
	bh=ked5OFQixMHOHNQU87e3oVNysEwBLn+3N65tqp0ANF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u1Cd7y68ucZ5VYglZrchhcezc4Gv2kTgIigO6HPizLum+sGJvKRT8rVBS6+dWSTPB9gpp2DiMAAwAKqoxe35Vxeeywj+2X0mSAVX3qCjmR/JWW+DgGyrOSWQMXGnzoql2SUVrIS3S2mDr+JcKPOtdSERTnDgy76QY6sZkq/wHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9Ajl/G+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9Ajl/G+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b915ded5so39748045e9.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941274; x=1781546074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGF7+QWpJakGRZT4D0HON+vY+LPOCmvLkPwggXClSNo=;
        b=Z9Ajl/G+7Y8g+uWqtvrjDCLjSu4ebwNVhHEvkQ0N1FjYMGsHjKpTLYK9zrtQWuq9S5
         lMW7+uBt4luRz4o15tQ5FyGntnVCzJeEJ1VF3t8OQGSfXt83IP5VC5K9NiMIrDDctBHw
         UYxM7Bcj4m4YgGlQoeFasuHS/50Neyv6EVrqpNnveKylzCBSy+4fKPSw/gjca4uMg/9/
         T7jsdRjocGrAQ5qEv8EhA4CIXF5NSkBx1WjFimOthCZWbpyUpPzHf8gD2ZHDyOF62MtY
         EkWDJa1pHp5h6FU6hN4MD8zPhy7bd//GrNIyz8LBc986S2IHOddDDq2airShaEOQCLUu
         QVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941274; x=1781546074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGF7+QWpJakGRZT4D0HON+vY+LPOCmvLkPwggXClSNo=;
        b=A/zjUIeWIawmjyOtL4whYqo8wmanKdT8ixXkdiJi/6XLLZANf/fJPHY2WSiS6CSYAw
         8BKVg3vcVKjCe0L5G/N/VjvZJlhl6t6QnEUD7iSToa1+gvG7PFfpZXoiVOOPDvxxYBMi
         cmLVCClqqmAY5l2SJpdNR4FJeXM8L1ERlKv71nd7CT7UvvCOBvGagQU/dnnLo+eBlbCf
         ACzRc1pPxrww3ib6EeK/al0kEYVAKgfrJ28KeVJtDhxrm3B/x3vparZFHOl8jm6souDO
         1cQb1V/tDJg1PzDYaTHdJxw+DeDoyIRs4cQyamZy111ONV6xLBLC2Aa9PrqR6DJWQeGj
         0k2Q==
X-Forwarded-Encrypted: i=1; AFNElJ90nJWGn+yBOOLFZ40fcDS6Fx8qpycQxZZVXDbQzSz7vXJ8ygDLUnINyiYkNIZhA7byvZNH1DdUuYCE@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUvnhoQeoMZGIMACxfdm6Qtytz02iqeydO47CiUQ01YEuqlg6
	4aGw0My8gmkbQFPEvnsqmMseVfjILL/3a1/66OyUJp8AbP8R42aGZfYf
X-Gm-Gg: Acq92OHNt6aq6aJmZHaGHy1jEUg3tFftOJJ3ALiZ9B4xQwrQ+znT1H1ZdY0Ut7z9CXz
	+dilzi8t273mYDFWsToiZL5juFXhZuc3yaJ6fsdiw3CcNDcHbkAEGS6/Baul7t4kItMv9a52viX
	fGf7OkPxgwI7FAqtCBSRrEQrLBO/8bCKNuZYoTphhLA46EaJvDDkFnI8Hlc9va7wjlrNSZlUVdC
	blhlN1w2B24AkwlI0NMpknFMaVDo9Er9VJA6u6VsT1rMpe8nfm3IGeBGjEFJWoPoP1qj1ohDzx9
	MMVJoy5X/9Z5vCLS0BtX4CrOKb7sozIj6VLHKXt8Uou1ols6VjB0saat1QB9Xxx680/FV118JqA
	CRZ2wqmmfA0ZhZLuuF+2dcYE9Nikl0+RzANjoH4adeXao43mTOzRG2dStatBgIKGmbIxlUmBcAK
	cV9GdP2yLS230LbgObAF8pL2h6ioPTqZGNif159MDzAibj
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490c25b39fdmr304459345e9.2.1780941273354;
        Mon, 08 Jun 2026 10:54:33 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3529e0sm56269275f8f.28.2026.06.08.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:32 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v2 0/2] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Mon,  8 Jun 2026 20:54:16 +0300
Message-Id: <20260608175418.1936892-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the in-tree NPCM7xx FIU controller nodes so their
resources match what the DTS actually describes, and converts the legacy
Nuvoton NPCM FIU binding to YAML DT schema.

Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
nodes, which only describe the control register window today.

Patch 2 replaces the TXT binding with a YAML schema, documents the optional
memory-mapped flash window explicitly, and accepts the existing FIU
clock-names used by the in-tree DTS users.

Addressed comments from:
 - Krzysztof Kozlowski : https://lkml.org/lkml/2025/11/13/473

Changes since version 1:
 - Drop interrupts property.
 - Drop unused label.
 - Keep reg as the second property, followed by reg-names.

Tomer Maimon (2):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
  spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema

 .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 ------------
 .../bindings/spi/nuvoton,npcm-fiu.yaml        | 91 +++++++++++++++++++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  6 +-
 3 files changed, 94 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml

-- 
2.34.1

