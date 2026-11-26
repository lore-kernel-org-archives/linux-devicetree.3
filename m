Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669142;
	b=Th4cVFSjeuM5kPYT0EV8E/n8s1sHV2nBQOOJyKWb+E7EyR3Tdxw1s2f2o+ZxmcGbd9xL
	 aLabmhCjFRtFwP9koNllnDruFYZjpDvy0IncHrFVcFlp0fiGOu8k3n7J/WIH4dG/vhpGR
	 gap3B+ms7N3jQ9oDWwtFF3DVW4j1Y246bLW8YL+HS69fZ8WaNjQj383O+0qzxP0bVSYI5
	 /veCjuwT7w7bLesvfLAEeG0wEQSBynmCHvqQxzjv3oyJi629d0RiORd7uHv1k+l4uqj0h
	 +2Xgfxzk/oFMzlJfZu0kBrhYMYIsWwobWF+s+zqtZ9KbYedOE/zBt6hcYqiJCFMRUUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=xJwhSVARZ6UA9xE47LGdRU2BDBM5lDqtA2XG61YAm3NluKd/5/lnpWld+T2WRim7KKvA
	 Jn8Xgz0IYlgbNt9BTRz6TLt+DC/iRUOdMwGll91OUJsZ/vtHkqLiO+856pPTU3pgfTU9j
	 LrdCFxf7pPVfDNVGN/xyCwqAXdP+/voJGL/Ug4dwunyb3fmHGhuK9j0NpbHKw2BWc6f4y
	 aMTdP6NFO9XW5cHroBjKcMRDULMG4aiBavWsVo0/IleFDp9KmHprHT9qS4V5URUP0S99W
	 4zBw8ztFngSb+sob0bNf4J2qBBWtA1iGKaEzuaL5Tz3m6418n+ND1LfMj8xCafA1olg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6E606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C6E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386c336eab8so3054052eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669141; x=1796273941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=kSCCzsYD7TTe4A2sL6/ycJJjMHyhno0Gm7v4rEASckt7CADBOTSYdgZolwxbk5ly8G
         ysTH5v0qRaf81Vg/CLag5o9PIut2u/GrMvkWnKTP6/Pwm5gX0B1XOgvF9Kk1F0NPMw/A
         gNdqG3H9A56JnEPxB/tym8sSNQ0xdU3BW7VyEwNal/q9VseZZHzJRy4Hn+HzVqHdVpwd
         9Br4aEBGYslbcoSL8Hl1hFXNBFMqN6N7lLK9hsyUVcRR8xaSvrr1nSAMTM4vJ3kRNapb
         X/dkNWOYyYezCQuNUgyh6p7lfHzVVhmLBUcQkl9dZhBG91WDyReJ581nLKjT8E49GXHm
         rX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669141; x=1796273941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=xZA7Hd+cNFfOOMOXzUzI/IHOfuZ1Ag71a/WzF8hed7rPzT+yikzpvfy7KCiMQlg5Lv
         dsLMlN8VJscj9wNkEvn2hGLuRj8xDf+r1oJv5Uyy5dHFaJEwoW/DXxdsiI95aXuWaHka
         btAKoqs6dOTwy10nY2RTcWK21YO9hBpdipIKr7DB4Bu1vz9iOztfOEkHo6e1iGn8rR3J
         Tj1Wl+wDkoOdZXrqgCCBO7FwZLCoEiuZhvFTNobhIIZFBeKzWY/DGQUjAU3C7ZHpD9jm
         NxbQOhhwxjmBxDMq/vPZ+6HWiznRMPAcKjuOehHVU62E2sg3U/T1pw21GGWL/H3xRl4r
         uUKg==
X-Forwarded-Encrypted: i=1; AL+hErGYpR33ZyPBvStcRxMxHCAinwqJaADqIWo0hmFh4hbf4y0SuC1qTIQwVCR6TywXFwKE5QyVgMoDaySs@vger.kernel.org
X-Gm-Message-State: APuU4Z8JELxpe3WitG7FDoVG1ft0d8WnQcrRbuclzDRUd7TIWcvJI7MF
	2fSQNHFkFIFgQqZl6zfXyrnFXZF1kQ1GnhKJnmWbSIHx9TtPAkgd89aT
X-Gm-Gg: AZFdTZf03uCdW3bYBZZXUHWTYQL8+/vSuqukbnztMzy6e0hkQ7Rj1liuMO3RCy4wLxR
	wVgIFtJ+WOmYosiPaSjetleNyOUP7+NCuDusjRG2XVRtvjCxaojDVhxQFhzUOfn50HPj04q3Ukl
	eUqa9vy/KfZ5XqnRRJieBX2W1LsuzSK6ERs5pcUBGO079vTCcWhOcnwb4z/5nk9ze4lhY6417Ap
	mYDznln7hf24E928xKkkqnVL+B5uDqNYZlm2MXihElHlOuXQMGn2Y0YQqQnp3lBUwwhyZ1kSTJ8
	iDai3XAqf9wVbD/FYnfBL7xUJXjW8qiNrsCSJR8bLALBSeGtPVw48yItKBjIlvhsUTOQrx93HNl
	Xx7KG+GNmDag94T/JZ+yxP1y9Irs9kWqYqJM4o2hkN8kMxofacMw3m26a62rBLEaUDouQ1UGYwa
	4jl6nO9UrQzM+osWsH6r4G+s1Ushq59I/Py9NbO8Mj0rgePVqoum6S9sGvCNf3IZ6OZcA8FydHg
	MDHl7Q5cVNyFt8pVciTtUibGBgQnI8aSOtgRdwoJn6JojSQA5hCuitmA52AWiONWgrY6+SX/ez+
	k5X7SliPkZe3kqkT4QcTRVDEmfwFP3+U3DUn8U40LY8XiCLkU8owkJsX1G3MOUaYgbw9TtZaMJW
	rTaLrAi0=
X-Received: by 2002:a05:7300:cd86:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-384b398741bmr30143044eec.5.1795669141005;
        Wed, 25 Nov 2026 20:59:01 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:00 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:09 +0000
Subject: [PATCH RESEND v15 4/8] dt-bindings: thermal: lmh: Document SM7250
 LMh
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-sm7250-v15-4-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=buX/Uir1r9Tf6tM9hX+yZml9fjYOnCxBqpLAg9mgfqPDutjiJqzrSC7fD/1Lls9r89OUWSfqY
 4QvPYYL9spzAIblrGWW8QtgGHnWwsrntmH5gOADX0P6V/5pn1RhOJOm
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

