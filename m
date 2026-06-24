Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0FD3A963C;
	Wed, 24 Jun 2026 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315957; cv=none; b=rwVFAbZ+5R5us0yO8RwSSiSpFCojYMve+enmlGaV64tEqLx4Scz2yZ6YG/4H5tO7RzJlWKENtw4bQhRf6EWIDTEotZ8tb777H3KDvG1uUzu5epPWDfx7fHgB9mSQ/QkriEsIx9jwTWhzciZEvFDiyFAPkuPEo4lW0QufzrXuBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315957; c=relaxed/simple;
	bh=gq7SZQMCqoWdcgKCYD6222wJceoyTVBlco/WMG2UIaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2hZeToHI+d5gl+1IJBdWcsOJ3ajZCiRcC79I98oTE4pFuJ7YGFS4Hen5NNhd2xjULvo8xa7N84DonRlr+2nfeLlNxQENJhrz7xjdObekVuHM+3oJgMOCT44PPD2OSiVdd1ihNFMZsg3XWaUKRIFD9rWeGJPdJG40jlWWa4lHqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTfCzKA8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTfCzKA8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2CB5C2BCC9;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782315957;
	bh=gq7SZQMCqoWdcgKCYD6222wJceoyTVBlco/WMG2UIaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hTfCzKA8p6wQRw2Fy+Io6dWME5BdP0NdDOhFFz8HyJha37eybesuNfVZpGHN8YZNO
	 A/E92MSe8Diy+wELrAdhAjTCUiu7oQLbPa3Ge/nNzTjGyn35ICpfTltV2Qxkgna3Jc
	 Gn54fezRt7oYzn0uclrOZz0aZ/MHNYMxePJeCFmpEXVnl4HF73eJKndwxVa9U5y4zm
	 TnM8WQ54o7ClJF78tCdmiNp7ovnGAYCgY8FHjj3OWWk8LLxHjeEQVW+0C74ei2EorU
	 z+aZeEqgw6XUcbqmXZ19FMHJ2vOAQsZmD1/h/ldsb2JnETO6PI6oZRCODdON1yfAwM
	 ejv9dICwWs1mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4AFCDB479;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 24 Jun 2026 17:45:54 +0200
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable
 i2c3 on 40-pin header
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-nio-12l-add-i2c-40-pin-v2-2-cf3707a6aaf1@pardini.net>
References: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
In-Reply-To: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=hIyBf7strNNA+Ox0sJe1DQ4Wou2BwNHnavbyLGWV3fE=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWRZ/95csKVZmzf5k99/+4o/Lx9p3fyxT6zsosX7Q2q1S
 2Y9ZXCq7GT0Z2Fg5GCwFFNkWSOhzPNt/atTdzw6JsMMYmUCmSIt0sAABCwMfLmJeaVGOkZ6ptqG
 eoZGOgY6xgxcnAIw1YKL2P/wdlhtu1evdcBOR/yhalTtabllBoV3JepeNbqLtQcxOzW/auBadt8
 osKLqy/e2w4+3TYqzk/zYK1eaotW4Xug7u3a0tejGzrm6G4Ilmo03KEqLZDyOubOCv/+MRu320B
 +a6mcr96cr/lVQieMM0PsUes7BprHBY97BT/kPlnqfu/9tB3NMpJjxa9vZSi/yaz13T4zXn2r8d
 MPWtQuSq3QuzvzCr+V/pXDa4uTigObEs06Pi6dX6K780C6/3rnpX5L7O4E7M9j/vJCfpmb0wuVD
 Rm/D1OtXBILC6tuzn5oxZm9ZEV0W6NvpxrNOLW1yepk5U17GS7PpVyW/XLnSeL7514VXs+6bJE6
 vvVn+FQA=
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net

From: Ricardo Pardini <ricardo@pardini.net>

i2c3 (SDA3/SCL3 on GPIO14/GPIO15) is routed to the 40-pin GPIO header,
exposed on the blue-colored pins 27 (SCL3) and 28 (SDA3). Enable the
controller and add the corresponding pin configuration in the pinctrl
node so users can use external I2C devices.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 589a5f07d5dde..9b0966c271cb5 100644
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
@@ -788,6 +796,15 @@ pins-bus {
 		};
 	};
 
+	i2c3_pins: i2c3-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO14__FUNC_SDA3>,
+				 <PINMUX_GPIO15__FUNC_SCL3>;
+			bias-pull-up = <1000>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
 	i2c4_pins: i2c4-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,

-- 
2.54.0


