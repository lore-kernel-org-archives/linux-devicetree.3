Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FF296BA9
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784453659; cv=none; b=Tw95562BDFpIN6fw8kIRx+Kf782S86bgnnIf3BlcL7LYT2jCfAJArHMQ4dbzOyy1YbP1N7ilqWhGHsuLk5Cukca9X2QIxucdvJEqu2g7sz7uYmAEKhLylg8stfi9QlnXFNZzj5hrZdjaQ+vO3Qlz1UhT7cfpDaYxjGSuhedSJZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784453659; c=relaxed/simple;
	bh=09PJK7FyMop3+ThvZevw9MOmAi18VAWw4VwXOzDbcio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J45QtXv1mHRsGz30VDOtOi05d13BtsHzcv4Ize+ZJBGxKHOeKDHw6KpEPho1TR/CQ8brB6jo4LuMITRvKXxo0rF5yxWxK0FjyULhFEBWF5Y9DLwEmFijWdSeYaEVl+ltdqptwTz+VOgg6k8Z/fgtgoaMRa0sJQTuNcHSzpmq3vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MreVIFbr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MreVIFbr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8487088510aso9388628b3a.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784453658; x=1785058458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPBP+QpHeGYXcnpllis6xEmJf6ioNH1lXkoxfgOlON8=;
        b=MreVIFbroHcu76YJhCRntfjPps/Bl2+ZxJE9DFdoQPG/eZbwekwuDZI48JEdp8NRPl
         uOw5GkA7eBQmdZdNLkL9WJckkq+CSdux5vjKpyeBvKUiIzki1WcoqVSF1UaBjqzaygm1
         3ArFx8k4x3lzJP8jQ2FdZx/85yd8hNt6Xv3q3JlTxS61D3Zutdxqv4z94iSWBgh4BWLp
         Uoklchkv6Ul+kgDu/NMHPYgfahgGC4riePO9rLLdCPI4VYTktpZurLFPgLSl17BPhPHS
         xVJ8Hq2Rn8e0knsvjsdiPqqxr0L8NFM8XiDix8KtkcPBSd8jZ18NKhV9Kmco8NF5LH0S
         Mx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784453658; x=1785058458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPBP+QpHeGYXcnpllis6xEmJf6ioNH1lXkoxfgOlON8=;
        b=TIK37zz5/P6gBAmjfuVW5beSJ7ALcOSdj1yUAVUdeuaW9P8XvpEteL/RkEaZA6YbvB
         WQ967e5BbbNg/BltoCMgqIaQVLAcrfQ55MR4MeWX4xloCFTSEOA6T+Z3poh9lIKzzrLM
         JPyYEOpMyYlMdz5f+zBw8URIKv5YE/yuTPSIo25LTMBtc4SUN0qjyZ9eddp5Njduklu0
         JGPBd5KZA9zFWD0i3uVlz2z/Xsy3EaLvHqbNA/s5uHFU89RIHLycvskgk0tZGKEOP+B5
         gkk7iLGYwKIEvNjc5ClNe+sMtzLpmF7RvaceimR6lmiqfOjnUHHOtVpZZs63ZHKwfSIg
         7wTw==
X-Forwarded-Encrypted: i=1; AHgh+RrUqyiJiZOYgQ3CQ87LhSatBWNC90ereW9KQx8h95/12VPX/jRzPwM/ptsjrJVH3Jxnt4cEaCk2ng0j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7MAcSY/7fJKtD5/CzWm6leTZI8hs7EqvjRm1hJ8xncvU0lm4F
	QHnd4MT10hZ9SC1NtK7nNxtFdFhiTIoH5h7f8wV/yjds9NYQKtLkwQ9P
X-Gm-Gg: AfdE7cn4CBab1//bjbaBLfyGFcwrtIITzQVGNokA15AxENyeM5QgJ2K1kLCRmiNTcl9
	VqsqLXxAvHwwz1iVOs5QJasnxV09dEX+a9aX8e/ESzBqpqnF8dzi3UDBEg2CHRpOgSLzE2Le5WC
	I8PzrK+jxaoycD9GlPGVhStET9XXga++wyJxbyvkxcG81ALo7zcvBTu/xu/O1E+7iX87E+SVzD5
	Ek4fdw0yjep1DsY1Fdulo66Up+53PZvBIYDWCHeCsWKGTiHcvx+2FZXoge5Ti48kg+zPJ4G67AS
	3AJCforvgXz1hKXeHsAXXlsZTqmhN6rkbSA2WyD29YINeLneIuhsJcDFCxk2LlMP5P+XQ8SFdtv
	SuCBcXFEJoVFUTrpZY2SWMuVWWekLvRxXIyez+ziTa51PvCy0TVFmrNFuuznA4tokF5jDRt7m6U
	9td5/7bXTQpLSGZqZwF0VZgoEq4NohmyiG5K8HIhWrxcM=
X-Received: by 2002:a05:6a00:3cce:b0:848:4d4f:d477 with SMTP id d2e1a72fcca58-84c29310889mr9580482b3a.18.1784453657671;
        Sun, 19 Jul 2026 02:34:17 -0700 (PDT)
Received: from nuvole ([2408:8456:3214:35e7:8e03:79a6:7390:9fc3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm4022342b3a.20.2026.07.19.02.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 02:34:17 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: inux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guf296@126.com,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document Lenovo Legion Y700 Gen4
Date: Sun, 19 Jul 2026 17:32:25 +0800
Message-ID: <20260719093226.197740-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260719093226.197740-1-mitltlatltl@gmail.com>
References: <20260719093226.197740-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for the SM8750-based Lenovo Legion Y700 Gen4, using its
codename, elden.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..e1ade271e712 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1160,6 +1160,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,elden
               - qcom,sm8750-mtp
               - qcom,sm8750-qrd
           - const: qcom,sm8750
-- 
2.54.0

