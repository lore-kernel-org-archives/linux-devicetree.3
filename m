Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128AB47AF43;
	Thu,  4 Jun 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589930; cv=none; b=OLtNgXnJ9J751cn8lGf999pYXvYV/Axc6YGf1fS9LcWgmw77CBkPS/HsEwYkisqWcIDxvhMHz060nrTbgYGRonkH+yDalWY5dYv9Ss0HCinOY76rOtJLI8W3GXkG0TrD2o2oEmrxBa68wywtWjn2KPiAgxM+BPFSvww+o+a0R0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589930; c=relaxed/simple;
	bh=kxnjuRTiKTs+5gefOHkwfKnnZ3Ix5LR40ODn9kqAVm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rn27FVT3EGWXoHl78lGCSfySreh/lfUuWMTXDGEP8DHLhTdVKm9vsQXtALsLapRyiDEvY3N/eh8QepaJR04QyQXPcub/naCjT5J/nYOOnoU2+saBhuoo/t9oAO+BxDnUQUOl5q8dcR9oT7K2OH26az0OlEmlJUxDRLF7rgDSnqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXB03zIw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXB03zIw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE88CC2BD00;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589929;
	bh=kxnjuRTiKTs+5gefOHkwfKnnZ3Ix5LR40ODn9kqAVm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kXB03zIwhwntfBPMajEsvgxCip681yqOi3vAnZRMgOuHjw6XC31Lro912XupQvd+k
	 SLFLfRQztUzTmd4ZvOb6TACUP+Q0vk5z2LhCHTI8oUWJLBMkCMx3gQO+vOyzaxYkyN
	 GdBl0e9OjfXmFKf/bHnCAeQxkM1Etbwo/caFvQabQ4+rQtNLCzrM3M/rX+1M9iSorO
	 bIVJYm0ZPCG/enchCB8S/qRZBsizJQI57i1T7lJ1ZXfU5eJgBlXvvGLpBwuwH3mb3b
	 ESbFAsEFVtUoyT50YWuyO4DTEx52w4JdEzTbEMtwvOX+D/6qq6sMTBGjfl+XRnViQ0
	 AzWgdeBDLJHgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E30ECD6E78;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 04 Jun 2026 18:18:40 +0200
Subject: [PATCH v3 04/10] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C
 DP alt mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-surface-sp9-5g-for-next-v3-4-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780589927; l=1857;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=MRL4eJ9PRvb7b5o8BhAdPF9ViAp+Bl3LCkpYfmKJu5w=;
 b=UVdmEezRTwRNgJWyWxalQ9eqOUNziIGlZpDU/N54BzAn/bYPvZy8PFTx3zMa1wtDAeGVVWjIX
 b0qO0jfTbm3BUuVvp6Z4uye1sM2r49nL6f6mHdYN3tUCAAJsj48yswk
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
working on the Surface Pro 9 5G.

Investigation [1] by Jens on the Windows Dev Kit (WDK2023), the other
sc8280xp-based "blackrock" model from Microsoft, found a reference
to GPIO 100 in the DSDT in addition to 101. Switching to GPIO 100
fixed the issue on blackrock, as it does on arcata to enable
external screen when using the left-side top USB-C port.

[1] https://lore.kernel.org/all/20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz/

Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Fixes: f6231a2eefd4 ("arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index c3b143ed11c73b7c1bedc576c10af8db30effc36..9abb52e3763715c8f72f8c95c068fd0b32901a1d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -270,7 +270,7 @@ map1 {
 	usb0-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
-		enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&usb0_sbu_default>;
@@ -1079,7 +1079,7 @@ tx-pins {
 
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
-			pins = "gpio101";
+			pins = "gpio100";
 			function = "gpio";
 			bias-disable;
 			drive-strength = <16>;

-- 
2.47.3


