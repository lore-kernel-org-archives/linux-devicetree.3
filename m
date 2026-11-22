Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330672;
	b=3q1vO7Mg7n8JsE/grrrbxDhEVwSXsIPpM+b1/siIQ7Ge2U4EB4XZjYc3sdym92U45/fx
	 08dvzk9f7KP1oNUU85Dsoa3rjMQK8GidcVlrSN3eRyq4ex/AEJbrm/ZHdirN7Esi3J57O
	 vzUwtaCQxvwO/VCJ4HlSSJ08CBJBTRubkt2DvzXvQvQm/BVaC+xfrwjsQudHimdGjRMBg
	 MUO3Ct7KISTbac9WeVPINFhiYUITE0Q4N/GwPpRWfPC7zslBtJye3uvBDgPcumPHXim5q
	 ehuk7vwtm/8qkWDBZ6GUX1IR6cbLdx0/YKu9pF+FUohTzMmoonOk6HBrBioGO4LLHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
	b=pKpQ+BmHfKN5Y7+zfeH4QzCGvTR56Biu6cL/8acFZzoB7z+/j1lZYHj+ktGTjhgBLgYT
	 76B4EEkfJkGOu8bXLEQpalonVkgSVNuPl342AFKURVOYc5GX1DH1WHgv3TbYu+wINx5q+
	 TZcFXNrwIvA+MTpyPj90nFHmGhM938RJ025L5X0dWl/1M0o5i+ULlYBJ1d4asm/8IN0bU
	 7t5plK3jsU0L/akBOEayGxaCAofCL741ieoKMoQmQYi6om+sjy95pePvn3O0ap+outqUB
	 4DL9PUxMuU2BfHwFY+ixjlwVYXC9340IgcNUmk3nk4osEW01YBn2Yjqbp5H0DejL5PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrCWerjj;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924E606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9924E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrCWerjj
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f066274caeso4623705ad.2
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 22:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330671; x=1795935471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
        b=RrCWerjjKeBMc1l66n8wiglAZgNNPSW2pmVfBx5+eMaeOi61YGftujVGkNrqoTlKxY
         mCWux9XZysNxG5aUT/i6Ww8SBPOviyTjDiW/wq4Mg37rVuxPCxDEJZySXajHC32gEXJQ
         mnltWemiT1/k22w3TUd3SSFYu3Ddy+HNFhgervGMewFLAxFk2Czq1eaXvlOzEsW+ZBhf
         PtWdjqVs95VU4pRSlv1F6pllbWP0oS713d7hG4O2d2BSkknMUeKapppzFhPVSLYDdlBD
         XzPOfIS6Ro53H5L9xk6l114J5ivN+Xw3l8zNutQij3kRqrhLDKtsH2+SroTUZ8Y/bnlT
         jv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330671; x=1795935471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
        b=kpLIWPbgjAPxH3mq746m00G1TuR/8W96BJBvNymwWPXlzRuRKZD/E6dqbQuJNqd71k
         hK/g0mocj1JGZattVS1f6rhIY2NxBH5i8hMzkA5FmtOEjQf7IT6DOGMllLI7B666etMF
         W9h8EPxOSIjHuBupP4iQN53nF3BktuSF5LssL7kju4HH539XRMHCgOVSZu0agAXNxWpc
         fNY4RuIaoCLeK+0RgACESAL+APds3YbULmpw1mLFr1oiMV2fkj/+uglEQf4lbdc/FRFk
         9qZDIc9VR4enSUqDls+J2OTqCEQ3I9JFZ8pwo2XdZNF574AiYXEmUTMC4TsBTgFyFUFl
         dkMQ==
X-Forwarded-Encrypted: i=1; AL+hErEZYe6sh3ef1+mRUKhzdyrvN4F8BJ3bYzdia77WFnOAydorAuz5RSQWSpyzF7eF/y3omT8z1EvBnraP@vger.kernel.org
X-Gm-Message-State: APuU4Z+FfRgDJAUF9W6CkrrAra5cV9kuQpFgFvmr3Ma9r+bhyqzKBa65
	QHeimmcM0VlJtNtsVH4i8YESV/r5N/GD9ZyF8j2eOjpuFKYCD4NdnK7/
X-Gm-Gg: AZFdTZceuhQsLMB5pxrDt+o7ubEYqTC2eYyZGdI3PQkKO1/qL+yLM8B/ZhoHC0NlKSb
	dnZz5wdrVqBjKNSqzJjOFz0N3TTrY7OvnNFTkwFpjRew4T/W6E0A4Ccw2LgerFkYPmucci8M5yj
	qDW8BTBz0Z9N+sujEYh8l68+LD3Dxp453CMrSszRdpzQJbRY0TFqdltwIdCkqn/YOjCryORBK8d
	m+Ytz+epnyPdGDfIFC1Mjf7P0UPEyGRkWrEzX1DR0LfLqNPuk+L9b2Krd487YMnvYnK5H28cpXY
	+b9LKsk/HPbBpUyrDT7tuY6tt6D7ufxRGOdaiwQC23D2HV1KYM1cy743gsQIYuIXxdMQQYmDP1x
	HurAhENe7gM2EyjvqDYfN+CNVwbOvRJRhX3iskodnYbm0dMly2HgbvQiqwXf2YWw08BdfPiDT8/
	/I+xFJ3a8irKXXbs/ZPe8CNzwSiba1KcAUx3CkBaL968GP9zYFrTK0xroFroVIPlq9OXoqokVm9
	/byiZdy+yRbF4A8Xt81gXp8XoqBJlsMeBX2cy30/8tgbkncXIMRQwuimgeWq6i2oYDS1IA4AlL5
	Mqzjv/7AanvlszIth6JALvgA1yUTeyvHPIhoUwNUV6bHCgLwNjOi
X-Received: by 2002:a17:902:da48:b0:2ef:ddd6:716d with SMTP id d9443c01a7336-2f03f18fcf8mr80685675ad.24.1795330670778;
        Sat, 21 Nov 2026 22:57:50 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:57:50 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Sun, 22 Nov 2026 14:55:19 +0800
Message-ID: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog integrated on HiSilicon STB SoCs reuses the register layout
of sp805, but deviates from the standard sp805 in several ways that make
the existing sp805 driver unusable on these SoCs. Add a dedicated
platform driver for this controller.

David Yang (4):
  dt-bindings: watchdog: Add HiSilicon STB watchdog binding
  watchdog: histb: Add HiSilicon STB watchdog driver
  arm64: dts: hisilicon: hi3798cv200: Add watchdog node
  MAINTAINERS: Add HiSilicon STB drivers entry

 .../watchdog/hisilicon,histb-wdt.yaml         |  54 ++++
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |   8 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/histb_wdt.c                  | 287 ++++++++++++++++++
 6 files changed, 365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
 create mode 100644 drivers/watchdog/histb_wdt.c

-- 
2.53.0

