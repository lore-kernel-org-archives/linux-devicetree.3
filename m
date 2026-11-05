Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894039;
	b=hU+QxbFVErJoXzxhtVHKSuF6mxh6HEfYIGwtLqNa1eiG91R+XsPx5XVVIJsVQD1ATTDI
	 Yk4Nwa7mg5dzLZ/73HsKiskKUoyjsQvF0+lGcTxCgfJmLEOtXjYrzdIjjJ9EvdLVAUCWu
	 VXEw3B6z3zfkOwQcNPvN0QYPiJVZahgT84DeTopi6qZyu9LYHwCydOxZSfu7nIHLdEn9r
	 JK+zBHPc4WR3N4s/otLQSwF2QHOmqPzv3AKHENuKeiSYiasNWuQN2P1in7gvQNZj76Vq9
	 l9MvN9UxQnp2vlADUi9RzfrCvp1UMfeODN0nXeMgA2B4ma0fyG2nLfkJnhJL+QGzweg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dbmOJwNiA9U5ZN5yfEB01wzVScVRVlQu8hg29XoBtHc=;
	b=2smKoTn5YQ96VxFicBIYWB0zq5DK2VsNwCHzH39u+5e+jTGfZm9Xo40NfYhqizYvd630
	 MNLiQsycR2ruWNWQ0FdjS2L1cewVOUm2xPhbRTlI3zqhdWJ9Y/jr5N0uzg0aFyXv7iXoo
	 TlIYt6bJJvQPXPsyuQWPy2HBkHFhwpGz8RD8jdHYH/6ltrC6bQF48L8P6433ucKHZpKB7
	 T9V5NygsOMC9M+kaKseQUjXQ/UvImKQ4pMxNHiy9WVHQkZTdrTogNU4XCvSR1zQmP7OlQ
	 /xiARlX9xfECwoxKG3fYXi0Gs0MX2ZY5JObKPtUZXS6yqYkZhqU61HknkBQ+apgTd+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3qaJxCB;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285FD606A608
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285FD606A608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3qaJxCB
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1370305a91.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894038; x=1794498838; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dbmOJwNiA9U5ZN5yfEB01wzVScVRVlQu8hg29XoBtHc=;
        b=S3qaJxCBghpm3j1A57D8YpLSxqVSsD3JGGGJz+hQ57er/RdEFj+gaQJ52OfaeWEA+y
         qc07bAhrgwTVTZddzIj0eHLJVchNtzuEOiuEMsSJX1SDw94OUJ2nKCcPSLClMxLifSvE
         5577Uc6pjDGiEh/Nc/PjATY7RPlXNTeOr4lHk0/EOF/qnBZ210kBa8sQWno+GzY/ETtF
         ViSZSiY+swk1puOo9d4JMt05B4gcdDSPw6a0/QmoRed9V+rVKS/voR2oVjSzFJsUJXb1
         5UD6mSZNPQh9rUOjK3PFc8sXxCxRqknDHDRtuJ4MoikRPvC4ndcqUxLmtqI8T4/QbcoA
         YObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894038; x=1794498838;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dbmOJwNiA9U5ZN5yfEB01wzVScVRVlQu8hg29XoBtHc=;
        b=CL5pINnqtoQucJSQ5VYJhAGx2+ln7fVHdF2JHcsIeuH9bpVcvV5t2O1XuWUwfS8NHI
         xEN2llMS13rtBdOKY68s1GJWF6UuwTDbSM5gYtzWmgImbvUW4BJOIRXjwUmFWP6XmLVH
         J2lNMldTMfFhkNLll4X6E7BmmDdgg5PbEy2rtEVvlPvIIWpVPrzFNrW4fxILWILy2aiQ
         rs0R/XfjdtPp3k1WaP8OG6jRvSbkPnlgc15Sl7Qk+jFTxU/m0yrc9LZWO73JIiJxiyAy
         8tzeh1COFgBZGcLwF4TTmwKYbTppUg1HST/BU08aLePsJFUMQqjZX9M9IaJKz4e0aIIB
         Jjnw==
X-Forwarded-Encrypted: i=1; AKwUvBwKPx7AJv8xH7oTDC7+Ek/BoSqjRq/eBr35LwWv3OuuJjP0VuzA372ySb5q8zm1rAic+uKBAqzEUuak@vger.kernel.org
X-Gm-Message-State: APuU4Z81cdXJh93302t9WIHQ/a1ULEO/C9m24qMoDUOoMbxUZaJ6YVBv
	JeNVb2svcSS3N2K/Cm1DI7EvnT7ml4JkQeos3/ibt7ntlCxtD2DwMW+p
X-Gm-Gg: AYBFou268RjMRD7SOiUn2yIJwDYwt77L/h+EIjoSkDOXpTsm8eq2l026skFgdwR55Vl
	0mdySN3UsbZZAtP0YStFElVaM/itzLKnBuX0+Y7Zh03mjcYwpIO/OK7dQWy/Xuva69NuLbk8Jqe
	U+TmNOCuAbFexImBi62g7xj4ja0wBdYfUse2BXZaeu9dnxrRJ8gr/EucBKyNvOg64RPEsDEzSc/
	ovsHJh3zogY6r4rE66627ktzU7WW25ujwCOg7M4V/+gjH36Va+zpLpOssXql/ECDdp0fspN4LqQ
	cOZYfcbrtYGeLfym5cPkpBNQ4JfIZWt6mgRH7RiyKhpUUCVNYFRUG3LVrjEHeUlVR9snxa88b+P
	frsWwTLC6C2obQGrAo8BST1IphYUnvgtxk2ZaU/yKHKHPzcuU8xazambLLZVTYnJVOs9vqlpclc
	IU3iYT23R+BhhKmOs63NznRPu2RyU43fVQ22nTCT42zEseQM8Pu8XC7AuFYi7lq08td4iLLr+jV
	8tTKlnvhUg6yptDc+oE2TqO+e59U+XuNh0PoYlx5cGsbVR8wPxTM7c9/IG5YJVfn5wDbzytVuQa
	m/jhsXMfwymklbIL6F1exVGjoDoQ+ECP
X-Received: by 2002:a17:90b:2e4e:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3ae895a5673mr16536437a91.9.1793894038354;
        Thu, 05 Nov 2026 07:53:58 -0800 (PST)
Received: from [127.0.1.1] ([2405:201:201e:816f:e3c3:bcdb:ef3c:2956])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf80c9sm4518780a91.0.2026.11.05.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:53:57 -0800 (PST)
From: Viral Patel <viral8854@gmail.com>
Subject: [PATCH 0/2] iio: magnetometer: add Infineon TLE493D-W2B6 support
Date: Thu, 05 Nov 2026 21:23:46 +0530
Message-Id: <20261105-tle493d-v1-0-3246e91e6394@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAIum7GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3ZKcVBNL4xRdQ5NkY4s0o6QUI3NjJaDqgqLUtMwKsEnRsbW1AFL
 N4cZZAAAA
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Viral Patel <viral8854@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793894033; l=5107;
 i=viral8854@gmail.com; s=20261014; h=from:subject:message-id;
 bh=E5ABrNVOOLIPXc1azjaTAT+AtKnHce0xIEtXnuYn4Dk=;
 b=v3SnX26XMaaHHllG3roFdxbI5vmzdNDOgpk/dcq9v2qkisFxyrt5NOTOE3VPDJ3p2vNm2cqgs
 GRInWGmFFCmA2Sl1F+YOkLK/5peAKIrNSt6dHowzNWC/ydFxW7eqqx1
X-Developer-Key: i=viral8854@gmail.com; a=ed25519;
 pk=UC+UDB53t70pTK4wncXf3tfh0hsYMCqpxYnTaKX3MYA=

This series adds support for the Infineon TLE493D-W2B6, a 3D
Hall-effect sensor with an I2C interface, 12-bit X/Y/Z data and an
integrated temperature sensor. It was tested with the TLE493D-W2B6
Shield2Go board (variant A0, I2C address 0x35) on a Raspberry Pi 5.

Why a new driver
================
The TLE493D-W2B6 is a second-generation sibling of the TLV493D-A1B6
(drivers/iio/magnetometer/tlv493d.c). Only the X/Y/Z bit packing is
shared; everything else differs, so this adds a new driver rather than
extending tlv493d.c, as agreed with Andy in the RFC [1]:

 - Writes: the byte after the I2C address is a register address that
   also carries ADC trigger bits; tlv493d writes a raw stream starting
   at write register 0.
 - Reads after reset: the sensor starts in a 2-byte read protocol that
   Linux cannot drive, so the first access must be a write that sets
   the PR bit to switch to plain reads starting at 0x00.
 - Register map: a single unified map, 0x00-0x16.
 - Mandatory odd parity bits (FP, CP). A wrong FP makes the sensor
   release the bus until it is reset, so FP is recomputed on every
   mode register write.
 - Data validity: a Diag register (PD0/PD3, frame counter, bus parity)
   instead of the channel bits tlv493d polls in register 3.
 - Temperature: 10-bit, with a different encoding and scale/offset.
 - Different power modes and update rates, and a selectable short
   range (X2); the A1B6 has a single range.
 - A dedicated I2C reset sequence.

The other Hall-effect drivers in drivers/iio/magnetometer (tmag5273,
als31300, si7210) were also checked; none share the register map, the
write format or the parity scheme.

Scope
=====
v1 supports master-controlled single-shot measurements of X/Y/Z and
temperature at full range, via sysfs and a triggered buffer with a
soft timestamp.

The temperature has 10 bits of resolution. It is reported as the
12-bit aligned register value, so in_temp_raw moves in steps of 4 and
the scale and offset follow the datasheet's 12-bit LSB.

Not supported yet (possible follow-ups): wake-up thresholds, the
built-in self-tests, low-power and fast modes, sampling-frequency
control, and the short range.

Testing
=======
The series is based on iio.git togreg and build-tested there. Hardware
testing was done on a Raspberry Pi 5 running the downstream
rpi-6.18.y kernel (6.18.59), with both patches applied unchanged apart
from a Makefile context fix-up.

 - Probe: the module autoloads from the DT compatible and the Version
   and ID registers match the A0 variant. With the sensor disconnected,
   probe fails cleanly with -EREMOTEIO.
 - Raw reads via sysfs: with no magnet nearby, X/Y/Z read within
   +/-3 LSB of zero; temperature reads 31.7-32.7 degC at room
   temperature, matching a userspace bring-up tool.
 - Triggered buffer with an hrtimer trigger at 10, 100 and 500 Hz: no
   missed samples (200/200 at 100 and 500 Hz), mean period 10.000 ms
   and 2.000 ms with at most 3 us jitter. sysfs reads while streaming
   work.
 - 10 rmmod/modprobe cycles and unbind/bind: no errors.
 - W=1, sparse, checkpatch --strict and dt_binding_check are clean
   apart from the Datasheet: tag line-length/link warnings.

Known limitation
================
After a sensor power-on reset while the driver is bound, reads return
-ETIMEDOUT until the driver is rebound. The reset clears PR, so the
sensor is back in its 2-byte read protocol, plain reads return 0xff,
the frame counter never changes and the driver times out waiting for
a new frame. Recovery is planned as a follow-up.

Use of AI tools
===============
Claude (Anthropic), used through Claude Code, assisted with this
series. I gave it a specification of the hardware (register map, parity
rules, I2C protocol, conversion constants and test vectors) based on the
User Manual, together with the v1 scope and IIO style requirements. From
that it produced the initial drafts of the driver, the binding and a
userspace bring-up tool, and it reviewed my later changes. I did the
hardware bring-up and all of the testing above on the Pi 5, including the
device tree overlay and boot setup, analysed the power-loss behaviour, and
fixed up and reviewed every patch. I take responsibility for all of it.

[1] https://lore.kernel.org/linux-iio/atyPf0msZ85z2m19@ashevche-desk.local/

Signed-off-by: Viral Patel <viral8854@gmail.com>
---
Viral Patel (2):
      dt-bindings: iio: magnetometer: add Infineon TLE493D-W2B6
      iio: magnetometer: add Infineon TLE493D-W2B6 driver

 .../iio/magnetometer/infineon,tle493d-w2b6.yaml    |  48 ++
 MAINTAINERS                                        |   7 +
 drivers/iio/magnetometer/Kconfig                   |  13 +
 drivers/iio/magnetometer/Makefile                  |   1 +
 drivers/iio/magnetometer/tle493d.c                 | 552 +++++++++++++++++++++
 5 files changed, 621 insertions(+)
---
base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
change-id: 20261028-tle493d-14c38f2bd273

Best regards,
-- 
Viral Patel <viral8854@gmail.com>

