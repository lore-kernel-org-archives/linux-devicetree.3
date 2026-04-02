Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5333B6DC
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096433; cv=none; b=IxgpqGyY+5m4trj7AXYPQntDJW7eTUJGsZt3Ku63ES1DwuPaImL9RQVzXc7xcvxJH20RMjSd8r7jzIBWD0vIDyC/VFxivE5TJcTN910g0F1S/YDHmgLTc6jr/2FuLgutKPEZpPWtpHU1BhmJn3jRkC+5q7b70tTu6W2lLk4/zTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096433; c=relaxed/simple;
	bh=3crEO+O89xHnAa9Qv2tmtZDwzd9lKKYN3FD110HX30o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7FGxxAhr5S+/IS1dNtezKQikVVFcLjBYafR8fW3loAKrV8JkicaXhbt6ekNoI8kwsO7nvQpYsN8pPjQcZQzTZdtLrtUH07VpaYV2MCDPqfmdE3NhevO5K3YGelBx/J7Shtv7VewFCQvbGCHfaz5y+RTq6Xlnm9uR17fFaX5WbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3Zc8f2O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3Zc8f2O"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so2708245e9.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096430; x=1775701230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=W3Zc8f2OLkS9VvTh4QuFfE7szRa3l2eqqbWwgAjn3qtW8C89Hhr5uj9FefKPw3LROR
         GKtU684io/ZJ71Q+CX9+rbZU1ivICPtcq/T/17KMp8T1GQPal3kvlnUGDunm+0I8bAkN
         sQf51CiaeCgvHHNiWhJG7/Sx3ZZwVzBfvWgTV8Qi6xpGaTDSOoBO4x95Wdq2WJx9bRGB
         WY0tUDfEMlKtIPxphLqN2ieb3Aq/qebr9aLE2jYunEB7+3rzjE1ldBVFeUBX+j1xY3j6
         kfaDnso6JVgiSynu3NCrEZNKV+NFHWcLmgizVL5yDT35c2/j3Nar9Hc+b6Yu9spcuWXM
         26Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096430; x=1775701230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=Ssl8vIt17usKpSwlITQVcAVuJ7PPjaVIu23WHyZN7MlP9eg2tC1CeCLYOf6o+OJvD2
         krUBrN2YgNgAdXQ761NG8IzF6stsUamW7KVIELWqLDmaL1fZJS/M6el/9lSogzkxhc5i
         fz0hWcX7Nw+Hrt17iays2ks7c2yO4I5A/i5hff/GHbrNrw25XEkkMKric4R803AjltD8
         +OBwPJDHbAlBU6+7iMjABK0HivS3QZ7Cqwqm7WDFomvYR1Rwl06Q07nxi9y955u9Fuxc
         ri0SFicDNK7lmEj6gfPeQqSNO4JsNbwIn1lcvSmIvFhHXUAVpM5bFnle+uLZS0RkA3yO
         zdsg==
X-Forwarded-Encrypted: i=1; AJvYcCXtg6fW/b5aJQ6M1wgJyMv2AIhw5J7kDAPtCf/9JCHcNbcUJrwndExo54bAGCx0f2pBxWuf8cE8rhib@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmydw6tarDIeigMqOj9Y2rRVHTXMBn2GhNFZYmsDDZKe9sRaR2
	a2Aj9NzroR1LQJoq73OJI570+KpoRHMNq8bjoO9WH9QMD4nBSoB9/tPL81Io9wptPmE=
X-Gm-Gg: ATEYQzxx/goq4amIE5gi074Tv3via4OdMxusjkJYqZ5WB+YqqXomy+BNhMvHjiU0AkG
	UMstFjU04lLzpKSHaug8VvKYBO6r0TG0DdwxltjMPwTcoZ/4zgT1OvByGZMv3IS6OfvQ6um75zx
	QAm3K4jgijV6Nzsnrsc0thQz806pyl6YLvJkbfnc7YU+hNeKyl+HJUXEwe8samll6yHF7YOqcgl
	27rXEMr6ivuDJKzwgomW1fYsYYKYyppRNC4/3+1FPhxgbddg6Y+/dql8aXJMicW0o+lFfoG5Uyr
	L7ViA3sLxRI9XoYJcAontU43c+aZpKAJsu9bQb9zLjzVycpRBdhgQ8mD/upp9UIgOl83qwYhT0z
	5rMVXmrI5i01mP19JI4ugFRrlMe/4M3vdfwNpXJdF//k8i/8pFSkuLe3ozohewYsiRziHPb7n2n
	+45EFWRlRoO8jwLG+W24cNmL2E3Ad/bTSXHo1hC+wZAa72dVt9D8syNNVEYQcAaFYhbuKhKZr6i
	KFuBo+uvVkF3rQ7
X-Received: by 2002:a05:600c:310b:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-4888b769851mr25032405e9.14.1775096429980;
        Wed, 01 Apr 2026 19:20:29 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:28 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:16 +0100
Subject: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..fcb665ccc7ae 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

-- 
2.51.0

