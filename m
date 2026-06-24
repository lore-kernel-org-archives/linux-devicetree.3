Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFCA1DB356;
	Wed, 24 Jun 2026 11:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301326; cv=none; b=H1rAvxs72xFLVLR8NGRgg3is/1Er74CR5uCGpL5312njwJd0sbHXPqmgl1wkk8C+JRiFpNnuxOpxbWNIdZP6ZMrgglEG2DjHxVslmPijZHYsdBT2s93aF/SlB2nogmD0ePDyNxuSKInK76Vf9EDCjcZ4SHnv9BU8dBgfgnV3fLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301326; c=relaxed/simple;
	bh=LZ1C8rPlZ/X7S4iWJUKXT8UYdYECXgo5EWnaKAYpFo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AE1Qjqao7nSdP9+FMdo4iKQmpnO2REge4YGmSeQnLxh84mf/fHO6lmhoW5jje8eLt4tP4kJHqnriPQ0k52EXm20wN/0yO/N+AhVazLJq3TPjN0Dm/16rpjftNsMrOHbUPLRGAzvlvMLRJr3+iNeAqMpWaKexzpymUnYnKLgR2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cv+QZx9i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cv+QZx9i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6A46C2BCB4;
	Wed, 24 Jun 2026 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782301325;
	bh=LZ1C8rPlZ/X7S4iWJUKXT8UYdYECXgo5EWnaKAYpFo4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Cv+QZx9ic8CcDcyku8WSiFp6l1+02Wo432iHHq0rPl3wGrYcAKCE8bP9mI3rQ+fqk
	 dcJ9LNaPNpHuQ5pXKAYHFhcV7rE/hkUaBKOuq2JbDf5dyXJEeMCMU6MvLXmktAlXQj
	 OFu2fjqkVTtYJoMwZ++OZAgfbre3m0qevy8/et5DhrVomataDyRtSww5/nE3IXBj8a
	 DLBdb58Dtsckrswp+KDmGglSEtRX9JB6bvXydGHmMBRH0/A8l1qnqy/tRVEBfikDbf
	 Ppw8/WLugAzmdARbgh0ITNNpUPOk+8ze7o3WJO9rbQx9eb1FYgP9QKapYRSLZxxcn4
	 6lNEYAK4rv75g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8C5CDB47F;
	Wed, 24 Jun 2026 11:42:05 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 24 Jun 2026 13:41:50 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable I2C3 on
 40-pin header
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-nio-12l-add-i2c-40-pin-v1-1-f6c11ed2184c@pardini.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQjFHUq5QuNBl1SomSVBHEu
 xt1+Rb/7xA5CEdosh0CrxJl8gn6lYEdWz8wiksGUlSqkgx6mVDTD1vnUMiiUTiLR12zMhX1rso
 LSPEcuJftHr8/j+PSfdn+rxscxwkHLTmbegAAAA==
X-Change-ID: 20260624-nio-12l-add-i2c-40-pin-19e0482fd835
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=bk5ea6cLdsnJpmBdpwgO3E/mbMZWo2izXGkJpWcYnGg=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqO8KM5gmzPvJ/rOmLT+qPMGepPIDKiCk8X5DBu
 5jAJoBZRaSJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCajvCjBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7eliKwf/RkZ83zDF2MFSMVYiVJmHI8+ZuRR4XYD
 nmdBGdJ1vpt7+H9f1xXNJr8MafhwauM1waRUw2x8cK2BgbUbNVvz7O+03KxR1dwP5xzYTP8N9Pa
 eG3rxMC81LILXsxmleoMnJ8TSbsvlxLJYTiZ/ZMmjncU0Sm4Dzx8Km8puNAYXGr/tDsgf0JPH/q
 0mOXv5YVPVwWJzWeH+JVtUgY4lnxUh0m61v6SXzQAfCnipWskgWmCnjNiskyTOtuMew3eJNzlX9
 Y1lA74GukTKRTFwLK+GI9SaNl3XFoKDvT1/l8i/YsztE6DWpmGaHDAg0EYvdurkCtLdGJQ4Jihm
 mm1jmx1rbYg==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net

From: Ricardo Pardini <ricardo@pardini.net>

I2C3 (SDA3/SCL3 on GPIO14/GPIO15) is routed to the 40-pin GPIO header,
exposed on the blue-colored pins 27 (SCL3) and 28 (SDA3). Enable the
controller, add the corresponding pin configuration in the pinctrl node
so users can use external I2C devices.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
The Radxa NIO 12L exposes I2C3 (SDA3/SCL3, GPIO14/GPIO15) on its 40-pin
GPIO header, on the blue-coloured pins 27 (SCL3) and 28 (SDA3).

Enable the I2C3 controller, add the matching pinctrl configuration and run
the bus at 400 kHz, matching the other I2C buses already enabled on this
board.

Tested using a SD1306 I2C OLED display.
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a5..03a2f2e746475 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -371,6 +371,14 @@ it5205_sbu_mux: endpoint {
 	};
 };
 
+/* Exposed on 40-pin header (blue-colored pins 27:SCL3 28:SDA3) */
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c4 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c4_pins>;
@@ -789,6 +797,16 @@ pins-bus {
 		};
 	};
 
+	i2c3_pins: i2c3-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO14__FUNC_SDA3>,
+				 <PINMUX_GPIO15__FUNC_SCL3>;
+			bias-pull-up = <1000>;
+			drive-strength = <6>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
 	i2c4_pins: i2c4-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260624-nio-12l-add-i2c-40-pin-19e0482fd835

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>


