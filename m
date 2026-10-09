Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C63D45DF
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584800; cv=none; b=qTJsrGQq52BqBKc8FS4w1QOP+ZnODC1nnDUD2OiUj0KxdsJcqy7IMfjA+d2vmpKBWA+kXVUkIFJESSuwBj8RCsugRh357e+gygDH6rtng2Dm36bh4IjbNLFhH+qGPCdIaRNgORSbAax3UzeU6++NdH20i4gx3NgHOT0UmD8L7vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584800; c=relaxed/simple;
	bh=Nj1qlIpON3VaMJM8UbfjiD8khDpWPWvFN1Ci3Mk1V50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QjYqX628d7Mdz/QneRZ/abRwEpQZjWLw/fNNR9F0xCt1emaS2d0OoKnFAkU0FAq1tUF0Rz5RQJVJ22+WMluQzcP6z2SS1L68qagyGZ55/MEPIc5rgFXPVBLTEsSEbRdhHeeVmhkbXWtFfxd/wf4nR8s27LJ4IMoUI/9r2IDcFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LAyaa34E; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LAyaa34E"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e836252e1dso1472075ad.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584798; x=1792189598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FUz1DD2WLXF8FMCF65KzWxeNZSEe/yJbWO0PR68AnX4=;
        b=LAyaa34EJdvWYlMTFjxZMKlgEtHOeBEsJfmGT7npnHodGoSWTmK/XYZVa7CXL+qIs3
         DlogidZogBIdrAR9Q8ofeigrh0zJLaT3IBGSouQcLLrm+stEKfNb6cQTWD8naTe5O9LD
         mF/unoJvj/AU1mRHJZnvhpMc03BQWOSeX4iX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584798; x=1792189598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FUz1DD2WLXF8FMCF65KzWxeNZSEe/yJbWO0PR68AnX4=;
        b=BwfUr4h5f7m9U93MYiWISxpN8HZ50v5qb/1jrUA7LKLS5HfAT3mRtoY2Ot04x5S+lU
         2Owx67o5zQzDuEkT/4O7gPlslmbZGS4UbqUQs9VxqDXtqMjkysFFdL6YYuBj9glJV024
         tvLMiVKhs0BYSm0I1QiGcs1OmhFs6XzOfdFvVeAHpqe4waZ6C1upKSKHYGI2EdK6DyIG
         0Mje9iqXNHpNJENfrduNh1v7p1PRodAvnMUz70RM65EswSz84Z31qKi3fgzsOQ9C36Tt
         EpSc/Z8GLYAfvdfWpamcTrTlF0bIECKNB4dJEN0/jLEwCyo1uTSUqWR+81Tcle3UEdR/
         YkGA==
X-Forwarded-Encrypted: i=1; AKwUvBzwNqD7sqXOvxj4vJce4udPLZQC853DGv8FaucD9ywm1N6IiGIDBUfjBfVPNuDTvXtodWX6nDyaPSuJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJOg0liXmcm9v32PPwtrDAUosoNkvTKcVLhAY1Z5a3TcvjrRTKC
	tZ7lJudDsJpLUpicWjdFLgxbXc8wJXutgTs6aR8/qvBdgeVtTbigbXCcNwVAFZSS5A==
X-Gm-Gg: AYBFou2G/NeQube0hitGbZETr6Q762NL3Ga+OKbSDScWZVBN2RR+WjmQMZv2tFV3WjI
	OqnetWdKFdKra5SaAlJXX7lWR3AaCN/hd4MK4Uh9vj5usS08BKxJUrt1p/G4c8CQ9oPg7q4G2Rf
	FLF02YCG87YmvJBVxiv+JcwN9RaO8VNRKad2PpOWSYn2VnZ6zJrqMx3vYv3ezr9fWYYDPpWkz0U
	4ER5l0EX637EQu3VPoGL+QjaT36eV8+vnFoJBYNoY4k0rGy7ieGK1LvTCRnEIsa1r5PKTeENa09
	FAIYy2BPhB0LIFKc7/pB1YI3HHq1EKOLOgp9eyEf0Llc9pC+gwYat6gLPub5vkCTpJI52w+C8sm
	13gl65dJ/RCN3D78W4eEw+D/Sq7Ukqurwvlf9dzLuijzUXuZLNqgri6Fkg2AKaG8kSIyZ74eL8e
	ClFrh9OaAsdnKOgrXnZRsrtlGpeWa6UAuP8geTzcOfh0vkHRsoz6BiT1Ah1lS9mJN40Q94JVA27
	UTmyvBjzHW/PhSSwp8pailooScORaWB4AdtsYN5tprka1yf4e3SubaFTBkMCsgFGHUyR+QrtMTu
X-Received: by 2002:a17:903:22d2:b0:2e2:c283:354f with SMTP id d9443c01a7336-2e842abfe53mr30774615ad.28.1791584798347;
        Fri, 09 Oct 2026 15:26:38 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:37 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v5 00/11] Add spi-hid transport driver
Date: Fri, 09 Oct 2026 22:25:25 +0000
Message-Id: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZpyWoC/23PSw7CIBCA4asY1mJgeEhdeQ/josJgWfQRUKIxv
 buoixrS5T+Z+ZJ5kYQxYCKHzYtEzCGFcSihthtiu3a4Ig2uNAEGmgEHmnBw9D6lW8S2p3vltXc
 NugaQlJspog+Pr3c6l+5Cuo3x+eUz/0x/kmCikjKnjHLF1aUFbrxwR9vFsQ/3fjfGK/lgGf4Ak
 DUABVDALZrWe2/0CiAWQLL6lywKoFnDrVTGCbVfAeQClM0akAW4GCmcQm3RiQqY5/kNc2Ls0nA
 BAAA=
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
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=5428;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=Nj1qlIpON3VaMJM8UbfjiD8khDpWPWvFN1Ci3Mk1V50=;
 b=etJd3b3UVqagUxqvjiTG6zOPQhMZq5oZ2SbYUYzjkoeHHWcPQb1WlCN+9PEKh/Wi8HCO2T+1x
 O6h+agGpXM0BUSCGRCXk1lARzHY3remF5IYc9vlS0ExrdTDgSttfctW
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
Changes in v5:
- Fix request/response races; match GET_FEATURE responses by report ID
- Reset the device on response timeout; wait uninterruptibly
- Validate device descriptor and report lengths; fix buffer sizing
- Honor rtype in raw_request(); fix GET_REPORT off-by-one
- Use hid_safe_input_report(); forward input reports only while open
- Disable IRQ around hid_device teardown; fix a sparse warning
- Use disable_work_sync() for reset_work in remove()
- Cap trace copies at 64 bytes; cacheline-align read approval buffers
- ACPI: select RESET_CONTROLLER, use device_reset_optional()
- OF & DT: read opcodes as u8, use dev_err_probe(), require reg
- PM: cancel reset_work on suspend, wait for reset before
  reset_resume(), fix IRQ imbalance on resume failure
- Panel follower: fix regulator/IRQ imbalance; depend on DRM || !DRM
- Link to v4: https://lore.kernel.org/r/20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org

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
      HID: spi-hid: add ACPI support for HID over SPI

Jarrett Schultz (3):
      Documentation: Correction in HID output_report callback description.
      HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
      HID: spi-hid: add device tree support for HID over SPI

Jingyuan Liang (6):
      HID: spi-hid: add spi-hid driver HID layer
      HID: spi-hid: add HID SPI protocol implementation
      HID: spi-hid: add spi_hid traces
      dt-bindings: input: Document hid-over-spi DT schema
      HID: spi-hid: add power management implementation
      HID: spi-hid: add panel follower support

 .../devicetree/bindings/input/hid-over-spi.yaml    |  130 ++
 Documentation/hid/hid-transport.rst                |    4 +-
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/hid-core.c                             |    3 +
 drivers/hid/spi-hid/Kconfig                        |   50 +
 drivers/hid/spi-hid/Makefile                       |   12 +
 drivers/hid/spi-hid/spi-hid-acpi.c                 |  262 +++
 drivers/hid/spi-hid/spi-hid-core.c                 | 1754 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |  118 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  243 +++
 drivers/hid/spi-hid/spi-hid-trace.h                |  184 ++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 14 files changed, 2810 insertions(+), 2 deletions(-)
---
base-commit: ee9c669f9bf5fd2c24206746ded9382fe810df89
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

