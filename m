Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A624399887
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594591; cv=none; b=Rf59HzX3lLQB6FnfD/gq2wDAYPGTCZ3KufjrOuJrhdqkXDndhZyKA+suqnmZqHh7YSOl0Ve0TRor3gg+2qEdcSF5jCS9GFyjjTBqx+yoWbAPEuggigxTNe/nAYiaiaqFvMwlw++FKX6xXYjqdaxlfX0XAqPtZc3RSi2px87rbOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594591; c=relaxed/simple;
	bh=Xoxmgm/2WljGfQ4K+kmEo1qqc24lFdHLaHJ8BZjAi6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5SXVUp7mRQ/ws7mpHjg2KMAaTnM65JDLcMr6X/NfQTnuMW6onC5LluNtOzHoco5t3eioxqhygfcbk/9ugBo8HrHDynsaJclkoAaBuLdcin3xFIkGJ29WkerGNoV7E0wM0s08lcQ50LlhMcG9gbulMrAjQcPhNc6HjBO0uNl6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtQULGei; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtQULGei"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36da8439078so3568676a91.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594590; x=1782199390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUXY+HD9eIceYZLxnN05/cYohFkhygsTl0/Uujw94aM=;
        b=FtQULGeilbRm8Pkq67H7CVMsSHFwp1gW9Cs/Ez7EsvJEyaMN/FDVh2npPv0LSr9bhE
         4aZ7LaoYe2/Yu/ow3ppYvQ324iRMrPyebpiGaAQAU101ruToynyGrK69YyFw7vibmpxx
         ZejUesQBgiSRNejHoC3TRUEJd4juTzXNK2SK+0ABYo+6L16yTXnVetNli0fZ49jj+vdW
         kzuiqvtOmAv1DgietDoyitAfdkFAqRa5b0IlMYVotyrDLPX46h54UtA72qIWteNnYiik
         GxdnKGRyTfeMWgJmmq//VKiDqU4dsyGMecpDM+nAah2MwldiCZFJdpx7W6L0779hP6Rj
         7VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594590; x=1782199390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUXY+HD9eIceYZLxnN05/cYohFkhygsTl0/Uujw94aM=;
        b=l13MwB5sNjNfM5QDryDsL5/5Klb6Q1VK4fnU1S4BZtEUvjHrVWOqBL6RpK0jLO5SLS
         OgKRO5ELPF55hqB1rT0Lp0X3cWzljKFcLskf3EcQ0T4FneJopXy6ozIZ4E6032B99RJ/
         5j2om8+LdUbQGOTAHqD1Lw9XoGYGsZK5bcx4j01RXxulUZw/aULg4u3FPg5QWVqEipWg
         ewI/4zESM8rFgIPPSOvxHL9jT3uNcbBC6bhrfK4mf6WOQ/NwJlMzfnScUqC5pPY5Cgpk
         VA3Mm/m9na+AdyxmmJ/jU0iRjpFelym9cbXRgKqJZjUlrqddRGkg6fHt7ZiveLwVBMf4
         m2rg==
X-Forwarded-Encrypted: i=1; AFNElJ/yNaTaCBRs+6KHv1YnLpye3+zfNrzX+MQeYtECzhCVgi9TTmZRxqhxhADXMpBHLAPjQSMDrCcoZfuF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78CBb5Y09Dwa8y6Rm7o9a1HUttIU0ta6gCvtUsKvoB4qSifst
	EpSqQdZ/PynA6AJ3+YIlqzbutoD+wrCgXmSvZ8h7u/r/aOYVjsFw039Q
X-Gm-Gg: Acq92OG2Hcti9aYv6pFu54KYs4yHIsEw44wA8tYZZp+otPcjCUyO1Z7yjj9uZyU0pCv
	3Zx65Khd6Ivt+NaKFV4xQog3MmCxEapoXxRGdZ+IniEaIerJaEU9nfAwO1UefJtto+fGTQQ6f0Z
	5KndSyLTH4kzVxmAM+JX9YGOPfV0kJpAL46LtGsWxff40YRl2j1bVdNe6fasn2KlAcqVog6iKvy
	/cHH+u4kp/x/9RQd8CozS5uf+Fh34G8FmlvQY3grFqbbsCLQrFrcPPqtp140+iM3Gga7M2hjiEz
	0/pj6lxSFx3FU/wAp1sO7xKAG8J3lcMOUjv4KZ3+NnOat0VIvsApqTpIvxf1h8D7J0zsoPXc+y7
	I1w0gSpJz2YUaTGbmswfbCKD5bXcj8BhaMLcDf/KZ7wBGzfG92M8mB24nz/fOlFmI1jPmx7ZaZW
	htfs+UYiC5gsON795YpZhN5ROYO8w/rJrkvzHero6uarShn2ng32tU19RaCeaqIENr1tps8kau/
	05K9VoZHeD8fo3x25iFog1dK0mgd6uiN5SNQBEJblA4hKyFdg==
X-Received: by 2002:a17:90b:3e86:b0:36a:a16b:5f65 with SMTP id 98e67ed59e1d1-37c5286ca76mr2681029a91.11.1781594589882;
        Tue, 16 Jun 2026 00:23:09 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f1014sm123513435ad.16.2026.06.16.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:23:09 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v5 0/6] iio: add Open Sensor Fusion IIO driver
Date: Tue, 16 Jun 2026 16:22:36 +0900
Message-ID: <20260616072242.3942-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open Sensor Fusion is a sensor aggregation hub interface.  The Linux IIO
driver receives OSF protocol frames from a serdev-attached device,
discovers supported sensor streams from capability reports, and exposes
the supported raw sensor data through IIO devices.

The initial driver supports protocol major version 0 and the receive path
for accelerometer, gyroscope, magnetometer, and temperature samples.  The
current wire magic is OSF0, but OSF0 is a wire-format detail and not the
Linux driver identity.  Protocol compatibility is carried by the
protocol_major and protocol_minor fields in the fixed OSF frame header.

This is still RFC because the driver-facing OSF protocol subset, the
compatible binding, and future protocol compatibility rules are being
reviewed.

Runtime testing was done with an OSF GREEN prototype connected to a
Raspberry Pi over UART.  The driver registered osf-accel, osf-gyro,
osf-magn, and osf-temp IIO devices.  Direct raw reads and software kfifo
buffer reads were tested.

Changes since v4:
- Regenerated the series as a full standalone replacement series from a
  clean upstream base.
- Removed previous-version add/delete churn from the generated series.
- Clarified OSF0, protocol_major, and protocol_minor compatibility
  handling.
- Added required vcc-supply support to the binding.
- Added probe-time regulator enablement with devm_regulator_get_enable().
- Added the opensensorfusion vendor prefix.
- Fixed checkpatch cleanup issues in commit messages and driver style.

Jinseob Kim (6):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add stream parser
  iio: osf: add UART transport
  iio: osf: register IIO devices from capabilities

 .../bindings/iio/opensensorfusion,osf.yaml    |  59 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/iio/index.rst                   |   1 +
 Documentation/iio/open-sensor-fusion.rst      |  71 ++++
 MAINTAINERS                                   |  13 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  14 +
 drivers/iio/opensensorfusion/Makefile         |   6 +
 drivers/iio/opensensorfusion/osf_core.c       | 306 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  70 ++++
 drivers/iio/opensensorfusion/osf_iio.c        | 275 ++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 ++
 drivers/iio/opensensorfusion/osf_protocol.c   | 249 ++++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   |  97 ++++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 117 +++++++
 drivers/iio/opensensorfusion/osf_stream.c     | 187 +++++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  31 ++
 18 files changed, 1522 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 create mode 100644 Documentation/iio/open-sensor-fusion.rst
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

-- 
2.43.0

