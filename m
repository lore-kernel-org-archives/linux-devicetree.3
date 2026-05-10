Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7373ACA62;
	Sun, 10 May 2026 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429161; cv=none; b=IDRNdqPlCBop9rbHgJMi8GFlhHozcUGgIiJZKj886viMOSxRj94kGgqzKREK2Qrgaulqwfz74bru1klwMkfnJRHcSYYmSQl6l7z8B9KP673DreRXYMMIW7WJ4NcmWfSOZ5YKbUIvWw8gX7Pd9h7PH1XVxpAweUA5VQ2SVr//M4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429161; c=relaxed/simple;
	bh=imsi6wYvfRnJexjBjQ6bBB/Wc+PLpjCyXg5RjmUfoF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T79h8YgkZsGyhYohGlDei1s0m+S7N6wHR7cJX4nuYkyctHPOC3rt7c8h/1OjD1kVSLCZaxfvw0RyyWpx+iHjF/9IYwRIsSBWLo4kGlk6qABRBP22csXjy/wwj9hIeMQ7RPS44orGSX6wSrlgLn0A5uguy2TgsbqyxqGuVO4PRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yg4+y802; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yg4+y802"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED946C2BCB8;
	Sun, 10 May 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778429161;
	bh=imsi6wYvfRnJexjBjQ6bBB/Wc+PLpjCyXg5RjmUfoF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Yg4+y802g3J+7BeI7Bs+lN3GOHaAVY0sXQkXifdjZ/parhm9VboSA13YoahqzqPgb
	 SEZZJ9NqjIuDncFvTdJWwBdXTHKqQKH7YGp+F/WcOXdygns6Jy/Jm7hJ9mGegzKmV9
	 uECZxBBmQaP4JLuE90kvWX49d2RMQxsHLsKbQEKpkXpw0OP9F9xYiFyex8WGu8dd7A
	 Bjgkg9eHLBd4Vld1MptpagUz/fKS0ttJROR2lPaTKAC9CxKyD5OFQdOqg6udp3wuzK
	 I7VODKy+Ldcj0Y+F2IizG7MaqfjWx0TTZ6fR7hfyhloa00dTrsx9sZ3MN210gjYKhk
	 GsYFGg30IPM3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6716CD37B9;
	Sun, 10 May 2026 16:06:00 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Sun, 10 May 2026 23:05:56 +0700
Subject: [PATCH 1/2] dt-bindings: arm: qcom: document the Ayaneo Pocket DS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-pocketds-v1-1-cf05acec06af@gmail.com>
References: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
In-Reply-To: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778429157; l=948;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=vJKMcLbHKxPCtNvUiI9RU+V6jt5nuzR57sFHWslUAcM=;
 b=RC9TXt9OXg1qh+cv96ZFu3FDWL1JZlYjmo1/77Y9RUT+iUe6gVuycIhnLA3cBaHfLfn3seo84
 mAtXjIrxpynBMHI3oVI4d/Q339qMBUMoOt1+lt3pVeQ5HbrLZg2026I
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

From: Teguh Sobirin <teguh@sobir.in>

Document the Qualcomm QCS8550 based Ayaneo Pocket DS gaming console.

Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
Signed-off-by: Teguh Sobirin <teguh@sobir.in>
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


