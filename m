Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2B369D75;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=YkrgoLLW7ZK4CDyAxKgkRrUBLr4SQTBcYtlz62vgOqQ4RSuAe3x+ZS60YaJ2ANoilVBb8w7Sds1X8zDC2dhiHfMeXT0BotpXJmP/cf8GwJ+MqpLJbnCwfBLJOi0f/0DYoMugVmxhaPUdjiyXcPLBz3Kx9hZ1WD5ljDWHeQ4MYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=/9VFXOIrDTmsaRGIpfBhyGky7U3ePqGPs3c3z2SrfI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ew956Xula8CdD3PEKMKCV49NuMssviDxt5LRi0RcMRTYBYVazUZTu8scBVPp4W2J8FD4R6EDhfco5TejDBQoo421FbmuWeq/uj4fGgLWQSej4isKOnlgds3ktgeMwlu+DQwLKrPf5lX9L3sqJp728WDDoYBeno4XVm4YOOZ4ulU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lckgZi5n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lckgZi5n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 359A0C4AF10;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=/9VFXOIrDTmsaRGIpfBhyGky7U3ePqGPs3c3z2SrfI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lckgZi5ngo6G7SCjUadk0mXDRjiCiVYlU/PwlRa95uhdwxP3Cc+WUKr7/eD8S+Xfs
	 eIBz11iFOVmlAIS6KL7NUgRJofm7j3eCpH24nqSbauxDtaWRH4ve/jX/vC5LN58GLf
	 9QM0UM9ecbllDTtAgKbHTPbqCaYxI0upeNHU+MTuadXhiY1nqPb3jynlTv5LkO9Fbu
	 QIdmE1oKlGzFAk17NuT/ZIZJpJpkeHD5pnS4bL/r6WdnyC+39ytPnV6WjakAy3+V+4
	 uX8XRlNrQT9hyl1mlAQzPSKz5KIfAvNQDrg1IBtOZ5knn24DYYFUjlD2ddi39xDNv0
	 Aa12DjsGt3ELg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7E2CD5BA4;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:10 +0200
Subject: [PATCH 06/11] arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-6-9df52552bf87@gmail.com>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1393;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=lx3J4+zo7ps3uLQCVIV3pGEVqoBsZItSFhoKbcfiTCg=;
 b=UJ+0yhSN8wqwRTeGTEi6CzBvgxYny24Cq9h7WaaY4w+DDYCekAJjxnC2ItUVuRyz8wZxvlQha
 c254UOXT1DmAh82VQIxWTi1xIIcjC9ZLC3UaQdZ7xXj2l09yDieRNtc
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

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 50fabf8961fd9869a31f24a69da854348fc1d891..2a6f0c9de7c85a4f0659237846b0430a0b021a40 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -511,7 +511,7 @@ &mdss0_dp0 {
 };
 
 &mdss0_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_0_qmpphy_dp_in>;
 };
 
@@ -520,7 +520,7 @@ &mdss0_dp1 {
 };
 
 &mdss0_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
@@ -857,6 +857,7 @@ &usb_0_qmpphy {
 	vdda-phy-supply = <&vreg_l9d>;
 	vdda-pll-supply = <&vreg_l4d>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
@@ -894,6 +895,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l4b>;
 	vdda-pll-supply = <&vreg_l3b>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.47.3


