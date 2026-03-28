Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E0371041;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738724; cv=none; b=aAVLBAqtEsWkU4vNmVf4TVvTYRYeBYQB2J6RqRpdE4+4s2iDIgFc/bS84D3zSnDZRT7N/djRf+d+3jWeIJp3QNlDONbD9L/0oGue/rxdwWmS4q8/AXIu6x/h+A0WlCgQvKlH+EmoDL8+ib/RGAYHqQnnBQKXFKCN4ns7z7svKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738724; c=relaxed/simple;
	bh=8xdx2HbnXq6Mh5ZvIUF+ZUXZWo/BQLtnb8f+Cdo6Grc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoZlbnNL0PGkd/eCJMoy9X9Yo9W9ed4zV0BLI2nxOeXhfYPeWS70fK7UOC28Vdx7EHUWQHBCn5Adx4k0aJP1y+Vj3jCjzdloDCxyqO/nY6RaO13I/0ajRMgDWszGwsYHtqJiCFeYp/25NP+H+LQcurZln8IdKfUDe12anjbHEwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFJksslz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFJksslz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B98CC2BCB3;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774738724;
	bh=8xdx2HbnXq6Mh5ZvIUF+ZUXZWo/BQLtnb8f+Cdo6Grc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RFJksslzzjITuKUd1UEXaFl7CmLl8xBG15X2gBgA/vjip5sqwKfpOZz21d1nGLiTh
	 y8EGjRZ4OH/+ZSAXi8d/cREGlxbAJgJ3GGPslFhZ2wTnhBQo+0X1kst4g3NeGdUxrF
	 FrmcZKJ2Ajg2md+hTckz0WzdI9/bO1c7Saf6w3rKawAwaTQtmIOWTmYv+ZAHoRU0aQ
	 FHFLW7gZf7pvKibUW3pEmciogULni835CwpKm+mMHeGcZopP7umTnzC0IqZaPfb25m
	 TH7kxxoE/Bdm8DaFJafuq+WLjMXiwMCaZHHwPZf46xul+bdfCjO81BLwaq3xX6qfBZ
	 eDmpxU3t+oDuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CCC10D1490;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Sat, 28 Mar 2026 23:58:42 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=VHLwmsN4P772ow9/6v2H4OaVcZPfDAQIcntWKTFdTMc=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBpyF0jwo9ChontKOekSZeLAjjzU+r6p2WR0QcFi
 vA/A5w5wPSJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCachdIwAKCRB6NCVl/2Nf
 ebVsD/0QRLuK8Ucw1STYeq/wT+8NLzuboHnCm7ZTq9pm1guBCDN1wiLK0waovOjOjCaHizTN70L
 qE5wX1FmsU0RiBNz4HYmRh2NYi+CZqGQwbCdcKGn6LWa/TrIDuffWf4W1W8bZ0PbpivJKaVw2uZ
 mZad7ViAZ243rQL2aJGI3571o6vYJkrK9kf5vg9lgdSfuyYtfzdQYmIMSK8fzz5ciHL3iaG5i//
 G7Zhl6L1jAaasLTRyjjPuJId/DzOQo9OU4c8fx2cYUOto2YM+q9D02m3QUcNxzCg0PQOo10hAoO
 Y6CTBswwUm/qsWQ/uDAsDAdiHEI2vSNGhpQouHPoGEFHMeT4nJh2uIoD7zVWhg3LxQzvCbKqNwr
 Wb1cnCnk7Equ8cqPTT2MPKnPlm3X8JldXltsIH0CJDKCIFbTQOz7N/Qc2js6O1QnKgzNH3EvhS4
 dr0IldQetl1S1PskjGv2RSVo5TmRZlNUyeoN7AvLDV/guSaEiiIomXZ863kNjVVjGqdDLUC1elw
 QoaCWj51oRphKBEs/Ny3lCz5em+J7jKEiIwZSGcYSwezZAx/fgdS65EJKSME90uL/k0SPUXkJOA
 Hr/MiSAuKuNjR8U9h+mZrUR4SX9K6LCQLQ4Q+L9orkIerLy05lLR8vIGPpfhmsQZSy3YC95N4WU
 DFFg0fDnr6AtDEA==
X-Developer-Key: i=pabloyoyoista@postmarketos.org; a=openpgp;
 fpr=BD0A17944A2EA8FF291309A27A342565FF635F79
X-Endpoint-Received: by B4 Relay for pabloyoyoista@postmarketos.org/default
 with auth_id=698
X-Original-From: =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
Reply-To: pabloyoyoista@postmarketos.org

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

This has been tested on the Pixel 3a with USB Cereal board

Depends on
https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 32dce1cfdf6f..e8bd5f3861e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -27,7 +27,9 @@
 /delete-node/ &gpu_mem;
 
 / {
-	aliases { };
+	aliases {
+		serial0 = &uart12;
+	};
 
 	battery: battery {
 		compatible = "simple-battery";
@@ -683,6 +685,16 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qup_uart12_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart12_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &sdhc_1 {
 	supports-cqe;
 	mmc-hs200-1_8v;
@@ -749,6 +761,10 @@ ts-switch-pins {
 	};
 };
 
+&uart12 {
+	status = "okay";
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1b_0p925>;
 	vdda-pll-supply = <&vreg_l10a_1p8>;

-- 
2.53.0


