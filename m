Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA8F41E6CE
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378094; cv=none; b=uYnCqk0ALU5tnbBJitkJj8+SRNUJ8AdqK6zF1mtyKtAQnA1GSKtR7Wvv9FUp+7xn89l09FBND5mKfsc5YQnUonXvkegsYvgbgGUS/kdljlUu/cHAQ2gpktpWF/n+mzEJY/UD+hkfYJrV2CoRJOq8HPzeByPT4ajCnU6S8KzVu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378094; c=relaxed/simple;
	bh=uBRBgt60qnQzF51ZX1c+WFKEWEU4s4VaOlHTPM97Lag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AU99UMoU9Rl+OnTPv8nKiXuf5o+oZs91I+tS+CziKj1Mb/Q32/oZvE5y1Vmhsvlt/3WObQp0gFUE8ifOHIcWaMp/mHTqw7Jcz9yrmMus2UWKW5ATs8m8LBnIKh0PZMaqH0kA8b7iWXmMDOUjA3eaM4aEpBN4PKydTRl4Wtr99Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0uMdTl0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0uMdTl0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so810919f8f.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378091; x=1789982891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xa5ZbUfuvrToiYmQZWM/hOZFSIc+eJSMXf4MjNO/px8=;
        b=F0uMdTl0wnRVDDi57eBVsSwHBeIkhHZKMwQ/GgzQiYBRyj/cwd3ioOOu9yvZYO/6dj
         qKTEwc1euxg6XUgHxeuXj2Xprb47cfK08fzyHMn/4ctls1rDrY1sy1Ng7zYGTuuG//zD
         l1W7vXQHSjlhM6LtEWuijGJR0mleo8hmNT+o1+jwvueIIfPlLfjnyCSO+U/UVAcJFOAh
         qZfkH12MUF95515wgaZJn4dPz/cEI21IMKuDEnYmhZtet+FCFw7WwDxX7wNcEg0msrjE
         BeLOvSFElOUsRJPvfWGt+mvmNrK+254WRZViXp0b8ILiSJyXQCo/hVc7X0xLjiPA88dO
         B5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378091; x=1789982891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xa5ZbUfuvrToiYmQZWM/hOZFSIc+eJSMXf4MjNO/px8=;
        b=IXq46KsB5+uPmJtGjC25utMCyK/9uGUcv9AxAtrU0BnDR6vzQXJnQ8PsomybrDYpDN
         32WUPS0uQybjgCvuZKhKTrpdt+6bYVDhhZPWNP64UWetiHQEudaWm4Eeje8gOj8pCVZQ
         oQT4cel/HARh+osbMxsb0F+TkiwUWJs28xJwcMY6wZ2Kx58EomXcmyDbBhOYG5TnPB0/
         NvxtmQD8C2PdCznHRKoao3TFF32OwRUQ7voYPmYIa6kBNlS8BGnPP3RM2ufhpjsVrIRb
         sNnlfRpIwlyJmEgjhWrr9ztSwDgyyyLMtFIhCvD0uAzKjIIpUNoE2uD81tsi8w/pr4Hm
         nR5g==
X-Forwarded-Encrypted: i=1; AKwUvBzPkbUZvyaFtdEve1fL4XjvbqdwFWAuoUOOul8h15/PuG+Ln38cx4hkhNcJryrHlN0lO0BqxvNZ5GNy@vger.kernel.org
X-Gm-Message-State: AFuF++ni1qraZAgxLken8Mvo84Ox1xLoJZp/BenNI4f7hobrsv265uh7
	df3c4uXcsM4BX5cL/qtJK58SN1Uo6qp9Uhd1holDMI8T986rYwXYldXE
X-Gm-Gg: AYBFou2eeL9hbAd/3omRFBJhUfn0T6m5SDcYvDpQoEPSCapUbSOYS3UoNVmMerX+aXa
	P+8aPGqFuCuYKMGs+PpA1XypohyLPMsUlsYYO9lw6Y1EfyMHDUZ12fQjCalzNJz3nat2cLRM58C
	SsHRCB3Ml+2iatkQsSzgtEkmSRr0QwOn0f4CNQ+z5Ktr5I2W6l2V17XejmDiQfezIzs6B1ZQaCR
	TEYOpAhPrIpc3PfTffFuQFEEFTR2KUFLLCHLUBEx8BTDSgmdDCiQsmR3Hb6yfwLFksrE766Qt9l
	BkkW2S4mIE9uWCyTlks9ZfWF2PRJfqtL80Fk0h1u6JUWi6xpBmLwe4q8awGfc9EG+jn4c1i5qgl
	kPvhemEVWVse4+DApgwr/v4XjP5+8QGo3cQcYB4q0gJ84fZhDw+VXMPZKRBaFepCjRFkQizoHeo
	uIS6woBhzwRS5+EDvsJ/VDVuof+RFfCFCcaj9J8E2QL4TnPk6fVjBNGk0ePyvB5WAocTZkULwN/
	UWBnWk=
X-Received: by 2002:a05:600c:4745:b0:49e:799e:c1c3 with SMTP id 5b1f17b1804b1-49e7a6868a8mr17463165e9.17.1789378091334;
        Mon, 14 Sep 2026 02:28:11 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7a29826fsm45244255e9.4.2026.09.14.02.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:28:10 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privacy switch The laptop has a camera privacy switch on the side of the top case - a slider, not a mechanical cover over the lens, and it does nothing to the camera itself. TLMM gpio99 follows its position: high with the switch open, low with it engaged. Describe it as a gpio-keys switch so userspace can act on it.
Date: Mon, 14 Sep 2026 11:28:02 +0200
Message-ID: <20260914092802.12315-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
camera privacy state, and it is what the Lenovo WMI camera driver and
Dell's privacy driver report for the same kind of electronic switch on
x86 machines, so use it here as well despite the name.

The embedded controller also raises event 0x29 whenever the switch
moves, which makes it tempting to report it from the EC driver instead.
That would be the wrong layer: the pin is a plain level that tracks the
slider position and needs no EC transaction to read, and the EC event
carries nothing the pin does not already say.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
Changes in v2:
- Capitalize the switch label (Konrad).
- Put the pin state where the GPIO index sorts it, between gpio94 and
  gpio111, instead of after the trackpad state (Konrad).
- Link to v1: https://lore.kernel.org/all/20260914081652.5935-1-okerixx@gmail.com/

 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index ecc8c34fb983..769f195c99d9 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -51,7 +51,7 @@ sleep_clk: sleep-clk {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&hall_int_n_default>, <&cam_privacy_default>;
 		pinctrl-names = "default";
 
 		switch-lid {
@@ -62,6 +62,13 @@ switch-lid {
 			wakeup-source;
 			wakeup-event-action = <EV_ACT_DEASSERTED>;
 		};
+
+		switch-camera-privacy {
+			label = "Camera privacy switch";
+			gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_CAMERA_LENS_COVER>;
+		};
 	};
 
 	leds {
@@ -1012,6 +1019,12 @@ wcn_sw_en: wcn-sw-en-state {
 		bias-disable;
 	};
 
+	cam_privacy_default: cam-privacy-default-state {
+		pins = "gpio99";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio111";
 		function = "gpio";
-- 
2.55.0

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
