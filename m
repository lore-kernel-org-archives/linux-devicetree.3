Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244637;
	b=Qlae3ofnxhQlnfKJgehDCRHUJGzv5B7iKeshwWDtOEpGgzrQ7TpTjlA2u+OFMqtZtXH1
	 t7VRXxW9CVKaR9Bb7+ciha/EsPK1dc0+98gKJMr+uoge6ARnmxYeteSTs6SP4JjR1YcKN
	 A8Gxqe85tiwA+nlyUVnssk3dEVgrJxGJijuiCbr7GJXSzXUQQHKRl1jUP2sfvfY6YHLLG
	 KP0/Q2ZtttBgPjPcztBwVyueTDCg50BEahLpl1xGqhQugR3/KwVbFLT05HC/FFzOnXf9a
	 o3O1o49oCpJQ6XR1/HSHPyG9zNlhloJLEdpU+uHH7ADvWqPSlUHpTqgHm1sHPr5rPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244637;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=y6MFsJR848hDKlT6yRNlCrkbOqj8NXxBK6s5bzRs5EU=;
	b=Qch2FAyIj+DJLChs3FzDd00CYEwRMP2uuY+QObTotYwkp83rTBql2LfZGhKpLBpsfIcQ
	 qeTldjRQTr/ocLyFX4IfvvR/nuqt9FziXya+EeYb59cHX28PC15rpfO/+KrPdRhXjRvej
	 SPuvcylrilhqqQ8I7gdC0pAVeF4oRcdYitHSeKwTuT6Lr6MHb4RogjoK9TactMUz7toLd
	 iUMfZX3xntzrcU7TfNTkXOD3iN+NtcyO7bzyA5h1jFxp7n0PtAfDwDhMSaEFvx9bGsDS7
	 06CTkw7Sg0KPk96HXi/VRjHgZTank82BbXxfhVymxxmGnPAH35rzS6iCSKHxP+XPlig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=pnTV3rUk;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=v0PQFITT;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86196606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 07:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86196606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=pnTV3rUk;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=v0PQFITT
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795244618; bh=y6MFsJR848hDKlT6yRNlCrk
	bOqj8NXxBK6s5bzRs5EU=; b=pnTV3rUky1wTpx7WZl/YdMR/M9lCMFiOZ1JXVu2GEdzJqQ+GQs
	MFuWzUlwHY1xog183PNaIuxuVXhKbqEugix63YBSDrh/IE+RTsdE76re58MgHAFTPRS1aal7XNl
	FJX7OH7gGRnwIeZPfbSTaYHwjn7DdqTTh5TzVUBd15vg8IwW8BSHz3b1sZFMxoHZpQ3hW8vhfiT
	PZXLSCcZixJmKOkAFM6vpxq0WqwZv43A1H4XpCZ8Qsr1N6FZIeUpHf63C/gRB5prpjdyK4Eo6XM
	o8LxpP5JI1slqpkKZhZHTOtPvOku+UXOKSXUmliH3bJYzMWD1B5DSkUSzilRKMB57xw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795244618; bh=y6MFsJR848hDKlT6yRNlCrk
	bOqj8NXxBK6s5bzRs5EU=; b=v0PQFITToLHHenvvFwALitpgYoImLm6IpD98o83/7wgK8LsRRe
	gZP2fuTLDVtkUumxuFWEx0FYm5HoBrdJobCQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 21 Nov 2026 14:03:33 +0700
Subject: [PATCH] arm64: dts: rockchip: Add CD GPIO to Orange Pi 5/5B/5Pro
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-orange-pi-5-sdcard-v1-1-e431e7c46ba0@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g2YKa1tr1JcjJmo6UIlURHEu
 3dql9+D9+/gYioOr2IHk1VdxyGDLgVwH4dOUFM2hDLciQLhaOc6Kd7QE0dL+Hxw08YrU5AK8nE
 yaXU7o+/6b1+aj/D8K8FxfAHz5uU4dgAAAA==
X-Change-ID: 20261121-orange-pi-5-sdcard-98cbfa3c12e7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795244616; l=1254;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=GlkIkeKkP/1h8FvPs1WjPhMAPwcbwH1PJfQKecMiU5U=;
 b=Xy+Q6JAk0IabwF5I0M+Duxwok/VQCgn1KhBMgtBPMB5h0vWgSrT8MnrcUhEpn7HctJ6Pc5nNm
 IXhKmWfrXX1AMdPUPHjCOpITe/4/eS9xttfK0TZL/SVsWo1ZPal9ScH
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=

CD GPIO is currently not defined in Orange Pi 5, this breaks
SD card hotplugging.

The SDMMC_DET_L pin is connected to GPIO0_A4 on both OPi 5[0],
OPi 5B[1] and OPi 5 Pro[2].

[0]: https://drive.google.com/file/d/1Wsp-Q7IyG0Ky_W-z1n5oXcFG4oqIbtOb/view?usp=sharing
[1]: https://drive.google.com/file/d/19iPdpAXhA1vFkVOgG5Sz7L6cV8BB6004/view?usp=sharing
[2]: https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/view?usp=sharing

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 2db6ee95e504..8fbb0ba19b74 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -282,6 +282,7 @@ &sdhci {
 &sdmmc {
 	bus-width = <4>;
 	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	max-frequency = <150000000>;
 	no-mmc;

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261121-orange-pi-5-sdcard-98cbfa3c12e7

Best regards,
--  
Dang Huynh <dang.huynh@mainlining.org>
