Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135465;
	b=bIsi5doAaDZrgKCEZXWJCeJRYj5oxOAadhR9PE+J8NoLgZhWE14o4a40xnrVPkDRCXH7
	 7v5ViwzhIkQM4vHVnmPxXRTxkPnvFXySeR9ohxjLXlcW05jS7N7XB9+mzyd2NRjwpONzl
	 5/3NDFR+f+4QFjG3wrPdTcXLHzboPAr8h0TDrKRXiNkcVadL23x9DcE4LM1NMw2vtP1v2
	 XDoW0XsqrRd15HKQhb8XXy3LFnoGxVNABQ7ADpHSPe9lH0TKKgE17DL07gn4uMp28k8BQ
	 QYlaEdGXe2ajwq0oEQvpf2HpAApGZRRKeGBSWqd6NR9339uaOVtAg2B3BgFw2PB+esg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
	b=1bpz1XamTcmMKTqk78Flxgswf3/7BrJmjPlIEh/vcQ+zS4NSGvSHXQEU8ssrJq3o0iPB
	 H9UJ+DpeR5UvpNEoO6/wk3VZ/J+KYJIFyZIZHrAJKs1HCSlhEyuzrtxBRZSN/EsPm2mnk
	 vcp24fkRqALAdNECKLykEjPiY+ZRG87CQ4wYwp+JwKwwBE4QQYGNHUrNTltJb1l+ho20C
	 vMtz+4czzmWHmRLqmb3pkm32gf9MClIkW9w5BmAsBLRzvnXY+v8MELChvDci+B3TNDGuj
	 VAyrtQBihbtoPj+6AJIu/h2lzTrPR8ftIu2Wgiwrgusjm9/WnOMKGelxNlkBjFWnDhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRFlv3VN;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FCF606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6FCF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRFlv3VN
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso251025f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135463; x=1795740263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
        b=IRFlv3VNsJ1GzKjSCCB7rSjUtYgDKXWzZhfkSD3dJQiG4X9YmvRIAgxwKegRoqEf4c
         DPm9/TLjvO2VxHjeHj91AaKMhQoCj0kmRhRYaiR+46zSKr9qk0DZlqqSDTV5qXAlvaGY
         Oq0PTBJ8ZPz4q/QeeOgpU8C/7HbdXncslutjkH7MI+yPdKCzCf+OtZ9HYU789kIpbq/5
         v9NkbLCVirR5k930wDDy4oqZ4bubxOdAQ+6bJHeTJX7PZfXcQnWeUmdXs9NG9lc9BJ+I
         OughswD6Thx5e3VpkEXvj4WWC/zcYjFrnx9Qt8gAs8WMXrZJ46EAafW+FRsR+UjgfdC+
         DjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135463; x=1795740263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
        b=CuC0exHDfTIKO44/YgsZqsMvWv4XT8sE17bkZ5HhPtx/Wbun3TboEeGJ4qOm5zAUYk
         kItkL59fznPt8H3cgVhdjeBOissAAFz5gULw0GtR46fBLIOxrKdiPwfHpa3+VryMCode
         9bU07SVxv7qhctF4TC66rxq6Isz3t00ZXj6HUdpiDFW0/ylEMyIXpEkJJ07LHoPxMSjK
         U34RlMlVxck1rHohArYW/TeZ03iECjzAO00N9UtRwUkXHXWx3a0I721K5FDW0o/Lc1zh
         tzJ2dpmXNBgc4MjJKwhYel2j69bBk8q8QqueDh1Df+0TXue8CfqdK0/Sbs1LnVTvdz+N
         r4hA==
X-Forwarded-Encrypted: i=1; AL+hErFQ0YwTB7lvxRCMSE/5/+HnSOUKLU+N9txnFWZ+PiieeuAbM9Wj1wKTZq1jhegywY7rxX8jeBZVmSy+@vger.kernel.org
X-Gm-Message-State: APuU4Z+r/fPqM/izXFqZaSRRYrwj2J+J4qUtLa037cjzKUBiMU82va1B
	hvNy8IhjF+gam1rD6ikLbCsBKsPAyFMjzXl+NAp3dgiIi5vic75lX4L8
X-Gm-Gg: AZFdTZcxpY/2QcMf/G20igjzGP4wd6+e05rdZXJ5su/an+mLPFuuf1w2dv5eK3ijE3t
	8TS6Gv6p03/fMffn36LnlNfKNoE/mtBHA7pNuKdmt4j2c9kyITY1mKqZpocx09DagmTCdo1FI6Z
	O3+18LAoS3+1ypkBlfvN789JVwLi0v/GIGpcr6fn68vosNwYJTy37NIkYaulWzxwKM99Lnq9PVX
	BpgONwR2xaDygKZG8A7CSjH/PA7uUHuxx8cbnBzdiXJENcX3od9rUz0nyQB+DSQ7At05/uO7LT7
	NFMqZesGARLus39Zi8G4Re+vulhNoMDz36ny5VB5vy1HQXY5UySnk/EwmRfAhNkGWu2D0mW8tO6
	XRdQOa/2cTfx2TXp+49Z6kTOmVUjB6Kggs6OFOaWs8DgL6DKc6v2J6qXoTDur037c1dcHQ18oT9
	ldzeSTWGCgcvOGUu6coj7v+a7+59q4EEOwlY65hu5JITTlufBcNewlHAckM7LhjhOxzgDRxOBJT
	igA1duyB5ZHoex7G3CIEu4AAGW4RYoDDK5KsJOPxcaiW031v5OPo4GP7ttUYrprDfbDBJ/SHHch
	aFtQYKHY4eRxjGIscWRzApyALC9rruqY0qmqyQ==
X-Received: by 2002:a05:6000:250e:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-4abb4b86685mr2252995f8f.21.1795135463090;
        Thu, 19 Nov 2026 16:44:23 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm2686669f8f.21.2026.11.19.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:44:22 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	"Wang, Sen" <sen@ti.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart amplifier driver
Date: Fri, 20 Nov 2026 01:43:22 +0100
Message-ID: <20261120004414.1686884-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
speaker protection, controlled over I2C, with audio over I2S/TDM. The
DSP needs a firmware image tuned for the speaker; without it the chip
passes no audio.

Patch 1 adds the binding, patch 2 the driver. One node describes one
chip or a stereo pair on one bus, using the reg-array convention of
ti,tas2781.yaml: reg index 0 is DEV_A, index 1 is DEV_B.

v4 uses tas2781-comlib for register access, adds the firmware rate
constraint asked for in the v2 review, and addresses the v3 review
from Mark Brown, Krzysztof Kozlowski and Markus Elfring. The
ti,imon-slot-nos/ti,vmon-slot-nos properties are gone: the register
they were written to only holds the I-sense scale. I/V sense now stays
on while the amplifier plays, as in TI's driver. Details are in the
per-patch changelogs.

Testing: built against broonie/sound for-next with W=1, checkpatch
--strict and dt_binding_check clean. The v4 driver was run in mono on
a Xiaomi Redmi Note 6 Pro (SDM636, ASI2) on a 7.2-based kernel:
firmware load, playback, stream restarts without a program reload and
unbind/bind. Stereo pairs, TDM, DSP_A, ASI1 and suspend were not
tested with v4.

Link to v3: https://lore.kernel.org/linux-sound/20260717233402.414326-1-morf3089@gmail.com/
Link to v2: https://lore.kernel.org/linux-sound/20260711145722.188556-1-morf3089@gmail.com/
Link to v1: https://lore.kernel.org/linux-sound/20260709221331.989109-1-morf3089@gmail.com/

Gianluca Boiano (2):
  ASoC: dt-bindings: add Texas Instruments TAS2557
  ASoC: codecs: add TAS2557 mono smart amplifier driver

 .../devicetree/bindings/sound/ti,tas2557.yaml |  158 +
 MAINTAINERS                                   |    1 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas2557.c                    | 2973 +++++++++++++++++
 sound/soc/codecs/tas2557.h                    |  207 ++
 6 files changed, 3354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 create mode 100644 sound/soc/codecs/tas2557.c
 create mode 100644 sound/soc/codecs/tas2557.h


base-commit: cee03387d20bb267663085d9ac2622ff9263d302
-- 
2.56.1

