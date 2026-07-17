Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E0F3CAE69
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301299; cv=none; b=KnzQbRcW5CEezQwx5LKJc6CJgJPETrWnvsT4NqWA6KZz7nhU+dVl72BjmJD8ttaOZTnWbwGMiIW5TcjsZ7eboEpYznmJuoo9yB+J8RXW3jnN3EUcTR/Igax8mqaKRxy09HLDPcTvAmVRVt34iOeBP99Gco1VLv7vydDxAYILUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301299; c=relaxed/simple;
	bh=5H6KlYQ25zCbLTb/PiGglHhuy/CNYCwLIU2em8DjnEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WAY0017qOCJIxjBSgKGDsfXn8LWdNheK6pJpX33hNwXyBIQD7zQ/ulQYHEf3TUtIJDRXVHhfFe0R+jBoaVsRlt8HMsqpXKZ+u/D4LgO/1Zlrh3G/SfaEwiHQ15XLuXpbkfuZqkbMe1f/Bh+Zxb7WNkJCchLLCGv/eG5jl6uqbuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bl5UVuPs; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bl5UVuPs"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso11785964a12.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301296; x=1784906096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iCdgU2Mi1ltlF6Zu07ake4LF21lMQp6/uBwdAs/1H8=;
        b=bl5UVuPsJQZykHDrC0vSuH6es+lL9gS0CYQwL8FWrORzle+xxzxwJq6O68P4ZlOuSD
         t2NZxX+tAxpPzmNfH1fQiNyKLJXQHpOO7m9J4Id74IOWjAEPtl1oWBbOgIruWAGhwOHV
         jomC55Pcmsyu5S8B2BfceLuIKZOOkL/osXCsiE9oLyKPBbFmVhVk/wonnD4N2lJLNTLy
         c8hftbYj3qdV972OXMu66ZL3Q0mC6o1sXlfJcNxiM42W2NDsENp1X5VWDJLCU2e9OksL
         Nl4nFdHdL67fR50N+CteBy1IkLKfrqqmuOuZbYe11UNazP7Do4CRRG1sn9imm5QYb8jt
         o3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301296; x=1784906096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iCdgU2Mi1ltlF6Zu07ake4LF21lMQp6/uBwdAs/1H8=;
        b=ch2P+fAQzf8wx5IjWnZsp9TpISNC2eyRWmLEuKy7Od/ueR2MSu+V7M9rKkvQT3hzqc
         AAyXgkyawDvEplof6RRpaq0nmzcghz6Ib3AgCiawRMn4YVYb36+25hZr3YuBHq/Dl600
         dSFXJullj0xYI4Trd4lsFlRfTdLYzXFsPcIVM+ariFy86v/Uhmw39SHkopXgZoENFKXE
         tdHrHqS8l9ovZ8AtOayZgb8qy3Qt+ZgulLx4RovXrR6xLNqWY9sjnGThXyseG0xhyC4A
         U1DE1DARtMWDyBsh9tDMZuk/bTooP0DiQKWCt+4y1t9rEfBwC+2bUMtwxFemrDWTQAHA
         NP4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrr2aE9HeM5t1XVK2Mlgis6h64Z9QZQdLTK3GhQAc5hpD/5mkeN9gvbQJS8+2vi1xSfmLb03VqpzvXm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg9V7Ht/dyDlPIMGGpOcQZ+UTBuCph7tiYQXAjlAVcS97sEnrv
	umjnDbH/Gfophcc3dQl81dxWRbtIGNNq3UTKTef0+xUKUzt+XS9Q/35r40hO4URC
X-Gm-Gg: AfdE7clCF+cojWrH3MG4zTesijwYjkrkZQ/Ru7nZwTLWdOXoPVMz5TaFN/Fp/UOoxfb
	6SNmuG2sipFzzVV9A+AJ3LsP8/SvCzn3NwbMPtY55HF9l7xsQwCLAIf1wOk2+LDqrF6538dsezK
	u1gHOU96NBoQsaGGOsNHSw4yoqcNEsTNwJI6u7C/3IFv3eJfQfx9wHODpJTXqiRqHGKmbRs5/FO
	c/A04ygxs1mPtLrtIGL5WL5wcVQ99QYMMtNLUruW+6XGkHsJu/gF6jH1CrxirPXtMI+b7JHThcD
	rD3qs3GoJFnIHM0EUJKqzz9C1qWQ1eKKsvCY7GpoUU7vhx6+2zZNZiKUb5ppMpuNW1qqTzvKcSv
	PTf4nk78ilbniIn2427ts+qEEyQrCOuqQdCuqUnaAMJQsm+A2OyW6UUdkd3S77IUCOrqXKgeVew
	==
X-Received: by 2002:a05:6402:4555:b0:698:6620:d988 with SMTP id 4fb4d7f45d1cf-69e6528189bmr963155a12.15.1784301295646;
        Fri, 17 Jul 2026 08:14:55 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:14:55 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/7] Properly describe mt8167 watchdog and mmsys resets
Date: Fri, 17 Jul 2026 17:11:07 +0200
Message-ID: <20260717151134.678839-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

In the first two patches we improve the description of the resets for
mt6589 with values obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset header, we add constants for the MMSYS
resets.

In the 6th patch we add a node for the mt8167 watchdog referring to the
new compatible in the SoC dtsi.

In the last patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

Luca Leonardo Scorcia (7):
  dt-bindings: reset: Add MT6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for MT6589
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  dt-bindings: reset: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  arm64: dts: mt8167: Properly describe the SoC watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  7 +++
 drivers/soc/mediatek/mt8167-mmsys.h           | 40 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  3 ++
 drivers/watchdog/mtk_wdt.c                    | 13 ++++-
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 7 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

-- 
2.43.0

