Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA917284662
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759739; cv=none; b=kmAkd9/HETKArQ5Z6i034mP/EsGukl0rzmvj2lW0yMGHp99FnYC4YrmOabEyBp9mL2f+Hs0qz6ORsZ88jzdsFwr1202WFNzlxdCtsP46dX/03W2LPjVo6KHeaPtIYPZDMTDb+rBqGDKEmb5EBQiHEpEVeKJmoVdpbhzC6jxNz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759739; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itoU3rxTz1WBje4H7wzeZ/eLfwvfiBY/8LW96iQ8SGzHx1fv7b3cE6emvGN8v+EKQalixKJR9+1BwVePwZp6fYeBxuYoFI19GycRXlZsNR+NJ0QqyN2sBQNmmUPb75h5i9H/p9d4RxwvbVtqJvvUJbWopym3vW6ARB227sQvB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pETnFdge; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pETnFdge"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82c70e4654eso1442720b3a.2
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 21:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759737; x=1775364537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=pETnFdgeZDjhWJx7qdfn+Q3+x4F2R0sIk8fjtKm5gRbkSs9Z24WqpPBn9ub0yFhl0I
         DC6bIs8bmZWtmKmaB1F+lyqfJUApA5rZ4h5YiaWKtLcVeDdFm+bPxbM1W4nrAJo2+5EU
         w+ahwNwgmNWJ27WfRY+/o5xwrezmb69/virhHfjMG3mtbjGoSh3rJtqBxWTzsCKvbsng
         BLiHbk7V/odSxcUpiIyomaegBVI0X0pJSfoMOzPLTTczme0wagdbWCgznrIU4HEa+Lkq
         DPKWlzxNb5mF6f9Bx72TjgvWuU6lZ99CVqzYFgwqYipVqe+JlHp0Q3gEhgCCAFXhNmUK
         hh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759737; x=1775364537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=hQIoM4XZ3s7ooozcwWPvOzXLkVTCzNlaL9pM29aGvt+qns2PaCy9B3VjYFSwncZFLu
         18JaqOesSGy6u+R7PmHd/m21e59fvT7bB8qVtqmpcWkkj36y7d013PYjTnc3jdUF2arE
         jFLj2u5KJoXda4ADXdR7ooqXsrMa2oM1Tb0yOGi7LJB1JHfUtxrYsX1BRwUTFsbsBC9J
         e7BjrF36pxP0fIbO8FYvVVeOLNmCT+emCG0XhRM5/cRgr+8H3NGBRGzM4UgVTl1Rz1NT
         /g/b930o6xT1F3IQrwYLkDKWpiYNXRo9uGXN79y4Uo0ZoirO+8K3OauBITBCxk3iVXrD
         6ebg==
X-Forwarded-Encrypted: i=1; AJvYcCUnwzvn97ICi/TR+6Ql/6MHx1ymzExEkghCrNgwC6iQyyGMC0Jlp8xqdf7YlBI81JmamEIVWsm3nVFR@vger.kernel.org
X-Gm-Message-State: AOJu0YxXCHs9nZsH6bIh3omx4QiliOigVMZt5pZeC+FioWOw7wTK2iCd
	rTnaz12R+jBc32SIMz/EgywQrhmKNUvhdlLcy3sCl+OhGPFcCDAv7g6a
X-Gm-Gg: ATEYQzxxnflSUXzUqJP2DTKHsaBn9Zyzc3/kT3M2bahGFRj5+cIbzMtFe+4IAlsM1Lq
	rhvsWPLj3RLQk3pTJIY3WcLeq8WvTh4/M2PY04DTuWE79AHASk8CJQaIo8Vs6An74bXnPIkILJy
	xiASI4IsD4aA7IaFqSyC+Mk1rvV2ArjJMiNiNf+uam9YG3JJ5D4GwjY4SdVBl2EP0pqXL+Pns6h
	CdRiVHvbUH6QXTY0AQBgwTf2XWgZmUP9yeVtmQbKYAtKNcmS3FUfqWzsRHeSvI1wnkO6lg4Bbt+
	xio5K4hXc9G2mg+/OswFkAs+33FNqHTBCz1W39WY9qbIvNLBe9ObX+gKnCSo7mWu+kBe79knFPT
	Gw8GVrXvI1JtpQLsWB7wmzheG2PTI43z0+9mLE5le5wIb1tFA6rzoa2VlxGZFqX1aHtBm6cKUgL
	wGCI0blkf2ibr3bV9BSbkANo70U7SP
X-Received: by 2002:a05:6a20:938e:b0:398:a128:d463 with SMTP id adf61e73a8af0-39c87a3c214mr8660465637.35.1774759736982;
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:02 +0000
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-7-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=AjUWH+AdSOG/5ukRpNAwaXcythhtMm7E9TAuzpnElRgLKa+TAvWs+43AuNxf5Ryx8NJQ1jxE0
 4oBI9xuIcl0AadPRbyVh5WjXVeiB3FcSq+LKxcHqBqYrYdg9M7tkFIx
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The IR transmitting LED is connected to SPI8 controller.

Reviewed-by: Sean Young <sean@mess.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693b..7d8481173171 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -99,6 +99,10 @@ key-volume-up {
 	};
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -160,6 +164,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -332,6 +340,18 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	irled@1 {
+		compatible = "ir-spi-led";
+		reg = <1>;
+
+		duty-cycle = /bits/ 8 <30>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };

-- 
2.53.0

