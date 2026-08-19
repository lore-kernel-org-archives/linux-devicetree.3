Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FB8480DDA
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153267; cv=none; b=K+hkNhNI3r6iNf87xNoTck2ydsjIKCUBmhN9D5bAvzp1AcIOAG1ayamBTC23Lebt12UrHuHoO09a95yHHUvr9GQkYYttbaodi27eSBcZubLTpWGaehsfD0FThICGDi/SbPzVZ/jf6nV9mard1Xt4w9dVL1kitoB+SfHKWt5IIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153267; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pm8qCrx775/PMxmu3L/hVkGgJ3ZafE1w8VPhKNhL5KK6LvLPFcHeJ7qsEzI87p/PJKQHhbNjnLKI9NyKJkM8fjxdd06BIsgeWDBA4glZjOAlabgP8ZPXiQmCLCDuHyw6OUX3CoUHgw/T43hdloI8qXjzQ017WjrdtlhDDKGiBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmC7/ZnM; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmC7/ZnM"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b12d146e6fso579316eaf.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153265; x=1787758065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=UmC7/ZnM1yMfwnNWSrK0kOoCj8KZm44RRrUsiZcDgDHxhbWwGSEiLV4Yovc4i4o9h/
         qnoXjCVC5NsH2rpc1BNt+PLqOlQMbIHVJZHPcMGRxFnOsS4miRDFqnh3E8d/lGstT06E
         1l5DoN8SnxF4PpwUoygAHPEOcDdgAbjcF7Teu4j1kDZwzGeEqu/iYqodCe5b8FjFplFy
         Sb4jZMjyqTqnaJZexSXbTJobuGmV/gC6ukmUvwxLyznZ4rklgMkb9OuXGKnF/mUiSWv9
         biKPEBenG9qHBZQCAgiU91lOUBqyTnywqQhFZvVGKdmPQCpieXqkkjTgc49XpXXABc1E
         G4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153265; x=1787758065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BzZKeMIPpVfslvrCw/PkWtbTHk6/QgVA+p76mCAKQ2P5L3IylMZvxdpMSl//amkNhm
         8V3xqS7qz3HkEdakd3vmltKhrzIRu4oMc6pwxlbOEK+Cl1EFqGgkonfmEKFqFx/8mXJP
         7kJidwaBQzbrXK0J6jvIYEd6c/AXHn63Iwr+eD5jKJBABgZouFon9cD5MNUMKqxXkxuu
         h6OaH3/++4aT4TUXhIKmuQ+3XBvZRDdvqPkW3fkg4X0X5nafhsdLmHMsJ5uAPG2pn5/a
         734bnXXi7vboCFSpPbaRD+eVdtRIpQbihU+OUzLRxBPCyx7TJi522x05rLyxEOZaE8Qs
         TDGg==
X-Forwarded-Encrypted: i=1; AHgh+Rou6Dbe8GfeUQ31xmk+XJ81rqewikDJBqChJdqHJ7Ww2VSA1V3T1kQYQsFIzmMhZKuobRCV3Xr7crHz@vger.kernel.org
X-Gm-Message-State: AOJu0YwAeiwWvHF1RS1uWalwFkQ4OpyJ8PZNJa9jOpYHoZLQ4h/yYNd8
	w33vw9Bt8xWPtiwGmIFgrB1ac82lJVdXnzozajWkSk/yngCBQfDGF4Ax
X-Gm-Gg: AR+sD10HBZ4Z3qqx9fTAQBZWL/fxPNcBBhjjG6sACL3a/RzbIe0HSS6i2OYz1ZkAB7r
	B0r7bDo41EPHrSYJGehhS6OxFyjXalt0Nyl5NLHHWfAjzdz1b9XNXsjy1+rG1VLrntAmTsKvZC1
	j9i8kqQKb1/smwxrcnmdGCi/9NDp2bwcOqOScaEodeXE+XXWlQMtyHYYhLNykwQEuc+j5D8OMPV
	zk+KUd4mEaL5qZJvqPrX2eMs74XDvF/Yo05OXcNGGZbZjQm4VBWedE2rVoXoNYXeFBJn79t8YQW
	oIrDq0x2i3tZ7cE9wZXF1LmgF6LSQQpdbaDimZGlhz1sQ1OkF4f9QZF7qyeFqaZXdhb2+Bv39Ok
	lHiuWu3Eemi68p605xJlw1aZTeg+5DsHlRMED9SaLLsfmcGIoFnLZ3ZuDpZ0rlzNyFu6WyTHSQK
	BjOjUZ5Q7pxNaSJOkqFu1aZj05U0aonSJpqGGw19GxDZmidTHoMqVrZHEfPSL+HwPKGpwEts3Wb
	HxHuJ17Kyw=
X-Received: by 2002:a05:6820:810:b0:6b0:4355:3c8d with SMTP id 006d021491bc7-6b13c6bcf29mr4325143eaf.34.1787153264564;
        Wed, 19 Aug 2026 08:27:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:43 -0700 (PDT)
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
Subject: [PATCH v2 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Wed, 19 Aug 2026 15:25:38 +0000
Message-ID: <20260819152545.3934-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

