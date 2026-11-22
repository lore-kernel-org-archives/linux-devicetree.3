Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383988;
	b=5m8kCgifBEpV39qRb9H2Xxn8yO8BArx54yRiNd8cQNM7zxL1Grc+KfjnlR/bnSRDLsAo
	 0ZYCi2iPeIU4sMzew0kFjP+xsFGNCQqVQeWw1ng13XcGFjvivKYAZROGyN4Rqs80TPkbd
	 e3Blzi/JX05bbrcqzgApRJoumnz99yRqkRHOh/AqJab7JiEGZOVfsKezZD/SqimEAMjuZ
	 r/a0PZwDQi+qzX4MbP4XcRb/4e6hLKFsVWNK41ZnvMrwhXkh+DjZiGZ0ybqkT6KgoNZMJ
	 iPUyYQFkC1DdT0hMfUY4cKMXGggqBLFrMoen/BlYeCwbsLpPoHZdIIT9rYbkRQTFC4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383988;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=60vzWfDSgUirg3Fa93+C+3eigBTGfImoqoho2GYyLOM=;
	b=kbydlHnjmtIoOfwe1ZLBRUjDoVnFlSmvBBTVvwM4POoBIrWKyuKRDwPQ9R+vlkW8g15s
	 uxyfr+nSzwrPoNjjZdtz/oj7iYWP63wANRzVg3b7UjQHj1IwDx3a/ppZNyneNTgZccnQ4
	 wpykf0J2iyT+su7Tdjy1RjiNUfOGsf6ujETn5CT4+eeGrphYew/3QisWHj88RqoW2noqR
	 NhwrNxAyLH8b9q+nz68vdACkAQGg4edbFmqDuVYw/T+j6FbQt+tl7O0AhqHtGbuW4TNlr
	 i0pl6D/FtbNUfZj6HLI43H8nJXvLldNKFliGqxm+mRk5V3j7V6Ntbvl0io1lkkmmbWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjcuszL+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FAD606A31D;
	Sun, 22 Nov 2026 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjcuszL+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795383988;
	b=RQAkshyei2FHIcJZbv8GUk44CZKLW81MRVxywxH8YqNwpp0vUGZyRcBlGqbSNP9slHVe
	 uIso2HBLThawHdQ9cmsjxOtxIYQkkVHgTzpat2wN6OUhiEjsQS8wW/5tacNSNJQ4C1/kL
	 jvY/qPivvrowsWRKHeKlA5DhKKd/bf2n+6VSlHeL2x8Nb69rr0ptsk2IzlFjH+fq2Fl33
	 7dQ/gkLRl1bzbTSib0069MJGZ0gLZAAkklw5u6GlpmzIpXC5YDX+YHyWEJdb6o5vDVOSo
	 u2Dem9/1epB6KfwtxtRayv6xPARlYeDLQJWcrWL0ZPj8n/xNuUKHfEjWoiy47s+750A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795383988;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=60vzWfDSgUirg3Fa93+C+3eigBTGfImoqoho2GYyLOM=;
	b=gTWo8lBKQAsT28zZQeYaxXUiRaMHoAi6zvFsf45DH5XtDNrrfHEnIyEkSn49BATX3QZz
	 XOvpb6nok0A4FA/fb0hE7XDzgNjusTDCCE/OwLlKEI+hbTs8s/fOwLYSWljWx+Wo3twYh
	 VlM+srcni0moKXUpJhx6nGXB8+7MCJIt1BGJK2K/ySrHAVJiaYJh4P/MVOBi2bBSfW/vU
	 Aa2YzjTo6VrNFEARNHj/WOGKNASDQK8EZWrKWZKn2P4431I8HZoxAtACtyT9iAaWPXEMy
	 /EHlINltD563o7xepm9nXtpqFbste9VL4ttoGbI6/ca8a9+My9nn2+PKPYDniO7o0aA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F0DA1F000D2;
	Sun, 22 Nov 2026 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383988;
	bh=60vzWfDSgUirg3Fa93+C+3eigBTGfImoqoho2GYyLOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VjcuszL+4Cg34rTXgb8sbZiafsjzcNyA4HZn+Xuo/q7VhrNCBo2dLh2IMcKHDENx2
	 UD2vLwu2aHqXTaMpBVM+QocX/pKEXBxFBZUnNbGY9tEzYEGP+JsJoO1hvoD26Mfhaq
	 w81Z7pVFY/YBCtO5UPvLHjTBFT2IoOyIbaKZ0JRiqE4rqtAlDb4XqU7DJrDD99D4Id
	 dqYnjSicBUfbCU12drnIw/cTi0sMJkqVf3ZN6vik4CUm9f7E+qCRyCm9TFPwMYl3Ip
	 diooDlVOsEqZU6kcf9llU8L3t17Q7w8k+SxGDyt+8xxwventHrOMrtZXU4RNruvQbe
	 qAVkSHFExhDzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8FDBA4C217;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 15:46:18 -0600
Subject: [PATCH 3/4] arm64: dts: qcom: qcs8550-retroidpocket-rp6: Remove
 pwm backlight
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
Message-Id: <20261122-rp-qcs8550-display-v1-3-d513d9819a34@gmail.com>
References: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
In-Reply-To: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795383979; l=1194;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=XJhe98HFyVSwJqUvStUrAk0mwelhqDfoIAU2HEa6TOw=;
 b=Pqr+YO1s/WqKaWfJ92j1Fo/ql2Bss1xvYIHXyexKvxKIUW0B4CvnfsZYrtof17aBRbZRXH87M
 Qi/EW/QxwPBAc/R7FZhgF2MuiV+S+DkKgx0ogrdNOOBZ/L8Ue54BHVT
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
Content-Transfer-Encoding: 7bit

From: Aaron Kling <webgeek1234@gmail.com>

This device does not use a pwm backlight, it has a backlight controlled
by dcs commands via the panel.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
index a93fe74b83383..91fed8795d611 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
@@ -13,18 +13,6 @@
 	model = "Retroid Pocket 6";
 	compatible = "retroidpocket,rp6", "qcom,qcs8550", "qcom,sm8550";
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 860000>;
-		brightness-levels = <1023 0>;
-		num-interpolated-steps = <1023>;
-		default-brightness-level = <600>;
-		power-supply = <&vph_pwr>;
-		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
-		pinctrl-0 = <&pwm_backlight_default>;
-		pinctrl-names = "default";
-	};
-
 	vdd_disp_1v8: regulator-vdd-disp-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_disp_1v8";

-- 
2.56.0


