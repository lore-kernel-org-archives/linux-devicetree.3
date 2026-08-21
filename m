Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D1446066
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307912; cv=none; b=FZPsiCPl8COJtCAHxlKeM1xvSeC7wWVEWDE27kZPHrYt2VRnmhCAmzP8T6MBSqtm8HT2styCGxdm4sWuG0wGYJsB4wYsH9NrvhjmwkzDGaVSlXw0WNcJsSgrmPzQr4UFcOgbYVnyURwEzSwxmOKEKIxBfp124myHM81+6aS3TI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307912; c=relaxed/simple;
	bh=bCAUpvYrDhZGAqlZRsCLa6zMXwegXdwEKisQrAJhwwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NfsAs1eiIvz0QuTWb6nAv+oWvyzX7GIVeKdhUx0gEO3/t8qwYdIROMheeOkDBDxaSGGluQSFJkxoprU7eDELFYUtyH9uHzt6PwIzNaS/k1VUqPezYNVt2Yo8ugqeRj8VQvjJuGWDDbow54t64cy7pCb08UDZ2+y188uBzQSLXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grDXpu8J; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grDXpu8J"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso5708975e9.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307904; x=1787912704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wE5XUorKDUJRScv0y8L+tE9Vdt20ZNkSxUGx1M2ZEFs=;
        b=grDXpu8JDgbqbgmONsZq+Z68DE6Gi+CCJj8hUehY5NQs7SvVflE5P2mOmd1FlF9mIJ
         UIj94zucARZuhT5tX6rmSTYJTw0+LlaNsa6d48nUbWn+kq0jK3q8LOrBOn18XELmi4iH
         oQZK7Rdezf3FlNSZCm44SSwuM93IBg2MjGWg1Gti7eyTWWwVW0lVFSrGGRC/YjCrNdzp
         ZeDIhTES0zJumPPD5awkxlpMfQIjIhfVhSWIld8ktAHEzNq31SNmnmq2viPuWf6/NQLV
         zEYlYttynzWv4FOFQkhap543NGZcioFkots1KFM5XiuHssttkAmBDkDf+ZyoXZIb33kH
         lEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307904; x=1787912704;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wE5XUorKDUJRScv0y8L+tE9Vdt20ZNkSxUGx1M2ZEFs=;
        b=RHntxSO0TKvLNBVtIBmo6/a5mce8UIBcdT2gckxlyhYeru1x7LBsKqkLwBYjEoO0sF
         C7Z2pe1/lhjVZ5I2tqfm6TeO1uhu4mVNcIQjlyrRbls/puX8JueeNsA7jLUUfd4gT4wi
         56bjvFoivZsF05lqAOEHZ/vsMdSEIDTSJG6FUIG2DD2jUyXwSW/9D0XMX6MdwlKzNrZL
         2Qt7JgGw7NozajgqNVzUyVrYFBq7q+z+zHVRo2yKZZZ0TXj+mbCnpth2WU5i7A8Xntl7
         cGcQE1G65VbPAiQR31zh8XlhKVw/ep7UFQYqrhxSc5eCex4PK9F+Z2hPtyMwrOysyQ9M
         O65Q==
X-Forwarded-Encrypted: i=1; AHgh+RrTbAJ0dW/CHBdfcg02P6DfExan/xGVwAOJ/QtJayrLPGapjECuyZOZDp6tnPqlSZdrtJVMmqUF0KlF@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6vEycV3t7RkW1igAK35usJhBB1o6l/Hmk83oYg3Xk7eS3KcZ
	Q8mX3ANpc1rcdGMwfYO8pBjMABxERRBYCaFRBo7PhHtJBQt/0baK5WYr
X-Gm-Gg: AR+sD11vNFJYIuLRPJ3rti8C9cC4FRLtprqlBMpBgz0mDlOw3f0ZWOO0I51ljYy7qw1
	q1/DatI0Sq5dLXWfTAcdNs1cRgS9e1rC6gHEbS0h/8iVx7CcF4L7FwHTG/Vsm0hfolI+e/twwEv
	sfNmEaJ0yic94f2Kh53udMlp/6IAVX1kvMRIOIB6p3Cs0Q8A0KA7Cf3a4C96BHyVjbnOqWGBDev
	y4Nfb1EkW073Xgrihf6cxbmFex2Gm00QNQCiDWSIiJGwOwKuivWzdSII6wbrW/g4ZlnZvCK4aCH
	ZUvL5XK9saGWvCWb3kMcK3/o2fqQglMvAu8v3PWfwXVg6vV8Th0HVx9m1LUbRWRjda/SXfdVtcR
	zuGSIn1Vpm6OBaRmF1hZ2uoslQ7EZ6EgO0M40hr62TSyiqbgH78iCCJbwVQ7Vv8PQ//EZSBIO3M
	qH5P+ybtC2gpjFvaA519N6s/AD1eUvSGSjNfxt5+12Zt+c6RXLrZQw78gWNeN5VpkI7U85xPvJc
	ftwMtvIxYUekSQ=
X-Received: by 2002:a05:600c:4704:b0:499:9069:c2c9 with SMTP id 5b1f17b1804b1-499b84613fcmr69079535e9.11.1787307904031;
        Fri, 21 Aug 2026 03:25:04 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ba5139sm11663155e9.2.2026.08.21.03.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:25:03 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de
Cc: Michael.Hennerich@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v5 0/6] iio: dac: ad5504: bindings, cleanups, locking, and scale fixes
Date: Fri, 21 Aug 2026 06:24:42 -0400
Message-ID: <20260821102452.37407-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jonathan Cameron applied patches 2 (sort headers alphabetically) and 4
(introduce local dev pointer) from v3 directly to iio/testing. This
series rebases on top of that state and does not re-send those
patches.

This v5 series addresses feedback from the v4 review by Jonathan
Cameron, Andy Shevchenko and Uwe Kleine-König:

* Drop <linux/mod_devicetable.h> — now covered by spi.h (Andy, Uwe)
* Add blank lines after all guard() call sites (Andy)
* Rename macro to AD5504_VREF_ACPI_DEFAULT_mV (Andy)
* Switch to is_acpi_device_node(dev_fwnode(dev)) (Andy)
* Use (MICRO / MILLI) for microvolt-to-millivolt conversions (Andy)
* Trim all commit messages (Andy, Jonathan)
* Reorder ACPI/DT separation before pdata removal to avoid an
  intermediate commit that hard-fails probe on regulator-less
  systems (issue raised by Andy)

Testing:
Re-verified on ARM64 Raspberry Pi 5 (BCM2712) using a custom Device
Tree overlay on spi10, without physical AD5504 hardware. All test
cases from v4 pass unchanged with the v5 code:

60V path (output-range-microvolt = <0 60000000>):
$ cat /sys/bus/iio/devices/iio:device0/out_voltage_scale
14.648437500  (60000 mV / 4096)

30V path (output-range-microvolt = <0 30000000>):
$ cat /sys/bus/iio/devices/iio:device0/out_voltage_scale
7.324218750   (30000 mV / 4096)

Invalid range (output-range-microvolt = <0 70000000>):
[   94.762850] ad5504 spi10.0: error -EINVAL: Invalid output-range-microvolt
[   94.762857] ad5504 spi10.0: probe with driver ad5504 failed with error -22

Backward compatibility (no output-range-microvolt, vcc-supply = 60V):
$ cat /sys/bus/iio/devices/iio:device0/out_voltage_scale
14.648437500  (60000 mV / 4096 via regulator fallback)

Powerdown sysfs read/write and powerdown mode switching (20kohm_to_gnd,
three_state) verified on all four channels without errors.

Previous versions:
v4: https://lore.kernel.org/linux-iio/20260817211118.21833-1-0rayn.dev@gmail.com/
v3: https://lore.kernel.org/linux-iio/20260509142047.30302-1-0rayn.dev@gmail.com/
v2: https://lore.kernel.org/linux-iio/20260310174835.24209-1-0rayn.dev@gmail.com/
v1: https://lore.kernel.org/linux-iio/20260212181955.42724-1-0rayn.dev@gmail.com/

Thank you to Jonathan Cameron, David Lechner, Andy Shevchenko, Nuno Sá,
Krzysztof Kozlowski, Conor Dooley and Uwe Kleine-König for the
continued reviews.

Taha Ed-Dafili (6):
  dt-bindings: iio: dac: ad5504: add output-range and missing gpios
  iio: dac: ad5504: Align headers with IWYU principle
  iio: dac: ad5504: separate ACPI and DT paths
  iio: dac: ad5504: remove legacy platform data support
  iio: dac: ad5504: introduce local lock to protect state and spi
    transfers
  iio: dac: ad5504: support scale via output-range-microvolt property

 .../bindings/iio/dac/adi,ad5504.yaml          | 39 ++++++++-
 drivers/iio/dac/ad5504.c                      | 82 +++++++++++++++----
 include/linux/iio/dac/ad5504.h                | 15 ----
 3 files changed, 103 insertions(+), 33 deletions(-)
 delete mode 100644 include/linux/iio/dac/ad5504.h

-- 
2.55.0

