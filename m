Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966B390234;
	Sun, 17 May 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023665; cv=none; b=T6H1KpQbx4crBUcrzibes1WLoadN6FxIUBctFUL0HrXy9Tua2ch4QYQXy1PkbeLBEIh+IGdETTRio0e+8sJa+pIp6BZx8CvjGPIOcLU5LyqvgOG2+mDhPaHX99Qy3P73XccoOVluPUm//UHA8T9XTiJ22UMmfO0GxZl/25gzhs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023665; c=relaxed/simple;
	bh=0JDKftZzllRx57QClANlVptlc3OG+Um+N/I9UT2bo3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oV9JFhN5+S4gkpYU7f4U4jahdCh+qy9ke6Y9QTOJMhB8infPXQ7YJPED3trBQ8csEuyO9EuDZP200baoPuNYgpZTRHluWD3eGPcglTshGZsYK8wXKbVJg8Cg5z9j1q+6QAUA9hqNxhicN4ahcuLVuUP3oKY4LFw+isnwGQ0NQiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5bG4KDy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5bG4KDy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EA94C2BCB8;
	Sun, 17 May 2026 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779023663;
	bh=0JDKftZzllRx57QClANlVptlc3OG+Um+N/I9UT2bo3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t5bG4KDyc1x2itpzpDJ6WkX1gFCcaP8zBfWgf3QRHB+IVw8otEf/RDNGTx+i+4CLR
	 tjrWp8zmlRfotinS+ZDt2T+X5AGlBCfugKrdxPBMcxpTDGDn70upGvs/lr7El0Oi6k
	 sighNfWgp9wm5n02KY3SnNee5DISDmMg6YDYC5k7RApMA4VZGIeRRiRzx0GqJb7KAt
	 pEWOFdhzmLPHG8Z7Qh0XJcMLILPQTSIVS+oVdG+k5Pp+dEzdtmVn8p8A7JFRjLQ69W
	 AORZGZ8i9QLienu4zfWvnnKBiaUWaKF8Jk/B85wMf/rTMgdwGBAauXKaBSvyvDjf1Q
	 6O5plvNuy6EMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15AFCD4F21;
	Sun, 17 May 2026 13:14:22 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Sun, 17 May 2026 20:14:20 +0700
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: document the Ayaneo Pocket
 DS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-pocketds-v3-1-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
In-Reply-To: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779023659; l=835;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=NYdtjmtd1UJX19KWh8T30Z3zmyp1DHDS/k4hVHOJ4EM=;
 b=HVWy1Z93IjkHW0ng0OVfPSA+tvmakwuLPZzEwYM9olKU/Q2c2Dld8t+j5acpltu8BEmQGESiR
 HVVP02gcfNcCBQxJPD7NPqfPCQyRXrP0vvlMQP69UEWcf9tqCYo0VyA
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Document the Qualcomm QCS8550 based Ayaneo Pocket DS gaming console.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..f130a6b092b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1107,6 +1107,12 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - ayaneo,pocketds
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - ayaneo,pocket-s2

-- 
2.54.0


