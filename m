Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795128015;
	b=fwB39Z+XbkV8pzlA99/BPwyLMb3Mai7dJLwt3T5OEDYmKY02JVzwz/887EOIk6ooI+bI
	 Sr6NdOfgIQO3L73TYSnMDQ1lK7usbu8g9vcr5okBURw9Chtt1Ng+2ZsHNW5ojRp6L9/3v
	 o+ZeX3BXptFVAH/tsVJw5lEfoKwyGwCp+gJPnvL9MbWfg1dKhx2ZKYwtdX10R56hSU5t3
	 1l1tpSsGtpNeBn/lgR/P+jcUTHtWlXhqfCe5F6yesX4kL2Ny7Pmh0J7L/OTO4o3oAar6W
	 lBaMwWgauoPImedEW6eluVQ50ej3udzY0TOSQ5uPHA5vyKQ1kfK1aTod1QR+Qk1tbMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128015;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C8yvg5B5ossZhG7+FrTpUBFRY56QiJDsKLjWqMPJdQM=;
	b=RH5Hw3m9VK6nT7qdnCLa52NvHjx9iq+R8iSkuVU1/UPZttEc3+pMgbISV8JFFWWBaNMQ
	 sK3jF06eO/ycFII/Zx56gPKcfCoD0VITS1eyRS76qEYFFp1npYTdTMJBIx4duugAGPtod
	 0V39M39qo/Ol01+WtEtE+Ybs5LiBaBRV1T0RcP+a2Z68tHGzeg1Ak1Ldp6LTT4vc37o6h
	 86uGYOJ/DVoW3RTHCuJiEE/3Oaqr7e19cwwB8TEuauwAlMzG5glbrUD70PAS7vfbJkmM6
	 oYjP07u/I0db+85aY/kni3SrvRliPrk06hM7bELNCjmrkRQP4HKOZnn1ddQJk1SVoBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHO8+qXA;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A20606A333;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHO8+qXA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795128015;
	b=bY1Bh2GTUMmla9I03Am+s92/S4rd/jFQIe3tcv3IneqJOaQJOMN1ttmbqTOb05OMDLy2
	 ac1gTcCxbFj/7s8Frgv8RQ+PmyYloqPyVWlSDZ+0F/2MQDfRTFVU+qSuUKFRJEF9oBHJ4
	 3HAN0owXOwF+y/KwGhUbxU7gno7qegco9Q6M4yRBs28MTn0jjtAjGWkVx45iNh9DWEx7f
	 UXehmOggFeU4XlLl8tybe9xzexCpV46/6msNFr2mrzTal9nmYlgK9Ld9ik+M8FpIblLqD
	 q5Psun9UxvY88AQzsSpuMZDTBt4MGdfUaGPphKD0yiH6pO+6RVm4zcC5PLgfmN1UB9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795128015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C8yvg5B5ossZhG7+FrTpUBFRY56QiJDsKLjWqMPJdQM=;
	b=DmU4C0fAHYyonL6GUSv+Cbt8NnHUrgPg9U7Cdr58k5bJyHp4CViEcV+wy6WdlW2pn0Gj
	 Il0Y+ozWrQ6OWM2+OxjDkua0ZVMp+4Rgt+Bf1TyNXCxK9EdEMgVF8wTRhRlqfcXxh1n3X
	 nQVGDxlrtK+2fziU9+Wp+LjZ8b0GmnfIFs2JLMu1iCHTbvSCRePKcGJslPTNxdO4IfnFl
	 cZbZWF/F0mE8MW35wZo2dcIVy1qihSw+Vq1uULOkkPxDnUEa3NpES3t2VIXQwtZUjFqru
	 ooiWI7d0rculBgKPT+ShsOBgZF1znlKOpy+ARKkLROLVZs54V0rT9XED10kHrSdfg7g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63DA41F000CA;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128015;
	bh=C8yvg5B5ossZhG7+FrTpUBFRY56QiJDsKLjWqMPJdQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GHO8+qXA0gJCpFCbsnBB6A/Ie7hKMnMLOLA5297ZXSRjocy+Y98CXOgk6VOwcNxbZ
	 RmvnDBaQ23b3niOZq05Qh/5MHF7Rio5eF89AmquXWcVAs81WWDrcAVN21GA/hEUd8C
	 IFuldnxBxyqhKP1VlEvE2ZZ5NE3l35yCGXCsk7xIkb6BKGJCVWM4X4I4avZZlwuJyz
	 n4xp848PEEiNzWuOsbU1CwJ24Ga8Ud44W6s22PQwU7Tb13MVlTC1g/kvqMnVf+JqTI
	 Ghot2hL/lTyYT/NGVkQDjZRkeqzfENZ25EbqV3iFTeVNbkKhmFuO8D8LrUOOZrlDxj
	 zwFQqTQUR5i/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E6161422D0;
	Thu, 19 Nov 2026 22:40:13 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 19 Nov 2026 23:40:06 +0100
Subject: [PATCH 3/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add rear
 flash LED
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-b4-gts9wifi-followups-v1-3-2e2388589a62@dxdmail.cc>
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795128013; l=1422;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=LklzicKTYQYo/JFeFrkMHKE6fg9/z8CBkJFyC8WJ7Fk=;
 b=6Kv44Z130PJiYrpvk/y2vkSC6hhyyhQTge28cEelavFUk++WK/ZJBmVPgRXJtVINxxaktapjs
 69mp3pCCkzbD+ytbFLxOsGflWTwKQZbcvnGpDhhnwzwXTx7kzFxLdZu
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

The rear flash is a white LED driven by the first two channels of the
PM8550 flash module. The flash current and timeout limits are those of
the vendor kernel, and the torch current is limited to 500 mA as on
SM8550 QRD and Xperia 1 V.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
index 3832ea0deb46..ea69d161e6b6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8550.dtsi"
@@ -641,6 +642,19 @@ wifi@0 {
 	};
 };
 
+&pm8550_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";

-- 
2.56.1


