Received: from outbound.st.icloud.com (p-east2-cluster1-host10-snip4-2.eps.apple.com [57.103.76.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E02E7382
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977978; cv=none; b=b2OLfO+19/5aYAqVo2xFPfKRUo4tYWwrJXElWvMJpVC/9KYSLx1HCLVyQVZ12AV8QyC1A7iccSpvzIVQyYlYxV4swIa+DlDFj0sFtAKxdqzini4sce+wvzJxeH5A+vMAg07NVZ5h1cv5Bd/5e6c2hwu8oLk+kZODDVZhaKQ9SII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977978; c=relaxed/simple;
	bh=OYOz2+Mv+1vLRIAfoeASfc2Bz1jkX9VMrB+3c43QTK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rWFfzhBjvB2AEc4Q0+/7F5nTQMrUIeGcnnwhDiM2t/rg5+6/iXpb7ilbFuUlEb6u/MTMWOYQHNLDUTwdRQSIem6TKfbqvL2PAv6OwOSIYLcqzeoZqX6huCNg47fks0groI2pfJC9tUGuWQ8kluR5x17dZpu/8vplnjzijJkM6iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=pnQZv99t; arc=none smtp.client-ip=57.103.76.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="pnQZv99t"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-7 (Postfix) with ESMTPS id 08198180042C;
	Sat, 20 Jun 2026 17:52:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlQXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BSH1cYTQtWDBkGV1BUEVdQC1kCQg9IBV8HWgVFC0kDQwZSB0YKVQJAWgpbHHkdRwhfH0EVWFZeCAlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781977976; x=1784569976; bh=j1X/Ds2feGMKaXdIajPmaqIDJt4TQxievyJDnIh8RDc=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=pnQZv99tQc0fK7jSREMszQ8qkD1UhDvAjjxYjP+wjYMPz6gjySKYRoAWanMNN92puNMy0x9n2tCqHz6jmH0OjeNDr8bZ52Z6myX1YMpSAmH2KqQcekOKyC180CfItoByBnJFgHPqNT+/16wcijdfNS28yzQfmS5y7/C6sKW0seQFdpKjmSRlFSnvT5GsKLbJpMttPG+rrkCOR3BoE+FPvdnc5H7WOLp5i3DU5HImGryqeFQWXGYj5ZU1rxFM1I+MZgH4H4n/Q+WJaexpLA1t0+eRahUDBCnwxlsxJ0sQzC9VvBfwH4V8Uetn3IDGQ9AitzyVQ70LmAA7lRGY2NCLeA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-7 (Postfix) with ESMTPSA id 3EAE818002DA;
	Sat, 20 Jun 2026 17:52:54 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Sun, 21 Jun 2026 00:51:54 +0700
Message-ID: <20260620175210.19563-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Yr7jeoXRAIpz4NqQdDqXyZClyE3NHLY4
X-Proofpoint-GUID: Yr7jeoXRAIpz4NqQdDqXyZClyE3NHLY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE4MiBTYWx0ZWRfX291u3NahS3wL
 B6rrQ7YfuCkqL53RnN4TyVoXxZc9x0MMsK+iO0LfuvxJc3RVSr82lb/rDk84a1XOT08YELp6Qc3
 /GEETiy6wL5A2cvgLRPi5iBu9qtdZojD3zAF+FdGX4wWNlddXbkKSgYtRYKXIvLZPMfVHNAKHIk
 TtdsIXLF1l2jrwNzQUj5BBaEYeEr++2Wy5oA9492a5TNSDUcmEkhhc02fH4UfpeViZB4DRrlSFx
 jvPKuP2htLBqZvCUFURxcUJKAMC31QKPmpj17vv1alXbmBWsu5N7Nxo4jGvE6/c6k+dlL5ujGgb
 QpFX6eCgVTIK6rpUPed

Introduce support for the HONOR MagicBook Art 14 Snapdragon laptop.
This version is based on the initial work by Kirill A. Korinsky [1]
and Valentin Manea [2].

I'm using it with an external display connected to the HDMI port as
a daily driver for some time now.

eDP support is broken (screen is eigher grey or grey with noise), thus,
keeping it disabled for now.

Supported:

- Sound (with alsa-ucm-conf config [5])
  - Speakers
  - Headphone jack
- Bluetooth
- Battery
- HDMI
- DP over USB-C
- Touchpad
- Keyboard (with backlight)
- Touchscreen
- WiFi
- USB-C ports
- USB-A port
- UFS
- H/W accel

Untested:

- Camera
- Fingerprint reader
- Sleep/Suspend

Broken:

- eDP

ACPI dumps are available in aarch64-laptops repo [3].
HWids in dtbloader repo [4].

[1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
[2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
[3]: https://github.com/aarch64-laptops/build/tree/master/misc/honor-magicbook-art-14/acpi
[4]: https://github.com/TravMurav/dtbloader/blob/main/src/devices/honor_magicbook_art_14.c
[5]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
---
Changes in v3:
- Update sound model to the board's name
- Dropped unnecessary output-foo properties as they are controlled by the driver
- Reordered properties alphabetically where needed
- Updated mdss_dp0_out from 2 to 4 data lanes
- Dropped extraneous USB related comments
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260515172926.16597-1-mail@etehtsea.me

Changes in v2:
- Disabled eDP;
- Dropped displayport dai links (they weren't tested);
- Dropped SBU MUXes as they make DP over USB-C unreliable;
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260501155612.5490-1-mail@etehtsea.me
---
Konstantin Shabanov (4):
  dt-bindings: vendor-prefixes: Add HONOR
  dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
  arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
  firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1309 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1315 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: 9ecfb2f7287a967b418ba69f10d45ead0d360593
--
2.54.0
