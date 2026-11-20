Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169463;
	b=mcLHwTIY/Oi6rAuU0QKo3AivkV/lRgIPfDdbRere5FcaVPDia2eMhS1dU5fvS16v6eCt
	 WyDuZhMCELIWn846jPAGzMAVFOcwMe/QXNAplOC/iIC/mgAZjQbwSwdkv+JV90Q0jDln4
	 Y1WSztjx1yAVd00w6Rep4Fw+OQZDoTgM2sAjM8FNuIhyn8s/Oeg8Bx7CyTUeTWPEp9F5v
	 h4P/1QnlFpD2aDwN0fHPorQ9IKE0y0lGTghPdmaPa9JwcDu1j9Qpuzys22NqNhio0N7j4
	 cts+jj4nadho/JqhYgR1k4E6lXsZmmXyaZEs/+Q8HKBaVRq01GKtQzPSJvuTf7j5kVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=77Y6wCFIm5JVasGrpviwvOl6CLOgdvUjRnndLUz4fyY=;
	b=04RT3B6BvreDLuULp9wEb1VqMQcOzOMN3LTEDnbqsQCV9WL4LR7To8wA0mEA03VeZ1kw
	 193+ahQF5Yu1BoDeOI7a4b581SP3YnECdSkE2hQJH4Xhr4pAVidvHiuJHu1igcoFnCN48
	 K3jZVNcqsKRme4PxiwqVfwgDPWW5bdkWalRBMDi9OD0ma7ccervYBbkTYssOo/yG//yJ9
	 /cOcoqEkmi4rhVyrivpMaRXK3tjUCshXpeJoEoE+4Jq9uYJEU1DM1x/wU/Md0j/1EYR9F
	 FBgbZt9kJ40/dIKuCsBDI4qJwfLOxLFS4jFLUs8eKa/GcP2wgyy361vTA8G67F49hKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CO6t4NhI;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0F606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC0F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CO6t4NhI
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a32576da88so360359f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169462; x=1795774262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77Y6wCFIm5JVasGrpviwvOl6CLOgdvUjRnndLUz4fyY=;
        b=CO6t4NhI9pSu5IH5Odt57PBc2QqyJ2pJZfxyy0Dj6ZIGBONvEhsawyagR5JNL5Qv+Z
         pgTTvgn86mDaS2krR17lObi867gRkhZp3+JxZg8G/gUtDZzh9CgYFLpIyYAQiqhhGm3A
         tX1arzX7dAiy54GoZqE5abgP3lx/ISXC2wV1Y/7+tLmeashF+q6FjfXSr7G/QSr+fDGc
         DE7IQCOigASfAP1rnek2LXJesyU4YuWSBvSWyiLEb8f8L4jywW8NYjdkxgSOrXjTZe1m
         DYVkAQvKVix36mZ93xaJNmKrq1hmIN2HDqwd+rX4Ms7CoH5EJnTpe5R2JWwVZxVBI18v
         tO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169462; x=1795774262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77Y6wCFIm5JVasGrpviwvOl6CLOgdvUjRnndLUz4fyY=;
        b=HlFtZ075Bar6GEq/v9PZPkRj7jLy6kTNfFY1O9ASfS0Hrz7F8WKx6+moVFG+2vVKPq
         Ew0J02Mf1ojKqq2T3EXo+Aouo5WMV7nqFYt/th00E3BE19ZzqUt7NSKyHNE5BMgOdKR+
         elgdGEh7qNP9hhF2nbV0mk8+TqbsQ133Gw7ntcrt6s/9xbj9urOWyN/m/9h4rZwVVE9H
         fI78Wg79s4uBXuQvVVG/HN+uuBYkX4mDNjCjfg8ph++U5Xb579XHO3j73zRmLr3HST3s
         EGRMFC2MIS6+HWpthRLL4htGG+8hbui8mBuoXtc5TarRft+WsbgG5sIZzul3KYUMuuXJ
         pkFQ==
X-Forwarded-Encrypted: i=1; AL+hErE5tmgHPrUdhdtypTthHh6l/2uAMPRGfnjRVfcIr3AIAnE5qe35tkDqM+EoS7c4noUtxkl/IxZhFFco@vger.kernel.org
X-Gm-Message-State: APuU4Z/2DrVKKR7ffAqSitmQP8NNgk4u0KUjasptyaSlYRHO/ufNWH8O
	xSKHSsLLPNS8Bb3tR1Gj0vcl1dcmzSSh4nceuVB3p1NtdD3Dle1sltgHdKA9+fGkdPA=
X-Gm-Gg: AZFdTZcJBJpoapqtN/dY7CCXzXpiZg18PKvi9EYZmu5omDw39WumrrRmAvJUUztURWX
	lOoSBU3o6Cs4KE7F+Emy0L/B/vGgS5rgBa7AVqTWz5pY/A80/IGGtP4LiKF/gdO8jV22ano+a5+
	mSgNyfnUt8H8jA4kTF+zeYoBOKT2Ck1lsGU7WjDmLXCcvNuJIWGkbIbFKcaCu1Fo26YSk8Y0Qo5
	DuDTecqZH3C2roLnMmq5tOMHFIX7M2nE8yLiTVwAL35QvB5EtCJKcOfEjxvV1szjcQ45lH0twOK
	zXQRFxy4PdJ74PdKLr0dkY0kr3XvkSyqU0iVMqXptfx6Yk8FPZmhj78t/Q6KZQ5trkLmnlKdetL
	G2hI2vRtDHVe3rYBRoO+FbMFXI0LWhZRZjDs3Z1SWIwykqqasr5qhmgm8Um9b0Kqa/1PqqyDc3X
	E27wqCqxwRe3AQf1KifPbL6b876182nBFii9o+rmTDa4dumlJBGl8xF3rXsVV6NX9yxTOHy6arh
	BiT0AkYiS4ezW5fXagVENcwioTKXjKNfLY2ji21Y5aaxYGDSjCQV1uaQ4J9qZZ2DjngLc5JdmDL
	RwNQVz63Gbcr8dDyxGP1WiImxi3+OTnWsHQNfKHJDRLX9stbxJ+rIdeg4qoD6dH+0UILe6wg
X-Received: by 2002:a5d:5f91:0:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-4abb386134bmr4515258f8f.18.1795169461730;
        Fri, 20 Nov 2026 02:11:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm4674937f8f.47.2026.11.20.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:11:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 11:10:58 +0100
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator:
 document PM8550B
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
Message-Id: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-1-bbda7b708359@linaro.org>
References: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
In-Reply-To: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JIuEA4RHNSlujYvUz526d4e/oGx5qwBBNKR0d1bBZZw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrAByz3IOuTymsiScexI9P+xMpgJE6ntEMJA78rVsc
 5lWWP5+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAcswAKCRB33NvayMhJ0UgND/
 41kAAhaX1hlyfG9/eeduUUh3qb4A8SWhkNQrEwNjo7V8grfF+VuGOIorZnwq1ddz/J4+boVt05xxdp
 UZL76HBgjqyZxvFYC63l2bK/LLrryrqoi53uKqSWNm4H8VK7s7sgj9pcG76iLHjUGaRT6G7f+DOsT4
 7LLvU3jCqmIp8smJ+qLmczo6zLj/aV/IKoZFgt6OF+hsrTe9mf0nZM1ah//Nlf5hSFbpG4d3Ilfy9H
 qyqRsWBItd7jux5Vm1agFrHE+kHl8Nixtlw6WHl7BbziWNMo1pxHXEaiVBA9heCr9yyyrmKNuIbFv6
 QqcMzKTqmnXQujCRkRh8Mo5RlYcfURdviuliA9Gkphc5YnXkb/S7MXoakHN7DVGyb/Lv7sSX4/EWkg
 /pKQeko0H2rndrTGdW3emGC/B6AW7cuW4eTQy7SfhW2fBqOPFN88vE8+hEQvb/J5ICVD1iwoVog/f9
 H3p2iZSxE8HUBNuL+6hxDQkJpxxbcYb9RtR+GTBxkllyC1/GpPYLssmTMAGo1JhdXj1aeT4wyzUD6b
 +gLjiFxOaAFGHHSes9jbW5fS9ZKfRv5G2OtuccIBBXeCrdQuGMBQ+zZFfp1YuaIb6Y/W3l14SlQnKK
 K6komWr1dAD2Bp5f6lfJH1slpE6Kb+me1cCEdz+rpUv2dneO561hTK6M76ww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the PM8550B compatible, without fallback since the layout is not
compatible with PM8150B, with an OTG selector covering from 1 A to 3.5 A.

Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 024b34d0eb1a..d3c706182873 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -17,6 +17,10 @@ description: |
   The pm8150b variant uses an OTG current-limit selector, supporting limits
   of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
 
+  The pm8550b variant uses a different register layout with an OTG
+  current-limit selector supporting limits of 1000 mA, 1250 mA, 1500 mA,
+  1750 mA, 2000 mA, 2500 mA, 3000 mA and 3500 mA.
+
   The pm4125 variant uses a different register layout with a 2-bit VBOOST
   voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
   and 5.0 V.
@@ -26,6 +30,7 @@ properties:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pm8550b-vbus-reg
           - qcom,pm4125-vbus-reg
       - items:
           - enum:
@@ -46,6 +51,7 @@ allOf:
           contains:
             enum:
               - qcom,pm8150b-vbus-reg
+              - qcom,pm8550b-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg

-- 
2.34.1

