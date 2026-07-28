Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF354756B3
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275388; cv=none; b=SzPMPW+i6AjcoY1mIU89Hc3Uc4rONBqCRibIvLbqIOpPWgsKB3yeBZTvgYQNrvx7jyIKzwp0zPyJpeRMIexcVQTHKX4or5f+cc3POoxf8B6eAjySZ+GYLNkcbed5kOTA86ESiCpTSk7pd8QGmif+yloLe8xTqgnIXMWlgiSVyZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275388; c=relaxed/simple;
	bh=m9WTyRPX3CTtev1o3PhO9FQYiIljtJyc2OUPXlP9aws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jF21ETNEoCI8BylE4MIsK1aqvmktl1Q2mP2PVFMfab42epEkNru4qCgIy8AEv08fjErTcPpgsbKLsK0nkOGq3yySAa0rp7RXlwMdlK7pmzu0c3e3R5B3FYmZYjNhjJc/cXTpgWJL99pFwnZmKGWaXlFrZWDXc84uu1cnRYv6aAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mivd/mB3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mivd/mB3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954afac04bso3386565e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785275385; x=1785880185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3yJJxjA4jwLPit1RMUh+Ow88Dp8B6i7wdRDxZCyrLZ8=;
        b=mivd/mB3M05A/q2m7edWivA+7W2G+KzUP/7RKMMO0O9QHd6wzF669SOk6SF5Ri81jx
         kDdWmY6x2ZemZ74q0zT3ceS7Mcp8krmZeeMtvtf9vD5fDvFjkYG9MwL1yr8XMUwy/7vS
         +LONnfurBcYdKPaZ+DsMxNu0DGVSzMuB60iAQjUYS7JfcVgHldzBtJ7a7vACWrkj+GT0
         ucB01ZOYrRJ5cKmQq2nVvmXPHBSZKdac8mWqoYFM9Wj6mAGnWojypkDlCW3wo7pP8Qip
         PaiuaHgtJMeJt8UrZSm3ALWJ02roDuSubcV16Ivi4T3Pz06ftEfAU/vfuQorRMD6HzO3
         e63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785275385; x=1785880185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yJJxjA4jwLPit1RMUh+Ow88Dp8B6i7wdRDxZCyrLZ8=;
        b=qbbI1qwYqnZNvWWwikYPmSR8eYoWVuZge5TJEvzHZ2NckEpIfTSlTAWwo7EWnFwltz
         zR4g1I0fuhra57JTeWkQSwmqi1FhPYLaHHFtkeTJHKXZoMkX+jDXbBPnVMvJyw596SSZ
         IhXgiTHdD4deFIx7FBIhN2LTUPem5/glMJ4yK6xRkeQ9jtIQuf+R9xcj+kZMEgTC6+OO
         uRmy4oXhIUu6kezPdOrzJkz95s7WgCNLeM5hjBhgCuHZzg2UJFXcy1Wbn0WhcdifUeqX
         QPERIq3xSLc75fQnqUvJMwgGsfLc7/C5ekNE0l+9EEnv5n8fuXv/eNQacJ/caDElQoCW
         9c4A==
X-Forwarded-Encrypted: i=1; AHgh+RpM9ghC+nn8+4boNnORIrISJvhXov2FsV/RhWyFi5p5+o4Vo779NPqTDzi2hY628myedsbKwGI53KJx@vger.kernel.org
X-Gm-Message-State: AOJu0YyRe0qM3xwwyzWQJLehsZXtJfG/+aSBW7Q5AfLohh+Ni+UPhLV7
	dJrQb0bprhYdLj5gQ3mzQM/xrpAFK8nGoCwRPs/TUo7G58hlaKLd1DbL
X-Gm-Gg: AR+sD11VBDVxZoabl7AsBwjrcWvABimxo3gIMObybq472Cy/3DwoHLjvTmvtIlIfG5l
	4bwsShN7eimVy4w6AfydAalI3CK4+yPQjnAQ2gjqP4rgysIjT9ZmJFo6XIdlOGT67IQ2UZzNCdC
	BWUrX5mOD319/eiKfnCm4axKcaT6jFVCZBTs8L6NpvQ30kvxLyPhqOs6RFuNRO2tXnHZ0taGMYp
	+ywKCqfMgf6VgKKi91tkBpsIlFJv0hf/0z9m1ZCiHPKh9Cx6dN9injfZWU9GJeb7VKeC9/xLSzY
	QwS/D+PaOqgNPt9bEQiPFumF/SIvc6KSnk+Z7shXvZzJc4lC5Xofdlo/gOrHnyxG+eGUaiiv4+2
	M8+bXzUKbApmXRnjgvmsVi6z10myUujggjFN773ojr40eZst0ODVdcKMsqtM=
X-Received: by 2002:a05:6000:2685:b0:47f:8810:cc64 with SMTP id ffacd0b85a97d-47fb1e6cea4mr5113712f8f.19.1785275385017;
        Tue, 28 Jul 2026 14:49:45 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0ef25sm2353042f8f.24.2026.07.28.14.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:49:44 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: jonathan.cameron@oss.qualcomm.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	maxwell@maxwelld.cc
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	455.rodrigo.alencar@gmail.com
Subject: [PATCH v6 0/4] iio: flow: Sensirion SLF3S liquid flow sensor
Date: Tue, 28 Jul 2026 23:49:39 +0200
Message-ID: <20260728214943.29820-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series adds a driver for the Sensirion SLF3S family of I2C liquid
flow sensors (SLF3S-0600F / -1300F / -4000B) and a new IIO_VOLUMEFLOW
channel type.

First of all: sorry for the noise.  Patch 4/4 of v5 never made it to the
list or to patchwork - it got lost on the way out from the machine I sent
v5 from, as Jonathan noticed:

  https://lore.kernel.org/linux-iio/20260720032927.14fc4f9f@jic23-huawei/

So this v6 is mostly a resend of v5 with the driver patch actually
included, plus the binding change we converged on in the meantime.  The
driver changes that were listed in the v5 changelog are repeated below,
since nobody got to see them.

The series is based on iio.git testing, which already contains Rodrigo
Alencar's IIO_VAL_DECIMAL64_* core formatting work; patch 3/4 adds the
IIO_VAL_DECIMAL64_FEMTO format type on top of it.

Changes since v5
----------------
  * 4/4 is included this time - v5 only had 1-3 on the list
  * dt-bindings: dropped the fallback compatible entirely; each variant
    now has its own compatible, per the conclusion of the v4 discussion
    between Krzysztof and Jonathan.  Since the driver has to look at the
    product-information register anyway, a fallback buys nothing, while
    separate compatibles let a future drop-in part claim a known
    compatible and work on older kernels
  * dt-bindings: dropped Krzysztof's Reviewed-by, since the compatible
    schema changed
  * dt-bindings: commit message and example updated accordingly
  * driver: reworded the slf3s_detect_variant() comment and the commit
    message, which referred to the now-gone fallback compatible.  The
    behaviour is unchanged: an unknown sub-type still falls back to the
    variant named in the device tree / I2C table
  * rebased onto current iio.git testing

Changes since v4 (from the v5 posting, repeated because 4/4 was lost)
---------------------------------------------------------------------
  * driver: include err.h for PTR_ERR() and math.h for struct s32_fract,
    per Andy
  * driver: fold the per-variant scale_num/scale_den pair into a
    struct s32_fract, per Andy
  * driver: add enum slf3s_variant_id and use it for the variant table
    and the I2C/OF match tables instead of bare indices, per Andy
  * driver: slf3s_send_cmd(): drop the "at_least 2" parameter
    annotation, decouple the ret assignment from its declaration and
    check errors first, per Andy
  * driver: use sizeof() instead of ARRAY_SIZE() for the measurement
    byte buffer, per Andy
  * driver: parenthesise the (FEMTO / MILLI) factor so it folds into a
    single constant multiplication, per Andy
  * driver: derive the temperature scale from MILLIDEGREE_PER_DEGREE
    instead of a bare 1000, per Andy
  * driver: checked the struct slf3s_data layout (re Andy's pahole
    question): the non-pointer members total 260 bytes, so one 4-byte
    hole remains for any member order; left as is
  * driver: drop the inline comment on the mutex that duplicated the
    kernel-doc, per Jonathan (checkpatch still moans about it)
  * driver: fix the duplicated argument in the DT/sensor variant
    mismatch dev_info(), per Jonathan
  * driver: reformat the i2c_device_id/of_device_id tables to one
    member per line, per Jonathan
  * MAINTAINERS: updated Maxwell's address in the R: entry to
    maxwell@maxwelld.cc, as he requested on the v4 thread

The signaling-flags word (air-in-line / high-flow / smoothing status) in
each measurement frame is intentionally not read; exposing it can be a
later follow-up.

v5: https://lore.kernel.org/linux-iio/20260714085358.20842-1-wafgo01@gmail.com/
v4: https://lore.kernel.org/linux-iio/20260611132700.671322-1-wafgo01@gmail.com/

Thanks,
Wadim

Wadim Mueller (4):
  iio: types: add IIO_VOLUMEFLOW channel type
  dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
  iio: core: add IIO_VAL_DECIMAL64_FEMTO format type
  iio: flow: add Sensirion SLF3S liquid flow sensor driver

 Documentation/ABI/testing/sysfs-bus-iio       |  11 +
 Documentation/ABI/testing/sysfs-bus-iio-flow  |  21 +
 .../bindings/iio/flow/sensirion,slf3s.yaml    |  55 ++
 MAINTAINERS                                   |   8 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/flow/Kconfig                      |  22 +
 drivers/iio/flow/Makefile                     |   7 +
 drivers/iio/flow/slf3s.c                      | 543 ++++++++++++++++++
 drivers/iio/industrialio-core.c               |   3 +
 include/linux/iio/types.h                     |   1 +
 include/uapi/linux/iio/types.h                |   1 +
 tools/iio/iio_event_monitor.c                 |   2 +
 13 files changed, 676 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-flow
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
 create mode 100644 drivers/iio/flow/Kconfig
 create mode 100644 drivers/iio/flow/Makefile
 create mode 100644 drivers/iio/flow/slf3s.c


base-commit: e0484d62e8e1cff75b210938be835ea6221bda59
-- 
2.52.0

