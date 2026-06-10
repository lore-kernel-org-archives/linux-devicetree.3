Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214C257459
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781057108; cv=none; b=i2ExEtgaW8wdJtevKfskIYKZrQTUVxIieEChXNeLzqpQ/MkLqS7oR8OGzPoirW4si9IRzqszouH4Ygq6svfeFEN914XpIOzoNvMy0xvDunx+5qFaA/iFczCKvV1GhTsj6PrNeS8wkxV42GB2jSU/j0R60QZYeBKcBG36yPzS7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781057108; c=relaxed/simple;
	bh=kHL6K4ZLeELDuszBbDoOYeeWsA/Tnp/43gjMSba75pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7gAvFtWPN6hihAuCxWPEHGI4AxG6gdxELaILtXD3ROeqKDq2FdxKpalGK9rL5baoSDZ9dA21zOcBvNwKJWKlwb3h92LmJjgYTgTeL+u/If4KF4fOcePjX7LG6QuerrBD08CCKxEaHRIKSv2GFoqpIBvqHH+/rocxSGEZJXgKd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEsk21wC; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEsk21wC"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-915ab38ac14so682521185a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 19:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781057106; x=1781661906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+xGOAkYk4QnjImnBeAxiWKERcgISWjEuIc16pmSjAg=;
        b=iEsk21wC1WPlQrDAKuuRPO4qZwIoIbHefARBPdR4AVGaHXIy6olAaFs7uuZr24IGbx
         pZDo94SRVTVt7CR3fvTZdMNDUWqKJpq/buZFY2DqdsPM4LENVztnB1ctFyWtkOdiuwdZ
         977uElQUV90yJDvN1tm1jXHsK87+0Ojip25AWARG5+P42gsHY/mbdg8xYxu1w+QkmbP5
         xrnC1rt+8QrKOl9uV+00kL62y8rH1rNcMkGCeKpYzvsWDDlEHfigwmfIcSoKwkdrkfUt
         k36j8+ZxkokKH/LRj/gR5C2DVwOsls57/gl6hLgF39Ks9dnLgMIZs0BIaoQA7ZO4+kt8
         5xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781057106; x=1781661906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+xGOAkYk4QnjImnBeAxiWKERcgISWjEuIc16pmSjAg=;
        b=BYqkAN5xrfozB6EEKJ7lmNUASlI0njj92HofGaSLXFNm3IcGRhpGFfP/kj1MSHKF/H
         4e/hecvperev/wPskuxWQ2ejPxZ/bSAy7Ye19sntojnur3PfKKySKKu34DZg+Zz/TjBg
         944sk7ioK5KmJwJUib/1zAlsOMPRYWflDI+32liDGZDz6VlUP8TicjexV+e9vLbWZXR/
         QNECGd2A8bT/HT8WkBdClCxwdilbB1ynIOhEFFavgW9RLolV1Cr8Y2LPw4MdbWIOzUS/
         k0kFErt7SqzGTFPgb6Q9O1OKojZEzfrvQ+EVvjfr2dT4hIdA2b2NBE1iRMoeimiMNPt9
         kpuw==
X-Forwarded-Encrypted: i=1; AFNElJ8DkH3O+HGmLPoPMon2um/j0QihYYwW9UmqpXG26r3d2j6c3SEv6tJru2OdoS3FsbixUVJYXxzL7TY7@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGUS9u/dXNUEfRIVRfDzzO5B+jXzFgEf6EnHOFd0RGQVx76rD
	BxTgObGver6zGgqj5KuxvGcqZFeFGesbABRw0O5G7oQ+/uyGUd9qFzkE
X-Gm-Gg: Acq92OHIz1oUTFLwi7Xpll+4wE6eWjjm4VEZvnMuhxDm9YOKw8uorHAcXb8YMxh6o1J
	9fjsvBOqyVbdshOPVHd9ljzI+FCwpwMzP113GVjVwZ+rXLfAMF/tOnoiKArvn/Je+UUMv9l+Y3b
	zmHt2LVCBGciIFXVZAJ+P86G9qULZgD+yRHQwDGjZxAk4P9AVA3Q/umoL1wVX7bKNi4ia3OqhFC
	ZT5hyKOssTO0+CKlARGyn5Jmt47ujIGoKHiCoaNv/i6ni7WIbTf/HI1eUoqqIRALuC8QdlXqlS4
	sPwU69WXuU6E1uUvEafwoFa3yJuz5QwZqvuvRJhnHm/V9mO/R5E4tQEW++tAV7EfugHPjLa7pml
	naCzIERM/rbqdH+dQuWC3cfNAVGotnE7TACPv7Pih1lqJIQzCF2ABV2unIlypHaEpDIb+nLfJgw
	zGUKlh3D1RXhBy428d3pZclba9U+aLLKI1SbYjfR/udQPtnes=
X-Received: by 2002:a05:620a:454b:b0:914:9ecb:9adb with SMTP id af79cd13be357-915a9dd8eb5mr3417975385a.50.1781057106318;
        Tue, 09 Jun 2026 19:05:06 -0700 (PDT)
Received: from louisarchdesktop ([2601:184:417f:5ad5:c570:9008:5a2b:8db7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a40d566sm2267004985a.47.2026.06.09.19.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 19:05:05 -0700 (PDT)
From: Louis Adamian <adamianlouis@gmail.com>
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
	Louis Adamian <adamianlouis@gmail.com>
Subject: [PATCH v2 0/2] iio: pressure: ms5637: Add variant specific
Date: Tue,  9 Jun 2026 22:04:56 -0400
Message-ID: <20260610020458.104818-1-adamianlouis@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds temperature compensation and pressure scaling for the
MS5637 series (02B, 30BA), MS5803 series (01BA, 02BA, 05BA, 14BA, 30BA),
MS5805, MS5837 series (02BA, 30BA), and MS8607. These all share the same
temperature compensation formula, but the constants differ between
devices. This series adds a ms_tp_comp_consts structure to store these
per-device differences and applies the compensation.

---
Changes in v2:
- Rebased on top of the togreg branch in iio.git.

Patch 1:
- Add SPI bindings for the MS5803 family.
- Add compatible strings for the ms5637-02ba and ms5837-02ba.
- Add vdd-supply as a requirement

Patch 2:
- Fix the sens2 calculation in the 2nd order temperature compensation.
- Fix the pressure scaling in ms5637_read_raw.
- Add datasheet citations to each compensation constant structure
initialization.
- Addressed automated review feedback from Sashiko
- Formatting
 - Remove unrelated formatting changes.
 - Change ms_tp_data struct initializations to match the existing
   format.
 - Sort i2c_device_id alphabetically.

Link to v1: https://lore.kernel.org/linux-iio/20260526185612.35048-2-adamianlouis@gmail.com/

Thank you, Jonathan, for the comments on v1.

Best regards,
Louis

Louis Adamian (2):
  dt-bindings: iio: pressure: Add MS5637
  iio: pressure: ms5637: Add variant specific temperature compensation

 .../bindings/iio/pressure/meas,ms5637.yaml    |  87 ++++
 .../devicetree/bindings/trivial-devices.yaml  |  10 -
 .../iio/common/ms_sensors/ms_sensors_i2c.c    |  62 ++-
 .../iio/common/ms_sensors/ms_sensors_i2c.h    |  48 +++
 drivers/iio/pressure/ms5637.c                 | 388 +++++++++++++++++-
 5 files changed, 552 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/pressure/meas,ms5637.yaml

-- 
2.54.0

