Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA11A9F83;
	Tue, 28 Jul 2026 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198014; cv=none; b=IDa/hxSM+KJksRxbun3e+cV7nUi1uEU7rRdVWIhjmd838k4AKg4jWD9Xh33EBXpcPr3V10kp+V/ubrWB1R3seFRd0y0tAOjtpmC/AE9LAF2jxCfqxPV0J6b/ZmDZNqmnnpWiuQXOy/CTWQ4V8upuBa+Kwv18uMKaBGtEegsq8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198014; c=relaxed/simple;
	bh=mRcgbVUL7OYYHBf9XI7q0MEFOhNyTnpzkYQ1ZhYq5m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fap9qUmKoYcXTAP3AmVs5jZGe0xkuSUmq3ZezOU7PedZDzYKr851MIb/itUZ276KcxIRckOn1grODuyB39REIkN4sy7tEbFjbqZkxtrWz8eIrv3v1zS2YAH5E9MvTNxZLzrJrCiG2U/wHd3T8gSE7LHzkoNLRjyBC2SMOGWbXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjdM/vJu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjdM/vJu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9B88C2BCF6;
	Tue, 28 Jul 2026 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785198013;
	bh=mRcgbVUL7OYYHBf9XI7q0MEFOhNyTnpzkYQ1ZhYq5m4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LjdM/vJuPk2DtU8FGs73v2NpQxlORsKpIkGH9hEvTY8yDDvgyJtNV08H+DKjFEAsp
	 RxADzHUOswhcX3XUPmrCRHDdTIc+5OAd23NGVLvKQNxsrOZ0KP6ZFzQnTsohqv6cGs
	 0NXa8cdZpZgAbc4ba3sG69Rtm/BA0kTk5v0uY6ewltfgntfRHgu4MpJn9h5bmw3WWv
	 wy/iNalG8vV5DauFN7J4nYtdjCGPSQhrxisI/xkrmnbxXbrQGNkGhD3TX/GkqTiWG5
	 KNuiq5m49SaguGZV0DUqlz+hoIY14tE33VV5iMm7zA6yQlCSUz5UnES6SexPjKPe74
	 AZeCOhberr6fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB257C53209;
	Tue, 28 Jul 2026 00:20:13 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Jul 2026 19:20:10 -0500
Subject: [PATCH v9 2/6] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ayn-qcs8550-v9-2-e3db456e10e5@gmail.com>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785198012; l=993;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=lK4zHGjvyiX2gOTufW5BCF244u3y4b350zpQIvDlmsQ=;
 b=9jpstX8a9VDLR5PvpZYzRfGyP7U5Wly8D/yekY00OlJWMeReTcJYiUKChkT6flzAZ3r144HuW
 0mCuuwPCaPDAOmq1RdagvotByqwJlvn/4sgNOzlnoBAwMlUcXuP+oUX
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
index c7c9a92796846..ccc66b78296be 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1144,6 +1144,15 @@ properties:
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
               - qcom,qcs8550-rb5gen2

-- 
2.54.0


