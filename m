Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B424E8E1E
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 19:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363838; cv=none; b=AkgSZT3utNsB2Jz2bDEx/Fha8NtbKVkAcWOtfN4UyIrw+5c6pTrbgvgTNbfh7VOWw/I0D35RbVAUl2n6P2K4shFRb0ZiG0HqoeXydIHlLeBwdrPf5jheNgZmBpSFwyjh9R4UUNI2/Mo3iRvsPAW76e+K34y7RU+aWxW6/x0cbs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363838; c=relaxed/simple;
	bh=eut8Cv4jfu2+xcxUpOFcKOIZy7il2Fd4FaptjLAhI0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muVMKh3e6aQQEiHxO/WJO/nuxX/HUmzxX7TXxV0Pq0R+fZsyTuC2gDfjRsowtg0T1EZ/p62Arp92afZ8sITSR2IPXUVGRgfp6CR8kUYSpBP88am2lqpQFGN9QHbIDzIwc3+ejuw/Lif97kSaugocwOUAEjHkGIxupbTFndlj/yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JTNXrVcG; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JTNXrVcG"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afd63c3e0so62500566b.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790363835; x=1790968635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIUbYqTz3s4MkcnIs81Mp9c9fGlqFAgb/HyFW+foZ1Y=;
        b=JTNXrVcGYtuPL/Jr+fr/lve9oCbNKcV3IWLq/7Rpnd0cWmGqjZZIkZKCE5GwZhS2nC
         yv1qtmlZA5qK6G+z7IJzZItxloPMzKXsplpSbmYDjZrXAdqt9hBoXToP0DxJ7T8LMt1A
         Hwo3PgtV5UIgTyy7oOUWwfGNTE+E8JpYJ2j8hTnk1qwlvedvje9Y9x0BbrzUPgKR/ene
         3MAdatgW3BjE8gjBsOwpQjKI6FaQ6Lm2IYDYyvl1+Rs/wXbQYUDQJc+3E2bSJf2Q+j8k
         d6wvrFzatjuMwgvYGX+82ox4m5BzmbuuFrM1cngyRjLutu2CcV9WpW/NFZnYT/kL1889
         +20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363835; x=1790968635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIUbYqTz3s4MkcnIs81Mp9c9fGlqFAgb/HyFW+foZ1Y=;
        b=19BreOMFnRklttt+nrpyJYotRBpKyuGbzUWFtDZXpK2YaghHwM7v3GgZY23roKhjhD
         8IG7RB3THjiYBYbkqZcw09nD+7/cpt5ELsc1GU2CHSmeLYgTbn5UEqxC1Oug9vXK049c
         39oBrK2ytSBI/qupS2r940LmSHc/hP4taAaNudz386BMahO4sXpJcLg1zLEdR7csz97c
         h16CbJxT01/ns15b+OqvzzlJXg6aMCe6ImKDLnl1Bn240/w0O2Z4uwFsSUcHsVCmBFHZ
         XsdmMOiyW8XiutLXoWSsehIOH2lu/oEbFz0GkAlXJNLEMz4LUKdNtsT+gLLSzxL5JjmY
         GtTA==
X-Forwarded-Encrypted: i=1; AKwUvBwNS5r6hTjIjVKn+nm5Th+tn5nSNPEd+mJ32cP2zkBfcQgrTD/RV8/IIELbgO8GapU4z+CZcV5L7Li8@vger.kernel.org
X-Gm-Message-State: AFuF++mImtOPv09wyHUfoLVJLTS+Sirz5B6lmEbpVnnTdt0a2pzLPhs3
	B755DZPAIEGGXpwxNSFjBv262N8KcIIWCQMqwM1Fk9F2Rov0DsUO04MXXpD2clCSUYOl5y1fsRT
	o3K9K
X-Gm-Gg: AYBFou3CsQEgKTYoTHbIBueEFYFA8GHIvP/aU3+mhQQYj2ycxpeQEwbnlYWMCU0pWff
	l2XXq/a4eFps+RxjzwbusPMWO4smEcscyPXUHMGIyE6+Sy7lSr0e/nolCGw05XNu1+0Vs0XCTb0
	sm/3G9vTKEHc4dFwGByLqYdr4zpUF2LELsi2bYNXh0Kn9+yCxkruLrmEXuUGRNtBUCZLAk1SG4x
	OKhKNwSX3pnqtkSGYXAoIdQ0aKLyBSpIFJX2n7j5rtafWQb6sz/q7cMcvvzFkTBTGLiypMASAlP
	Mxbw+kmbFqRoHhzjx4L0klb0mSaftFIp9zk+dqQq/a8jHkXzvUfnsLfCmmkXvie6CTerjRqA5DN
	JCkr3SAWtbelkT5TznPEHadXDiGIKOJYFuftBJ4ezoW/C367F1U8yAhmpCTjzTFhikxFCBncwSw
	1uV6+6ZNJtpklmiOOhcGiD0mLl5Ge1uY86VkG1zzfsoPoXUZ8/cIYBkeQOIqa8Yy+jd4ufcgv87
	5CZ4vEbPbafYuctYaqBcuWettXDD22ZOjjGlk2grmeLhZOZ76AiXroQODCccne+cULn8qE3dk4s
	HkWyhVU08TfAVkVHrqW/qiMOddsv4F4S
X-Received: by 2002:a17:907:c23:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c2ac23dcbfemr638910066b.10.1790363834719;
        Fri, 25 Sep 2026 12:17:14 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-212.globalnet.hr. [213.149.37.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae782a309sm160881566b.62.2026.09.25.12.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:17:14 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] arm64: dts: qcom: ipq9574: add reset to SDHC
Date: Fri, 25 Sep 2026 21:16:34 +0200
Message-ID: <20260925191706.1579990-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset to SDHCI controller so it can be reset to avoid timeout issues
after software reset due to bootloader set configuration.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a11..ecafd4cda6e7a 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -471,6 +471,7 @@ sdhc_1: mmc@7804000 {
 				 <&xo_board_clk>,
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
+			resets = <&gcc GCC_SDCC_BCR>;
 			non-removable;
 			supports-cqe;
 			pinctrl-0 = <&sdc_default_state>;
-- 
2.55.0

