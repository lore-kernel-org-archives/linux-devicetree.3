Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE751B4156
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388761; cv=none; b=eoMqVv/Anz46t/pH7ZfkWVY746hLvapaeMqS1tBLXtNYhj3iWeN7Bv+1ZHegNLzC5Q4heVfmh1NJdSbhmcD3PraWCf5FQxO7rPjRAMGWUK2CFkoE60V8g8MdDq6vHH7v2r8mwmzzhKPQrspT6uZevjlLLEQAPoBcyAo0I4x/1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388761; c=relaxed/simple;
	bh=1WbiRvGwyZgI3p7Cq5tzLhqkz+2SDn51l3e2tAXChBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3k3t+ATVsBtbuGRRjw/yWrdLFGggWYSj1VOyEtf2n0xBLs3MmqwMywu+nYhJg9+XZjw8qMD6hehypMuL4r0wZpaF2FS4oh9a2PX83Rz29VFY5MM0oR56QhvNmNMnuiIsGxA+EHKh2Au9H1PbfRRLDKGOs5glqC6QC8xgiYawF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ce3G3lj1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ce3G3lj1"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-847aebc56b6so2855116b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783388759; x=1783993559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZusTVEKPqv6I6o1eJ+PWE9GvkUB2pmeD6248aHzWvcg=;
        b=Ce3G3lj1pr8Er04OG04zSRrK4Y8jFkdRlnxSWBXA5mTO7NWNOpyA7fK2eRfNMkyr/x
         A77JDbvAnxoqqRZAxZZmh0BEwCuGcS5f6w1DYCFT6v2S0c/dZZQK2cUK0rsaqeJT68y1
         h7VW6607aPVZCXTn0mqIN0v4PFXiiFAwH/kFrv3T3SszSf1nQWyuGNjwk8tG/WEhXKVR
         meQXo25scv/h12F5MGzknHRxLUFE34wFW8zcXraPpTYdyafVB6VbY8FiiUwLJRBDTncB
         DfSwROnxgCwmAvFoM6I9qVthEJ3dIPv7drgqCeBFXtChzhvpB20e9orIpLVcicke0xFT
         JAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783388759; x=1783993559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZusTVEKPqv6I6o1eJ+PWE9GvkUB2pmeD6248aHzWvcg=;
        b=ZzR4WKF0yiw3g8QztuJzDAjBvcCgdwsg5uU87DkKwpVHvz9GRQ2OJycfcHNjVzlXBJ
         VOD1GAHNme5P0AQwnGvlaujgJM2C//gfEviH6srhqUp52+rZuNSJrEqMsR0ntIZ57hR/
         WZfWVHTqsild5SIKSAwvvl3r+WPzN20XgX8lYIuIX0hA18cFItK3EHVrAnkUl9vSWxSq
         Cl1izjhuFQXLcy4naS14NKdDKomGRxs4GfGuc/mmB/UmG2tmrp/uInqtrueX8mjFM0bu
         x3Z92hMpisL+H2hmSly/mEfscMtW5k3Namg6Bc5hZsZmDXkr08boRkMJ8muNp9duey4V
         eAYA==
X-Forwarded-Encrypted: i=1; AHgh+RoS8PeQVxNLcgVsww/c0//QlyKNeWBWrS3luJuEJ1wb8Qj6BX+KMricZ7WzE6LQ4HB16n3gjNFeAQZd@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeSbUDvWG2YAQFR2iUDTmBcsKmWnvCTYOzO2yiTdTdyFsP4Tt
	sNPMjYWWJIxvEFm5kHcEwBKzRkQiB7g1zYILryagyhJT9SD0QLzVvYPp
X-Gm-Gg: AfdE7ckG2HubrcCqyEKH56QYUlzNXO+bxFHUHtzopyMi1r5yscni64fz38d3U1vatWv
	spo6Yen57I6V9tKRVPbwYt+BHGZ9b2sHBE+A79acD09BXndOmT73jI9GttO3DUXRFO0qdlejKzF
	15tv6DuJcaU3rDLKW9aiVmlOq8Fgz+BAkrlwPqF3nxazo2QXkuNP6nb4Zm27CMDnyidym//Ci8o
	4SMp9Z+XCNExlBrhAdTvKZKzkSGkE2itAih34VvsouzcZEX/HvhNk5h4Ji9C1MAqQk9JX1ZCDfq
	dkCnfy2smtTLkFDVOmkfeZ689Go/0HAQKvhYGWYbfkdHQLscTfLVrb1i9ssJdHtYElgE3V/1Imo
	yjoHYrprVBnYrtXrm1DqP+VnygbnK66pq40nUZznBqXjDvoAv4SgqAUVpOfhINR95YBJYxA1nXV
	k+YBtDayr1Hp+Ui4DpIUMxPf7DnGodssGG3jnJhUtrzWb37Nl5Y9IeWN4OmpLOwvmY54B6W9PAY
	NWAuumu05xl5bc9KHZXNU7oHz33IFj2UAQGWFs=
X-Received: by 2002:a05:6a00:348b:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-84826df3cbcmr2955880b3a.39.1783388759380;
        Mon, 06 Jul 2026 18:45:59 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm4645653b3a.28.2026.07.06.18.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:45:58 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] iio: add Open Sensor Fusion IIO driver
Date: Tue,  7 Jul 2026 10:45:20 +0900
Message-ID: <20260707014525.1015-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a Linux IIO driver for Open Sensor Fusion devices
exposed over a UART/serdev host interface. The driver parses OSF frames
and creates IIO devices at runtime from capability reports. Expected IIO
devices are accel, gyro, magnetometer, and temperature when those
capabilities are reported.

The binding, supported protocol subset, runtime discovery model, and
driver-facing ABI remain review-relevant, but this revision drops the RFC
tag because there are no specific open questions being asked in the cover
letter.

v7 was prepared after auditing earlier review comments and either
addressing them in code/docs or answering them on-list.

Previous versions:

v1:
https://lore.kernel.org/r/20260520072843.3593-1-kimjinseob88@gmail.com

v2:
https://lore.kernel.org/r/20260524085312.15369-1-kimjinseob88@gmail.com

v3:
https://lore.kernel.org/r/20260529121005.1470-1-kimjinseob88@gmail.com

v4:
https://lore.kernel.org/r/20260607234343.22109-1-kimjinseob88@gmail.com

v5:
https://lore.kernel.org/r/20260616072242.3942-1-kimjinseob88@gmail.com

v6:
https://lore.kernel.org/r/20260628191337.937-1-kimjinseob88@gmail.com

Changes in v7:
- Dropped the RFC tag; no specific open questions remain in the cover
  letter.
- Added previous-version lore links.
- Removed the confusing compatible/OSF GREEN/OSF0 explanatory sentence
  from the binding.
- Removed "initial" wording from the IIO documentation.
- Reused the common OSF_FRAME_MAGIC definition in the stream parser.
- Fixed OSF_FRAME_MAGIC comment wording.
- Removed dead overflow checks for u16 protocol counts.
- Removed the unused partial_frames statistic.
- Fixed remaining loop-local variable issues.
- Reworked the stream/core contract so CRC-valid/authenticated frames are
  consumed as full frames even when ignored or rejected at application
  level.
- Preserved one-byte resync only for unauthenticated/framing failures.
- Preserved IIO buffer synchronization and zeroed scan storage.
- Removed the duplicate IIO dependency from the OSF Kconfig entry.

Validation:
- git diff --check: pass.
- checkpatch --strict: pass, 0 errors, 0 warnings, 0 checks.
- dt_binding_check: pass with dtschema 2026.4.
- GCC W=1 module build: pass, no OSF compiler warnings.
- clang W=1 module build with LLVM=1 external build: pass, no OSF
  compiler warnings.
- local stream parser semantic tests: pass, including CRC-valid bad
  protocol_major and nonzero reserved frames with embedded OSF frames.
- static IIO scan layout/padding checks: pass.

Jinseob Kim (5):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add authenticated stream parser
  iio: osf: add UART IIO driver

 .../bindings/iio/opensensorfusion,osf.yaml    |  52 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/iio/index.rst                   |   1 +
 Documentation/iio/open-sensor-fusion.rst      |  72 ++++
 MAINTAINERS                                   |  14 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  15 +
 drivers/iio/opensensorfusion/Makefile         |   6 +
 drivers/iio/opensensorfusion/osf_core.c       | 320 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  70 ++++
 drivers/iio/opensensorfusion/osf_iio.c        | 308 +++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 ++
 drivers/iio/opensensorfusion/osf_protocol.c   | 242 +++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   | 100 ++++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 114 +++++++
 drivers/iio/opensensorfusion/osf_stream.c     | 189 +++++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  30 ++
 18 files changed, 1559 insertions(+)


base-commit: ab5fce87a778cb780a05984a2ca448f2b41aafbf
-- 
2.43.0

