Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14D93D2FFB;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=HedFKS+ZmZ10/GAGHZGYh+78f6KuPdBjxPGY3AlMF+tKFOrkS+5NqZEBIbJo3ehGJE1H6hACkOVSAah/kcl6vIooQFWLimxEFdFprYZ8uMWrhNPS2WdjfqlE1tgvsgAgltdsDZTkoLcLHQ2E3h7dIrt8JjzSoPqE5ExhlW+zeJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=19TG+042RMoLLODO6KB/p2TZfNTalrWi9rhS4BhVVKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqYK0yD2vNet6qoeuNRn2A3tUKrPS3eZQEV7mSZBKa8Pf4M+Ggw16einjsZKhgeRWdzEcpnttIy78XLKzuShYp8LDjWYwehcpDtgM1h1eLiIsSb9mQKkCJ8+uipLQU6FbzpvasMTOai+B4WiJka/j2AH9wcHBWfesImC3TGXcNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpTPjQOi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpTPjQOi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59BB4C2BCC9;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=19TG+042RMoLLODO6KB/p2TZfNTalrWi9rhS4BhVVKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NpTPjQOiCqcxFXbNq1QCKqZm2hhl9WxpRwZJG5e02G0rBh0GXJb9OEz4pw1IFOy8x
	 lJOf7JgOWg6CVaf9FQ4hkanl/hLYzumt+Y1W2XlA7x20dQQ42lVf4FJp/PmAHW1SlR
	 fWf2YA4GKOzCoUbEoRo6cW8X2ZYaUdoFz4OimmU70aJg5dioppThuEwOpALXCpnwMM
	 aa+b/vfzXq9hUFDzQJU5dmJ6MlbahERivRVrN/A2hcJUcnr6I5Y4mbPpc5ksbhh04W
	 rMFgPqzcFmlcCYFcYOObhbbOvpAXQt07bseqYuTdHF3gOSM+hodA7187tFyvMjRIvo
	 Tgb1b6YSmqg5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0A0CD5BAC;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Fri, 22 May 2026 12:43:21 +0200
Subject: [PATCH v2 05/10] arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane
 DP support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-surface-sp9-5g-for-next-v2-5-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=1454;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=JwGUVgyF47WHGt87ffW8MdWJ4VD2VzS3ahkXbtkzLv8=;
 b=1ZDmCmOssQ/lQjJ3gwswLADV+sbSbIAszkS8mGHociS4HGMRIk+vzb3xQIg/2qAlZhcnxqOed
 pkTRanwB7zfAcEeYI+ib/90aKz1UCNIj0GmUdERC1FDojcT1OJvQtK3
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers and allow mode-switch events to reach the QMP Combo PHYs
for the 2 left-side USB-C ports.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 9abb52e3763715c8f72f8c95c068fd0b32901a1d..10fafd752734450ecddb2113ff972a08793a763c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -494,7 +494,7 @@ &mdss0_dp0 {
 };
 
 &mdss0_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_0_qmpphy_dp_in>;
 };
 
@@ -503,7 +503,7 @@ &mdss0_dp1 {
 };
 
 &mdss0_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
@@ -840,6 +840,7 @@ &usb_0_qmpphy {
 	vdda-phy-supply = <&vreg_l9d>;
 	vdda-pll-supply = <&vreg_l4d>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
@@ -877,6 +878,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l4b>;
 	vdda-pll-supply = <&vreg_l3b>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.47.3


