Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2FA407CFF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203632; cv=none; b=k8CxdhDYnZSCD4HOa8jKTQB0cs5w25nOSQtJysHTyTYHGoLanXy0LBtwYApkpvCzkVgPV2euzM03xAVFYpNfWOHyxnQbpnrkrc715xLadSNeGDNAKmXNcKJKab/raGhgyBihSLUxXqVFpHLCj7eAfA5xyWQSdfXOxwd0vFjJ/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203632; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tou0K5rttkXGM90XqnBo6QaWtEuL2tBoHBksMQuKzdw+2Thb39lzSRAYWd1ZzO1atrn35MjOWsdEeRQbRPVXjwDOyEAxzk8NM/ARuWA363H+b4kKJ+tB8UtAPwe4C1S5ZqvZlnXQfwLa2M4iYexGAuuGTQyHJ9um3fp20hTck1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfYX0kYW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfYX0kYW"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so367051766b.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203627; x=1779808427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=mfYX0kYWGAGHja1hXI5OLOgYj1OQk++tMmd0JiTSMXFa3ipin+LIVMe6e0gHdMMm3h
         fnP1qEat6X9Qo7I6dkypZ7M88rPZW12utguonExVUYK5MBfOj/aFSj+cO4gu9CD26JMy
         1TAmOEmKKROY0pd1uPweLNi1OgL2WixWPWH5EEj2fExxgWrdFv4uofyGRvUlJthnGldP
         z+ruEGdbw+TE6n0kV2kXZ1H35loTcxfhUSO70w0bfbI0UtktQxy/BCbgIiYXiNfU+JR/
         S6Zq9nPfznw9mMQNoaPCMyBC8glyaZ7ZPsvkvUs7gcSNT708imkR0X6yFTvQhaw9mZK7
         3Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203627; x=1779808427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=o8Cesd28X2VTJFeskmHzh1nrUeEheE8sN53YwMqpOsuHZgrWqC/A+GaszRN/9z5ED3
         THpiPRyY32dQZvENpZzbmnUXSP8sNez/JrW0QNCqYRS6EMvmuL+qfaBMCWalzflC7gHk
         gYl4UKotmrSCbQPxSqrTAFr56AwPAWZNoHFTIvlljQGP+Nn9PdxodObWuLkPGsNN6eKi
         MYfNX7oMC0zkElnY7yaMsWoKSgokny29iJdjljPDVrimN+/0DixcglvbE0z3DmfpCeG3
         nHYXojiq1GgD9767C8ofufUOTDfz8hX4nNqdAtNVLFocjDIwRgGmzFxxcfj5FTiXg78r
         Yuzg==
X-Forwarded-Encrypted: i=1; AFNElJ/ct4L4BvqMq3mZxJMKolYHxXycQf7SeARAd0NIl9veiRWQ0w3SQBuRgheJi17MyMDDoybaAy8HR+SQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxopLk2uJSjCnBdXrd1RVeGpWkv4kU42rCYyNDGEG3uirqEt4Ue
	ajO1nTpBscyylhpgTedLLI+h1F81icSC46fq2xNbTkzjd8tztm3EkEcs
X-Gm-Gg: Acq92OGioMSmQmkjsi+X7jCgat8q4Vk01VoaOfx/n2KWjjD+EA+oJAFNKArLxECdOlX
	/ZuDk6kbjKnZ99at6EFz3ohHq9jEY2J4sic7UNG4yAh1FjAWjdl2RV1clvJTQAWGFRmjp4zqwsc
	77Kumku+ypEO9QTNVpZsMmlMwhbdA3xYtF78zdp05naQPS8hSfOvn2/9lMGe96SsvRDPsyxviwt
	7CzbwR1gtt5OwkoA3xnVwkyafxyPITyu5Y0us/3QXUDtVXyWdlxnF8OgZepBOMD9PjwE9JcOQze
	ZdJmI6mV4z85FSrHfNfTl/u9m5yyAIB0RoyY/Vkd71IB7q5e6b6ImIPfSdi9Fze8w1CW5zD8nb7
	+IEsGVv2w+4lCLvsehKZxIs6bUfFgKNOMgoh1oQ4Ro7f9GNmZ+AcRRAXI2FfcO6gNcyWR5qAWi9
	rY0+ua6kirWF74/ervBZ5AUJXonw==
X-Received: by 2002:a17:907:8b8e:b0:bd5:7c2:7622 with SMTP id a640c23a62f3a-bd517aa9716mr1183183366b.49.1779203626813;
        Tue, 19 May 2026 08:13:46 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:44 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:52 +0300
Subject: [PATCH v8 7/9] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-7-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
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
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
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

