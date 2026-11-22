Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354446;
	b=Seskg0G+iPjZOTdLzsKRVQgX+luZS3XYVaY9p7cx9FGz7hX7F0abAymGDqbAMpc8TDCZ
	 osOsEIR5/YUH8McJ8vE3Xdp21d//hIf9DiNvs/AbC2A63teRrAHn1+d0IXtkhTLuhasfn
	 I6q/ox1+n0EBtezx+xD/v5lcjpgpNEHCafHRzYtVVvGnO+Ti5PN/jvmquDsDTdwa6FwVv
	 x3W879V6LqBLdKsXD+2zcQx7kz8FLgekV+bg+Ai+R5sjCr3sJ8gryiMxzxWQQ0aHJFUj5
	 DqAppFvJ3Q3Yshp8JpgUNnJ7PsihJ9NcnCIqwUrBqiTzusgOXD9dUOydcAQADD+z8uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354446;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gMCCxwapX0wLFgOIJMrh4/ml0ip9+6qLy9h+KSGlzfU=;
	b=XguQiAADOqxs0chianBDCFz2Du52F7v7ct8bOLa9vSm6NdBS6yKwq1tlkZzjISTfhH5N
	 uMhaGq1nv4ZHU2MqUiduli/JAQFnOLc86yMIXfux44Vl3U8I8MZ70OGVublMEKUdeBeFu
	 KN1aLXTdxsLGZcAXuJAjUhP25CsoYKHLubsulOelakhMIr1ilMaZbwHLh9Rai1JWQxdTw
	 bwJxikGv1cnhD1CiBrMHApC/3w4b7WMqCGZsHIQz8XsBpRQtjgNsgTbfsT2zYtqrOLgfU
	 1UbHf0nqyk2WSYnu+1h92dHPImOi3T+mQf1xSE87rqzx5ny5MZwvMytJeyfU6gPcfRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lq1qEN/J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9F606A32A;
	Sun, 22 Nov 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lq1qEN/J
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354446;
	b=jMHIBEybbsybiXmrDJg+LfQVGdG9txx8aiKcDz2+/ha3Uc3le9gZhTfrfCxpOhW1rVsG
	 rtSKMs6ZQAjeezhqOUjlDxdsFnyXXigB5cPfNsKcSsoNZp2kM8I6Gn/Tus/82xYk1kfS9
	 3zd7rJ3SNonfRrXjHP/wNAZiILpgZ4MLM0uwXOklSn4VrC4Me0ZWZ4K2MV+IRpZrLSU+W
	 7FznNUy7RXwG5Oa5meIUi/pRGx9QDdHMAkBGNRWwXEU0dNT6pW00IshZWnU7bOD8d+cN7
	 fpa8oYApfQachR3J+6qgNECsThQydvQFGQeUPUGtElj4MynNnWSe/4B1hw8s2MCxR/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354446;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gMCCxwapX0wLFgOIJMrh4/ml0ip9+6qLy9h+KSGlzfU=;
	b=OqmTD+XRN2TNkB8V3lrfKDrSgW1Ywnx5+2ZV7kwYAFJPeDFlqqQQauJkqfWP6R4fGy/p
	 cQUjkV6oK6fttyuURDmLHgA6wJ5Qh5RodMU1hrh0mc0qeulpeZ22vhpsGOjcL3EZLjaiQ
	 5LuWnqgQoAy3v7/qmwZMT2BbYu9sMBOB9UvM0+3ax3EKEYax0bI+c/SbaKL//QGdH9Y67
	 sqGhXtw7hWVLR3Pd3/VX5wQM5nubn43aIKQjEQYOJWVMdoCxAQBakgdyATnhVYnrpezom
	 0l19g7qNmuvygrxCk221NDKPBcBlyBvDrMIytcTvLNET8skjIpRuQL5IL04EBqad80w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93A0C1F000C6;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354446;
	bh=gMCCxwapX0wLFgOIJMrh4/ml0ip9+6qLy9h+KSGlzfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lq1qEN/Jq8/cqb90pTneAzBRFVNS/IXCG5WDmpptcKc9lSnmz7KPs4261PerewweE
	 lFt5GhxOB0/Za+JZOEyaBRO6Na2fVMYXL0+wUVB6PHuzbNqX4kbeKVCXnRKrcb8+1a
	 KL5C+vhOxpC6Yv1wcNCfuwMEGQi6Iw+UWhT1qnE5tnyXZ8HOchLfqtu1KMh6onq7By
	 TNkzmCmBU+k7w6dU6cKvyDD3rWt4AbncyUQK/QA9ewlE4w3HLT2mtRmwREOmgrqHGk
	 WBshDOVpcgvluKztclRjhwkYeoa4Zx09x/TkleCyCkP+Eq2Dvazl8Q/dVU4H8qypyo
	 vzTpIWdUpW4wQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 243564C09B;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 22 Nov 2026 21:33:51 +0800
Subject: [PATCH 1/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1
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
Message-Id: <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
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
 bh=foorF6NO3hCfAAQawSmE3Gdk20RzS76lrMy1CfpZjgk=;
 b=cJ6yLZmLonKACyxV28t0hTJqeKVe63el8UfnQJxWzALnhhfIkyl0zGATvW1vaYkt5ZlYSnuth
 F0qSxColP9MAN5r58rLVgbYz8U95AmUZtWlZeRO4CATzk6Lq+5VVzp+
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

The SG2042 EVB v1 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
and add the RTC node.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 9f403e564694eae14913f6ab23080a6333df15ae..6ddb16eabc48a51f457449d245d63a3840b2fdef 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -136,6 +136,17 @@ &emmc {
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
@@ -201,6 +212,16 @@ sdhci-emmc-rst-pwr-pins {
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


