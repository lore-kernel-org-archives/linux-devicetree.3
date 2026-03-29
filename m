Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B102D5A01
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774780291; cv=none; b=qPfWQuUNOsmWe2NtgMCu6wHiuXnQzDh9XddQhonw1CDfiBjCY7yg6U2GmYTv871uHouXlqD2v5ytFypjEEWI+IzKxhBImUVo0d9xwwIu6l8taJA/0H8HrDNGIuWEdrQhGAgWzOOYKZXikFWWYqEjqQPwrnHZzqClJzuWaSPgDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774780291; c=relaxed/simple;
	bh=vc4G9ZHUODvdpPo/QPGA18D7VElWKAOlgjkWMaDVmNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A6u+5h09zeEe8q7IGyXuPmmItcCtlWU2Wi/6BQBwQYO7y/XzMbRuTl+1ITmyawCbnyrk0O8I/lwz+knlcei1Qmxv26vpMDCvdv7o3oJLdNCIqHFc7HzNRHIqIDVrjHeCsOvojZDVNVMC+XQyx8b7JR4V1loZcEtcRF4ArAySJpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lHPfex6U; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lHPfex6U"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774780286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CFAKJAB4Aph+kt7HsCig5cXi/YZzAEI5065gYb8udqk=;
	b=lHPfex6U8xdmSMN1wJisxKDGw6XLcKoo09RxSdEm3Ooqi1rBnilIlso1tPt28rpwm6fRt8
	A4zxj2mSuRSwlXORUeniFJLW9bos46onafFnCCyokDwdFps4PjwEQYu2H3rJhgdHE9k4Wg
	4Vg/2nwpongniUAQV6QVjGVWXqvZ/hMZblA45dxbrtXzXXikrfsGDb7PMEsSJWZ6otzrrL
	SDunog3py9Myp8adVEiD52XsDaDFNKHicrRkJ0gzvLn4fHN0HR+v/jMf84P35ZfD4gfA+z
	3Hqr3ZBLzN+46xTg0VeOCnJOv6U4U+uMmCy3kJOs6JVy7xyK3KHM3+tushro5w==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola edge 30 (dubai)
Date: Sun, 29 Mar 2026 07:16:39 -0300
Message-ID: <20260329103055.96649-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Motorola edge 30 (motorola,dubai) is a smartphone based on the
SM7325 SoC.

Signed-off-by: Val Packett <val@packett.cool>
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

