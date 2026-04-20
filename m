Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB973BFE5C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776713218; cv=none; b=Mnc/IktaNkfo/0zsNqWU+L11IPSTkddXi49lf1DWbyXDTArxCSBwcnXu3y7rrFWLonFhsTy6piXZsqB3OtrcD5Qs67ipTlwJPOXvo97cA6YUbxvdqQJRgwZQPvU+QeLpRlvh0lTlDvAGwrzD4Dg67cyu5scnQsI/o6tIlwKkMr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776713218; c=relaxed/simple;
	bh=q/KD6vbsCHIP2YFsYt8cPRg7KoZe+g3bSUiSIqD/e14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbMqhFKYlth9jBtN1F8h08gW8OU51tXsz8J3cq99xkqKaofL39bPZoMkpmc7k26FuM7w8lKy8rUxrL9HnXlPrgFFCnHnfAM9OWZPHgd1D/RzNggBx0B5b+efZ2sN05t+IKDhPBTNeVCrSzlHTp4BR1Q19da0gEWqoYfnJjTIsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKoOhjRE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKoOhjRE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso26504325e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776713216; x=1777318016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4tLDDmxREE4wgs5r5ScyPH/634xf/UlA99QJ6WpHiM=;
        b=lKoOhjRExnbuuNKUKyS+OpCeS29yHwTrzARgVjAt9q1M1OskQWwWzZlnWAsWIzbAqd
         b+aqap7Nk+n4TcxkJ7qeomo9CudmzdXavbRdd6+SuwgB+I7wS1R1n+cCfDG+rUhUllMs
         KPf/4I1VWGH805WsbQ6irrABrNLeq9lYgBAGmtuaquymOnCKNQGGiIUbqVWEsuKvZpXB
         UZceg1a0EayTDAa6lbq6lmld3yptR/4OZpqVFc96NPhXezNK7bQE+/rvV+J7KeXpiydz
         Cp/fH+55D4rJjqzW7ahsPjLUc598eHNvGEBM2c9NmNEOAnN0mr4zmmvAhl0ow3JnR+zD
         tlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776713216; x=1777318016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4tLDDmxREE4wgs5r5ScyPH/634xf/UlA99QJ6WpHiM=;
        b=ipTF015CqWZYYK+O8iY8h3rCZ1bcjn7mfMEiOvcVTd/8PB1XjKi9OLTWrsgbzDojo4
         pnEkFOv58EhuklLYPkBm7LjdvKL1t3vk76C+Cnu97DrBEWLcnoUB3ThqY30KFsiLHIcJ
         b/V23eR2nYuFjbuHXIBEVoKO8d1ClqZS7YdUN3ZRCE54mbjQYyTyI5lBETV9O1SynlMx
         /GPKTpL1xtHhyp7z4S+Hj7Zzx30AX0dOh6B6q3pH4iQgajmxeMFAcQVqeYZyBAeRdoA0
         Qv3gA397GaM2sh37n2FuUeHmDGydxwQ6ajbzS9LXWq3QGQZf6dngMkloYI4Alk6GR3n4
         SoaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yehW0PKHG8NPEw3RFmgRp5yN0ntYXBNK7xYpSq8ukb2Emi2/z7nmgcIGy6hi8eGzx87YfP7hwyHbt@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ9fJK8epS+mBQMu3/qMNU5DWJGrL5doS4bO/JNOU4LnDHt5Gb
	0X8ZTUQER/Y0RcOJcQcKfdrki7OGFXO1hL2y1PfGzpnZplDfG7dvntugGt/kKxHxVC0=
X-Gm-Gg: AeBDievDnvF+uvuYXjHEUpIpCxh4zD5TrrkbXN/vWwrrl+MxqPqlK8tspIXeJTbi8+r
	heBOaLfSuBl7rvYcl+nJQianyf+/ri1l9Gho9I9xYuvUxukYEsZfBKTvSpYl5H/Re/ACEdC3qX3
	Bpv1jn4GewfGV0+QzxQYCWjwL5d51HkfD3HWlav1ImcikVoGxIya29Kt8lyo+psIZI3Dkg2btbX
	k+2iwFBuQikhkcv5RyWo3oFgsqkYievEXKWW+CaLQ2xjcIYUfLFvuT/Aoqyc4e/63WZi+CpJ69v
	YUm2ewPZHsTJIHzFzdrNjUNEuzgE0Bcif6BM47sKGzEdb635922k7dWGU+xXQ+5mpEUzZinEXkg
	5vGgBN/wBgNCD9KC+Yl3625lrCQYjaF1a7wtSD7qvkfr6bf9a1FB4B0wRtbigU4XX9PTzF9oMUQ
	ak6Y8wUieUkYYuVmv75Ql5pDfEBAasUKdua4UHGkuk05wEdJ69/2RAZWk=
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr73622275e9.29.1776713215554;
        Mon, 20 Apr 2026 12:26:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm133524515e9.5.2026.04.20.12.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:26:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 20 Apr 2026 21:26:51 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8650: update the cpus
 capacity-dmips-mhz
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-sm8650-upstream-cpu-props-v2-1-689e07d8ab8c@linaro.org>
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
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
 bh=q/KD6vbsCHIP2YFsYt8cPRg7KoZe+g3bSUiSIqD/e14=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp5n38c3+m2fgLqbAWn46zTOOkWJO7AdvauiaRBhkm
 cmjXu4iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeZ9/AAKCRB33NvayMhJ0T75EA
 CGEcy7ZMkI8DnMdJaKTxwbnJgnAgroene+BtHHaSmodVFVb3vQQNWdmMg/foyu/sV3sOKjJjtfjkGh
 q5bDKxvkanMcYgu4f1zdILEOiE1vFfC8M5Tx3uSkPqOBmhPeBry2rYC1/T/jz3HOIu64UZujrwWAnw
 i5nsbbnW7/1WfG/+ApW2RsXK+ANyVKWnWutvUJ1T0uHtd9mI4YHq7Y+UAtJ1oVaICjH5SPt6WujA7T
 p5bdfAP3Va3MhodPRbYeXU/rElbNo+gtyG4ybC31+LNgEYGzdsobSuIQSOomS29FA4Rj3A19nqEV/G
 T+2kab4zXuPettJ2lO2QSvY1XwgxtY01/s/7wAAvSiz7K7bV772X30ZXbpWkW0YsJI+aWnS/6c3r0B
 o+3bb9zHHCX1gND88j9QK68Nb0fGBHe91P8A2QVHUjQAgXt9uczTKCgAUKlrDYfP9tJxjgQW23ZHLW
 bJ6ARcYWr7Rk0lsD1TLqLwrFivjK+1Vjc7WvitxZiT/lMSBn1Hjxwj347Gi+X8qXa+crwB/MvtcIyJ
 lph75hu4TlPV25B/ZLfsjPUqzbUOpFvmqQqSbz72O76euyDe5XB66uG7m2KKSq4xOK5vRILxDdigG5
 ggwmJFE8gcTlKcrkB31A52qGz9C/ZTZD26FDsDH9Yd6s23aLMqummE0ht/dA==
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
index 1604bc8cff37..42977b04346a 100644
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

