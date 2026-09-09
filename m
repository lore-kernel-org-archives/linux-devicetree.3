Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237F3812EF
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946089; cv=none; b=Gm+tJDq8EbJp0lV6xNouslALsTL1T20B7d2kwQZjCA7vWvjfBesj8i2pdbMfl3NBuoFsNPZ2x4O3UZvbf3PReJC+YJuucEg5E9c5L3MfxcPAkNx3QS2bEcpTXTKtm37853H24VI8TcLDtXqsHJ3gaSoFguGTlviWvPJ1DkRgnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946089; c=relaxed/simple;
	bh=OF8PCIayO+wzji8v9EUyw/l+IAAzlZAHKT861ks7On8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7q6oKtUS23or7YsmB0dM0kTVL/8uIRMqgOhuQ34IePjoW9CxapRyGliNNZH63dcK77E4zTRSUVcAlsgYdz9wD9u/DFgKjsC9/IOxezxyRw+V60vT/rMYXyBwVl+aTHn2SPf9YhcEBTWrEgNN+HnWKixy8mNUzzT5v4WWUqFdQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBBf1B3N; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBBf1B3N"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-853c07a76adso5400110b3a.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946076; x=1789550876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSBbj47812SaQ+jAqx/rEDA44UrUN84Iomtwdt6boBo=;
        b=DBBf1B3NkuG+07X5r6MFPPbAgisrrrAhuttuxO6U8RRq/Bb5rR/RluWIhFd6Q/G6fJ
         vDvXcGIzoR0X3blBCmi1S0/nTureIHATBmYtPk2sIc5AaFYPxJGIVz1ZoKMpELNNgR48
         yh+qoFz4H6lDBPB8P2ezQopRQYE8FmzBjWkpjf3J0BIfdMBU9y+U8i3/LP5N5Ln5qExT
         qsct2ySuouqtqfJTlZVgN8/gfDPelX0hnFLaofRBzna3UYE+kQzBouKZxcFcrk02WiOA
         RqKJoRXxyaFyiMwroyg22lAfzvPjS6dm3NUUVf8kXHQBjjBIrKc34Gu4sPuVL10hxetD
         9bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946076; x=1789550876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSBbj47812SaQ+jAqx/rEDA44UrUN84Iomtwdt6boBo=;
        b=nnCIKDk7mAMu4Cye2IaBfvLFzqeMBOYV1nw7gfdnVuPIae1Phw1DDd/2OlXhj2O0Nz
         IjC/VNJr8tmCa12C3a294Mi8Gc9sced2t4zQrBPbiCuOqMMtPoIvgTFI0yY4SlqWXU26
         /sOZIOMplwqy8oYWA4tA55x7eJhMkBOVrcjuE6QP23Yj6HoKDYq/qJZN/yIpfhKDzp5q
         /xUUgg3c0FzP9QSOa0ehDO3yiOpH8FjhuyNawtYh/Iu/VpYeAr9qpwnTZN5SpghHEJjB
         Rvys006I9I6wlU3gmPqwjHk35DvMI0qgJGcjhFB/4z8p71JOvNbLbLlUQ1WCYKDQ4CIp
         AyqA==
X-Forwarded-Encrypted: i=1; AKwUvBx0qyXzVV2Lg+Qu52IfD75SCN1XxIJmwIap7Xx21XDni/zfPLoQ7KkhSYKAkfcvog7RDfd+crig4z+/@vger.kernel.org
X-Gm-Message-State: AFuF++l9JZGcYc5TqZe2ui+xjMKkmOX+Lofhjb6PeBE9z2EpcvyMjfgS
	sSq6GkXKNXWRT/NeXicKdrZSpZ9W+1rdTEnVkADMLbgwIyizDWQXOeHH
X-Gm-Gg: AYBFou21f4CCb/nIcNbvryN3jgH5Lqch7cNTL2Fe/728hxjG7kia79hOeZu57VdHShz
	Xz7ClifcsR4RR+2ljB8W7ns0ca8fpdfVBOEQf5zsMnW7SKqw1Am1qJnq8HpSoMei0ea0OMVlMz0
	PzntyjT2HwKnUWAUW84rXLiQQYfLW6dFRJLBpQcNji8traFhLIqVkg7rQnwaICM8ZV3NFMztrJa
	ppmwnsTh4y8onqNsKxSDYpxF8rAQu/BGtG6bOwh6X/OS/mAOA5t6BCf9DswbMgg+GG1kt93QoHa
	QjsHWED2ZR9Txo9Ewtl1nOjkISjwjIGs9juido7z8D6KJjPvB4VtoZ+CZ5ZOOgR6KT3H7QEUCRp
	xbXZCYz3bF2MnurZbmSrQ576z6laqrrBt/wrYoqm41HUWkAMIzLXmeC1N42oc4AdY0PNfAo2x3N
	/pkx+4eJ2c3iZSI7z/cCcenlA2zM1Wj9qmFnD7njZQ1zLiPqFah2M87ocC2ZXpuGDlb73V8v0Ag
	fuycB0L1RhW
X-Received: by 2002:a05:6a00:398a:b0:857:72f8:dc94 with SMTP id d2e1a72fcca58-8616947c104mr46288815b3a.21.1788946076251;
        Wed, 09 Sep 2026 02:27:56 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:27:55 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Wed,  9 Sep 2026 17:27:25 +0800
Message-ID: <20260909092728.1859-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sent as an RFC: the open questions below are about where this belongs and
what the property should be called, and the patched kernel itself has not
been booted on hardware yet (see Testing).

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. U-Boot reports
the result as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, and describes GPIO1_B5 as the backlight enable GPIO,
although the vendor's own backlight node has no enable GPIO. Nothing
therefore releases either line at power-off.

What was established on the board is the sequence, not what happens inside
the PMIC: the shutdown sticks only when GPIO1_D0 goes from high to low
during power-off prepare, with GPIO1_B5 low, and the shutdown bit written
after a settle delay. Leaving GPIO1_B5 asserted makes the board come back
up even when GPIO1_D0 is released correctly, which is why the backlight
cannot keep that pin. Why the board powers back up in the failing cases is
not explained here.

Why not gpio-poweroff
---------------------

gpio-poweroff drives the line active, back to inactive, then active again,
waits timeout-ms and then WARN()s on the assumption that it is itself
performing the power off, and it registers at SYS_OFF_MODE_POWER_OFF. Here
the RK808 performs the power off from its own POWER_OFF_PREPARE handler,
the lines only have to be released and left released, and there are two of
them.

rk3188-bqedison2qc.dts does drive a pwr_hold pin from gpio-poweroff, which
works there because pulling that line low is by itself enough to cut the
power: the board is gone during the first active-delay-ms and the rest of
the sequence never runs. That is not the case here - driving a line low at
runtime, with no PMIC access at all, left this board running for the 10 s
it was observed.

Open questions
--------------

1. Does this belong in the PMIC driver? Releasing the lines inside
   rk808_power_off() keeps the ordering against the I2C write explicit and
   needs no second handler, but it does put board level wiring into the
   PMIC MFD driver. A separate driver registering at POWER_OFF_PREPARE
   with a higher priority would work too.

2. Property naming. power-hold-gpios follows the <function>-gpios
   convention, like the existing dvs-gpios in this binding. If the binding
   should describe Rockchip specific board wiring rather than an RK8xx
   feature, rockchip,power-hold-gpios would be more appropriate. The
   vendor DT calls these pins pmic,stby-gpio and pmic,hold-gpio.

3. Should the DT also carry a pinctrl group for the pins, as the vendor DT
   does? It works here without one, so nothing untested was added.

4. Dropping the backlight enable-gpios is required for the sequence to
   work, but it also means the backlight loses an enable GPIO it may
   genuinely have wanted. The vendor's backlight node has none and is
   disabled entirely, which suggests the mainline property was a mistake,
   but nobody here has the schematic to confirm it.

Testing
-------

Tested on a Firefly-RK3399 (4 GB, RK808) with the shutdown captured on the
debug UART at 1500000 8N1. A run counts as "stayed off" only if the
console produced nothing for 150 s and there was no ICMP reply and no USB
gadget afterwards; a restart is unambiguous because "DDR Version" and
"Reset cause: POR" appear on the console within seconds.

The patched kernel has NOT been booted: CONFIG_MFD_RK8XX is built in on
the test system and a full kernel build did not fit on it. The series
compiles (aarch64, W=1, no warnings). dt_binding_check passes; dtbs_check
reports only the pre-existing usb2phy diagnostics for this board,
reproduced unchanged on the unpatched tree. The functional evidence comes
from an out-of-tree module using the same gpiod array consumer name, the
same GPIOD_OUT_HIGH, the same per-descriptor gpiod_set_value_cansleep()
loop and the same msleep() as this series, against a device tree carrying
exactly these properties. It registers at POWER_OFF_PREPARE with
SYS_OFF_PRIO_HIGH + 1, immediately ahead of the RK808 handler. It does not
reproduce the RK808 acquiring the array at probe time.

Every run started from a cold boot with both pins at their reset state
(inputs, low), verified by reading the GPIO registers beforehand:

  both lines, as in this series:            3 of 3 stayed off
  GPIO1_D0 only, GPIO1_B5 left low:        3 of 3 stayed off
  GPIO1_B5 only, GPIO1_D0 left low:        0 of 2 stayed off
  GPIO1_D0 released, GPIO1_B5 left high:   0 of 2 stayed off
  nothing driven (mainline today):         restarts after about 2 s

Note the second and third rows: on this particular board pwm-backlight
does not bind, so GPIO1_B5 stays an input and describing GPIO1_D0 alone
was enough here. That is not true in general, which is why both lines are
described and the backlight property is dropped.

The 200 ms is the value the vendor uses; the threshold was not
characterised. The gpiod calls and msleep() run in POWER_OFF_PREPARE,
which is allowed to sleep - the msleep() was measured at 200 to 201 ms on
the console timestamps.

One early run appeared to show GPIO1_B5 alone was sufficient. It had
reached that state through a warm reboot rather than a cold boot, so the
pin states were not what they were assumed to be; it is excluded, and it
is not fully explained by the description above either.


This series was prepared with AI assistance (Claude); the analysis and
the measurements on the board were reviewed by the author.

Yaozhong Li (3):
  dt-bindings: mfd: rk808: add board level power hold GPIOs
  mfd: rk8xx: release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk808.yaml          | 20 +++++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  4 ++-
 drivers/mfd/rk8xx-core.c                      | 29 +++++++++++++++++++
 include/linux/mfd/rk808.h                     |  4 +++
 4 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.55.0.windows.3

