Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D593E834F;
	Mon, 18 May 2026 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100372; cv=none; b=lQYwn5hx0elTybLe6+FKSxYchG9Jp+7nbaS/8/B+SJZgM1DRtlgmQg/DpxnLvyrpziXT5moQIAfRnNG5OETQCbFw8+dplgl+5/jQtLxZr7sVvQeFh7obYr/WbWPMVulO4mS1DdWwfG+B4O4zLmzHxYtekBblnlU8RST2X0JfvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100372; c=relaxed/simple;
	bh=CuGMsmt65q1xArX/xFdVXKdCLsSzlp0jRAyYesuhoqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kuyD0ODnsstrwLBXEObFy5fOkgRwi8OzUGST37ruFMGYl+ImSgLk6dWjftqtJwteKtiN2ZQRp1h+7I7EbcHbyGGgEjMUJXrFcfUAG9QM0BxrvcSiJqkzUpyaxgOPicwrqFZ9OppU2jJDTrN8ucDjfBerThfnHUQ+nS7Mq3WDOFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdwDUZIX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdwDUZIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61CDC2BCB7;
	Mon, 18 May 2026 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100369;
	bh=CuGMsmt65q1xArX/xFdVXKdCLsSzlp0jRAyYesuhoqo=;
	h=From:Subject:Date:To:Cc:From;
	b=kdwDUZIXZfgVRHnfFx8yd4g4OmGTNX19XwqMhdEoD5zOr3Gg6zKOpn+hCd/xrTRh8
	 KsnPjqux4/WCEb0osRH+dZQyfV5Fz8pqOlOmu8TkoBX8+RldSjF0vB9tOGEjAPK9TK
	 hK2EEhdxCKXeI+R4nbhJpJ7lS/NC/e6lReCpCMTnjhyLTVRb51ZGfX4qm0TPIo/MfC
	 nKvmVbdnpuZb4DzqktlxCCXwFAyi4ckLSSyQ0UrnUASsgojlaY1F3Tz0IR8aL5nwBH
	 cKswVXm4DEZSREYxdD4kgrJ6i441C68SREPtjZMeIfXlUvbwm+kwmjcpchHtZ43hGT
	 Cm1uAfRCNSweQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/5] USB4 mode programming for QMMPHY on X1E
Date: Mon, 18 May 2026 12:29:47 +0200
Message-Id: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpGwRXEYu2BmNB00GIuLti+
 Rb/X8AYCBnq5IKAOzEtc4RKE3CjmQcU1EWDlrqQuSrFunhyYmOb+fEUWBVK97k1UpYQGx+wp+P
 7Ne1v3uyEbn0ncN8PhnQFl3EAAAA=
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779100365; l=1709;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CuGMsmt65q1xArX/xFdVXKdCLsSzlp0jRAyYesuhoqo=;
 b=7N1YrzhfQ7nF1tgr606f4KLpGYjIE/tgXt8TkdWQocdBEVzcXsO2gL/QMmC/uZnYFGoIXm3FY
 lVJJ6yxQPh/AeL4y19mPoM+T5zmxtmOQso4OWAd+SsA1D2kGrmcD5DQ
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
Konrad Dybcio (5):
      dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4
      phy: core: Define TBT phy_mode
      phy: qualcomm: qmp-combo: Add preliminary USB4 support
      phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa
      arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   3 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  18 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 592 ++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h     |  15 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h |  45 ++
 include/dt-bindings/phy/phy-qcom-qmp.h             |   1 +
 include/linux/phy/phy-tbt.h                        |  14 +
 include/linux/phy/phy.h                            |   2 +
 9 files changed, 609 insertions(+), 83 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-topic-usb4phy-e9612f5ba008

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

