Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A94B3E9299
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312741; cv=none; b=pPTqUGxF63Fx8reRXKnVYmLHZIskfQ2LChP2IN71FVmY1gZiOlE2PZVZqLUh8xodzUx7uQpvirrNJ4+xvpz7BziWS7yUDUFkkv8tNhpwOgGGOt4r2Imng29pJGiyTmqGYiZu/uk4CRugZ7INmXf2RSktHnlUWykeOPTZqxprm3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312741; c=relaxed/simple;
	bh=ZEu2LQcuP/U1oFZihO1ZCMi51Bv/ruis1G1kHDtRAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2y724XtBybT77zYuuSSisd7uJhvYb7VzzX0UJmsl2Kq17qJJgmsz5RwAIrwvoQrh86ev2t+6M3GMvPicaJLNT3NDTZB73e1NoJve6cLd/T9CQbOMf/G8WIJij5zREKP8DTDXiLCSP+9KBqqOutTXDhU8sgusgdK4ZodcLk73c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFVDmrB+; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFVDmrB+"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79cd8f8e261so67567247b3.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312739; x=1777917539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=CFVDmrB+L3PbQB1GOEx1wXL98J+2Pn7fvW6r88+13oVUncAg7LzK4CWDl547PBCGeH
         c+Q2Cs1cle3DIvJ85C1psCmW02xW+9b/cfRvk+saZj3xYBSgjSju4JaTJZ65Dwi+DheJ
         058tf3tF7Phm0ayQhDyixCGJ/e8soVsO1KSTc/KZ5+zEz6X0f18QRlNH9FKTLMwCwXR7
         oPz7yg+g0TlhqDFv97xX0eZBU1w5HRoc8U2R7bAq4TWuihHmtAYZgKZjMGP5T+EcqKRF
         01U+Qd/UcA68oTSaLZjp92nfG1QnJ/Vbcl5esosXm/r9pvHIc512Cvm80rJU9pVjivKo
         Oaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312739; x=1777917539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=PWEY9oEt4je9HevR/yzGo7teftj0vzvv213T9fPIsWBnn9/+JH2stbyymU2C9NUGCy
         W0HD1pqVXBI2xmZ+IpjIj8jXwQyY46NAPFsn6oqi6/fi8eqVVEBWUXSmBTW4U/UkmNB1
         6NDW8fi4J39S/6I1BO6YmBk1TH4EM0de403a1L8QZy3+WmQZ4ZN8rX8+HtJoqZI4r6c1
         zkWYUXB1xqoT2zHxjqJOgGJtoiIdxnp/e1t9eKDKtBEyCOmS+45gn5I++VyyCbokdGcy
         juvPRU/zgq90ntaHg50p5TIvZkFAs8Fm1Nz+os3WFVQsGm1FbHzbtmrTllgw2k7QZfMl
         rZRA==
X-Forwarded-Encrypted: i=1; AFNElJ+43IPzhea/RiqMyhYSM/jqFKmBySgayhoOY+mXqnR3t6ZfVBGBJLkQiYojXOrsJ5zFaaVIb6qc1fQR@vger.kernel.org
X-Gm-Message-State: AOJu0YzykdKaokckkum/ASPEWydpl+/0jrYBCgIHc30XxVjRhU5uchFE
	bxUOdteVLAMXqNQ8vnyzbEQYr71c3drZHoza9W4oE8FngfLcqpNojAUz
X-Gm-Gg: AeBDieslsD93UjrZ3gU6OC5FkOiD4rLrOrLFglGdDIX24IIX8dqqmWk6SQEkQ6+vQ5T
	mfnSZCUbilVUHdpLnj5ApMYMrqBdNsHSgQbJWh8Ji3okZa5fRUCrXrXkbPtzgSfvI9DqXdW5LJK
	E5E2nEdEPUB5O0CJHGXwvD2/ibF0FcXtIOGGL8Uyk8aykymV0OZiH/6R++QEJnGyJNEvcAOoZ8H
	dIJwkQyxsZMSB1BxnCHWGahrOqsEJ+YvplIoEFJ6PEHX+QK4oA8nivupHHUYPK+W3YzXTr0AOQy
	8Vwhyamr3z9tTRzgu8u7ns9P3Y/nxvPed89co+us2N3uyULmNffro2KsEmomlhAEZTpJFae6Jxj
	TEe8JZ3iADneVzr2ZsMRjzyi1rXICRo1p3NzVty7xhVL/kihj3DfLoTrcxjLK2moPBmC5OfRNk2
	1U1llAsiCbsV5mtYONdAiHfUQ4Xt+fPOY3gDGo
X-Received: by 2002:a05:690c:10d:b0:79f:d961:47bf with SMTP id 00721157ae682-7bced8dc2a2mr3592067b3.8.1777312738423;
        Mon, 27 Apr 2026 10:58:58 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:57 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:26 +0300
Subject: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
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
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..6b295d3f8256 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,40 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			power-domains = <&gcc VENUS_GDSC>;
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

