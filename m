Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C53AEF3F
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017569; cv=none; b=qyNwam5FKNj0tZustu8HoPqeBf/aJa5g6FCkBI0ZLnScisIFc6KeqwKOn6lMDS6CA//uKSHQ/t3gER96mvlV32bGzIYa2I4NNsuNMGicgt5pAgB0PoFx+qZTZ4arhd5zRuaLshhLA/0XBpPnU/LUW1caKIXvPZgKN6OJiouupyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017569; c=relaxed/simple;
	bh=4m526cz1cKf0Pbx5f0LjtGmUDeZ9tO/nddK2KJIgQXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTLtPWq8tL2X5QpcN9fxqxqG+Hsyec0f2e5er9mVwZAu3lJzm7xNdZqfIbedg2l1+JLyI+OnqF3ajzhImiWNhipBUrgGWx0dob/ucEk4XBnaIsm9v0Do3TgJj98vnBieW7UnBpXypwWH7hFPV8X9/F5zC5mB3am+XtcncvWmYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHG7zdeg; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHG7zdeg"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a46260385so70283027b3.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017567; x=1778622367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7JxHCZxuN/7G1+ttfM7vLC8lkgSjpR9lBRe8UpK0uU=;
        b=RHG7zdeg1EOb64mBIfegf6W2x5R6UvPoNxiw6JHjqLTzl38JwQ4c8QSJPHOz3Wp1Dh
         CAr4m/szADmnTdXPq55gGDnLrj5DznkLO8ijtyxRpoGBc1p/+qgicfn9uUYFFmxMvo/S
         pmt2EGok6J6acWpzgKmyg6Lxvk+K/eyWY6OWHCMtVblvzUxf0tY2NjP0BmaFGryZr/Jg
         eXWRMZmkfeKwFGxSpo8JIEfxM61qftRY5xRpqUnyYiOe918bRnabVOagSJ0BGEHhCIY6
         JIn8NnYQ74UnVmn8yJpyhkxwpaxQPuptLFZSwqiHnIJKH7OppQlUTOcr5RN3qDVhS5bZ
         F7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017567; x=1778622367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7JxHCZxuN/7G1+ttfM7vLC8lkgSjpR9lBRe8UpK0uU=;
        b=jmCNM5EFGcMu/egotibBv4u95T2bBQsjjSmmmZDfdI6zgobQY6fH9d3uNOxPYwr9E8
         jlVBeoSAfKb0yoZFpG7aKFM4bBvG0O4n8Z+zUsTF4/mQvkTKr6Zq5pV1ijiYKwqfeiI6
         PopbBVYQNLz6WTvBI3FTJvjIGodXRRbEgaVpAZVDxORkl35A59JSvPxhMS9uMC0UOply
         538K1bS+gVqvWuzdUuvtX8KBGeS8fOcK9do1BAxQlOqxyeDmN3+MgbyA3QnoGP8iCSF2
         yyckFS3bbOvjt+ljfIjCOoaeTw7LGpFruPa2UTN7/Sg7x51o7WG3RenLNDTbywqpLlPu
         iLNw==
X-Forwarded-Encrypted: i=1; AFNElJ+Xsc9FtwUZzESK153gl1gvZbeyPwK06Q26Q9BR1rdGxXdOuBrK9qR3qrgiODemG5uGu0k7JvoO+SeJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+YuVyoa4vGOlvdyVxAlZfuHXezg2374nLHbDx2FT1W52xzUA
	c/fLJ3XWYZMHYD8OAMi+UmqXgQcw/QKNspLOr4KDrCVWFQmidsRMA86F
X-Gm-Gg: AeBDiev3M9lXRALx0wUcJYr3spwquFINqJMy5oILrsey7JCopXpj8xe4maDYQl8Vfrr
	ug4g+o70X6kQB3EPAAZ2gXmpCgxyoTTV+YP2tsEbB9BrpfzfejBpCuYZqbEImylduRVo2IgCSCU
	6CUwk6yHjmFUbb9sMeUGWcrjv9hEDz4Tqf5lVyjiyV6S0pPcekS32cmRBgJTHziNekUFviPO++8
	w2nMcyLSzApv8SUvMQj3is1Ql8y3Q7aoyQVSndeS7JU2iCWtnQQlYBZwI2gTIR8JNu5X/DAmK3y
	5BtgpyEwWlEmcZ+bqfimd5hiHaQSpQAlu+Azv0dMSugVsGGJFcBZTzfzz/AkqqO32MirCHYN6yo
	HctRq41YRKgkFjZbcxyF+q2qFcfV0STidAZ9Y5W3oaAz/OsqwsNZ5d+uVAfYMlvMtb7BTZW5P88
	EZyL5xNnwJ+NeXKPOMhZDmhaBv5FW7QX1iflcG
X-Received: by 2002:a05:690c:397:b0:7bd:a50c:4554 with SMTP id 00721157ae682-7bdf5de7a8emr12316187b3.17.1778017566991;
        Tue, 05 May 2026 14:46:06 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:06 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:41 +0300
Subject: [PATCH v4 4/9] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-4-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..cc6c4353497e 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,25 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core", "iface", "bus", "core0", "core1";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "core0", "core1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

