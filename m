Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6023D9042
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867963; cv=none; b=VMd4085be9JhFS7kz7PMkMdOa3vtv5irCrY3AQleqXcvpzOHnnI3+KX5A/7592SPfLxVdVgoh6aGC8Hj3PYL+pFb3nigcwaUazr4ffRnWMMdwO7tcHpmZP8kMeD7yqoRtZ+4Zju9ujWxuCHeTV2ljPaiQzZFmYF+qLEy5Cs7u34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867963; c=relaxed/simple;
	bh=5rxYfB6fEA8QV4OQaA+5imSOiEABtOgJH0KumSHC5aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFotvv2YoNTPPJ7x+fQ3AQgXq4McVIl7avEY6KTRiyytTQdUHrmO2uB4qPCWYf9OV83zv0IAOgbczzfMdDmzxXdLdknu8t2gYTvpUUqznjf1L8+f9u9EFzCn2wlA0vwr0GC1cRWp8QxxxImIdm2MgbvhotC7wOLiPulEwwyRwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFi64kjE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFi64kjE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cace91f112so27289205ad.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786867962; x=1787472762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=aFi64kjEiZxWm+7NllOzH0rW73aT4+NIThAiHG52tI6AnF35Ag7O+BhX9wlaIyvoqb
         36iq9dmxeTaqjOVYfJx5LaNtar5RNasMVuauCb8KRZFbES0b3Iy0lcR89IUyTTXeNxLV
         vejxeX+RSOEkkm4xAkl9dPnso85lSxat9OMDXoHBr/WaIhAhnpVlwEkk5vm8wj0nEmEz
         mZhPO5BEPM+KxE6mHNWPQ31ksGN7YeikYQwncQTHtqtJWPos2vo34ukoKqALd00XDPNK
         jpOiiCbyX9sv/wsfD+IAs1ZYOKBcEBiEjFuNTPwI2TvHIa6H0q4GERTJsOHylIRA+KmF
         9jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786867962; x=1787472762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=WfpqNkpbsbv0grJXmErDU/NBQqSUPeJQF35er5JsWe6tEL2GZcDkySKOSfWa6pQvql
         MX/Dvq40EBrB8mwYVtsv8wmlr0UCMSIp1/yfHheDK5ndD9oXknkjGXLHnqIHZ2PPtjze
         qFzQ7t4NbaT9/J/T3qoMCdthaOhGJ5WmrFSwjycNaOy5+9LLv68WN6JaSKZ+V1Ib7Hup
         VGorZAUnftLFIEbEQLyBl58y2QmD8p78+4zGKe9NofE5qvpfC1mjZ5TDGnsk18Jfsrd4
         X5Bey6duyDBiRmBnwZAKMJKHuwIC7q/TULKubAEZ10bTG/1m7iqMWAWipGbPWz1xz2ji
         HdVw==
X-Forwarded-Encrypted: i=1; AHgh+RptOVfCVovQ4zk3O+fVfroVAeyNH+iP6Q/CehYhOCxO5HMc5ym0QaaiG5Gif71dflvFlw5MbTxhUujG@vger.kernel.org
X-Gm-Message-State: AOJu0Yymu3gJZZQjZ5XImp7ntb2RzlHnbFZ+thgIGB3eB1/6YsYp0o1N
	E5gmzR2lOgVg/7XrT4R/Ajm8lHB5wTTk/0RkPcPZ9cE6GVGT/BltmSWP
X-Gm-Gg: AR+sD11P9SCb7ijA6y85SzdaaRwF91F3ZkkVthamFQ1KCNGrgWXbFRRfgPWxvB371H1
	fI6B6F4WEq0zc2/PUwvHnKNVCKCLMrbqzsBezvvYaagPpsZjizV6BbYb2/Wwp4n0ta76ipSPfh9
	H56nyxfceu9QnjiQvLAUgYReIRgAhPyYNTfXnsvULBO1V/BLNzGRrAGJXiUPUn9UqEg2dnbbQyW
	39tYnDX5ZHBtFu2njCOaUKJo89GLYr5nw/FWAgWL8LMNCnhHBJzhp8jsALm/mczmKEtB98MO4pD
	QAMYWkSco3lTXQ5lRmkWIcGSs+flNyhNnmF84OhOXkdNJDfyRd6xshmJZ+x3iCkJzZ5h/ZAZr3q
	iK4lD/nAVBWgzOFn+vy8ar2VrvR9qzyH59qlWavLPi5SR8arpFgM5MPgUg+efCP3PjcE8pCTrWm
	6UP+Bfprvp0VuXYGHrrLltk63Wg8dWcWYS5y+k5tfVBEkYh5YfNF56LKQcIqFvleoBjQHGl0tqW
	UUZoW/igccI
X-Received: by 2002:a05:6a20:430d:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cc71d533c0mr18120774637.6.1786867961758;
        Sun, 16 Aug 2026 01:12:41 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm23716838eec.28.2026.08.16.01.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:12:40 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 2/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Sun, 16 Aug 2026 08:12:13 +0000
Message-ID: <20260816081213.5495-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816081213.5495-1-sreeshankar0910@gmail.com>
References: <20260816081213.5495-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad..3c1ba5168 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -208,6 +208,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

