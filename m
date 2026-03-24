Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2B3C4564
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334405; cv=none; b=cgcHklWTk7k5j1F/ZJxP3fGFdaFQ9+DQejo0gOSxVgisEcKZ2zIahpZ0WcQYWbRM/05S28MxD+lRQjtkuG2HSS2NTgRIeYyvA+4z0L58BCsqxGQNUF+vQAOy8D7iKgc0BkPbiuEYUt7LDprn12+AqyUi5fFCUqiEKUsw5PX9IdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334405; c=relaxed/simple;
	bh=kWMVHrbTgq59qsBF4CpPuynsRpdHuf4qfybAUgKcv1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c988iEexa5UHuVioE4+W6V8QqnYb6BaImLTb+INW4Y/gS11v289fdTGSzwwRGBL1DsntNlNQFGwYdpQ2Eiu5onZs3H3Ex0QqO9sh8ygDBrn9ODM5spnNueCB6KHLEbrFbMP7eMtGobEsV0s8pdN95svQ9oNlgrkJm2/UHS1fUuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bayty719; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bayty719"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad21f437eeso43838295ad.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774334402; x=1774939202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1IUdQ9vciBV4vtJJEjMhyajLdYSBJmzXHlAoFV09cM=;
        b=Bayty719eLyEssE+D+sV7sxnwd3YzJX/N2JvH6d1IMTp5T2Hc6FTt4RU3pi/uklzv7
         1GRDTN5+KbE8hkEp5TbTp5rrxZ18TQXE07sTjhBK6E1+Hsnl9QCEh+E6jIIvB6bWoGZI
         f/u8lMsQU1Lg/5VFN2gEvR+UZDC1+WWGybCO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334402; x=1774939202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1IUdQ9vciBV4vtJJEjMhyajLdYSBJmzXHlAoFV09cM=;
        b=abXqKAQ9h31Cds33X/x0f7wx+n7pICIGxA1/ehcjdUuWI/eGzffct9vsQhUuldgzOq
         Lh1O9bjJ2dRRQR5maVCpgIulUIJk76sbHOkufq62tYBV5iQ7+GZe36pLbB6fB1KRqIW4
         plji7i0f4fVNaq2FK6VRNIpIGuBWEMDJXrXSYTjFtOfop7VgGQD+TnLlpeJvAJV+d5aV
         MDuSDEz8vdwPPbzTvGqu/JKaZ8h8JMQTqkDnvx60d/tQ8Y2UF+ptKLttMlPOs1L9KDl3
         EQVZIgVeES2RHIla9TGoYAEma4W1Lympw6Ib7S1S2IB556aGty7m9lbS+eUxuSxHqkgU
         KUag==
X-Forwarded-Encrypted: i=1; AJvYcCXTIUjh2pf20r5H1F7qpKGmoq6fGmWPtm1ndtvDYaC0Qm8eUTIPCKUn5dauncDgFjk0PoS8FIHrrmZR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5AtBsNwEQ+Vcz3YOJJbfdvvXLqAiglTvPmerIWClRQNsmKVdL
	lrOEEh37Mo3loVnawQoAbvgWbDBfvKF/Zt1UAoHtqzTe2mdkJIHHrKwgxZBxfes1Fw==
X-Gm-Gg: ATEYQzxyqlmSzVLxupZ4BZ9t4XDrfF1kji4RsxlfKNcOY5Hs+5yPLzSel1b57HdRRSF
	faOeJ9sWVYeN/W+75Gpy/Tie+wzIXMLZvbFfhfg94HtVvY8dwbtJg9dCVwv+nKuuYdjxJJlt0mA
	2tlR05TRVJ/CHtaTMi5IvqaSLZ9aFzS4WnjFEJcqOlbnc6WhVTcrNoobRDqGdvK6k25OeAO8plB
	ogHSSU6g10xx+YJQFi+ioH7K/f1aPJv4NOubtfL4coUN5OslxJPo+VsE0GNNfhDMffFQaMcOEvR
	nJgFwDCrrFwtQdaQHXnki9O82lV2HbnqZvRtM6GWsk8mq/kWuTWRqDwIzPOrsf1mXIFTWuqHb+5
	xcgucPk61RO5ED+0llgFxum4XgB8fewAXNRf0G2B48u5Br+ZvLL2yy6YRUz7g6qfcrfQeWX/pAI
	0DsGk3b3TLTkdGyGPsMhtHwUVXe3QXc7Z/UXcR+59L5hqzMejhSIYDRaXPXBxAFfjAdmr3fAA8i
	rBob3UQKfVi91O+JVA20KbFfuvc3GnH3A==
X-Received: by 2002:a17:902:e550:b0:2ae:a7e2:e80b with SMTP id d9443c01a7336-2b0a4e0e487mr23771835ad.19.1774334402101;
        Mon, 23 Mar 2026 23:40:02 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835429afsm128416545ad.26.2026.03.23.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:40:01 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v2 00/11] Add spi-hid transport driver
Date: Tue, 24 Mar 2026 06:39:33 +0000
Message-Id: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUxwmkC/13MQQ6CMBCF4auQWVvTDimKK+9hWCCdwiygZApEQ
 3p3K+5c/i953w6RhCnCrdhBaOPIYcqBpwK6oZ16UuxyA2qsNBpUkSan1jkuQu2oLtZX3tXkaiT
 In1nI8+vwHk3ugeMS5H3wm/muP6nU5Z+0GaWVscY+WzRXX7p7N0gYeR3PQXpoUkofx4Lc6a0AA
 AA=
X-Change-ID: 20260212-send-upstream-75f6fd9ed92e
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774334401; l=3002;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=kWMVHrbTgq59qsBF4CpPuynsRpdHuf4qfybAUgKcv1Y=;
 b=dfMXFcVFCiOJHI71GrEDcRWBXlTgiM2SynaQouSI8EGuy2k+Pi8LYvBDwf6lHmC0T/Yh23G15
 5xiYrgKpCW+Bcn6RVOA6XgqL9LfcYcABPhbNEW7nCKYlr2kGEzFiAjH
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

This series picks up the spi-hid driver work originally started by
Microsoft. The patch breakdown has been modified and the implementation
has been refactored to address upstream feedback and testing issues. We
are submitting this as a new series while keeping the original sign-off
chain to reflect the history.

Same as the original series, there is a change to HID documentation, some
HID core changes to support a SPI device, the SPI HID transport driver,
and HID over SPI Device Tree binding. We have added the HID over SPI ACPI
support, power management, panel follower, and quirks for Ilitek touch
controllers.

Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
		  Dmitry Antipov <dmanti@microsoft.com>
Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gmail.com

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
Changes in v2:
- Fix style problems and remove unnecessary fields from the DT binding file
- Drop patch 12 as it is vendor specific
- Add a lock to fix input/output concurrency race
- Link to v1: https://lore.kernel.org/r/20260303-send-upstream-v1-0-1515ba218f3d@chromium.org

---
Angela Czubak (2):
      HID: spi-hid: add transport driver skeleton for HID over SPI bus
      HID: spi_hid: add ACPI support for SPI over HID

Jarrett Schultz (3):
      Documentation: Correction in HID output_report callback description.
      HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
      HID: spi_hid: add device tree support for SPI over HID

Jingyuan Liang (6):
      HID: spi-hid: add spi-hid driver HID layer
      HID: spi-hid: add HID SPI protocol implementation
      HID: spi_hid: add spi_hid traces
      dt-bindings: input: Document hid-over-spi DT schema
      HID: spi-hid: add power management implementation
      HID: spi-hid: add panel follower support

 .../devicetree/bindings/input/hid-over-spi.yaml    |  126 ++
 Documentation/hid/hid-transport.rst                |    4 +-
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/hid-core.c                             |    3 +
 drivers/hid/spi-hid/Kconfig                        |   45 +
 drivers/hid/spi-hid/Makefile                       |   11 +
 drivers/hid/spi-hid/spi-hid-acpi.c                 |  254 ++++
 drivers/hid/spi-hid/spi-hid-core.c                 | 1417 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |   93 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  244 ++++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 include/trace/events/spi_hid.h                     |  156 +++
 14 files changed, 2403 insertions(+), 2 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

