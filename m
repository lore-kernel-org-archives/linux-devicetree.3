Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CA453B35D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076526; cv=none; b=T+BPD1TWFgVoWxzkAS+3afLEuI5kFOWxcW6CgC5W8Tf5E2mHc+4jHgjL807uoblllqa1/XXr153wtnDc3nhNUbGRd1q/2S3vSFoBIDacc1oXiA7bEnpm1SL3TZ4w7EdGawGlc65QELtT12MUI2/JjWkD8J2OfT8w+mvWNtA3scU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076526; c=relaxed/simple;
	bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ah6+j9TBl/6/zRoIGksiiDHYP48DaTsKdjtC4HefqyAnyG+Nk/gVJh6NHcZHEmImaCIc+Y6Egk/Fd10Ck6S3EguuxNgygGVKJbpq73qRUEwXmOc9LHFA7tG/cAQ80TLL6dCWOCrnz/lZ9DqS6nPcqAnvP4cNlFMEVV//nxidRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbU6YrFG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbU6YrFG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so21835045e9.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790076519; x=1790681319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=rbU6YrFGbcjNEkfvefVv1fNf2f+5oRulBJQeyLfjyYn/IP/MoyEPatuwdGg8mfJgWO
         QoW0creJTfScZfE5h2WIETa5yMjxHFaicQ2S6Fdo3sc6atTLJqtLxZerl/3DzherM6Zl
         +OW4HbWQuWQPPS897xntWgGGg+sbh7DrYSmlEC2UKGzb57eLFBt84lvhYIzlxIKxFV9k
         MqQKxpCZg+ttyOO87H4hkk6K+Ti/kTzm1EVOdbGQu/XIqUeyHEJtIeyzAI1HAvW7QOJi
         x+wC9EatA3rII2FiEMZ45c+kw2BoaNuwFJ+L+F+7l7VCkHmUQpvU5tDGUZAC4tYEvWz8
         CHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076519; x=1790681319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=DXOZbKFlmhiltIkmC9MoFt/1aksEALZtmqSRj/s6MRJgKmcejq6NWj5AbMI7MRXCRs
         ZNrhguA3Hzau3R7kWdFi/ByDUBvW4HVoAwQS7A+FxvIVYhrW37Qj8FBSKu5zjTD9cTiG
         9H7YkcI2wOC8X9xF/+GSAudeErRxaE98LGwdrHNSBoPDlyjLCZt0cApMspDkEaQWkM1c
         BFQDOZJwTlDKALS2ae4uFz6Gapnwj27uzcXGpoxTP7HwF1Nk/SYdIuYznZP21jmHRhuq
         RGo2zoyxpMEFV1TDAmCCuf4j/+tEfnq/l31wZa5JDmWNgax7oQ+rm8HyYGquD5XYVBqd
         11vA==
X-Forwarded-Encrypted: i=1; AKwUvBw1wcuEb3u+tu9hBJNQVQSVLI19D7rw0BUapjMa+qU6Icl+gr4kycPkxwzu4tv3HHax35WyhnoHDwGB@vger.kernel.org
X-Gm-Message-State: AFuF++kBnzH0xB+s8TpMZOSK5YPJbAgW3Sv4M67xDrWGDEALALQ28M4W
	OJuEaHKKkjWk0TMXDeZMNYbiB3K/5+a3Q2+2wOaKXemnEPWrRqpUFxkc3RpRGXeM61k=
X-Gm-Gg: AYBFou1RJJdHHn9otqayUfP1umcXU+tCUOqIexLLo1K+jERKOJfKBkcJ7krREQf8Usj
	ocO2eElHrTSLUVe9DB5mzsCf8/Pcyfq0VD7qmnPBhq8d/ebQxw/EKDNS6hnHR3/llVCH18t69Vx
	wvTma/Xy/Lz0LwAwxUNml9j628Kj7XaWD4r0Hq7AABzbEdV6ZXFg1J508unDqdO07hQ5UBJUro0
	dXQ1wkQ6nZ1EVoOyzeh2OagDwS7SeAdmzQ6pSbLTZZ3JhRcMqHvvzcMn+sUiRD4kC/1tgH2Nzev
	4PWk1Gf+NATFunxjXU9v1mfyAz8KwFuOp4L5SOYgmzjbdAvUmRinhhimVzLpeObSL+sdJakmVjZ
	DnM91vaG7jKE5od1uUGs9WfhsQ4/7CKHy57U2JnaHBDsskyUqEOUBoAn2IhjsySMCwj5/Uhq/D8
	RDslFJYj6Mmcq6X5PcLhokPim0NL6TmDPyURVp40xEU0BNVe5uzkAsEp7wxRJECPPCutFvMwD42
	peirQZOFSMy3i0rC6s=
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr248984825e9.13.1790076519490;
        Tue, 22 Sep 2026 04:28:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm6687485e9.3.2026.09.22.04.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:28:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 22 Sep 2026 13:28:35 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: document the Valve Deckard
 headset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-topic-sm8650-deckard-initial-dt-v1-1-c25e7759d04a@linaro.org>
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
In-Reply-To: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsmZlyJKDWoV2ssgh24kWwz2H/hQYohfE8pwcdwwS
 59II9b+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarJmZQAKCRB33NvayMhJ0fIlEA
 CsJCKN3Knnm5FXJGJ8YaA84ahFOOo1s8QDCQqFythWfxOblnDtLd7HvZyGyRotxb50HCXZDUIz3Got
 ebTqZs+D9jzUERH5lYO5eDq226etSqv4wQNJxqCAqfue5tdeYXhr2yyeJe29yhDejz0vHfSdYCWdcN
 GiG5qvhVzUYksSEutSnDFW/elIpBkOhTrQfJoA3VbGWgi5kiQmEyJ1aGFSTFBnvqXqOZgYJYraawGi
 nYHwLz3+kD9LtG4Pa4MZ5qw/fVVSvlSSraSfHZhhv46xMiEY25rOr1Wmi9Z7yR+s5aisZ7o1Dg6M7i
 MR9d0R+JjoKMSvThMLr2XR9oY3ivgOwpUgfZAA7B3VejWp4g8kVo7i9cOzUjV6YrQNx6vwMSMOcEXV
 7DNDifKRNG9gxXR/zWgHa4Jjs3Rz9b7jFJ1retp3veE9UJXmzu/LFZSrU1iaHG1nMWE2hQuvRmfw4d
 hKZTuiGxMI+9UKe/oTzMtrsgFmEYjdNxGREEharOs+I14umUUvjZljz7pI7IzjEoWEXTAI4Szb2+Kj
 GGp3Y+wQEMueCRzpwWhOkrWPKpnYac8EyvkfGiWAB7SJ+VVMDjHehmACF8M/Bp58f3pore44M1ITO7
 +900hzU6EZX4+Qi678Wng/Lti9pGUKyyiLW+H/EorD+YpavsBJNfK6WN/89g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Valve "Steam Frame" codename Deckard.
The Steam Frame is a virtual reality headset based on the
Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..0130bf93987c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1164,6 +1164,7 @@ properties:
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
+              - valve,deckard
           - const: qcom,sm8650
 
       - items:

-- 
2.34.1

