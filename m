Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803989;
	b=XojLFQ+PiBcbKuKiioey8Bq6nh+NjnkwtbsUYuaEZ/bX7yPxSsrSZbfVOJuzLiBEovNL
	 cEaUbJKFyB3DPwFLJFVa3DW+3r++3/Ds3y8Y3hn6UBlUV4Wc0LnpZPiPu3jSTts7/LL7l
	 B9XQiAAJ91MUE4fylQ86GptTQJHt9m3WnD3W3ih63k4XCpJ+pHZVO6JTSuZMH//qptFX9
	 GYM67JjO6e6QGneXOIeEmM4I3CUEuS7sKuM8Lau8w1LjnMYukbqGkrBft8MAG1GqRSdqE
	 mZMr0wZXb/KeSqxO+mCA4hb3eLgTSfm0AsJF0k1ZIoG7zwQbOQZ3EsP2YsBQV0rXPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
	b=dvBFgypYiSVY4KQIx0zlrToEMb+dfZ61Kn2x3BodugtSGmdAM7LjNdcBw+RZ9xECScXG
	 LHqtGVpT0T3M/GLoa+8jgizMbsjzQlcSbgqhnA4Ffk84knkG2Fs3+MWrKOLbiQ6/Y4NkO
	 YcDjdQHwmZpO0LvlC7Z+IK9+G6+wZfRXg3JJoPzsRvX5Y67GJG4OZZZ7RvSz1LovlYASR
	 dCFz7G8UGSnKp7IBKHBK1/bfWQxrYRuvSyiTZuUWe2Ta5dPI30G/KJEXQ4jonChdxYRqQ
	 5MoBmdV0148i6D0EfMDwvcvVjpHQie7pUt87Z58Ggc0udDGj6lAZTrhZOck3n/T26IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Um7xfrUH;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C45606D802
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C45606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Um7xfrUH
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677bc4704cbso966912d50.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803988; x=1794408788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=Um7xfrUH5mSx1uN03lhpaZnDvaTL+GIA52skHnOwx4ydNDqEnzkgjzlcYf793dlE/R
         0n8UJBxYiO1eAdsmHGSQHtcJwG8jn4pHS7+30fynjMUcWFYVW7XVl24TCFPzz/GiB30Y
         v1B7na8MOxBSxgHM80CtPFQnbPfegDJhevh4OMT/JJootan/OPhR22Z/7+1YwP+sT7yv
         /T1d4H12caNosu16eHDKsV/hNPqdHF5GPTy5wkkMARnlCaHI9xlMAN42LktUPGzq0d+S
         uZ25OsXpwZFC7PlBugR/lVPznvw3RNmiZEMGXQLrvRNCJC/9wtU98NaWDmLJrN8VAU5Q
         JLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803988; x=1794408788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=npVTZdcfnnvNwQ2E2DWHjD8x5vMkou0PXnuOUEp/lEnmq+vPzp1Ac6z7E/xfcAVN/M
         9qMMaFfygPpgGBTg8tTjmv/k2uC8UFtWFPCzzSdg/cxHyKa1Xg3tRAa7+yTJCSMLAsKy
         dKse978TmxJCRG3WUyoHev1gMOiYOh6KfPHHgvNEU8XGeH/Cdwnwgr78Q9LrFtqdRpiz
         yl6Y3PnjPmr0qRB1I+KWydVFZ8WwfFbri1jQTrnHb1tj0xSiYjumfWGn3pgMRb4wpiSt
         j53kRvPnQn084fIFudPrg4jm1izLkhabUOy6t01a48QsVeITaUkiF6lj+3c6hqtCWRkh
         9k1Q==
X-Forwarded-Encrypted: i=1; AKwUvBymPQbXA7pmeQJFxeGssrPFqhf1XbQgxfZGUCtuoJeJpAyksu/QzBx8n92sTwDcHURB3YIdIvl2hkyC@vger.kernel.org
X-Gm-Message-State: APuU4Z8EEsIf+UttZgvqLR62Meeb3Hh6n3a3RB4Fsz1FXrF3YrHVTtR3
	q32g1rixpO98H5+KODVsST/j0T5WSuMyQU0nWVeJhiYX8xxMc9JVrA4ddgN1JD9dHdM=
X-Gm-Gg: AYBFou0k8WQG/0ONP3/o+YBZoOHzRZIt5TvOkNd5tyT5TiVw6WHYZQlyD3OzVKzkNpG
	ACNFEv0lUS3Kyiimv9Qo1sMqxX3IxFRelLu9a2hVHrkxRWKEMgaBuBTU8a+p+/0ub3jzT9tHW0P
	Evuy3vpbXe/A7tzBwdgiBHnM1g86uArFyrG7kFhQPB1e6yPZjgTS3BBbljanovmfZzA1OmSGjz0
	gpa1WjwzslHamWIQNcRmTHFFTycFsU4qBEctQ/SIbnZV4zs6YMhk3rGyspAYzAgPfWZM7gHTxrf
	yoDSDlpAoeaKQsUPoOPF8wbyqUscblsWtKf/aV7rA8ApV/xaV24NHYq8Lb0KMsoKcrM21Q9I4Nd
	5s7vACU3RSX5MHqE0hFlkMhyoq2TaWUOlatrfk7+FGCslkSATL8PFSZQgPR85ZYtLWMTWk3kB6C
	poXcP1zauMOVCTybz5IxwxFDUB3zrKlMOt52J5y1/ABp3SWkv8FQ5hUTnwl2qISZrf+0dzsEmtu
	S56MNO/6N75oKqBeE0iiM2ebMDGG5Xl4OQ2/ojgvzEkpDO7wICUsYPejFbONSGaIKQC0+1/Y8+n
	c4INZfnPXrezGvGRd4Yyk6EA++QSsTozRUfl80JxSV3Ld9fMymL9hXEchAm5hGGArRYrAA==
X-Received: by 2002:a05:690e:c6:b0:679:a898:7da2 with SMTP id 956f58d0204a3-67ba50e4d9dmr6951996d50.153.1793803987737;
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:33 -0300
Subject: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The overlay only enables gmac0 and the MDIO mux, which are common to the
CV180x and SG200x SoCs, so it can be reused by other boards such as the
Milk-V Duo (CV1800B).

Rename it to cv18xx-eth.dtso.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile                                   | 4 ++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}     | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 49639cb0888b..440acd0aa55a 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
-sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
-dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
similarity index 66%
rename from arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
rename to arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
index cc93746d932c..cdb8db063977 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ * Enable ethernet on boards that use the internal ethernet PHY of the
+ * CV180x and SG200x SoCs.
  *
  * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
  */

-- 
2.53.0

