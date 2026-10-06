Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AEB3C1092
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281402; cv=none; b=li28UYa66cHgLsOdlbzlwdmlq66Blcdg4dht4bGRSa9ZhdDeU5QjWNrXiaGLWduxrHd1/52m3I//v+CHtTZ5EFUgmLGb1RPXemB7IeN/BjTgpvXVi67Oz5cjOkUSAls48R7S5ixVLprmAanNOYPeEE0Zwv7BUkP5ZP2SsPqs1LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281402; c=relaxed/simple;
	bh=6YM5dOs2Pa7yUNeFsnmXwCOmE6Ns3r7eTdFiVyrvPY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX3HznomVKByNdNXWkT1y3GewD0YPBF9HD7fxvEliJcM5qIkUu87JAcaY9CfljDaNZVDe0kYMYyQiB7EG8Z3NmrP4q7BHQm6B8fJV5Intvs/coVGIQnOSpO8RpVr/jl0DyNKSOqLtfoECjpiMjhEs3tdJ7KOOvbQH26jaBFmbvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmjqhzHz; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmjqhzHz"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-873a4edb243so1907431b3a.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281401; x=1791886201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QH7NYDc+Yp9RWvv4A2NBCx8EZXAjVS1e6vOPWVaVpKU=;
        b=KmjqhzHzjz2gaQvXJtt4xACWGymOsdN4FCrS23pBQM3EWS0ZzdgutNj+Ut6p+HV0dp
         Jx9QbTN7GlL5rI99Yja90Cuf57APhG2UmOAPqDtysPVrp2YQP3JjDg3NZKbICbkDqWoU
         UJr0Y/A+T/3REA3m69b+LKJ4qtpuuiRUQhSz4AwARBtUflwHylbJvgJe36A7SylHpCo/
         DbfPn73pjzJkUcnH7FpwNJifRw50gdbXQBi1ZnBYD9Oj+789laBk20WrJ4oB2qpYuw3L
         Q2dlF6mUhP82ynL+buPRMNzZ8bhXf92/9lIw031fplo+qldSD2nGrWlyFiiKqn7dRqBG
         OnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281401; x=1791886201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QH7NYDc+Yp9RWvv4A2NBCx8EZXAjVS1e6vOPWVaVpKU=;
        b=p2Oh8zqkzarqa69BsxFqWGPXt70/tsQoM7jQ9jojJVPmXNv8Gc/OnaBhN4/C0OV4cJ
         EzAyh8G3w5G3cesNR9sNOWzD5am5A2nOILOMM4rk/a9x4WaH1BpVKWzVJ8aLga7y3aBO
         3Yp2Wht0mI8k82/NVougqMA03jjGjiO6a797f6ERC83YImNe+8p999sXv0aCHj4TgkhB
         1r31g/XkWuDzYWqkI6G0ofY6KsKjMxKjFkjokCjGIFqDo96zd32aCuRwEc8ohJeOw67p
         WvDtcekB9+kF41KhrwuHxSyTQbtX2Im8uoMltF9WBIh188sDbxEGyqHlIhEZ8voLylmC
         D4cQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6cdGC4wqH7mdHsgBUbRxVJfojB0p3ZYW24AV3kTiP/9wBvrAGFiGRdEwfRzIlDw7F/OzKef9KeClE@vger.kernel.org
X-Gm-Message-State: AFuF++m4L++/CVIUnnRgz4uD6fAfnbcmyNq5cw7f29YX+cqX529jd8gt
	w0DiRRZrFx0RYmEjl2o+fMcs+lE77aOgZSwKKuvhNz/LRrkT2drtCr4A
X-Gm-Gg: AYBFou3PkxwO+mEODE3m9Iuo14xpUWzyXRiwLByIo/pxPodDlaWvDf9kE9/Etr4EpSf
	CyERTIaU8NEqA8j595By5dFhpZjoq8Cd18hbF6Z7Vg9tT6mTOmLioQQij7Re3EH19rWMrICthUY
	7Cj0hFdnr5ZePAgXt+Zw2olt0O5nLQiKgkd5VoX8l2cfPnJZQZLUp+DEikC653IaKUgoQI/oFRa
	eUG5FgHuFKT99Oq/Ubf9dJv90L+coaAd2MbZXdyywf9CTF85Dfbtp7cBzCU4/vChrmfbosezcpt
	FSjWDNbPVcdn9BrQ6nXkq4UG8jxeGjgvAt1PQWU5k7hsV81DeIP8hoFshwQ2SuYKApioxiA1QIJ
	0XpQKePfG9HCkYTYyk2kPM30X9iFvbTkm2DNU/86RU5ECxU2tSvQSid4IEkGedjBaygsZiH+oZz
	cP7QCi4iqlqBveE0kqxVgudqhV6mImKBV5w7n3KDYydI8t5HOtQNr2Ia/YKVNci9iRrlf6dNRZI
	IE/EpEv8hJFc7BoQD0=
X-Received: by 2002:a05:6a00:4197:b0:881:4b67:ffd with SMTP id d2e1a72fcca58-88c6398f00amr10813068b3a.26.1791281400579;
        Tue, 06 Oct 2026 03:10:00 -0700 (PDT)
Received: from l (ec2-56-155-114-54.ap-northeast-3.compute.amazonaws.com. [56.155.114.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f7198sm4592961b3a.9.2026.10.06.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:10:00 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
X-Google-Original-From: Liu Yufei <lyf98405@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Yufei <lyf98405@gmail.com>
Subject: [PATCH v2 0/2] iio: proximity: Add Vishay VCNL36829 driver
Date: Tue,  6 Oct 2026 18:09:41 +0800
Message-ID: <20261006100943.78971-1-lyf98405@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Yufei <lyf98405@gmail.com>

This series adds support for the Vishay VCNL36829, an I2C proximity
sensor with an integrated VCSEL emitter.

Patch 1 adds the devicetree binding.
Patch 2 adds the IIO driver, which exposes the proximity reading and
a configurable integration time.

Tested on Orange Pi Zero 2W.

Changes in v2:
- dt-bindings: Collect Reviewed-by from Krzysztof.
- driver: Address review comments from Andy:
  - Use a Datasheet: tag in the commit message.
  - Drop mod_devicetable.h, sort the includes and include what is used.
  - Drop the i2c_client pointer from the private data and use
    regmap_get_device() instead.
  - Drop the unused i2c_set_clientdata().
  - Enable a maple regmap cache, mark PS_DATA and DEV_ID volatile.
  - Rework the integration time validation in write_raw().
  - Use reverse xmas tree order for local variables.
  - Document the power-up delay and use 3 * USEC_PER_MSEC.
  - Warn and continue on an unknown device ID instead of failing.
  - Join lines that fit within 100 columns.
  - Simplify the Assisted-by tag.
- driver: Drop the i2c_check_functionality() call, as
  devm_regmap_init_i2c() already checks the adapter capabilities.

Link to v1: https://lore.kernel.org/linux-iio/20261003050453.413700-1-lyf98405@gmail.com/

Liu Yufei (2):
  dt-bindings: iio: proximity: Add Vishay VCNL36829
  iio: proximity: Add driver for Vishay VCNL36829

 .../iio/proximity/vishay,vcnl36829.yaml       |  55 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/proximity/Kconfig                 |  11 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/vcnl36829.c             | 298 ++++++++++++++++++
 5 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
 create mode 100644 drivers/iio/proximity/vcnl36829.c


base-commit: 52c36105f76e96b638152a42e735f2e7767ed946
-- 
2.53.0

