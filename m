Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198849A3DF
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591402; cv=none; b=Mx1YGG70JqEu7sc1mv7OAX+On08uP75ExtYdkNongGALRhITfJToMN/jRJD747r7hA6m98y3cyp2REEBGOGIXPPvGiIxN9vvoFcfvB8UBEwZVBqwYh3mksplUjWd+9FpCLS6SVdbFgwapx1rYc2XVC9KrQdRKyLE25U/7VztCo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591402; c=relaxed/simple;
	bh=2glsE5Cmd5RFiqe/xfQlOTA4A7Rw4VEXRsQ+5/ZN5fY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rln918mSzHf33cKGlv13xvOw4QpdWdOdEzYLDU8g5clQdsUIV4Al/0iOP7W+V2NFR9aWFKD7URv8QfackgZoIq61oZEnubKAFCGYwVe/lnifG42TRHos7MjufP7S4DUk35vWXprXjmtU37TyBYwUgzZ/n9R4qZOcs0P9+ZePdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Peqzom7y; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Peqzom7y"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso188153a91.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790591401; x=1791196201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Twi5fQzle6f9n3uo368zx2Nqx5/BlakhNld/RfUfYA=;
        b=Peqzom7yIdPk1o81Zdm0ZZT3Wz9zef8acm/7PWcRgTkxNoe29w6v8u5ajOaa50BtIR
         1IqxWyO7QJWL5kSnBa6bPTMdvGgsACNFuEolioeVsq4a9BbOYjR0JxoACjpXU+kf3p/f
         Ju7cLiCop228J16IPfpTV/so+IncCoACpSnxow28ZvPn5WYc1R1UbVI6OPgDq+JxhWdz
         RvWgOy0UHrWuTUJAAbC/ScPSbxQorUNNB3I4z3uDRCxyEVEst8lYpnDHXbiwU1aSP8Ur
         4KkT1PaYj3SajfsqnbKxVPvGSKZWzs+WuRlZgsKOWar4as1iovo4VmB6i3g4HD0zM4uJ
         UmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591401; x=1791196201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Twi5fQzle6f9n3uo368zx2Nqx5/BlakhNld/RfUfYA=;
        b=kNPbbFv93pwxVvimE5GHwN/n9yEydp9SBs/hqS1DFlhKeZXHu8zTeGPbFibXcZ4mKH
         ISAD2pMMJQPMzMW+udvP+vlfol7Ns6sr/3qWKg97JJ52T73ktDLzFElES/nKBcxlZ4w3
         otrd4LCn+qm/0xQ9W1joluT8NQpKeJCEryNdp0WN4+a6WdgGqQBQeg3t5r+GGGnNvtwW
         67iyaFDO8ip5KOGdv/MJMp/ZyRUchKRXex2hw9EaeOlMJGj8kxeHr8FlZO6AJxRi6MDu
         hL/PN0l9cO0rCzh4VrX37U69GFIXA5a389ZmXqDc/QbFIUT9ZIX4eIo9lwkV7YaYLbTV
         Q0PA==
X-Forwarded-Encrypted: i=1; AKwUvBzmGTW/evokiMrYspaJ+kMV8bcrhgvqLI1AcuqJ0yqJknjezhS/uCqECSeg0td9ZT5KrHhpuhqk7ElE@vger.kernel.org
X-Gm-Message-State: AFq9FYLF8K3x5HegUJ4GZ1+d62m0PRqOKLB0RsWMaAuS411Nh1tKxkDZ
	N3mDJhMAK7L4B54hYDAkb+O30A+K1vF/GP8kisC6ekdT2F1fIyEMGVmK
X-Gm-Gg: AYBFou2IFlXfRHcsV9VecJLWJLkGv0wdiIynwB6iuq72DI+oqUwrzbPnV1IOgUfq9n2
	McqzE2kHn6ufN4f045cYg5ioGf94sTFCD3LfSThNGGPlZQlGhYEa9dyJbBFDDGp2magc+g6pAhB
	cAqGdc80AX/C7uUMf8B+wlC5BULZmY/ckO1lMgE6c5lPAQ7F5dQ1HFg1WHsclQpYuLciLx7lLUp
	v6EY+L0V0izJrjR7woiVckop55XKO5NfuxbbmOx1wVlfymF16QxdarqHkcpGObYQoQJKv6wRmiv
	tua6zuTZidZwBh/4fG+eJyIa9IV0xic5rEyjRCjpp4+6kANcuLHTs3Qu0+/0b/1inKzv6u6A1Og
	VJAmxpluATqeKUuYCd2MvgWR2sTYMHArvac+uLdOxof3PiQLPz48uJE1V+jpqTYokgEA46NvKGc
	HK2lCJJ3Fh/x65ZoifDx9TNAWjcW9x7cOsITh3gMF/pxGyCLMZXWjPk5Nt1S/cdCGP3Y5LLp1DU
	Gjl6ST7tu0PaQ==
X-Received: by 2002:a17:90b:4c81:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-3a0b2507f4cmr14034686a91.3.1790591400646;
        Mon, 28 Sep 2026 03:30:00 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm20234282a91.4.2026.09.28.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:30:00 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add support for Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 18:29:40 +0800
Message-ID: <20260928102951.18369-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Acer Swift SFA14-11, a laptop based on the Qualcomm
X1E78100 SoC.

The following hardware has been tested and is working:

- NVMe SSD
- WiFi and Bluetooth (UART)
- USB-A ports
- USB-C port with DP alt mode
- eDP display with PWM backlight
- HDMI (via DP bridge)
- I2C HID keyboard and touchpad
- Audio: speakers, headphone jack, DP alt mode and HDMI
- GPU and video decoding
- Battery charging

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

Jianfeng Liu (3):
  dt-bindings: arm: qcom: Add Acer Swift SFA14-11
  arm64: dts: qcom: Add Acer Swift SFA14-11
  firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1521 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1525 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
branch: sfa14-11-next-20260925

-- 
2.47.3

