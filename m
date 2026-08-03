Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A03A1A58;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=KNiln+uLX1HMTnxmku/Y6q57GmSDhorVRQM/xxiH0pbAlwYuprfmHYXrdyqtQHTAvREL2lYAq0NSrJa55YeRRN4UreBWKPb3MDTBCgc6rd5V69xGs3PJ8a2EOhqyOfGs5i7m7SxjX3+29UARqZq/81+IvnXnDmihKJxO2OhOMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=JarYoFUWuiRnKUY6NZefEarlBHffjldtovJxj0QewUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJ6TZDrTg4USqXDvo9LZIe3ZgYkKPU5bpm7seMsE3v9LJU8c+ECA+lHH86CORMYOxHbNE6r3ViGCldq1TuXraZOJdbgTELwjcOWPkGIsReQkbANzxUweO5u+yzO1SUcxRgiFAERbP7oux3ObRgHpDrq19iR/hlF2wmhfz4TEFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3fGrh+c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3fGrh+c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BC23C4AF62;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=JarYoFUWuiRnKUY6NZefEarlBHffjldtovJxj0QewUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E3fGrh+cS39JX/memYcTOvOw2YlkdrukeU9T+wiOY1SvM8+Zex63ccOcaqUDb+K3t
	 rCf/OGdALFa0xk4YaxPTk4r21OibRDLZqA3U2XYUX6QfbLBVwnO6XpRHYdBRUUoldJ
	 +pjcNjoFnOjLwOF0Rxm/AFgwSdjg2r56mctL+BqQDPg48AQbCatGj95+7TEBaY0Xfz
	 jx3v3OTSu+3Wxs8MJStY/M07sdgqoXo+pIl26Ywg1u3coXaPxOPrgrHpebhCSK7zc1
	 ekt49gdjOIRfcaPHA9r5bRlK0nudZZemoT7r1WuM6k6jrJuqyW0INF/zEU/Gv45h+D
	 BrwPiQeSglRIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F13C5518F;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:20 +0200
Subject: [PATCH 22/28] arm64: dts: qcom: sar2130p: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-22-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
In-Reply-To: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=WKawKoYyiR4q4gN4qKPm1tu6RoVI63v74w4JT0Dpu6E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZoAj5EwpuJnINd90aVcqskc7TdKE9B5mITI
 xW+7O6mGkiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2aAAKCRBVnxHm/pHO
 9RBNB/4nYm9dhYycWWaIwDgBqCKs7+KT7USw5oz2lsUzCetC1/3zrQpO94Lz+M+Fe7mTg/0qsVV
 qoghb7x5Y8pB3q99MzLUjxtc7SlWgcEyYiJIC/tr9RBM5BXVVHNXbV8I4ERJZ3oF9bED/Sfry4a
 RRwMh6fSoytqlFV+gOMDcclANoz3lKsU8k7DlkJRFlP3vqW9NdHp41L2jHfxQCmYU+pHdFbRJ5k
 UrS8+ghJy3vsqIOCL79ZF1g2GZrZfZF/nIFMhNRu+/P/vH4LgDzVcmifhdhm36Tox/DlIz66SwG
 4n+s1gcenfHdkW7w1UsWGZfyQq7TfuL7MzLe4q3ek+6SNrgp
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHY on this board, feeding 1.2V to vdda-phy and 0.9V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 6339e41fa39b ("arm64: dts: qcom: sar2130p: add QAR2130P board file")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 74778a5b19ba..80428c0b3b4e 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -551,8 +551,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3a_1p2>;
-	vdda-pll-supply = <&vreg_l1a_0p91>;
+	vdda-phy-supply = <&vreg_l1a_0p91>;
+	vdda-pll-supply = <&vreg_l3a_1p2>;
 
 	status = "okay";
 };

-- 
2.43.0


