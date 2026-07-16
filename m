Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93C32E72F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236912; cv=none; b=glZ1vyrdZon/rv2CY8Gf9E9FGedGPiMpbj5YA9AZeuGEoVHMdo6INqMB4bAsnhFm/6/BjMPORO/1eZw6ucqPVAPvyTbGv0jf7zuyFDpTokSvT0dGLK/DwObF+33sBe+K8g4pcoLcH3dGiJkzy0m1mm+ffzWmLpRa/dqqiJ46lxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236912; c=relaxed/simple;
	bh=whLSJ0SXgzimztpsKVgsGzpL60EQPO24JOkuA65lomM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RpmTnvLU04UtU8kbHWzrozLgGeYvI1rcFGkaeXnmv5CByEYTLnXPbcOI+ggLwLPyo484EbV2S3pvrOm0L0a18OWOX5kkt6qJCQZ3eyxshSLJnmg30+k+52j1j13Sfr9WFWfkjDRf8/2jmYiiJ+GOTa6gr+hmHUA832tDIoOqfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7QB04ph; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7QB04ph"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e6f0b4610so75548147b3.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236910; x=1784841710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HW/7zZX9KkXVW8FPnb8sMDZrgAlTfKu+h2QMjwPAaqQ=;
        b=S7QB04phfG3I90XNLqnVIBhZnUjaYFnUCB/YUjAFNrw1DWIDXB3SJXsHsSoZgh44Dn
         X+e0Vj/UzRJEpKo1S0WBurlid7sdGUObYkrhGVVhaOqdMOZoJmSgaRaDfK/F+WGv/viQ
         YYYDusCnIzkF6tRN+WVfQVLGJOAi4LsXuDv/8ltxXx3M4u/pXC5ytkDUaagbozmgU6RX
         As3GTwxFLKt7Ah5DtiuMT2Pi5T+wdjvKviEt6iaHZXGe8gmmHJaXkZZ5Z7gWV+qAMWkU
         FGDhjn7865ksDJJvDNrcW1BhNx1KrmgkYA4+bh+pSoCZxKihBeodMLEasOFxi1nLoH18
         naZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236910; x=1784841710;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HW/7zZX9KkXVW8FPnb8sMDZrgAlTfKu+h2QMjwPAaqQ=;
        b=pgpkfDO/adGqv3A1Bd1exGnku5vCgZP4s9fvFY1qgLOwAGosL304tfi9XcDFrTMR98
         MZ2z2bfwieNwkQ/8Q/syeCWs5AeRLghSbApsaankGSE4QpzV/EiDe3bru0B1YOiV9mXN
         2GCS6xdrIvVBXsErR4+Xs8JOMdV/Wh7pQS8X9stcZos5vpC13WOp+mzHI05Rlh83u3V7
         OdUFpCcu2yJtg0yYftzXOaFTkg2KIGP57+lJ+ZxmPFkdsFh6jkOT2PYWTslp3uK3XNcd
         DRxGl1u5u4ox9OzzxQ7jM9m71rrUOcARhXcBP3VqLCJQhdv5paH/oAwuYOOOZMYKnaga
         8x4g==
X-Forwarded-Encrypted: i=1; AHgh+RoiT+kr4b5omXRrSkCJQswAQvBV0bHvc8gX9vbHyZEJmGuH5DH1kZui2kOuy1NQ6lxDZS9g8lcdmLbu@vger.kernel.org
X-Gm-Message-State: AOJu0YzSipAMntl4Fwyt1s5csAg2frITdpT5g6/6JgY86JHzIO8HtbJs
	EAUxWqQ/cItV2Xz1jDARN/wFKVaB9S3IfK76Ju7/d0Mkl63n+rR+zZ+/
X-Gm-Gg: AfdE7cnpfmKFDf+u4sGoNOTo1m0++PQtWC0TAjcRW7g/hGqWNpoG6TlC7UrwnuxclbC
	kRgspr65RghZhHdfXmZnDmvr21MibqFuWSowATV26cj7Z0/ANm5W/eVBsHUlOs/V8SJvKpE9n9O
	swIJinQkH4Gs0o5L8ur8W6rjBB5kTk7ny335hH2Ukzmn53hHAiFruGVCCNo3jtZyHJY2XPgVtVB
	IBcbKjC7leNVzhe/O0XIONNe9LXr9cX/4wkq+wu7i51GkG27LsCNII69o3ALhMw/KflIhU2Dyqs
	nhvDGvJ99lTHXKAP+JmNnmjztI1lQrDb1cOOsguBO/Ox0aQUU50SdpyHL3lHrjzqVFS8T97zbX2
	Ddy+hkHbwFV3G/QIFU2EmhX18YzYEMXkP5zaD6KRRbct69nb18jsLtYb3QXt3oLmjAXABGxl77j
	4t28vNI9ICiV/9zQsz
X-Received: by 2002:a05:690c:6203:b0:7fd:add6:f271 with SMTP id 00721157ae682-81ebb2890f9mr105015797b3.49.1784236909541;
        Thu, 16 Jul 2026 14:21:49 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81eee7fde39sm5026477b3.36.2026.07.16.14.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:21:48 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [PATCH 0/4] hwmon: (adt7470) Add thermal framework support
Date: Thu, 16 Jul 2026 18:21:37 -0300
Message-Id: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGFLWWoC/yXMQQ6CMBBA0auQWduknSijXsUQU+kAY7SQthBjw
 92tsHyL/zNEDsIRrlWGwItEGX2BOVTQDtb3rMQVA2qsNZlaWZfoSPqeBg5v+/qOntXpYo1GpLM
 jhFJOgTv5bNdbszvOjye36b+Cdf0BBI1ppHcAAAA=
X-Change-ID: 20260716-adt7470_thermalzone-59a102278d72
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The ADT7470 is a temperature monitor and PWM fan controller capable of
monitoring up to 10 external temperature sensors and controlling up to 4
PWM outputs.

Currently, the driver exposes these sensors and PWM controls solely via
the standard hwmon sysfs interface. This patch series integrates the
ADT7470 driver with the kernel's thermal subsystem, allowing its
temperature sensors to be referenced by Device Tree thermal zones.

To avoid saturating the I2C bus during frequent polling by the thermal
core, the thermal callbacks are designed to read from the driver's
internal cache.

Patch 1 adds the YAML device tree binding documentation, defining
the necessary #cooling-cells and #thermal-sensor-cells properties.
Patch 2 performs a minor refactoring to introduce the ADT7470_PWM_MAX
macro, replacing hardcoded values.
Patch 3 registers the 4 PWM channels as optional thermal cooling
devices.
Patch 4 registers the external temperature sensors as optional thermal
zones.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

---
Luiz Angelo Daros de Luca (4):
      dt-bindings: hwmon: add binding for adi,adt7470
      hwmon: (adt7470) Add ADT7470_PWM_MAX macro
      hwmon: (adt7470) Add thermal cooling device support
      hwmon: (adt7470) Add thermal zone sensor support

 .../devicetree/bindings/hwmon/adi,adt7470.yaml     |  53 ++++++
 drivers/hwmon/adt7470.c                            | 180 ++++++++++++++++++++-
 2 files changed, 230 insertions(+), 3 deletions(-)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260716-adt7470_thermalzone-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

