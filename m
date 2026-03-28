Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94C35836F
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663843; cv=none; b=H1BcwMAVTqNuBAoUFSUd7cNJPNKl0PS2/Ln5HWWGGDuXo6Wpw6t40i/z94dZS9TYGzWIGjzeq7/ZVk2WiWBit3gWishvzzEevHW/A5ERfFKee1IU4Lihui+6TaZvmBRP1AXuNc5rmG8e9HCukLQ0WEDiEfjuALekj8Nb11JjiBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663843; c=relaxed/simple;
	bh=R69+L2JPeD1MP85dLFV01UZLGFMXU4a/hgYOgtTZilo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovB76wnINjMSvw2gC3D0XYLAQ2tdKe91Sl0MUgFXaIMNsb//z77QKvvHk06PC4jj2eug3ZFRoz49nueqZxce9LErGt0imPKf48ezzaaR/YJdEjv88WXZMnE12rliKI0p24vBjZ0ngSM2k3D63LWGG10SbIQOtQXQptaG97m6I/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqgo4Mgs; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqgo4Mgs"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50b268fba9aso24307971cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663841; x=1775268641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLYu3/l3eIAYRmWYcKe3ElSedjx9TC854siA3A1aW2Q=;
        b=Mqgo4MgsTcUhLTvbXXSgHovg1o/GOnvAvEjlhSyfEoQh4s2RkqFBoesJ61+bINXHOi
         ipoE3OFQGAJLP83pX39LSOiuhKEFP/p5j2skY3F08FEpVKZ7WHRZBhwoDsnJZnbIYzOX
         bsY9BUhLI8vftVYObiWI0yboA5m7BWY84kBLLK9f+7M0iuowbDQGKtnWKwu1wrmlytKy
         Q3GKoCFWBL2N6TLTeqCwlePIRryggIAQLOh9Rv6tia0mitcB/+ej41d2PMoKaZBp8qVb
         /ZHcrevQBGQNjDkhhwZeG6Kql1MC+t/UVTqx6QvvOJ1sihJ5lIzfB24jTOx0eDNKsCUy
         hDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663841; x=1775268641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLYu3/l3eIAYRmWYcKe3ElSedjx9TC854siA3A1aW2Q=;
        b=ph082kM61cbV4DG1Y7abY3sUdIage5I/+IzInyiPXWDR9xMycmStuA30QT9JQ3sxX+
         i30ZrHDj4z4hVfggm0wxyESLzRYZPDoMS7lN+4BnKf6SefdqPMAoXj3z1eRKyt7l+oGY
         I38WxsByZz7oeIDssbyYAcmI/2N7x7ooCuf4iL/ndjri9YzCOlMKusIYRfNRxqeIW8Ls
         +ggrwHdoP9nKlDgmq4AkxRUSwxnK1uS/H0di4Tcgp1oSPuZJa6tC2i4bPfEcaj6PjHZW
         LHcr2jzQ0HtGKoi7pe8EXzcGg/DBf0d1oPHanuQqretasykNbkddG3XxzT/XtF0nS1w8
         VcEg==
X-Forwarded-Encrypted: i=1; AJvYcCVFl8IsWNXQd1sQNuCU+/GwtdaINwPXfBWPJqNFxZiz0w2PNnXVv2keeCPmKNFlX1FaXgMHRGtc2bnT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzljb4a0Y3nYER/y/o/HxdeIAOrvy1s+CByoZjFEFOtYejmoPA5
	Z/+M/RgehNT0+T6cK6OP5MH57v152wPJ+dBq3OgdeQnSXZFT+ASpr3U+
X-Gm-Gg: ATEYQzyCkBq11m+dnUKE7q6KY0PzX+IdZKgKkuprPntux4nBxuRwfZxrw70NKNil/4J
	Tj7nZZxd9Rc6QvaSydWi8zIbtBDyAPLXqzlV7yjIz6u9iuRuKm3LOd1Es41oxsh6VKk6tHb4CRY
	CNSxrbewBhaNb/ATzCK03vNiElkZ2ggSaitKKGVEhda7FszX39paGrPkKEwQuhdL+pwsjYNJt1l
	4N8Ezl1UC7MRQOXT7k+gatvNl6RlMFoJs884KjO7J5DmSqG5T3PPENT6pqoXwuqkpwwaL+HGfuq
	Y3N2Y3v46C/hfvIQSeA/pLkQUKkc7zHQCxr5qeJXDCj/YWHThUOimiIAaOq6gjiZybHgs3jA4mo
	bAHtnRbHwazO1DqWmY7cl7s8sTbZTACD8Q4cBg2Dve27eTbY8QYfRy3oKKehBW22UayEY2Bznbb
	ce6qc+LAVV4SwuIynESFQhuwlHyHhh+78+8hGoxzKV9iSsecpoECvnkHVU+o9Xse7IYhC2IzXoO
	etFTlPlkhiD+4Q=
X-Received: by 2002:a05:622a:19a6:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50ba383ea86mr67519301cf.8.1774663840912;
        Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm8304811cf.16.2026.03.27.19.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Fri, 27 Mar 2026 22:10:36 -0400
Message-ID: <20260328021036.85945-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index cf7b130ea0c4..b0da24fd1aee 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.53.0

