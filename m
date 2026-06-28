Received: from outbound.ci.icloud.com (ci-2002h-snip4-3.eps.apple.com [57.103.88.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332D6346E67
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639672; cv=none; b=mHmfHwOp7odJM9UJUI//62QdRHWM0B4fYU9y+tc+t0z2DhHjftKGmtOnNAd5lzVdTA42DQBmW97lK8M896CTmz9MJNknmnbj+YsJq4DGhsQ0LRWacE+ZZlW7W5N78WEJs4qvEEQCF5YXjD50RoPk6JRoQbj8NMZaZt55Z6jmTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639672; c=relaxed/simple;
	bh=wJ+lwRCSlpRrIqGrWCjHKCxiD4eXiwHDxpeMIvism9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjQ8BsQT486eRe8XtZSN3odlA5Qw2YY5s+r4MqieGEChc6/ey8niks+/pXBOMsXoWZDWR1WOkXODRMEYmMLuhfPOkobYjeUWJaWSpC0FGwBjToDV9Uel5avrElPl7uT/WqMc1rvKStF0D8B+ObZPK6u5hz9epKASTEDYPB/ZQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=MAyn9ATn; arc=none smtp.client-ip=57.103.88.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="MAyn9ATn"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPS id 901D41800166;
	Sun, 28 Jun 2026 09:41:05 +0000 (UTC)
X-ICL-RepId: 019f0d9a-a13e-7620-b920-10fd901088f7
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VRGRcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICUEHXQRaHEUNTAZfGlofHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782639668; x=1785231668; bh=BCnQmg/99Ba5iCF7JFYp2mBup/vtXc6NMs7dN7dx6Ko=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=MAyn9ATndZrr8aegQymLEbhrVJxvf/c9APMuoUPVNFGKfPtDfdrEGNJ5FbxV28zHmyOI67X8DhKn6zJpH7HV2MIbPdMvjfgNeDOW/IZ/2Vi3b4zzy0CN4/jbF2iS6HfX07EHG1hqnj0Lf04pL5s1X0N227rxeWGep/miMSEyaxNuajQ5babIloyfol9wOlZp9gw18p9eNjTvADFKeqwNTPXqjMYVcwMrv1Si+5EPHL3lUiA7YpFCOajlmzbsCOvGMfSYBziZ2WE0ygGEEnxd8nbDa+ydZM4bKh+/wiGlp5ULSmXXSUJUoCIyiChGYJ+4DYem7jY1Ijf7N3tXgDErwA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPSA id 22540180016D;
	Sun, 28 Jun 2026 09:41:03 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro,
	Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v4 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Sun, 28 Jun 2026 16:40:27 +0700
Message-ID: <20260628094031.54452-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -auj-ESCxeV9S9UgDQZFtbDqXcQvxqwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDA4NCBTYWx0ZWRfXzUEr/+Xg+/Ck
 qcDyjGzBc6AlH8oLB3yNjvR+4zNG0MXMicCmUzKJUhAslmWQuOuOrTJHqc/qhAvHlLZLyOaL2uU
 KYMT1wJK4AbdQuuJ7Lt4JxM4o8fHmzFAKO5KFQU8sw5yPzlBNknH/kT32hD8XW5xS29KZIxG95O
 NL8GXBtVuch977Z4kwtHgSQIbTtEEu/I1+Hcv8vIT7EppurxLrXckdxwCeRjnmjA2sbx1Fay6M7
 ZGbdrjpVqTDRlajOS34kBT7OIUwRmYVp0tc0/Ld+OkzqkctwrZI0XIYcW8r0OgCObU3GRL4MTEa
 DTisbB9Ik/pzO3gIhHq
X-Proofpoint-GUID: -auj-ESCxeV9S9UgDQZFtbDqXcQvxqwg

Introduce support for the HONOR MagicBook Art 14 Snapdragon laptop.
This version is based on the initial work by Kirill A. Korinsky [1]
and Valentin Manea [2].

I'm using it with two external displays connected to the HDMI port and
DP<->USB-C (over external hub) as a daily driver.

eDP support is disabled and hopefully will be addressed in
the follow-up [1]. I can confirm that the RFC patch by the link fixes
output corruption (thanks Valentin!). Though, I have as suspicion that
the issue can be resolved w/o introducing the panel driver as the very
same panel seems to work out of the box in x86 version of
the laptop [7].

Another caveat is USB-C orientation as I could boot from an external SSD
only with specific cable orientation. I've tried the patch [8] but got
some instabilities, so put it out of scope for the initial submission.

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

Disabled:

- eDP

ACPI dumps are available in aarch64-laptops repo [3].
HWids in dtbloader repo [4].

[1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
[2]: https://github.com/vamanea/linux-magicbook/blob/qcom-x1e-7.0/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
[3]: https://github.com/aarch64-laptops/build/tree/master/misc/honor-magicbook-art-14/acpi
[4]: https://github.com/TravMurav/dtbloader/blob/main/src/devices/honor_magicbook_art_14.c
[5]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
[6]: https://lore.kernel.org/linux-arm-msm/2095cb86-6729-41f3-a0f3-b806d6acafd3@mrs.ro/
[7]: https://linux-hardware.org/?id=eisa:edo-edo4179
[8]: https://github.com/vamanea/linux-magicbook/commit/b855efb02268677d84dac4b9e27b1c5c9425d81d.patch
---
Changes in v4:
- Dropped output-foo properties from TLMM pins
- Sorted pins by their index
- Dropped data-lanes from mdss_dpX to use the default (4-lane)
- Added a space before the opening bracket in the comment
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260620175210.19563-1-mail@etehtsea.me

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
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1305 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1311 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
--
2.54.0
