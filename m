Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436490;
	b=VLFU46/FexZ5POUr2uDDK4WuJKqnAyvzyOAHRHh9GLIif2z11PDtnTY5iuMcPQ4yP9Z2
	 moqRzpwd+Fxs3ZI0uC9l9ihx4Le1yW0Sb2SxclH8gEpAWgalteHJSVZP8ckufQJIpml0p
	 GMz08pfG+1zmWusxVduEplpa61PaL6Ovlv62xCVFJdsj06e/8C95JwDhozIVbR1jBLQVH
	 ZOoyl7OC/odjTvWnch34LREAjEnlAxpHnXHiMRys/Xr8FIuoKDsO6oCHQwyFZfF20sHDo
	 8MY3fLLmQyi8BqzfGiatyRWVdBkBiXzOmsOFVEK6vPq+K8lvhy55Ux5cuYumXZKQPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NlRWSTOFbePBOR+ZW461CZ2nj2CGvQoMjpOv8gpMfng=;
	b=pCu+RHhTjxferOQwSnh0Q+BoAGTclokq/pBrCj+AiAqI2RXfptuKdRwY1wOSczlzZtsR
	 uAwvcvYpTxhV5u6NaeBRC6RACnqTjIIGPwtVdODNhoQ4INB7/t5b6j9B+8jUFrH1ZFphB
	 SidFTMWqTKmgLtHlvFe8XUg8OsODQLTnuw9zB/v23Csqd3AAtbtoHDXQSyi19Kfc2kTNI
	 kYYx7tBrIoSXWS3hmFA9sDYz9R5i12hMH7s4KNmAU4h07mHe/1sIiqibSiP+qJ9nMTNjB
	 VFCRBprugjH0IPZzIh8WV0UwrW1d/JZyAVXMUiehWF5aHg3rUr/ITMPSeBTSdKjOZnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZEvpwaca;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA1B606A325
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 19:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA1B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZEvpwaca
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5fb79ce82so12994005ad.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436490; x=1793041290; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NlRWSTOFbePBOR+ZW461CZ2nj2CGvQoMjpOv8gpMfng=;
        b=ZEvpwacarzzImH6V6uOJTzbL8stPTETvmYc17X7c96whAtVQTM+Ndsw4UT0JGwmD+I
         BKmRrsuT6++2dsgO3bXm5ZuurZ21ZFUlWCPMc3B7m+FXydpVtnxL6hsXeexpZE1Av4L+
         0CoKGxEzPf1ZzmmWfMOYbNLnW7pyHFfz0mkPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436490; x=1793041290;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NlRWSTOFbePBOR+ZW461CZ2nj2CGvQoMjpOv8gpMfng=;
        b=HlmT6NkjAtxLRLN9twTgK0P5pl0A21y68ARzRLIiTPGo41yeUdx2WB/ojuQD0epd7A
         Sj0H6D8RpuZTg/NTq91SipNZ3ExeLomeUy+dtCZuX7iJ01H3lQ9hkChRMMTZCxYBkme0
         UkbbCpxY0u4b7lVlSII3/r+ZN8ocTeuruGX0OIHBs640+Gx6jZ5ooLy7zKTEWyWbIwIJ
         LiI1ISAyf2qztui9SP66aou8AiPZlBJUfKRl3LedAatugZXvl3LJu5XfjvNndoGmJKKl
         F214dL5mvmiYBPc1t+0i5d0FJpqiAQqsuc4ifBS09sBQlLEQNbJd5jBMb+otUJzt1PmU
         8rvw==
X-Forwarded-Encrypted: i=1; AKwUvBy+pSrPrfFj0hqxHi0YOyVY4f8wZou3QCPF2fHPTbkwGpRKlhc1LvRlRRM0E4DKzYwv+xzieh4ovuuw@vger.kernel.org
X-Gm-Message-State: AFq9FYJn9IMLuPNuZRL2k53FijvsA2lmxVW+sy1w+Gua4LSNYfEQGUMe
	g5StsnAHRnD6E2uCZZ5Ib8nzCdsyEbRs3Spfdade/LGhCluYK8V//0Ry+1vr0u0Isg==
X-Gm-Gg: AYBFou38Onbw+jvLrOUL/mOVaoGyQ9HHM6J8+ivVPCv88HfyP4bL27Q5UuE6tiaaZ8p
	0naAwMGFWAuTEhnH2gILDj0YSswL9xvhVO1+hPD610+OYwzQgmLm3QeP03qY3lnZL6RFdfLSyNg
	06PObuaiWYlFsbnMy0d5D8k+H9/g+yAmgt6MQNc0Hc7pnEMNukprUA4FTBYKXe+e3dHf07NI7oQ
	xfkJUbd9XUZ5rwnzwz6oTvNQ0u3QeA4Z/ZwHRvkKEAFZYLynS2vz5fSTY428CHc9jNKrHHxNMPa
	tOs7yOHM51/nSF5PTxXmA42oeWLN5zRJTNnSteaNRecDsiP7YV5O30Q+zINsbhla7KY1aqaZhl8
	gp7NzTfvxmIxniB7wXeR+Mub02SqAq8rkkaI0u8biUMSoSK+g0MzpY9oCJce1LBCI8Tx5njJQk4
	7S7yVwEFlrw9XES9WEnNGMrFJwt22j7PvRczEgHYyj+luqGkBHyUH8zRdVX8tjCidxraf4LWscQ
	ODvxJmxfwBDQsfiL2NwpLhWa8ojgesoL96uR3z/+4k06IL9Uk0vwonEwoy4w8MrnoUTZLssHKPv
	Aj6VrA==
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr78949655ad.30.1792436488354;
        Mon, 19 Oct 2026 12:01:28 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:27 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v6 00/11] Add spi-hid transport driver
Date: Mon, 19 Oct 2026 19:01:12 +0000
Message-Id: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPho1moC/23PzW7DIAzA8VepOI8Jm4+SnvYe0w4UTMMhSQUt2
 lTl3Uc7aZ1Yjn/L/km+sUI5UWGH3Y1lqqmkZW5hXnbMj24+EU+hNUOBRiAgLzQHfj2XSyY38b2
 OJoaBwoDE2s05U0yfD+/9o/WYymXJXw++wn36I0khO6kCFxw06KNDsFGGNz/mZUrX6XXJJ3bHK
 v4BUPUANkAjeLIuxmjNBiCfgBL9L1U2wIgBvNI2SL3fANQTaJs9oBpwtEoGTcZTkBuA/gVA/Ad
 0A6RVLgoIThJ1wLqu3/ZCO9axAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=5852;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=ga6CwkzARUkSvEvRDG0PQmoQD7fSmYRrychrK6mPJmA=;
 b=vBA5OO3tSh7vW0DnhWVDJWpbII+xJtYD5/j1+yxiiJ5vl/UDtQJ3Uk4FZ+YGJnUP3gkXxZnv6
 fjs+9TLMNgCBwXACf0yfOCEkSy7lN5urMp6GOiINJI/amWw+dLgEKq1
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
Changes in v6:
- Take output_lock while reallocating buffers in ll_start()
- Don't drop input reports while a refreshed device probes
- OF: drop mod_devicetable.h, use named initializers, fix alignment
- Move the dt-bindings patch before the OF driver patch
- Drop Tested-by from the documentation and DT binding patches
- Link to v5: https://lore.kernel.org/r/20261009-send-upstream-v5-0-384af01da3ee@chromium.org

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
 drivers/hid/spi-hid/spi-hid-core.c                 | 1757 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |  118 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  242 +++
 drivers/hid/spi-hid/spi-hid-trace.h                |  184 ++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 14 files changed, 2812 insertions(+), 2 deletions(-)
---
base-commit: ee9c669f9bf5fd2c24206746ded9382fe810df89
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

