Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03FB317176;
	Mon, 18 May 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098089; cv=none; b=r9sDGiS+otGeUsc2ZNCgpGvXxQCVbsTTx6DEa4tGqhrrUnbenEnajWUHu4iI0yvbbfP2B3laT23P9NGBoMKAd1BfdkJVCh3MM2aJIgH8RIEQEDBNSqZD5YWwrVGmfyQ5UDfcj2qrifGCHvCsMgcOZsJcGmVGUKq3jJmuqqUgFNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098089; c=relaxed/simple;
	bh=hGZC83Y7AJPUA40Y06oGyzZKra5IfVqe8ST2IUhjLuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Nvee/GGguHxXsp3MYXIW5Gmi0S3mtFxuc9WxnoWMM4sy3FR1pTfe5uocep3IG2Vvfa0DRdyx2kTOA+ctii3Z3icJTbdpJMNzLc7IV5icXyU8otDMvyYVzsWEC+I4r8MUHv7LNX6iLg9mtsy7ycr+poyxDSyLgivsAx8vDZFF14Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu2p7dwl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu2p7dwl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF71C2BCB7;
	Mon, 18 May 2026 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779098089;
	bh=hGZC83Y7AJPUA40Y06oGyzZKra5IfVqe8ST2IUhjLuM=;
	h=From:Date:Subject:To:Cc:From;
	b=Vu2p7dwlkvOJyu4VsjWzb/eW/X2LHsYT003qrN4mDgM6VHwiqkmfxeJc4D6Vp/vf3
	 NZv865xFfayEo+evWHoGwhG9AOpRh6M4NdZYJ4EzrO5HN1xdXHIMoNqu9VbBEkyFSF
	 mKSHNUrFBP6rW5ogMFRBGX5I3Lz2xi/wMdI+cvgXm8a2D2bUR03nDo7L5wJLVzNiBy
	 Yxufu6m/H86kP/O9ipk1ioxVKjPTTKtDkHUXGEJCpy3FI+PW6HKyUT2MX+FzUIWSDJ
	 zCpZnOtVb28tMK3/waautzHrSbL9Ek3FSNhVo+KHSCw874VHPhArsrSopnsL9xBXqb
	 DfHimyVkPTBRg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 18 May 2026 11:54:39 +0200
Subject: [PATCH] arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBuISlR6FSkS42jGqgkZWxTx7
 o11+Rb/H8AYCBmeyQEBv8Tkloj0kYCxehlQUBcNmcwKqdJKrM6TEVbPTjeWvd0bM71FpfJSybL
 I2w4htj5gT9v/W79u86cd0azXDM7zB67yapl5AAAA
X-Change-ID: 20260518-topic-hamoa_hsphy_clk-853750763bde
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abelvesa@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779098085; l=1316;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9SmK6YFxBil/YD5KWkMSmglshTGGkgylQYJWjZcepTI=;
 b=S160AjUnbBTc/asA0Dt5u4oFLkBFIukq5cXF/5lpJRDaI0YtJvab5/shJv7K8Qhg7d+/mFe0u
 5oedBfsCW3ACBuzjMGuL3ORjsqJM84f4qLAf2zhA3etLynpBVdsE5SE
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The tertiary controller's HSPHY has its own toggle in TCSR, while the
primary one is wired directly to the XO clock. Fix that.

Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..fd86f4761eab 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2868,7 +2868,7 @@ usb_1_ss0_hsphy: phy@fd3000 {
 			reg = <0 0x00fd3000 0 0x154>;
 			#phy-cells = <0>;
 
-			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
@@ -3010,7 +3010,7 @@ usb_1_ss2_hsphy: phy@fde000 {
 			reg = <0 0x00fde000 0 0x154>;
 			#phy-cells = <0>;
 
-			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
+			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
 			clock-names = "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_TERT_BCR>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-topic-hamoa_hsphy_clk-853750763bde

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

