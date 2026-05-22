Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952AE3D25B2;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=cYha25EOH/NGhfHiEejVvxIBz+l849XEjs9gUfVNqRH5rp91SSmR/I09MlGd3j4/SsGS4zDOO4YLxwN8fs7uhD46SYfMFhawlpxU0HusCycRgEIWxL/iHnzPCAI/SSKU8rFBsc1wUX3LpemOgyZcaqUsjLclBFJFpj2ndRrcWxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=kxnjuRTiKTs+5gefOHkwfKnnZ3Ix5LR40ODn9kqAVm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tiVlRIPFQredMHnpEtSL5ljfuf+yWn17u3F2QQfv4uO4RMqTlqFt8V84xtWgdjroPupag21SQWnqYwJ5+j8rCNKwcoDR/f7kinZ+RFDpmX+gBXu45Eprqzrt0pjC6H5+S/DXWc8QNLKE3Do/zgei1XaQDRoqx+v7UFtElswHOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNpAA/+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNpAA/+l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5085BC4AF0F;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=kxnjuRTiKTs+5gefOHkwfKnnZ3Ix5LR40ODn9kqAVm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DNpAA/+l4ncidqUFW5ls/fnx8CqyBUWDyKwjG8sZLaMSAU+MX4GQJP4mvi8MXCRqU
	 CYT/nVwbjQCkLUIKfJVLndyC4vPVdLFygwGAP15Nb669jy7VDohM+mOk+jciA6ZLwV
	 Sv6FMDfJzpxBrXMt4Cfjx4hh2vhup8QdOoG2+cB8Zfo5tQQoka6ePDMi5Uilklf3kf
	 gKVq42/FLLLbieCDZs4k5iwItuQVlJaY9dJpGVE1RtbinkPMVyuWjythcWMAamD57Q
	 Gw6r7yjxMYolF6JakHM12gJEqlY3q6iW7AI5KTIr1CwoWwyonCjt5tb0SYGA+0yy+j
	 9tHMAgM903zCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41048CD5BB6;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Fri, 22 May 2026 12:43:20 +0200
Subject: [PATCH v2 04/10] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C
 DP alt mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-surface-sp9-5g-for-next-v2-4-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=1857;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=MRL4eJ9PRvb7b5o8BhAdPF9ViAp+Bl3LCkpYfmKJu5w=;
 b=xmChSvp1UQJuZVbqCPSjV98jskvr0+pfr5U16asPlINvHbB5i26GHU5zqPRkxjZ7oLRYV4GiU
 Dgshj0H14ouDmetnWAGzRIoWXVJQQ+dc3hn4U6AtjiHPJ9sRjYA8oHB
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


