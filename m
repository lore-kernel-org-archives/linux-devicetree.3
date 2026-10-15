Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA34C6500
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061396; cv=none; b=h1bMc0S8ZpXV0U26SCT+50ARxuo3pf12ywYhCzU+S7DVnBpd7hU5h/MrZ/sAvwTryivJusVNJTCA9EOQtv6OYwAoJfPR0V00SYJLuFbHZHZOjqIDvyvEiqmm4y7lgBSXpNs043l9m7WwrDQm7e/2CHVPSOHmbwUZxnIwpALgqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061396; c=relaxed/simple;
	bh=MdVnzxM/WL1xMOmZ5fkiZNZC+hOYTLuP3CwOMPlKirY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjr9MZlKZg8bL/t7X7k07idowFdocch4GM/to+5vZBaHPUgOA+rlx7oaVVUYJX+P66/hZkP+t6mAdfPnhmvVvbvxVMKUVByr7xYQDQcQWC1lRY3/ZHMzxsdHyz34nDkSjNpMn3C3K7jYONswySxKCZZ5mU+aw8eZfu6NVw1dmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgLQmLTq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgLQmLTq"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c350db5a761so688054966b.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061393; x=1792666193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKvVNAZIKBPJrUX9wm9cpi3TihxLC/jhSA17k/UyT1Y=;
        b=fgLQmLTq6sTUyV1has2C3SWrhGIOWqbF6lsWnOLqGeFRTzlXPrX/GjQQYADCKYUUQA
         qw5Rtkq5wRXupXG4aZjf1Hh/j+TG1Y/+QJokacx+i3RyIZagXHoIa8yaucp0unvaO1pT
         ImYdmDF1vKAbL8YxkS7xbD3cT9VjdFM2/BHaRWxdNqdX1eQ3JYl8Ix0fEFLb8TsH7CJQ
         Eu6cAX866AVnWDpuzz4gMf7dfK24MMN16/jJgznka/yubEL6EIYXTa/iwnpzLhhBht2y
         FOv38NZhHGdDTopdv65ARfCE6Y1bZGg0tIrE+O2XfgPshwvZcwL4d7kAnp61Z8Zt++hF
         Qdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061393; x=1792666193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKvVNAZIKBPJrUX9wm9cpi3TihxLC/jhSA17k/UyT1Y=;
        b=VcLutZiMNgFgC8PLyeVo1jOTaP4+DGQGRgB1iykDarVwRWm+4cUek2lvfmnOn/OHMU
         qpnQ2JVG0V/7GQ0peDwOT0M0l9LQamUI2kmUk1Us8kzb5h4IzVceE+gJGns6nhebgp8F
         TI7w5qrQfJTgkl18lpJglFvB6tEZYziD9SJHGjbN69wTMM+k/3EUEzSj6uHONfrfLZJv
         beLBWcqVwtMhicB9Srx2qOZVD6VUKRbeRlSTprqelgVYiyAVNb3BVleyYa4PxOrQCAIp
         8u0l1IMdk3cWGpEpWx7cRqxnnomDx4QmEjjPexAjQuB7rmBTIQ4mAy4Vej5JLxsc2aSX
         FRpA==
X-Forwarded-Encrypted: i=1; AKwUvBzVNwHE8/si8WBbX/56D2A2Q7b8W63nQbg2zXmcmzRYSQUKhsHvK0eKhdlqcdWJt+yxUzb+flbXhJEo@vger.kernel.org
X-Gm-Message-State: AFq9FYJwJavKIWuU67fzpf6GDXuL1hhbkCbxDvxGy9i6hqDLih37wDyV
	N1p1lJv6YA5F/cOlbqssrKgcLP7zw/bxUQ22GcGBlvgx6LunuRkLjTr0
X-Gm-Gg: AYBFou1v8QGMDksu4rt1MR/srVs/+65B8yY4EKt1DHR+9lvfGibe0rKBwxVe+zVWxrs
	iK/E8R/ky1MAZ2MZiqWeMNNkdTjUP5LVOBvPmZXvOmxJe//wH9egjX5K+IJfEplLsxX1lUfEn3Q
	n4ykXE94SKdYxy1BW3DwYMswre27Iwhy4cWWzES6ouQaTD+1LgcOYXb3mkPruedVuxyQyHdehEd
	kBAP46y5ASRx9NLYv2G4rnp+VZnocBoQGU5XYAoTrF9M/I4JU05tTrJdPhdVib/RaUwi/lp6CmG
	9ckhgWy9FPI1sKy9idpRmggW5rfEy/XKERl9qDYKlaqO7XH83Qd5IyQpXuAfTsxTrXQfBsBgFxG
	CjnijeTS4TNUnNRsdoeBdWfRkrT7mQZeDImWC55FdULiHf6g9mWS4inn4WoCjW+W4LrEdlgouUG
	5M7CpbSd061N6upKq/V7n/oO4M5vsySRBQ6CzRQ5LL2IH2rJ7yzFNBjU3Dj17fZWTsQSlveRY5C
	pJdDclqWHy9IDh9OivJ4nIHsIXmAYB959rI0NipT1lVdLli62ZmGWI/Dv2eyLvpKdiCPmMAcDTh
	VP5PktLfRarNCy/Rqc2jfZG8o+U=
X-Received: by 2002:a17:907:6d17:b0:c26:1648:a069 with SMTP id a640c23a62f3a-c31aa08e576mr1775161966b.36.1792061392450;
        Thu, 15 Oct 2026 03:49:52 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3af45sm107890066b.33.2026.10.15.03.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:49:52 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/5] dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
Date: Thu, 15 Oct 2026 13:49:42 +0300
Message-ID: <20261015104945.2687162-3-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 is register compatible with the DPS310, but has two
more pressure calibration coefficients and takes its temperature from a
different sensor by default, so it cannot use the DPS310 compatible as a
fallback.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../devicetree/bindings/iio/pressure/infineon,dps310.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 1912a1b0b4ba..416117dfd927 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -11,12 +11,14 @@ maintainers:
 
 description:
   The DPS310 is a barometric pressure and temperature sensor with an I2C
-  interface.
+  interface. The Zilltek ZTS8032 is register compatible with it, but has
+  additional calibration coefficients.
 
 properties:
   compatible:
     enum:
       - infineon,dps310
+      - zilltek,zts8032
 
   reg:
     maxItems: 1
-- 
2.55.0

