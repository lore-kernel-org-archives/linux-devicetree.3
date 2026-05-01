Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32936920F
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777666075; cv=none; b=nx0wVrVNaib0wcrVfDvFGocsSiRUoPywD6rzAyOVMBARaekm1TEFkOAVJZQ9ktIqDsmSk9mfr/OQiT0VlWT56+RmaO8RLMWNMF/Ft4nLx3veNvHAQiAhYoW8RMbYYZs4g/YkUw6G+bo1/oJZ2Vj5aE7jffeVjel6PyyPNoX90jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777666075; c=relaxed/simple;
	bh=s5uMc9KDVuu1RbBuzJ1/G61PpYFhV7uKAfbrxSf70rU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S97PDFEELSfzLjbKtiCZP7HYpaYdZHJxvbZTa+BXTth23C2Rzcwf5ME5wvrf/fu+CCt98hW7a0eTR00hXVq2hhX9xNkYTgyWgZwklAXKfmIPs9Xd297mdEzYvpRZU8IyIhrS4og9gWiOKj5qjATfNStOatxFfWyBur9hyJFEo9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dO/wUGrP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO/wUGrP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891f625344so23481505e9.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777666072; x=1778270872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tXZjRzLDEMalEOoixvymciaYgP38pfoNJeJznChLNM=;
        b=dO/wUGrP758ZnnVexyM1Vt4EWGoqZctvbiIhVbAzDaZiYSeI03K9ZwSpzKCzefM2FM
         jA27gZNMIKuGfgXLGz0UWMZRtijmY/4fFqAVlgIrV3RixWUtvnzpkgQoVK8OrJtgVJDk
         bEbSk926rSSFWWuRz0fkKx3hoYM/D8tm/nN6Vp8yR3VJPi/TFdwS+08gFPmc3i9U6Xiq
         qechsKTK2Eb5pFOPshrRpHdzHdH5MDmNDuj8VVeD2qbUSf0dCWLgHQ8xkryxGYkJj2gZ
         SQ4jzswQrnjhqEgYrXwiAM/oQwkPhynSeyyT9mqzkuhVPObDlGynzgutI1Ml/SN74pEZ
         pO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777666072; x=1778270872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tXZjRzLDEMalEOoixvymciaYgP38pfoNJeJznChLNM=;
        b=ZFZ573zjY0d8SupW3VhUMULvQFNO0/YPzHilf+rcunbLdSZ71Z+srA+lHfrchOJwy4
         RVE0ywmvvnzHkLyU+GNlBBWVjycxVw3BbXTzN3sZnK7gZL6FgFkP6H7Vgcd9VQpFopwA
         UYbRxOkhfuS6f5qz1f4dOFAG9fS4CtUKTf5UVKDzUFkX2rp59s+K0uNVviKLptGZGYkL
         N+jk1iAH816CRB5j95hcVNB0tA1fpkh/oa+VDvl+OHRUTn+lnMgPjP4pDgRWQW2FpBFD
         Q/ae6OTjg4DMI52NcFd0MT1POgRm5/8ygyKKcVaz0KTYKjf3pla/lhrtHWKAsbyk3zm/
         +X/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8l4Y7hQx0U9IfttolsFSbXsKGE9C3ro9bJqDLqtiAw56NlMHnroHa2D5EgMVmQjzOVU7b1A0aH9pnP@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+lOokqkOQ4QxlIGhlD9ZpOtyT373MsoBTutgi3gtNLuMh0zp
	1BcbIkJ0jyaAty3jypOWjEERi6rLpN64s1jQeD75MevVItzsBed7XkyP
X-Gm-Gg: AeBDievCbV3xlGVGC9lh9ULVdfMPzV/shuzFG5ZLtdDsNR2QUf8R9nl8x6LSfeFjMJ0
	RT+ruyVphXszly/uEISzkkTzrRGWybdnT7kHjwK97tNR4hA9S2JypvorqEA1iubbPVKYLEuTNhk
	HwzAu9N7bs8p/tejEgJmrNkyUIhPFV8t56ALige5/++vZg1I6Qm7cBhU13WAE6lM98ivAh0dwQ7
	fOnYmjhI8ByrUEuEr0CCbxbElHljmEMIQ3Abde8+Uz6jf3ymZKEFnarLqV3/RFIDoBy6hmlwDoi
	4iG9byTAaUw4A16wf2Da53U5UfsAJV55XQI0Shdfq7A7w6mNpcAmmBCfhAypohbn3xlXkImZtIa
	8IsSd6NOOhIhp8Z0aJBMXOhqhy4QhoYGAEEIdwIYaDpu//FECVYkr30qo94PwU8mTCx5jM9usQI
	V2Fv/Y9KIE
X-Received: by 2002:a05:600c:46ca:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48a97098a3bmr12021485e9.3.1777666072150;
        Fri, 01 May 2026 13:07:52 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::3323])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe953besm26829325e9.2.2026.05.01.13.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:07:51 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: wbg@kernel.org
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor.dooley@microchip.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] counter: add GPIO-based quadrature encoder driver
Date: Fri,  1 May 2026 22:07:46 +0200
Message-ID: <20260501200749.20029-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new counter subsystem driver that implements
quadrature encoder position tracking using plain GPIO pins with
edge-triggered interrupts.

The driver is intended for low to medium speed rotary encoders where
hardware counter peripherals (eQEP, FTM, etc.) are unavailable or
already in use. It targets the same use-cases as interrupt-cnt.c but
provides full quadrature decoding instead of simple pulse counting.

Features:
  - X1, X2, X4 quadrature decoding and pulse-direction mode
  - Optional index signal for zero-reset
  - Configurable ceiling (position clamping)
  - Standard counter subsystem sysfs + chrdev interface
  - Enable/disable via sysfs with IRQ gating

Tested on TI AM64x (Cortex-A53) with a motor-driven rotary encoder
at up to 2 kHz quadrature edge rate.

Changes in v3:
  - Pick up Acked-by: Conor Dooley on the DT binding patch.
  - No code changes.

Changes in v2:
  - DT binding: rephrase description to describe hardware, not
    driver/sysfs behaviour (Conor Dooley)
  - DT binding: drop redundant example without index GPIO (Conor Dooley)

Wadim Mueller (3):
  dt-bindings: counter: add gpio-quadrature-encoder binding
  counter: add GPIO-based quadrature encoder driver
  MAINTAINERS: add entry for GPIO quadrature encoder counter driver

 .../counter/gpio-quadrature-encoder.yaml      |  60 ++
 MAINTAINERS                                   |   7 +
 drivers/counter/Kconfig                       |  15 +
 drivers/counter/Makefile                      |   1 +
 drivers/counter/gpio-quadrature-encoder.c     | 710 ++++++++++++++++++
 5 files changed, 793 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
 create mode 100644 drivers/counter/gpio-quadrature-encoder.c

-- 
2.52.0

