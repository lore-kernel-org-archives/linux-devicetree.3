Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955788;
	b=x9GsoK7Cc9zxf4eZwV7Fh6kvoam4g+O3N7YpkXOSi+N8MBG+YONttiC3+wpgnHukUzUM
	 2PXxwW5Un8dqiMf4amONIvtvbll/ZXIHT51RirMz6ij2izgDbBXnyk85JYErGDdD3IG4J
	 /V7uM/UyyHjLbOApt1yjam+fcnsordhonb3MhCW8JUTL+vpgPM2KcVWIC1mkTptCNlf+Z
	 mxNlHZD73qm1tG3JAZ4/u8RWq29NbLXwRUEhPZO7WYd9HxUXtRJn+XLwKb25dJBgudBPT
	 l6QmZHnA8DcO4kMlpV9ttlfhOnFpil4OIQN2je+jZatMsSReOPMw/FeDMKi308z+wZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
	b=CZlYt1hapkRwCAPK39qgHknMzj+FpweB4p0/USWBmMK/1fTtYKfW6QdM7PY9RwXiiLO0
	 iApHibhcjYTXbFOzLCjVLxNLy/0SJZVM3Z8U1Q/BKvdKygNI1dnwFR9MRB11nW912zQl/
	 1JqD18RPAkVH1Rvnz5goNWu2XB5a5o3QtbLMrTON4nc7mCFReq4BXQGIWGlOK+vY1IcwH
	 +JPOxXd523jd4Dt8jeJhXPzXt0AuFLDG6+CD7RksgX/eRrkyH6Hzmix10m9inJXZf9Qbz
	 +9JwSE/WCLgfSqIoMv47hWc9RnmM+2KwZ8jVOAOCxkpfmEDG5R1UnIdE27Sae3AiAmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VTvXvSik;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B093606A31F
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B093606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VTvXvSik
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e4831c028so731775f8f.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955786; x=1793560586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
        b=VTvXvSikLfJGslamcvpxzCJTu9WkCqjiJqpiEmRb3NyqMiAEDAZqGiMJOtgonAhvVe
         ghVqAx1FnE16xEaww+LmUM3JTFBWGkrjBFsQlyG/IdXi2YGFwzny5206DDVamb8N1MGh
         cAfRYHnoGVF63+UjNmuJm0Sn3D99fSfvJFaUV2DjMknY2UjvCIJL4FyhRSOrznDeFOBV
         liWh36MSsxs/4AcMi2HmaxivN7SLlfqr/r5HQIp+4u0Asqk/CSyU+BluZIGLCmNB28TC
         YEoChXByW7WkhkxR9+w3vExNtNv2TtfBR9fafQblnxFRZfD7O5NPhGQo187Ak4APjsFn
         sBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955786; x=1793560586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
        b=XCFGa4BuP6G2XPTk4eoixtdle6miffmj1MZBvtgAab5BMADRfpdWBQ5uraMpNEfmo3
         hoXQugeBBoiu//+3r42mvaGXNefbIOlV1hMAmKkcNrr6O/NEOO8EvngaTyPvgfbWhUnu
         T8H93GtWZeJ7KWC93z6TLl46KFzIbqWDS4tEX3Fhr9UpB85e74v7S/EkP9W9flQKxtyy
         vj5QRSoAK7C5Pr2hqyL1kckmDEby3pOS4WQH82gf6ZnVMBInCMx/Nq6JvFq/CX6HgR+P
         Il+i8TeQIHnT/sZOeN5f3stEk4oi8BkvyOrz8/UroLGLT5WHgjdJ5GykBM9AMNtwdKCi
         6pzg==
X-Forwarded-Encrypted: i=1; AKwUvBwNQki6Fo8uRzj1jSTmYq9h0bR90oXhJoVYxw3ojtKUqAXM1QcbuuxobshZAY9+FfFpUb+VebbeszzZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIGPfhure3YDd/jSwL9iylsnzIZftN/pkRXZCBl47O25NcvwmrD
	/t0k3r8S+shMbRcbhc1NrakL2YecH2LUXSj1H8ODchq3LCOp5DMEFB8UsPnSp/zJyFQ=
X-Gm-Gg: AYBFou22CnkFik8Y6XTj3YiGl4RtQjr69v3ucHKIH88P9Y3DdAIZMl1WsveTfPtoSZg
	me8S9OleTlMXctp8wc7GYKvff0bvtRk5UabySUon5AvXnnkXXMmPqhQx6NCvZ7uT8SPzkSIIWyx
	93/cX4IabDZEHtp/nqfZV3ymDOrW0wsDTixr2s9SEjCPofB0P42LPG1ZBt1hJ0xNbHxuhn/hUqR
	QuoPTWGJbp/n60c0KiMFXizqlCZ1MLxf55ep+l6k0zitD4S80+Pq5PfIKT2eu9quLKQtxJbUd9c
	ZYQYagedfG1J+enVfCFR42gixSzkxfrqRlPmhaG/ISiCxGBzBzaeTfwvAxxxHGL0tOYhPcxaw2m
	JI/IEX1a0yj6q+xWaSL36PAGzBvrSWS2xKJIjI2WztLRiYUkxEmpeZ3MndW1VPoTwX+8WisqLwP
	6wVghYuekfzZPDnpRnimvNZKQvlOL4cVpzeezgAw9ICfws86iiFMeHUPGaXT1OvlorhGBZJvz8E
	bOzSX2QL1yfLIw9RRaMrMSaiVGRSRlP8TFRcLG3NKDHJa+h+MhNjVRy1b86MdCE0ygo7S3vjz9e
	Sdy0+fDgnubaKmzLljNmYosAWAByPoSrdTs=
X-Received: by 2002:a05:6000:4b04:b0:48d:fbe1:bb17 with SMTP id ffacd0b85a97d-48e3eb7ca4emr8944736f8f.41.1792955785830;
        Sun, 25 Oct 2026 12:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10082051f8f.13.2026.10.25.12.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:25 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 20:16:22 +0100
Message-ID: <20261025191624.9219-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The Ingenic X1600 has a PWM controller of its own, separate from the TCU
timers that pwm-jz4740 drives on the earlier Ingenic SoCs. This adds its
binding and a driver built on the waveform callbacks.

Changes in v2 (both found by the Sashiko review of v1):
- A channel that is off with both counts still loaded, as one stopped
  behind the driver's back leaves it, now reads back as disabled. v1 read
  it as running, so asking for the same waveform again didn't switch it
  on. A channel off with one count zero is how 0 and 100% are written; the
  idle level gives which.
- A clock rate of 0 is refused with -EINVAL when rounding a waveform and
  when writing one, instead of switching the channel off silently or
  dividing by zero in the update timeout.

Tested on a HiBy R1 (X1600), whose backlight is channel 0, through
pwm-backlight: brightness 1, 25, 50, 60 and 100% give the expected high and
low counts, 0 and 100% switch the channel off at the right idle level,
and an inversed 250 us of 1 ms on channel 1 reads back as INL 0, LOW
9375 then HIGH 28125 with the clock divided by 8. PWM_DEBUG stayed
silent. For v2 also: channel 1 running 250 us of 1 ms, switched off
through ENC directly, then requested again through sysfs, reads back as
disabled, and the same waveform asked again switches it back on; v1's
driver read it as enabled and left it off.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time.

v1: https://lore.kernel.org/r/20261025084643.93167-1-olivier@mgcrea.io

Olivier Louvignes (2):
  dt-bindings: pwm: Add the Ingenic X1600 PWM controller
  pwm: Add a driver for the Ingenic X1600 PWM controller

 .../bindings/pwm/ingenic,x1600-pwm.yaml       |  47 +++
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ingenic-x1600.c               | 280 ++++++++++++++++++
 5 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c


base-commit: 00e917df050d79ac26ec700717680ad6421d2808
-- 
2.39.5

