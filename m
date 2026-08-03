Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22853A4F2C;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=KrZ3BiT+PaeJhgyHbJihjN9IrjP6FA+KPmSfO+j/wnOBsbKKeBBqIQZAWbplHYFK9oioQ+jvOzLeXRpn7QzTT3XN60Qn+vo4lOA/0Darq+bd2Wxz3MxPmyBen9UA9MpVwfDtCvPkBh0UhnLC8MnFaguonlT0A7pgk8WBTt4aFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=ZwQKte2rpCes2MvoKj6+ElV2RSLoXpPwVjkbgETugy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WH0Tl2eUKhdMiFOLV5phuDQWtIjLEu3yZ5DhmVODvElwav2vbMuj5LHd3orwBETzJi60bBgIPSM39Dx5f/SGPpSpKIJ6f3YukGEDpvm5F3oZSCPWh1cq9aKm5c+XoePHgr9vYlFK8e7CI6TgHNpd1CpYOtlZJbWDC/RufuCLNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssWjM1m3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssWjM1m3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9058CC2BD01;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=ZwQKte2rpCes2MvoKj6+ElV2RSLoXpPwVjkbgETugy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ssWjM1m3o3qfnOwTNjNqSmU/CwGHqIfsRhdpdXLs1aGz2mwDgtHb7Iv1nncY7eJ8i
	 +PZw6tE1qdIc9KfrZvuy24kOcvVYaW9RYuu9/ROcM4M8YcmCF4oEGAKwOTViwbSEsx
	 njBh6W71crVc7FaGihOTdOhNYRTPPCV6FvJ/0AoUfEEC8YRdrPV7H8TSp4YWlf0rdA
	 SPca0n/SM66X6Z4Ge2VV8usDAwz4Sahg0gLhl7DUD0HsFbODT5DbZr71lteBQnVJ16
	 vGujfnWge5qnir8pKIRFs1bm+tl+pt1hyMn7eM/wyasZDOBd/yNVnWl2uAIS+uyco5
	 eFjrY8x3xakZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8004BC55190;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:24 +0200
Subject: [PATCH 26/28] arm64: dts: qcom: eliza-mtp: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-26-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=ANzRcaIcnxqMKC8C1vEn6VKb3Z6RSk0Mx0s2IxhfNQ8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZqYHVMvEtvdZq/wH/mij3JpnHQAwdL5s7/5
 4JuNh8AHQ2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2agAKCRBVnxHm/pHO
 9V7MB/9q1TWNFnwv+zOIdxNXpHDPD1eG90qECIoEQg1fDY+fSY9qpPLsH6dwOj55Xj7Pg9qtwEQ
 xZFgpFUvX+kKwLEcMTtWgTIJl8S6uLq7MRCnQuhNWKhKhz+Ga4KmoG5K7n//j3wWR615xI2vthU
 BWrsQzx6yax5wzanMlS2sJKzkUjgrETQlGaVRrqD3iSr5/dUG3omQ85eGR8rD4vET/YewrGleaz
 20VbtMDsB+OWj34jdoJA8AmQwBUgQztwMsm1Ns3WK+xq8AFi33iogNG9CCYx1BvGp7fsx3XfQqD
 uzPKx+FQvypjr8OBWpL0X9C7wmhoDE+KTF5MaHEqwdhbc1sl
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be the lower voltage (~0.8V)
and the vdda-pll supply to be the higher voltage (~1.2V), as used by the
UFS QMP PHY on this SoC. But these two supplies are swapped for the USB
QMP PHY on this board, feeding 1.15V to vdda-phy and 0.72V to vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 49dab7311f57 ("arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..9d58ef20213a 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -535,8 +535,8 @@ &usb {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3g>;
-	vdda-pll-supply = <&vreg_l7k>;
+	vdda-phy-supply = <&vreg_l7k>;
+	vdda-pll-supply = <&vreg_l3g>;
 
 	status = "okay";
 };

-- 
2.43.0


