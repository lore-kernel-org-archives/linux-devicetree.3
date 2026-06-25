Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C3130E831;
	Thu, 25 Jun 2026 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376969; cv=none; b=kt8feczjpBNV505LzsyUxDdBtm3zfO9aX/xLfdhCfCsvqMhyGglIiKocPtp1Df5eFkXJLtVTbEQ3kmBjkgUtc8ZkXpBvEISeBTvWoYj13wXKc1eLL/ZDx7FUElaxaEDrHebOvo/tzb2S6RMnRFcYH+pB8JVcX4T8hyqZD6Y3OBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376969; c=relaxed/simple;
	bh=K3HKPYyJofRb3cLQpaA8dyYqaH2fIhKnG6VaAwKE62o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pT6kz/MkLh0NkDL2xdFpRERdOkRaaftuYaCsAFYUWo1QmjCCDBPvJbGfuMlY4ydGc5hIj6rK8G/5ekB7LtmiOiybuMNyxa/fnfa0vHwnJ8vvyeTIJUm7E5B5Rwx1Rnqtr1ECqQVO3/csEa7W2bc0p6ho05QWEybSQ/4SpsbJwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmqS50eV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmqS50eV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06461F00A3D;
	Thu, 25 Jun 2026 08:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376968;
	bh=yCZkKrTgoFrJtnFixlEN0th2zJIgTQaaRt7O4yiSnhg=;
	h=From:Date:Subject:To:Cc;
	b=VmqS50eV5ilEOTQJpsgoEZzDjlvxthS+vCxcXy62aI3epznKEJWP3sI1N29VlxegE
	 D4QlfbhQSuTuREEfGYnayGTgjEgc3C5yKgWeu1WD5f0DhMiKFShym3MsAYhp/abmU3
	 0A1LYThV9PiTMikluYzVY5C1WAoEqt691T7L0ytAEGJ0P5Ee3Z9L1UfTzxmCd1+Ax5
	 GvLSlD5VsXL7roo2cDtuKS02SuGfvnykwS/MsT4pN8dV6UmXdL0z/JfPXcHY72hRen
	 06Gr2hLPQHegEgFNb0VsWF3M6MU07QmE1qxQ2OwldfPeSTfECSI8yAP308ZuIl92lF
	 pV/UD4Hp/AvxA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 25 Jun 2026 10:42:43 +0200
Subject: [PATCH] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604
 enable GPIO
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-topic-ti_drv2604_dtwarn-v1-1-76e91fcafbe8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTeQRA3YVyklmGTaThdRJvEC4
 rsbdfkdOP8GCZkwwbPagHGmREMsUI8K/K+PXxQUikFLbaTRrcjDSF5ksoHnMjU25KXnKKRxXnW
 qbjtXQ3mPjB9ar/LrfTtN7o8+nznY9wOxY39XewAAAA==
X-Change-ID: 20260625-topic-ti_drv2604_dtwarn-06bc191359b3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Raffaele Tranquillini <raffaele.tranquillini@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782376965; l=1233;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DPjptcUhigJiIbreUPlKcoE8dMc+hsqt7sPDdf9VIlk=;
 b=WqXJk0kHeuIg2F4psQ5uILn30LJuAvv63AVJYsyN7sN3BxQlXvxm+JK52uIS+XfZUfE7965sM
 oDZRXxO6k6kDjiYMi0oYp/BmFs7AeK/nRiQP+xjH+GzPadRVfA+/3iS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Update the 'enable-gpio' property name to 'enable-gpios' to conform to
the bindings for the TI DRV2604 haptics module. While at it, use the
GPIO_ACTIVE_HIGH define instead of the raw literal.

Fixes: 4ac46b3682c5 ("arm64: dts: qcom: msm8996: xiaomi-gemini: Add support for Xiaomi Mi 5")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index fd3a2121465b..ca22e2f9d20a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -39,7 +39,7 @@ &blsp2_i2c3 {
 	haptics: drv2604@5a {
 		compatible = "ti,drv2604";
 		reg = <0x5a>;
-		enable-gpio = <&tlmm 93 0x00>;
+		enable-gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
 		mode = <DRV260X_LRA_MODE>;
 		library-sel = <DRV260X_LIB_LRA>;
 		pinctrl-names = "default","sleep";

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-topic-ti_drv2604_dtwarn-06bc191359b3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

