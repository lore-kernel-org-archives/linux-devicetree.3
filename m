Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6113E4C96
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374603; cv=none; b=AwHqJ0R2gCj7ylsCkL7d/GXQXX80DajH8v1mJafumNmhYOV8ewhf6YfdbZazVSmY/aW8boxTVySM3nX74iory5Tk3S231hLVCUdkhC3QTUEXBD87o6SDbaoDX2aEfqzf9XPmV+uymJllIOdjlWYjHJBmj9GKAy5pl0kDgwik0fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374603; c=relaxed/simple;
	bh=5Dm600bPPTKtyrUOHXhYpa9N1nPifHMEOCkAWXwfLx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJBosyT9LVcMgh7RrL60QkQD+kq1kPY5k/jsRlKlO4Ph9Nu+4P/3YN6ltCxPORV78MBKajA73Mc0Z8phIKJ9EIpCzYfkWlGZdy/qUaCs2yToaH9I+xWPhMY0svaYKLgEwJ57KdaUlDJA9nZn/aTqPsFpBYo1LkGNkquJmlAAWgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrHk/JKV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrHk/JKV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso11887695e9.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789374599; x=1789979399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygduNeN8JV9frRntM5qlOGqrIEENJQh2+4j84dc0190=;
        b=MrHk/JKV63eWsxXiwSMvRuGT9aF54r77L6NN2Luj95rMcl3Am0GjHA+4DzQgUyqf2C
         VuvHggZLyn5mmhSl+zUxjp6VhtRaw0Fye/KwTycMwVm90J8Wb+pAiK/Mn4BIgTRZZky9
         tHXHwIdXB8BAqbA3jb4UQlr+LkpW1xTIwRmfnK3OHTQ8TEC3xhFtouihYCdGYDTb52jd
         4032Iycp5cc9Th/r/M3bQt3mvQ/8mSgZirLH1jFuiYFa8o88JmgY7KnZvHjIkPMW6h/C
         MzXMSWJ/qzwVrpQ02nAW23vNsokTTjHVUNrYneumOmVhXA52ByPb7Is4Xztlw3Cs69xf
         zeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374599; x=1789979399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygduNeN8JV9frRntM5qlOGqrIEENJQh2+4j84dc0190=;
        b=snaNSRsmKO+SzK9oJbIwd+/JMDzguYonA0rBQpUgVFojPLFc7GR3vYyQeEqTZPBhNI
         Cwu9PaypZFIin3kkan59S3WFmuccggmyzI1Hu0lulZw2xvNrz8On7ZYAsrVs5Isnglzw
         /+8ICDix1j2nWv2GqKsaX/5fEje0nTegU0O0P0OC/V+9EkAVaQXZ7g9wFEhCUO0pevmy
         bUQE2rzN115XMaFxTn6rs5w6vcsXO0WerbqXngNGhAvnGMhKI5hcfhChsKr6WqAb3UH8
         FjhyQdulAUsjT6I8BABmrIKSoILt1ij5WHSUMPsM8/vT+TwWNwcYYPiuOg/kzdTd5pDX
         uDWA==
X-Forwarded-Encrypted: i=1; AKwUvByQa0aEeenBJs2EIBMO/r2Ti4hjxhFODCvxETXNYvdvg034/kLAVWWvkMknaWMi9cH1Qmo5wAmSg7Qa@vger.kernel.org
X-Gm-Message-State: AFuF++nirLT7UgAF39gjs1gEk1NIb4lAuwO3rNitFJB+8oE8Pi/3hwmS
	jdMv+/1/zNEOW91WJqbkDF3mn7ahuIXp9xaAd42SdGjVnStGxnjVgFpE
X-Gm-Gg: AYBFou2vB0Een/3WqjVs+xMy6uG0banpCyr3l8Il8Zor6WYAS8X2Rng+Lyfue6bUTgz
	wIrVeIXkN4a/APpHwIV6Km9KQ+UR11SIrc5UgnLqQ5gGj+Bko1NqIadosqkZyi15v8rG84gEQK2
	BsgFq7zlQqeNAXsuxzIp6K9f8ATIzS2AFuEtSdGIyrSv52lXpWYEbNHDdbIjpNBrbe1yTGUymLZ
	hhTvwE6E4kXTct7yMN5lyHC0zE5L3eqx1ALxQQRHVvsBKsBNP3Hul8D9DeLGOWJknZvC+9E4JdU
	OpI/UQzqMtx0VOw9zkJ3IgjF7waQ5GMPryMhgMBzR0gGQ+k9dIvI9I8TPROumVImXPOt2WbBOGI
	XhgaClT2vpgeiHZZ5o/KdTXRvvfQ+i7B9vwN9HHB99WZelOHoRVXfHEm17X1u607aDH/R53zo86
	ExClML180X/PujbuZRz9iSEqrPlBOYmQRxuF5LAFYSF/Ak7A8dXlCtPuN9x7SdZIGwQzFEV1mVR
	ftgLZK9Jf8kPKeMBQ==
X-Received: by 2002:a05:600c:198f:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e7a66b2c5mr24553115e9.10.1789374599199;
        Mon, 14 Sep 2026 01:29:59 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm23378826f8f.30.2026.09.14.01.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:29:58 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 14 Sep 2026 10:29:50 +0200
Message-ID: <20260914082950.9393-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors, the battery cell voltages and the CPU fan
speed, and drives the keyboard backlight. Its interrupt line is TLMM
gpio66, falling edge, for which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

The binding and the driver are under review separately [1]; this node is
inert until they land.

[1] https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index ecc8c34..30dcffd 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -652,7 +652,15 @@
 
 	status = "okay";
 
-	/* EC @ 0x70, irq = TLMM 66 */
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-slim7x-gen11-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &lpass_vamacro {
@@ -983,7 +991,7 @@
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	kybd_default: kybd-default-state {
-- 
2.55.0

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
