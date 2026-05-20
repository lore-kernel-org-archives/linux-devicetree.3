Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A84436E460;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=Ez6Va0zOvhHK1sgfpIlmWj8TjDPTDQDxLnLlXDNrnMxc+M/hW+fnYSiiwzn8TrzM/T4tQJE9vf/sbIpk8TYnR37/fZ1cb9oNxWi6LbMOLzJL8cf6Ixl816nz8S5DOlQfldWVysnninyB5RuEoZ9cfGgBj75PkGAnAfcmMB25AZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=yjbTv7IE3rnG+foAIeVCcQYWym1cEuH3YQsEYTkU92o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtaOxoxAVjtgXXViBFdT4tEMnKHHSB3Brpx+MidxsHj5Q8vEDqbDYaCqEMeG1ha/WrWzW3uJabXavDxfo3TjEEX4P3IgccHX8O1XJMZHTLS+h4Wm8CjeVHaLG6Rg5iLmyvF2D8FuA17GEtM0DZ8COLuzmmjqnw6oDOY8KyflvRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chXvXKf/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chXvXKf/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49AABC32782;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=yjbTv7IE3rnG+foAIeVCcQYWym1cEuH3YQsEYTkU92o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=chXvXKf/C7UETP35+/ZNkk75kc604OtSLqgxuB+GL4ZCZIgdRDIfv2qbiDSsLJdpn
	 rMQC2P0pf+1147LdfuwPexomC2QYmBPQ1cIX4ScZ+XCagyZO40frvn8UCay/4gJK2G
	 /N31KsBxSbYybvuoKDqIR+T3H2o05F1r97tTJs4pXM+DRhqWPXJrJhiOfxU4zD3/vJ
	 laSW8CvrTIUHP9lDBhSAPfANHGadZkGni36xZj3pGUxC41uUB8vPJMwwEGWOTXKTHg
	 S9FqHwODbgtfxLQx4yXlwK0glhbZr78tCKnOv3Wpxwt/Gun5ouKl2+ezLgxvTUXXpP
	 muR2icHa886Hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F081CD5BAA;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:11 +0200
Subject: [PATCH 07/11] arm64: dts: qcom: sc8280xp-arcata: Add volume
 up/down GPIO keys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-7-9df52552bf87@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=2039;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=CfiRUKjuOkBz4gm02vzH1uF4ZTJ7kW7Ou28mRmrz7TE=;
 b=Y/MRBh06KA8oGhSHijX6zyf2PvGCEcP/zUixmH66wBm/zVVlyf3jKtq9AuHmwqKrgUOUPewvp
 eYV7SvmddAzCbGlo9tR7NQNdmx6UsFCbWIHFlviE3I7VXNzzRbZc4/D
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Configure gpio6 to serve as volume down and gpio9 as volume up to enable
the volume up/down keys located at the top of the screen.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 2a6f0c9de7c85a4f0659237846b0430a0b021a40..a300069b5960dbba28601c418951869c94b63938 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -56,6 +57,31 @@ backlight: backlight {
 		pinctrl-names = "default";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&vol_down_n>, <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-vol-down {
+			label = "Volume Down";
+			gpios = <&pmc8280_1_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pmc8280_1_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
 
@@ -939,6 +965,22 @@ edp_bl_en: edp-bl-en-state {
 		pins = "gpio8";
 		function = "normal";
 	};
+
+	vol_down_n: vol-down-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
+
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
 };
 
 &pmc8280_2_gpios {

-- 
2.47.3


