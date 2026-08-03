Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D6A3A542B;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=DKzULi4/AzQ02z/F0ZHDPybBsKFlFTebX2kVJ19KWDRLNm204oMcNSCfmtga7Cb7uqNhwO5l0Wi1SFcL6ZN5t3A6K882V5FRxtKWCu7x7alg+tWay2o0vipXtfGSWNAiumEPSApN0Z+uXI0KNwR7sk9vn8pkTsR8uLO2FWxMmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=vqPyeEGdjZCSNXUH/Zptz1kiDiCBzud3gv3ZffOJeY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJ1mwzkZal1iSsuM8WcWT7TwsPL+a4c6VQA8C0d7UPAaT7KevanTnLn/RL71sXV9xM1MrfdVrCUL0bKY0BSShciee5uFnUy5eQeL7ocfcTLaRczWNhfJMKYzZbGYk4XaMRyypsvAEpjlkRD8LtDECmgrPBS+MBnXd4Qf9b61+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0CTaoqV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0CTaoqV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1C03C2BCFF;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=vqPyeEGdjZCSNXUH/Zptz1kiDiCBzud3gv3ZffOJeY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F0CTaoqVuQbUMvCQONMWvjYVruasGdAkhZF0ukPGG0elUFhpk5GY4RSyPmns5KUgc
	 0T2Vqia7SV3pWpp91fGbxvQ+LWswtcfKBsTPqLNHuVnqNk2Yp9+1DZW0OHu3dQuHBT
	 MpgeJX9Pb3xUFJCVItf0C8d+lMnvlcDu6/TBgqVPjxqopyNQXX6vGnOxRmeaeJcBnj
	 wruhaR0m6Nw3aZ9YMhTC5fn8uZAK7g54fCKJOCMpT6xunMH2KEN5wo7RiFbZGv6RSM
	 PObHIw7chacaQhBbxlNHZv8H1VYlE8ubLL12hPtyUidnq6gyFzMuRVyvaHTo7GK4qg
	 3rU+xgF6wkFWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F794C5518F;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:25 +0200
Subject: [PATCH 27/28] arm64: dts: qcom: sa8155p-adp: Fix swapped USB and
 UFS QMP PHY vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-27-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=pdJ0+3lX9UMfGKOEewe/tBmrR1874axt7eR/rE1rQKA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZqKHe223E6pEgdH/0XeGjVB6/RfA9bnBotd
 Rquzznvg+yJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2agAKCRBVnxHm/pHO
 9e8ZCACfrwAdlhREt3IKb/wQv6c7XAvzJVMM4RN25WXYTPUfhRl8hVUlmcwkLvAAM6QLqtN7mVX
 wStj7XURMI06AU8Nj5xqhX07IpRkjGlV3GkPDh1C1Cmzuk4ScrbDsqpcJJKgP+1Usd9886E/Izw
 pBV05q06fiwYyxVjG5tPksfwMaZrtA8/I5eD2DVaAHFKy+ukkkRxRaKD/CtP3SbNA66RoLzCfgl
 T3SJgchY+akReqbBi24lldIbNT2zTwUUNAYaF43/iy36vFFAqLxn2GHYbJion3k8e6m5QB5pCgU
 iqKVU9Ip2UuvI7l8iSq+cTrqa+wjzBursNr2G1M6/n2FlXFe
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB and UFS QMP PHYs on this board, feeding 1.2V to vdda-phy and 0.9V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 12dd4ebda47a ("arm64: dts: qcom: Fix usb entries for SA8155p adp board")
Fixes: 5b85e8f2225c ("arm64: dts: qcom: sa8155p-adp: Add base dts file")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 388d5ecee949..3e22ee8b5092 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -428,8 +428,8 @@ &ufs_mem_hc {
 &ufs_mem_phy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l8c_1p2>;
-	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l8c_1p2>;
 };
 
 &usb_1 {
@@ -474,8 +474,8 @@ &usb_2_hsphy {
 
 &usb_2_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l8c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-phy-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l8c_1p2>;
 };
 
 &pcie0 {

-- 
2.43.0


