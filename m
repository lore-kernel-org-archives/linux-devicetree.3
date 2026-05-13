Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C83E9C11;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669066; cv=none; b=PbZNIO3NUpWRUsTt+v0ue3ZgPjKMz47w/8/3xBKNzfvLKCS55Lff3NY1wQu3xx6bdn+cbAIdZYUYbvtaMD2gfv2cShfPiK5bcScXYuNGxMZpHtV5RY8w+Y0Ue/VuOTcpSTm2UhiNCGOn9I/YLeJT2iMpyylUdmy8Z4mxfeoSOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669066; c=relaxed/simple;
	bh=AVnCN6kymER6wy+4kacjuFr2lYcaGoCedkDJ0zolop0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tlWJ6sHtb/anTuSl8WwozH05FunThlZW16PUBojL3FB55Wu0ShmfHARfY8eyRZevV6QBtnitWZbnzIGpmY9bIFpoyw6qkwe+jmCz3n67YZ4bvk1EMpZ9ziFBH4OMOJuoe0gIN4GRj5BnPA1nsfWWmjxP7Wd4tJ3czMGJ1O55Ciw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkTtBFwh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkTtBFwh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C7E5C2BCB8;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=AVnCN6kymER6wy+4kacjuFr2lYcaGoCedkDJ0zolop0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UkTtBFwhz5qvnpqKSbhXOQT6p5elGLeyJCNRsQNpheaIJAKTLtDyhjXtshr3Kl4GH
	 o79RM8utGGbZ5LmoH1F0PyOn3VztjK3i0bARlEGb1WyrMk6twcLcYs5FBQKy1gK9RZ
	 GwtZ3DKuJ9JwYAxyR20i/6xWn06uxMdTwTd21VyGQcxzhFgkaUi4sLyNZ79N8BOuaW
	 MaWP5jFZ5hMPA2pC9nrqWVMzFVH7C7fch2ph9pKMZ+4s99WBN+QvDEferElsOpEeaM
	 Wtal+I4e32gujlIBaY1x5VHJ5dobFi7q69WNlJ6Tl904DGftdycOioBr7m/vAr9Nua
	 OMX7a+f2/mUKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A51CD4F24;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 13 May 2026 12:43:55 +0200
Subject: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=2xdbcwmGmHmxRvinJQMTjDVB63/BF5fZ22AOjpf30NU=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZLGAe/2O2a+3P475ob7pLlVj5TH3PE96Vip/GKqam2/
 LtVTP53lLIwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABOxZWb4H8rz9ZbCD4fdmnPv
 fm6YeX9D6AqvSVOr/7fvWzMjwq193XuG/26NkW8q47RFz+RJuS00FPyzrT+VY/eZGWc3+OzWeFQ
 3lR0A
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
Enable the pwm_ao_cd controller with its pinmux, and declare a
pwm-leds node with a heartbeat trigger.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index fd1b983354a01..c41525a34b721 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -53,6 +53,16 @@ dc_in: regulator-dc-in {
 		regulator-always-on;
 	};
 
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		status {
+			linux,default-trigger="heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm_ao_cd 0 30040 0>;
+		};
+	};
+
 	sd_3v3: regulator-sdcard-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "SD_3V3";
@@ -163,6 +173,12 @@ &pwm_ab {
 	pinctrl-names = "default";
 };
 
+&pwm_ao_cd {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_c_d_pins>;
+	pinctrl-names = "default";
+};
+
 /* SDIO */
 &sd_emmc_a {
 	status = "okay";

-- 
2.49.0


