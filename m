Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C04AF67C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164945; cv=none; b=ddfVvPsa3179pvn5/qYr3dp6xFoj5UmRCZXSIalLEhxUQE3GI+WGgrxpqku2B5JYLRYRtBkOPurDZQkXs3IFkizC/kR9eZXyzpZxxXx/6YUAmKFUwANRjZ9Z+zeDUY1JCkZ7JiZmtGfgu75PZwTzY0GP+Zoz4fq/bgd6fimmfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164945; c=relaxed/simple;
	bh=HQ4Pj7Q7nmHe8ZG4IoM50c88eztmRXYD88gxFA5urxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5rxK0hN/sJHApV5vrhIbzk+/NdJnitNHmcWsIuSx/CyNbxCGNq5kZtSRYrebNZGtSybCWpVRFb7mk86+UsZ8f1h4BNo0jvTprqbMXKg3sLWolmuaBK4aX/qRGd5dbbkzQcysIpg73ncI9q4bhxS9u+2Cg3d2M/BH1FMaYpQDhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVvCp/uG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVvCp/uG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso7152152a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164939; x=1792769739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qm8eZB2avE8gS3tjlwo2WEfgb/ASMpWMg+gWErFlwrQ=;
        b=BVvCp/uGDLpCIPjXDK/SNNTbaC8c/u5Jc0h3WKFnUD1F09KFmZLq2gcNAwJeQs5ceZ
         4dKPbtXzvqIrlCTYi4y5Ek3PwpQ529VRw1+ZGPrulWBe6M6+LVCc5WVFSvxoyh1FsXqb
         QBkPQH/G/3x/zSkrVqeFym/5TuJvo8NbO7XN141IKlPK//1P3ZgRjaZwB18Gg9Yif5nm
         nnycOHbPz4Nhx82FID9OJ6rWVzy1gGdieOjmg9IWgTbIqSP/7neFGgu9cy2JBP5rSbMC
         iJ393EtPpDCk6Kfcq2RfiVk0TJjamSszdFIwhRTI4cPaTQQZjG+qLHSFGhq4ddPOIC9n
         6pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164939; x=1792769739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qm8eZB2avE8gS3tjlwo2WEfgb/ASMpWMg+gWErFlwrQ=;
        b=JdTE1SYx7b3yoWa3nPs9r+N8q7rBIy4LZkKoHnlOZvP4gKiiWCZxBYJyLQUo4GDIN2
         hDVd7IFEYFwdRNQ20ljS7xxrPsrauppyo9S6ZJNR4usqt11ctPzzzrk/ELazXjMshHcL
         fIRRcPb/FVgPmTaA93anOlVT6MWIWQBGgiqk2ZBiTActmHTXp/lWbTTua6/Zc7M51dvK
         ZVqQss8gwJoWz5IZz351cOE679Up1pL+Sxu55Lyv/9Og1hb//gjczPu2JMhke8AYEWxc
         wEh2Lk0kyOgFx9NqcRpqLHFvtg12HX9/JzlL4Nh/CsvHo/6jOBqOsaoW5oJ8a6V4yRgd
         EH+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrRdl/hx24CEK8GWS3VOwT+7xU/1Yw4n0zeURzJhbdkBqiTjazJOHANmSwqxSsJtRz3goJh53OgNgn@vger.kernel.org
X-Gm-Message-State: AFq9FYJdqkDFf27+Cgm5aJdB5VFc/nTgEsvkcdrhJoI0A7pyL0xz0d6V
	C0EDfQcercUJExWk/M3AtkGj0UZvFot/OrtLr4grDKzIQmyS9k+Gli2o
X-Gm-Gg: AYBFou1EtipSwtLWIO/9P4y5FWc57h5Sso6uubZR2n7MzlPr2lMapPMYrXffEg7hB3o
	BCAejxT+mqZyYFcHjeGc4i1I4kwy2DE6Af3YKCGoy+RVKgAsjlInCeYkmFd8d2mxJ8iGnl3/7vu
	6h1SaubHXDT6FNANvNVyR0EHNRq9KboNYBHHWpeRiApVgb9T7XnYvYWsxTzAxJ0NIEzkFWrSfa1
	XBt6G7ihH6Vjz7dnwbi0aXhWmUX8A0wTYC2h6kAdbDxeE5cSaGRZRjzh1EPtM5CUMg3Kt7cBpBZ
	ISnVZbrCc4CL8OKtLQEYZ646kbq2UF8yMVVU5rlXjOf8eNlHCKRTKwcwYVFP4xi93U4XbYyXH1K
	PqmTC/8bV2By8nUQ+xXvn97UNPqUYiV9Dpl3oZJfaA66Qs4JCHPF2VBA9yZVNt23hyCk2hWSh2b
	IQQc4PJ1ihpMVN3aHVDRZlc36jDFWJ12AcxlLO4i4LcqWPq3QhZfxooMGR7ghprC8JrsfnGsIHH
	KSRI00Lf1RYmKi9vrCS80p9Eh96pmVloSRtU0+TyAm0EFO6zI5ztFl4t62OSyT2fs0+l18CIIcC
	5F2n/y7u91oM46sfiXj+4MJAN8k=
X-Received: by 2002:a05:6402:2b92:b0:6b1:ef16:1850 with SMTP id 4fb4d7f45d1cf-6b1ef161c44mr9864244a12.43.1792164939192;
        Fri, 16 Oct 2026 08:35:39 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:38 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Fri, 16 Oct 2026 18:35:29 +0300
Message-ID: <20261016153533.3701000-2-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..255dc56edc36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1977,6 +1977,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zilltek,.*":
+    description: ZillTek Technology Corp.
   "^zinitix,.*":
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
-- 
2.55.0

