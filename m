Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162939CD10;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=Q5d22zOH9LSjI/xsw/uFh1+oyewEEpElqsz4qPUgyVI74JQRWSYju/VKpzSjQK7C/+HPlMMKczF35xzhh0xooJcHANQJciOAkuFosqLuk4FeAae3bsc72qykY8jgqc/un9Fi0jTOr39Q/Esl8fsqq75ffDRVSDsgZaZI7g++TY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=77dBDGg8bMS8KPoAffm8M/LVpCcsYOVeIxJm4BfmZYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCn4DndoLXvYdy13C6OIoF643otnp1Qh+IRJZVIG+C04wdhEkfSD0yD5rkuHy/R32Bu5tKoYtGz8tyGTKTaA+ZucxhhjOr3arnfqkJijureFzp4W9fqBKvsccXdtITbVv09vM8XjHRrQOdZ3NpvTiyoTDoV+O9CH9SvT5c8iWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKmdAEsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKmdAEsh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CF96C2BCB9;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=77dBDGg8bMS8KPoAffm8M/LVpCcsYOVeIxJm4BfmZYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OKmdAEsh/gJAPOQzdtOXTKE2KqjweRwzJ5EiWZ4VoeCuBgnyBeV3Um8f8eYLNDJ+m
	 T5B/Q9ogW2xc5mw8mwwGn2GhJMtnn9zi9/T49xeKIWag2elzruTON0vsVUrREncbhN
	 k1zzLR9PN+Xm3ozrqX3VP8uwcFOqT4XGGjEoEtEuP+Gf6TNPQz+3KI8rkMFwoeDMN9
	 G6+Wn1AaYT0f/ZZikvx6vK79SkrXqMTFnmCt0a+yDA50ATglQ2Hq+ALiJ6h+6OpTQ0
	 4WjMiROGAv++J1k+mlZFcRYvSUw12Gwx39EkPZ8wPcdXV1oVZoCFaX1SbdcBLH3qyb
	 uDtxD3F8tGkLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB38C55175;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:09 +0200
Subject: [PATCH 11/28] arm64: dts: qcom: qcs8550-aim300: Fix swapped USB
 QMP PHY vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-11-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=sVIw/XA4Bl5xC2ztfAnRuiSiLBDt6b5+q7ceIieDwBs=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYsgqMEuZXvuoIf7qm4IjLz+1n9eX/KGi4xen9exKy5ZF+
 RUtYhLSnYzGLAyMXAyyYoos6UudtRo9Tt9YEqE+HWYQKxPIFAYuTgGYCJ8gB8PCjH7Df/x5jhd0
 pr7Oiwj8d+G61r4NGzJqtXlDsgL5++Icz0msryq41RG+wEhUOGGxkNRclbdze2aXb2y4+9RuUkH
 /i8NVxRcO6+/LnKVjsyhUZxrv7/DwQLFHHa8/3K37yJ8mHt96JExBr6pcIcPDQf5xWuiTLSc6m1
 pCHuxfamTq93nSV74CHc5dwRuVhVa8yYot1034PuOJfz7rjQ2Roq0bt9W07EvcuGuzkuhx9ZDVv
 Nsr3/SmHJjx9ghHUWu4zdkjmt5f+Cpf/3KNeMgfKjXH2uCJr+1cb9as5WGOxw6Lrapq/yF28kBp
 7rdgr8alvB38DEU9X46Gdc7171YKW/3tqr74zRRLu9/LAA==
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHY on this board, feeding 1.2V to vdda-phy and 0.88V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 0b12da4e28d8 ("arm64: dts: qcom: add base AIM300 dtsi")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index e6ebb643203b..ae301d78e071 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -412,8 +412,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3f_0p88>;
+	vdda-phy-supply = <&vreg_l3f_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 };
 
 &xo_board {

-- 
2.43.0


