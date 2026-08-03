Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B9C3A5E96;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=ejXejRyh2edqjbaknOZEfi4432g/9bOngCQ0IgtMQVc4zAzH6Ms5VsnhyiwSZWo0u39TKUdsqbT0zgwWqEnsfwH69iYM4BN2FQreiHz3IuIXnMo+fpMvx0qIREnoKwLCzvnelK52n3AazoKq4gdk27PqFdHrgSk5FcbZcX7N1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=eVPv6mGoUWBCf3niNq2GqmvlL39XVBgh4Zrj8pVFaMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVXesy9KeDQaTY7nsub7vDuk7MqMOkeAadkfzxDOyCZZzwnE3nc50KpONZzERrnMxBlcG1rLZwMwxVQKUAbQmxkbtji+9ydbuZF0g6spxYrpRGApRM18RadVQ98To54oQESjxMOIvu3LeO/XiN1EDhP/4P3nJUEoiPDlyNKgqbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=advgeguQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="advgeguQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B05F2C2BCFB;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=eVPv6mGoUWBCf3niNq2GqmvlL39XVBgh4Zrj8pVFaMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=advgeguQikkbn+dOspEszpOs3Ipzn2Fq2oBo6MOzlM7O1I8mbopWgr+42VfPjdle5
	 Br4L65eC7jgr/eRjawvreuwS/4FSXQjPKYx912yXVoGu8+njSs6sBOXG1A4vN929Qz
	 LpRqRlyhzq9mHwTS787geMj6dpwIU2+FfWFQPZ0nYx/uuNcquLP1CTTmJV32b2xdKE
	 gxsTvI3H0jOOAaL6gCL1XZ58WDpcuCH6XGJKzAlqOuhXBOcjTr2ovwtv2mFTwNwn4D
	 lChRfX+d+HptXaqPin/2CHncaHhWw+OVgd+HQEvvb5AjpjpdBe7eE/qySfMryYITjM
	 3YrArichLyQTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E796C55162;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:26 +0200
Subject: [PATCH 28/28] arm64: dts: qcom: talos-evk: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-28-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=z+Dr9mEJKAeC1o6t8aRa4QhX6vOTIK+pqWvTSI5WUL0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZqnBt1DwNxdiyYJgZrKfWtJVtUJHHhNldkL
 cMBjrT5vq2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2agAKCRBVnxHm/pHO
 9SqPCACYwM3BIyy9MF67qMTOrytLV8geZoq4OQRuFKNGh8fP63a/EQhPUYv+JOzjrePFkvC0z1T
 pp9s3vnvSMRZ3f2yDl1DWU84Bn8xS4s05z6H/uc2TxoWS+tN4GdQ+rloTiGQesLiskU7mf3vg15
 sHyKCe9NEOmdauq0V7QLGeIbu5XUjNsBhjIV//6ZaHteqwppXAsLkSYf1DNOQlkn2vyaAvgGnaR
 M7ZAgLPULtbprPCaDTH40I8FpvgggraBfK2XdPuv1lqUcsedUbeT+CTP1w773lSzv1pyAxBlZF3
 tuWHUtzbafQBLQhGiDpF1hlr82F43MFv6S3Ave4TPU54S2jm
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

Fixes: 0f9e6db8a223 ("arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..6469c6fa9f63 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -589,8 +589,8 @@ &usb_qmpphy {
 };
 
 &usb_qmpphy_2 {
-	vdda-phy-supply = <&vreg_l11a>;
-	vdda-pll-supply = <&vreg_l5a>;
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l11a>;
 
 	status = "okay";
 };

-- 
2.43.0


