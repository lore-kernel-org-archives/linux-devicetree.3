Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C0A41A554;
	Tue, 28 Jul 2026 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233428; cv=none; b=JNUC654u+6QFfFBMH8IaOwmjGV/tDGxemqfCaOrtQtQesKWMjN6CUlCXZIuzm5TttKj2zRvJJBJvGR02MrupcdqF5D5uRB4iZxN1TICAUOW0J+RpUaYwRIG76TeeeglRtvUROPRlIlDWDqxkyhmftnWMlnk0Cu4qEAf9Urois+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233428; c=relaxed/simple;
	bh=CgTsrnw/oUs1nfPmmrF4f6odfgN+/4iQgg6M+/qZHn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F9S7yfe3xLZiu+OaC/vKijhFXBS4QHUQJtXZ0i638NZor+dDOtYWrcRX2/K1uZfO5FTD6eajp0xi8BK0Vfe0yDRj70SiWlPLFjDRYpiye4l+ujVMhagNY/Q3gvo3d3HYmO5HmStOHH+A11rTzvuy3lKFzemjSCRM/f7uNgzKqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3zSAmVz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3zSAmVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E3A1F000E9;
	Tue, 28 Jul 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233425;
	bh=jFpVwDGB+ken5MMKXbe3yv7FTf1GaeW4u1tfomWUaug=;
	h=From:Subject:Date:To:Cc;
	b=l3zSAmVzAQglOwjcIX8O/7otlDbuAB6E9RM7uOLWpk6dHKX0Uy7Gh1TOpbjATAxn/
	 FQ72pGyBZhNfTflABvjAVoYDACMA2DuOCqj9lEe29is0FOfepzT8WcYSs8C28v6M1s
	 Tlu/BYW2nsdtvhvrBbpvslQvwKX7xgQdP3auD4pAqmMIjE4DrR9LFj5s20bZ+uWqPD
	 qfBfEavnjgbFKIOHqSR8/jngVir8H+ypmoKV4VAwb9dVE2CiRFulC9OgPO6ykbJCJo
	 W4AnGxXWONaMUyp5p/ulN7RdfEp2eDWqQrNhP1DF/1J2P6oeuWEEkg6YROECrwOWsi
	 3/nx6sCeH78Tw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/5] USB4 mode programming for QMMPHY on X1E
Date: Tue, 28 Jul 2026 12:10:11 +0200
Message-Id: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQqDMBCEX0X23EgS/O2p71E8xLjWLdXYrEpFf
 PdGe+5l4IOZbzZg9IQM12gDjwsxuSGAvkRgOzM8UFATGLTUmUxVISY3khUz18nYrQLLTOk2rY2
 UBYTN6LGlz+m7Vz/muX6inQ7J0eiIJ+fX83BRR++fe1FCilw1hc5tUjbW3Bxz/J7Ny7q+j0NAt
 e/7F94VhxfDAAAA
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785233420; l=2356;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CgTsrnw/oUs1nfPmmrF4f6odfgN+/4iQgg6M+/qZHn0=;
 b=Qbs6F3qaxa8cYeTTpf8HDpHGcUxvBoIR5a8Ym6ZbuMWOgHA9mv3yJej2VsqH56jAV8bwvc1sv
 SD8OKA+3ZCgCEnI5gz7TAfuYZOisJJiu4nTJA1nNcCRptLr3s6IB1QG
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

