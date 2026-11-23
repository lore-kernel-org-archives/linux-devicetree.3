Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463387;
	b=qZ/u3+erozdfyMHQOsxR2c3oyf+Y3af1YpjP2gE69r1uVVuZKz4O+UjFJ0HUUy9Tv0xD
	 3E6RQhk5iXyMWCqbsTPyVdD4jxOSPBzuMOqDW+cNTl/y/3HqesKBEPOG95BxCQnZFdfhX
	 knAUnOTXkk5MC5JY75FXOxZRHRNoSahyPkBo98WIMA69O1rsjUF2pcd5juFS0ZDubXbMY
	 vOLiFn8SUQe0mZvvVAIKoGY+QxodhVqD3pzCN4vMJgnCf1gy8V8Jd7AZfm0H34jD4yg+j
	 c4IjbSEo+uJ3TV7djDPa6ENpvmgHLMOhc1qV62tuaCZ2UqWZ0XNag4SGAcZ4Rw2qdyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hsLJ3XQTap9R7Gjdm3eQnj+kLtAheZctWZoqset7KZs=;
	b=11gU8YgIQNLdiTI1i3C2qLPUU2g5eWkXGpyKH8jnJJ31fQQDMLWHjrV00iRfinYbKXl/
	 34dYqdybqbyS3g1ko3xM2w/9mfIP2ZH/YsuBplUxedu1sgFNXNX8l4ds6ryje2uUthBz9
	 8d7XFCHAOJvxY+Nnh+yIWQ/sQOU7ikrMh8qW3TM4vGs2BAESE5/ROMw3sRxamr9t06zfy
	 2XL7YsdGRBpkKF1sbltupvkWSsyAb7E3ajnRt9zFMOypjv20WvE0u7bWzbdjrONf6AE6O
	 fCIE1t7062UzU/laIz0sxw6IGgYpxFxEXWBCzRrkNfszRaPToVpSdQn4EnFguRukImw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8xQeIIz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D9606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 159D9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8xQeIIz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso35854025e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463385; x=1796068185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hsLJ3XQTap9R7Gjdm3eQnj+kLtAheZctWZoqset7KZs=;
        b=l8xQeIIzFArZziZL+1bnVi2o7RS9MXn8eXCWEYC4mE8UL1BZ8z45IrMTvhXnCeq6nt
         16zDktO2aX01T3gIMZKzyCez7IqB/NQ00ssGkXIR3EWqR5XZjlcOFWQCzD/cZCcw3qMG
         Pynk8hoPH8X2eB5clmZcV8OIUmnpsXH+6QLgzYx5DnQpYEDIcBZIUCUBE2DWiGzzcypG
         xM5lqVzbxdtqoYQupqAM3cpTSXouyn/pA9FtBohKx5/CQmCOboICji422c8jpcH935RE
         PwUJ9W9S4Pg/NUwlJEkfYi1EAJ9XTLeSM5ZXXsLKfhXiiUVOeDUPC7FjYxFPxZCbJf/l
         bxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463385; x=1796068185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsLJ3XQTap9R7Gjdm3eQnj+kLtAheZctWZoqset7KZs=;
        b=w3kuoqklF32ydOfHauEjii2gfOIf/0VXmVFtMyTDnM+2BOSRHW6SC0fOrNaBaSTLaa
         RTzutRwYQREghcthsf0/9ghuaKIF++ZP4sBQwMExZBTg32X8uxHWPfjO3pOxjd8N3mWk
         gMn55oYz37krdHDvnyGe+0Hb6d/rihGcX9GxezvEnJ5aW902qwf9LOFEuuYn7mA3esM4
         ZBjVvS3VnZL85zJkrgImTWqa5OWwdk27swo/OtvAnzQ3sNoWLrQ9IsnplcY1v1KQ3Hy+
         3/9RK6VGzBERqbJczhR+/JBRWLM/YbIGmUX12m6Lza3zG60+YC2kiv9A7lPz62MNyAvO
         BXZg==
X-Forwarded-Encrypted: i=1; AL+hErHRitYSH8Wnya2GNYRLmFsO1Js2P5oy9eDPvRMfWuROANOM4halGTcotWgGj65ayOYMJv1c0SUeEG37@vger.kernel.org
X-Gm-Message-State: APuU4Z92q20rK8uwKIIhuFvOUP+MInxSJkM7OS0fKS+FXg1hC1kCLm7P
	GFo74mQH05UOvdQy8qUP2Z5rmgU9rvzpF0TeIlpJWEQA+SaurT1yW1loCdlvtkHrXIQ=
X-Gm-Gg: AZFdTZfrS7Ug9uUlPlkyLqVnZA1114MMYoEVSbX2n93nzKLv9QHFRDZp4HfGAbWSNqa
	2KzjPmZbpaogfQxJWUmDyDIIuc7MdywtVOlGWL2eB2oIjkl4ib9/SByqpAX0Hjav18cZ9JZVubk
	yQLBebhHlB/0yavD0SkwYx5CbEisXCr3SHO8NdoII3EVqJQoXbKNQOVO4cnmKA4t3kSmMOUFrhG
	ET8hcclZxaZEM6tXDvDnwJFSvWJ7475Du+HujkSp735X9Q0iP2XVp4XeKzIC+TF+NgAhkBOX5HH
	+ufp1HinEmezGXWrIeuLg5G+jyr6iisIBOteMpZc+MfN9EiPcxv6lgXUBqz535XquXvy7+sxYoH
	SAsAc5P8zCqu/IVZVQO+QHBIR0XyKRc9w3qD1bt6gB5lKWfVFN9n6l/At7R0IgkvbRXW15P/dd3
	tikViValCJySiV36ngWWtBLdAj9S+w+PAKJI5A9Bxf2hAnFaxLqubYEgx6Dr8YMOOutoKHH/hZT
	errEHIaohgTfgu+vmirWCr+Cy0VtLZQORw0Pus5yxFN30MvFcxinbFoUej6HZTluRzdVs3RwwhA
	bPJmEjFP1KX3SiyAjMMWnNUM1rlU89YrlPfo8v4wNp2mbodMpfBuJwTk1A4kh561lEIkwqpfmom
	MDVhwvqcT35uX
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr263589535e9.34.1795463385304;
        Mon, 23 Nov 2026 11:49:45 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:45 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Mon, 23 Nov 2026 20:49:39 +0100
Message-ID: <20261123194943.57601-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603 and MMC5633 are listed in trivial-devices.yaml, but boards
need to describe their supply and orientation. Patch 1 gives them a
binding of their own. These bindings are also used by PebbleOS, which
is where the need came from.

Patches 2 to 4 add the matching support to the driver. I have no board
running Linux with these sensors, so they are only compile tested (W=1);
feel free to take only patch 1 if you prefer.

Changes in v3:
- Reference the datasheet timings tOp and tSR in comments, with the
  tSR one in a new patch 2 (Jonathan)

Changes in v2:
- Cover the MMC5633 too, including its I3C connection (Jonathan)
- Add supply and mount matrix support to the driver (Jonathan)
- Drop the mention of the missing I/O supply (Jonathan)

v2: https://lore.kernel.org/all/20261122190836.66111-1-gerard@teslabs.com/
v1: https://lore.kernel.org/all/20261122093412.71604-1-gerard@teslabs.com/

Gerard Marull-Paretas (4):
  dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
  iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET
    wait
  iio: magnetometer: mmc5633: Enable the VDD supply
  iio: magnetometer: mmc5633: Add mount matrix support

 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 drivers/iio/magnetometer/mmc5633.c            | 30 +++++++++
 3 files changed, 91 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

