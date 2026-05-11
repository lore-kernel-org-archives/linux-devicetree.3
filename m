Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B4371043;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499234; cv=none; b=oRkMU9LoNAjy6/V6vIQC3LI9G3I21rO6GPYisoUiy+Fg113HxCrGdUgvDScazGxhjz96N29TUbi2uk0Gg+B8vkzClBc86opnCzfPxIKsuOKG4ZYPzf1KzZHoPq3In9WGnJl8HdOVB2tKORzkz9/l1z4AAI39cWUK9wWsqTKeCJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499234; c=relaxed/simple;
	bh=imsi6wYvfRnJexjBjQ6bBB/Wc+PLpjCyXg5RjmUfoF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4R9mf9sjDwbNdGvV5uXWaoLJFH1SzSuqxULAK+/LrSbV4mVtfaxsuuYOvd3H+q6p0sjValyK2aWofet1tbszJwB4P1Cz4cvElxS/mFjigAIJnUs6fEHUOxb5WiAj7Ds2TuQwbfLg3bQSnnN+4uoqQa+12TCnL9ZszghXjAAyKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obgZs4ve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obgZs4ve"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47C83C2BCB0;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499234;
	bh=imsi6wYvfRnJexjBjQ6bBB/Wc+PLpjCyXg5RjmUfoF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=obgZs4veJ/bYY2qCyXUxLeojf4IGhBePyj0vOoKhvHxJFjFowVeukv9aGtq1M2ApY
	 KZBBFlOPW0ifNIk6vfgG4jKIy7efTO3GLqQkH9PrMzNLND2DSr1LjRjKn8ID7CaxDH
	 UUOJyqnus3DFV1/KS0npqdGTPtYAk+rVDxjmTSB4MbSD8zRYSNZNqT6Wn/MaNf3tNv
	 wWngtxsHykoiejfp7I6kA29loAlRB308VnFF+OU3kwa2+7MQPUzND9Cl9sZrjG+BBy
	 9kt6l1GT1f/p44BqoVQ3iAGxuG7VaUqqKn/Vl/cM71A6le9nvpWxyjCtHyWgHwggsP
	 eH3s08ukvFYXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D6ACD37B9;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 11 May 2026 18:33:53 +0700
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: document the Ayaneo Pocket
 DS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-pocketds-v2-1-299dd4247f2f@gmail.com>
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
In-Reply-To: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778499232; l=948;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=vJKMcLbHKxPCtNvUiI9RU+V6jt5nuzR57sFHWslUAcM=;
 b=eyabf+FqWEY4fIcbgyb81COzhMQj42tjevu021QfqqWKwMlk0M5ri9Uft7b7EFohoNUsJIQID
 UcVjWbHCzQCDmma7oi4k4bNXaBIu3e+IoLzTITb6zQoT/pFbtCiVIA0
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


