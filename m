Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225E32B110
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980087; cv=none; b=gttMnAvxcXe/Jni+DothXdU+CLgWPz7mzBetEG1HIZFOhjhui41wSXJDhWM1pjuz69Tl9T+yBaf5i7amrirIOFcGhpqDbj5MB5h+dyuJICsWTJ7zAq1GhmO1sRKS3H63hoU9Eh5RqoKbxqyZGBAluRRap6Uyy9ozx3XCP9R0WJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980087; c=relaxed/simple;
	bh=niVPKu3KCGXpaVcO6/gS8ySgoA3IT21ZaQzq7eQRAoI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N7xquSF2B38PAoduxUJQd5/kTYqGAqrHDWOl/nIFZA9MT4MnMgGnfcry4VHrMA3w/XJZf5cRk2WpIVRtYh3ipOgiXAhs/SGTvDGWjdp39v5k5yD92I/2okQOaZawxb5hcCcz+A9pw7+ErByc1OC2D6M1qGPP6a07s5oEJ4Dv9hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bey43OSD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bey43OSD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf18c30bb2so35515145ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780980085; x=1781584885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M58CbF2eNhyrWg008D0ABCR+x+AP5d/FSVenLDFjbso=;
        b=bey43OSDnW2g8//wfLnVS3L2InOBrSR+7XhB23f9w5SPJSS3FcNjfPEvIPaIDLkOkZ
         PWujDlQ1QxvqiqQsSG9naXhLuD7bXHH6XXzbq7EJQsT1ehQ68NjC7bVt1ZHuGdRXJL5h
         zacagIEJnUBeVDzYY//jx8/Sf91rQUFo8QB/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780980085; x=1781584885;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M58CbF2eNhyrWg008D0ABCR+x+AP5d/FSVenLDFjbso=;
        b=m2R4NkxlWPkrMkUmw8Vo9FIvczGePr3p6GvbYKznqTO3r9ZU41anZsEwuynNMxR5oa
         3ZuITS0E+eWvMCI3GqRUNJPtYqiYEA4ULnkVo/tlgE5Y+jbKd5HHhPZdZdzcIFJJU3cH
         cucbZT2MQgQt5pdixrAkJ6+VwYhRlBk6OffJ/VM4QpPosEpFrFinFevr9z+CvZBSqsIv
         LUQa5+C6OhBOZb7p1j9LQ5gFDZUCYXhR6DCidq6AaHNov4+6UhQ5+JIhxJaC0QqwVv3J
         kNKTcysUwyh784mdkgOBp0taTq1TlE8yk98aNvDDj4PJ2G84oY01GRwzNMaDj9pOcO8q
         +BvA==
X-Forwarded-Encrypted: i=1; AFNElJ/kf0QT7MNdmGsTRD5zigag5BD4+vCjx8ET7y11JFQ0k4b7I4gCi8aMq5rJSz3jRqltJgOmgRPgC91Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhK7dsKdm+2ISxjeoKQ33FdYgN90Vr9tExdsJrwDV23D0Tunz
	7Bx73FK1Htc4h0Twa9VXfZz/96Va5C8UDOw0jxj5vq7tVTYwUaU3Ckhui5U+KNkCRw==
X-Gm-Gg: Acq92OFQyBSs90KxiLWCwQRTF0QWEPCcPMHtd1YDSOVn7XXz4lOYadW5glsYfnw5ccK
	mN8QgK7fjMFY25B6gbb4otU+qeflbIaP6BF8XyFSE+qKk1xqAqEM6bUIvsat8qxQR5CocNhAlMN
	lm/y7s3qItfvdl+0LsEpquvv9fDPR3Dk85UW+etZZ01XUuZTtfYtzlPxrbNCM3WU5YpUSDmDZuf
	VPSzqIh7qw9xGPJo1s6pijseVd01hLwBh47nvNejyP6sOVaf+0BuKuydbom9yZJqqt4IRndxTzW
	xs/0V6JFqe5kIaVKyqNLNU8nvwgZaA1fJSDoJrQmb7+DrTsHHQ537WbnxGsNgNa4IfxvJgm0UQJ
	FT7vOXz+/o9kKOUlv8DvW8oy8kIKUvt/YBP9r0kEWO+Rd+SSehpnvXz+F+MoLyEFEstiatBvbSY
	WHHjawhLPG0bLLWKCVhWbzVlhXcMaj1RL4Gdq9YDE4FSGpXorgQjy+AsN10epN+d1KgDj5VvxQv
	M4PwxVlYQvUrk6nEYaMkmOLCDZ0Ti+VnUTWdpvi5fN8
X-Received: by 2002:a17:903:19e8:b0:2c0:bb2d:a30b with SMTP id d9443c01a7336-2c1e893e978mr199020155ad.32.1780980085248;
        Mon, 08 Jun 2026 21:41:25 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm200736065ad.80.2026.06.08.21.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:41:24 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v4 00/11] Add spi-hid transport driver
Date: Tue, 09 Jun 2026 04:40:51 +0000
Message-Id: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFOZJ2oC/23Pyw7CIBCF4VdpWIuBAXpx5XsYF7UMLYteAi3RN
 H13aV1oiMv/JPMlsxKPzqInl2wlDoP1dhxiyFNGmq4eWqRWxybAIGfAgXocNF0mPzuse1ookxt
 doa4ASbyZHBr7PLzbPXZn/Ty618EHvq8fSTCRSIFTRrni6lEDL43Q16ZzY2+X/jy6luxYgB8AZ
 ApABBTwBsvaGFPmfwDxBSRLfwkiAjmreCNVqYUqEmDbtjdCPS72LwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780980084; l=4487;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=niVPKu3KCGXpaVcO6/gS8ySgoA3IT21ZaQzq7eQRAoI=;
 b=gMiaV3ssfrSxB6Fkr0m/bcfIHp9ptbFeLfSnTk8bUHRLDQdur44JJWF8n6UENBPsDLHjwnDys
 a1vurmOpnbgC1mSlSC2pqiuwkJcE4MyhX8Df0zwQplhFF1Yawu1lVbU
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
Changes in v4:
- Extended io_lock scope to protect the shid->hid pointer lifecycle
  against races with the IRQ handler
- Cacheline-aligned DMA buffers, enforced 4-byte alignment
- Added error rollback for failed suspend/resume transitions
- Moved IRQ request to probe with IRQF_NO_AUTOEN (disabled by default)
- DT Bindings & OF Driver:
  - Required a device-specific compatible string in the schema.
  - Added description to explain why opcodes and addresses properties
    need to be defined in the schema
  - Added `spi-peripheral-props.yaml` reference and switched to
    `unevaluatedProperties: false`.
  - Added fallback to default timing parameters in OF driver if match
    data is missing.
- Link to v3: https://lore.kernel.org/r/20260402-send-upstream-v3-0-6091c458d357@chromium.org

Changes in v3:
- Add io_lock init
- Relocate tracepoints to drivers/hid/spi-hid/ and fix tracepoint macros
- Add tracepoints for sync, error handling, reset, and report processing
- Clean up internal includes and fix Makefile CFLAGS
- Add more details in v2 changelog
- Link to v2: https://lore.kernel.org/r/20260324-send-upstream-v2-0-521ce8afff86@chromium.org

Changes in v2:
- Clean up DT bindings: fix formatting and remove timing and flags properties
- Update DT binding example: use a device-specific compatible and drop
  reset_assert
- Simplify ACPI/OF match tables by removing ACPI_PTR/of_match_ptr
- Refactor OF driver to use match data for timing parameters instead
  of DT properties
- Switch to fsleep() for delays in ACPI and OF drivers
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

 .../devicetree/bindings/input/hid-over-spi.yaml    |  128 ++
 Documentation/hid/hid-transport.rst                |    4 +-
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/hid-core.c                             |    3 +
 drivers/hid/spi-hid/Kconfig                        |   45 +
 drivers/hid/spi-hid/Makefile                       |   12 +
 drivers/hid/spi-hid/spi-hid-acpi.c                 |  254 ++++
 drivers/hid/spi-hid/spi-hid-core.c                 | 1521 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |   98 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  247 ++++
 drivers/hid/spi-hid/spi-hid-trace.h                |  169 +++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 14 files changed, 2531 insertions(+), 2 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

