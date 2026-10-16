Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2285536F906
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124876; cv=none; b=p2XJPpv1v9utSc6onSac+us6OJ+ThOdMfAb23g4+rrty0hYTwOk3p+rZIMz9P7ooTgKJ2KRbg/2Azj1971/aEIBVtSvTcZO3NQ65DTvCGpAwvfgh+PF/q4unY3Ilv5XVyTwzCPCzYk18s8uR4PLw2wrBgbMryx4g3gXObdxe5FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124876; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLas+XFC24Odoa6Q6WUHpAKbhDWuwox0DoULrjHKdagYD4EF19VWt0l1T7QyINFwrW7vKHrHcuGqYHdcw2CrOthIntLJlPo7c/3ec5m0V36iuKmzwcBo/epB/K4VlOmsP7RlfDe192rhtpHNT4G3CxdUO3MXcEh7yGeZpYCHRhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRiRWugd; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRiRWugd"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so3978917c88.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124874; x=1792729674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=TRiRWugd03HK68YGIOm6hyiVi/PjVf8wnrBkLIXB2TR+7DT0Z+wTQOsYquKPT7j0Ai
         xELXqywbzK5VnBe15X0qtvrcdt+PzFfyFgbkaqSsTjOWNCsf57XsByX4YJoFdOj3fKvp
         A31z1O9DXfPfgUTvyTZ4cfpHkL+N5wAW0Uu01DbnBSLNtKjFh9l2AR1UfwRBFljhrqZr
         DQIxdwhquy/cAbuMH7EDQbg5wXXdOQnYIaK9Gez0QluWOiNLKn8PfFbd+7dNUkht2fI9
         9oqoH6Za81Xmv8XP+hQdoM9NIst2DTGVyEfbmbFbldI4xpNeKpOTXbXVgfxr0mmb2kKM
         Gxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124874; x=1792729674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=nZi+0B+4kWdtUCa/a9rjC7xmnUUd+cRlhuw9lKnYGa2TrnVvHFaSOiEfT122m7QF5B
         PJwh2vB9eQsXFPaYyCarTHSaLXi2cGfwj5X9inFAfalriN1litl8L42z42MVMIw7eHMj
         OpE+HmBpNDcLuOuUgfPRfcw31mjjCUOcT3tYc1oZ5GGnWlbJgkaemmZxUbkgJDuBu5Hx
         ql3krbZ0M10lrPDkxOOZo5DaHyN1u69hjc3pJ7iqFefcxbb8WGC48zk2YpQESUXao+El
         hfnhTXqEJVz9syGrjFY8OaT8BAw3LWH0zf/BDoqwaCKK4bA3ILBg43T5BUvea50QKBA+
         Zcfg==
X-Forwarded-Encrypted: i=1; AKwUvByr1CVrSvFNC+GSiMAP8J29nE9ZgiYGLq5HdcqewyAfd298LgqdGalKjvDmMtpU3/JL3gZdZbGKjYek@vger.kernel.org
X-Gm-Message-State: AFq9FYLMOv2Y7A8kDm5yLIxQemsPmkSRc3EtD9liIdqBvN8276pb3xUJ
	grDP9S0n/w+wm2Y/Zgtuy4dHrkFpblbBOWkJYv62l458rYy1T+pZ9cwl
X-Gm-Gg: AYBFou0XDVCAqaD2aoRH6ugSqsD1eY8juYSiqOwUznLqudOaJSuB4qXzGCg7Ulzp+yj
	U3ayNYWZmOqb9LlLTd32UN4jELvkR73lHGlR1b2g1YuX8+aBKANi9RJ6f8VcIe/lX1eb6Ms15hz
	uyxWSRvD0tEXCJQNXodt2oa8+Lj0IgFTEYxGKTI04d6UpLhTkgVa75c4kU6TdVpdX6xYGVyuNJE
	o7yQlvnlb+yNIKKT17l2XZkL72tBkub0Np+utp2cSnb2rH9AN9aTpXMm3mCOGxrFHf+X5lvW+N4
	Ei47WBhn4otszSHqXFk+lsYoTY/b7icbxeBOmFDGeO73KLG/pu5jk/7OyHHexJPwyHRCYeZVwBN
	QlLbpTfGKrefcAghBxXfphJUNUvqAl9luqmU/ES/hZ7gmySfGxcPI3NcSmyxuyeBrERSwLkPL1A
	rFQwc9eR4Bx+PKlTfDaLiVrGs+tiDa1Lfhe+rFR4ni6tfv9BfivqIGtYTC709s0jygB4l3x6j2t
	rvqsLBiozPIpVkerB4qOLSGSCWvsNP/g+fqxFdFVE4gGOyxoM2VWwGViqW27Wqk+Q==
X-Received: by 2002:a05:701b:2605:b0:144:fa57:c617 with SMTP id a92af1059eb24-16a60a02625mr30091887c88.34.1792124874051;
        Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:53 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org
Cc: danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 4/5] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 16 Oct 2026 04:24:31 +0000
Message-ID: <20261016042432.824-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

