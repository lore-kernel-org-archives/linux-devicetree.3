Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869FF35E1D5;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587100; cv=none; b=fJhBUeOrapohfiIyr5plTwIxS0W3vPFtfR+YH3o2FU/c82oTR8IpUbuTWz3ZF9l/J8dOX6NvofJocHYy6aq+kSkJNNU7uE0Ysxx21eige42KKIMnPXbmjCPHTi1AlbzJRPph+1j8WcraYsOSwhyO3WVIhWhZvlJWIRLSoBqqR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587100; c=relaxed/simple;
	bh=zSB9kzLaSD3Dhsi3iur6JivedA2p4XAgxPV59sfHQB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtTlEjZ41kI+ubW5EC9s3Eg4yisDuVF3O3ANyWEi776lGMPhEl2P8G+5DJK0IKkXs/4nBOwun4tJmEVtxKgUZ65OKjMTwb5hodeZO0e3CBxVYV8RK1bbYIZoPEmcpjkWJvlE2yTq/wXUY1jh1G3munMB/3KSL4vcjkE2I48Ycz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJutqvlm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJutqvlm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33917C2BCF6;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787587100;
	bh=zSB9kzLaSD3Dhsi3iur6JivedA2p4XAgxPV59sfHQB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pJutqvlmTIMtzyxjQqxdA2k43xdW7Mr1LEhHaF0N1wylL6+J8hHYg/UmNsHICIbyV
	 z+t+2KHWVyWEp4lNLTmO0US14715KPkQyBECkAPrXhz6S2yRhBGsgDMMUO6bM2nkCA
	 eQMBaFlNQHNLhvh9pfKFH6AlCPjzsitBoI4nuXGErbmy+mfrw7PUGoYPdxhcCJVQyb
	 qgQ0979VEieplgZ8NpFUZElYBeCooH/WNDzUIjpkLXgveMqQ+OB973A0XkCfBGR/gN
	 HWBAfG7vMVNbYGikvh48qf5QtZvm+wXCHvr+YhafFT7ufpmrh63U+6vEL9RmWcTEN/
	 e2sJ3BdyQzfnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BB8C5DF81;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 24 Aug 2026 22:58:19 +0700
Subject: [PATCH v6 1/4] dt-bindings: arm: qcom: document the Ayaneo Pocket
 DS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-pocketds-v6-1-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
In-Reply-To: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787587098; l=796;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=sQUubaNrrjR4wCxF7awG+2Xgfj1glKIe7/67WDA7+JI=;
 b=0Picst7MDOKab0rmMHXNXAJqA1VtgWh3pmTJ/c7ZOU1qlJViABDhIn7qy/XT1Fl6Lrrn+4j+5
 tCToc+scO5lAxlKqGDSLb9znM2fd3t29KLY2oP48Qa3YbY5zt07h9bP
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
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..6ff28b86bfe6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1154,6 +1154,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-ds
               - qcom,qcs8550-rb5gen2
           - const: qcom,qcs8550
           - const: qcom,sm8550

-- 
2.55.0


