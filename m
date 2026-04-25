Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB66358D27
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141899; cv=none; b=hjmBpoKPfL4DCojOBdpsMlHu+KXyV0dszZuMFjrp6HAb1wMEdM7o+FW5Pp1/fnx3Vpk35DDxnhvp1saqig5P1v96Zmhh79QCBDwL49C6Xe0b+Y9cI+uo1f1VGXHW8E/Q4lpD3GpL4XGdI+7NmV9HKuR00UBpldvsuL88FkD9MuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141899; c=relaxed/simple;
	bh=ZEu2LQcuP/U1oFZihO1ZCMi51Bv/ruis1G1kHDtRAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/dZNSTkCusWkAUxaS51WZkXHJCFLlgLdipSnwfybiKuTKgVjU+xd4xLhnA/bS2JnYMG9jLf5tc6dq5M6WRKrk6MLbcQT40A8ZhCU5eGgJ23FQzGRTqG4iWXENsHCJDb9MrA3Un3sdBP5dnEH3BPvDEKTYM3T+70Cb9PqMRqcJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzNRVxXB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzNRVxXB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso82320305e9.3
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141885; x=1777746685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=FzNRVxXBcDibgsC4YyfmsD+ZpTMQdHhrr+NzaruHYspMk6BtYZzogqRL5cee1XwN5/
         6F0uzub7AVBVIaw/wVNDMXFT8HklQsKT0dfEHO8eO7L4sdpuytYhFUCYHmpT/9z1DadP
         IUck3s4WGXqQqaAd9q/AwSCFS79cl8Scmj86mF5GhZT8Dg7oq/8/lqUzEYWlGb/ulaoL
         rNFZwizEPaeFC/0T+Rys+ekJoZjJBP5+HbM4cwDqiKHK6J7d1yL39P+eLsCA1e2HG6T9
         tuPe3el2ISKiVl7OJuCa/lpYeNnVMczzJq3PwLqozaA3Fuy9kd1Vw69OO5XpUu5i/BSJ
         wnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141885; x=1777746685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=aks3gAyA3VOdpt2/VySbIC2E681L9oBwt8CfzaFHmU91d7fRW5GNE5a6B76d2sUyH6
         3denBmUHAUp6ZiGm0hI+FFRjfEFTAK0N4vyW4uUk7hv2+rXAu/MVRFcDeAB3SjuNRMyB
         Fz0UXqatIrYo11NAeHV9i94ojZFQrwlfkGVtZDtkPXJAfopWco26T+xULVYBM+/ortfG
         Q8IQlaB56wWMtJgvhocRSfcIMkpXGp3r7m16TBp+Cg4wYMyJyLDsMb3tlDM/FJPf9vOW
         Zu51QGf+e3+8J8AJeeXk4MbOMzSETn4IBmgqjgUmVQzRA4Irh3nUrq20/0fclnCf2Dgw
         SG/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/WwRg4Uo8UEfS0TTl4S/SAvoTVAOR5Y5J0npqLs6hd4jE3vXk474ELW/uOIBN0oaZcSh/wIHKoFoNl@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtaLj8ol6lcu3+hvlABGL8Yq8MX8k3A7VMI0ezuEdecQ2kfBT
	6OJaow9IGlb7iBDImWPB88SlligG4sf3W8mh/Bv3YcIPNvuO24dP+tv9
X-Gm-Gg: AeBDieuexkmiJ/+azYWW5ujyqQqnbSz1RgVGDZN8Tb//9p5VAwTM6/NORz8cpEaSgPH
	ZOWQInyV6nEHCezk1J4YMYlytVdwoJLplFKLVIwyjhB8OqwffCXKKclQcg/n4JuOdPPek4qnqia
	Z6RaXbfCRWu6baiXl3ujfHyAkuXM3/wTl5k6PgeEqPD1uq7NLnT6nwUMl8VGWW+msna/0cB3+X7
	XC1/S4DDp0PmTaoUWXwiz33211t8hS0/eIB0+VMi5qyKXHD/y2UVJLoDRtGMAkGJMBPFvhoO1DD
	wk3X2sGq1KHGBSrw2ubenQvEX1y+0YnzDDKSogZcyiGo65v5KRGyoaIcC1LgVJUoPs6I0MA+w4E
	8dAC+PEmLRJAx0mJnowZUjnX6VwhSiOe/XTQo/iazY0orqfQACq3AvVczmLibKfW7FagPIDxt6j
	JvBSf1/Fr0NUwRXc6fVyVRrAew4bLOymSzJPk=
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr388573755e9.5.1777141885163;
        Sat, 25 Apr 2026 11:31:25 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:24 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:05 +0300
Subject: [PATCH RFC v2 04/11] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-4-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

