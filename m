Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128015;
	b=kNd9F3TgyRM2C81rqJBDSyzP2HFjjs+A9EMCL04+417vDFd816Qng1kKQyQHZQToNv7D
	 RYM6QEoaIQSKTqv+4uyMyOAkUbShuQ0+IRk3BNjVtDytA02ts8SCJtKuaenTNqaC0Q3Dy
	 +ijsx2F9dPdPBydvcCR3wAU1RHFrXOivwbP5J8ZZRmhkdOx8IpiMyD5JJMdFNNL2+D+D7
	 Zndb7ptP1w0RFCeWKH0W5dQAgSBvT3iy6OO1ANuFk6WsSc1Bj+hHgMmzBZk0EdDE+0dhr
	 4o56wzb/1a74Ot5HJNyEY2BFlA6tRTojAtJjn10WZltBHEAQu7tQlace/6VezhQRj8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128015;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J+EF6tFLFNapF1ckdzdRZiht5pI5wqZxQpjBZcs2sF0=;
	b=ZREYOdwTujBrtnu2zv2NwYfjlUQ9a8QDoCWNZ5lL1UJSQ1ZfllMHeSPg6Xk4ZELoKEp6
	 3uuy1QicOYZONzPxLFTxrKfox/hjssYRyMq0O9O7qCCtgZdC4lPoOCOPCTWSsyWTkXNa1
	 t1TRQn19xhAMv6nfc7GS+TRoV7okC7xexxhU2Zk+flhgFQ0eaLgX7I2Pseswssl348mfj
	 tY5dFvWLNfBkm2gxxNL/69ZNrx2SNbn81MixglPgO5L1WTUBm9P9rsPwygZ5zCSgqt/JD
	 edquR2sYV7tz2gJHLupbPaqEbpvmKwdm2kxyO1x3jY8m+GhZuo1VvaA6A68SK7uR6Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nResEvgR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F78606A336;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nResEvgR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795128015;
	b=ZZnHG42QFIU4eZPI9ZCtJioNiRmzPyJerNn/dnlftu0hxSvACJUA6jSDR4q+XNhZm6ad
	 goK6IqLWeSuwyhDqeqziw/btnflNK3sYMAdYQxdtShj7oAKO97f/66rpTsdP2X3CSKDX7
	 FJmsD4vuCog73Gm0YozFWNg0gdnflGBrpukePKUWF/1+DB3RROwgRN99RH4j9TlJRMgGy
	 nzbim+sf0oOvmHaoXh4bmREM8PzaI9Rn78SaohLMLx2ocsK2o91II2xDgbL+8029QAvP8
	 i1HWTlDcgj06HpTR+SBD1u5b1qoyyH/B7P0SyIKekKlKLIyosNmb3JAaXgjaJTVGIAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795128015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J+EF6tFLFNapF1ckdzdRZiht5pI5wqZxQpjBZcs2sF0=;
	b=XFcT3exLlv/K2AYlRau3bSVYCWXfDDB1fZhO71FPivMnNxyimvcCyx77lEB4yVJo+MQy
	 SbOJ9N+f306ccd8jIvydJyLC958EwDs78aBm9baT3PsxVwB/1Y1+hthQ3EUTb1AjgBVaq
	 Q/YzTyhUpvR52/YEpAMC7YsAFsmqqLmN1p/L8zM/luqG5MPJ6JYRRKtU8ha3ED7+Ra/gH
	 zHlz2hN8Hbw1LvAjmwJCLZcnQoyTKk5SfuG+tJCOeYSCGs2ctz+4VBR0zcyxK4dvPJHC3
	 It4E3nAWxXHLoAQguN+x9lxcEvOUSKyvZAtKeIqwd9g1NxJwtRGBBVu1CJPnNgEK4JA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 322271F000C6;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128015;
	bh=J+EF6tFLFNapF1ckdzdRZiht5pI5wqZxQpjBZcs2sF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nResEvgRa+GF0St+b/xHS+xUc0aqHOfKfB9mCahOstqkLNfxiHN1XxVreSP6IsNV1
	 bHPSWVoB+E3cWCqpZ+mi7MC40uqMziJ40Wv9XNDvLNY+YgGgyavl+QmS4JgrMBVIUq
	 WyEW81XdTM9iV6Czyn1sW1qgm4q2ENAqaZlhViW8AlPQFurFOxn8f36f1DDMAG0rwU
	 pYsDDvbZO4OShwxMQDbJJFyXg1i6oCuuDyA8u6GSMOeqWFLVBuKtfEnKupVkRTKnNG
	 LJIGAJ/XIl4+wQfV6ihGiOcKYNiytRzzM+DRh8JMflj7UlhSlmCGLmSOtzAu1m1K7Y
	 L60jIwobD9k5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B5ECB41B45;
	Thu, 19 Nov 2026 22:40:13 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 19 Nov 2026 23:40:04 +0100
Subject: [PATCH 1/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable CDSP
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
Message-Id: <20261119-b4-gts9wifi-followups-v1-1-2e2388589a62@dxdmail.cc>
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795128013; l=877;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=NnJjHpakdpxyyCZ6oFrLlypqqGlSBONU2v6+sLCEUd0=;
 b=HSIW++4ax0tLWO5zg/pur07sUSuGMeU7bTsW3qAPEdC/lJSQOP5Zz+7mRTLRiXNYh2wO67JfF
 EATqFW3CvHuAXNrldTf1BEs+6dSHJPjo6Y29J09CgQhk8yXnXKYQLMO
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Enable the CDSP with the Samsung-signed firmware shipped on the device.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
index 1e8bfafcc8b1..8e906b7e2af4 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
@@ -714,6 +714,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8550/Samsung/gts9wifi/cdsp.mbn",
+			"qcom/sm8550/Samsung/gts9wifi/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;

-- 
2.56.1


