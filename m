Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F42358D32;
	Thu, 30 Apr 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564992; cv=none; b=bmWJh7upaLBGtvo5fJRDEziQIMrrKZ2kj4DArMpk7LW6TOv7xUnh3VhOpQgoWPtJyOkhcy/BZ+Tia9Tuz5Zeiz17zDiL8DejRbrto2kZLdCuzNhuGcwMQ3RxS/4ZBl+w4RAPnyWh0kpNisDkIO3n8I/TGgS6Tislb2h+hCjB7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564992; c=relaxed/simple;
	bh=1Y/LPpbwhO7cv9vEDbyRgvJvnMnKJWgfUgBbXdmBVdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAzgMLs9zvfkUiShzY9FX398h75Tj/1+OVCG6GaCR+3M7c5ulN6OkoaBKrydrzu1P5QSeMlXCUomoEb2+9O2SEXjbDOGfzUwU6f8injw7vgwsJ3g1N1L7kk/8UkDjlYVrPAsW54csd5ZMZUv55vYDsWWmCV80u/uwEfqELmV+CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhBVWcYm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhBVWcYm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A639C2BCC7;
	Thu, 30 Apr 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777564992;
	bh=1Y/LPpbwhO7cv9vEDbyRgvJvnMnKJWgfUgBbXdmBVdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MhBVWcYmk8NbNmX1IsOMv256R55iWocvvBIpToC9M4mMGapi7lsIluLrVtGU47GRt
	 1HOYSySifOTIYppFY9nUdG2mOz/ASuRu2an+gv5IRnCR7WCdMU92a6bCp28g3KW1Fr
	 JW/hqIVRt9HRZHKoT8Uo5MPDjR2941PlItOiC2sh7FOdSNpK7RTMJC3dOmhrc9qw+D
	 GfujkCmaRvbigIBmCSJA30ZS27BwpDxBnY7rkG5AlY8XM1kVRMu2RAWWN9UEetFDFx
	 qozCog7Lx5Lf5UXDU4LxbthxlD8RzbRKY7OzkRKQvp3TKaaPzsfmZqF6+7X+oYN2bY
	 9fDUXn1zbopyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACE9CD13DE;
	Thu, 30 Apr 2026 16:03:12 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 30 Apr 2026 11:03:05 -0500
Subject: [PATCH v6 2/6] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-ayn-qcs8550-v6-2-06a7e7b54aaa@gmail.com>
References: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
In-Reply-To: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777564991; l=991;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=2rGqOlPqgBo2SVV0is/nScu9jSlRs3IsGD1uogdg7P8=;
 b=8aovaH2ZsNZr2RyiSSpruPaM2TyQL3dQf2tEIBUY0WBzd3/8SW0QBhyK0j+YFJoK63OleXW9/
 8k73G0EAA/QDZSg9VK6Ffr83FA+8HbASm4M2RL4Ad/G5gcbieVKgCPe
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Namely:
* Odin 2
* Odin 2 Mini
* Odin 2 Portal
* Thor

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e425..4a6733eaa8b14d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1099,6 +1099,15 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - ayntec,odin2
+              - ayntec,odin2mini
+              - ayntec,odin2portal
+              - ayntec,thor
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - ayaneo,pocket-s2

-- 
2.53.0


