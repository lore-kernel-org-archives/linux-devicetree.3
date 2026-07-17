Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736BF38D3F6
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321972; cv=none; b=QtG1jSC9hilTLrqSwV+wpKn0E3AQlCHcZA0LMYRdQAktmJvp2X7+YxF+oJTi5UM2LlubkyMYsXCe5d8TCPbFYJHATK1yMZm9f73bNC3VBOt3D39P1ZOjUrvyDmUaOyCtVowM4b2n1STElOy3xjKb/b+M9hJ23FaQ7KlayBBXNCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321972; c=relaxed/simple;
	bh=4x6FnmBjBAsJoVsD3Sg1GTElsfE5vtCGpmFsPutrFu0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JL+Q9jZxoPNceQisyfmqAkyxXtkAcTgODzNk34fcg3f6yief0o8tPqcxUdd8p/J0d3lgzeGQJ0azwDFTYNlrix4tyOyQRoti/bRQ8++yqpjihtSuqg460x8jZniIIcVGm1dYnH/CoNJBO/yLoODHxYrZRKkdTTvxRl9Wd3bV/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bO57gpfw; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bO57gpfw"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81ed000b507so33836017b3.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784321969; x=1784926769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2dr2URk2vPlePRWOIHvONT0t4cZgJRA/Uu95hvZl+Cg=;
        b=bO57gpfwdAfFwLQFwq/hvmp/JX17nS36TIzEi2p24uHrkApeOM1kD2kc2j6NsZkelE
         nQFh/lHclvqJ09YNYBlQggVHYZbD9pMGNcx3JGf5OtvovoEfNMTK9UT1jrvP9JMPN24d
         +/HpIwCZpSkIFPeTl1I8hq4wM2B+XAP08GG3DaKa2yV4+o6zvJNF3QiKWJK4LHd8kySp
         WXn0BrIN8sBxATIKXnm6m0q2KytFgHQdKXuknSdVwjPJiUb0rw4+qdmsmXZV7ofXXlLL
         c5s9gH1NQQP7PHuZJOc0lwkXtIosehWX04PbJFlAkcWeS2Z9cwoy0WTrEHMY14zJotg4
         2d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321969; x=1784926769;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2dr2URk2vPlePRWOIHvONT0t4cZgJRA/Uu95hvZl+Cg=;
        b=d2372jgE0FqFjhojjaGhKGI5vursouGYW2Akvvi2a5/EZFmJNGhr5aFtltcvZ3rmba
         Q6QJ8dtdl81U7w97GEMBeP5FRWEv7t5OHPW8mVc8FdD74ZX5KAATcdfT8SBmqcIrx0Y6
         qXhSTQGnxSRTT4o3/wQ92kQGJ/764uYZZ2/r0uSl9vOvin/HPp8UsPbxIV+z82PlzdDy
         ePh/58DWHfXKAFUtxBVXkMLNE4kTc4JB8YeMZGT+iHD30m63MhdzMvEI3tEI9KGIEA3m
         g4fkXzF24EDN1eBKvSYyQyLbJ7/UJlAEl+FSTWSdz4OZbduFa9RqCg18EfvLvB3ZQvT5
         KfMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVCpr42LJdOgPa6ujLdhXuykbIzhMHZL9n1dcT56uPK9czxZJy0TeaEJr7Zyb+daunAaRd/r5K9aqh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4RbwbEqxxULNOUl3D51HXYZzVFk7Vn+qe41/VWOI7FnhcZSjj
	Uc736FmbCqEEQIX9l1vGcdXHUzTVrDWQbQCDgro+QAkBZauN7SQ70U4I
X-Gm-Gg: AfdE7ckMmCc5YywlYeqVAU6wMn1/uARF+BtruxlLeFA6mFIkKzE1DOZXrhubefZWW8g
	V9ft78tVpNBhakVf7Ilb/1K/7W64f21C/SVsgkIM0UDI2UP4YyMHoK4pVMcGms9l9BZuaQiHUzi
	d0hmCqBgXALFVXe66tlynzjxs5534mG1qyFeMUNYkyzOyC5ae6iu2Wq1c/BGdNVvd1EIMcX5P6A
	H8RF0amLDWiwOO0XP6zwy3JRsoBgAraMAnfgWU1kuPJIe3/qLgYyQ0NJq3/jSufJAo5nLwI6pt5
	vvm+AB6K8R1dGNACx0UAL7SlfQHfGigPOsefv1Gj9yft/gqj7J/6zSfrGPZAREW82W1ZkoBqgD8
	BbWGt4kgm3aDBVdGkQvM6NfOSGOh70LM9poTTmk2VH7HDTs4klNcgbVXdegQgOS9+HOVkFn2WdI
	Rh55z3oK2t5eLgNhqt
X-Received: by 2002:a05:690c:3388:b0:80b:e6ac:53dc with SMTP id 00721157ae682-81ef23f7d8amr13832287b3.23.1784321969131;
        Fri, 17 Jul 2026 13:59:29 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef3e6656dsm20013647b3.0.2026.07.17.13.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:59:28 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [PATCH v2 0/6] hwmon: (adt7470) Add thermal zone and PWM provider
 support
Date: Fri, 17 Jul 2026 17:59:13 -0300
Message-Id: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKGXWmoC/32NwQ6CMBAFf4Xs2Zq2Wqqe/A9DTG0XWEOpaStRC
 f8u4N3jJPPmjZAwEiY4FSNEHChR6GeQmwJsa/oGGbmZQXJZci1KZlzWe82vucXoTfcJPTJ1NIJ
 LqQ9OS5iXj4g1vdbqpfpxet7uaPOSWoyWUg7xvd4OYvH+PwyCcWatUljvFDqH58Yb6rY2eKima
 foC4trsQ8gAAAA=
X-Change-ID: 20260716-adt7470_thermalzone-59a102278d72
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

The ADT7470 is a temperature monitor and PWM fan controller capable of
monitoring up to 10 external temperature sensors and controlling up to 4
PWM outputs.

Currently, the driver exposes these sensors and PWM controls solely via
the standard hwmon sysfs interface. This patch series integrates the
ADT7470 driver with the kernel's thermal and PWM subsystems. This allows
its temperature sensors to be referenced by Device Tree thermal zones,
and its PWM channels to be consumed by generic Device Tree nodes (such
as "pwm-fan").

Patch 1 adds the YAML device tree binding documentation.
Patch 2 and 3 fix two pre-existing bugs found while testing this series
(fans stuck in manual mode after an I2C error, and a
busy-loop/I2C-flooding condition when auto_update_interval or
num_temp_sensors is 0).
Patch 4 performs a minor refactoring to introduce the ADT7470_PWM_MAX
macro.
Patch 5 registers the 4 PWM channels as a generic PWM provider.
Patch 6 registers the external temperature sensors as optional thermal
zones.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

---
Changes in v2:
- Fixed 2 previous bugs uncovered by Sashiko-bot during review.
- Dropped the thermal cooling device registration for the PWM channels.
- Implemented generic PWM provider support using the PWM subsystem.
- Updated Kconfig to safely handle the PWM subsystem dependency (depends on PWM || PWM=n).
- Updated Device Tree bindings to require #pwm-cells instead of #cooling-cells.
- Link to v1: https://patch.msgid.link/20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: de Luca <luizluca@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Andrew Morton <akpm@linux-foundation.org>
To: "Darrick J. Wong" <djwong@us.ibm.com>
To: Uwe Kleine-König <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pwm@vger.kernel.org

---
Luiz Angelo Daros de Luca (6):
      dt-bindings: hwmon: add binding for adi,adt7470
      hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors
      hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread
      hwmon: (adt7470) Add ADT7470_PWM_MAX macro
      hwmon: (adt7470) Register as a PWM provider
      hwmon: (adt7470) Add thermal zone sensor support

 .../devicetree/bindings/hwmon/adi,adt7470.yaml     |  62 +++++++++++
 drivers/hwmon/Kconfig                              |   1 +
 drivers/hwmon/adt7470.c                            | 118 ++++++++++++++++++---
 3 files changed, 166 insertions(+), 15 deletions(-)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260716-adt7470_thermalzone-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

