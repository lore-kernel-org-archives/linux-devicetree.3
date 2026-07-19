Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8302123A99F
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784438590; cv=none; b=s9aMyHtxoGMRO0Kdm+SRcRyA42y8ccXQ0TtEWj+wHViZjhRpXU8jU89hOTvDY3wxrxVbWnkWwyLV6DhRy5Laly+b4SBvTpG2SGXKKDh6GYQ/b+/AoruSrF31Iw5faETEybq6+xiMNPvFap/Ar8k2Xa5lOU2VGQiIKA01mb+ceF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784438590; c=relaxed/simple;
	bh=wzG5n1sSiy8BSbirHoZMIcpe1yDKqvIcLp//a8GpMqA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BdzYvAHl4CYCHfN4Tk+AeaFBXu6j1JpwpKf9zh+XtCPOtW5xf9VE2I1cP3v7HLSFgIojj4LNC9WHjbo4A4+zPFGIECa3vbt66BPw7DTb9yEUdhiVX8GTZVHq0y0HsvcftPmK/AgsP0sJfV0WTzLRH7H+7BnPcL9G8oUgEaFrHuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jan6/PYo; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jan6/PYo"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso5318103a12.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784438589; x=1785043389; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lQcYHP742JQAyp0Zxye8wRRdYiQ3akELTcoPNLHuwtg=;
        b=Jan6/PYo/7iUoGOyJ2+okjh06jfPYfQ2EnuXxh/y+0kydIbi9vHA/1LtX2OvyJlA42
         NqcIgVQ/l0SDOdVFy2+puKfExeG3nBalceBfFWihd5Q2j3FT0mCjA3bnF31GaSwPE72N
         ZQ8+0wlE0JuT1/twSkSW3r7i3jQIHRiTEw472khLy3E6iIyG8nkfyd7O9ucBNd3tIICj
         d/67RgxXOfbfYnXsYqorlOoj5q9PWuSU5hGySpBwJlAxFGvnBcZ/PHJ9cPZPicraQUbL
         oGi+XlgLk7LqkBnx88C93UwtEUTU+v3OvcuUJdhuvBQFplBMXIHgsx/Jbyxn55UWUlsj
         jVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784438589; x=1785043389;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lQcYHP742JQAyp0Zxye8wRRdYiQ3akELTcoPNLHuwtg=;
        b=o7iUQXrxAECWr02bul0IIeillB8gxLZ8qAPwhMFdbn1sHdb9Fa2SBYM4WAIj8IGw2h
         hTOXNEYB88rsS7IxcqJ8VRDZkXgqbLEGEF01K4AHqYOzvmKPXM/OsLa7pqnotajTLDmN
         5ZP8lX2H0Dy4yw5KwnBnkwhqAfHx/uiOYyDhf352gGJQhXcVd2q2nCHvF94zuOSplLQR
         feFqFXhcujCQHu60fHqt1S0iMDkgJL97J015gxuwRpZQssYgNixy+po2w6i3fSDGnsUs
         B05gRnayx1c2A7PE/nWNb38UMIA2vJZdHbnM6MV/+SyiTXirkz/K+5oFpdrs04KCVhG3
         mFAw==
X-Gm-Message-State: AOJu0Yx+3k1TMLccrr6yEA2dhUIE1bv8bCi+a4fF7d/FZmlfF5eDDjvw
	5ducLb3Fc49+Zf4NAl9bA6MtfkRNYcSKUXPsaBdFuwx/LgVegvBVz2X6
X-Gm-Gg: AfdE7cnuaLu0EkZLkW4aLrschCAf8MXh40dRbP/UwMnrpChQsqkWfYvgn4UuAhq6Hcb
	F7Xj5lDHZSn+c8ayGWvPXNCY9R2WRrZR+tCQ5KKnVAih431Sw316/PlZ6Awi4cpNtudqAywSTDv
	w0XuVSmembWszLAQxCLiWceKD5SRJ/BCMck8EpMln4aBny2GN2QWxfgw8Br7QOxkO18PTV6PeIB
	XquipvEVLQy5yLj63HhQmF08hvcahJgPcoR44uB8fa1zlF0ls3g6UdvIr0rZxZh2Tyirtq2WHBY
	KFi3hdpNj5m+kmBYlk7CcfHQoRSQO/npDTM0NvvfVYAkLkAm0aMiCcLlVWmR/AByhduLh1ZlqVV
	oDy/20baerRbj2jGfbxTjNYcUymLAM8c7WOCgDXBXSnarSkY7DBVmtgMOQfOhlIE8qfhOai4kOZ
	5QG31mLPX9J8YwDuHpPfWYkFMoW2OLZBDzQl8nAZXFyRDg7szVq36gmTFfRUNVpwbPqRUWthT0a
	RWN
X-Received: by 2002:a05:6a20:9f8d:b0:3c3:ad17:edf7 with SMTP id adf61e73a8af0-3c3ada267d8mr9727040637.63.1784438588669;
        Sat, 18 Jul 2026 22:23:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:431d:c6bc:133f:2959])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm25950461eec.15.2026.07.18.22.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 22:23:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/3] powerpc: 512x: Convert ADS7845 touchscreen on PDM360NG
 to device tree
Date: Sat, 18 Jul 2026 22:22:52 -0700
Message-Id: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxfXGoC/yXMQQqDMBBA0avIrBuIsWTUq5QuNJnoCEbJtEUQ7
 26qy7f4fwehxCTQFjsk+rHwEjPKRwFu7OJAin02GG2sxhJV5wXrp1Wrnyur46DIIfkmoAm1gZy
 tiQJv1/L1vi3ffiL3+X/gOE7wwndQdAAAAA==
X-Change-ID: 20260717-ads7846-pdm360ng-ec7ed9f72f82
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Anatolij Gustschin <agust@denx.de>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The reason for this series is to remove support for platform data in the
ads7846 touchscreen driver, as pdm360ng is the last user of legacy
platform data in the kernel for this driver.

This series converts the ADS7845 touchscreen on the PDM360NG board to
use Device Tree bindings instead of legacy platform data callbacks:

- Move GPIO controller capabilities into mpc5121.dtsi so all MPC5121
  boards inherit proper controller definitions, and remove redundant
  local declarations from ac14xx.dts
- Update pdm360ng.dts to use "ti,ads7845" with pendown-gpio and
  interrupt-parent referencing gpio_pic
- Add "ifm,pdm360ng" to mpc512x_generic.c and delete obsolete
  pdm360ng.c.

This change has been discussed in '24i but I just got around to
implementing this:

https://lore.kernel.org/r/ZoNHLjmSvCN12vU5@google.com/

Note that this should compile but I have not tried this on real
hardware.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (3):
      powerpc/dts: mpc5121: Move GPIO controller properties to SoC dtsi
      powerpc/dts: pdm360ng: Convert ADS7845 touchscreen to DT bindings
      powerpc/512x: Remove pdm360ng platform setup in favor of mpc512x_generic

 arch/powerpc/boot/dts/ac14xx.dts              |  13 ---
 arch/powerpc/boot/dts/mpc5121.dtsi            |   6 +-
 arch/powerpc/boot/dts/pdm360ng.dts            |   7 +-
 arch/powerpc/platforms/512x/Kconfig           |   3 +-
 arch/powerpc/platforms/512x/Makefile          |   1 -
 arch/powerpc/platforms/512x/mpc512x_generic.c |   1 +
 arch/powerpc/platforms/512x/pdm360ng.c        | 126 --------------------------
 7 files changed, 12 insertions(+), 145 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260717-ads7846-pdm360ng-ec7ed9f72f82

Thanks.

-- 
Dmitry

