Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70CE395ADB
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581498; cv=none; b=sxbHktwCDVU94hYcvXdgxoDjbuwTmeQe7gDXXmBnFT8zYuJU2whuSvvCL604crqbo4leE23x3hB3qyREW10k2v4vAoc8I/MX/iQUkVwxqgZA9J9uhTSP+7iruAND/4fUOWjdN+/+v529yPwJefpMlAj+qG0va5la+niPtH+wmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581498; c=relaxed/simple;
	bh=VkIQe9enrKprR/AxY6Dkc2FlX7laVOPhA0/xwB9AKbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUgRY7uh80Wyhw5VYaVaPv9jcxB/4Xi3JwpAV4w/JXd/BBkezXl17STNdjAANFQnYlpStLJUxwBogr7oriqhU3npj5ikxHOr+bb5J2LnrqR2fGuV6zW4Mv6E8E6P7D48pWdPRMSlurJWqm9drm3EGoSwBXg5Zm3uFbZpV71l4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4Uyfgo1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4Uyfgo1"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so9025857a12.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778581495; x=1779186295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GIwyDALF/QcCK3UD/Zg1ohofSXNNGV0cy1CpSwLCB4=;
        b=A4Uyfgo1S2Z7Am5B+0YwdeaXxU4vSiS+LPC3Q6Ijd4Y/IaV/OZUucDsDPbN0nd5MqD
         iVrn8gJchGO6AWukYkJUg2M1HZHHt9eg1ecZ6kVwWlj/WsC0Avgv7UFlY2efTuhgMmQG
         1NIU4qHLmA2OycBCOMXTI6V7tL03iHj2oUykpQbAAH+/Mr1i05c1gckZk3FJTELJF6hS
         EjSNYjYeYOUV4gwwvs//DLcnQxSW2+yuvZEsgvhyOvK12aTWw3ntwiG97S1VoNn86A/F
         Y55/udzmoEo05J1SRw45hFdjGK/eZZlGkYGA9fyf/Gog0AdhGN7JJAExu2K5BfZrikZ6
         D3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581495; x=1779186295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GIwyDALF/QcCK3UD/Zg1ohofSXNNGV0cy1CpSwLCB4=;
        b=ncpNXmGi1SqLeVbxJHLLc3BsH69Gqbb1WfUG+EE5+gdBmhLY5hh7LeQZXeg1Un/Fwt
         J920yJHVHGvx+JWqm9wRgS4ItO5rScb6tvpONXYoV+EnHXBerc14S07ohq51YSjapkMn
         f/3aUfA+EuJPw7m7joAHPnq6eD9To9nmUb/2r+dNEkRwl4E+CbnVlmQgw1kEd6DHvxcT
         2hrYGpKGFc4zwqcbSnNr1upIUjQP+dZFEGwzhabggdMcMKvKMNh/gfjmlDB8dDOOwTCE
         smtZhSoSj3VdQ6+HpBzOWaQy3N/qp5Xf3N3qU1bJh9k7l8Ct6gmQn7+kSe9dgIGrypD5
         uSbw==
X-Forwarded-Encrypted: i=1; AFNElJ/EAdraTIGsRj2JAIjicCiYosNpE1W1QGBezOB6SDycCtTCRRPW4ASP4vvLFtJgwG45scEXjOEJXH/u@vger.kernel.org
X-Gm-Message-State: AOJu0YzrK/3/v0isLbqy9CYYFmmsZbj52QDCHGTmtgdyllxK1I2dEF+K
	bQFZeZdp9nRhzNa85enPJYxnvgTUUXRiUecO2SlPlyGI//qElsZQAmTb
X-Gm-Gg: Acq92OGepWIKfjghe+C0pPLa1MLMok+hBf4vl8mB7LQjOMNNV6Xu4vkDfTQzHF3JYk4
	6peQvs0FtR9moaiZTER7LZdC4FmmeklKn+7iCLGU2UTWCTNcCOGhbJqq7eZa0TjXu1Svwoo4M0F
	j1tcefB66xF0xOsQzE/aRLofq7Gid59L2aIp+qyMoBE4skS/pbxAXN53d8E+P88UEG4e/zJID6z
	1C10XXTLUSIo1/Gm9Rdhzq1BvdK8U3WKUwfrsrQ7UpYi4qOUWOdWjryIhBqXokDUcj+sWPy/ci5
	Mo6pa100Cp1GZA93O0f2mKhdYHTbn+AC+U5O4LgIToatrGLyOOK8Dx8D6e4Ez88heRSHut1GuzE
	zrwCIHJHISJ8jDZucv/hiEJJCw1c6UQg6RKlto+Gt2QS5W3Vmx7GXB91/GNSnvNC6yQMTOCMys7
	KENR96pTtFKTOyyLdlvtkvZq4=
X-Received: by 2002:a05:6402:158d:b0:677:15b6:4d6b with SMTP id 4fb4d7f45d1cf-680d02f613cmr1288570a12.26.1778581494941;
        Tue, 12 May 2026 03:24:54 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a534sm5032792a12.9.2026.05.12.03.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:24:54 -0700 (PDT)
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
Subject: [PATCH v5 0/2] input: misc: add support for Imagis ISA1200 haptic motor driver
Date: Tue, 12 May 2026 13:24:43 +0300
Message-ID: <20260512102445.55372-1-clamor95@gmail.com>
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
Changes in v5:
- added supplies to private structure
- clk_on dropped
- ret > err
- added active flag to track status
- all hardware manipulations consolidated in start/stop
- dropped mutex from work
- dropped active check from isa1200_vibrator_close it was
  moved to stop directly
- dropped hw maniplations from probe
- bustype set to BUS_I2C
- adjusted error strings
- fixed cancel_work_sync in isa1200_suspend

Changes in v4:
- added INPUT_FF_MEMLESS option selection
- fixed missing clock status set
- guard start/stop calls in isa1200_play_work with lock
- clamp ldo voltages to allowed range
- fixed imagis,pll-div parsing
- dropped Tested-by from schema adding commit

Changes in v3:
- added clock state tracking
- dropped level check in vibrator close
- added clkdiv clamping
- added comments regarding registers 5 and 6

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
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/isa1200.c                  | 524 ++++++++++++++++++
 4 files changed, 677 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml
 create mode 100644 drivers/input/misc/isa1200.c

-- 
2.51.0

