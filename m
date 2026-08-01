Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807E27603C;
	Sat,  1 Aug 2026 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785559841; cv=none; b=mUwGw2FHituyu+Vt7qGYXV7o6mlbBGMFzoWJIyC+fSVng1ecr6YpJ5/+DGHJXbSxbt2ajYKqybnWAH1lS6RzjIuG2eBKogrVNZyi3b2zw3Mqi9k59Z49bbjr9R7f39uDjtg1eiNbKxVSxYbawK4LSL9vOW+TI0cRM7nwwptLO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785559841; c=relaxed/simple;
	bh=cMno59+tZNh/qkgtLsDGypFDDFcarBvR6jbG5LEIkvs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=LhoGDRmanRIZWfj6uIjL6YB/ZyOAIH8tquBOUs21wMe92/j97QRcYVtIMhk5S2ogcFshbPp61MZJPj3oMiYeL2KKrZ3NxML/318hCQH5rpvVcPab7qCRoG5sQxrXIriBcE1spEYtOQAxe9L6Y3uVOxeJxrvnQsq3KO2ZsnKTX0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VLDdCeQW; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VLDdCeQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785559833; bh=+G1Afgfgm4VomeHyuZtbW2kKbV8N7tbkp7LK+TL/0q0=;
	h=From:To:Cc:Subject:Date;
	b=VLDdCeQWVNy70A7P4y5sWt3bGgpQR9GBKWgGBsg8vn3X3/2yUlkaInUK4bMsnZTvP
	 eR4qxgqDG/tS+JNUZ2gkNGr3CPu6asvPx9N8b62R5e3V4BQ02QIITWTL0fOQIUY2MR
	 xTGZRctN7bnhLW0W9hpaeJ0mBvbcCF+lxcmgOfhI=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C9E2EA5C; Sat, 01 Aug 2026 12:50:30 +0800
X-QQ-mid: xmsmtpt1785559830tqo0hg88f
Message-ID: <tencent_4141B315242524F71B028860294CB1315E08@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2VA5qCdx/+vljb5DbZnndH2i5LtgxlE30kG+zEmdKivg1PTXAy8
	 JKQgc11w1/7Z2dhUVYCIfsnsZNBpvCFRq9v2VurKgW2qIDYY+odxFv9TW9qY7almkKgpkhP2b9sa
	 BeGOIcRqd1TEVNqZQhr6EytbcyfyO2l+Z/SFFq/jy9QSDHsX5K9KVbItCwrJzz73Jy9NnXSL5kKr
	 WDxmZzHC254RppXLNDqFt1l+FpqRcm/uqymxLY4qq1FULEkoSAaHK5O20ZdLB3DzWvNnH0mZ6Ob4
	 yud3iCg6VK5f7gn0IOEj4heeYISYCdnPWn7wwtMMECNhseQN3/KBLeirtyt6WBz/vOzna98vrDjp
	 2z45ed2Gi5lZ9r/8LTtvcHLXa9pAtCV9h6jZEgIKiR0iuyXgGByQt6MWOuq+zoSlK3q8k4Z0JkZZ
	 ZNULeHkEaYFnGS2OTaa0WOpG3Gg+9yNwMerOFK77bjx5T9tuCQeIOYm4It6pQII2H9Owl6ves7HS
	 IJUy26c+FrTR1boQvCnNk9ObAPOZ1pLu1tLukdGyvRZrYvYj0mOfZVghm1lo4/g9TJT1KVUYUJp0
	 vOs1YSz9Fo5evod6GDUrccrRoKGY/WRbWRSrzTjQh57tL6pkNgPAfOY5Ina/DZF08YDB9vkPYTNw
	 VK5a8o/t0PEaQtH9CEpT4kdVbzNv4/mw7zKbd8zJPSBk/PYu+eB2UcO5iTehqZbcEkl5jE/XROwA
	 aKHGy2DwsFkoV9oK8EmNM5T0nUCWRhXunTq74Zu7t324veLL9R18tsvlA3/eRzUH9r04f3vMK3G7
	 VvXdiC9uM15ZNpKEn1oDvtNfkO+Sd4Sin1AcCnDg2pC0dTBUiq5GE74Kjk6TpptMENuEcOa+7c31
	 HAkYGrYVxOmB7S7Pw6P5mlVMPdKEaXCrT1L7z8ioJqBOGLNw/J30ORiQfmGTDkkZ/XsRI0dgmR6W
	 lLG9siP3hH4hNjeptr5FILpCykcW7Z4UxCIamYo8QtaVgREvGxb1G/Kgj2BmmojevZUZ2z+Jrdj+
	 tviK1psbq+awt87VaUULamWEcEb3JzP+HsTv+lAJBqM2IrrbxN+wfEd+nOwdE=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: Fix fan speed control on LubanCat 4
Date: Sat,  1 Aug 2026 12:50:22 +0800
X-OQ-MSGID: <20260801045025.67512-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The EmbedFire LubanCat 4 drives a 2-wire fan by chopping its 5V supply
through a MOSFET with pwm0. Two problems prevent the thermal framework
from controlling the fan speed:

1) The PWM period of 5000 ns (200 kHz) is far too fast for the fan's
   internal bulk capacitance to discharge during the off-time, so the
   fan sees effectively continuous 5V and runs at full speed for any
   non-zero duty cycle.

2) No cooling maps bind the fan to a thermal zone, so the pwm-fan
   driver falls back to the highest cooling level at probe time.

Patch 1 fixes the period: measurements on hardware show that 10 ms
(100 Hz) is the lowest frequency that gives proportional control
without audible coil whine.  At this period the rotor inertia averages
the switched supply into smooth speed regulation.

Patch 2 adds four active trips at the vendor kernel's original
temperature thresholds (42/55/60/65 °C) and binds them to the fan's
cooling levels.

Tested on rev 20241026 hardware:
  - idle 36 °C → cur_state=0, fan stopped (PWM disabled)
  - stress-ng --cpu 8 → temp reaches 48 °C within seconds,
    cur_state jumps to 1, PWM duty = 3921569/10000000 ns (39%),
    fan audibly slower than the previous constant full speed
  - all four cooling levels distinguishable by ear when driven
    manually through the sysfs interface

Based on Heiko's rockchip tree (v7.3-armsoc/dts64), on top of commit
6d9430d58714 ("arm64: dts: rockchip: Add EmbedFire LubanCat 4 board").

Pufan Jin (2):
  arm64: dts: rockchip: Fix fan PWM period on LubanCat 4
  arm64: dts: rockchip: Add fan cooling maps for LubanCat 4

 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 55 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

-- 
2.55.0

