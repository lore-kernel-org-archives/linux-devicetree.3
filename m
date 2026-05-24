Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A831E827
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 20:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655878; cv=none; b=W/TjDsb6i4V6ZFQCNcaiAWHGRyIDi37kSj7PfYwqUcW+i9DasvL8vExKG6kTxSNz6eG7FLa4qX9jeMfexnKxx9dB/adoscbeGlAwAz1V/yqHrQtUXZN+t9DYD5nxIGBmh7qRv/tBzc6p7BwdJfvTkL9FjyEyAp7lPngc667UtY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655878; c=relaxed/simple;
	bh=dNi42FK/NcyBNyc7vhbWfVt8kE8yHM+UM1QYHU+lAl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DVGWLImTC5eOH7m4/vaArRYIS6k2lfrSFEs6XcNAX6FgRRCa3XY1a8Bm/nA/A+IwiyvMUbzV8fFWdUmkbkpUlQTVk6O8aLcFBMcDO+NZZYOHECONwVtHgWdv1IPf//PLYnZ0JRdX3afq1ia9yc3p3AelRtykxtrVBfCiB9RwzfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9Fmnecj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9Fmnecj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so6855214f8f.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779655875; x=1780260675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1karFQ40n6F55itqMEfrSq330zSkOURgW7UaPlHcGsI=;
        b=Q9Fmnecj7ByL1HBIA83n5UN8/S+q/8rb1VtQRYBzBmq0Ux5iSKTciUXN2FTotXlTug
         I73bQyFmH4Ku9qwFKCUBuzavB3MZt+DTo/2zpGU3IkjMgKEUSzirZv8NAJava/GCvqIC
         aks2D7a1F4ay+rZuOrykm01mYxpM4P3oZtlbB+u8LCZSzDfcl9YmDbVtxWdTXoGANVc1
         MqWvBxvmhq/pMxgagKYgJSdBtP0t86b4XPvajg7Pft3i3zxb6F40TEdaZBQB+H+KuDAu
         AyZamWVu24sgLLYtu6XBtHfIed9OQ61p6V0vvZLgjCP6LgB75X/ztpW7eseU590U+nfq
         m4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655875; x=1780260675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1karFQ40n6F55itqMEfrSq330zSkOURgW7UaPlHcGsI=;
        b=UgGwgheDvq8Fg0L9mY2cScUQHVKr8qPimbJrKqApmomT4nzoTqgQbou6rGxjaDvROb
         z77ukmJcx9WaGtJo/aBzy+8cripNgOYDwPlO7D4KWBs5Zt5GEp8xJCVgZMXOksHfq5nl
         zBq3wZTZy4dKg2buEX/7w4sw+Fg8cv/LFDg4cDWCK+zgy6vFVDW3hO804vcxy1dwrU5v
         v3OwMumphJafVF3HYwHEhX2ZzEJiaXbX8mC8kXGsleGURgrJShq/0s8lqOYsC4P/ZFGj
         yxXFdrkoVbUa/3aFfSS5d7D0bV4ySyBI3sAsO6Op8DcfWP3jUgktWosU5nr9Od01vmtH
         B+zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gdr48qFSU781KkvABbxd+2/p7ajeCrdLwFrBZz4qy+tUWVaEZUBuI5lYaCa16cAQPI3n32JitelMh@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHQa/ZsWYmaHqN/G3IDKCYcwYjzE6iS+Y1nxwcvqd1P7RDzMa
	NYk22TMpIcplfzp8pK4jr3TPsqy6kZh/Wot/WzZH0q0tIc9oQ3W0RRdM
X-Gm-Gg: Acq92OG0RYkz8BZMjwgaA2eVE7tupuExZa+iqbAGxZXgYwAfjho2jrMn2a2NQAHv4c5
	sILpbZuzPGU7koZCxm/7vW3ZVZr7WeWaxONWx6iJeVZAVge+06yF0iTWERpxlsrM2hqdKFvoGDB
	y+j/jXSrEdFGKvldL44t2k1BZQY8hdI/4lnvEcrnXVSGBy/zVgQ44oJvvNL/C8MvNs0/1n+g2tq
	XNPD5zSgg29afoQWznXpr87Yd2AzTiUTXZduAUfoGtyE3Psr8V6Q2By3bcWEhRzWRboJOJtIrGq
	ck4R6CLaywH0rUH6MxBnaud12DaCzXNqyFmMQP0rc8P6EtbuoSpnQfd/R7HafDftDf2ZtB36I/R
	61SuoeqwSujLke+sDbQaL1gtVLZ+5z48L5fcX0vsqbTlDdEmQzDf4mEEyHgXj+qBhfKf2m6fksQ
	y0Q3rr
X-Received: by 2002:a05:6000:29d7:b0:43f:e721:76b8 with SMTP id ffacd0b85a97d-45eb38be82amr14334500f8f.37.1779655874668;
        Sun, 24 May 2026 13:51:14 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d6ebf0sm22738588f8f.34.2026.05.24.13.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:51:14 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/4] iio: add Sensirion SLF3x liquid flow sensor support
Date: Sun, 24 May 2026 22:49:35 +0200
Message-ID: <20260524205112.26638-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wadim Mueller <wadim.mueller@cmblu.de>

Hi all,

this RFC adds support for the Sensirion SLF3x family of liquid-flow
sensors (SLF3S-0600F and SLF3S-4000B).  Before I send it as a normal
patch I'd like to ask three things:

1. Subsystem.  Liquid-flow sensors don't seem to have a home in
   mainline yet.  iio/ feels like the natural place for me, but
   please correct me if hwmon (or somewhere else) is prefered.

2. Channel type.  IIO has no flow channel type so far.  The series
   adds IIO_VOLUMEFLOW with _scale in litres per second per LSB,
   so drivers reporting smaller units only need a fractional scale.
   IIO_MASSFLOW (for gas-flow sensors) was left out on purpose --
   happy to add it in the same series if that's more usefull.

3. Subdirectory.  I put the driver in a new drivers/iio/flow/
   since there is no flow subsytem in iio yet.  If colocating with
   drivers/iio/pressure/ (next to sdp500) is preferred I'll respin.

Patches:

  1/4  iio: types: add IIO_VOLUMEFLOW channel type
  2/4  dt-bindings: iio: flow: add sensirion,slf3s binding
  3/4  iio: flow: add Sensirion SLF3x driver
  4/4  MAINTAINERS: add entry

Tested with a SLF3S-0600F on a TI AM64x platform.

Thanks,
Wadim

Wadim Mueller (4):
  iio: types: add IIO_VOLUMEFLOW channel type
  dt-bindings: iio: flow: add Sensirion SLF3x liquid flow sensor
  iio: flow: add Sensirion SLF3x liquid flow sensor driver
  MAINTAINERS: add entry for Sensirion SLF3x flow sensor driver

 Documentation/ABI/testing/sysfs-bus-iio       |  17 ++
 .../bindings/iio/flow/sensirion,slf3s.yaml    |  49 ++++
 MAINTAINERS                                   |   7 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/flow/Kconfig                      |  22 ++
 drivers/iio/flow/Makefile                     |   7 +
 drivers/iio/flow/slf3x.c                      | 264 ++++++++++++++++++
 drivers/iio/industrialio-core.c               |   1 +
 include/uapi/linux/iio/types.h                |   1 +
 tools/iio/iio_event_monitor.c                 |   2 +
 11 files changed, 372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
 create mode 100644 drivers/iio/flow/Kconfig
 create mode 100644 drivers/iio/flow/Makefile
 create mode 100644 drivers/iio/flow/slf3x.c


base-commit: 3cd8b194bf3428dfa53120fee47e827a7c495815
-- 
2.52.0

