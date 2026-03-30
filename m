Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639413BE168
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865702; cv=none; b=KTWV5s/3t35cwwnSp9dLZkL3uhMAO4Q6+T/owp77RMiZL5EBlT6VcHnt7rEW3o+HnuWjmmE4rym0UNSqEGCxC3WJcGTkn1DkiKSeQC2/aDha0LQmHTDwB35wBC5WKFs9kl5SXiPmQNdx768nshBgb4GRYTik2kF2934HRn2tBlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865702; c=relaxed/simple;
	bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbKEUEUeAOCq2n2GeucTCDmNvOemu1OMxEX0CpO7EDIFr0hUzye4flSoU2wCqrFlmjnwRrGVco5PE/ArquO02YSaY5g0N8njhRdXpm+TeGDTU8ZnzGYML93+Qs/fdQIgeUwaWCDZS4FE+0u37J8lpmpiQr3/CrxihlRn/vR1dFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7PzCdQK; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7PzCdQK"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82c68339cf0so2849780b3a.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865701; x=1775470501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=d7PzCdQKI2FjXAFhI7feJnqgEwLAb0PkUqOEuLRa44GWKkPO2uVQL/JeYHwcpdSrO4
         uhcz8YMjGejFfGF6eQh9AAWK6HABlXgR7RtYRZwhm3WhUCRpC6gVuRu1cyzrN3OjZ7ml
         VelI8XqZICAe+alJ8AlxexsyEmBkulELss4947d/ozuO9IdUAUj0lskQBTliNyX61Ydt
         Z+242OE4q5L/nl/7HAY+H8L6KzbSLW0PlzG5jR5XdHnRa+cbyprzDGWBMHkUwY2C0+tt
         xGmzxMfQbSFTP0XpCAa2yVYAv7PW1alkVSX5CQyEY3RZ8NiS5kB+PWaYxgnID5aJ18Fn
         khSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865701; x=1775470501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=eN9vQmvOTjnOQtCvVNnQM+FbgQwZ71PQU+MGNo87Zi1RV3E8xceRA9RLVbBknpJBUr
         7Fw3OfE7KOvA8c1zjiembaL1Qa1MHhMCv0lUnEVgwVuV0d4+zaE1Q1pAIi9T70TPPDMl
         0jHbvkpJwxaHaqhE64Dve0X8lVky3ovH//9dVpQ3chKUdTIzl+VFJH1RHalSUSn9EX9U
         6X7tGMNmWawTRkqG9+0LElfD7WiGtm2Uvhoz+gw4DQP0Ed8F4wCphaYw0PpGGyuY7eOg
         c3gcNW8hlZMN4BlLbWtSQts+lHoWGdD5Nyn8zBXTsEIjdj62pIOaCBwCMuThiRKhlGS0
         pv+A==
X-Forwarded-Encrypted: i=1; AJvYcCVe3nHfpUNcmhTf9MkzLuN9h0AG7qJC4mipF4PSqN9RYXO9OT9fuxy6Wcvouia82ypr8q3ESEvft6Sp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsn/DVrHmXCMoSPxnS9W/e1E+hyhMIEdYssWsGT7eqfpUzcXt5
	rNgrdtvITbUoouocQqL+Hb8sPtkl023UHq9XIExKhDirO+viASd+0P7R
X-Gm-Gg: ATEYQzx6XozfRRCAl1ymOOwhZo1oNnhErKX3lNZ4/KH1FGMvLgZzqKPbuCAqvY4P20G
	jEGT+QhAjH2EoPSTeATdQQGJVXiYRbfRsXAkcn8awu/VXirAKc9XNPNd0gMXi5fEQjc34OSscFO
	F2xNxNyuS7b5lwh+thiaDAzIgeTc7JyZIxTKqVAWA+1/KaYj0shZLNyxOmtD+opP5KlaLnnCiTg
	eWLa/Isug7bRKIJlcxMAjliQEh8NL3UtSGJSp0AfDnAqcHRvPhPhpKRl8In0NynnkNhCxvfqPJk
	z1XOqawXpSaojMgj3HQX1QT5p165qphOKMhOaXFFVRe8KA+XBECLmrpXN79J6kpZg6yNowD+ceT
	YoSYNpsjsXiaMhQpYWQrP9MsRqFSrR8cAbGLuAw/gr+Gq+vDKawyZrQgfKcO5m1Q742y1BFR0aB
	iz78Rl8IHM2XRcu6DqXa832tDnODfs
X-Received: by 2002:a05:6a00:1c81:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82c968762eamr9218652b3a.8.1774865700537;
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:53 +0000
Subject: [PATCH v3 6/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-6-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=963;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
 b=vESfFUjfFGKmOK/hDu/HFDuHjmi5fusU4ve1ZmPLbaemgxTmnuwyCQLnQCnN3/xFqngqK3IT8
 SDrNOUspY92DbEZYsp20mHxibSWyg1pOrifHZHZrcDoCeEbBzoQ4HKT
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Reviewed-by: Sean Young <sean@mess.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3e..0297bfbb2750 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0

