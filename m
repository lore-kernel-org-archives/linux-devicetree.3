Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43A367B8D;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=WsUDfzHuFtRkQLmC2D2YpfB3jspf1Y9cvpuPlJhtPnmkRLMGb+ChvLzB9YI7aBbXsLwhqfMQSdIz4zuolg1Lkmk8s0ujfWuhpaOTTej5QKe1QsxOHe1AH0YAOoOIXicb7bYB06xQIH63RQ/PNZwQfRQJhwn0rDXhph4SmlLf1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=T7ixgJATbtiNqWCiShqQhrQpfemSzKpwMeeRfU+mkZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/ZEtoUJEqgYOIGSrbVHmym73U/yZd6VPI+BBio5UyVLEPbIvNUB77CrC5W4kOFCb/qa+Lr+zFm6MBrzqFVUhAoVmmRMqQ7s7Y8T5lM8dRjXCBJ1Id8/bkPJJkhBr8+0LcqPNYMPQxbY0u9FVCLbUFxmk4uMLQgSoTzI2rT5SEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od3vVqIC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od3vVqIC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22214C2BCF5;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=T7ixgJATbtiNqWCiShqQhrQpfemSzKpwMeeRfU+mkZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Od3vVqICKDYQkDCwvE3Fl20ylnBWY5UucRCCEWHD8CsvrLX9fxEbVpL8bRHykcTmv
	 PnlN1fqK7W+OomO9Cko8dthzBBHa/pfXnb2NUDWGtH0QnFJP7KbKDwMdgO8Vzy/GcF
	 COY0pYikMkAhkyqktaBFE3l3+hEk1io+SJnFDT70bbZuZ0yi7pzv/Px7Bv1VLB7n9d
	 uu1piYhyJ5jmh/4c972gn/2qFPA37Hkl+m8py4nwYRxaU0S1DECfb4+vApmtWCV+a7
	 XXXb9DMQM0cvJNYvQyI1MIQGi5OTv6FS8QACcHvD8tyKb81h0jjPSjhjeDCSrLxTtX
	 trTO/o0QSaJDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19616CD5BAB;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:09 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP
 alt mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
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
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1796;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=laHptHDVcqodWotuInI4TOhBzYCitWFmkNnL90r2puk=;
 b=ELGTpbD9se5Jeclc7Z5xfOhf29cTYVC0764Fc3jfUQH3LSJDDj6Pe2ah4ok9/i2Q5vEoQT5ep
 9Q0nCe0e86TC7VwgFU+gILU9Hf54Np/JLzKhTJNbSgbtvG6GU4VowFY
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
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Fixes: f6231a2eefd4 ("arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G")
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 49c0ecfc6c055ef2cd85db022d9340ecb88b7fc4..50fabf8961fd9869a31f24a69da854348fc1d891 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -287,7 +287,7 @@ map1 {
 	usb0-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
-		enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&usb0_sbu_default>;
@@ -1101,7 +1101,7 @@ tx-pins {
 
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
-			pins = "gpio101";
+			pins = "gpio100";
 			function = "gpio";
 			bias-disable;
 			drive-strength = <16>;

-- 
2.47.3


