Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446730EF9A
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778336558; cv=none; b=H7+TaLWkVwbQ2F7fL6qEXqdJT5KrLs/Izotp0mLV5Fo7zvcy1hVdax2cFeBE0P29zE31p4LfIuw7HkHnY9zvxAU1AxxRRya2xbNyX+G4xeqsiVIPCqyMoF23Eo+SJkbv+KxTdYk/8/GknFWZz+t2SliwPUSVu8KskweazCHXMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778336558; c=relaxed/simple;
	bh=PDCyqrDp2cpLbVPkx9BU3X2g2fgR0bLaGYNic8cU7jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MTFpQa1fe6anhh1h3ckuoaCI1iuCONTbxHRB2HUfMQ7A1Um4a7lK++3Pg6YQSQAmb5d0+MUH7jzwVZwCmakGnTAQWM1iXwL7kJ0S0x7D5jQcPcDDL4SlzoCmUv0NO32mAdK7Djbo8GxtTUKoZTdfhpVLyAPVFnTeMW07XZ4632w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spAxBN7m; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spAxBN7m"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45562c41ec7so484912f8f.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778336555; x=1778941355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jmvg0x6dnke6aX/zgSP8+qEtU0AMd7QFkbsuhFZV/2w=;
        b=spAxBN7mv0K3wkMBiAMhHIWrux5lHfD+4i037NDzDIR13zqnafvlh+YR3y+TJctIOF
         UtJht7surudSP5b+3/cwVEblZnft/l+DcULrXUg8O1ZCKeJ9R2YZ+QowBrr1Nb/AqOX8
         bLMnd71mFYCxEYuMa73m/iYvuYU7QG9HQBg3xIgdYi3vt0E8RKwnAwCWdr80ZuQMntRy
         87aFn0bTania+yxkrixgifACVIc+mnmJ4jKaQPWP11CVx8Eur4C6xTmqVUxOsaJMwayl
         2iktRsy3wfXAVPply5mEuIsqWUObQKKgSsZ+FwcZFqkWBKu/e/lmJqjefhbRG3rckjal
         uxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778336555; x=1778941355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jmvg0x6dnke6aX/zgSP8+qEtU0AMd7QFkbsuhFZV/2w=;
        b=oolbfzT+6Cje7dvzG3mEgPvxQECvD3nic+64M81gghdZBQ8S3zR1oqTzK8mnj6uWsy
         /9JiwLurpW2dWSdgIOkm6AF+epPl4DQgNZJGIP5Jad4DCeja3i+SbRF8KXiYnoob0sEK
         HyQflpGz88KEE/Et/5LDniGFAsceT03TUtw+K4Vrgxhjs0RJOJqcv9TAeYa8PK7TJ7jK
         SHbO1KuUeqaGh0WlzBYlyEtRlqir3jhLWf3gpuHP1OGClRhOUbOI6srehgypUbKUvULM
         qDMpbmauYl1e7/dGIwQZPPi876fNimW530IwwrbRYzAcNQX0RvEbB/t4oOWE3Qafiigg
         Jc0w==
X-Forwarded-Encrypted: i=1; AFNElJ/IlGLNRKmzjhhJa2Pt2Kx4wnrPD21lBKPD2voi+dwLIjpf36eAICr3j+48mIKxgWRYXhGi1FJLMuQq@vger.kernel.org
X-Gm-Message-State: AOJu0YypiLcICADhtiOengFP1oOh361jdVmZ0ZcsCqk7BXNzyqNngkV2
	pR8MnhNxYW+zQykM+eynQJxii64lnriDEDfOnx0PuRT3kbp+iwIWKN5v
X-Gm-Gg: Acq92OHW/5UuMwxahcG+E/5FBf7MSbv4cWj5R7E6zhZmGoRusmj3LpbRKVp7v3De2B3
	ZD0ZDIffQ75k4Vtp28j6ZHXx2EH/gQSgv81H73xuU081BiUroemsjdHklkMMvEA/QMsoJluym1W
	+eiWWnbMn7wA1uuT3iG1r7/fm4c7diNtnqMl8UTqY4S18rYNcYgdQO2ytDqmQdOpV6aDUNquswc
	BdR1It6646wu53vE4zUIofGKfQekyHu490XB/6AZglyrEM/6JIXtO7cMTCqZ9ZntFoIbmezdsZM
	myTfmKZbGRt8oxnWIDO1flj4FoxoIJq5SWLpsVm+orFXZ7F8yBUwxhNuM9o+iGAiu7/UasDVOLu
	NzyEVeR91ZcRN6mGyKddOPGrsjX+JbqbXwqA+laYtgcBd1a4aUGjUfHx00+aWYgFHT/mWMhGuRr
	vEfVOLwmEm6WJVIh2em6ob5V1Xbr6LAtICGDNfGaj03P1hwqLO2lsk9jvwaQ==
X-Received: by 2002:a05:6000:2403:b0:441:2381:b630 with SMTP id ffacd0b85a97d-4515c575330mr26533311f8f.24.1778336554291;
        Sat, 09 May 2026 07:22:34 -0700 (PDT)
Received: from DB-07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm15127763f8f.37.2026.05.09.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:22:33 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v3 0/5] iio: dac: ad5504: bindings, cleanups, and scale fixes
Date: Sat,  9 May 2026 15:20:38 +0100
Message-ID: <20260509142047.30302-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

First, I want to sincerely apologize for the long delay between v2 and v3.
I had to step away to focus on finishing my last year studies, but I am
back now to get this series over the finish line!

This v3 series addresses the feedbacks from the v2 review,
specifically focusing on strict DT validation, dropping unnecessary
driver code, and making sure the driver works perfectly at every
individual commit.

Testing & Hardware Proof:
The series has been physically verified on an ARM64 Raspberry Pi 5 using
a custom Device Tree overlay.

The AD5504 is a 12-bit DAC. The hardware scale outputs
now perfectly match the DT inputs:

Testing the 60V path (output-range-microvolt = <0 60000000>):
$ cat /sys/bus/iio/devices/iio:device0/out_voltage_scale
14.648437500  (60000mV / 4096)

Testing the 30V path (output-range-microvolt = <0 30000000>):
$ cat /sys/bus/iio/devices/iio:device0/out_voltage_scale
7.324218750   (30000mV / 4096)

Additionally, providing invalid DT configurations (e.g., 70V) successfully
triggers the strict bounds checking and cleanly aborts the probe with
-EINVAL.

Changes in v3:

* Dropped the patch adding GPIO control for /CLR and /LDAC. As pointed out
  by Nuno Sá, since the driver does not actively handle or toggle these
  pins, requesting them in the driver is dead code. They remain documented
  in the bindings.
* Combined the pdata removal, regulator _enable swap, and DT parsing into
  a single atomic commit (Patch 5) so the driver compiles and runs cleanly
  at every step of the git history.
* Restored the -ENODEV check for the regulator to maintain ACPI
  compatibility.
* Implemented strict min/max array bounds validation for the
  'output-range-microvolt' property.
* Included missing <linux/array_size.h>, <asm/byteorder.h>, and
  <linux/kstrtox.h> headers for full IWYU compliance.
* Reordered commits to group cleanups before functional changes.
* Dropped Suggested-by tags for standard review feedback.

Changes in v2:

* Replaced vendor-specific adi,output-range-volts with the standard
  output-range-microvolt property array.
* Replaced adi,output-range-gpios with standard range-sel-gpios.
* Split header updates into two patches: alphabetical sorting and IWYU
  compliance.
* Used MILLI and MICRO macros to replace hardcoded values.
* Introduced a local dev pointer to respect the 80-character limit and
  realigned function arguments.

Previous versions:
v2: https://lore.kernel.org/linux-iio/20260310174835.24209-1-0rayn.dev@gmail.com/
v1: https://lore.kernel.org/linux-iio/20260212181955.42724-1-0rayn.dev@gmail.com/
RFC: https://lore.kernel.org/linux-iio/20260210121032.4630-1-0rayn.dev@gmail.com/

Thank you to Jonathan Cameron, Krzysztof Kozlowski, Andy Shevchenko,
Nuno Sá, and David Lechner for the extensive reviews, schema guidance,
and C optimizations throughout this series.

Taha Ed-Dafili

Taha Ed-Dafili (5):
  dt-bindings: iio: dac: ad5504: add output-range and missing gpios
  iio: dac: ad5504: sort headers alphabetically
  iio: dac: ad5504: Align headers with IWYU principle
  iio: dac: ad5504: introduce local dev pointer
  iio: dac: ad5504: fix scale via output-range-microvolt

 .../bindings/iio/dac/adi,ad5504.yaml          | 39 +++++++++++-
 drivers/iio/dac/ad5504.c                      | 63 +++++++++++--------
 2 files changed, 74 insertions(+), 28 deletions(-)

-- 
2.47.3

