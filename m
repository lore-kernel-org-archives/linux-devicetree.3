Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203586;
	b=Ari6Nb5ps6KD9PXICuCOwZ+y4g8lVxRdKTvcv/xyjNmeMzYRxngAPA0YT1F+6sqcHp/k
	 9J530xmCJBwHsI1/a7bjuh4jW24wvaChIu90AG5WePYgbKKcK3lJO2E3JKiA670y+zx5l
	 B94l3T1bSe9kA5Nwzz18VQTLsybfj72fuLo5JIWuMymLYb7hQo9OCr77JitG5/W16gAww
	 gHYr0SGtX0w2qrwR5erQis0q9Kpkz4W++11JS9BuDCrq8iu/zMCEOzWYJUYrpEntg45P+
	 hjxIoLlw86nxcCi0F4w5gAApeR5amsymRgWI3NFfyQTz9y1+hDy14cAbYfc8wGHzFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
	b=ulJP8P+e1PczDMqEKqxHONHWVQaIjfXFFjs6ISsEC9HhCYfccwK4uhcmZx4niko4wR6L
	 R7zebFGkf0bK7k486b/Ql9XQGb32tNz2d6W+fYJviVmODZXMpVKgGnnqdLvqMvEE5N334
	 mX0wyGNt5RD8z4fzqxqUjnzzH3NGOEbsytWYKkkEPYAwQoi803CWBqeEFJRq0FzQKyUx9
	 Q8CYRjld99JT+zk+qiEcwNaYM9733kCovc3vfYDASQ5ai5Qte88x11ijxQJTUAfFuUjIZ
	 uudPvcqv/pEXfVn0gVA44PUZFQlRUMqj6UePWws+jyMdeWnYCkfqa4V5RbF2HPf4bdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=To7xsWAk;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAE0606A32C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBAE0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=To7xsWAk
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a77811be24so6931625e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203584; x=1793808384; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
        b=To7xsWAkeZoR3UfNxISL00p3TDp1YKvjvX5uz1h2JKzbs+n26BJ5d22BglVMx05TN8
         qRgpa1lt8F9FG3R7QnLnWMvjKkbUObRpmi+Mlv5YwH2OSlcnvtgD7WnJBJ4UzVX09VsU
         3L2MEbtIDsUjHI0GQRvW1dlfxkO0NoFrbAcMZfgsPyAgmt4Ui099XB9Nr6yP8KBVrIoi
         sXvVrvv/+goMtM9Ps/jBN0x7TvO/zD+hrcrAqdJBleAOvJza+0ETtZorHtLQj3GdjnjO
         dODy751fzWHx6xztkxJli1i1cvJN4xUP4GlsdQ2Xyp3i9HzHjvGqbg8L8GjPvOqRv8ee
         Id5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203584; x=1793808384;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
        b=frAke0Qk13t8o5bYkEwU10aDm4/r6YQ9EvL20c1b8xjKM4HXrKDKGrhnZiySIY9CyN
         rQXZaJbhhipjtnOvCMBJB1mApRmBSeMH03mOTJ9AmWDNXUKXtMopsPCAVhL/iIEkJpQG
         XtJ7BigNgK+z0meqc5KXyQuMvauVKjz2E5twW7B7rUYob0PD0csvu3K1lXHxYW0s6WLI
         UHaXqXLohWvcENHRfyLkLwBTBIuj9LSLLm8W9f7xOFWL3bSQFppA7O+4c6a0SJSFC/BO
         fsFJmHHe0+XWofCDSuwx6COxqPAWbbptEbCsKUH9hMDpC0UB5nCIanS+opbHvNmIA1dC
         Mt3g==
X-Forwarded-Encrypted: i=1; AKwUvBzLvEtUWOfy0WHE6toecj62LTnCwMt8EueRieSN/RJ0DktaGqQW/TlIkM1GjZZnC6X5i+LmLbZZwh3G@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Bpc9RoRgY1gRW7EDCCnxRyLlIoB2dmuTVxs6fyzaIoI+0+BO
	/CWPRl8/cFzs783y3NQf8TcYRYuxg1nNhqLqDQYk+9rN6gQGedHmY9DWxWd0vf0QViSZhujZJGT
	darYKbUFEvHXb
X-Gm-Gg: AYBFou3JEUj9mUiWQOT5yq3qyIEsyRZjYeRJQZCUL9vgEBGVId3Hv4J+XMcXRJ0qMIu
	WVqWGWIzZgqYpM7bVHPh72ghznS0IueAKwVjJpu0Q0QyjcbWJhKtcGuPleAXaoTnHFIUM/Nio7m
	oBaikpk4znVj+0AILIxekkoWRQEoZKTtXXfio0V8j+bIKM6gyx9u9Cfw8tX+yEKiNmz0siPevGh
	TxZefzlnA5X4kUTCfpZzLNOI7gtjvXMWm9PJk4d7nDDvpdvUgiKGzYTOpUfUfvCEU6L9j0F6j46
	sOrAxX7X0kZkc+lg0Sref7sEN6H3+hyheL7oCm9Ly01TksZ63hl2qQ4Vsl149ryOHcVxSGEQPog
	Eg8/rOz51WYcwroqUf56cEdE9fm8DTyF6/28r5Rnt5+y1aSQ2ynDLaA+KOvJ/181CX5KzoVUZwV
	RVCyX0F2UeDAxHYcqhEFlWYIMLgoN5clf+1WxdQjX44JalO1kuKJ6UagwspLVZiTeCVMNjTQ+Uv
	/SM7x5aVaYyZz2NAcehq4Is0wDp7WTQk3AE6A/7LdPu1yJy1dJQ6cuvuyRxAohf1S2nMxRMKqhF
	xpyuy79lA/HKg+iMxqGZWKRXfBtGou6VWBnBhu5Fd8oM9lzrhXZlAjoBE7drVbzJfnXlLuRWoyX
	osxRb8jQpLLIunELG6NQViIXGAbI=
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr66989745e9.15.1793203583947;
        Wed, 28 Oct 2026 09:06:23 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:23 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v2 0/9] ARM: dts: omap: dm816x: fixes and peripheral
 updates for DM8168 SoC
Date: Wed, 28 Oct 2026 17:06:01 +0100
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V07ZhOgVpd+R+GBZQB6qMlbSUaw
 r9bMC5dnuTec2YWyBsK7JTNzNNkgnE2gdhlTA+17QlMm5gJLiRyLGGsox6AbtH5EtqHQqmgjQF
 E0eSlVhyPnWTpPXrqzGszX6ovh2dzJR1X3boYTEiS95aecN39KvJvZULg0BSaci7wwIU6342tv
 ds737NqWZYP2kByONEAAAA=
X-Change-ID: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2377;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=KPWUh12AlBMdTgY4W9Vvurzty1N3jd/W9TyN0OVcNqk=;
 b=jpFHpzmJ+Cs/Ugc/qNMlaeTbGp1SvOlBHHccwaTTgEAOwYwXAs/JkeskmNRK2Vi0n1/UsSoTt
 DbD9bv6fgUtDCFT+bcF24gpHTQ8QDlVsw8iFEUuBvKbSIFJmGbjIMuk
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

This patch series collects several fixes and peripheral enhancements for TI
DM816x SoCs and the DM8168-EVM board:

- Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
  they appear to be inverted respect to OMAP2/3.
- SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
- Clocks: Correct sysclk5 frequency definition in DT.
- Storage (MMC): Update MMC node settings.
- USB: Update MUSB node, enable multipoint mode, dropped usb-otg hwmod.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Tested NAND on DM8168-EVM, seems the pinmuxing is working fine.
GPMC_WAIT is left with the pull-down enabled where a pull-up would be
preferable, and GPMC_WPn is not muxed (reset default). Neither causes a
functional problem.

Changes in v2:
- Removed useless "Prevent USB being put into idle" patch.
- Dropped "Match up capability flags for USB" patch.
- Refactored USB node patch to use ti-sysc instead of usb_otg_hs.
- Added "Remove hwmod code for USB" patch to complete the ti-sysc
  porting.
- Using DT include instead of dt-bindings header, dropped patch.
- Link to v1: https://patch.msgid.link/20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org

---
Andrew Goodbody (6):
      ARM: dts: omap: dm816x: Fix pinctrl range
      ARM: dts: omap: dm816x: refactor and align MMC node
      ARM: dts: omap: dm816x: Correct speed for sysclk5
      ARM: dts: omap: dm816x: Update USB node
      ARM: dts: omap: dm816x: Remove hwmod code for USB
      ARM: dts: omap: dm8168-evm: Correct SD card pinmux

Christopher Obbard (1):
      ARM: dts: omap: dm8168-evm: enable MUSB multipoint support

Ettore Chimenti (2):
      ARM: dts: omap: dm816x: Add specific pinctrl config defines
      ARM: dts: omap: dm816x: use dedicated SoC pinctrl

 arch/arm/boot/dts/ti/omap/dm8168-evm.dts     | 17 +++---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h   | 20 +++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi        | 81 +++++++++++++++++++---------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c   | 21 --------
 5 files changed, 83 insertions(+), 58 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

