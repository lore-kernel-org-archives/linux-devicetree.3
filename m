Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2308D4908A5
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 17:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786730094; cv=none; b=JdnJCKDw2/PvjxG/hO3Nm/pHihWgioUChHFP3t0IPsYXw2KNB+J134EaQhxCoczMReu5bAJ+PMo2BDZQzxcZPiQw3ZpQwY/lZrw7uEiexfSryzS8PITAGldJNoAvXZHV+0KLhSl7Ab3izwptoKb2p0OSaMsEz/NjtLRaHocuUeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786730094; c=relaxed/simple;
	bh=kMgTpZFq7u5Mzq2u6SsEFzNK60Jy27f8eDeuQkZcDUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VRluV4efQW+9bM2fpowMK/CrChzbBOctKg/Ts3zcud5hg05kcNVVAbTy3o535Ks+v4eht6Qhi2KorMCWswS4QwLHFrNcbpq6s2+AYXwqzdEi+uNY9UAGPj7j8zWPtl2C/ZqMl7PRsj2xhGoRB2sasdoyYpOL1Tl1CpL3WpeXXfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0cuAJnR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0cuAJnR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1460626a91.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786730091; x=1787334891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pehI8bbVaub01Lzsw57p/i91GxlgKin3+Qkja70UH9w=;
        b=p0cuAJnR68HsGf2yx+msJU7nrqgWVfXRdS50q3rYHwDegxAFUAa9LGkWNN18w7X4j/
         i3iu/Txv4ZkOo+Tri0Rxk44whOoMpwYna9LTLdR4BcFLpRTDkXNhZGo5quLXSh4Gb4Xo
         OpWN7sH5iJuaXRpwMZLaNm33qQugaCVmARjjfvqJHNeg+ONe0A28z1GrfE00oCPkRjo7
         NqB4JHISdXclm489Ly3dtOYprpKwW5K6wq87mgUkefDk6RpgKM2Awa9F19ptLsd4jZ1u
         Tic92p5cWWMaxWw/20zNHdIUZyBmlnR3MJ/d18fo3Qx02xV4d9q5uTt/gGpquK45QoKX
         2mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730091; x=1787334891;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pehI8bbVaub01Lzsw57p/i91GxlgKin3+Qkja70UH9w=;
        b=jr6GvoH+bKyE+k5iPm8G2DXgraXqaQW1mKsiq4nA9Aq58ksMz8LjLbkDoqE3FfiYF3
         pcoZJR8SmqjkSyDFp5q5/EhXKqSRfxJV+PxCUXKqNZg8bOSIsZYCP0Iypk5+LROUrsYw
         HtNzVjRANeU590fcLl8Z73nYdGYVwgsMoHjQSEb4cXP6di0OiPU4+1bPG/PzbibH+xiZ
         XbEn3+eu32TrdvmBc4lRGaEk5BYjtDookqJ+OgDf6QAtZcCBY9lpH+7UV/Z/BhxMiHc1
         vKFGb0vt49EpiOtLaMbECRYVxQHArwyCWr+2XXvnGGiflJZGV55o/NAhRCqikJ7xSRyf
         IFNw==
X-Forwarded-Encrypted: i=1; AHgh+RrXZR5AfKFjOrDu52Cu9LltHQxUxuSeHxeuAevz6uaB8BzppmNVJVMtrIoO9KxNlGC52v1sv8CIKVF0@vger.kernel.org
X-Gm-Message-State: AOJu0YyabAkd2Ziwzxfb4rKPoWlAeuwSbkczLDvGgxLUPD35v1aIW64s
	dbK/udIIecy4y9HlnFUjK5POOwpE1V+AmXWWw5+RQE9MCUURxVwCP7A=
X-Gm-Gg: AR+sD10GGroUR9Jg8bq0u4E+5pptrgiKQlhR/7JiLvQqK7GXLqfxz7aKV6xURq7GjB9
	NsRjPffHZ9o02FgHAzXxEal3t8FewicsmJr6FUuHU/m5kizStSMbD7iydZ4e/mOXtLY2vQRqw+F
	D8JwVFSo/lanOu7/AiIOCS/kBduQaChDZZd9JEHCvYm86fcQOj3UWJl1cE1rORhfeeBqX3L5Tti
	q1BjvFKB0D6js63YmPYY1y9QhGiGrMytaW/KkkmH9WlF+fiiZBIsm7ErGAVeVw+FCNGmTho9U8s
	XifwppLMKAyHuKjlsJoT6SVYiIOlCHyGDrmpKremjchL+NAD5SavXMQa4GatTIrwn5yYQi9aIhW
	lsuq5XZP+sbOKcwpmZfKaQV/CMmlejLh9IL+2asFBjFXYngDp7staGA8RKnyCHfirznQuzDINbG
	uR615QDgcPjBY4zqa/ssPqYkTLP0gBYNDihF/h9C9SP/RuesGHeGVa3C/XizQz+Q85Bus6FnVF5
	1t6YS4L/hhdwcTbH1de2mfHOn6ywYU1zbqNI0qC
X-Received: by 2002:a17:90b:2541:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3933e5d2332mr8447176a91.11.1786730091422;
        Fri, 14 Aug 2026 10:54:51 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm11128710c88.11.2026.08.14.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:54:51 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/2] add support for Aosong AM2320
Date: Fri, 14 Aug 2026 14:50:18 -0300
Message-ID: <cover.1786725567.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
communication protocol and measurement conversions.

This patch series adds am2320 to the i2c_device_id table, creates
of_device_id table and adds both am2315 and am2320 to
trivial-devices.yml dt bindings.

v3:
- Added "aosong,am2315" and "aosong,am2320" to trivial-devices.yml.
- Added of_device_id table.
- Replaced using a constant for driver's name with chip_info struct.
- Separated code changes and dt-bindings changes in two commits.

v2: Link [2]
 - Generalized KConfig description text.

v1: Link [1]

[1] https://lore.kernel.org/all/20260805183733.1000550-1-nico.antinori.7@gmail.com/T/#u
[2] https://lore.kernel.org/all/20260810183337.451812-1-nico.antinori.7@gmail.com/T/#u

Nicolás Antinori (2):
  dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
  iio: humidity: am2315: add support for am2320

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 drivers/iio/humidity/Kconfig                  |  8 +++--
 drivers/iio/humidity/am2315.c                 | 34 ++++++++++++++++---
 3 files changed, 36 insertions(+), 8 deletions(-)

--
2.47.3

