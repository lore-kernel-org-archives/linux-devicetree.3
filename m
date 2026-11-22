Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383984;
	b=tqjhrf2itNYXzGFJZjBQ9trLxo22IKGTOLoHH7ZGzFsijtokmHEdC81qeSfzfuMaZf3Q
	 QA230kwatj5iO2eE33baQGcxgUpJK6tC07npxdsdRa2ZkQwI9j6hlVhAT37/d94BFW0aa
	 B9ge4YmU9J/IugJhrg7+m3fIS6efMKwPxdMyjBPGqWXNO3CJMv/qmxIWEW7FOXHpu3uQ9
	 bsdhfPg62krkaxF3qCGj2WOkcd0dkE1ADAluQER/PkMAzMCFcNwahjkUthjPYYSPWuUXR
	 ZVnOmCEXJ74RS/97s44BenIE6yeQj8pbml9KqanUqiXm/J/IcDocRZ/2WIdOKriAn+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383984;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MI0kpinXY8PQS+riRrYRSejf4iJugr+k2u7JnoFuvr0=;
	b=TsQa13z59670wwrx7v3FUskg6/k6OyDqkJAHO1UT4EUFFMUOU1UrDKCJZ5HGWVztaZK6
	 wPcROpUsAN0XC54XhzblFYD8/9RTr1kXiJMT09k+p9pax2dil0gIMG+kUfAWX6KRdpqhm
	 xiP7R1s9pdIqj98XKasw9vDF30Q5mfEVotWT34f10dIxNEahwZrAHfrGLEDqh2bfMrz0O
	 kTyg21C3ear4h6+6FiqCRebyDMfrcMBXTivTrTi9UBiZUgqsP2Gc0++rM9jUhllWw4nnt
	 BRSsDLGP7eocF28FzzDDtddCsMqbHej5NPqlkKbomYnDjjkdvyk8gUs9EpAtYxiBJuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDycofpL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B7606A320;
	Sun, 22 Nov 2026 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDycofpL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795383983;
	b=Jmpt13p+TOhLBBqbqeGaiatEoIK5EcHl/NrIm9ksRBF9J2t5H4yb6bnNwkKPD0ir+W5R
	 Cf5nYF+UD8rnVF5TJUgUITgRtPG48GcMy1FgdBxX2lJy1J8/ZlfDiTA08qE/MMne5cyk2
	 Qhip6QrOZO2Synyu+1bPMVeKpPbnjnPqVlHWZUWxvgDBW2w2SzPvTUR741TGCVtPR9KGv
	 eN1Qe1omyLrrrM0i1Z496X2zD6m/ywE9S0ziIVdcKzuNblIgC+kKAEZnC4yLpaVHyI/Tw
	 5YZfHaXp/JK8SkdRhcWF1wQcuAmIRCUf9EacYqlD9j74h+OHEwhUd/zpYnQd4GHNP9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795383983;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MI0kpinXY8PQS+riRrYRSejf4iJugr+k2u7JnoFuvr0=;
	b=rVOmP/OLzbXyG/v7quIDG499nDUl65RfJke03LR50m/MMJfdyChsrqVzwKF+Aj9oLJkF
	 Eqk+7z5wDIsWEy1E7Ut4V58IeW7CPFr/xKNvBOp2hMUZmwliwmEDYvmlgor3s9Sbdl+/V
	 dXuUeryThgdv3+AGjRJn89ma5/P4Zz/o3x5HJ1ID85rLaU8nSe2DB13T9OeQ35GxCi+Cf
	 O/8FMHQX5JZ/UAIxXUNVjxDdJ28Tms4wEyZkt4JI1TgIC98ujZP+dce2tvAJh4ax3LZ8r
	 SA8gKPZMsaxoCpb9VCBi+LZkwhmiPRbnM+J1IgjFosyWDj2UhH5qo+CVxLov4mn+zvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D03021F000CA;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383983;
	bh=MI0kpinXY8PQS+riRrYRSejf4iJugr+k2u7JnoFuvr0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cDycofpLID2nQdJ9OHKlJyFm9BUyfoms/VwTcrpcKPV5M10/loaY1WvXzaIO5vWxt
	 Uv9evSDnPVCL6plZD+ERv0lWbVNvbWmW8vIk4Oo1n0qk4wkFKqhCTMqOWjbD3lbA+n
	 tfu3gMj5pNq+AaS8b9Wcr+hlb2sbBum5DwHvl+nJT0qZ04h7LbPD4tzTf0shOkx0Ey
	 VC8cJ9NIgMKlkwBKxDniO71RfKOPJGy+VismJ8YUOUYf+kB6DcQ6BSlgRoP1LQ9qOO
	 HDpvlRPOy2f4N3FZuVVhYwQWuzkPtZJdDoFSwTnXv3kjgAseXu7iZ2yRsYk2Gv/ove
	 Fy7UAEHSjUR+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 532694C207;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 15:46:16 -0600
Subject: [PATCH 1/4] arm64: dts: qcom: qcs8550-retroidpocket-nova: Remove
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
Message-Id: <20261122-rp-qcs8550-display-v1-1-d513d9819a34@gmail.com>
References: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
In-Reply-To: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795383979; l=1203;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=179YKHLvNNa1LrCEnmKzvwXZC97Kf2YubmEHcIb0YwI=;
 b=Eykh6KwoB5x0+roEJgHA/HVZqvPkoh7FKyFA0w2Q9xMGUY9XgzzWlwKkc8+36pUzeg0mJ6HKc
 Ych0OYERGOzDAwingIzt1Z18qZaoHDmlxts84VEb6xEYhUd3CFA4raz
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
 arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
index 0a0546977a026..ef1356f4c34ce 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
@@ -10,18 +10,6 @@
 	model = "Retroid Pocket Nova";
 	compatible = "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";
 
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


