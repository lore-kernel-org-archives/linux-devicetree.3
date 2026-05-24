Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30A2368D7F
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779612819; cv=none; b=HkgtEwfOBWX0tF+ZAB6b2npYJwjt4dBB7aa3CcMiCUnBckOV2ovV+rDAGhNcw8+XdH2Sm2/pEeQWxaK3/ZoyFiLi7nrGiEssr6TSB+1dE7HIJa9tDoKk4z2l/xs7sEpScGEjACMYOfrDE3psSn+M6zSB81Ci6dfQH7Y6doMtrOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779612819; c=relaxed/simple;
	bh=c6CmS2PsElbd14byoasEvR7Kwc0TKu6y36ZmXrs+kBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TABZgyQHpy5COtNzahf50fTKXMU1phHlqIhp+m0LsHrQ/Eie+Gpn3fSOV8NtfTPLX6myBdIPR2WHJTMjAwHydwgHuX/U8JRXDwuzqHGT2wvZr+P93M0mBVQK8H2NYv0iFSHSWXzt6BlgSMUTz169OMW0B5cAoAZlp+TUP7fEIzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqcZ4VzN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqcZ4VzN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-837b39eb078so5972167b3a.2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779612817; x=1780217617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLgoBL/zLcvxr6bj3saZaEcREqHREuQoofVTcPdITuo=;
        b=pqcZ4VzNEgajWghYCVMf2nQ7fzuQIPZW7zkgIimyU5gfpsKWm3okoeLzCgmu1iBDr0
         HKKGcMOucpzgxLUnNz2sV/p6FLI0XCBmN7sImcjLKIqIfEPBfSs//bI6BHgKjLVaCqBb
         YJfb00+94BIozZOu5COL0bMLJgwOoVhlBMzyJgdzVW1hCJkbxrtA4aOxRaL9BWmLVvB3
         g0pOkpkKJ0avRB+4eKWrwgKIkOHY437YZiGPi4Bky4xzkWGtCfcVoLBPD4z8f/9YDY5I
         Bo2UqOh5mB4w/aWyp3VeAU6gOSsGt42IduQ0WaD4EiP3CUb9f1CPnel3AOYQDx3LveOl
         ja0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779612817; x=1780217617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLgoBL/zLcvxr6bj3saZaEcREqHREuQoofVTcPdITuo=;
        b=W4dzLYzzovV2hKTp4QmzokK2FhzStAIS8ZjVbVrqp80WL7XOJ3lRHi1tt5uSUTLpFS
         lYI4p5te3n9cNwlLJKE9AgRtDoU0c3UjOG6Zms3lLD9yvq3Yx1YRN9tjFZYUtvA3zk6P
         tJm3nBs6dOlZx1jlC1uJ+qpJZIeyAgVQ7nC8yuni5iTkTFq/7vugIPl+zTMWTyLDMU//
         6pgjm0yTfGQU4InZqL43sutBVtX8j0AEqOxdmokRBEdxl/HXDUCTB0HbjzDdzMaplQ0t
         6Q8wJj1Q4+kyJ5Inm/FwFOmx+IBXFgobMAzK5UJHRrEJr/5LBDpokMhRwHOBV9V9VlUt
         777w==
X-Forwarded-Encrypted: i=1; AFNElJ+5JGgvnyoKdHoDn18HWEODhZ+dTLilgaufENZsq7zKnOCWg//DFzXX0F0BHHst9FM9KzgeLw++VeUR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aoL0VDN9Kh/ZrnfipHSftpxJp+n4liaXhQMAk1hsXPCkEzww
	OEA8s2yMDlDUqpsQTtyOuquxUrS18UC5rBV+sX8IAt61wbiva9bfZfaH
X-Gm-Gg: Acq92OFgCJw3F7Bj2x/55i3TxbSwhuAuJ1xcX+gDq4CzpdEW+qfkBzNT+tujSqpE85A
	AbQsjQjduErRhEBjveMQ2lTu3YGNV45oAyyeEujPOQ8Uih/Lr9yAa1SsWnplclbmUT8lD45Gq/a
	4VWmqtYdprTyZoE8qn8vn2J4WT5uf7RMmDM+vteo4VX+hbWzSlyC5VaHo0Ex0WkqmHQfSwFEOdf
	rJh7ysLSxKvN9fzKECPJ5xYE+7ObF1gDWE+7xUTdzHXZenyO8bQLraLAOM+Maom9R2lMZ4WYdDi
	u4OVeeHEJp7Qxj8I7vXPk64tpilvsH/ZfS9MZhLu3RVt8rAn2ghCumIYNQOdt75PrJPAvgrsvw4
	AJKQb/6wAwEo4b1+/Q5wnLhloCpvmrXEo+H2DeeS1QX2AsNTdjS4YvwDAGgnFXFOe5V8lOklB/Z
	VIwno0iuBbWPBG1Q5AdiPEqYTHvTht9B0UC3qszA+coo4ebvLanXHCy5cfdMjN2/35CW6eCOsHW
	Y/ZS52KXrErGgl6CXNit9MgTdSntynBFaqT9A==
X-Received: by 2002:a05:6a00:3003:b0:82c:d986:e917 with SMTP id d2e1a72fcca58-8415f56374bmr9672521b3a.22.1779612817004;
        Sun, 24 May 2026 01:53:37 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea4de4sm6353116b3a.35.2026.05.24.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 01:53:36 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v2 0/7] iio: add Open Sensor Fusion UART driver
Date: Sun, 24 May 2026 17:53:05 +0900
Message-ID: <20260524085312.15369-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds an IIO driver for a UART-attached sensor aggregation
device. The device sends OSF0 binary frames over serdev UART. The driver
uses capability reports to register IIO devices for supported sensors.

v2 preparation changes:

- split the previous RFC driver patch into smaller patches
- add a Device Tree binding
- add an OSF0 protocol reference
- use get_unaligned_le16/32/64() for wire fields
- use IIO timestamp handling for buffered samples
- push decoded samples directly to registered IIO devices

Tested path:

- STM32F405 OSF0 UART stream
- Raspberry Pi 4 serdev
- kernel 6.12.75+rpt-rpi-v8
- IIO devices: osf-accel, osf-gyro, osf-magn, osf-temp
- raw reads from accel, gyro, magn, and temp
- buffer reads from accel, gyro, magn, and temp

No OSF oops, panic, or call trace was observed in the Raspberry Pi
runtime smoke.

Jinseob Kim (7):
  dt-bindings: iio: add Open Sensor Fusion UART device
  Documentation: iio: add Open Sensor Fusion protocol v0 reference
  iio: osf: add protocol v0 decoding
  iio: osf: add stream parser
  iio: osf: add UART serdev transport
  iio: osf: register IIO devices from capabilities
  MAINTAINERS: add Open Sensor Fusion IIO driver

 .../iio/imu/opensensorfusion,osf-uart.yaml    |  33 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../iio/open-sensor-fusion-protocol-v0.rst    | 267 +++++++++++++++
 MAINTAINERS                                   |   9 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  15 +
 drivers/iio/opensensorfusion/Makefile         |   6 +
 drivers/iio/opensensorfusion/osf_core.c       | 311 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  67 ++++
 drivers/iio/opensensorfusion/osf_iio.c        | 288 ++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 ++
 drivers/iio/opensensorfusion/osf_protocol.c   | 220 +++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   | 100 ++++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 111 +++++++
 drivers/iio/opensensorfusion/osf_stream.c     | 207 ++++++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  31 ++
 17 files changed, 1691 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml
 create mode 100644 Documentation/iio/open-sensor-fusion-protocol-v0.rst
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

