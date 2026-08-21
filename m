Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAB4391832
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314759; cv=none; b=TGQato7PPtZIIUUqGgiA8ocA/qvwgwHe6m7Lgmluacqw3E2mXKHrxehntT8WRdrbG5sQW6ncVBxBEB0vHZ4YeBgGKNUsqS7hDiFukBewJeFCocdOwCYyzNjjdM00l5y6cypeeMJsXJMoEVgaw4QltsScb9sIEzoL3n0qRKkdkFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314759; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcSruWd+jbBH/CqtJ6IKPBxq99ZEUhI8VXT9m1GqXNYEy1X706VDqcrDupRQox2fuDYRu3IFw9HBUZdEa4JQv1PDdJx4p4oH2a54qMk9TfhLHv0IMDm7zwrOMGqiOJEh1/PqnjNxH4i3rl8VxKNsg4dp94scNevfqu/VqUV727w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i51hH9GB; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i51hH9GB"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so112758366b.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314750; x=1787919550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=i51hH9GBG06UAbjcFvvZoKxpUF1WLaz0xGL9Xsyb00KffgvLfmJ5ZvT6YO+gXLCcM+
         FZmxAtHq9MTZo+QEje49vThdm01JPhjsFzqiuu1+57EnToI7WX27sYFX6vt21JmN1OEK
         Qc0js+WBkskdM3YXyh04Km7ZkIfgEFVThcNINyX9/RyAaMXBgOBy81X9LhpWTGvYFM4n
         iP2iNtAjGYE95bUDMkiaNHyQ/rr5qktaT9uL9WJo5toYUc6Q5iGSH/fo11Q1SBdPc2HP
         lPz/CmJR4VVUV3D3TZSVARZcD/X6YMRFEYRlsQwqDMpDl6d7OiCb6jO9dZosAfwj0Y4p
         mi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314750; x=1787919550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=Uri5HfZS+TtlInn/uE9ECJ5wKp7yYGypsX2nx0UF+7JBttg2jCFC0+4SPtX04pjnpb
         wtA7l9HhT+kk/CeMgBSxIlAiG9EKIeqTHAAWbhO2/BtDxw0ySxd9Nddr4SAfDvUDEgM8
         1sOh4W1bkSSIIN12hul/adUAiBb1L+FH89oyMVW2okl9YrIYuPRMUOnEFx9Y9GNiUX5m
         NgDEEu1nCo7uqnUUPOl7E8T08Nn/7ZrlLTN7k6uVhCTzHwQI52vERB+okiCbqlBWtBLc
         HMUpOk7RyH/nb0UMny2nIbWVS6A/hss6j/CzL6jHAv7biTD73/icIcUrwmOUuZTRkiMe
         N3Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ZGY7hrbKT+CPl9t5QAkyLynhsFuUG1E4xQHgWGokz9RG4u3EbQUr329U5+icGk2uqbgcWCVFHkKQ@vger.kernel.org
X-Gm-Message-State: AFuF++nL7pVahMzvKU8Eh82giUcvoiIp+hebFx7g3vgdnJHUoEFXcXsZ
	cEPH4sY/TsLPnio0k+2htqPtlLQt0AbZlI6CVOlguptftxSJQ5digZTcm2ipfQ==
X-Gm-Gg: AR+sD139oEzmuO7No08rVTRRGO1hEDalo4cwR9HWYwiMD3R2LdYr+RY1Jn9Vtu9EKHg
	I2XPnBIn0dlGSO42IJoDHATWHxTxxdhGkMW169tQkx8prbZ1VToGNWTWo7fn4fpsi3jumXvDTwj
	J4ZB8a7FCWc7+V7hc7MoKLjextC7aME3ugl3LtMbh8+hhvtilxc2OXVSVz9TrLPOdMXxPhqmc1C
	k4fRQR6eDlXUIk5oyoiqj+St6a8Jjsb5Q2JztHJ3CMAxwCfGEttbqtnkRig9NDMHOZi4KsyaaYH
	JuyofBt6+J2ImgjdhyGlqPoRb1+bF41VyBVrqtgMVlGiWeZUSem8lifvOwMRpCaxW61E0/fwGrB
	+w7cTWxS1N9TKIIFMh558g+JPHs0BHeHCkP0sZcBZ3C3FH1Dm08eo4/xOQqJWi6PjvmMEr6GHgU
	HY+pS2W7ZX//B7mM0LUMAg7e5P0ItVJi3OPpVwkMUDWKP+soZuYwlkAfl1oJoMUKn3LU+dlhx3R
	WIVgt6Refsgnu2XFc8X5Thdz4jvC8XDAihMLQ==
X-Received: by 2002:a17:907:948b:b0:c16:6a42:c7d6 with SMTP id a640c23a62f3a-c246a346d3amr601838866b.9.1787314749730;
        Fri, 21 Aug 2026 05:19:09 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:09 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:03 +0200
Subject: [PATCH v4 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-4-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
In-Reply-To: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for LeEco Le2 codename s2 based on Snapdragon 652 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 289a3de1d24b..68542f76df30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
 
       - items:
           - enum:
+              - leeco,s2
               - longcheer,l9360
           - const: qcom,msm8976
 

-- 
2.55.0

