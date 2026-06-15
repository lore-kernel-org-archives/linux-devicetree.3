Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEB40FD99
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542144; cv=none; b=ho8f10k8FBFdPGksUaiW5rPvr6yMit5acm2UPD8rtd4OQDyamRZEeg0b5UZbvoAScF4rpaDZRe9BzdIrQFExI5crYmmjxhWkXqjmWsQ+OyKGcjvMgMiXLFlCl/3Ebk+qmNPKatGBgR+zz98yOl1Ut5SoK6H/S6UrYjv0hQCM2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542144; c=relaxed/simple;
	bh=4HjNMydN5tW67EpwgcKq0bJylrgzUaRgs8yaNRqheFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQQf0sgh9FdBKuJewjg3jI2WBFljj8T1Ro4Jo8H45kkudiuelIn35phreJdM6XB6aQ2w00jKkUgkjX//pkobBrr5ju23UqZ/42Lgig+lOreJj8Hv/OOV51otcj0gclbwguaxoc4WkYFsRK9yBtLi5Bx1+zHaHUh1QByQRdLZTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H77jf2mD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H77jf2mD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490a76757e5so25887155e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542141; x=1782146941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUXv3GxUdJrnvQC/PhSLkI1Hz8IfckJ8inkqhUnweag=;
        b=H77jf2mDtgI2h0xxEazON8CFF+z+v4AamO/Ypo8HSS3qUAbQtOG8p7EZsxOhjnRDm8
         oOXceYVt6t5G7653ZoVTwXg7jnXWi2ZRByyf1ijpvmtRVG9olCGO1TlL8F7aKJnuoMa5
         85nAhGQb2p7Ho9Hy+Lug79k2SeRVIhcGWzCHi48r814ttRpxhlIvxFdgvZNP9DVIF3r0
         zsAVh7ycK6LTrAWgIQq9mwYXtQvHnsi/BnsVPCM/tS/wq7iu0GDdPKY30p7PHQ+cKIwz
         l6ghWmtoXvDz/DC8brqq0UScwxG38Ar4O9ZLo/38iZqptXumupJMwpA9NJsSnC7Sg7kR
         XwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542141; x=1782146941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OUXv3GxUdJrnvQC/PhSLkI1Hz8IfckJ8inkqhUnweag=;
        b=kMbkkfKvd6ToQWKN/ur4mjZ2q6rXMHA1gcuzbVlpkJbRA/qNkKGgJwXMAWlXM2Ad+j
         T7KA0vW83BaUvNR43bvZcIg9lC11IUmnUIq7ZoNL05zZn+6Axzb6QN1+wO2O/Hssq5Bv
         +n0a1joVD7u3UQ4RY+n91FYXF700O3xafzWrhGzuSyi47tjibpaXpkf0u/pdSDJlTlhy
         gCPwkGs+xqi87ly7vU0xd4UovlXZmSQTSt5q2i6qAVrVBvxsvIZ6+7s9xy8G1GlFoMrn
         KIkelUPWBixUhzTS4dsyaI1067A8yPuEGz4/8H5zW0Y9ibcuKa4Dwn/RgyEoxXNYTUNT
         5BNg==
X-Forwarded-Encrypted: i=1; AFNElJ9jZsvqCVP5mZ5qq9ltp9Mlwnr3k2JOY6vTfeIphcOF2wpkg+nzygoylFcqm4GjxYozY27ywzTssSZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxroh1zlq20ex7ZLfPPQj0vHDMsqIFq49xxiNwU7JmVh5JMuB5h
	u0GNKE2AWWtat0kKGVmUbdrIeMbmbmz0R4QakHmYZHtgobvby5jfVdL/3fyqDGuiSpI=
X-Gm-Gg: Acq92OGCKJV9LYBYo+4G57ODTyrtHg+iXv+anlIQ161F24o77jDqEtbDZ+9XUcwUFOP
	NX7r6qp+J5E7MqpEzJw4L4yiT7LRDZ5s4VJsvPGhDRxjIDWvodRiAw6kTKfL8DYgvY2aYbgBaLU
	xnEYW6/IQvuktjaBnpZn08H132NmsjEcEeIhCz3LNgyQy46tBrTNVHQyx60pG4kdNj+N1YG9Ev3
	wCSJR/cLiJYqvee49oOcwFfFkxpI6HbHvKcmo8NpOsOBYix0uqbsr7nTOvAuv/XE/AvqbQbC9uR
	usdWCF7S0+MXSgkv1rPAsegUYK4vd/dZPbgGOglQg4mbWmb6lRA7C/ULi749wyC03n0lw8I7Bz3
	L7FTwDk7rPPpFtQ4OPCwOWrKz8h42bM7EEDRk+NBX7VN9715kW7gzGS+CCRgWTn5M9I9oXTCKEY
	kykJq0Ie2sIhMIOvyUGQG2dwR6fzRfs57DGjv8M0mcfEme
X-Received: by 2002:a05:600c:348b:b0:490:e5c1:b89e with SMTP id 5b1f17b1804b1-49220061e38mr147294985e9.10.1781542141226;
        Mon, 15 Jun 2026 09:49:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa58f80sm5670735e9.11.2026.06.15.09.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:49:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:48:56 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8650: update the cpus
 capacity-dmips-mhz
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8650-upstream-cpu-props-v3-1-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4HjNMydN5tW67EpwgcKq0bJylrgzUaRgs8yaNRqheFs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMCz5xS9GJqTCNHkog1BlkPNcz1FAPC6mkpwqRzjO
 SS2fs+KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAs+QAKCRB33NvayMhJ0Y9GEA
 DChGYTSaDf5U8w0dI2k7yC8hoHsAkMGdLqQlhnx/40V6ikap6mA5qj9l3SegHMt3Q1XryIF9Sbc7c0
 ziFWACnoDYJj4j8FlLrLaj/d/WeZsDoQWI099es7xdBoOcPcbjDTD7h9U1i9+zBNw8+fYhG1ySDFNq
 jTyNT4wD2VS/75ShHWyLGWFvS1uH7qHUdeiAEQSnA6ksjcjSiVajOkyhcecnEggQEEba9CLm0pFpYl
 hxY3nCtvn8LR+MyQ7yp+CNGv3Z6AkdWwYHjieu2DAEtKxqJs7QjFcjwTuwPfSC/8bsWpPTxP6rp+d3
 eq6o1gHvc1u62OQxDPnlcpmsvAVEVsUvxzaAzt/RTTXlStYfBsvbWpFXpFsYOZJb7vsxBvkwxNMvt0
 kjrI7zSQyVHQ1e3vJ0DqowUbPfJJOQFSzgNuUU9pNDau14/Y3r3XwfFGhzMl8y3/LPdfNFHkIfSBCi
 niukuQp/9vJnp6aDJS3vSh80ictjhU0suyjjo66lmVG2juj4SbdUJwcBqlBlBHQw6uGN4of7AV5CgH
 PtQcnotmZNFYn7Mcqc3wgerhuR7yhFKqTkm4Y1ZgcB+THxxvGe468gQcTeq+oPnRPM2G4T9uCwXYYh
 rK1rWRGKnUCQgWtN+jbbJGfgDRsqSTLhzP+YGgfCJo3jtP9taaq6qjJL5XVw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

After some more advanced benchmarks with Integer, Floaring Point,
Encryption, Compression, NEON, ... on the A520, A720 and X4 cpus,
the median gain with the same frequency range is:
- 281% of A720 over A520
- 126% of X4 over A720

When adjusted with the frequency delta, we get better values
describing the difference in capacity, showing the weakness of
the A520 designed for very small tasks while the A720 and X4
are much more powerful.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..e8e43ddc3032 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -153,7 +153,7 @@ cpu2: cpu@200 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_200>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -189,7 +189,7 @@ cpu3: cpu@300 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_300>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -225,7 +225,7 @@ cpu4: cpu@400 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_400>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -261,7 +261,7 @@ cpu5: cpu@500 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_500>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
@@ -297,7 +297,7 @@ cpu6: cpu@600 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_600>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
@@ -333,7 +333,7 @@ cpu7: cpu@700 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_700>;
-			capacity-dmips-mhz = <1894>;
+			capacity-dmips-mhz = <3591>;
 			dynamic-power-coefficient = <588>;
 
 			qcom,freq-domain = <&cpufreq_hw 2>;

-- 
2.34.1

