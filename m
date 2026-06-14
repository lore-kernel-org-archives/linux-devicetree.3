Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388B386423
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442414; cv=none; b=b4dxJDtCVE9q/znt6MLLe16ZnSkUODFAWfhsre8SsBGXLgBgQpoTnxok8G65hrDoFEFf+O8FGu0LMX+mFBltA+Sfzs/DqVHC+n9no8BXXpBEU8WFCA+Bln+s2n51u3/cpkp544oYRBfCoGXl2ecTQbV1Z2unqDUZQuXKLOTlSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442414; c=relaxed/simple;
	bh=745xk+d8bU62cDW9chGbuU96+vAIrE7f3vnioeAiqf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=almPNXUqwpkQoXoyuYxWn1I8LUNxFVNSVNWBfW9eaCyhb/eqfdccUCHfHt5C0yc1HVR3bSKL743rIUpRjoNC3hCKM3LRJvyr3ouMAwbfuP8KsXEYla/QYiH7IuQLKDol0s9pYFzuT+5fdVvX4Ex4AuR8YORwp7EF9sG0Dd2wvf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=GeTEcTb/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="GeTEcTb/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so2488549a91.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781442412; x=1782047212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zij5vWCaKi9JF5NLKqK6c8ikNCjMvtbTlKZgqjFTiHQ=;
        b=GeTEcTb/u2rg3b7QArOQEJEO7oGrGHr7a6XrqcUd85PunLkVtDgjL9OxtlVlFfPwu6
         TCGz2pu3kqg8sw/UgTsLcGa2RomWplMPveL/oiLugf0yegI6lSHe39XcomJIxQtMjafw
         vCnm3+uYQQqVD07rFuSr2ZsEB6weDWhsL6+P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442412; x=1782047212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zij5vWCaKi9JF5NLKqK6c8ikNCjMvtbTlKZgqjFTiHQ=;
        b=KlCc+mE1Lv+bTiWgeNzJP+0y87l8HHi1R1gZXHI3trUFFw3csbGgZoV94h4xcYs9hQ
         ju7x8rpkPfRLnzNugUAXgG7xp2GgPa12ECj73fHP9JqWEQiXA2G2Yjm+xvhYIvDbMXgB
         9WvfSUdyR7TLcphF4Kck9p+DfQKURPtlwTNqUPEkce1qn+32Jwif0uCw43FOO0QPQq9i
         sb0J+PhN9tg6DuVWHc791c52ngsXHyIKFqtb3R+3B9qU7v7BxOApIrRYEdshTuidGZQr
         nfwHd2M5qMF6+J3QnfJ3hIha2+woxeZLnpLMegh5AkStL654v/V5M6PQ7jYMRzwsvH+n
         MumA==
X-Forwarded-Encrypted: i=1; AFNElJ+6013zhQSeTeYJiJszAxUZpsfx6MYuuDae0vsgKesnekKHETfQxRXuWISQq2y1AxXUOisa/5wP0A73@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7z17ITZNhMrTrynPrzp4GMxSGP+66LgBTTaqHkCs8AlNsgBC
	/UW894AM8iPInjgtN8fcyaQrMYlJJRne0QCvFuYQrAUIGVjqlgvbkEYEdPrND7DFn2z2lSGkTnp
	CY9jLw7RX/Q==
X-Gm-Gg: Acq92OHtmMGEIv8m6lA8swPkQRbJVc2riC02K6PM1XZddEEdTW7QRKQZon1KHIpWUdJ
	WTxYR3/vyHkQvqXruhjIrcr5NjQ0Sbz1iTHW1iDYKX6tQHukjFId7+y5yyfQ1GhVzCXDGMTGYVt
	luSjUSspyc4n3rPBsqg4finV4J2Ly5v8sL45kuG1bdDSqbCeQF+UgrzItyMGO9E96h1jvc6FMdf
	PKDOATliOWuX66B3tmcuwiHcvO2SEO5Pu7ahR/ceigy/JzXXKfrum/uPbz3Sbu26HxuwFYB0VIE
	HaNhFk64RfFVrmCJjplYLEEATHpq/6M9kGapYpxWvX9VhDxwClDsVqZDCijSkhmOd77xVY72rpw
	Mp72w9Yfypv2qCXzMKDth7q9+op3PnE1OzC3liX8HHaCnqVV130RPeLRqyLn1+8XpVaKxIJs/kf
	u4ZQxT/mUgu9S4KHTiuZk0OiVSWf3tFUXu06jV0ITXnHyVmWZUICiT4vOnyBXL542DEj0UCuzdd
	AkXna0ftemamjmuW70qV9V9FhF7LAYD7xA2iKXRZ4yzPYpj/KfxEQHcZLKytfqicFToHr/t4ObI
	yCu2/TtYYNRj11QMv2vvoI686eoPoU0LEfzMXIeRK2KgAcGlzECcFPTIfFG0Iw==
X-Received: by 2002:a17:90b:1808:b0:36b:bec8:94cf with SMTP id 98e67ed59e1d1-37c2bc87071mr7283647a91.9.1781442412426;
        Sun, 14 Jun 2026 06:06:52 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1c4abe46sm7758344a91.0.2026.06.14.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:06:52 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"Bjorn Andersson" <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v4 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
Date: Sun, 14 Jun 2026 21:06:17 +0800
Message-ID: <20260614130621.68811-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
the fallback.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v4:
- add reviews and acknowledgements
- updated dependency URL
v3: https://lore.kernel.org/lkml/20260526112409.66325-1-daniel@quora.org/
- new patch with DT bindings
v2: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
v1: https://lore.kernel.org/lkml/20260429103301.17449-1-daniel@quora.org/

Dependencies:
https://lore.kernel.org/lkml/20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com/

 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..813d41769c0b 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -20,6 +20,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - lenovo,yoga-slim7x-ec
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
-- 
2.53.0

