Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A073B7779
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161199; cv=none; b=bvZhEZjtFgFQ5wMBduMMCKn4gYeQJ9HMpqwk0LCOaPUYZNWPRWEdL57RKq6lK/Z8HecXKsRMQYRtj0u1/zeIrfhY2Vi+pX26niF1hQp+dn9Q5j3o37b+NR/ThlponfWiyMPRzqyak26cau0tq+BzL45kqzHQY5jTiXb6DCTlfPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161199; c=relaxed/simple;
	bh=Lq7eUiWFKj95v2c2sZF+v3aWLZBrRI+12OakDhzgq5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1CS98ZMa7sRPUxV5HbHZ38j2tg2tSYC2sgIrrAnynK4RVyOpC2jcx1Gtp3g5tFFipcOUQcPqdJ5E/6kWqjhLlu5HFG0RlkctStu/l77XzMt3wED/y1NFTX6ENQ55/bzP58Ks1tPpA5ip5/eCbcToxzP9mfIXp5Aa3D7LyXbDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7wsHy//; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7wsHy//"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so8192695e9.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161197; x=1778765997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPA+LLX6qYoxBmVriOaB3MiHKb8MVNqNzPi6YOAz66I=;
        b=c7wsHy//LED7pF6Jx+SRSP9Px7v6JkbXZAK8wHuptnLaHewq8PKZhWrmQskIOWBCvf
         27C/c5UFIvTADXB3kN4T/K1sYxTTeRKWt3oYFulwJNV2fjF6gjejSZNgeE+aiV2SVNl7
         FoNXfzSm/rwOoyrM7uQMm/XPbkIDkd9qK5zYt7H7vSGX/YNgTQgZlGJtPXaAHS8+o6EQ
         hz4TxsQU3K62JjZZgcHGgFNtIk4qVUrFOe17/CP9D34q8IbCGpgawKW5HlTGxUSdjjqZ
         vbD7jF+wO70FLCicE69PAxXQnHToqrMf74IMvjw7mHRTDRVNG6Lx48McGYhbEDznGn12
         LyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161197; x=1778765997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPA+LLX6qYoxBmVriOaB3MiHKb8MVNqNzPi6YOAz66I=;
        b=KXvCDCizPmkXGE1cpCMOzpdlv9xQhCsp1kveBQNTUblRsM8gP6EXdzcyiU4LSi+by1
         XAlr7hqrA05KSNmxtBHUyFumAcAfOJTKrY/8q1jIo+lt51vbzwYpVZ+4FQTxdiqCN9Na
         Kqk+112z1+cExMYzNqRIc0IbhncQhNgGWbmVXwN3R2PZikxAUFIIqtIT3Ox/9IQQ2RmS
         xo/gZyfTnwNVZsc0oT3nNHINv0nirhQh/RoduxFaZ8CysQfmznL+15cXD+sD+g6dLcX6
         Iuie5QKyirqhGSYtVi0J8C1Ws8yI3zUUQ9LD85SnDG/Jnd0gi034WvXAr8AwwhnOXIsT
         8Hqw==
X-Forwarded-Encrypted: i=1; AFNElJ84MTjqaYOX18GouF5eN43sJdxGkveYiLLBvaRTxonDFWfTSt9WXrD9reBunVwrsKBpBEvNwykF2xra@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7kmiJuAu3hBVad3QQVtCldZHQt4PEIuJSotLPKXnMguJdyy4
	paCsb97wI5k7Ou+fEgW0Hh4YZkB2uMLRbQhNDqMwUMCLsmFERSgzNk/O
X-Gm-Gg: AeBDievEH6QfgvMRHUaMEzRMCITvNXbEHRtvX4qqKJa0v7IFB7BrNB/snW6cWXgzQsX
	IP7OGi3s3FK5BadqWQC1LIcYT9gCyrt0iCxnoZzWAOsPlBYRWXweMR9GJYXj52+CaV0gzljRCro
	X3Ofj2gOdoqGXme5i0SFQzfSrHC1OCKQVm9AaLQFbjs/EMn/gnn1jaVRvsNAB5eNSKa899RTVuP
	e7gXnwrpKpWlBPiB9esdUXL2X+cXOmQE3THbT9Sa6Sz6tJ/2OOEkdUgTgF4qVZ3EHJ6sPOZobzA
	5lOnfRYjpvbTFiVFU/k1n72rCczWqW3109/rQT6TKaDm/0deZxNeLQ19+TVbGAbqV1KP9TAYEhH
	cyRyaNTLVFbGY+XH7fGKlxAYkhQrT0cOqLrlfyl2T5pQcl6u4+cbVPNEkpIAPbq3pwYNL4zxpsw
	SQILeIYVFXQd268aHwuZaR7kyJJhNRz3T+7Q==
X-Received: by 2002:a05:600c:1d11:b0:48a:7f90:2231 with SMTP id 5b1f17b1804b1-48e51f364f3mr137152565e9.19.1778161196412;
        Thu, 07 May 2026 06:39:56 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b05d9sm58003145e9.3.2026.05.07.06.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:39:55 -0700 (PDT)
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
Subject: [PATCH v4 0/2] input: misc: add support for Imagis ISA1200 haptic motor driver
Date: Thu,  7 May 2026 16:39:46 +0300
Message-ID: <20260507133948.75704-1-clamor95@gmail.com>
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
 drivers/input/misc/isa1200.c                  | 540 ++++++++++++++++++
 4 files changed, 693 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml
 create mode 100644 drivers/input/misc/isa1200.c

-- 
2.51.0

