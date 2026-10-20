Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506093;
	b=dS509q8sedy4jORHH8lzAUxNPF/X10IqSTnr/dkdvmpw0KPPwmhPMor0spAdxqlLAz12
	 dTbOe1xt20uUjtJjG2bCS7sjKF0IQrfPnp6onFFuPFegBLDpJbevShXcgUNL1E3ZHHs3O
	 31vZuC9byKoQzOIzf7MF/NOrKhMbRduc273hAAg26hqWJZtCWDW+fZKGF1aP9FPTuYggT
	 sbZa0K3zY75alxlz3NWSFs7d+PaA/TYk0dCzJikUAwCE93KgAnueMFN4JPtv47DSDZeVe
	 7ZVd2+8FYTZRH5TLKQk8liMlJ7Pc+LEWQb8IJlujGlh/0Sa9fkQZaiU9kVO6a5OvGcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506093;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jlnB32LCHA0I4qZyo/tYM1nPEXySNpUnvzRunyvEwr8=;
	b=wRJ8dm6/vqkFLxC0NNyMxIOLu8JEJlljUlCbz2k/y/RIEPsmYqmFU9qFMeCIWVV8qzo5
	 KBLY1yqkPx/MmHQ5QJ7ftpqGob4aWCa71byehYdAfleUSf0B1e5m8bjr4lMPNyy6E2iVS
	 yMi5p1ToSDZMoJZgfhnjhsD4Ft0DKI4rVwLzfJKM9KQWjNYqDWmJTcg7mwDjIip64Mku/
	 h38H/1RMS1pnGW9P7CQr/mbF0EI29hvsYI1Lm6BMBdT8z607dyYbEoszwhBm9ypx3NlW/
	 eiNbPepjJwOmA5Djluk99AEcuWcvl0Y4A/Pc94w90p9aCA+r+fclVIiQoVq76/S302Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=fZDhVZdd;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4E606A329
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D4E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=fZDhVZdd
DKIM-Signature: a=rsa-sha256; b=fZDhVZddI8ceOsbg37CxNvwy7s0P4MyzIL1Ta2ICf18M/0nn8LoEj+MMT5G6R/PLzwNMdT1RZEIjhgdVs1WkfJK1peyFUU6ykPZRiDr6VuKsn3b7qKUIY1FgDuvt3ibD8cOpRCs3MSr4DdRLihhLrNe1TkgOumpUniYn9TICriK+IL0w2pG8S5W9vtpyYHywMjvd/UjzwnF7ucz+Wl2aD9oI55ZwigngTiWOxENgRmbO7pdn5iL1WAV9MKuxUyAZ9V3QtgS8xQSq/djsg1MKzsZTsYMYJKgIYCeewQkP9PCiYeQGI8TCA+fQAOz8/JpqMmkfYCYMwiAoNo6fyyI+zg==; s=purelymail3; d=purelymail.com; v=1; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 913581972;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 20 Oct 2026 14:19:40 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Tue, 20 Oct 2026 16:19:14 +0200
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
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
Message-Id: <20261020-nezha-v5-1-04898d6b5f80@mentallysanemainliners.org>
References: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
In-Reply-To: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792505977; l=1043;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=;
 b=8RE9seNC8ZKynL4i1jgbC3wPaJJhVoBvvg7LzPZacv6zSa5EpE34bF3l78kc3TqB60Rdrf4p6
 YS3fvyyWEOgCqzI+i4KlrEQeDunIpS8A4THqgjSt2BWjkPaW2J4ZqmQ
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Add compatibles for the Xiaomi 17 Ultra devices, consisting of the
EU model with a smaller capacity battery and the CN model.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..6d9e6a81b419 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -173,6 +173,14 @@ properties:
               - qcom,hawi-mtp
           - const: qcom,hawi
 
+      - description: Xiaomi 17 Ultra
+        items:
+          - enum:
+              - xiaomi,nezha-cn
+              - xiaomi,nezha-eea
+          - const: xiaomi,nezha
+          - const: qcom,kaanapali
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.56.0

