Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354449;
	b=cCpI+YFO2ieL2O1Y+jrfa9tsMwHX8WyyFsmRTyTuecO7UeWe+Ea8wRRT7tqRl2HiyEtC
	 GsikoRSFDQWa/sn1oeZW9vYnavXgmXOiQNKGeIOaqfjjmZveXq1FSqW/pIW0CJsAHHwhs
	 TFpmhcE1K2Awj/LmAdzcc1Si7eLnyHOdBTfSSSzczShDDR6yvyz6AiIqEQoF4GxuhkTE0
	 EsI2kBLWGpk9PdRzEf7XHZBy8+uSzi09CU6ACOLTADtoB04NaQWmNeUmXJvL0kq2SgMDi
	 g2hawrgYTGTx0y9syh3LleAMhSRdzqiDR5d8NQ166LAauABsKx2L6nTsPpKk35JIqyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354449;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6gKdivfkDsuonkEKXD54e3FJFyho7ssO1p7f34zC4sc=;
	b=uOpw5BKb+/DSNlhJXdAzLWUvBKyrMcqu4Hsd6QtSoCKZnCfAz2VEfyGqV/KyI29PQoAL
	 jkZtPa96KnpnfF7shMofWyUJsTMVXqqIUw+zrjr2uV35ky3m2+bsRCUn4iVAQnMEXoLnB
	 nnUDGDQWNf/JETTpy1fQjNWJvD1rVBjiXg8rs22OzGuEBq6zcLzYE6vcWYsvPBLmPHEIi
	 9jI/7yYAxpUpoLTBdGk/9Ar26Hq9V7mYdhttr8vEJz7qNt6ljheMvSA7xeFimPA9vWAhG
	 3I6VP3AF40CgM9kLDB9ejHIp81rApOGRUHkQXR8utf3vPpf5c48uEgvXnHC205B6S/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6ubBjpE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D38606A333;
	Sun, 22 Nov 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6ubBjpE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354449;
	b=dR4c3IbOXTh8suB+rkifGzrLzJMg3FCj13idiWiKWvCE64GchHxtvrxM2t5JY26S4R+f
	 Ob7C8g07AwLaVM7TUL7Ro08ACkNcSeWyMcBMH5oDtJ0Du3jPfUmcN/KH6YdQpHW2jKKT2
	 glNN1opUIVwkM5APVUwvQwYkBpK069zCXcSrTmGdC5tR1Odub5ShJEir9/MfjEr0X/jCA
	 nU390SPi4or/i2irMiYUrV+DqHuH7rv4liTksqGSEXRGHnJEjWA66PYFeT9aCmVKQM9Pk
	 gm/39YxGstgX6mEsEvjDPbxQWm9Q1Phu87RV+0k40CvtySN8asriByMTsDmBkUKbwsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354449;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6gKdivfkDsuonkEKXD54e3FJFyho7ssO1p7f34zC4sc=;
	b=NSz44hxRApW3N5OcgeQdyx6gQTmRVTuExs+QDvtRopcal37Rg0hwsTIfpVp4tI4yXb20
	 60xRNCzQWK0Kiqz1gntU93z3FWnqcD54NaELKvI8EOWba7CUcAzXX7IEwTxtdpBtIktMl
	 sbzecyiboW0NAZQpOxEAdHkAOqOBSbgOaJd/pz2w41pjNuenFmrwYbSmNfAbBZvc8kqdi
	 uJ9Y3+CZ69xDaH+elMBLpGE3AXHvh2afWUotRD2mr9JUOrhXVeYHSPtSVZ7DYudv6dU6m
	 ufVaZXbSzjzwa+jTvawv8uJeLjv8kzHcll8rcnp0ckekPgzvuctYToIcfTWt8Nj8cnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEBB41F000CF;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354448;
	bh=6gKdivfkDsuonkEKXD54e3FJFyho7ssO1p7f34zC4sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j6ubBjpE1Di561SNA2s9h/kbXL7cjk8KGbIFotssHdQJfdSEBvqhBxsyWudkUS5wN
	 oKnK9rBNQEg1uzcYj+43LR9liFy6JwisI+Pfc/FVReBAfY4Zmjmdu7bXNowd5LsxTw
	 ttq+5xbPL2DkfB1E5/E/49O1CKYGW+vVVxW+FrQGf1uSyG08ugD82eVm03fqDmItdr
	 YsBH/ZlQD8Pi2weETXkfO4tHIHQhppR3VNQLBWkU/nacgJQbNgkyb1cSxkdHkMePWJ
	 +074xkCYUobitkqUQBDRj7ioV2ACwzUfWszqWK0BxgaewhSLfzUqfYfHb2hwopUV4t
	 jS+oRYLWe8T7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E39A4C097;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 22 Nov 2026 21:33:52 +0800
Subject: [PATCH 2/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v2
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
Message-Id: <20261122-sg2042-evb-rtc-v1-2-f222c64cc7b9@iscas.ac.cn>
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354439; l=1232;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=dsm+CVwClowTlroI3X7kDbQ0hyzBtl6KTIdw4zXB9XQ=;
 b=qwqJvbtq8jL/cGsYM8JQ5HPgmkdDxYsgXikkAtQRg+8ODgaUl/jaCYQw+zMP2WMCqCC0RHIFp
 3TSfMaGnVjbCUT8AKnKw9LwtrktPsPZ5cbSA1MNiai9u+pAYm1mpbSj
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

The SG2042 EVB v2 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
and add the RTC node.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index d8c5814f22581076e6b5114f762d4fd090681b80..0dcc53b519971396a5ce734108ea0386fb186726 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -124,6 +124,17 @@ &emmc {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc@68 {
+		compatible = "dallas,ds1307";
+		reg = <0x68>;
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_cfg>;
 	pinctrl-names = "default";
@@ -189,6 +200,16 @@ sdhci-emmc-rst-pwr-pins {
 		};
 	};
 
+	i2c0_cfg: i2c0-cfg {
+		i2c0-pins {
+			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
+				 <PINMUX(PIN_IIC0_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
 	i2c1_cfg: i2c1-cfg {
 		i2c1-pins {
 			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,

-- 
2.47.3


