Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89125414A2C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501416; cv=none; b=d8cBPfrW2My6i5Pib5S7RfqewqaS/+/X/SwmlvDKNugh9A/QJjMyWuaEWBx9/i8/OcJZGcAUeYRMoCssOi+g0hSb4QfDll3thHyOxYnHwEfdlwfd8GRm+ezZ11ohDtU4+9ouP0pTB+D7HXnk1gEY8VsUeCiI50p5W7KwMKticnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501416; c=relaxed/simple;
	bh=Uv4Ftzy+pfmd4rSI1jdfh8oGUuCq8Mla1mYTsPyoLK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jgS1VF0KpeFaALs03GOPKsMr4fkUsuhBaN+x/8guY9LKsjgLEkfnZmnZIN3dukqMKa1B9hiM/OELNBiJjE25MoqgythRJ8LIHuAFjTJy59XQ5GcHz7NcI75rz1u4RkKt2iSSv24xgS4ZVtZZBgmqndU3Cik8mXEh2b8ye2BuzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdSNHqO+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdSNHqO+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso587224f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785501412; x=1786106212; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aHPCW7QrTZifoRdq8eeL66i1GHgUMkno/jbs1U+f7jw=;
        b=RdSNHqO+o5uGw2XfbJ2sdwEvn/TCs4UgajBCG7qADwVWnOao8Eaq7PKLSuHw/8xZ+B
         hb4tptt2X6ofrnc+tKsDkLHI4USuzklLNgI5rzJwkGyRZlVOCZ2+y1vs7FN1+RhR07P9
         +h/GJ+B0F8RPlIStUd4MIhyZ8BttkmgYa/tB00eMdrSL9b3IH8Go9J6KZCOj6ugVmpXX
         4ujZ9iKuZ+4mGsGX4USvQ7MEYSU7W/tPcohopr1gE7NqNE8lAHgrgHoCw7CTAYJRbg2z
         NPE/zPTIgTl7BfSOqw5/NZEayAI6NqEtygMlDWJpVLIndqpXMv9SVi5JUk8XHpXPNApc
         /qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501412; x=1786106212;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aHPCW7QrTZifoRdq8eeL66i1GHgUMkno/jbs1U+f7jw=;
        b=fxuL22ElPYEq113hL8Q04pD7HnFt2at4jx4wp6Im5FDos6RKbYZYeTQiPYc3n4h4tT
         cRDRU/G5NMbA3ABC/Mkixm/PBF+wEHM76axpw49EBDX7DU6jKw0jKMzo4mKOhZ90AZLi
         I22A7LNap1j65di0ZUrm8ta+WGGR8OorabyvwaQSOa8f+GJpuWjUCtaZ89FpmMmL27op
         QAvjBFfNuitjAqYmNzyEj1jw4lJRFQilafyk6MiW86oR/w2qT3Z/MIkbfSf8qYYstKVg
         gGbSxTSOKfX2vbXFc6yvy4kiHmLOCUycc00GqnlVcnrwCM4CwU6OnmjeUUDiTnJVAupj
         TyLw==
X-Forwarded-Encrypted: i=1; AHgh+RoNALkRb7V4vD7VLETndbgRMxfySSlxhJ4AWXttK2UmfPVX7mkUhZpxbczmAFfBlZb/0FO8ivH2+Dsn@vger.kernel.org
X-Gm-Message-State: AOJu0YzcB0LIBJxpHbnDQcCE0m7jVIJC77nfUYzTaQJZPcCy9Je4sTNC
	PL37hN0YUvvnNTLZShhD/kipgU2WGRxZRFazhaVWfYe7+l9VPSJE0Zolpg01ak6QX7A=
X-Gm-Gg: AR+sD13KbqO+eQ8OjHLtHEgb/CduGmvvmHhWPdHmUj1MNHzlOTL60b/3so13ZyswFWJ
	+y9bLawmZW30Lfu/Ns//wX9hAqZiXlG8I66Qn1cfHErjVoBXZGjuQDT7UKIhuHoq5seT6Zb7USf
	q74nGtQ6Y8htKnPuVOubzkljvvIlnowvilQRRx73Ryzj6r+BVfMddyDOQ1Ovqg6j5pGQEwst4uX
	uEY+H8oZkFBEeVETu5eoyhb7QnaEZP4P0ggNGfE5m2IUCj+liI5JrMc1MPsL9rKWgUcYHvn8QOv
	GqGdMv51iLjcM8QuA+ao9U2CsKJyTx3v0oE4ubolXGL08EsrWNi165+8M45lxtz9SRgwbgzAUTi
	uDXcHHyNFsiTK66cg2aLpNWI5BL1GC8D+FDce4JDGQwwWpD1DqYw+hM26PC8bTgyG2cWItWmD/P
	6I6bjDPu6VUmpAEU3tYK0igIfxMx2ytoy3uqNlDkTkRiDJ6F6Ab5kIiY4D8xvRHYYt/+OE0jbcK
	Lzbtazdrg==
X-Received: by 2002:a05:6000:40cd:b0:47f:6dcb:3737 with SMTP id ffacd0b85a97d-47fd2b3f8abmr4259971f8f.29.1785501411887;
        Fri, 31 Jul 2026 05:36:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm4457262f8f.8.2026.07.31.05.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:36:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Jul 2026 14:36:49 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound
 card to ayaneo,pocket-s2-sndcard
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOCWbGoC/yXNywrCMBCF4Vcps3YgSbEpvoq4SNOpjmISMqkXS
 t/dtC4/Dpx/AaHMJHBqFsj0YuEYKvShAX9z4UrIYzUYZTplW40lJvYoz747KnRfFyhiiv5BBcX
 gW5zBiT84FrQ09NZpM7Xkof6lTHXZW+fL3zIPd/JlC8C6/gBUlCfbjQAAAA==
X-Change-ID: 20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-7eb87a12f3ec
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Uv4Ftzy+pfmd4rSI1jdfh8oGUuCq8Mla1mYTsPyoLK8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbJbiTjpW9UHPd2POKTYML7jZQbHVCmgCQjWD6Dgq
 kyMaTxmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamyW4gAKCRB33NvayMhJ0UxsD/
 9WlfpxCZBc7UK0ep0xLN43ECEwFLDcai5s0tm7zydq+5NO1vQceFSw1QpUBQ3B3I18aX7nqYL8ce9M
 3tZUnnb13DswUfumttxbsj8JuUoD9OUCuVLoES+NyFR8USqNZf7yOZYTn3jCOCN0d40CwnJICmaFJA
 6/vSEdq3wZs3Sw1KHHQlCTegpu/EyS9N2V2crrmT0fUj1II8Tit4wxqNcmvFoKItt8tYy2zJ13VMnE
 P0DMMc10n+cveiVBKVyQdbLKmXFddOaxal0m5XrpRylPcztoei8ELh2c8ZImegwvbW2eK08zyxzF50
 She7MA/jE1SQMDO2YFRFhkKCQgmmTgiTmkH/hx8N55NyzCLhY3miUcYw2bPXNbckPUnYXDyBRQkay0
 +RQlkE2mV0QvDmnfKUOLbdR7wbaklGw3YB0bQcJDd9q2252o29SXtoqmXLJvNHzBCcLxG9WGO/0WqS
 ZOj/fR4vmZk7yV81MdMC5+mw+Y2gC1/tvopJgAV2Tv1eigIyoKzFy2IOeC1p4NhCb9tyZVRNhHtOmx
 MWJwjMnQUsM/p7Rm1RqWGb7m50yfjnYipUX1un29E2JpLK/GWr8SnH+KwGewZza1RtEM6O/09ikua6
 UZ4M3q3/uK3Wp/8J0XSL16IRfdyv1unE38/aoopqHtgN3r23bhZsEanXQA9g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
of the WSA speakers on the WSA2 port only makes it is incompatible
with the default SM8650 generic sound card.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
[1] https://lore.kernel.org/all/20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org/
[2] https://lore.kernel.org/all/20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..508d1445bf21 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 	};
 
 	sound {
-		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		compatible = "ayaneo,pocket-s2-sndcard";
 		model = "SM8650-APS2";
 		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA_SPK2 OUT",

---
base-commit: c50ed4627e333934aaf0473a822169786c83dce5
change-id: 20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-7eb87a12f3ec

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

