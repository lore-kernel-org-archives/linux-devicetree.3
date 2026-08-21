Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE436EAAC
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326976; cv=none; b=mYHsY4MqEKaUUBegFzZvwiT2qcTyKy161B6ZfB3TdqZR0OO9aDakG4/fMYh5tD75abfjNzA7Ee5gwdXBr/FMUlbROFHr980RfOiFbeXPNVM6h8IJ+rYXsM/3OceROg92fyLUA7+oBN0yPMQHza3qeEI3w/SREmnjYRhs90lKOS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326976; c=relaxed/simple;
	bh=u2Yu4YBYm2njILlYS8QED4Q5XuAaD+AtoFT/SlvHqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNfTqJolZKVPLod1PP4tDz603bfiJNC8OKOeNar3YjF4MGzmP6mPC87v5zJItN03yWUUIouF6b2SrZCq/OptqLQNZb/6PDDOMoDt3OfHWDJ+CFdB/XFDyxVHT1o0UMoRpq/gnmiTvIqzLimgC5XnJlAr64RM7v+SluntK2FayhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxw50x63; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxw50x63"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so16256435ad.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326975; x=1787931775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=jxw50x63pNeTsZAxOlpgb+9Ks1v9WQEn/y/ca2XuPKv4XLCOZITDEkVz1TbhtrzUus
         U5heo3pC7HziMnNws0pimkadcLUafsBmfqbAF4y8tBfRDOZQt/MWnLgyfDi7nEbMlhhi
         YAEUj3utJ40kJVIuh0Imfol/i13FzsvYjU2wGrs3dGtftJ3h67BosK0G1JHhC18dTn53
         Jq9r55Cs/Vjo2tGexZ7gDSTK3MOdWxQX+rXhbN1FZueCJGjjNTUTswPZaX0bPYMxBgEt
         Plfu5eMOBQxuo08/784w40Lmm5pXskWjiYghHcmEPfapSI0YKwBkfPO7m1yGl60Yi5tX
         +c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326975; x=1787931775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=jk1b++PlD9/QVw1lYLKBHREtXKHyQpnm1mt9q94LEFjtBjC+vGarwHkPcpXZrrCBFE
         n+Yce9YqTi/Hb4Mg9mME1Je7a34aQfNDopEvlJnx9OHjIOdwRoWswfgTpp6Ymh4M+Maa
         ngKQko0TJg5vw692Xc91gvtoBm0fFse/HU9U7SIm0ArgrAqt8sIt/UM3h8XK9e2IISq0
         uXXeXcDcqYXHi6LOMIBg9BNTJrYR6r8JibCqxSu2L6e4ftF3BOEarpo9KBylA2D1WMim
         a50baxmnz4yOLB2x3/d9ezcEYPwLxTPrjnh36DCygGDX1wb0VorivKRSDz1P6k3xJce1
         JM0A==
X-Forwarded-Encrypted: i=1; AHgh+RoWUf2vIyk3/lzSZPh8/7+uanK02ZGoHLlmpWLCINaD5YSGilLKwk2lc5fnj7cITy8SlCTG/x9/rTpi@vger.kernel.org
X-Gm-Message-State: AFuF++kkqy5yttlYeFKWzzEs4uamhUoSd25EPXySRt1jD0jtVOiqZymv
	tPU3CINzJ4hSv8t14G70UVQdlwL9YgOww7mKSA04wtEMrAGI160acP3q
X-Gm-Gg: AR+sD10ikUoKaL2Gj1XuemrwXRdlC7QHAiFC7DT0WUYNZaq5YlzTxTIwBq2W4+FZlKm
	r5kQftEhgOYQxfhF3UJELNUbm1Vb1/w39H3PhzjiVG6RbRSKfgQmS72CpklJlw0J4eET6Vqvjep
	HO4V+DKGSerNkiLWozajwRti8FnbV7S7INKegOgwh2d75QRRHqXjdo3k2v/CB40bAtuOw8JCZ7Q
	aoJzpE1/JfKRSWjT47yCE2Y60pedldwNlp1N0dMsyo2D4LrfjyQbM/bhHH29VqU6UNc/9Qcvjkv
	BLAWH9EA51GVOGx+++J/YPDEZZFDtRkxnX1ZiY6fYf3+ABscyaBvyh9deUor0VioDEwZrKRIk5q
	5XyRzYBZfD7olWxKoqx8mBg6tIeyYuSSAPNI3tCG6ya0wd80VG72VSzpfQhFq2IwTtBYe9byq7m
	KOvx2lcwloGJGzq4IQGbcAU5Z2pISFtBJsmJiqYeA4lo+slCOxYctHtyIaPEpGH/NiReMdXymeg
	qn7DmNLsjMEHxUVdQ==
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr14045906a91.7.1787326974668;
        Fri, 21 Aug 2026 08:42:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:54 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
Subject: [PATCH v4 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 21 Aug 2026 15:40:29 +0000
Message-ID: <20260821154030.2514-13-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

