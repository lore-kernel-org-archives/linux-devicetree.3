Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721580;
	b=sMrsAgZJEAP2Jnj8eALb6UtWw4YfMP6oxEw6jqL3+ck1CJd6FTeZ2qksTY2A5x9B0AYF
	 BkVBULqx7y1FFqhfoFIbkFBfiFiSnpofupOeY9NMwz4I2gHWT+cRRDVA37K5sItEKai89
	 25LzzYFn97OgHbf4sxFm8ervJmrm3Qm7dJrdWvetqoWKDwHOvs1rbXZGobx8R/BvvDbZ8
	 JRVJYaf+wetekdK1YxPCaL85KDNBxQto2Mjxd56/IR+P6fU9G+PtoGJAnRy3oHKeCggNj
	 3QieS5gg/RFNTLBYbpTa/Cte3Io+VcD6q6Ggb5OIdefKltu8TDbfWF9xvbvvBXcY4Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OuaUxwS6JtTJWMd+hXXNq/iTmPJxIas+/RtLlIzqUXM=;
	b=ZB6/3nsFBv1KdJNLos2upjITJDGBvo7s4KTtwXbigJIJfjdGl5oNmekHM5uJGU5OPzvj
	 8NpPi1dGz+r8YnHVZIyvSroYVCLsgMVdaEcTd3CY/z4Ctwup8oaIWzcnv0lruei7uqlrd
	 ACt2Ux4kS65uk5JANYcUU0StyWhr/JVZdqO7Mq6EdB8C1abGzZ1fiG3keuef5N4WWkDAQ
	 kQv3uurV1j5brLNk+/2GuHzcgl2+VYHuGWGviJq3bOUeCnrBh7f/9lV1Be/CezXJZSPjj
	 xedqU843UoNDRX+1ZNg5xHuwiCYZAWVRVWxmoZX+Otf7UmdX50EcJgx3BU31ydnK8eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHAw41k1;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46842606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46842606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHAw41k1
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so52364475e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721578; x=1796326378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuaUxwS6JtTJWMd+hXXNq/iTmPJxIas+/RtLlIzqUXM=;
        b=BHAw41k1O5L/8d1yA4euhH7KmKjak06vXEdW1+yNf8OaJW2NTGuviUxpzbpkqseAmC
         1MM9Lt2VLfKa4FhI5X0Ba4nsRTvcjsHp/pPO8zoVTzpfk/EJ0plxaEaCQrECkDR+F4+V
         Vm/cekink0updJA5rRWMkDC07iLiMDwagbhijxuzCZ4gAcF6xGD2AGltl+id5Mh/RbQV
         QV2kjXgbjIZ2upC0e+gdDgK5jaAEBIrfGwu0crmZucAs2rmubtJ62clU4J2XzodGjNGJ
         zUpodQeHb6R8BP3PuJ8jgcZEUUVdju9ijzzUS8cAJBn8i3sGNTDk8eyit66OT2bwj0Z9
         3ZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721578; x=1796326378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuaUxwS6JtTJWMd+hXXNq/iTmPJxIas+/RtLlIzqUXM=;
        b=vsaciS+YoHcXBCG1QGN1AuJX2osFZMa9K8WVKUV87W70EMMdVptc48s185ZQd69Emz
         31lx63krbEuklsiEOXOx8qW136zNWAJOwZbRfno85U9I1YeW/5yYiG/M68CsLiRyI2ac
         UXERxwNugjsqiVsaYClxXOLtqO+Wuj1HNl1nVMl+A61eEeyMZGoqANZywHF9rJKKopWg
         eqq6ojpz74ymzAi591uIBD1J8ais8mCP9JcXU+YCsl9DdTLq3UgeM4l1NQlv8Z0oF2jW
         snphnI1sS5OqE4WhF96HCJSIT5rQbTBqShyXBd09pouqx4fwVyyuRNb3Ftvck3tCmdQ1
         wcQw==
X-Forwarded-Encrypted: i=1; AL+hErEmMilPqRS13aDDeb4uQtqkj9bUsj00/8mKBEtO3tdaru8+9abkoslvmu4mKc5iQXop6Uqrgw+1K0CV@vger.kernel.org
X-Gm-Message-State: APuU4Z9NIt67LZ0AMesorTlcFjCimCNG9+eo6QyOw2h9ZJdY7f86KTz7
	58UeXheah4D6sABrC5Rmk/7pSobqKOcDzghrCi15NfxeZAMG90zWLL9x
X-Gm-Gg: AZFdTZdHIySVyYwMe66df0ID+LQ41ndi6/UO4ETcB7tFxzA+EcnLrYXw8aPp/I9zg+y
	w2RJjJkY53T3kEz7mcMpwxn60fOGr49MZsxFr0bZSpHAP2a5Q4gX0U5Q8Tp4Nm41qY6LhGnbd2b
	Jn3IvGUuUOfZE46mKS0ArjW98o0xqehuINO3OQLpo36KPdChsuk9D6wuq347XlaaSwUH9/Pb8Wq
	ZBpNOq+wMChocEtEIfk1V9pNmaIrGlq+K3FxGnqi0RrTmRA5AJeKD04Icqxi/yGF0sR75uUxE3D
	dqTGmZN8LTpl5Q9Hlx8NBsa6AAYE77BGey74VcTYjxYOf4QWGHgx2/5SJ6YWclaFjb4zIJEErcU
	FE3e2V+6IV1z3jZftOmiC79MrvV0giX5jObW/RS94T4bg+s/pjFRCNdMDDOXljAj3yo9WMN1pBL
	Jpa9pmShmFpQaXGIij3CKlRpVf3X9LZC7/5/dYikQhhJ5kirgpYCVr5Nxjced+mRHSB690mo6sf
	WGzdLZcIdfzf0Jw4AqiDpg0dDn3Ll+UEkXqEcx1wFQc0cZ9vfQcWOhMs+RLjEoYCLbGC4wVLzTa
	JQkF/F0Xe0WDQmIa6QXHR52ngVMvVRWQaBjpXK9iDg52Ew==
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr424233425e9.32.1795721578321;
        Thu, 26 Nov 2026 11:32:58 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:32:56 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v13 00/25] crypto: amlogic: add support for G12/AXG/A1/S4 and misc fixes
Date: Thu, 26 Nov 2026 20:32:16 +0100
Message-ID: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This is v13 of the Amlogic crypto driver series originally posted by
Alexey Romanov.  It rebases the series onto linux-next (next-20261123) and
adds the fixes required for the current tree.

The series keeps Alexey's original implementation and commit split:
platform data, IRQ handling, MMIO helpers, multi-descriptor processing,
G12/AXG/A1 support, hasher, and the per-SoC DT bindings/DTS.  While
rebasing, the fixes that landed in the driver since v12 are preserved
(IRQ handler return value and fallthrough, devm clock management, DMA SG
unmap on the cipher error path, probe cleanup and devm_kmalloc_obj
conversion).

On top of the rebased series, three patches add what is needed for the
current code:

  - drop CRYPTO_ALG_ALLOCATES_MEMORY so dm-crypt can select the hardware
    engine instead of silently falling back to software;
  - add the ahash ->digest one-shot path and fix trailing-block handling
    for digest requests;
  - minor cleanup (unused fields/includes, stale kernel-doc).

Testing on Khadas VIM3 (A311D / G12B), booted with a linux-next kernel
built from this series:
  - the crypto self-tests (known-answer tests) pass for ecb/cbc(aes) and
    sha1/224/256;
  - dm-crypt with aes-cbc-plain runs on top of cbc-aes-gxl and the driver's
    request counter accounts for the I/O.

Attribution is preserved: the original 22 patches keep Alexey Romanov as
author and carry his Signed-off-by; the three additional patches are
authored by me.

Thanks,
Jose

Alexey Romanov (22):
  dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt
    lines
  dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
  crypto: amlogic - Don't hardcode IRQ count
  crypto: amlogic - Add platform data
  crypto: amlogic - Remove clock input
  crypto: amlogic - Add MMIO helpers
  crypto: amlogic - Move get_engine_number()
  crypto: amlogic - Drop status field from meson_flow
  crypto: amlogic - Move algs definition and cipher API to cipher.c
  crypto: amlogic - Cleanup defines
  crypto: amlogic - Process more than MAXDESCS descriptors
  crypto: amlogic - Avoid kzalloc in engine thread
  crypto: amlogic - Introduce hasher
  crypto: amlogic - Use fallback for 192-bit keys
  crypto: amlogic - Add support for G12-series
  crypto: amlogic - Add support for AXG-series
  crypto: amlogic - Add support for A1-series
  arm64: dts: amlogic: gxl: correct crypto node definition
  arm64: dts: amlogic: a1: add crypto node
  arm64: dts: amlogic: s4: add crypto node
  arm64: dts: amlogic: g12: add crypto node
  arm64: dts: amlogic: axg: add crypto node

Jose Nieto (3):
  crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
  crypto: amlogic: hasher: add one-shot digest path
  crypto: amlogic: drop unused field and stale includes

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  32 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  14 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  13 +
 drivers/crypto/amlogic/Makefile               |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 605 ++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 281 ++++----
 drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 510 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 120 +++-
 11 files changed, 1219 insertions(+), 378 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.47.3

