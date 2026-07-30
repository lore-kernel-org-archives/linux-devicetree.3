Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99343CEC4;
	Thu, 30 Jul 2026 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421165; cv=none; b=r4SPesdysE54zOm3fFfp8RgevYrhdDeKGbB4WSdcjpNG5MsA6cbpYMcUU+un2MZUcrXalIXsxoFvEL6I3tf4ytZUWOv+2WfBmChjDUH/CLwjZ3KICT5dg2jsa3F1PrjENsR4PJ8VTAnMQEpfByMaIcG+M80ckVO0cvba6itQobY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421165; c=relaxed/simple;
	bh=9I6PIomQ8/a+zhHHxVQoCY2TXaxCyukQFd3p4hbqpfU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CITo88/vuxgeU9886GU/9x7+WKJIIxzytTUQ5hiU4W9SQ2nT5VCjsUa94k6UgIvabW2n9a1afuFcshZQB5AQAwSa9+/t+tKouieg3toNqQIam2BdFzW4tL+EPvIFE1C5J8rwu0t2nW1nn0Q+xI+lbqqnsjU6idOinfhtDVVYsqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJN/lWDZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJN/lWDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9171F000E9;
	Thu, 30 Jul 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785421163;
	bh=8iMH/UPo8cRGnmZlANKjBxiEHfDqNtumzb1SPHblyXI=;
	h=From:Subject:Date:To:Cc;
	b=JJN/lWDZj6mCVpC9cdQwK/H+OvaCxyWsdbabOXy2AMbrPaAZgnChq6QlofHCB2Fvj
	 3NBgA5HrEf4j/1r5tF+NlevS17uaeubRyJze29lNUkPClvpSr/l4zGTxhuleF9Gwmq
	 CB+S7IsLeb7oojoSEXgT85dPQCaCvGAODREZboX/5noBnVoMztECm3XzMidj0U7QzO
	 GjokFS/WRAjLaEbsMyP8CINMMALBzFs2xEPFCamlc0jV7Hh231rTiYVQkQ0SYK/n76
	 hR/okh9N2Ez3BYZ3D2BW+/Gk+ggqlXJFxBd8NDsnu4EZdDxNEItzEc6QlCCaQ3dnai
	 dXkI3ph1VdwDQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/5] USB4 mode programming for QMMPHY on X1E
Date: Thu, 30 Jul 2026 16:19:12 +0200
Message-Id: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XN0Q6CIBQG4FdxXIcDEpWueo/WBcIxaSUGynLOd
 w/soovq5mz/9p/vX5AHZ8CjQ7YgB8F4Y/sY9rsMqU72F8BGx4wYYSXhtMajHYzCk2+KoZsxiJK
 yljeSkBrFn8FBa56bdzq/s5+aK6gxIanRGT9aN2+DgabePztQTHBFdc0qVQit5NF6nz8meVP2f
 s/jQWkisA9SsS+ERYRroTWnhQBV/UDWdX0BsB4uXggBAAA=
X-Change-ID: 20260518-topic-usb4phy-e9612f5ba008
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785421158; l=2514;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9I6PIomQ8/a+zhHHxVQoCY2TXaxCyukQFd3p4hbqpfU=;
 b=LDSe1OEi2U36XW7oT2Kj8QyEDR4DqHHrYdg2LQWq5vyr6M2xlGMb9N0e2YtMK1QpU04LARCbw
 EMGF2D0qfjLAAcox7s4U3A+08e5BZBMgU93Ti2SDjMWOs61TQH16yQI
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The USB43DP QMP PHY, as the name suggests, supports USB4 in addition to
DP/USB. This series provides the necessary plumbing to switch to that
mode of operation on hamoa/purwa.

This is achieved by exposing a third `struct phy *` for the USB4 sub-
PHY, which will be toggled by the USB4 router driver, living within the
Thunderbolt framework, which will be posted separately.

Find more details in the individual commit messages. Tested on a
X1E80100 CRD.

No external dependencies.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Fix up assisted-by tag
- Pick up tags
- Link to v2: https://patch.msgid.link/20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com

Changes in v2:
- Massage the bindings to only allow the p2rr2p clock on Hamoa
- Pick up tags
- Rebase (nop)
- Link to v1: https://patch.msgid.link/20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (5):
      dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4
      phy: core: Define TBT phy_mode
      phy: qualcomm: qmp-combo: Add preliminary USB4 support
      phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa
      arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  55 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  18 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 592 ++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h     |  15 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h |  45 ++
 include/dt-bindings/phy/phy-qcom-qmp.h             |   1 +
 include/linux/phy/phy-tbt.h                        |  14 +
 include/linux/phy/phy.h                            |   2 +
 9 files changed, 651 insertions(+), 93 deletions(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260518-topic-usb4phy-e9612f5ba008

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

