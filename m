Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096492;
	b=pdP2lsp4QFmpncTUvfesjX0WMcwuotdqt5VzWd/galtsGAUfUHYBubKtRc+oqaYebIia
	 zqJWOnipGRT/0PCLcrgH32XXeo4lPrKtliyBBCIr6vzPgw43fR/V9lPNSIR4pYBe6Jz6H
	 yG7kacJTDFqgvz1wFzdmJcaHwFBdEJ2RoIYX9lhq1DcH9pms2mPW59V3pzgCsVN1xC1oT
	 5buav8M0eJ4bvk+z8ztE+YhdIeraxRsMgx10TqrPX6oNfxVVnlIR5f59Zt9qQok0+ipeM
	 AoRbFBkSpgPS9omYx6UkcZK83dNuq25IaIDbZSzVG8yPTuRjYOCf5T/w55X+cMb/m+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
	b=IvJfmuQKkvYk9HjdJ3zLv4SytKCvWuersntVDwAuO6bQkqT5merkHqLuZPPXzEY2GcY3
	 3KV53TXql0DfQiuVm+EIq1dLrgPl8SEjhe7f8IfysIZ1ZF68gDsKKPMt7IeJxNydAW5tH
	 Q9GmI2HEqtS+LdjfcErOW6TTEgOD/78nzkH2QkG1SHmFtasuJDsaZcc4sk2pe/wek8tJa
	 XXEEITzOpAHZMff0PrlKrQK6TyLlIzo6UTtGl03qBgnOChIjBJmoSTjIrl1EiAi1GwR3B
	 E0w/6kvSlYYwbe1zCxnD44Vrv6xOdtW+csNLg6lBVg3YMix7kbrzIwrrWaVOYjfg7ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=iStJuBRZ;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A3606A337
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849A3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=iStJuBRZ
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so383825866b.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096490; x=1795701290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=iStJuBRZyeko+ck0h2qcp8lblF7jAeJsgGPT171M9fozU1T1YQpeMqvm+yDjdYymjb
         zRRiwjQLu1Yf5ot541+CH0yGBFp+H4KYqVAjNRAF1mZxWSMCVuBN5v52XJ7SyVXH4DjU
         eS11FINq/kc3d9V/bqwxLViXts7mx4ytpoGlJRQPZpctVpWQ+64i0qQH9CpdgMWGnwBo
         HfS4ld5gt8/0FrkxPVRpoVmk6feXZz59G9/bqWNkcJorJ36huAWvC1Xv41G5SN8u9C7o
         ZQ4bX7cTIZHqTmjJeW3DzYIvpZr751R3qU2DgewhZ6Hx/dD3BykZAZhp8NXik+SD/2DA
         Vuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096490; x=1795701290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=Lh5hredl79vgwUQUOah+fcjldqGrxRs0vex8JMi6+cOxpbjRP291YauZ1kkCXnCPUX
         5ohFUwt7ikNMbbhY3NiH+lNC++4KYbwD3joNTSTZRM9JIZgUX41UPWDIrz6qZmNlJKm5
         b/6tKmzQxvdT5v7m5zTHqdfo93hkK70/sW9RBrptBwU7fWrI7clcufHdE94495BCeHfu
         y0eEHoxPVi3pAuCMW5JTiPpVjsEmjc9kqvIER4+1xarSqJV2G51P0HzjZ/Uu5SMe7+pF
         uwiAhAOAT2XqxTeNs0EfzL9dKABAgqAN8rQqro4cb22CBwm3QhVvKxawIqQ8DBo37eHV
         7I7A==
X-Forwarded-Encrypted: i=1; AL+hErE7K5961TNp/hLqHZy5nSMS2OdUAAAUkMQSgcKdSXlwETNgsQ3NMY+d2JtgalTTDHxBoBnpSQ/9+mRA@vger.kernel.org
X-Gm-Message-State: APuU4Z/zvv3/Cq22FDMVcwR9dnhUgGYsMoZOaiPhl7GUIkmmuvqXdb+x
	OE0Zsz4ypHPKzzN5CYZFGCoHXuSDz+Eq9afvbRGKJdHnwbVWFixYcOe/CwobNms4c1Y=
X-Gm-Gg: AYBFou0yNf0l1QMt35bySL8IPLyyyc9D9nlUga8hG1+Tk3JnpHJ2xdI94aGhkFyNrE9
	MJIXBvq6pe58Vsc7GJi4ErbKx/7p/Gx8A3XJGvwtFeGTQI+Er9J3dQ1e83vbx3ahKtKDS/cSn+u
	MpJgNSYYxb6syFJZntNLxbStajQldcsMxTY1Byl8euvsoQWkYj2tvOLhTAvQJRy6lqw26Owa/Xo
	ZgGHTI1AbAckUg5sd1PslEB3BviUcLsjVk9hriv+DNpDVxlFj8I+DNTK4ZjfvIArdDNZMbqwddJ
	lPvzOGy3GpfJW6Qv28qghpezVVqmW3jCL/JC+G5fzRBbktuv5KDN82TRMtlKdTUFGNsrQz9QXQq
	AHRenr3xm7TnxtHk7v0fhdE62xfd35ZIGWm8s7f2PtShgSK0OhtQA8yMMrX4NghkBKPLFu9hwuv
	vH3NDm+KuWBdfbSED42OuLGmeXF/MAbdKb+AbkoHrp4XpOjBALLxYTefe9+zvK2w9SuVw2N4VnS
	8dsgvqJaWoYXq0s9jZr23spgkKpS2A23mFAx+Q2EhUFbaAR7gQeuwsh3jG5wOtPWPfKykH5RRx1
	bbkOshO2/3qn/ijNdNgaTqyrKfLDXAK5wRlzejXQ7NqtQqCh9A22IwUB5Cp9hMoNsAoiAYbDz17
	Orpdrj0DetPwS
X-Received: by 2002:a17:906:ee85:b0:c50:ea07:80ed with SMTP id a640c23a62f3a-c510e547d86mr560202566b.39.1795096490106;
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:49 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:47 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-3-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=1650;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=aA+iGNmAXb9ktbwAU0KbUX7yr+F4w/IPZJ4vFwuykl4=;
 b=r1uAQNYUas2/uOCdwJ/uUDtwQzglg/TNjUIZyy7Tlkl1iSfbdZ6m8DH7MxwWkifuJuXBxpIwr
 HacaBfJyVDmDZ4v5kDX5zKr9vuattUfT8WkjmHynS2j3pd+xDJp3rp8
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..76184027221402e57a569d74749350c1482f5afa 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {

-- 
2.43.0

