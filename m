Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B858543802C;
	Fri, 31 Jul 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520797; cv=none; b=OiF+2EOUkXiqFnXzAJ0DDnj6dOHAbFNv43e6NXpuakcXuiH367f+CHXlrSriHc4ivtoGSjugUBy5nBpnInpc6dQOw4BnJNV4PpnZjCn+nIofpYVgVSG2RNLoaDDmmV9kSJeRF7o3AO+mPsi9LprVkanqhegdt5AesyGH5AqRiAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520797; c=relaxed/simple;
	bh=8Ejt7j94YK0/1wEsR1E+YgnB9dh/CjgfpDumLMFInRE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YTmtMTiJJMmjzgsTLqsJPveMUvM9kHDmriSypBRb/igfghOsBm2iRvsImP0EQHPjQ/7g2cZoxmxZcon2+9HYuXieIf1ARuZKBnTafRZJkdOliqSqJlx3tiHOp1N2IKBFEiCJXmWwCpItxnd8t8aylhqEiQhucVjjgwlmn9cEQVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsNrAEcy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsNrAEcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B981F00AC4;
	Fri, 31 Jul 2026 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785520796;
	bh=fyIUzU+fps0H82ltDMQ5q7P7fJZeouG3HRKRpQVcPw0=;
	h=From:Subject:Date:To:Cc;
	b=NsNrAEcyPyuZwv9lTzLRRTGz+gbjkGT/MFMOSqtLHhYOkLvfP24t5jMkelonhS94X
	 YgHCiDh4hx792eIhOhuFzpKLwka7R3/WWDyjIXW5UhkVyJYZqSH+Y+QA9igcSUb4kO
	 mmVl9QJrWr5yRzMExTKKA61EsKwXd9aINGCvLJyKstmzJhY4F8HuZZ20bUZgsYeCto
	 p58+a5HEd534j4eVxqAEwIELsFoqSgRfOn6AVksbXCBlodMZArW8NR9U0HZvkx+knh
	 j7w/ZLV2j1r6ggZkMfGk3LXhESrXt1FFbG/W3LlFYFQr6O8lYdl4NyC9BLdJwjZHV1
	 ywaLIH8WzyJHA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/3] X2 Elite Lenovo Yoga Slim 7x Gen11 support
Date: Fri, 31 Jul 2026 19:59:43 +0200
Message-Id: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NUQqDMBAFryL73UBIIYpXKUVMXHWFGs3GUhHv7
 lr9HJg3bwPGSMhQZhtE/BJTGAXMIwPf12OHihphMNpYbfVTpTCRV2vo6ooX9yE+F6p1tvE6t2g
 KB7KdIrb0+3df74vFHtCnM3YbEedFDtOt7fsBxpWqdI4AAAA=
X-Change-ID: 20260603-topic-yoga_submission-fb6dc076e28b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520792; l=2345;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=8Ejt7j94YK0/1wEsR1E+YgnB9dh/CjgfpDumLMFInRE=;
 b=DBkGslITEGTp9PHjGHVhToz3nE56X6cbgHA6y+AOyT6ltnBZar2czzEvx4ygdJhB5SslGlyUm
 q4vJaXEHF2rDfDU84qxZOv1woMcAdPcRSkqaXTZBG1RIoZHBUxqN/bF
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series brings the bits necessary to support the Lenovo Yoga Slim 7x
Gen11 laptop, based on the Qualcomm Snapdragon X2 Elite (Glymur) SoC.

The DT allows for a decent UX. Among the features working are:
 - Audio playback and capture
 - GPU, Display
 - Keyboard, touchpad, touchscreen, lid switch
 - Privacy LED
 - Charging, Type-C
 - Wi-Fi, Bluetooth
 - Modem should work on the SKUs that have it, but it remains untested
   due to lack of access to such a device (it's just a PCIe device)

Most notably, the camera support is missing today and there is no EC
driver (the one used seems to not implement the same interface as the
"Qualcomm Hamoa CRD" driver services), making the OS unaware of e.g.
the keyboard backlight state (although the backlight itself still
works).

These patches are a result of a collaboration between a couple of
Qualcomm engineers taking part in an internal sprint and were created
over 3 days.

There's a number of dependencies (audio, GPU, SoCCP series), but those
all seem to be in a fairly good place, so this submission can be
reviewed in parallel. As a result of that, this v1 submission is
almost expected to trigger some dt-bindings warnings..

Changes in v2:
- Rebase
- Drop volume up pins (no such button)
- Drop unnecessary pcie3b pins
- Drop the applied panel patch
- Drop merged dependencies (all of them)
- Pick up tags
- Keep the optimistic compatible string variant
Link to v1: https://lore.kernel.org/linux-arm-msm/20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
      arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim 7x Gen11
      firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x Gen11

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 1208 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1211 insertions(+)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260603-topic-yoga_submission-fb6dc076e28b

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

