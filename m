Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6F36B90D
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583874; cv=none; b=PC4sO/pmAKVmRqnHlEQyJTzKJpJzqlHpsGcIU078OUaRPGabQnxh8C/UTBSoKD/lJaMM+VCw3taLwpdJuVgNjOPq0IejeBKeqEcpXkdxpaij/zYKNvMZcx0IKCX3AGr65j41Mnh2di5nBsPQXo67zqO2DjfXtp9mAPxqTq1+Jpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583874; c=relaxed/simple;
	bh=ncFl2egTrX19lpiIOG79kyk7c7SQHpgeuOXFeTOnh4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XB9bUucS7fHWbI7o5REdFheSvxkal2VN3WCT3ndJ3MaxoLx6WwEuiAixL8RVXzllrZUJT5WljBqPyCU8uyuJPysphjMJGqfaIgGU6PG2qSobXEEBKvLJTXHuAcxVdJvQPTJ9N9zoQXCIB2kreL7z0AdEHlczSxmAteN+X6Amx9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xs4tBhBq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xs4tBhBq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce98cb8165so36713065ad.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583872; x=1788188672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCzOxn9mb1pZe8tLnIPRTIlgORGGKeSrG6TEFfLDvGw=;
        b=Xs4tBhBqH1L1qnIgXTbYG3HsNlRooZYJy6C1tv5NR6YnSke3+Gt/PyvFNFPwzQwGoH
         PaLmqiFW6O4xT5uGHMn5fahKZ+yPtMmytWvtPk/bd5Cx+FLgaUUwHRblXJzhR/AhnFPo
         HZn22c4ZCNMlJvr+aKl6JKYeSLNl3i1KD5BmbbmmmEB51cPaumL7YTUPzevclgqa1b2j
         O14G10yb4BFqbHuDjJrsvOOh7pnzpZ323y2LBrHhYyq8sP/byXkWLEGStGkiWlwiBgJY
         JmAy+Qohkx3ECbYXY8W1srXj2xwQVo6VmiuJ6uaHc4z40h0TL1lCDuojSI9kqQBq6Jat
         Ah+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583872; x=1788188672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCzOxn9mb1pZe8tLnIPRTIlgORGGKeSrG6TEFfLDvGw=;
        b=IhpOvde6W/yXh08anUBRl2qb83xahQ7zO1bn0HSMzhZEAzb8ouHZ1DidcxGO7xQHbF
         rF43jqNwt3oVHMMSAfZNfp5LeRhGoZK8nliFqoo2rwVt7OoVXT2yopAiPsXDPFkzbtOT
         uMYVNNmwpwqy8CbNShTkEsMfX4Z6KMevIt2Hiu49u26zaFrZnLxgB5pR8m5YPgmbMXXs
         B/QPZcevC6kO6UVcmJd+PK59EbKFn2VRJJiqPc3WoE761jOoLNfu/mpDPcU9vYQVw3V1
         l4SFNOQJaxvMTWdk1TgxgPpDbGXJa3a6HDQMuVRrRugr7ZUJYtz/Ao74AGM9fyY6fNg3
         SoJg==
X-Forwarded-Encrypted: i=1; AHgh+RoO51uemkq5zJEXmUzcIvcP1qoWokV1d7KaS5ENuMrJHQwUQWku797cpwULu8n3zeB6oK51ipA9hgGK@vger.kernel.org
X-Gm-Message-State: AFuF++mtqT8ZTna5WcvP4P/8foUfO0tq9xKoJg9zSO3TKmIVeUfBUTfT
	zD5whWEZUgZquW6AmQv/mT39XNt0gYuhiVyg1aD4JT0iVlpC62DJHCsq
X-Gm-Gg: AR+sD11cjDVk9gVZbbT5u1b545UGQAmk0aC5bycLglDwwaAtdn3lVIKVujwriFLgQr/
	JX8S4ro4q2Fy8JVKlTgPis5I2a+aRNn3BVmEV2M33zgRQPtj1v/XsqXfZa7aGeDNox/6Nx2IMQy
	UJ812906dhszB55QQsqOrSsi2/Jtg4r3SbJBBe1O27BICyfT2rut8Cy67O7e9EfRH9OASjNfrkK
	LT8V/UNKUzCWDyqxO1uuGXyR3ySKl/nDYTXAtooua4LiaCNuMlO3LZqjzQJvE5MQQ4LDQxsq1I1
	22pKoubqcadJKm0V2BKwuGAs7TD5FYD08CWlucJhcX1GeWACI/U/KDKP+KxNtvqO+HrtXXMo170
	Q23+Ado8Vb7FOkCFbZ2rQ+GW3kUDRWMtMKM0/WntsYGDl/6fzS4ZheTX5itn+56EtV6p8dzdSxG
	klXnbEhiHo3ZtYvzJ8rcC0KREJbPeapCQxDib1un4eJQPjnjvP04yrcJ9au6ZxgSjuLRfsSrkgK
	Egh3MuZkQPf
X-Received: by 2002:a17:903:19cf:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d61a15e3e6mr409361745ad.9.1787583871757;
        Mon, 24 Aug 2026 08:04:31 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:04:30 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Mon, 24 Aug 2026 15:01:55 +0000
Message-ID: <20260824150156.1310-13-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
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

