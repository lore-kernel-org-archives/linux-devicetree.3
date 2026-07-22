Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4B6444718;
	Wed, 22 Jul 2026 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705774; cv=none; b=O66pwT9Ln7CD3I/2wfX+ES2JxKe3FzyIkXOjOaVwDhRFMJEQ4WuTAi+JUj3OBWIb9eMrOXbeawW7jnEJVUxyf7IXoESsYn3w5+yac3JHFuM5Dv+H5nXKwVvi3VZn4NsePycsw7LyNnMTF5MLwLJF+pf7OMtcbMMjQc1OWoxHQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705774; c=relaxed/simple;
	bh=3rCc+lsHFX2bNhHzFlHVmccE0pVnx+cTVMWetQmUK6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVx85Rv1AH11Yg++82v/7ZQ7ycEUTOFnoC7OUkomEaXLNfCSKBkfVmB8HveHvCxb5Fwn8SBPGtyHRGrPYAZXTSBXK98AauFsWF6PJSWJaZDrsqoN1Gi6mVQ81p2JabCSxJeUhAx8fCJ/klnVZIYlyd+Rgikdp9vCaFgjZPWDQIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RD1JS+H5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RD1JS+H5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CFBAC2BCFC;
	Wed, 22 Jul 2026 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784705774;
	bh=3rCc+lsHFX2bNhHzFlHVmccE0pVnx+cTVMWetQmUK6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RD1JS+H5ALuDBN3AhF3CmyflvC0dyBYoxH1nxcG7cx2CDkEff3d1cOFfJNgoCfUBC
	 4DMzv2z2c2+3fJoVD4CnOG+Ig4CABNeXZLSXXRt2SKgOlzrGxJYxswQIcJaUl/3Gw2
	 wLZY+gpqsLQKVn/c9otgQdWa+bPwQQgEQvFqpXSY+DPKkStDUbj5/z2ngzV6x2gv6r
	 WmKw1U2t7Okw74g6PrEyMeNZEYWH/oP6mlaVDwL/HtNbsODoGTbwtA6sBNBk5P/BDK
	 MK7QB2EBiHQkf0brIT3zX9GRV6Iwli62UZBtAoCqevzbDYjjOorKyeZf/h34HmKs/F
	 baU1StOIVDxVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543CEC4452D;
	Wed, 22 Jul 2026 07:36:14 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Wed, 22 Jul 2026 14:36:12 +0700
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: document the Ayaneo Pocket
 DS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-pocketds-v4-1-438704cd51f7@gmail.com>
References: <20260722-pocketds-v4-0-438704cd51f7@gmail.com>
In-Reply-To: <20260722-pocketds-v4-0-438704cd51f7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784705771; l=906;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=oBrsCM7jjcemh5kkcBaIFnGWn5xiruOoVHMMuBw01l8=;
 b=CLaqMWFfaoDv+a2lcFiU6S6fVnvaTHWPdUWc2UzgnWq5U1vAmaVIoNJ9RUiZQA25ReinVPfbO
 wUuM+5+bCwZDHsOSt9NOMrWSrF4w0Es/LvTTeED/oTiH9YAFLfXUxgS
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


