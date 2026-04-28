Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BE38E5EF
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376606; cv=none; b=Crs5gfHm5G0BaFMEHqOSWjFeqx3CkB3nTGMnOg6nOzcCkpfW6Qrm7gTIlu3wbZ635qs4a1EqroY8CfudPDv8HOoTNiSxbATjz+PjJk2xzzNBuAEB+EWnYdmMpefaYutU3A5jWjVlDaXkpChxqroCnMUrbYMsUIIRIvIKNFhKKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376606; c=relaxed/simple;
	bh=QNJLWDEII8SiucyVK45MApojL+ztZD1a21kqxia/FB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vw10RmXXVBAheNyi45w+WSqMJ2HTQebcxM3ztNB1pReLM46mSg2rxN/y0DfH0wSxr4xwmp0U1qKHZEaMcXmb5aLqVDHC7y/SAhF/CiWvxgJRlg3xyGmGnurGWut6+uW2Fc8v3qZ1roO+hoV+1Rd2/UnRCMj9Mjp2kUoTAEr/Lo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rach+uG5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rach+uG5"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so6318289f8f.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376603; x=1777981403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/M42tzBm5+OpAo/m9VxQz0z1ChxGPGEHmsrbw6NShkY=;
        b=rach+uG5EZzFcO3LweKE66qUQIttqJ3rVPS+PWhvkZaE2Tl2b5kAe+wHt7vlXlcleS
         BuwM0orivclAnCxjHw/Mz+MGrNP/3E671/cciI78nqrSsmZwGkVN5lm8h8Y1pjxo5Q0t
         hgjc8h7qpmbsi6jBG98lzB9xOj5UGctAHvhxm3c21MO+PInvsG+4u64l4SwP8BzcO4W5
         Qbrzez+bJiArJS4wvXtVn7BRGRT3qwmMIvlbXxc3pIeK8B0OTUK8uDE86mTqwKpgO08o
         5O/VEo1b/iiT0dMQ/otF34INBKj0yNIv08YeMsYi2eBjzY3LWjmoB35G8yhQ/TJTqf7u
         hf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376603; x=1777981403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M42tzBm5+OpAo/m9VxQz0z1ChxGPGEHmsrbw6NShkY=;
        b=UIuxW4/xiFbC7jexOFLv7EZpk/nnfPGVKHUZI0ZY2hv6qBrhiXSfl8iDQiqBA7FXEs
         oONLJy3uIh0W3urXJWUX8/0W8v2PYJVclDHxwVezili94Huu2Satqo7AaRdfEB6gXJ2F
         PnOj3ysmPqnbCFT0UT2Nc5Vi48CR173m11m5v6tFAxkkGZ9suJvDK6unTsg9YDoQAxzq
         JufCbtyzxN0G4z0iJc9TndUoyBZl2qkYLghrW0Lp32UXrX8WeQWL24gJWrJ69QLtHq0o
         n99khFLLA5RfEhNogoz8wl963nDDIxbBdbFhair394+9trg6Xo0QAU9c4otWyEeOTeXu
         k0GA==
X-Forwarded-Encrypted: i=1; AFNElJ98sDakW42wcE9KDf/iDnqsUhJC8rDPnE0R3aURcNpw25jJeWuqLP8+PdBkZah0J1BktzooFi4mFu8T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+a+kbmA5dtMbGxw98Dycc0vo3pIPc6Y1ZukrjeBrFsMuFdZyX
	qM+TSEBSR6FKrKTbjrvkTOvk6oEnWYwSf6TqdZsT5Ri5jVKvnNc1fJ1/
X-Gm-Gg: AeBDietDymrZQDGhSHhkkkXvQtNMwKjEej93MOzkf/3uDLj5B/U9jdSvshNtS96VeOD
	j7y6xxCiD7MwxzfyKxneW30OC/ARuWHkMU7v3Wj+xp6OWXv1KYhzv7UaXXJuH1Rod79paC/4tgF
	xMrJNrQYSFGaHfV1xblK0RCgWu+kDtmYKHyKoExerqCoyGF+/O9sxCvZ268m6sRoP97GDo7U+k7
	Vt9zUHykIE0z54tv2FL4R5dfpfX68hnOGFYunxbbqlavxojVkjzNxiHgmY26Xo1PIYw6GgA/L8i
	94Ip76F9I8MLCe43IgOG7pj0EjI8D8swnVNGUP/OrYGObYD8qbo4SxPyfdyYh1sN6/E6atCFDi7
	+oQ2pVIaHlSPRC9vIXJZgZmPmZifBrkv+6G5jAkBAVvzC5cg5ZQpWHgynV+lRevBwcnSwZsBZTT
	YtkEOlc2KCL+gXKJkKP88SO9U=
X-Received: by 2002:a05:6000:250c:b0:43d:7946:badd with SMTP id ffacd0b85a97d-4464a913497mr4983599f8f.35.1777376602052;
        Tue, 28 Apr 2026 04:43:22 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463ff5a1acsm5589842f8f.33.2026.04.28.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:43:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] input: misc: add support for Imagis ISA1200 haptic motor driver
Date: Tue, 28 Apr 2026 14:43:06 +0300
Message-ID: <20260428114308.113253-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISA1200 is a haptic feedback unit from Imagis Technology using two
motors for haptic feedback in mobile phones. Used in many mobile devices
c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Beam
GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.

The exact datasheet for the ISA1200 is not available; all data was modeled
based on available downstream kernel sources for various devices and
fragments of information scattered across the internet.

---
Changes in v2:
- imagis,clk-div switched to accept actual divider value
- dropped DT header
- adjusted imagis,period-ns range
- initiated hctrl0 and hctrl1 values in isa1200_start
- fixed situation when PWM might return -EPROBE_DEFER to be
  treated properly
- added chech a clock or PWM is available
- fixed regulator voltages check being off by 10
- added chech if state.period is not zero
- added action call to disable clock and gpios on error
- used managed version of work init
- added work cancel on suspend
- PW calls are done under mutex lock
---

Linus Walleij (1):
  Input: isa1200 - new driver for Imagis ISA1200

Svyatoslav Ryhel (1):
  dt-bindings: input: Document Imagis ISA1200 haptic motor driver

 .../bindings/input/imagis,isa1200.yaml        | 140 +++++
 drivers/input/misc/Kconfig                    |  11 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/isa1200.c                  | 507 ++++++++++++++++++
 4 files changed, 659 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml
 create mode 100644 drivers/input/misc/isa1200.c

-- 
2.51.0

