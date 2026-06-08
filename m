Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD53376469
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920377; cv=none; b=czJbKOv4NJUrZFa8c5kG2oZ6RrWYmOraL1Wkvqz8TNvM0RS+TWlzGnuxyzA+1OqGxmUP63+dJXWLCso6DJZp0fy/e/CGNG2eERVw34zuND4QL9XmZoYXpxO4tWWHupO1FQj0yQ2zTDhcdmsjnUl9AYeZ6Gh9Rm2/RWLSD67akD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920377; c=relaxed/simple;
	bh=I0MRNDhtPil/XdRFHR6g64yWZF1AHbnM3WQ2SyhhCNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRTR1sj3shjlwjZFKpCATONxDcA1v3RCZs7pJnFJdR2BNMyV+UWWiXt8rLMA76DjZ9Fs6UyvcpJrXvbqE1UdTzBmNfTuCkRETmrc1geLpSSXlSgJXKsr20B7dzaolIlc9ygzh2i4LUNkgbSm+rdsDC+IQ4jRzwUxWzzF2RyoZeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9UV4agn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9UV4agn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b9318997so30987835e9.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780920373; x=1781525173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPTIML/fjZVyuVRpqLdTSfDMUxOQRLiEiydHZK8Z8OM=;
        b=D9UV4agnLMvlH1l0ogLRYjFWHvUNkJjYeOiooKlczeU5XSzmUg4DamUt9pUo2dMGMx
         r+P3oFcoUmEKv2lWMkkOvDuP20uHum/25SGwOLKTiwus+KbDm2LUg7+UoVSY8Ce/qxeq
         lRA98vk3oe2hmAI9rj6HTUtehPyDsXHUjKIcUdhSNf8zta0TaVeXLMGWoJC5AauXHzKX
         aqitmqH7eCS5vG1peXdWBWyKOSjMznxK70adRsJWelAFArR7lxjjeMBeBNQZYowVct+B
         QL3K59owyIY461tAkuBbeBUxOKsv0/Vuza/nKUtYoISY5nA2eCt/Ty3diOS3nVcqpUtd
         HHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920373; x=1781525173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZPTIML/fjZVyuVRpqLdTSfDMUxOQRLiEiydHZK8Z8OM=;
        b=dF4X/PuHaJ5fYSVsRobg7soFvgzDJ3iJnwpNg4qizzd3eoea4Rwbq6BxoYsLnn4eUa
         A4bKJUsArQwjpZCFNA5RrxbHtjMBHVV6YzXPbZFnoJtSj383sCnTBWIJr5c1+KrZlIDv
         zdzbHzOIBZ4LiVBe2MiwM15U11LkWZfjCL9C67TAc33Acv4qIKQ6i3n8BwnQHBCeKjBF
         hsme4wu/ckeLloGjrtFYwHoStZENCDg8+c6Ci9dhnurqraEk8HgABGKOjgNe+hLaXR8X
         UzzUvlQn+juZcUVxIm3wJvXT2roGKUZ99A53HNqVLT2lKlhqqZPx3SWlGK8xNp0Muxnl
         ZdiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r2GGEiYrobLpvco11lvG/J+OlnmiJYhprJuk7rBMBwyCg8M/eLgZU9RSxd2dHYPrmGEIpixwiHHyd@vger.kernel.org
X-Gm-Message-State: AOJu0YzDj4fQ8BU/Q0caSgZ8mJ495o6tqHzcKzxgHSP3CzvBxsjILL/C
	CPYicdWfYJKEncY94b5IwZJpo10cZRgxu9j0Z1Hbnnqfg9oSiflQxhUFfZbREovvaP8=
X-Gm-Gg: Acq92OEKoa5K8MaHoBplH+ex976uR+++qIu6h7Ww7+bW2YEmIogqdtAxJK6y+6h3haE
	/wmpeG5K0+2RNs55vTaLdNS0VsBmkprMmhqqs6IpYcwan0OpAPB/sdqWOz6S/oUlPwRfL3/42e0
	GoM99OY8blOEPdvdjIOss3P9N88elb5PqjEp+w1DW+Vv+eynfGJf6+N3aRwT4198Ln9BJYR6wbj
	aIC0muH8DGZnTIatPriulOfeLj+Y878xcb/94iJiK0TD9HsXQE6QecgmG18QhqU8NwcPFoGbEPz
	0MKzfq4CtudW6eri05zu0r8GiBgTiHOIrt9BHTi5N/DVPWzwC3CygLXhLImH1J30+5cM2vOKjWD
	+ez1wBk8c0rniGrv1kzYLmEzv97YBqpYKdS7It/R+WSnjJwR3C6+jVa4bzdK/LVVn2SWG8S/ffa
	5AvWPLh41YMaNLXgb+JIqN1yX/Fa85iJU1FHZ1zhfZxq5iHgsaKbZXcfw+qQ==
X-Received: by 2002:a05:600c:6087:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490c25b0231mr265490125e9.11.1780920373102;
        Mon, 08 Jun 2026 05:06:13 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:7dca:9001:34e4:f362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d30eeasm250331745e9.1.2026.06.08.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:12 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 14:05:43 +0200
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,smd-rpm-regulator: Add
 PM8019
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-rpm-smd-regulator-pm8019-v1-1-c671388b9ea5@linaro.org>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

Add the qcom,rpm-pm8019-regulators compatible to allow describing
regulators controlled by the RPM firmware on platforms that use PM8019.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index 0fa0db7eef23..0d8bc9bf996a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -35,6 +35,9 @@ description:
 
   For pm660l s1, s2, s3, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, bob
 
+  For pm8019, s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
+  l12, l13, l14
+
   For pm8150, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, l1, l2, l3, l4, l5, l6,
   l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18
 
@@ -94,6 +97,7 @@ properties:
       - qcom,rpm-pm6125-regulators
       - qcom,rpm-pm660-regulators
       - qcom,rpm-pm660l-regulators
+      - qcom,rpm-pm8019-regulators
       - qcom,rpm-pm8150-regulators
       - qcom,rpm-pm8226-regulators
       - qcom,rpm-pm8841-regulators

-- 
2.54.0

