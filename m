Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA939936E;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786210676; cv=none; b=rDaDOz1HKqq5GivNxHmwcFlOdWMTZWO5//inA1JNcNdzJhZNI9uO+Xt/0z/DASdPT+lv+aIQsHMuu/9ncrKziLDxxP6E0F78MQrgDalX4QiGIPutLwCCeGxAHXhl9qDP3oDoxqpJ6/SZjv+gIKqYEGX8i1PVTEJSwaQmMmndn1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786210676; c=relaxed/simple;
	bh=Knm4UCwU/Yic4zkaf7A4ViebRIUJaRCfV7V4KRmbC9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U712Qb12+cWHmlQZsq6y+dXPrIFK5Xr4YeXyzRUb+5FJyNuQ3sgatPleWV63WuTWG8M/sm/q4aC5RvfPj5JU38N7zPO+svTuYuhVRUSXjc3Cam0OW40BtIt0mALHfiNrJd/LWp+Lm912P+32W4LsF0/9f+WPQUcivOZo/ghVYGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAkWG5GY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAkWG5GY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B7BAC2BCF7;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786210676;
	bh=Knm4UCwU/Yic4zkaf7A4ViebRIUJaRCfV7V4KRmbC9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KAkWG5GYEBJHCjd1yrT6TltZvmzbhYfQO9BjFSiqTslDf7x+45PD31DPr0mm1W2DS
	 zOqEyBQaGnlZt4zoMmdeRCv/hdB6aH8Z5Vrbz/MmGhofdGiF9jtMVi0DKQ4G7OVNBB
	 Wkz41qz5Jj4ERXtEcWOYzKhDRtepl/8q4aSiQ0NlppMh1q9OLa1Cc0ePF6aHmZM+Yx
	 oB6gnaA0OLNpTPhKGG1QARhZWsqp2ECHo2/OXlQrj6koJiXPu62g8pwCvAffCp2tJh
	 LUzfZYE4teWz4q17DCZFK6q23wMnHhYMpaJ5E/6CeyA6EVYdumCuEiG7NuA8z8hAP5
	 HeHNweY08Sd/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A905C5AD44;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 08 Aug 2026 12:37:56 -0500
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add Retroid Pocket QCS8550
 Devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-rp-qcs8550-v1-2-a5a365ba3dc5@gmail.com>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
In-Reply-To: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786210675; l=835;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=R/24U57AVpzkrKRocX2qxeqPSy6EPsUVcphg05ZobrU=;
 b=AUlaNaKgI7z4KswfNYsMNIZPadpyIZBQjOKfcU/x+2uXSUBwIqIZvSsj7Nevi5hteYgkE5eI5
 +MxeOMKdj4SCUEqCr2ViralcJeTCBjMuZjWhMtd4TaWTLNwWjWAPcAt
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

    Namely:
    * Nova
    * RP6

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 954be28203017..52ef669d6fe9b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1161,6 +1161,13 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - retroidpocket,nova
+              - retroidpocket,rp6
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,qcs8550-rb5gen2

-- 
2.54.0


