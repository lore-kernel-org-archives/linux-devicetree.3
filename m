Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993A3932D9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977687; cv=none; b=pbbmqeOHZ6+Ar+g85bZp1GPgJmNqmLDABnGJTsHrijPgYZf3uYKkv8hZepfJ3YxkUg3VRpN8aXKehyWAR0xtsPrFRcxBRRNuFID0UT3ULK/b3EeKYXSkn9yTwXrjhGyDLoZbJ+aJEWtASIpRciUmaN54JOl3r96g0Art1SDIAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977687; c=relaxed/simple;
	bh=GuZJr6R3RQg8VP+qVT3c581P7ve8Wl09bRgKEwEKgxc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gQuHLgwEX3dpi3K/hmtTrNO7cdH+Khd4Yo6ZnJAHv2NxqTYUkIRM4MUijLhBFohiCAgQEwt0AoNpcuWUQpW3k7S8EnifCwkmye+sB9ImzCE4QtA9Rqh+i6KAdOHER6ki3Lwo0ff0ymCM88LHyasuAYGzQDqRF/Nxe6IP0UHh8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oo6Y6IIY; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oo6Y6IIY"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so669586a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977685; x=1783582485; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/xamfdBRxwo750A4SZz8/bTalsmZfMjyVafbFf87xU=;
        b=oo6Y6IIY1HJ4rjfdaV7ech7rR/Rxm9l7fQQj24kHqYsureNB3Eup6ZTw6sIbJHX8/F
         usbYzW8kc6Z6Jn4StLNrEJ2CztJFe6OrshUhOgBq0Ca++C24z+mw26oykvAIHd+WOjWg
         R+PmyjPmAALWHSbpdVgIcUp/BBfhW3GdAlY6zLQrhWlv2jfTplnMlMt8zKmNXbQqiiUP
         QK/b+2nZ6ZJJog+yH18LGHSVI+P3U4rSwpyYrhWy/7isltO322PM8afJONNQT31QxeIf
         bEFxtG9mhO+slOy67pKo00jmhIBLjqyMzrIVKViKFms0MmfrXKiZ7oC3Zm4Fwn/p4MIp
         t0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977685; x=1783582485;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/xamfdBRxwo750A4SZz8/bTalsmZfMjyVafbFf87xU=;
        b=Q1GyXFYluLU7RLyDfIn4y3ei9EQCmFW1lhswNjpBpabMoyXbIqOElFeYmlQhvg6XUl
         0Zkn12GainEGKH2pOwvqAC1ZYQ9EA5dN35kRsrzRqiGgenJgEB2BiOUFviOWVqKC7oTC
         ivP7uJcp40+8B1EShfsS4JuRNhCuQhZp9OlnuSUNBTU4f+T36eQfZ9NwF3PH1WMquYlK
         0QT+LZplNBqsjRv9HDtB1uLYOq1iAd3F8T2CvTmCWl0xiAz5Tc1Xh9Bj+6Ape2NzELZq
         +oFJ3R/hpBLbCYb58bxyodE8dYx6ArQkn84PXwnP1xmB20KusJEJDkgtbYRe+9+2pYJV
         UnZw==
X-Forwarded-Encrypted: i=1; AFNElJ/3yl4nxz80uEJeo9NG1DLFCRsAok0st8PUKVkGyfd3VfSbRp+Lm4rZNkjQELdqtZ2YV5mWZ2AHT0n6@vger.kernel.org
X-Gm-Message-State: AOJu0YznzgHf/jQeq6D0zNkJCazZO4YKW2dCJCMugxAUiF7wLnaeYrjb
	iaNf5ireXRVZYrVCq/UiZQhaPLXrWsD6Q+KUqH5EEbwwlyyBZOgrw4VY
X-Gm-Gg: AfdE7cm17n3oJyYQLIHMP5scfFldt6kAM25rQnVQyXQo884toEB5rWtPy+2quh/7lVa
	cjmlEEJzsjs80lqCZwCa+TVjYgLPdmaDlnej6Fp49P0RBCGGdtVEnI/PBAafsiC+6oO6Z9W6Pwq
	GGPDKKEbeOaYg99vsdPsXa/vmpqxX0vahmO7wKwTAPnysuhZqVjn+34LKhvvkM6cjqW3jNZlaEE
	gtguHgaB/NwOX6xn1SVqlABys/XbAYBEZMujjbaLXR2q1oMjRLdHZ2uwFxeSr4jqlIPdsTX29eh
	RtjyUYl/VBEGZFVhXgZ34nVobesQih1Z5gtDbnL/xslQ7q9EJJfcbwa0pBLjZvRIBB+8ULbvrdI
	SGD7Mg6GUmywSNaooxJXVyZHxQwsduZZNJAxL7ot4jIBLcZqrc+mHkUMhFE1oBcpQ2qGI+9x09Q
	z6Ji0V/SzzDIs0PWVZbg==
X-Received: by 2002:a05:6a21:7d06:b0:3bf:a624:decb with SMTP id adf61e73a8af0-3bff4120bbbmr4943948637.27.1782977684904;
        Thu, 02 Jul 2026 00:34:44 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:b5f0:4094:eeda:86b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84405sm8461440eec.17.2026.07.02.00.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:44 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v3 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Thu, 02 Jul 2026 13:04:24 +0530
Message-Id: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBAFf8X0bE13ixU8+R/GQ6FbqBEwLTYaw
 r9b4EI4TvJm3sgCeUeBXQ8j8xRdcH2XQB4PrGp0VxN3JjFDgUooyHnTgiiQG+8iea6VRa2NsSi
 AJeftybrv0rs/Vg6f8knVMEfmRePC0Pvfchhh3q3ti4BdOwIX3EBpciCUsjzf6la716nqWza3I
 25t3NuY7MwWVqrCKJ3lW3uapj9Ett6S+gAAAA==
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2741; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=GuZJr6R3RQg8VP+qVT3c581P7ve8Wl09bRgKEwEKgxc=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRhSOqJgZmly3kFAQapm34oPBjL23M51+E7F43
 75Zs7sn7WmJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakYUjgAKCRAVlYpeERwF
 3lfIEACDpHm7y4mfKErxOjdPOwyilb48kkGckjSR7w/y2tMChkOJwsdW/KpavWbbMPG5ie+5IYd
 bf9ABv643OzxIjuv1jWTehX/xeyDEwoEHM0LcATpiNsbVMoSgpJxP1pvbi9sMbq+XUMqIHQtOrF
 VLTjdWaClBu0Eucs2CxeawfvFILHp2pO8Z+zr3KrNh+8vgO/gcKXU0pD2U1ALLVgnjhdljzf1is
 EZOWyDwhdVmSzr+itUJM2Pkx0x0nHS7vvLfZLch+6o4BWwcnyHp+XqzT7GDNI9MLqHyf1o5ULmV
 WdMeDwJMtw9y5w0fxw/0sWPWK3cyfWf7hw4WCdlRSh7rqLRev8/BqIZ2mCCOXLrFc4Qv6Z9H7xQ
 mS2KpmxDzAthUx4fE+N6dNsnUt2gvvT/9m2Vx4VBpg3EaI6wLLI2oY6E2acu47zb+edeC+Vfw1Z
 VuYIdOnZdyZFEt2WANNXNOOP7M4geG0a2JaeVx5Fhpyo5F9TZ1ToCWXk9s5MgZa+XJbL789zoBi
 CBVtn7xa4W+lVqmJZTLx+dJ9GWyR31w5sLXAxbB3GgEu9dARdg19QXDV3ugDD8uKZRBJLY0d0bk
 /ZPQLS5W63UV6IgeW8uQD+qC6barL5vxUdF0DcaJjbKnO1KAQidkU0GYt62Z/WD8TG+c4U7yJHF
 wlQ3fgNw56M/5iw==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW at 560x360.

The driver exposes that one native mode, a test pattern control and the
standard fwnode properties (orientation, rotation). It has been tested on
real hardware (an ASUS Zenbook A14): the sensor probes, streams, and the
on-chip test pattern comes through the full CSI-2 pipeline.

The sensor driver and its binding are SoC-neutral, so they are sent on
their own through the media tree. The board-level device tree and PHY
work that wires this camera up on the ASUS Zenbook A14 will be sent as
its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Changes in v3:
- dt-bindings: add the Reviewed-by tag from Conor Dooley.
- hm1092: initialize RAW colorimetry fields in the pad format helper so
  userspace values cannot leak into subdevice state.
- hm1092: return -ENXIO when the required firmware graph endpoint is
  absent instead of deferring probe indefinitely.
- Link to v2: https://patch.msgid.link/20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com

Changes in v2:
- hm1092: use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
  pointer. The ops come from DEFINE_RUNTIME_DEV_PM_OPS(), so gating them
  on CONFIG_PM_SLEEP dropped runtime PM on a CONFIG_PM=y, PM_SLEEP=n
  build.
- hm1092: free the control handler on the error paths in
  hm1092_init_controls(); the fwnode-parse and ctrl_hdlr->error returns
  leaked the handler.
- Link to v1: https://patch.msgid.link/20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com

To: Ramshouriesh R <rshouriesh@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           | 107 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 794 +++++++++++++++++++++
 5 files changed, 920 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>

