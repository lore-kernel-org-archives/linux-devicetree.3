Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995169;
	b=ytezDM3cGI8G+t6qcMF5It6fRwyTH/Cfv73lG6f0lzdOboS9s1Yq5DuTO/neLI6Xh1Yf
	 ji2IKAlYZGnbJXWknuA1a6xLBQb9epGiaSM5vH3gNlCyy86lR3L5bri0eqPon07GeLI4f
	 YMOcqYPG4iKNjsrl3lYysaP54ABWVyBHVct9sn/YsZl8P5IIQHp58E+VhslyABvyISnNY
	 2k7tiaZwnfBuvvDQTLyNxEf7GIRmNrEIFItbXHmgWoJyZz1itU6Es8JLZiOehEcPWrbNx
	 9Xpeb4BDWZlQK++PAne2G6Fub6I2UlN6s7Nb9Wmp7sM+hWpsFfuBao0JvHkJqSK7o0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
	b=tAY9NFPLBhKhb98zqb6EVRxgAkUkJBXnepPK4N4pw9RLKKaIhDmL6NCDrKiiH5Jaf9rW
	 AdKaW4BcFDr10H8y9uvY87Uo9qBMK03ZFE9h9G7MCS5ztPKxzgl7s8Ks04820jDcVCiyK
	 H9D/PLy2hWxSX5LjZqBVl0vhzLrsGNWqXVJHt8DIXnUG2ClEnGNAnVt5Dk6pff/yyipx9
	 C0oWUc9WTZDbRyhtHTqui/VWudfoKKpqtjPZIpzo261v1ufEHA0bb7EntheWEbNkRkPhB
	 pZbnlNIeBxiQBvxIoN2oHEgvfpIUFl2fpI3La5cLpaWHTfYPrIJD2a12zZkDmivJ0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OlMIbgdF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DFD606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OlMIbgdF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so693460f8f.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794995167; x=1795599967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
        b=OlMIbgdF0wF88RNTAla/QVbDCTtCBqFsK+c/DaRfcr/zqjmYToILqRVtT4rXyZ/rnA
         xT85U6rbGkOpno5ESwCY/QjGUA5EidYC+4Fr4Z+vTKHZQHmYaxTxlHuU60tPgagsozQ2
         ceSSMRJF0LrCMyvFFE4FxwXSLrQ1iobYPdWrAUVulparBJfd7VjmfdKXKccuidQJnVZ2
         BibjsxLnRo2vKLIHQkCVMKjBgADuPAiz57jwGwS1K7eNuiw8DKfM2CD+byKYkoIrQpBp
         xfOJKAWrFgz4zXcXSgkZAN1U9jyVscm3SDgF23bKDMAtT2ZXdslpA9gsVoNGJKyBRcNj
         6DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995167; x=1795599967;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
        b=xvcLnP27LfOl7l2honFRjC094Od5FI5tvZD9uMgchiIXxi6Laeys8vQ+XJ2bppJaIj
         6a5IY6rJxJ91bL2PbdOFwNUX//WjF5GmKd+mtq0hhI2lmM35wdo4IxjrZQOHjieSMClf
         3jwRuuo+rpCapY0FCBFvtQGh6ReME41k2190hvJi7tCIiz//iUGdffTFEHu9qOcWTGbM
         FZKD8pLrPMvsxT+g4lesaIbnGIiTUQSwrrh4g0TcffhdDDDkrlhl5r7WJH9D9bewtDJ5
         tFKu5DMatWW/X51GiRfEs4tQpBjlBz2RKy35vKpXsV5E3BEFotIGO3AJvA8Fl8gMXdpd
         jx2Q==
X-Forwarded-Encrypted: i=1; AL+hErHQluFwf/cEsQbVxYya2eWZMr2w6zWvCeINKSRVZDyLSgAdWGT6b2a/+HGaA6f3NU9K8f1o1PTPx40a@vger.kernel.org
X-Gm-Message-State: APuU4Z/KH7p9TiTDyPm9rwaENvb+tJDHxVQU7M0+4gcxiydmzxN4ll3B
	5ua5LkXopwcCkRuHtq4BDK7s/OkHxStqrXJ9chwLRyk2yqav9/br48iM8CNXMeKwaHzbGGaFOwp
	wUSbt85faMw==
X-Gm-Gg: AZFdTZcl4itGIBF29N1yVQb3xwse9/DYTnhOd2ImZfdOf9h37Ssmg3c/ML48aXuJsIp
	LUogeaFtOv6SDh7M9cXqO6hZnSz/6FXTR7qpbGARCQi6j59Who1tWnfL+aShI+8F1d+6Xf3QiG2
	KMmth2NacxduCyT1bPaRB6Qchk+YF6IIjCvH3NyoF2+Vk6KEbCagW9/nwaYyIW3lIOnnvwNS+5M
	FqYZLlxkjCKR3kM2VN3V7p/IJGqaLQFpmCdd5vifnwGTwZ542f6CcvAq9/40bTH9eTuIFtpiaS/
	8vW/pwXw+S6lleks0SOc1s7Eb9Wgv7pxVNO7JIuCi7jin6S8fa3+OzQpyLCyb2Cz7oUOzF4Qegd
	PpAjYjbaDjA2GC10J7f8WVtqXfVu7W/cOjDgq0f3kae7G9R6bB2eoqi/QZ8TaYCI2NdAP57zwzY
	K6mEL0fvxEdiHQfbwkW6/ijbSOU+SR1aiAEauA8Wt2+yNhP6sACkJ0Oq+wOzpt4oij22p0EIr8J
	TkmnfitEBJadA0oUNzW28kvsB4+duaSvrQTVh2h7sY6+oe2fRghRbtkzB0Z5nZrbkjnmpWFrZA2
	zwImp2vvNUp/ey3EopNMoNb7ZMgDpkIyEcC9l9ZVCeVXANYNEQ==
X-Received: by 2002:a05:6000:4812:b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-4a63c18831bmr4235011f8f.41.1794995166803;
        Wed, 18 Nov 2026 01:46:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm3422097f8f.10.2026.11.18.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:46:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 18 Nov 2026 10:46:05 +0100
Subject: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
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
Message-Id: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
X-B4-Tracking: v=1; b=H4sIANxz/WoC/yXNwQrCMAyA4VcZORtoh6vTVxEPXZNplK0jqSKMv
 btVj9/l/1cwVmGDU7OC8ktM8lzhdw2kW5yvjELV0Lo2eO97LHmRhDb1oXNInB5RCZWHnAtOmdg
 wBLeP3ejpcAxQO4vyKO/f43z5257DnVP5hmHbPoEStDGFAAAA
X-Change-ID: 20261118-topic-sm8650-deckard-reboot-modes-6604a5f1d796
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4ZnlLeALSzVqUVc/KZNZljqw7GUsLWbDl9Viy/ZS684=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq/XPdQolEG1UfaITInP8T6MtD9n8GC9MTmTZtsIxH
 uxdDzUaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCav1z3QAKCRB33NvayMhJ0XPHD/
 wIeS+uyeMpRPRDpVGwLxG8iizfRO+PVN6UUDPAyeFtxkIiERuCKnOUEdyb+c75fjh3O1f68LMl/RTb
 zr6gKyu847aPS5wGkRxyo8M6Ra8Oqxh7u2/Q8E4pFgn1qkIBz5nn2Ky8Sh097tqSnEn0421nrrcm6k
 cj2gNAF/Vta6Eukz2rLVBHhL6QMv9IPUWAEwgu6q0zkD/pVMYTTZ+ctmM8aqMjfJFE9llH05BvdX1R
 tGgChyr0zO+s7IpfpppS8Q4WR7Ve9bBw79CIjXVC7EvToDdyBelxzfhrzdFJ3LuPYZH7dDLJ/D4z1w
 8wO6wcGPE1QE1hjc6leBE5aifYydlMbO1RSqd5AJDs41+fo+PtlnYbLdG/fD5y/yVoIsWxSaIIGCXt
 22T37ZQiTkyt9BLRD9Fpk9sOLKElVe1NLWIPt93xu0e5fDOF49EW1fdl/OP00Z87hl8GnrGos6LOEs
 QXSKMKGbLL9UdD+8f2lI6gR5KSo2SwYLNjJVYYML5xbG7QfIA7WGECtX+6vdTps12QGkNyxXnMW7ji
 ZtSYusMhpHFB39+tcSqRSYivRshnLOUKT3IfnFanphtUDmVuFtAiWHjgH3wRufDAn2wdUT96OzsWtH
 8bKxNg76F1vQxfA0C+bsO+TwrKB5glqvIcRLlbrhkvWCDOSg99mlBpwHk+DQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the supplementary reboot modes supported by the Deckard bootloader.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3a9d9f7c3742..bf757b551507 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -10,7 +10,7 @@
 #include "qcom-adc5-gen3.h"
 
 / {
-	reboot-mode {
+	pmk8550_reboot_mode: reboot-mode {
 		compatible = "nvmem-reboot-mode";
 		nvmem-cells = <&reboot_reason>;
 		nvmem-cell-names = "reboot-mode";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a83cad8efb2c..111d00085954 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -1159,6 +1159,13 @@ &pm8550ve_temp_alarm {
 	io-channel-names = "thermal";
 };
 
+&pmk8550_reboot_mode {
+	mode-edl = <0x03>;
+	mode-fastboot = <0x04>;
+	mode-usb = <0x05>;
+	mode-initrd = <0x06>;
+};
+
 &pmk8550_rtc {
 	allow-set-time;
 

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261118-topic-sm8650-deckard-reboot-modes-6604a5f1d796

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

