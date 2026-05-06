Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC736A008
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 06:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050147; cv=none; b=b5f//lwC/egGACCogFZvFXVIMsRFy+GPvk5Sc7kCJakS+Zf9Se6MbNj2FjWr7iHLsOn8ivwGiT5IYwWphMXFnI0HQGU3A6nmpijEYpDX6724li7ifeCe4ZVqcllkZiQWTarax9sAHyaTCg0jh+PgzRHd9KbIstW8OjbgZr06JKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050147; c=relaxed/simple;
	bh=vF6eGn5qklDVbibC8z7iWkKkeqLbIWPS7CITIPlg/T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r5UZQ4S7x64jdE4GyXu759YyCtPRppNhmCIMyrYON+KaHTjHb1cgP+V9xeOth4+XvMFsHCCWigXfVrz54h0EIzAhUWo0Qi2FzZbolGfd1mB3BVoriCQDHRoXZHez1MKYbr3Yxp6TXwHp8GExU6Ho9s9ixDjtQmLXYy6y6o4/tXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJE8m3o0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJE8m3o0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso45269245e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050145; x=1778654945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGaUKl3/SrhNPHaQfJ2QhPN+oX72lXRnFK0yLcce7gI=;
        b=cJE8m3o0DnnNOfZBebwyCWCmjQjeOd/Kkdwwj+IRcf+/4A6f0z0VxVS6SHsO2CSXgL
         TfTMuDiw15ZPGdkGwWabIAFJ97OLkP/A47UixfcCv7OpDEB/1Vked0JmQlje8FG99a1f
         vb+SJQ4sTG+jTb9fDiflPZnwys6pnU6jyxewFs4cGMrSssKmVkG1luPpGto6aRNGPxok
         LjInGs+afNB7LTePXTm48zjXSeG0j+VFDrgBlUKr52foXguc866YsVkVuqwVU6Q9+JPq
         FzKG5bKxCliq0m10o4NvIVmeI2c9N4DIbB3fgXw99ogyX4yVhJ9Zb3JIwNnlqKEWXNVl
         SbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050145; x=1778654945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGaUKl3/SrhNPHaQfJ2QhPN+oX72lXRnFK0yLcce7gI=;
        b=bRwuAIWmejqKjqFumHP364PPUBq/wjeaUbqn/vgVzj3dLvOYM6oF+wAWItjFjdj3Z0
         asBQRRpURvrURlpFyKekopsjaS0+DeZIPKO2sUw/cepC8WyUQ3qOSnd4n+P8zPIE2XTN
         2Nzrp3q1jNLX1jfIVs+Upxqw3wWCnLv/j6IFG3H3VOg74J/iKlJypjIbfvWmv/Yc3H5E
         ZWGLo0i6U3Lr9A9nLojR95/F1LrGIzZb0P7oQe8+WAVbRfBz3JaYm6V3UkCA6Lw8TzrO
         A4VDsn0mwnn1bT44GKvOWEv6K+xWVy1e/pnj6wgKtc3OxK5+RJSnvrIopCQk1X9KMCjo
         GyDA==
X-Forwarded-Encrypted: i=1; AFNElJ8aS5Wz62UCsWWXojC63hvF0713haIAwBIwHNFYRtBh3Kra5a94dIryBMkW3ykjjtpcUVwmqaO7wTGf@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3fD9ar8B2aqvdh12k7tL0gqhECh7sDXXyBr3DFtJ7t9O+MJ5
	98cmjD5w7EdWQJfqkBGUFCXalYz+oz8qCMG5EQFeFqzPS1U17QVB/RBE
X-Gm-Gg: AeBDiesMPC6hP1qBvFrPq9pnRXnEZh5aFoSCPDcpRKNsS9K/hLTdXDQBpebpk8aCHtJ
	XXnWPVb33RRQMtbkss96XpptQ8JocN8SuNffL95mDooeQJn6xBzGSTWXd2eLXOS0quZ8XvPYofF
	w0cTBx+PUpdfUX64qPocHsNZo6VGUnLwhgv/5vCuWbv2ba2jjm9TwqEDN116KVLL6Hlpu+YH/fu
	fkcCP1QAxOvtTZbw6AJZLA9iqajd1IHhu831+R9BlM94hbs2vTvq80kll2qrdpTkURrZVZ6aLeX
	3l7kdLMqGhMshEuupuw+B2J/Mi6e/6lH8a4U+23+YyOjXVLwR0NUnAf3YNBfVarVB6qSeqoRgyO
	87iUrlsvaoh3N32RAHpzG2PLIwGvll4Crd6HQ7Du6JFYcOhcOeuqBqHBeQTC76ZcsyQGJWbh1P+
	qlFh+rg6T0Gf74FYOOqNXU1xE=
X-Received: by 2002:a05:600c:a305:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48e51f444e4mr23183125e9.19.1778050144442;
        Tue, 05 May 2026 23:49:04 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v6 0/6] media: lm3560: convert to use OF bindings
Date: Wed,  6 May 2026 09:48:41 +0300
Message-ID: <20260506064847.37795-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v6:
- fixed swapped current ranges for flash-max-microamp and led-max-microamp
- for_each_available_child_of_node > device_for_each_child_node_scoped
- pm_runtime_get_if_in_use > pm_runtime_get_if_active

Changes in v5:
- schema adjusted to take into account lm3559
- device_for_each_child_node > for_each_available_child_of_node
- lm3559 and lm3560 configuration was diverged with data match
- removed redundant header

Changes in v4:
- fixed current being off by 10 in schema
- label property from schema replaced with modern equivalents
- lm3560_init_device moved before subdev registration
- v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
- added subdevice cleanup if second led registration fails
- added check if "reg" property exists for LED nodes
- added missing fwnode_handle_put if device loop fails
- added bitmap to monitor configured LED id
- added pm_ptr() macro for PM operations pointer

Changes in v3:
- added note regarding lm3559 in the schema commit
- lm3560 power on/off functions converted to be part of PM,
  dropped redundant wrappers

Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features
  media: i2c: lm3560: Add proper support for LM3559

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
 drivers/media/i2c/lm3560.c                    | 383 +++++++++++++++---
 include/media/i2c/lm3560.h                    |  84 ----
 3 files changed, 479 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
 delete mode 100644 include/media/i2c/lm3560.h

-- 
2.51.0

