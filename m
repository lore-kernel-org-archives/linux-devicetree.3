Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C75A47DD4D;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813041; cv=none; b=qElCaiLjUAWTwEdRvG8VVd4ZOH867u85brTdjwN96uMwnjhatQjFyd3dvDX1Rzq/lFVm+1aIiWkw0nl5fvDaDl9ojpi+z7oHjDLIXtPBKY7SS/kK2l1ZkkOraj1wC3Gje28bbm5FgpBgIW7JmPvxNLlWCOHPi8cgfguPNKBzjbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813041; c=relaxed/simple;
	bh=3rCc+lsHFX2bNhHzFlHVmccE0pVnx+cTVMWetQmUK6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nneJSj6iVgVXiHV/804rKJ1cwu7a+rvluH82638PvkfDQB2gjGBgJ7BSm7VQ+8eEC6zW9qMalnz40Hl+baOib1vsM/oK4n5kF+xRHZ3QBiijxhqGNWR/TyLAlMJwKEMYigpQx+GCMLxncZPIgfUboWW1tBzmhVH2ySjSKJzLuKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyC8y6PU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyC8y6PU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0EF2C2BCC7;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784813040;
	bh=3rCc+lsHFX2bNhHzFlHVmccE0pVnx+cTVMWetQmUK6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lyC8y6PUtcabPlvB4rHJgaKrAMOaKhJhZzHY/BPI9z9r9IKjhHRDqt9sElvF4RieE
	 mChP3a2Hv26MiGCJQJnoscfx19pBQWrA4b7SSFpoVrb4W8t3kHFGfER9LeWRvxFS5W
	 6t3fS3vC1Nf5V69cHNS2jdg9hLaBO0kaHkT6K0/d8TYuyGV9QNjOSDu0eP0kPN5Uuu
	 NIkVoLB7t8lDgfI6R59StUe0XLvT7Hlu5pzOzKGZUHO1g9IRxzZbJYA9+/BsSxCKS9
	 5QFOx5U2CuxAgk/16CbU+qzn7M/YvDpWFFt5Vz9YopfB15tLNh46wUGNxlDzIx2Oo7
	 0ZjdziNuXtrAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CE8C531CB;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Thu, 23 Jul 2026 20:23:59 +0700
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: document the Ayaneo Pocket
 DS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pocketds-v5-1-74508388c716@gmail.com>
References: <20260723-pocketds-v5-0-74508388c716@gmail.com>
In-Reply-To: <20260723-pocketds-v5-0-74508388c716@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784813038; l=906;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=oBrsCM7jjcemh5kkcBaIFnGWn5xiruOoVHMMuBw01l8=;
 b=4pfB4cCyIBA36TYYi1iLeL51Kn2MxxgcIs9mcOrlLiIpJLSsjOx/ncv6psRSxhE8Sx5SOmOyj
 AJVpL+3LzZgDZca24kyR32bPVzZ6nZXuTY5MtTAGhjOftcifQxsgRLq
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Document the Qualcomm QCS8550 based Ayaneo Pocket DS gaming console.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..b5dad29a8606 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1107,6 +1107,12 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - ayaneo,pocket-ds
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - ayaneo,pocket-s2

-- 
2.55.0


