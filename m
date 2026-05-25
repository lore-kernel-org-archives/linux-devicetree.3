Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559C3B47CF
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720471; cv=none; b=luShS7asg5C0v4GUFPOELFCI3sO5nCyXiiBg1GkPXhT4duxvDLe5+M9yo4DEpAp6hUgJqQ63TCnUVqItQpqXt9IM4j3veBCAbdVVjZgLQjD8E1MTxPWtB3HYvqQlGQSMWL8MYVBiNp3hRTjtQZo6udfFoHSEzczYPhBJ6N4H4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720471; c=relaxed/simple;
	bh=rQev9snjUDQDOjiwl73HCrNzxpOg3GjolVgiv9srQUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dydNkMB/ilWm8SabK87dTts5E/Fd55mOiBOvlPnUkJiFlocJifhhgRcJQFZH7gKCpXF23wxCnsWQcwAcpscWEL5sW+5MhyUMw28z3VlavJMy4xtFoL8kM6QBLqxCDG/2ShmmR6ZKGa1nVE8nKz/Y1frbdxupyBBe/Y2R8Ow6VCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlFEFbtE; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlFEFbtE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3664df32e91so11165720a91.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720470; x=1780325270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=UlFEFbtE4LX8kXg4191YimQ3eaMGAtBr7w0P51NQTkYRRd/JGvwIF6zH4KVfzCEFsf
         ck860WhFm07gR+HHLGAW3m5LbhgNvOFwjqfBX/eGYW9o2BMDi4T2mcqF2yKfgOfLkf7B
         c9YvT39L8wBDCebbfMvJpaY5vpmu6S8VP5b8gTEWqfqA2JkB2U3KfOWIwPg+N71ShVkd
         2my3IJnbNudbfyMSjOEDBG7pzWqQNpmaOXPmIWBPq5t2tzmiCEZ4WEr8RQs9OzMzrk2h
         Y5xGzLepZ6VsIY8bogN1TU6nrewVqakKLoo0SO/EAwo1/L3Wllh5KLmUW/SHo8Yif3YL
         J3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720470; x=1780325270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=eSkXfe42ZnAOixI/IHfqUohLUJz6PIoK2L+8qnlBOLx6OV4f4T/kr9BuLptYWA2pyg
         VKmdsDGl1ezSUNu4D27cNLbdgNf6XUyX3lHN5rdXFTW2yENeVyamdYOrxGyiKjB/Vmd2
         dWyMW3C9ra68Gw5xJRCVMEtVzk8pkyekblq/CyXTPx5UMdugA0LXmw5kn4XVH7aTVUpH
         AD2IvJU+6b6OqgVVGXFyEBF31ZM+1USQ4rNV90YYtVndbDAtPrOsujl7ldpKAnJkHdsj
         eihf+jS4Yi1Fb17mraCCMqi3cW8H0d49o5WftNgQbu5B2BtazWOU7myLfjQEKBA8NJuI
         bSpg==
X-Forwarded-Encrypted: i=1; AFNElJ93fHCRz8ULtF4fnFiKDRka+bCNztfmFPgCQd9TYtVzeOM4CdtLT20BTBkVObT6csp20E1dLkfpr8mQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgkLQTG/MiohC0xIftCvXat3g2Pq9T5meyMOUDlvZ6mLU/2Atv
	BoVy9vGgnLnFVYqnE7HHZ3Xtcl+1bYGcg41fnDfSF+bDMMw7iF/NccP3
X-Gm-Gg: Acq92OHZ29juNph3UjjrSq56BIdTY13bhrYUje5Hghwl/KmTZ4FfxxQUnweOEgk8NrL
	S8bjPgfv2D3LUaf4r8xqhvO0D2vASB3wYsz6roqhSGrGIXXbyxO+/rLg/aj/pgOT/OJ/gUs/nNj
	F8XtBBusatuIvV3SRjzjS7ouNsmZR373zT3xk+F3WWtUWNjGLTxR83vyM1MOIvWqpXtrcVTBqGp
	Txm1SDntjPH52puxKFaRZ+60lRkAclhldMOPLJPtSU93kA3Trptfrqx103Vlih9QIUrEsjrUJ6N
	QHX4bXz8ZcqQ4beF7kzep1E/yWdmh+/kOUbDQgcQJIau/txttMahKqbv1EF+DviJ+5N+SeQtMbM
	tAMcS25G3q5os1xvGD4vMt0aE6dAOUE5HHxbNwNeuAUYc4oYX7Md0K2O4IBtoyx1qJteW5MV9/K
	B3FScozLqFQfSbieciySDy/jqcFyeZI4SD5lH5cSY=
X-Received: by 2002:a17:90b:5284:b0:35f:b7f5:9b3 with SMTP id 98e67ed59e1d1-36a67420e95mr13511527a91.3.1779720469769;
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Romain Perier <romain.perier@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:10 +0800
Message-ID: <20260525144629.498630-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf

Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 2de8b6f9531b..6d51d6efcbac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -197,7 +197,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
-- 
2.54.0

