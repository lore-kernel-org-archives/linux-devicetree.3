Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A3A272E61
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195089; cv=none; b=eYoeOs+33A9xt+Iz7hU2gbf+eX3QRjJl69YzT11+AHls1unSBeN3lnS2Jf+bGEOnl/yO9iyS3srOk184w3Ur7KYFYeBz5/m4WK/Slsc5cgsz3W7tRPCLFkwWf94bN381iscBP1Ij/umOpooHyKcoRx+lz9TsO3NXf2RBKW8B0SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195089; c=relaxed/simple;
	bh=N7hywudL6zjyva2RxgQstzjNTfqkYhq3ISbleHrUEPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXG2eQs8i/uKJORsLuAMqR2vIstvjRq1cYMUbDZElWTRpyXlTIIgxO4w84ibf5FVZY/dhmkuD8Irr9YsAK3UClkw+ryyyle8itvrKIr8QqHr5y5K45SgA+55uugGKoSG8vBQEwbACv7+TmsDoAV3TEPg3weMawCpmmCHnDs7k2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=gein4Ype; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="gein4Ype"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1775195085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=66pwrA9dgDiSw/0z2fygVNRM9nXU/lnoGe5zoMWNmhI=;
	b=gein4Ypet+e9rxovtLCkCmLjh273jvNRLRlTH+ah51fsBKezeA5gqH0gu9kT2tyTA5ALLC
	DuFwS0sN1vfY31OyllxHiCAqiZBmAcU1P0I1YctJdkclFfO2hfeRC1H997LozvL2t190nB
	m+FJTHbuVJlXFB9Wh3Xup0WUTwB9NUa6JxSRDNnriJrZcVFB8snJXKnZXfv1qDU/JUr1NG
	MeVu0OBZ2VphFdAOZF5p7fFGjl2pqcn6gSufwnKYbGnJrEg9X3kldzQdj5iAvrNkrVL2gw
	wQKYgWTal1IBxGkSTJ4i97RbINbjvboGwFhJweZ/iACZ99B3/ja7m0KWhDbKkQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
Date: Fri,  3 Apr 2026 02:33:08 -0300
Message-ID: <20260403054417.167917-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Motorola Edge 30 (motorola,dubai) is a smartphone based on the
SM7325 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
v2: Pull Acked-by
v1: https://lore.kernel.org/all/20260329103055.96649-1-val@packett.cool/
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..58f1621bb855 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1038,6 +1038,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,dubai
               - nothing,spacewar
           - const: qcom,sm7325
 
-- 
2.53.0

