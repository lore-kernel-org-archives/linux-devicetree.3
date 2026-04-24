Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC28C32938D
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021684; cv=none; b=aB+zsMEfzoZfLlIfIlaVLH3u4SexKbdZYJiInahlUKSlb607Mj30SuFXwGBOXp+2mxEjN6iEUoX54ONOGDK23tGaF2/JTB9aHhMyk3U/x2RFwZST3qejDsfuAan0Z1O7RIR6313kLezGHiMCnC80T8UOVH8q0hg1oFdwEO1mszE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021684; c=relaxed/simple;
	bh=mfL3zMqIzWVzm4FHhB2pqXPEVF4fw5d3cYOMIdlK9nI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8arfy4po8RcVi2gN7uSKzGYQEr/28lLArvPlvEIsac11YlGMMysXuSCh+lQZWDX2yYU/9sSfJ1/eefu0v1fciDE34AtAIn4L4PVCljA2/1XivvNnWpAEPwLz5cR4vQbN83AwsUlOy1TvYQRqNkplLggR15YAA/i0arO1N58Jjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jbp35p3A; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jbp35p3A"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso103831755e9.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021681; x=1777626481; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sO/i9Gb8rKY9PHJ5AFHwqyiQ8HD7GPgRZTwMGfL3wOE=;
        b=Jbp35p3A7dljX8K8LmzSibIRmc8kW+NKClTGm9B/1nG1BCIdsJRspFWU2qcNPSlfap
         1JFurRfRZGYI9MOFXX7a3OJcN2YTdW21pJXcmZckALSobzCTqAFTSzxXt9kOz9Qkokwj
         bf3QAs241uu36I9ATRcSb2yEAZr9YPOPZEEnTORbqKgdtFmljdefewcOoIhnE3oR2FjP
         FxHrYs/cxkDW8oe9dls85Qb1U0RIYmbKkd4/N/glHHJUxcYfYiNk3cMeYOa83jUvQBzf
         Uugvft8smAE26iJdfq/KnM+X+/28JTlP6ZN/LehD62onUFEhprjsQJ1qrUtA2M+qerSJ
         sO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021681; x=1777626481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO/i9Gb8rKY9PHJ5AFHwqyiQ8HD7GPgRZTwMGfL3wOE=;
        b=HMjoQ+CuHXMNOGxkoZe4uMnjLt0g031rNHx5A1RANgFd6RC3FXsbjKLvTT/CDXPr6q
         q6GeuD0Ef5jsFJ7G/Kdlxqn0wYnD7JBa78IfLS03955SOJRV3SXzfBtDMtlbBoo2TAHL
         sB97FRR8RMNjPllPDYKVyxUzWjfB0TgFHQGcxYa/QDSpNLxMyrvhFgtMWwVa48PqHk61
         wqORstibIyegOAVOwwFNP38Dq3kkc7uFcj7hlhPX0Ukd9IcsAIXEAwmSrmgOL94YIMbu
         dKoiYcxb+M0P5IOr2Mdcn7YAKfdoyDfn0IKxpm1MfBJJ4WcTRUoSULajn9VvLYdyhgIO
         1g9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zmU3O/LqggEEGeVng1D9gWcy2nsLODEExfjm7TgTHjIgR8Lf5TqDKSFrpQVxeDMur99tRCW2K0HYv@vger.kernel.org
X-Gm-Message-State: AOJu0YxtkXdyje1GhNBrtVzkI78/q/G8F9hzygkDAz1FF9dah3Nb8mTG
	3aKpSg6qcWg8GaLKcW+s2ltr2NIoFeBnu7duuZ2rH+ePJyu2WW5M7aITBiYWQlGOcRQ=
X-Gm-Gg: AeBDietkbjDWtUjNX8nMxrWC18hUyxgBsj1xVJ9NnIX5YzMVtwTmg3BqgGLRy2dCWYG
	pji5W3hgd1iLVuBL+GRq4wo9f0WaiU60/IC7AvFAOpaKPn+rgktKCeBwXbzE6nWvSc/Wwtdizpl
	TuOZR7x4Sw1Gm33HxAGANQTuLl6m2RHHDBJ+GuzEtnlAa19J63lsuG5m7JyrrGBjzu+ctIqIbAc
	5XPq5pT6WQCyjotDNGoX900jlMTSI4BjvvGTnwC1P39CtKdTNDM0yG+dZIYyMHJocojM4s9YVBn
	Lf2H7ov2akkzDiLx/B8Q0YcEGsHB8FswroFAbGF7UmFz7KDKVqSNFrr+RwhUEnw3BEWFZDdQbeb
	spmcyAWWRlbk2gc0+MpVNu6Z69Ownt/BFmiPrRvdzHGEwUBrSV1CJSp56qqqXInJE9rZnL6EVW9
	qIso7RyxLC2zGOouoV+yj8RyM/VA0NYj9olYxeROECcUOfQBi6i6oLazk=
X-Received: by 2002:a05:600c:3515:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488fb78e7c5mr423957895e9.28.1777021680970;
        Fri, 24 Apr 2026 02:08:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/6] arm64: dts: qcom: sm8[456]50: Add missing CX power
 domain to GCC
Date: Fri, 24 Apr 2026 11:07:54 +0200
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoy62kC/yXMTQqDMBBA4avIrDsQg3/0KtJFMo52ClXJRAmId
 ze2y+8t3gHKQVjhWRwQeBeVZc4oHwXQ280TowzZYI1tTGUrjMsqhPrtUm0wCuNElCNSQm7rxo2
 utd53kAdr4FHSb96//tbNf5jifYTzvABKMkUpfgAAAA==
X-Change-ID: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mfL3zMqIzWVzm4FHhB2pqXPEVF4fw5d3cYOMIdlK9nI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLt1qg2AIuqspYpg045muyTSFJw3AdOHIyrnQGq
 n+WVwZmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7QAKCRB33NvayMhJ0Q3vD/
 4iJ8xefum6O9bAeFfJ1s0jhT128NFRnBTdSU1TBSmtjVOjxLrXNaDdg0ye7QHZcTgPiRFkT4UlwrdD
 Tkn89sarjjZNHz5A8dsNc40qwWVSa2O2TVtAZERZeJkRnkCC6u+h6gUyiQRGRq+4GTuYB4OpBeclwf
 1QHVIO9+MH2fQYOyKQW7LhjstQ1YHQYLqhjZoIdVTDmNtAmHkZBwf7BoKm9lWV6N/CD3LBntCMo6iN
 04kqMAL5yA5NiDp4mCKDyOsbgiRkRVAtJCBizFDm3LRCcrsq3ZNgl8avz8QtQ8RYlWzjUdLBZzBzWx
 BJJ0x+dNmF5GzVaZ1mGQEyVEy6/CrwSH8bFl2epj2VRAxYc2SYvtTzCXjfaMNGnu8na8m/w7jjNWzZ
 qMG/q0EQVPPtc4ZVk9csNqsggtkiUbDAIMaHTQWDkTPo2LAh5C2O0Vbc8IDTVVvHexGQtr0l7b8ydF
 cDMOQD7vACssj6vUhOfmWrTvWncYc9CSrjojtHvIsqPFC6rLMyiHEJ3wkEy+Cx8XZ8LSLHJIAZYX2B
 qT9QejsAHcclKZRapzb0U8L6/SbLJbIXX0WFlDFkPBQXeV3EdG2K3rwFr0BDmJ3FvX9sp0sucyfZun
 P1MN5ZYz3hj+3lPEkL9pkq3xUxcXMaRPhv9/0HPVwjXtA9ptqKSGiw1a+NJw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Recently, on Eliza & Milos, the CX has been tied up to the GCC,
but this is valid for most platforms including sm8[456]50.
So tie the CX power domain to the GCC as well, for the
same exact reasons as on Eliza & Milos.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (6):
      dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property
      dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property
      dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property
      arm64: dts: qcom: sm8450: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8550: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8650: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
 6 files changed, 19 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

