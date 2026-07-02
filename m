Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96531E8826
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 01:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955996; cv=none; b=AYw3m3V5/DI0uKO1lAv7UtJuc6GD1B1opilQKm+XK6BImIR0xp0cSUsFwGkkoMRvhuPtnJgU+NP6hQ/GJFUN4mMfHi7Fb7pm80JbF2/fUT+EAS2vBDWpFJj1g28o4UmSbKYH1yTFOrkTTQhYkf4pHahsswC6V7ZmPi05WtgY2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955996; c=relaxed/simple;
	bh=CWSDyiWjt/ugnMSYwwO5OPf9zuN/+Wou/ffegX64CzM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R3Mm67eflilagSF2qTsbdTeXsv2d7TdlSXw9mJ5MhAVMAgiBSAwcful5AOEdghMUvyigG5E0yDxF4YYLi3UvtHOwYtNKOfFZJf76tUO/v3itQCYPh4GlMjoYA2ZBSai2rJM/9/rnkYTswX3gc4a3iXy/dBS6Caa/GFlRrB/K1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh4RtV2H; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh4RtV2H"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37fb434c547so1116990a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782955993; x=1783560793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ul6MTos/9fbbByspAuoFqlFzSIa8RflOxwEJD5MGu+M=;
        b=Gh4RtV2Hadf0BB+UVUdMH5aLcf+ua5lvkBMdtVEXwHPiFRiYyFdZl72fo3cTMVW+1b
         MztANYx1kk9kYQ25sB+GLYyq02FkxUoVhZfqh0uHK1UXDnFGgNEQ4PJubxb1Jw/e0KDe
         fMfD2udtl6R2XdWXtCfrcyqfZA1zC26eHi3KuJlEZp16MZm+hpXYXz+nFn+m+IuHxeSF
         t6O+f7peZHJfLaTqeXJ8QWTcChO/F9P+j7verIlsjNtg5BE0DF192dXOGeglEoC8CVN7
         mBv28dSgGhXXzOOu06Yvc5urPDQyW6RDl+YaKItingWc8cjWDxd7Q9wXiOCXQXM6o39U
         H1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782955993; x=1783560793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ul6MTos/9fbbByspAuoFqlFzSIa8RflOxwEJD5MGu+M=;
        b=WrzblzWs1+qZxGunVs5RaIA35GGoN1QI+XuWfBIoEY630JHl0rDHuaKW7Ne3iSlK1P
         RGv7jvl8Qh/3CqMYlGW/WSGCSzhu05SwKZeYah9GnJ9EpL1gbqulMaBk0X7Ku8RCdL5G
         31he3LH9pSDpzVeJdOuG0jO2sSh326tspMXh8odYggt3pfZxSi02Bh8kBH1TtZJUhcXi
         p3nov2x83U8xVNwZY5yYFVMghOni/DGkk5cg0vk8o34QgxhFIot5f3bBF4WuT3sI3SN0
         uH/zbWEJC+JIpTvRtXnR6EWfJHHCQrGdysEI8rIAuYGi9vUuXrICAaeuY308hds/s/5T
         QARA==
X-Forwarded-Encrypted: i=1; AHgh+RompWgOR3tbRy1mElSx2C9oUsGNrueoPoZzSHDD1EWVRM+gNqFTDF5erhk7UUdIBQooKYVSCHxupL3r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz61OClX4pK0ZZwGlhVPtBWITt58jYNnIoIxz/nUs6nPYjUlxB2
	fucRlaMYRlUCJZmHt7nC9qr9/8hUPo1dFnWlD6Sojuh9sn/uLoS7WwVJ
X-Gm-Gg: AfdE7ckVfBwfcGilaQSlDAy+zC1slXIILlUEastCk/ZGDRSG+gev6h3tCw0t6UBWCz+
	L5ke/HRv16qHLeN4s0Y3SAaO7KS4EQq3/NQ0H9lVi8HIT8AV4jMCi/vFJsM4MqvSHOHHCrHbS1o
	WmxOm53YMDL06RnYSgE8T1e32pfYwlDe3LOTHNsedcYhrKvKpIiB/7eo1f8GY/QLU8pImIQVI4i
	9CSRY1zqgHYMNmyOnXf5se4OlxpAllli190cUFtDh998oXicEEtZrhy0GH4ScDl61mrxyIBcpiM
	f5ZgpDJ+oTVZF8npKypxbwCM0HRikSyY7J5x5oPw7hEBCgfiYgFaKS3bVLSbdcIMthLG8J/likz
	UilOqgSWwQEqRLsNObA2D4OV9aTGzzV2nA+vaYgBkckEOlAcijjYZx5kJ/7cyUdGQ1Mz6Dd1+hF
	n3RqxTiqLkbpGx5sANNA==
X-Received: by 2002:a17:90b:4e84:b0:37f:eda5:5169 with SMTP id 98e67ed59e1d1-380aa127da8mr3897035a91.13.1782955992994;
        Wed, 01 Jul 2026 18:33:12 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:3379:8697:e33b:cbe6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm540377eec.11.2026.07.01.18.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 18:33:12 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v2 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Thu, 02 Jul 2026 07:02:36 +0530
Message-Id: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0JmbU1niIiuvIdhUegUxgiYFhsN4
 e4W2Ll8yfvvzxDYCwe4ZjN4jhJkHBLQIYOmM0PLSmxiIE2FLrBUXY/6Qsp6ieyVKRwZY60jjZA
 2L89OPlvvXu0c3vWDm2mNrEYnYRr9dzuMuHp7+6zxrx1RaWWxtiUy5Xl9urW9keexGXuolmX5A
 Sgu2qW8AAAA
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=CWSDyiWjt/ugnMSYwwO5OPf9zuN/+Wou/ffegX64CzM=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRb/SbkC1CmTytrb/LjMBQW0MFUYC1S3yfd3K5
 Zl57cqWKvWJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakW/0gAKCRAVlYpeERwF
 3trWEACZS4ShE7KbMfuvn22NL4vJmU9pf1RExD/TSpDVynuDv9nGRExJZlr5nUGoQg4BYDwo9KJ
 cGwMUiP03Hih4VV4PGZsuJUM/UmlWliM5e7eJmz846vijueqWjFYVF7Qtx1r6SPOGNBLz1P0Fd/
 ffzGC0ZDAr+TjkkyoxOFx0p8YQaRQPc1ypBTk9ZzSIh8TSt/Zn8hDD37eZIUmHtebN6GwjPFTGP
 0tJEra6AKELrTUZjgZVkLU1Z+PEgbx7lsi5+mQLj1bQUVP42GDZ22nrC3FzV4FMZMBnH2P4Wv6J
 Elr7JhkH1mRwsuCa5ML48hUNd3CLB9we3+UbvxyLxoTn+2Zkqmr33Y0JVM+x2q0dLLKQ6Zccz0F
 i81XDjtXEAOxsfDb344aLDzkbUMOpPnRtXYu4Jn3G5kshbA2l6CV6zue8zk2wE21aRTAYcBaUmh
 7a3PBZFk+cLCBPxYrdGVSytGAZSK05ZIsR48k2W9DhrHpUv4N4W9IOrPU1200Cpa25huwnkM0M9
 NItQcFdwAb+j4MYebWuiZfiPZPY34HzAsw+WKkDZXo6CsMrNv+qjkci2O0BQ2dTqwXC+6KP0A/e
 8zHDk2IuWo2uFBfoiBwz77Riq861zm7LdREAKmg6d3v/YpB0i40qsgVDfsFUZ6qwb7U+1Mxr6bW
 1Myv2awKNIHW32Q==
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
 drivers/media/i2c/hm1092.c                         | 790 +++++++++++++++++++++
 5 files changed, 916 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>

