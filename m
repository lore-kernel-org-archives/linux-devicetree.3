Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58444431499
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164948; cv=none; b=pnzbxIt3g9sl5w2yr8zSPVZtRJF3OJJMGdYwI57nVUMwbxLYmFlMlz4HJZpBQSE3hMNRQF2kSZS+lcb47atEDHM5UMSsTp4YnlgEK5TBH2gnU973mQ4NSjS21f0z3RQve+UkhDFd+U03xBM31I4A3Uxrj3SVX8gFUMlFG7pmJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164948; c=relaxed/simple;
	bh=WNP9t6TIXZ0Xl+cKQ0K8b690KUl1scppTVbII9h9hh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrzarR4tloWcHGY9ctTF3ddAQOqxVUmJCoiPHhjA4WYJPhgCV+6ZeaPrXoefbHI0uqDOT73WOLv6aOFFK/aLjGfRJJif5IvEbLMqkr/bxWTeElKvSdN/0I3w038FJMeAj09oiNRzt5m5mpj9rp6xFDK/fRxrRx27xKFU70eyq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ecxs0mxK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ecxs0mxK"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2a4e013a44so3137066b.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164940; x=1792769740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZCkslrjV5YGHVR25wzRLTh0GGDFeMzjCzaLuY5/q3E=;
        b=Ecxs0mxK5B9M9/COKsNgpCDdPxMR/VLhS6EwF7zmxxoOSwjfj3VLjKrNibSG2vloN3
         0qXzT0RAv+aTNWrqtq21CCv4KeLPotBcYtMErlMQBpathX/nyP6/hVj0KvwEisBD68dG
         lHjbeU045wATCQLANxoNcQ/ATW6mp6ZiDis23qo9p9Gk1y861gWFiXD1B75LlCsGGy48
         J08CMmL50E59tZjZRSTcI4X1H4ikgz+2laVdoezYkT2xNDStN27/Cluqzs/VivjjkpOM
         6dFCTFAVRsqUO9YHtN3hWbHIq08WgiVCxTqidr2FpNQx2T/ESUZLrYjlrkpHgvEZEVR4
         76XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164940; x=1792769740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZCkslrjV5YGHVR25wzRLTh0GGDFeMzjCzaLuY5/q3E=;
        b=cW5hDtGY90oL6A8DYajKPWLXcus7aT7DnMb4Si+Z2xqW/6+G3DqFvMuQljU5zmuraX
         pJh8Cu1Tz8VQIU0kVbYyiOFfjPkSW9swB9QDLT7swjx3vqw1oNZyqaFPK6iwTX02cxTS
         qDDNSPtnlCokEbu1pnEw+OhDWJ3Nu689IMD193Ujpukkf+WKzuYDGlzgFtfGhe1PHpIx
         BtTjAgaM31uX++TEowBsMB8RUNFfiZwABvzJ76hbv3raJ4XC8kEJu6wtTA20qvG11QAx
         uJ0uuW2qNd45E/3EtH5nsDaSG/YTBlnplYiKrGWRns4L6DgAkaKWHvHaE4nUKaW59Aju
         TFDA==
X-Forwarded-Encrypted: i=1; AKwUvBz8k1b8rOavDh1uDO+3+QdqkFqL4emaQ7MZFKhN00aa2S7L8qkg44W74XyrTBeVf41dS0/DVyzDFBl7@vger.kernel.org
X-Gm-Message-State: AFq9FYLes4dkQXPLBcfZt52lma0oWOg0AsyAEE9XoP7sgzGlX8v/PwpR
	a0io3MI9SDqXWllhlo47dY/KUZZFeAj5mMqm9UMPIUDUnyxx28x0EcCf
X-Gm-Gg: AYBFou0bXmfjLCRbrVJiymx87HzPGQtGeGdZ1Qag+TbmuR4qmnVoQHHkml1m9lGqHhh
	poDw4S9QrdUuXiDlPs3AhAI8nIBXByuVwpe+SQecjqMSlqMF68vagWonR71yq0y5VJ7mlhiYM9B
	gAnOTrbygCz+LFrY+NUHm9Ug5eXNFWH7+LmKvVCpQohYSy/ORYjAtmaJYetaHUiiuuR4Kf+c78G
	7MAIJgt3L/O6bbljwSB75vRk+d3Z9COa7wS2uOQhkVVdY9mn4SyIXDHetl8HjlOUevoQqcZmrtM
	o2SWdS8XXmFMkaO784pubG34rWyHgcDFSi8ENpN6498TbxkutsBp/U8YSbW/BdNCI7OErH3W5YG
	vgNrzwwqH1egfRvo7LjceYUlRMvzFSy6rMfO3DkMXddpuaYcGj8pfzce4nBt7tR/9SP2uKJM1+b
	UM324Cx6Secx4BB5DKl3Tlq6xzTjVyRqO3uTUiZFnQCN2Juk4C/B02aoqW0h3WgjftLAeQXGg1S
	SAqUQNURa99mOnjc481K0NNn4GUMvt7WV+odFa7966+t4Nl2fvrNowyNzcajEHV/RcbSqFZmaoi
	pvVnjolc8CCojA7oeAQkxMJpsao=
X-Received: by 2002:a17:907:9702:b0:c3f:7e8:235d with SMTP id a640c23a62f3a-c419b13cb81mr17186866b.5.1792164940403;
        Fri, 16 Oct 2026 08:35:40 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:40 -0700 (PDT)
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
Subject: [PATCH v4 2/5] dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
Date: Fri, 16 Oct 2026 18:35:30 +0300
Message-ID: <20261016153533.3701000-3-paulius.zaleckas@gmail.com>
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

The Zilltek ZTS8032 is register compatible with the DPS310, but has two
more pressure calibration coefficients and takes its temperature from a
different sensor by default, so it cannot use the DPS310 compatible as a
fallback.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

