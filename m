Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E537649B
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827179; cv=none; b=LvIAtxji8yRoerJ7cV6wAIq16oxwRq6o+Mv76pkhGG5BLCAWQKBYN9RvEeWENse52AZjgczmULPNFYSlxTTRm2VoMbjEd6YHDb7XnCrte3LrYhU9pdi3lS8MLxHw7cOaGfPuhIPnAuxCSxvvWUwUtSeCh/KozHPhuf1hr6Ub+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827179; c=relaxed/simple;
	bh=otc+OpkaiKiBwUF+tcUidC95oQ2tFxa+9cKGsKaCglI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RIcmEZlqlNtWmOv8XvNc0n0fI5MS/Knz8TEji9oNFpeiASS95ROJ2UPO6WZxzlJlbk6tFqMmVLKyj71pppxJP4NaNYFRQoF5tTWEf4/HxE9H1k6guxg4phQuWntgLAZLbWuSmc58uNtqX8GXzJ+NcVP03Gez5jMRmHqeFMmel1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDTHcUjh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDTHcUjh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso439233166b.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777827172; x=1778431972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Wottvwh2F068u0uO4a2RGm+BqrKKg4sWw04x7ifouY=;
        b=KDTHcUjh7LgoxOkPrkoK1I9RuOAl4OAhKfealjOJ381/qsIyyMJfq3dLdUjfzDmHZS
         PACtTqztKocVZqHkEy/akoViFEc7aBN78adt6PQErjT7NK54CWPgsAJj0tW79iQX0kwQ
         41aQ+SlP8Sj9iRm/VWjH770eJyqLWIt3EdzJdac/bzZp4IVKT5n/OTISSHVsONnXrw3N
         trSUdBTy6Jg853YHnpZToXZTiy1hoYoniZpoM7ROb4omK08lH8Ju5Uyj6oAcMrIFcHqO
         I5Iuc5aOsxbj+ZQbi8jFGe7MD0AocjoKrc9Y4Cq4l9xc+qsSevOHThfuD0RwkJ0UClrF
         YAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777827172; x=1778431972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Wottvwh2F068u0uO4a2RGm+BqrKKg4sWw04x7ifouY=;
        b=gKvVtyP1b3hcTpGVDiIlDJl0pxobpFaifkL+fPOqNK1MRNLpxDmok6LWzrhGGOu3EV
         Z0DAWqTKF9FgXUO2w10ceapEeHyVF0HWI+0kG0NI1mixOB+5l12SNKUYg1Mpx3+HByBo
         OJ73qUwNavl3J1JfBl+q230gVGSWm7DU15g3UR3Ro0VIRoOuyDDplem4ZhnIF4t5i+Po
         eXKgHNo/g7VSNQlvVFpCAF3XC7sumOMSquuKi+62rqja7OU4CcxK3ANESff4vSzfxkRb
         uHehR2aP3adoN30PzQlYBYH/3EDLwmhi6RVO8tsami1mFDDQJhEL3Q9krVXtjP6gXI1B
         Osdg==
X-Forwarded-Encrypted: i=1; AFNElJ/KkcLLcEramzAe9jUGI7wwrk8T63Je/yftC3NMrUbbDn1OKurTvcnbCMHuj83nXZLB+3msjJqD0GLd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqr0vLx+UjzKgMs0fvHJUhzih4JPkXCSgElFwlB82Z/9Hbv4xV
	YeM1bKAlsoY1X13rA8ixye0+KHGCXR9OVZzzTLyFqWExXG/Ck5vt94fp
X-Gm-Gg: AeBDiet5EcFeOW8Jad8wTXD0B93EsmLdZd8bYGQ/bkSNg0tbCJtunbv9aISEfjjI/dY
	xFMetGzgy5OXYi09/Jg06XvNH4SNyfFW0GsLyBzaPNlh3yH8i0t+L6jl743Cu62q4Waayml7Eoi
	n6sYaSr5MKZF9DLTlzFvRPAC0jaNIW+arb/UDxpxanusdXTH7LcVcmeU6+J7yIcwASG/ke0uShq
	qb1nVagleiWUTja/ymbEpnvv6AmnnfcIdHU8YNT6Ptwru3c39A6gPUM62BXTsgbBXhif4fer4J5
	IhElbjghwaO1wmWCxIzZ63u/Ag9eisBiBTJZC9osdlKCzYB8chZ3E39PTw2Sa773hMnNYzyCUhI
	LBdy5YvRBAv/nUUtKxLHDQXf8fo6lMjZ/+tVYzewOZLjcT6qOKDu6t+ccaLy1lpvLWQUg8PQcHV
	zxdpJsAeHL6Ybk7CoGUP7Vc/s=
X-Received: by 2002:a17:907:3f8c:b0:bc1:606b:1198 with SMTP id a640c23a62f3a-bc1606b1341mr133515966b.10.1777827172110;
        Sun, 03 May 2026 09:52:52 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6b7f6sm316772566b.3.2026.05.03.09.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:52:51 -0700 (PDT)
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
Subject: [PATCH v3 0/2] input: misc: add support for Imagis ISA1200 haptic motor driver
Date: Sun,  3 May 2026 19:52:41 +0300
Message-ID: <20260503165243.215979-1-clamor95@gmail.com>
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
 drivers/input/misc/Kconfig                    |  11 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/isa1200.c                  | 535 ++++++++++++++++++
 4 files changed, 687 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml
 create mode 100644 drivers/input/misc/isa1200.c

-- 
2.51.0

