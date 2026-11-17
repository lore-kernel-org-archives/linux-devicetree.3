Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919191;
	b=hd4DGYh4CQziEDiCPT33skuMLkutcA3ZXY1zx2V0Y8oHLcwznX8WDZQQbe/9rp4LJS7I
	 5IVqVnqnIo6ekiRSLkcSEEUqbiXB62f770k+lCarrkCnrXjjjCk1Xm3WjE1sUZUCvXpv1
	 vtDMTtB2rnPiz2VDqFTzbW9X7qDhVbB0kN3QeWmMNRS3jW68I+GFPWS4VPaH7E4U9+DSE
	 EmTdosP1uq6Ya7yUJKrE3nxYYlCmwfiNLhgS/lvs4EyYLbdhPrt7xlRNOMbGuLU8RmBhu
	 hgLP4tZ5LPODApSqg/7zpjPOXdwgJHxlzH2sQqgL2eSRk83j40fjmLtEl28MjyLajHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
	b=O6T5kUOr+u/Y/1VB3zBQhBPoQtV8DIbbISy4dnlaOPpk0Xj1jFqPyL07gbfWKnUEyMWx
	 I4z2eb3wxvSQABBt5XcknCCTP2LxRQUs4fiTReFMat+PwccDkh9eXu0KT6oW++gSNpy5x
	 UQvSD5E3ag9Xs+K0yBAd6jVlHnIW/0LdPsW+F8O98N4PRuWeKWrBLrV99VFq5PzEJUzXl
	 27f6HYhCPvmvWxtivDJpiYb1Cr6neOXmJQaBuskZaf7rZXpCgsuISLa5I+v8F+Y56GngN
	 X0WkQwx3xNSeoxSB74IjxIcHH5nEwZKjSUrkNTPtwVQLUw51/QjU7Fm5zd9I7TXzNRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Om4lJDcv;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4492606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4492606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Om4lJDcv
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so30377765e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919189; x=1795523989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
        b=Om4lJDcvRTZnmDu3St2YFLuaMpP3U1G6F/IlFhPrRtbqeocCF/Dh82A8F0RIkcjYJS
         VssVIIFxYm+xPYX3l3RIOi0uY1st/9+ZuLWeF2mzpdQFkod6DqOs1aaIwvoq64K3fJhb
         B9iK/0Hvggz1k4FcxtggByjel1j0AdP/fe+JCj0N823NP1X4gwJRYMACpM4Dw+pdGQy1
         HwDFDYJobvjTO3alxk7xvANzObwpvs1r4SfbVuqshS2YOo5io4EZWa3Gy6wtWQhzpvpO
         3IBwikamk3jmLSdlOlub58OAvjN29ySqdaW2GtmUaNNT7TvPfUh8XFVftbNkpTVIYnW3
         FIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919189; x=1795523989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
        b=N76O6HnbSgYK7CZwVQMTIexFllcPR7WhpwTEb8VhZbGG0bREdz7Atlt3hv/8KANdxl
         in+afcNHcNnW+2Rs3Wa4TeIUwXc2jQEQeZOuaSxBN1hn0sGJSq0RrK3PIJgBSBUP27+r
         +XgizSanUXtsl+FEhgJFPuiYSXGBjvo07DN18dcR/3uJsIFs+yr9Aj+pvJsAKrsBjSwX
         qWCXeNK/XP0Pcqs3TYLObEOeK4lRrdknQ7UHOfkG9zoKweFsjuDcqkdAGBbfw6bwj6z2
         Xo+Ay/yZ0rPqqBTXCnTdbHrt1yN4znjL0FS5bP/AEy5P51ZaZmVG5J61V/Wy/9BLtKB3
         Lt0w==
X-Gm-Message-State: APuU4Z80y49ucJmkbpWMyk/rxYrSMhelZRitSrxfRyDL/9AMP4ExzJ9b
	gwLCjuh5AcB0krQCVZ2vEDK8ufIr3ad6HFUU/Xq0qxz89EyiNeX0MI3D
X-Gm-Gg: AYBFou0rwalLYZcDXGdafCX8+FTSnPowlK0KW4aIAcsOF3DEljjmZL8xNHMsvtc5vlk
	7fKy7ZWxQ12dob2AG3WoUr9ZUK41alHREuBUgI0u7cgOIYbIqWAhlY3gUtK5rO9poYQzDNspMVx
	nFns7n90wauge25W2v/Nvq8Gg2SWBtgpKrpOMROu68eOhhwNB4J393cKjp47BKG0SU3lmQBXxRf
	2cO5QOUv6yb6zNP12sPDMi6KUWCks5bVZM40NLZRIR9esAdBWHThA8ZZeLCrW2GNMQQV5+dHtyI
	61XMZtnvMBBcQXEWdAS0D6+WuBZj7MUcnMNr1v6d+55a4EljP5u0rfWLVYcHqBI/wRWU9DXmYxs
	TpG45UPo26DdpERFyl3kEB/nhG9th9Akl59Wa4BzdPhdd1XC3aAAYjiBi6gwh/l+/w3Qy+Y056z
	P7OrxPQ+9tJptRSsM3OIzthJib0mMGE2f/Vd+p4JzwYELkw/lD0zh5nUwer+UY0arjZJL3m0lCG
	IaOtx7k+iWw1Pcw2O5U8tx7hUuYC53H49mSCUeUZM9++xZKy7LS7Z6x7p9YlBqBbInIil3tz22d
	GndqTm+oUusOiRJGu4zg6MZFPVrq3wXS8nghxZUa5xazAFGGL7IQFiGevaZIUJMI05zhVw==
X-Received: by 2002:a05:600c:1c0e:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb6f452d4fmr166096475e9.22.1794919188928;
        Tue, 17 Nov 2026 04:39:48 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:47 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 00/11] arm64: qcom: Add initial support for LG V60 ThinQ 5G (timelm)
Date: Tue, 17 Nov 2026 13:39:35 +0100
Message-Id: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This series adds initial mainline support for the LG V60 ThinQ 5G (timelm),
an SM8250-based flagship smartphone released in 2020.

The series enables:
- DT binding and SoC board description for LG V60 ThinQ 5G (timelm)
- Memory reservations for bootloader and firmware log regions
- DRM panel driver and binding for the 1080x2460 SW43103 AMOLED display
- Touchscreen driver and binding for the Silicon Works SW42902 controller
- USB Type-C TCPM sink mode on PM8150B
- Bluetooth HCI on GENI UART6 with QCA6390 power sequencing
- Storage (UFS), SD card, volume keys, and thermal management
- Entries in MAINTAINERS for timelm platform, panel, and touchscreen

All patches pass checkpatch.pl --strict with 0 errors and 0 warnings,
and the device tree builds cleanly against Linux 7.4-rc3.

The series is also available on GitHub:
https://github.com/rofikkerneldev/linux_timelm/tree/timelm-v74-stage1

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>

rofikkerneldev (11):
  dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
  arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
  arm64: dts: qcom: sm8250-lge-timelm: add reserved memory regions
  dt-bindings: display: panel: add LG SW43103
  drm/panel: add LG SW43103 panel driver
  dt-bindings: input: touchscreen: add Silicon Works SW42902
  Input: touchscreen: add Silicon Works SW42902 support
  arm64: dts: qcom: sm8250-lge-timelm: enable SW43103 panel
  arm64: dts: qcom: sm8250-lge-timelm: add SW42902 touchscreen
  arm64: dts: qcom: sm8250-lge-timelm: enable USB Type-C
  arm64: dts: qcom: sm8250-lge-timelm: add QCA6390 Bluetooth

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,sw43103.yaml    |  70 ++
 .../input/touchscreen/lg,sw42902.yaml         |  74 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 744 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 594 ++++++++++++++
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 315 ++++++++
 13 files changed, 1846 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5

