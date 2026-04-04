Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3553A9618;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296273; cv=none; b=UTfldbCNqKp16a6wwGbKirlB+F3ChiR4KIy8jeBGzBkz8Piuo+qNBFXosvxbEjlPhRljGDkPm6HW4o4BRI4BlK8KkF2J1meC6huf9Mnoa3mf/EZ/ABQUatBdvMwBpy3T/oeGnedoe1c7FBHo90V+p/fA/6XBpLO0toGALSpDXl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296273; c=relaxed/simple;
	bh=sPpqH0YvutjO0fz7t+jK+1WmAmWYtzRqbbkvK0SDgzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nXwS/LLX+VYtQYSsCSrI5C+PV5FrSbC6eAQ+k8cjpQieGcsclBSrdAK+4friBmPI4Wj7/crdFekT8Sq+RdQKZmW6cD2faIqWUILqqgjUyVpTR765EZWgQPkZxXAFMf4QCEmXYeo+wu2OJaPdFx/n3EsbHtoNSeYCNicY2MTMzXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gI/Xj9Aw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gI/Xj9Aw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9050C4AF0E;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775296273;
	bh=sPpqH0YvutjO0fz7t+jK+1WmAmWYtzRqbbkvK0SDgzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gI/Xj9AwFU9p13aFB12u7jOznos4citiqpx9dISiHbIjXg0QHUc/T9LOqS5uSuR/l
	 SnF787mL/mbDmEapqVAHht3V2KeE+CGQEksvsVBGI09CXEOfiBCUETwtu/+sNAJscb
	 HrmgHygLLd4+ptOWM1fnmGgRbG2oZzAyjDYuShZQIQpZBB3wAVB14OCM8IlrqJhmyR
	 Q+2OLIrfTwLu+ijT30IoxujVVd9qtTnxqPq2zRU4M1W4AeUbZD0tYlKnWPc/If2OlA
	 Sj1fD9ukbN2cp9TAlXH6cBrNRM9dUEXJczHF67NcaBRe7IoagakRP8NbrZfzJK4n92
	 u9TiO/G9xCQ7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11D5E88D97;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Sat, 04 Apr 2026 10:50:57 +0100
Subject: [PATCH 4/5] dt-bindings: arm: qcom: document QCS8550 RB5Gen2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-rb5gen2-dts-v1-4-895f8fc494fc@axon.com>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
In-Reply-To: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775296270; l=980;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=15NO7S2ceOrSNULajYv+uag1jcs9MYHL1sRr8noMBX4=;
 b=K6NjDmJkvmY+AnawyNi92gkaQT/IaELHxeHmtbHKFODk+XI3XzxGlzo0yqpPp5dt9EWlQuH9Y
 PQbKVtOji9IBPaNI41GUoDImzepk9t5r+gBeQ5NU8AkuVYafvzYt1X4
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com

From: Joe Sandom <jsandom@axon.com>

Document the Qualcomm RB5gen2 from Thundercomm based on the
QCS8550 chipset from Qualcomm.

[1] https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit/

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1335a7bee397c46e8dc62806091531e32b7327d4..f9f8001e3e6b66e3a926255bdb15363f4c7c2b66 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1093,6 +1093,12 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - qcom,qcs8550-rb5gen2
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - ayaneo,pocket-s2

-- 
2.34.1


