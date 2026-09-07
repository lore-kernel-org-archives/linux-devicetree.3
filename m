Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84ED3F44C5
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 21:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814852; cv=none; b=oraaxYd8e/NZNwIUta+liZIUMAjZTOF/+PUrWp1cvs7ks1IJ+YjqVo1jgfp/LiKdC85i8i3p1I0O6OzsT07SC0+6IJVoicj+HtwR0Ij8CpaXJfnjBrD0mbgu7BfeMhd7doSB95U3QPTPYDKAo24Ic6+rtXxBr48FVKPOWDgoLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814852; c=relaxed/simple;
	bh=R3zDQ8xU2MgwP232Uwo0QTMTrPn5Pt9Q7i4NRM7VQOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuVOZwNTFzbDWzKtSH/W63n5//83ITjWhaMEKyMmv19L5z2I+updwtVFvafqRrj/Ia+UTlujaZbvqg8dWCKTfFbJjYvFDo73y8t4SEU7RsiZeou8L34qQEE4qWKYabGJBlSxcOsXTRE3GXXL/trvvvCUHL7pAPeEkSJsvtQxh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBGcwyHA; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBGcwyHA"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-861f30636f9so55225857b3.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 14:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814850; x=1789419650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gojEDyDfYLvhRqOvL4tTAlYlPBK48sUhaWTtz7U0ImA=;
        b=pBGcwyHAElwUxdB0iRO9SdrGc43rjWWzkAwp6COw1rSbh8yOMphL9Fz6CHqfW+tk5G
         fXnUmqiQUjHqlqiZ7OoslBkCxEVQrQ65zCNV1PebGTZvya3uC3kvJFLjo+g+3badfj/Y
         6ozzfIFAN1qlqaDeX9TBVH+QuRAf5NpuIx/lnBzKrvKiJuKxOWlsvm1ekLtPiQ7brRRW
         FlPt/gSK6KeAUQSOhmxHLooNlAYQbS3U6+Ew5kHJdbLuNiL3jgcb0SbPEt/7KNUnRdUS
         54bhety5s+1wF2wQ5mHqJ5i34Qzytg7UuOWWGqBJwq0IQeS8B3HQq6h0WjrNI1uJiVLI
         zgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814850; x=1789419650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gojEDyDfYLvhRqOvL4tTAlYlPBK48sUhaWTtz7U0ImA=;
        b=pK4GQ4CjFnwmDSj00HgGcdlu6SRI5vpJ0YktUgGOK6kQfX3Ke/s7ixWBNw8Zb49Jbp
         eXab7x7pq6csoKn8hvQaWD1Ss0PtQgWUBfVMeyJ2KfWnQBdi2i1456cXdPr4d8ni0S+2
         DKp9mQmKQITDrOrrvL16wRTK3lZ3/AU7rtB62j75gUPyoLtN79CNHbKBYeIzraK629qM
         0+3G6ZArniCAmv/sc1lEKitQ8ZPAp8u78nnd58n5Tbd+rnQJ6IqOt2JJk74ohR2p1P5y
         LMtk3KSlvBjyRuLaZXSPsPbcap60zc3xzOD01dTuI3tBWAWRFdqw8QmiSSYx9yM9XaFV
         6FSg==
X-Forwarded-Encrypted: i=1; AKwUvByYd4KTNU8rvac3rA4ZUJssqHy521q3hXoGMShcTOiXgSTwUGfP8qe0zhnH0nK4SUS515nu96eHNH+P@vger.kernel.org
X-Gm-Message-State: AFuF++nVVMWASgI4U2qEp4dIqBtafMG1SG4x3p8zpCc0fLmrG1VJ2Af6
	goW1pkn/TSSOUP1+fQaKk6ZoCNtZtnVTxd1wJgjeDjmTdMDeNxMgmFZZ
X-Gm-Gg: AYBFou1KJ1+NRfl0W4HYMCLGBwFz2sr2NCmM5XLPEXy3sKMGIROwPlJq++OZFdHszjv
	KeR6+4oGdYhNw2w3s26K5CLf5skZXnpB61CLTghoU9FAKDmhnYG4aGN7Zgesv9jcFFS4izQup4S
	DCmYMrDOz/xgcxMDuyeyupohDNN6w+WSVZy1KDJ/jstwK5vpIBEeHIqqpKba+RI2FNH5372Qshd
	3bsHCodDvrIA3c5spq8utmVvXoDVVg7SWWnu4P3YZkZTMUg8NpBUmktTCh2NqasQzI9g3voxFCT
	46P0r6M8H1rtYuOs6G3mm0QMQYNUNsh1HQTa6M+wmh5YJFCbM79/j+p4POhYc4k9sT4JFbd/LL6
	iFcovdclY1MlMsLJMgnRSVA60RvXjrYZxEE6Csg8+FfU35L59JI/VlfpngDiORWzzs/kOFycP03
	lnAamQpmahLVzIC1/29F5RzgXr0e+97NFDc2QM6tLS724=
X-Received: by 2002:a05:690e:b42:b0:66f:c1bc:4022 with SMTP id 956f58d0204a3-66fc1bc4989mr4613793d50.79.1788814849738;
        Mon, 07 Sep 2026 14:00:49 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8894sm8855998d50.1.2026.09.07.14.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:00:49 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v2 0/2] Add support for AS7343 multi-spectral sensor
Date: Mon,  7 Sep 2026 14:00:40 -0700
Message-ID: <20260907210042.32552-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the AMS AS7343 14-channel
multi-spectral sensor.

The sensor has 14 optical channels (11 visible + NIR + clear +
flicker) in total. This initial driver supports reading raw counts
from all 12 spectral channels (11 visible + NIR) via sysfs and basic
power management.

Not yet supported:
- Configurable integration time and gain
- Interrupt support
- Clear (VIS) channel and flicker detection

Patch 1 adds device tree bindings.
Patch 2 adds the driver.

Testing was performed on a Raspberry Pi 4.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf

Changes in v2:
  - Add the LDR, the interrupt pin, and the GPIO pin to the dt bindings.
  - Adjust the default gain to x256 and integration time to 50.1ms as
  recommended by the datasheet.
  - Use read_label instead of .extend
  - Remove all unused scan_index related constants.

Chang Yu (2):
  dt-bindings: iio: light: add as7343
  iio: light: add AS7343 multi-spectral sensor driver

 .../bindings/iio/light/ams,as7343.yaml        |  69 ++++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 372 ++++++++++++++++++
 5 files changed, 460 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.55.0

